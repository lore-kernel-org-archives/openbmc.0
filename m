Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0ckw0wdJzDq5g
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:12 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:29:10 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:29:08 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 55B282CE8054
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:06 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451Swcj2884028
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:29:04 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451SWdZ026379
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:32 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451SVAp025837; Thu, 5 May 2016 11:28:31 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 41247A039A;
 Thu,  5 May 2016 11:27:40 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 6/6] net/phy: Expose 100base-T capability only
Date: Thu,  5 May 2016 11:27:16 +1000
Message-Id: <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0017-0000-0000-0000046F61CA
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
X-List-Received-Date: Thu, 05 May 2016 01:29:12 -0000

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
---
 drivers/net/phy/broadcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 3743164..95208b0 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -608,7 +608,7 @@ static struct phy_driver broadcom_drivers[] = {
 	.phy_id		= PHY_ID_BCM54210E,
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "Broadcom BCM54210E",
-	.features	= PHY_GBIT_FEATURES |
+	.features	= PHY_BASIC_FEATURES |
 			  SUPPORTED_Pause | SUPPORTED_Asym_Pause,
 	.flags		= PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
 	.config_init	= bcm54xx_config_init,
-- 
2.8.2
