Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG3H3St5zDqhC
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:27 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANawn140346
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:25 -0400
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23utca6xut-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:24 -0400
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 15:58:20 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 15:58:17 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay07.in.ibm.com (d28relay07.in.ibm.com [9.184.220.158])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 9DF66E005F
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 16:02:07 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay07.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UASGVX39059504
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:16 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASDN7030801
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:15 +0530
Received: from gwshan ([9.192.205.20])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UASAdA030583; Thu, 30 Jun 2016 15:58:10 +0530
Received: by gwshan (Postfix, from userid 1000)
 id 07AC7943482; Thu, 30 Jun 2016 20:28:03 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 06/10] net/farady: Helper functions to create or destroy MDIO
 interface
Date: Thu, 30 Jun 2016 20:27:47 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0048-0000-0000-000002ACB8B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0049-0000-0000-00000D74A4D0
Message-Id: <1467282471-16560-7-git-send-email-gwshan@linux.vnet.ibm.com>
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

This introduces two helper functions to create or destroy MDIO
interface. No logical changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 93 ++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index e7cf313..2c22f74 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1146,6 +1146,58 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
 	.ndo_do_ioctl		= ftgmac100_do_ioctl,
 };
 
+static int ftgmac100_setup_mdio(struct net_device *netdev)
+{
+	struct ftgmac100 *priv = netdev_priv(netdev);
+	int i, err = 0;
+
+	/* initialize mdio bus */
+	priv->mii_bus = mdiobus_alloc();
+	if (!priv->mii_bus)
+		return -EIO;
+
+	priv->mii_bus->name = "ftgmac100_mdio";
+	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "ftgmac100_mii");
+	priv->mii_bus->priv = priv->netdev;
+	priv->mii_bus->read = ftgmac100_mdiobus_read;
+	priv->mii_bus->write = ftgmac100_mdiobus_write;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++)
+		priv->mii_bus->irq[i] = PHY_POLL;
+
+	err = mdiobus_register(priv->mii_bus);
+	if (err) {
+		dev_err(priv->dev, "Cannot register MDIO bus!\n");
+		goto err_register_mdiobus;
+	}
+
+	err = ftgmac100_mii_probe(priv);
+	if (err) {
+		dev_err(priv->dev, "MII Probe failed!\n");
+		goto err_mii_probe;
+	}
+
+	return 0;
+
+err_mii_probe:
+	mdiobus_unregister(priv->mii_bus);
+err_register_mdiobus:
+	mdiobus_free(priv->mii_bus);
+	return err;
+}
+
+static void ftgmac100_destroy_mdio(struct net_device *netdev)
+{
+	struct ftgmac100 *priv = netdev_priv(netdev);
+
+	if (!netdev->phydev)
+		return;
+
+	phy_disconnect(netdev->phydev);
+	mdiobus_unregister(priv->mii_bus);
+	mdiobus_free(priv->mii_bus);
+}
+
 /******************************************************************************
  * struct platform_driver functions
  *****************************************************************************/
@@ -1211,31 +1263,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	priv->irq = irq;
 
-	/* initialize mdio bus */
-	priv->mii_bus = mdiobus_alloc();
-	if (!priv->mii_bus) {
-		err = -EIO;
-		goto err_alloc_mdiobus;
-	}
-
-	priv->mii_bus->name = "ftgmac100_mdio";
-	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "ftgmac100_mii");
-
-	priv->mii_bus->priv = netdev;
-	priv->mii_bus->read = ftgmac100_mdiobus_read;
-	priv->mii_bus->write = ftgmac100_mdiobus_write;
-
-	err = mdiobus_register(priv->mii_bus);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
-		goto err_register_mdiobus;
-	}
-
-	err = ftgmac100_mii_probe(priv);
-	if (err) {
-		dev_err(&pdev->dev, "MII Probe failed!\n");
-		goto err_mii_probe;
-	}
+	err = ftgmac100_setup_mdio(netdev);
+	if (err)
+		goto err_setup_mdio;
 
 	/* register network device */
 	err = register_netdev(netdev);
@@ -1255,12 +1285,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	return 0;
 
 err_register_netdev:
-	phy_disconnect(netdev->phydev);
-err_mii_probe:
-	mdiobus_unregister(priv->mii_bus);
-err_register_mdiobus:
-	mdiobus_free(priv->mii_bus);
-err_alloc_mdiobus:
+	ftgmac100_destroy_mdio(netdev);
+err_setup_mdio:
 	iounmap(priv->base);
 err_ioremap:
 	release_resource(priv->res);
@@ -1280,10 +1306,7 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
 	priv = netdev_priv(netdev);
 
 	unregister_netdev(netdev);
-
-	phy_disconnect(netdev->phydev);
-	mdiobus_unregister(priv->mii_bus);
-	mdiobus_free(priv->mii_bus);
+	ftgmac100_destroy_mdio(netdev);
 
 	iounmap(priv->base);
 	release_resource(priv->res);
-- 
2.1.0
