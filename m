Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG3G5SVWzDqn0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANkbu104582
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:24 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23utca6nrx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:23 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:21 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:28:18 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 2F7553578056
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:18 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UASIAV22937660
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:18 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASHb5016786
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:18 +1000
Received: from gwshan ([9.192.205.20])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UASGSl016777; Thu, 30 Jun 2016 20:28:16 +1000
Received: by gwshan (Postfix, from userid 1000)
 id A0C18943494; Thu, 30 Jun 2016 20:28:05 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 08/10] net/farady: Support NCSI mode
Date: Thu, 30 Jun 2016 20:27:49 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0016-0000-0000-000001ACEAC4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0017-0000-0000-000004ED6740
Message-Id: <1467282471-16560-9-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300099
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:27 -0000

This makes ftgmac100 driver support NCSI mode. The NCSI is enabled
on the interface if property "use-nc-si" or "use-ncsi" is found from
the device node in device tree.

   * No PHY device is used when NCSI mode is enabled.
   * The NCSI device (struct ncsi_dev) is created when probing the
     device while it's enabled/started when the interface is brought
     up.
   * Hardware IP checksum dosn't work when NCSI mode is enabled. It
     is disabled on enabled NCSI.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 78 ++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 120993e..f2205ae 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -31,6 +31,7 @@
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <net/ip.h>
+#include <net/ncsi.h>
 
 #include "ftgmac100.h"
 
@@ -68,10 +69,13 @@ struct ftgmac100 {
 
 	struct net_device *netdev;
 	struct device *dev;
+	struct ncsi_dev *ndev;
 	struct napi_struct napi;
 
 	struct mii_bus *mii_bus;
 	int old_speed;
+	bool use_ncsi;
+	bool enabled;
 };
 
 static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
@@ -1001,7 +1005,10 @@ static irqreturn_t ftgmac100_interrupt(int irq, void *dev_id)
 	struct net_device *netdev = dev_id;
 	struct ftgmac100 *priv = netdev_priv(netdev);
 
-	if (likely(netif_running(netdev))) {
+	/* When running in NCSI mode, the interface should be ready for
+	 * receiving or transmitting NCSI packets before it's opened.
+	 */
+	if (likely(priv->use_ncsi || netif_running(netdev))) {
 		/* Disable interrupts for polling */
 		iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
 		napi_schedule(&priv->napi);
@@ -1114,17 +1121,33 @@ static int ftgmac100_open(struct net_device *netdev)
 		goto err_hw;
 
 	ftgmac100_init_hw(priv);
-	ftgmac100_start_hw(priv, 10);
-
-	phy_start(netdev->phydev);
+	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
+	if (netdev->phydev)
+		phy_start(netdev->phydev);
+	else if (priv->use_ncsi)
+		netif_carrier_on(netdev);
 
 	napi_enable(&priv->napi);
 	netif_start_queue(netdev);
 
 	/* enable all interrupts */
 	iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
+
+	/* Start the NCSI device */
+	if (priv->use_ncsi) {
+		err = ncsi_start_dev(priv->ndev);
+		if (err)
+			goto err_ncsi;
+	}
+
+	priv->enabled = true;
+
 	return 0;
 
+err_ncsi:
+	napi_disable(&priv->napi);
+	netif_stop_queue(netdev);
+	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
 err_hw:
 	free_irq(priv->irq, netdev);
 err_irq:
@@ -1137,12 +1160,17 @@ static int ftgmac100_stop(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
 
+	if (!priv->enabled)
+		return 0;
+
 	/* disable all interrupts */
+	priv->enabled = false;
 	iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
 
 	netif_stop_queue(netdev);
 	napi_disable(&priv->napi);
-	phy_stop(netdev->phydev);
+	if (netdev->phydev)
+		phy_stop(netdev->phydev);
 
 	ftgmac100_stop_hw(priv);
 	free_irq(priv->irq, netdev);
@@ -1183,6 +1211,9 @@ static int ftgmac100_hard_start_xmit(struct sk_buff *skb,
 /* optional */
 static int ftgmac100_do_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 {
+	if (!netdev->phydev)
+		return -ENXIO;
+
 	return phy_mii_ioctl(netdev->phydev, ifr, cmd);
 }
 
@@ -1247,6 +1278,15 @@ static void ftgmac100_destroy_mdio(struct net_device *netdev)
 	mdiobus_free(priv->mii_bus);
 }
 
+static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->nd_state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->nd_dev, "NCSI interface %s\n",
+		    nd->nd_link_up ? "up" : "down");
+}
+
 /******************************************************************************
  * struct platform_driver functions
  *****************************************************************************/
@@ -1256,7 +1296,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	int irq;
 	struct net_device *netdev;
 	struct ftgmac100 *priv;
-	int err;
+	int err = 0;
 
 	if (!pdev)
 		return -ENODEV;
@@ -1280,7 +1320,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	netdev->ethtool_ops = &ftgmac100_ethtool_ops;
 	netdev->netdev_ops = &ftgmac100_netdev_ops;
+
+	/* We have to disable on-chip IP checksum functionality
+	 * when NCSI is enabled on the interface. It doesn't work
+	 * in that case.
+	 */
 	netdev->features = NETIF_F_IP_CSUM | NETIF_F_GRO;
+	if (pdev->dev.of_node &&
+	    of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
+		netdev->features &= ~NETIF_F_IP_CSUM;
 
 	platform_set_drvdata(pdev, netdev);
 
@@ -1315,9 +1363,20 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	/* MAC address from chip or random one */
 	ftgmac100_setup_mac(priv);
 
-	err = ftgmac100_setup_mdio(netdev);
-	if (err)
-		goto err_setup_mdio;
+	if (pdev->dev.of_node &&
+	    (of_get_property(pdev->dev.of_node, "use-nc-si", NULL) ||
+	    of_get_property(pdev->dev.of_node, "use-ncsi", NULL))) {
+		dev_info(&pdev->dev, "Using NCSI interface\n");
+		priv->use_ncsi = true;
+		priv->ndev = ncsi_register_dev(netdev, ftgmac100_ncsi_handler);
+		if (!priv->ndev)
+			goto err_ncsi_dev;
+	} else {
+		priv->use_ncsi = false;
+		err = ftgmac100_setup_mdio(netdev);
+		if (err)
+			goto err_setup_mdio;
+	}
 
 	/* register network device */
 	err = register_netdev(netdev);
@@ -1330,6 +1389,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_ncsi_dev:
 err_register_netdev:
 	ftgmac100_destroy_mdio(netdev);
 err_setup_mdio:
-- 
2.1.0
