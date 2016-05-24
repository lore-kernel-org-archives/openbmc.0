Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDLV61mqFzDqCn
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 13:28:46 +1000 (AEST)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 24 May 2016 13:28:44 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 24 May 2016 13:28:42 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id F28D93578053
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 13:28:41 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4O3SZHK8323086
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 13:28:41 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4O3S77Q017751
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 13:28:07 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4O3S6K6017228; Tue, 24 May 2016 13:28:06 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id E63F7A0146;
 Tue, 24 May 2016 13:27:40 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id A1857E3A8B;
 Tue, 24 May 2016 13:27:40 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 9883A9421E2; Tue, 24 May 2016 13:27:40 +1000 (AEST)
Date: Tue, 24 May 2016 13:27:40 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: gwshan@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] net/ethernet/faraday: Forward port ftgmac100 NC-SI
Message-ID: <20160524032740.GA17912@gwshan>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1464055653-15867-1-git-send-email-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464055653-15867-1-git-send-email-joel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052403-0005-0000-0000-000007EDA044
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Tue, 24 May 2016 03:28:46 -0000

On Tue, May 24, 2016 at 11:37:33AM +0930, Joel Stanley wrote:
>This reflects changes made in order to build with 4.7.
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
>
>Gavin,
>
>Can you please double check that this looks ok to you?
>
>Do you have a series that contains all of the NC-SI support that is ready to go upstream? If so, I would prefer to take that in the dev tree.
>

Joel, it looks good to me except below minor bits . Sorry that I don't have a series
based on upstream yet. I will start work on it later of this week or early of next
week depending on the work at hand (mainly bug fixing this moment). Will keep you
updated with the last state.

>Cheers,
>
>Joel
>
>
> drivers/net/ethernet/faraday/ftgmac100.c | 29 +++++++++++++++++------------
> 1 file changed, 17 insertions(+), 12 deletions(-)
>

Since the PHY device is embedded in "struct net_device", the one (@phydev) in "struct ftgmac100"
can be removed.

>diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
>index 644ef77215d5..d2b2c21da809 100644
>--- a/drivers/net/ethernet/faraday/ftgmac100.c
>+++ b/drivers/net/ethernet/faraday/ftgmac100.c
>@@ -1099,6 +1099,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
> static int ftgmac100_open(struct net_device *netdev)
> {
> 	struct ftgmac100 *priv = netdev_priv(netdev);
>+	struct phy_device *phydev = netdev->phydev;
> 	int err;
>
> 	err = ftgmac100_alloc_buffers(priv);
>@@ -1125,8 +1126,8 @@ static int ftgmac100_open(struct net_device *netdev)
> 	ftgmac100_init_hw(priv);
> 	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
>
>-	if (priv->phydev)
>-		phy_start(priv->phydev);
>+	if (phydev)
>+		phy_start(phydev);
> 	else if (priv->use_ncsi)
> 		netif_carrier_on(priv->netdev);
>
>@@ -1160,6 +1161,7 @@ err_alloc:
> static int ftgmac100_stop_dev(struct net_device *netdev)
> {
> 	struct ftgmac100 *priv = netdev_priv(netdev);
>+	struct phy_device *phydev = netdev->phydev;
>
> 	if (!priv->enabled)
> 		return 0;
>@@ -1170,8 +1172,8 @@ static int ftgmac100_stop_dev(struct net_device *netdev)
>
> 	netif_stop_queue(netdev);
> 	napi_disable(&priv->napi);
>-	if (priv->phydev)
>-		phy_stop(priv->phydev);
>+	if (phydev)
>+		phy_stop(phydev);
>
> 	ftgmac100_stop_hw(priv);
> 	free_irq(priv->irq, netdev);
>@@ -1216,11 +1218,11 @@ static int ftgmac100_hard_start_xmit(struct sk_buff *skb,
> /* optional */
> static int ftgmac100_do_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
> {
>-	struct ftgmac100 *priv = netdev_priv(netdev);
>+	struct phy_device *phydev = netdev->phydev;
>
>-	if (!priv->phydev)
>+	if (!phydev)
> 		return -EINVAL;
>-	return phy_mii_ioctl(priv->phydev, ifr, cmd);
>+	return phy_mii_ioctl(phydev, ifr, cmd);
> }
>
> static int ftgmac100_setup_mdio(struct ftgmac100 *priv)
>@@ -1265,11 +1267,14 @@ err_alloc_mdiobus:
> 	return err;
> }
>
>-static void ftgmac100_destroy_mdio(struct ftgmac100 *priv)
>+static void ftgmac100_destroy_mdio(struct net_device *netdev)
> {
>+	struct ftgmac100 *priv = netdev_priv(netdev);
>+	struct phy_device *phydev = netdev->phydev;
>+
> 	if (!priv->use_ncsi)
> 		return;

This condition would be as below. Otherwise, the PHY device that is created
in non-NCSI circumstances won't be released.

	if (!phydev || priv->use_ncsi)
		return;

>-	phy_disconnect(priv->phydev);
>+	phy_disconnect(phydev);
> 	mdiobus_unregister(priv->mii_bus);
> 	mdiobus_free(priv->mii_bus);
> }
>@@ -1324,7 +1329,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
> 	if (pdev->dev.of_node &&
> 	    of_get_property(pdev->dev.of_node, "use-nc-si", NULL)) {
> 		dev_info(&pdev->dev, "Using NCSI interface\n");
>-		priv->phydev = NULL;
>+		netdev->phydev = NULL;
> 		priv->use_ncsi = true;
> 	} else {
> 		priv->use_ncsi = false;
>@@ -1398,7 +1403,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
> err_register_netdev:
> 	if (!priv->use_ncsi)
>-		ftgmac100_destroy_mdio(priv);
>+		ftgmac100_destroy_mdio(netdev);
> 	else
> 		ncsi_unregister_dev(priv->ndev);
> err_ncsi_dev:
>@@ -1422,7 +1427,7 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
>
> 	unregister_netdev(netdev);
>
>-	ftgmac100_destroy_mdio(priv);
>+	ftgmac100_destroy_mdio(netdev);
>
> 	iounmap(priv->base);
> 	release_resource(priv->res);

Thanks,
Gavin

>-- 
>2.8.1
>
