Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 223461A0F2C
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:31 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 15:39:29 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 15:39:26 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 304692BB003F
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:26 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB85dJuX18219216
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:39:27 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB85crEp004559
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:53 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB85crCL003522
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:53 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BBE8EA0147
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:38:28 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] drivers/net/aspeednic: Fix RX buffer size
Date: Tue,  8 Dec 2015 16:38:04 +1100
Message-Id: <1449553085-14727-2-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449553085-14727-1-git-send-email-cyril.bur@au1.ibm.com>
References: <1449553085-14727-1-git-send-email-cyril.bur@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120805-1618-0000-0000-00000341018B
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
X-List-Received-Date: Tue, 08 Dec 2015 05:39:31 -0000

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
