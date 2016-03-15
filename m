Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPqqB6Rh3zDqPm
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 10:01:10 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145808286529724.566110991570667;
 Tue, 15 Mar 2016 16:01:05 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 3/5] net: aspeednic: Remove extra spaces before
 assignments
Date: Tue, 15 Mar 2016 18:00:59 -0500
Message-Id: <1458082861-23542-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 15 Mar 2016 23:01:11 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The device method assignments had extra spaces before the =
signs but all prior methods were 4 characters and so they
were aligned.  Since write_hwaddr is significantly longer,
the resulting spacing is not pleasing.  Since only a few other
sites had simiar whitespace replace all multi-space sequences
before an assignemnt with one space.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/net/aspeednic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 90c0f0d..841df8b 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -560,10 +560,10 @@ int aspeednic_initialize(bd_t *bis)
   *(volatile u_long *)(SCU_BASE + SCU_SCRATCH_REGISTER) = cpu_to_le32((SCURegister & ~(0x3000)) | (CONFIG_MAC2_PHY_SETTING << 12));
 
 
-  dev->init   = aspeednic_init;
-  dev->halt   = aspeednic_halt;
-  dev->send   = aspeednic_send;
-  dev->recv   = aspeednic_recv;
+  dev->init = aspeednic_init;
+  dev->halt = aspeednic_halt;
+  dev->send = aspeednic_send;
+  dev->recv = aspeednic_recv;
   dev->write_hwaddr = aspeednic_write_hwaddr;
 
   /* Ensure we're not sleeping. */
@@ -1267,9 +1267,9 @@ static int aspeednic_send(struct eth_device* dev, volatile void *packet, int len
 //            memset ((void *)cpu_to_le32((u32) (packet + length)), 0, 60 - length);
     length = 60;
   }
-  tx_ring[tx_new].buf    = cpu_to_le32(((u32) packet));
-  tx_ring[tx_new].status   &= (~(0x3FFF));
-  tx_ring[tx_new].status   |= cpu_to_le32(LTS | FTS | length);
+  tx_ring[tx_new].buf = cpu_to_le32(((u32) packet));
+  tx_ring[tx_new].status &= (~(0x3FFF));
+  tx_ring[tx_new].status |= cpu_to_le32(LTS | FTS | length);
   tx_ring[tx_new].status |= cpu_to_le32(TXDMA_OWN);
 
   OUTL(dev, POLL_DEMAND, TXPD_REG);
@@ -1297,7 +1297,7 @@ static int aspeednic_send(struct eth_device* dev, volatile void *packet, int len
 static int aspeednic_recv(struct eth_device* dev)
 {
   s32   status;
-  int   length    = 0;
+  int   length = 0;
 
   for ( ; ; )
   {
-- 
2.7.1
