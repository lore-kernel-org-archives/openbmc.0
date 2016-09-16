Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRqx6cV9zDsdt
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=LahXAa/2; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9DCE36410A3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IsUBchPOEw9m; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 40206641144;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 40206641144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058135; bh=zEYshS/q1+yMnDXO6poW4e0cs4indEc16HKkqReM8CA=;
 h=From:To:Subject:Date:Message-Id;
 b=LahXAa/21fesyVB9cxjRIxEcOU1KBglmEKeJFdAlZziA6aknvL2BtOgVZYcIhe/CG
 BpjQaLbpBIg7yIFjkSoC5ExS3LoPYErhvPaNsnKwVL4b45E1NfuXOynpFnlHsouYMt
 KK469hBZk4+zZPnR3su7S1TqkWNCjpGCJ6ltlzD4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BXO8on6-XTqL; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id B5326641077;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 04/17] Allow no-hw-checksum override in devicetree outside of
 NCSI mode.
Date: Fri, 16 Sep 2016 15:35:20 -0500
Message-Id: <1474058133-27363-5-git-send-email-tpearson@raptorengineering.com>
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

This is required for Firestone networking to function correctly.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 778c625..3a6367d 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1423,8 +1423,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	 * in that case.
 	 */
 	netdev->features = NETIF_F_IP_CSUM | NETIF_F_GRO;
-	if (priv->use_ncsi &&
-	    of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
+	if (of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
 		netdev->features &= ~NETIF_F_IP_CSUM;
 
 
-- 
1.7.9.5
