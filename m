Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRqx6SyrzDsdr
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=rtz43+T8; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 98EE4641152
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SCKhh9V56p2X; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EFA576404A3;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com EFA576404A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058135; bh=CHuQw3haeqvUn3r2q2JTp8yMvRaYtlQ8BizTCEuhJn4=;
 h=From:To:Subject:Date:Message-Id;
 b=rtz43+T8i90iCpBH2r1IxCenJBzaLB2QeNSvUnn4h7Yauzro+MbX8HnByQ9jOlXKk
 y0+aZbbSs5SnCdOoICioVgMhMzaLDPY7lhuw/U/tR01er0atNFPtW8LrVc/FXr010I
 8GdTdWBZbri2j7l10FugoEGaGmCbnhRCn7/1NGGo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0BVTQYe-Lswz; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id ADBC4641072;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 03/17] Ensure that the old style MDIO interface is active
 before registering the MDIO bus on Faraday style MACs. Without this patch the
 hardware may continue to expect new style commands,
 yielding MDIO timeouts and general lack of communication with the MII.
Date: Fri, 16 Sep 2016 15:35:19 -0500
Message-Id: <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:42 -0000
X-List-Received-Date: Fri, 16 Sep 2016 20:35:42 -0000

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c |    6 ++++++
 drivers/net/ethernet/faraday/ftgmac100.h |    2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index c20f767..778c625 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1250,6 +1250,7 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
 	struct platform_device *pdev = to_platform_device(priv->dev);
+	uint32_t revcr;
 	int i, err = 0;
 
 	/* initialize mdio bus */
@@ -1257,6 +1258,11 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 	if (!priv->mii_bus)
 		return -EIO;
 
+	/* This driver only supports the old MDIO interface -- enable it */
+	revcr = ioread32(priv->base + FTGMAC100_OFFSET_REVR);
+	revcr &= ~FTGMAC100_OFFSET_REVR_NEW_INTERFACE;
+	iowrite32(revcr, priv->base + FTGMAC100_OFFSET_REVR);
+
 	priv->mii_bus->name = "ftgmac100_mdio";
 	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%d",
 		 pdev->name, pdev->id);
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index d07b6ea..ee5f758 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -133,6 +133,8 @@
 #define FTGMAC100_DMAFIFOS_RXDMA_REQ		(1 << 30)
 #define FTGMAC100_DMAFIFOS_TXDMA_REQ		(1 << 31)
 
+#define FTGMAC100_OFFSET_REVR_NEW_INTERFACE	(1 << 31)
+
 /*
  * Receive buffer size register
  */
-- 
1.7.9.5
