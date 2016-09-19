Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdLh209KCzDsdx
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 08:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=YmIK9Yu6; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BB3716410D5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 17:50:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id x3TrUZlPab4d for <openbmc@lists.ozlabs.org>;
 Mon, 19 Sep 2016 17:50:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F37F6410EB
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 17:50:17 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 4F37F6410EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474325417; bh=9/4/Dk+WGDnYWv7EIg4RflF1jGgdjqjHYXjg2VFug2M=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=YmIK9Yu692XBAHKR7RrVCsfPWFC3v/NJv+fTTPPv1u/YsCG4xkBe1Y1bJ0xJINNt8
 nT/9srYSDcn5ojdMvbnCRNlPktKX77CnPAapAUYoos6KYfv8zUS9HFXtnUh1FOmdqi
 vFNvltetQdcpH6I1PHGQHNoSrztLJKIhGLa/Z1KM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ekALN3N7abuO for <openbmc@lists.ozlabs.org>;
 Mon, 19 Sep 2016 17:50:17 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 23F9D6410D5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 17:50:17 -0500 (CDT)
Date: Mon, 19 Sep 2016 17:50:16 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 03/19] Ensure that the old style MDIO interface is active
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Ensure that the old style MDIO interface is active
Thread-Index: XHJC4V05rfr/77BuMhWDErCDvscVgw==
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
X-List-Received-Date: Mon, 19 Sep 2016 22:50:26 -0000

 before registering the MDIO bus on Faraday style
 MACs.  Without this patch the hardware may continue
 to expect new style commands, yielding MDIO timeouts
 and general lack of communication with the MII.

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
