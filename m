Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRqx6f1rzDsdv
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=K3OYYNpX; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8A31064114F;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RaT0MYQyuDfp; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DDC09641137;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com DDC09641137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058135; bh=VGPmk3IDzJXMoretMXZ9nggrN8dyywNAdtHKV2QtLBI=;
 h=From:To:Subject:Date:Message-Id;
 b=K3OYYNpXS1ZZQ5bF8S10U8bXSrC95pNWEnGZ0JA9QrZG5aypOK7Z4AP0XU3FxbnfU
 ysuG6TfbL2BaLD11s39ksCy3dbOf9f9yfSrBPgDHCCyNWNlPfoFrqouEoBh8lJq9KK
 A7ltrDyzRGKkHUOZq1Or+ZrxqRdHVVFtfBJZEjDA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xrOkjRbWy9hJ; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id A6C42641054;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, Cyril Bur <cyrilbur@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH 02/17] net/phy: Expose 100base-T capability only
Date: Fri, 16 Sep 2016 15:35:18 -0500
Message-Id: <1474058133-27363-3-git-send-email-tpearson@raptorengineering.com>
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

From: Gavin Shan <gwshan@linux.vnet.ibm.com>

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
