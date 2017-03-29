Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtDJz0GKWzDq93
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 14:49:06 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2T3mq7T003095;
 Tue, 28 Mar 2017 22:48:53 -0500
Message-ID: <1490759331.3177.161.camel@kernel.crashing.org>
Subject: [PATCH] net/ftgmac100: Expose pause frames support and add comment
 about RGMII
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Wed, 29 Mar 2017 14:48:51 +1100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 03:49:07 -0000

Expose to the phydev that we support Pause frame and add a comment
mentioning how we handle RGMII clock delays via u-boot.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

This is the diff between v3 that was merged and v4 that I posted
shortly afterward.

 drivers/net/ethernet/faraday/ftgmac100.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index d42489c..5fe2827 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -111,8 +111,8 @@ struct ftgmac100 {
 	bool rx_pause;
 	bool aneg_pause;
 
-	uint32_t rxdes0_edorr_mask;
-	uint32_t txdes0_edotr_mask;
+	u32 rxdes0_edorr_mask;
+	u32 txdes0_edotr_mask;
 };
 
 static int ftgmac100_alloc_rx_buf(struct ftgmac100 *priv,
@@ -1390,6 +1390,12 @@ static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
 		return PTR_ERR(phydev);
 	}
 
+	/*
+	 * Indicate that we support PAUSE frames (see comment in
+	 * Documentation/networking/phy.txt as of v4.10
+	 */
+	phydev->supported |= SUPPORTED_Pause | SUPPORTED_Asym_Pause;
+
 	phydev->advertising = phydev->supported;
 	phy_attached_info(phydev);
 
@@ -1490,6 +1496,21 @@ static int ftgmac100_setup_mdio(struct net_device *ndev)
 		iowrite32(reg, priv->base + FTGMAC100_OFFSET_REVR);
 	}
 
+	/*
+	 * Note: When using RGMII mode, we simply pass "RGMII" to the
+	 *       PHY and assume that u-boot will have configured the
+	 *       clock delays appropriately for the system.
+	 *
+	 *       The implementation of the MAC in the Aspeed chips
+	 *       supports sub-ns programable delays that need to be
+	 *       configured in the SCU while the MAC IP block is in
+	 *       reset.
+	 *
+	 *       If needed in the future, we can support configuring this
+	 *       here based on device-tree properties but unless absolutely
+	 *       needed I'd rather avoid poking at the SCU registers from
+	 *       this driver.
+	 */
 	if (np)
 		intf_prop = of_get_property(np, "phy-interface", NULL);
 	if (intf_prop) {
-- 
2.9.
