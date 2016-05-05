Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0ckM6fbQzDq5g
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:43 +1000 (AEST)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:28:42 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:28:40 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id DB29F3578053
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:38 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451SU0h6423012
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:38 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451S5d5025799
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:05 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451S4uA025355; Thu, 5 May 2016 11:28:05 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 08096A0282;
 Thu,  5 May 2016 11:27:40 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 1/6] phy/broadcom: Add support for the BCM54210E
Date: Thu,  5 May 2016 11:27:11 +1000
Message-Id: <1462411636-7225-2-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0029-0000-0000-0000458C5E43
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
X-List-Received-Date: Thu, 05 May 2016 01:28:44 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/net/phy/broadcom.c | 13 +++++++++++++
 include/linux/brcmphy.h    |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 3ce5d95..3743164 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -604,6 +604,18 @@ static struct phy_driver broadcom_drivers[] = {
 	.ack_interrupt	= brcm_fet_ack_interrupt,
 	.config_intr	= brcm_fet_config_intr,
 	.driver		= { .owner = THIS_MODULE },
+}, {
+	.phy_id		= PHY_ID_BCM54210E,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "Broadcom BCM54210E",
+	.features	= PHY_GBIT_FEATURES |
+			  SUPPORTED_Pause | SUPPORTED_Asym_Pause,
+	.flags		= PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
+	.config_init	= bcm54xx_config_init,
+	.config_aneg	= genphy_config_aneg,
+	.read_status	= genphy_read_status,
+	.ack_interrupt	= bcm_phy_ack_intr,
+	.config_intr	= bcm_phy_config_intr,
 } };
 
 module_phy_driver(broadcom_drivers);
@@ -621,6 +633,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
 	{ PHY_ID_BCM57780, 0xfffffff0 },
 	{ PHY_ID_BCMAC131, 0xfffffff0 },
 	{ PHY_ID_BCM5241, 0xfffffff0 },
+	{ PHY_ID_BCM54210E, 0xfffffff0},
 	{ }
 };
 
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index 59f4a73..3d644da 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -32,6 +32,8 @@
 
 #define PHY_ID_BCM_CYGNUS		0xae025200
 
+#define PHY_ID_BCM54210E		0x600d84a0
+
 #define PHY_BCM_OUI_MASK		0xfffffc00
 #define PHY_BCM_OUI_1			0x00206000
 #define PHY_BCM_OUI_2			0x0143bc00
-- 
2.8.2
