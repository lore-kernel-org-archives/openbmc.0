Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDJhf165xzDqNQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 12:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=gDQJTSXV; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id y7so455263pfb.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 19:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=wYASI7m5FreLihJdiwipbXc+iBsyC4YOnzCuVtiKQo0=;
 b=gDQJTSXV9PPByKpkNouSGOfyL44XDEACLpq+kw52EZZvzH0YR3HeXZh/pZNXSqxPQL
 ouEgn/1FZNh4sP0j7Fo4wN67CXIgYL0hmHSdRb/D1U+dzNhWTQ6SFZDdirO38ekv1d5o
 naaszni3u0JqhV8t3rFPxWoh7jbORQm1vvcGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wYASI7m5FreLihJdiwipbXc+iBsyC4YOnzCuVtiKQo0=;
 b=kMFkVWLXWLSur9vQqVBfbaXFeeEEA+BugikQ+bDCYt8r1blEiqsCXtAcSGeeUllVZE
 6p//UHaj0aIoAdpRJHSYL8mmvJI17TUofbcgNDUQhcPwqilYJJhpjM6RBLxwz61dZmgw
 bi8MDMN6ww4XqJNiRKvwEytrwlOKXHY7ZcXkHZxNJVRZrzUVBFBtodJN7RMdo1K6UQaX
 E9y0rvjO5dZXH0acdcaa/D+Dvww3ejN7TenE7dq11og7Jux/PILkqXI2PDLpWAs0POgf
 6A0K4Z1coE5YeiUorTIAvH7f4DHCgyS/YfX4WarBl7c3xhCyy7p50c/uC4J5KRVUOe8n
 Nv+A==
X-Gm-Message-State: ALyK8tJNg41KOsmoWiTzWd1r5jsWsSSVthNh7yI/0CaF2sBdMEDs8rZRyfEoGg0Q460hsA==
X-Received: by 10.98.72.27 with SMTP id v27mr2836568pfa.143.1464055662981;
 Mon, 23 May 2016 19:07:42 -0700 (PDT)
Received: from icarus.jms.id.au (45-124-201-5.dynamic.cust.unitiwireless.com.
 [45.124.201.5])
 by smtp.gmail.com with ESMTPSA id tn7sm445107pac.29.2016.05.23.19.07.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 May 2016 19:07:42 -0700 (PDT)
Received: by icarus.jms.id.au (Postfix, from userid 1000)
 id A384E100587; Tue, 24 May 2016 11:37:35 +0930 (ACST)
From: Joel Stanley <joel@jms.id.au>
To: gwshan@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux] net/ethernet/faraday: Forward port ftgmac100 NC-SI
Date: Tue, 24 May 2016 11:37:33 +0930
Message-Id: <1464055653-15867-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Tue, 24 May 2016 02:07:46 -0000

This reflects changes made in order to build with 4.7.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Gavin,

Can you please double check that this looks ok to you?

Do you have a series that contains all of the NC-SI support that is ready to go upstream? If so, I would prefer to take that in the dev tree.

Cheers,

Joel


 drivers/net/ethernet/faraday/ftgmac100.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 644ef77215d5..d2b2c21da809 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1099,6 +1099,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 static int ftgmac100_open(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
 	int err;
 
 	err = ftgmac100_alloc_buffers(priv);
@@ -1125,8 +1126,8 @@ static int ftgmac100_open(struct net_device *netdev)
 	ftgmac100_init_hw(priv);
 	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
 
-	if (priv->phydev)
-		phy_start(priv->phydev);
+	if (phydev)
+		phy_start(phydev);
 	else if (priv->use_ncsi)
 		netif_carrier_on(priv->netdev);
 
@@ -1160,6 +1161,7 @@ err_alloc:
 static int ftgmac100_stop_dev(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
 
 	if (!priv->enabled)
 		return 0;
@@ -1170,8 +1172,8 @@ static int ftgmac100_stop_dev(struct net_device *netdev)
 
 	netif_stop_queue(netdev);
 	napi_disable(&priv->napi);
-	if (priv->phydev)
-		phy_stop(priv->phydev);
+	if (phydev)
+		phy_stop(phydev);
 
 	ftgmac100_stop_hw(priv);
 	free_irq(priv->irq, netdev);
@@ -1216,11 +1218,11 @@ static int ftgmac100_hard_start_xmit(struct sk_buff *skb,
 /* optional */
 static int ftgmac100_do_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 {
-	struct ftgmac100 *priv = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
 
-	if (!priv->phydev)
+	if (!phydev)
 		return -EINVAL;
-	return phy_mii_ioctl(priv->phydev, ifr, cmd);
+	return phy_mii_ioctl(phydev, ifr, cmd);
 }
 
 static int ftgmac100_setup_mdio(struct ftgmac100 *priv)
@@ -1265,11 +1267,14 @@ err_alloc_mdiobus:
 	return err;
 }
 
-static void ftgmac100_destroy_mdio(struct ftgmac100 *priv)
+static void ftgmac100_destroy_mdio(struct net_device *netdev)
 {
+	struct ftgmac100 *priv = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
+
 	if (!priv->use_ncsi)
 		return;
-	phy_disconnect(priv->phydev);
+	phy_disconnect(phydev);
 	mdiobus_unregister(priv->mii_bus);
 	mdiobus_free(priv->mii_bus);
 }
@@ -1324,7 +1329,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node &&
 	    of_get_property(pdev->dev.of_node, "use-nc-si", NULL)) {
 		dev_info(&pdev->dev, "Using NCSI interface\n");
-		priv->phydev = NULL;
+		netdev->phydev = NULL;
 		priv->use_ncsi = true;
 	} else {
 		priv->use_ncsi = false;
@@ -1398,7 +1403,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 err_register_netdev:
 	if (!priv->use_ncsi)
-		ftgmac100_destroy_mdio(priv);
+		ftgmac100_destroy_mdio(netdev);
 	else
 		ncsi_unregister_dev(priv->ndev);
 err_ncsi_dev:
@@ -1422,7 +1427,7 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
 
 	unregister_netdev(netdev);
 
-	ftgmac100_destroy_mdio(priv);
+	ftgmac100_destroy_mdio(netdev);
 
 	iounmap(priv->base);
 	release_resource(priv->res);
-- 
2.8.1
