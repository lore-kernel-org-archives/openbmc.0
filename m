Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG375wmPzDqmF
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANhAm065249
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:17 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23uw5r6mcf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:16 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:13 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:28:12 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id DF6602BB0057
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:11 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UASBN210289270
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:11 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASBCb008566
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:11 +1000
Received: from gwshan ([9.192.205.20])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UASATk008555; Thu, 30 Jun 2016 20:28:10 +1000
Received: by gwshan (Postfix, from userid 1000)
 id B8E5F943470; Thu, 30 Jun 2016 20:28:04 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 07/10] net/farady: Read MAC address from chip
Date: Thu, 30 Jun 2016 20:27:48 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0040-0000-0000-000001BB7F61
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0041-0000-0000-000009FD71B6
Message-Id: <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:20 -0000

The device is assigned with random MAC address. It isn't reasonable.
An valid MAC address might have been in the chip. It's reasonable
to use it to maintain consistency.

This uses the MAC address in the chip if it's valid. Otherwise, a
random MAC address is given as before.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 60 ++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 2c22f74..120993e 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -141,6 +141,55 @@ static void ftgmac100_set_mac(struct ftgmac100 *priv, const unsigned char *mac)
 	iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
 }
 
+static void ftgmac100_setup_mac(struct ftgmac100 *priv)
+{
+	unsigned char mac[6];
+	unsigned int m;
+	unsigned int l;
+
+	m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
+	l = ioread32(priv->base + FTGMAC100_OFFSET_MAC_LADR);
+
+	mac[0] = (m >> 8) & 0xff;
+	mac[1] = m & 0xff;
+	mac[2] = (l >> 24) & 0xff;
+	mac[3] = (l >> 16) & 0xff;
+	mac[4] = (l >> 8) & 0xff;
+	mac[5] = l & 0xff;
+
+	if (!is_valid_ether_addr(mac)) {
+		mac[5] = (m >> 8) & 0xff;
+		mac[4] = m & 0xff;
+		mac[3] = (l >> 24) & 0xff;
+		mac[2] = (l >> 16) & 0xff;
+		mac[1] = (l >>  8) & 0xff;
+		mac[0] = l & 0xff;
+	}
+
+	if (!is_valid_ether_addr(mac)) {
+		eth_hw_addr_random(priv->netdev);
+		dev_info(priv->dev, "Generated random MAC address %pM\n",
+			 priv->netdev->dev_addr);
+	} else {
+		memcpy(priv->netdev->dev_addr, mac, 6);
+		dev_info(priv->dev, "Read MAC address from chip %pM\n", mac);
+	}
+}
+
+static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
+{
+	int ret;
+
+	ret = eth_prepare_mac_addr_change(dev, p);
+	if (ret < 0)
+		return ret;
+
+	eth_commit_mac_addr_change(dev, p);
+	ftgmac100_set_mac(netdev_priv(dev), dev->dev_addr);
+
+	return 0;
+}
+
 static void ftgmac100_init_hw(struct ftgmac100 *priv)
 {
 	/* setup ring buffer base registers */
@@ -1141,7 +1190,7 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
 	.ndo_open		= ftgmac100_open,
 	.ndo_stop		= ftgmac100_stop,
 	.ndo_start_xmit		= ftgmac100_hard_start_xmit,
-	.ndo_set_mac_address	= eth_mac_addr,
+	.ndo_set_mac_address	= ftgmac100_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_do_ioctl		= ftgmac100_do_ioctl,
 };
@@ -1263,6 +1312,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	priv->irq = irq;
 
+	/* MAC address from chip or random one */
+	ftgmac100_setup_mac(priv);
+
 	err = ftgmac100_setup_mdio(netdev);
 	if (err)
 		goto err_setup_mdio;
@@ -1276,12 +1328,6 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	netdev_info(netdev, "irq %d, mapped at %p\n", priv->irq, priv->base);
 
-	if (!is_valid_ether_addr(netdev->dev_addr)) {
-		eth_hw_addr_random(netdev);
-		netdev_info(netdev, "generated random MAC address %pM\n",
-			    netdev->dev_addr);
-	}
-
 	return 0;
 
 err_register_netdev:
-- 
2.1.0
