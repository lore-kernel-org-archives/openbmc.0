Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPqq64JmHzDq6V
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 10:01:06 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458082863407572.2875486685285;
 Tue, 15 Mar 2016 16:01:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 1/5] net: aspeednic: Create aspeed_write_hwaddr from
 set_mac_address
Date: Tue, 15 Mar 2016 18:00:57 -0500
Message-Id: <1458082861-23542-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 23:01:07 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Tell the ethernet framework how to set the MAC address on the
aspeed nic so it can be set at the expected points in the code.

Rename set_mac_address to aspeed_write_hwaddr.  Drop the unused
argument, change the prototype to int, and return 0.

Assign the device write_hwaddr method to this new function.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/net/aspeednic.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index d70c7ab..b8ce24c 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -411,7 +411,7 @@ static int   aspeednic_init(struct eth_device* dev, bd_t* bis);
 static int   aspeednic_send(struct eth_device* dev, volatile void *packet, int length);
 static int   aspeednic_recv(struct eth_device* dev);
 static void  aspeednic_halt(struct eth_device* dev);
-static void  set_mac_address (struct eth_device* dev, bd_t* bis);
+static int   aspeednic_write_hwaddr(struct eth_device* dev);
 static void  phy_write_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address, u16 PHY_Data);
 static u16   phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address);
 #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
@@ -564,6 +564,7 @@ int aspeednic_initialize(bd_t *bis)
   dev->halt   = aspeednic_halt;
   dev->send   = aspeednic_send;
   dev->recv   = aspeednic_recv;
+  dev->write_hwaddr = aspeednic_write_hwaddr;
 
   /* Ensure we're not sleeping. */
   if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
@@ -1157,7 +1158,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 
   aspeednic_probe_phy(dev);
 
-  set_mac_address (dev, bis);
+  aspeednic_write_hwaddr(dev);
   set_mac_control_register (dev);
 
   for (i = 0; i < NUM_RX_DESC; i++) {
@@ -1362,7 +1363,7 @@ static void aspeednic_halt(struct eth_device* dev)
   STOP_MAC(dev);
 }
 
-static void set_mac_address (struct eth_device* dev, bd_t* bis)
+static int aspeednic_write_hwaddr(struct eth_device* dev)
 {
   if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
     eth_random_enetaddr(dev->enetaddr);
@@ -1374,6 +1375,8 @@ static void set_mac_address (struct eth_device* dev, bd_t* bis)
   if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
     memcpy(NCSI_Request.SA, dev->enetaddr, 6);
   }
+
+  return 0;
 }
 
 static u16 phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address)
-- 
2.7.1
