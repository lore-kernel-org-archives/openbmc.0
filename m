Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1DDFF1A0CEC
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:20:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145030803635057.696584605898806;
 Wed, 16 Dec 2015 15:20:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH u-boot 1/2] drivers/net/aspeednic: Fix RX buffer size
Date: Wed, 16 Dec 2015 17:20:33 -0600
Message-Id: <1450308034-19042-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2015 23:20:44 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

The hardware defaults to 1600 bytes of RX buffer size, currently we
allocate a little less and there is a chance that the hardware might DMA
more than we've allocated.

In the process of writing this patch, it was discovered that the driver
was incorrectly informing the hardware of its RX buffer size, addressed
that problem too.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 drivers/net/aspeednic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index d75ef67..e7b0b95 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -227,7 +227,7 @@ static u8 g_phy_addr = 0;
 
 #define NUM_RX_DESC PKTBUFSRX
 #define NUM_TX_DESC 1     /* Number of TX descriptors   */
-#define RX_BUFF_SZ  PKTSIZE_ALIGN
+#define RX_BUFF_SZ  1600 /* Hardware defaults to this */
 #define TX_BUFF_SZ  1514
 
 #define TOUT_LOOP   1000000
@@ -1161,7 +1161,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
   set_mac_control_register (dev);
 
   for (i = 0; i < NUM_RX_DESC; i++) {
-    rx_ring[i].status = cpu_to_le32(RXPKT_RDY + RX_BUFF_SZ);
+    rx_ring[i].status = cpu_to_le32(RXPKT_RDY);
     rx_ring[i].buf = (u32)(&rx_buffer[i]);
     rx_ring[i].reserved = 0;
   }
@@ -1181,6 +1181,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 
   OUTL(dev, ((u32) &tx_ring), TXR_BADR_REG);
   OUTL(dev, ((u32) &rx_ring), RXR_BADR_REG);
+  OUTL(dev, RX_BUFF_SZ, RBSR_REG);
 
   START_MAC(dev);
 
-- 
2.6.3
