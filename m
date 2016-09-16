Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRqx6VYdzDsds
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=Uk11/iM5; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 962FA64114E;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kKjlr7w3hPG1; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D9401641138;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com D9401641138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058134; bh=0OCIyj9wN5x7UvizD3SJzILOs6IEzhIBlcl73h2PIP8=;
 h=From:To:Subject:Date:Message-Id;
 b=Uk11/iM5SYDfCa9464ThL7bzZCjyOh5WUhza9g4EzFzQ3tYNSGL4MBE46jJfE1Ho5
 Z+VwfcRTalZbvcrzYFsQeeEezhD+cEyQc+XWq/dIA0UQn9rTb5SQ2Cfs0wfLzf2C0J
 qHiZyqKaVRQ3V6UBcFYoCRRXsqkoFzvGhPACSvKw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id a86uOxJMJdrL; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 9FB3E64103E;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
	Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH 01/17] phy/broadcom: Add support for the BCM54210E
Date: Fri, 16 Sep 2016 15:35:17 -0500
Message-Id: <1474058133-27363-2-git-send-email-tpearson@raptorengineering.com>
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

From: Joel Stanley <joel@jms.id.au>

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
