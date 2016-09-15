Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3f5lx1zDsYs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=PTVLXYqZ; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 97CD0641137
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id K-men5I5nPd1 for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:34:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 17CC7641138
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:17 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 17CC7641138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971657; bh=pxdi8X70xVe8I3hNaYsXt9DAK1/H55a7HjWaOciy3xc=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=PTVLXYqZZ+pHG4u0WZk/6CQdLCPgNSw8kq095pzmrjuPB9kOV4Oasvl6LhpnO2XpV
 x9BUSbwz1v2fszZrnvyzgWnsKIp0Cf3MylJMmHqWFIpf0SIXRkS2l20slvPV1eNlTD
 KHXXYOme8pEnZQFT68dSq9DkuKzxz4y05E6dQmmE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 89WAUdlqIua3 for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:34:16 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D8AFE641137
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:16 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:34:16 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1830905868.194623.1473971656810.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 04/16] Allow no-hw-checksum override in devicetree outside of
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Allow no-hw-checksum override in devicetree outside of
Thread-Index: 322T0k3LCckQVrX7DYuXphJBXPrZQA==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:43:43 -0000

 NCSI mode.

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
