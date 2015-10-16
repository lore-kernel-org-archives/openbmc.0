Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 724E81A0985
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:42 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998038768125.90017071382783;
 Fri, 16 Oct 2015 05:20:38 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] arm/aspeed_defconfig: change CONFIG_USB_G_SERIAL to
 y
Date: Fri, 16 Oct 2015 07:20:34 -0500
Message-Id: <1444998034-17639-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444998034-17639-1-git-send-email-patches@stwcx.xyz>
References: <1444998034-17639-1-git-send-email-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 12:20:43 -0000

From: Jeremy Kerr <jk@ozlabs.org>

It's the only module present.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/configs/aspeed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
index dfd5707..fa8e8a1 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -151,7 +151,7 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_GENERIC=y
 CONFIG_USB_GADGET=y
-CONFIG_USB_G_SERIAL=m
+CONFIG_USB_G_SERIAL=y
 CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_NEW_LEDS=y
-- 
2.6.0
