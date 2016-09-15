Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZqxq6vnCzDsYr
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=FW3FR9y+; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BBB056410A5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:29 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SD72kHFA94Xp for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:33:29 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 199FB6410D0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:29 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 199FB6410D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971609; bh=TxMA8pQxDTANrvHLZkLd2egIQNQFq25laxiC52N49GY=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=FW3FR9y+daaQupuBoP6ltEa7ZKXh6b5nlvTOpuQjMjj0DXLwsViNveJUV6trUflZ8
 n5Kt8w4HBNPcRP0PGCat5S4KvLERxBBnvgYyAhKRqd5OGhCpYqagvwZdqoYWQHjqM3
 bJxb61G5mLXq+xGZ2/TcNixzX5lt0ylSgyx9GQLg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JXERACxrgTaa for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:33:28 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D52FB6410A5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:28 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:33:28 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <55706225.194618.1473971608790.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 02/16] net/phy: Expose 100base-T capability only
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: net/phy: Expose 100base-T capability only
Thread-Index: UHNoMuroGKFaW7SBRCjK0JI98VPWYQ==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:38:40 -0000


I don't know the specific PHY model deployed on Firestone BMC, but
currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
supports 1000base-T but the PHY on Firestone BMC shouldn't support
that mode as uboot uses 100base-T mode.

When exposing 1000base-T capability, the MAC is forced to have the
same mode though the PHY is working in 100base-T mode in fact. It
causes the mode mismatch between PHY/MAC and the ethernet network
doesn't work.

It's a temporary fix. After the PHY model is confirmed, we need
to enable the correct PHY driver instead current one for BCM54210E.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

[Cyril]
The plot thickens, it does appear that this IS the correct PHY on
firestones. This patch is definitely required for networking to be
functional though.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/phy/broadcom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 2d5ba6a..4fd7c53 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -596,7 +596,7 @@ static struct phy_driver broadcom_drivers[] = {
 	.phy_id         = PHY_ID_BCM54210E,
 	.phy_id_mask    = 0xfffffff0,
 	.name           = "Broadcom BCM54210E",
-	.features       = PHY_GBIT_FEATURES |
+	.features       = PHY_BASIC_FEATURES |
 				SUPPORTED_Pause | SUPPORTED_Asym_Pause,
 	.flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
 	.config_init    = bcm54xx_config_init,
-- 
1.7.9.5
