Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhK6YpJzDqnQ
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:25 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id ECE28FF97EE
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:22 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id A25B5440097;
 Wed, 29 Jun 2016 18:10:18 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 1/9] net: aspeednic: Create
 aspeed_write_hwaddr from set_mac_address
Date: Wed, 29 Jun 2016 18:09:43 +0200
Message-Id: <1467216591-8616-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17504928805304109826
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 16:10:26 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Tell the ethernet framework how to set the MAC address on the
aspeed nic so it can be set at the expected points in the code.

Rename set_mac_address to aspeed_write_hwaddr.  Drop the unused
argument, change the prototype to int, and return 0.

Assign the device write_hwaddr method to this new function.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/aspeednic.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index cea3394728cc..7ce7056d88a2 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -399,7 +399,7 @@ static int   aspeednic_init(struct eth_device* dev, bd_t* bis);
 static int   aspeednic_send(struct eth_device* dev, void *packet, int length);
 static int   aspeednic_recv(struct eth_device* dev);
 static void  aspeednic_halt(struct eth_device* dev);
-static void  set_mac_address (struct eth_device* dev, bd_t* bis);
+static int   aspeednic_write_hwaddr(struct eth_device* dev);
 static void  phy_write_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address, u16 PHY_Data);
 static u16   phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address);
 #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
@@ -547,6 +547,7 @@ int aspeednic_initialize(bd_t *bis)
 	dev->halt = aspeednic_halt;
 	dev->send = aspeednic_send;
 	dev->recv = aspeednic_recv;
+	dev->write_hwaddr = aspeednic_write_hwaddr;
 
 	/* Ensure we're not sleeping. */
 	if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
@@ -1140,7 +1141,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 
 	aspeednic_probe_phy(dev);
 
-	set_mac_address(dev, bis);
+	aspeednic_write_hwaddr(dev);
 	set_mac_control_register(dev);
 
 	for (i = 0; i < NUM_RX_DESC; i++) {
@@ -1350,7 +1351,7 @@ static void aspeednic_halt(struct eth_device* dev)
 	STOP_MAC(dev);
 }
 
-static void set_mac_address (struct eth_device* dev, bd_t* bis)
+static int aspeednic_write_hwaddr(struct eth_device* dev)
 {
 	if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
 		net_random_ethaddr(dev->enetaddr);
@@ -1362,6 +1363,8 @@ static void set_mac_address (struct eth_device* dev, bd_t* bis)
 	if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
 		memcpy(NCSI_Request.SA, dev->enetaddr, 6);
 	}
+
+	return 0;
 }
 
 static u16 phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address)
-- 
2.1.4
