Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZqxr0BjKzDsYs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=cr58mAvR; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 07E55640D1E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3P0ORkoQ0j2v for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:33:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 33B50641076
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:04 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 33B50641076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971584; bh=d77hTeHhOKy9scIvel7Oc+I/yKSRjdNbJYFVs6AD20Q=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=cr58mAvRTmepnbjDtv9KrpeYWex2fpk8YZ2XvwgDF9Z3LcAq7ZxPhGU1eV5giJipT
 cmKXko6pmgNtEQ3bYXDLaTerR6S3T7R6o9Xr6owmtt+AXTSF2boA2kBu2FBANjGva+
 mlzlz+NGeb46J+fQpFP1yPSJI7c+1KEpV9VAAZsE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id H5A_Z4drE4IE for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:33:03 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id C5CCC640D1E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:33:03 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:33:03 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1494847539.194617.1473971583386.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 01/16] phy/broadcom: Add support for the BCM54210E
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: phy/broadcom: Add support for the BCM54210E
Thread-Index: GSx9FX/5Kx07z30X4rVdP8Q5d6YZpg==
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


Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/net/phy/broadcom.c |   13 +++++++++++++
 include/linux/brcmphy.h    |    2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 870327e..2d5ba6a 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -592,6 +592,18 @@ static struct phy_driver broadcom_drivers[] = {
 	.read_status	= genphy_read_status,
 	.ack_interrupt	= brcm_fet_ack_interrupt,
 	.config_intr	= brcm_fet_config_intr,
+}, {
+	.phy_id         = PHY_ID_BCM54210E,
+	.phy_id_mask    = 0xfffffff0,
+	.name           = "Broadcom BCM54210E",
+	.features       = PHY_GBIT_FEATURES |
+				SUPPORTED_Pause | SUPPORTED_Asym_Pause,
+	.flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
+	.config_init    = bcm54xx_config_init,
+	.config_aneg    = genphy_config_aneg,
+	.read_status    = genphy_read_status,
+	.ack_interrupt  = bcm_phy_ack_intr,
+	.config_intr    = bcm_phy_config_intr,
 } };
 
 module_phy_driver(broadcom_drivers);
@@ -609,6 +621,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
 	{ PHY_ID_BCM57780, 0xfffffff0 },
 	{ PHY_ID_BCMAC131, 0xfffffff0 },
 	{ PHY_ID_BCM5241, 0xfffffff0 },
+	{ PHY_ID_BCM54210E, 0xfffffff0},
 	{ }
 };
 
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index e3354b7..f26fc51 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -35,6 +35,8 @@
 
 #define PHY_ID_BCM_CYGNUS		0xae025200
 
+#define PHY_ID_BCM54210E		0x600d84a0
+
 #define PHY_BCM_OUI_MASK		0xfffffc00
 #define PHY_BCM_OUI_1			0x00206000
 #define PHY_BCM_OUI_2			0x0143bc00
-- 
1.7.9.5
