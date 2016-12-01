Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tV9Bc40MxzDw1v
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 08:18:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CtgvVgRb"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id f188so98615604pgc.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eEiIlGCXVH2pZCpZJkG7oXSs8ESAPVLe1adfZADFIp4=;
 b=CtgvVgRbNCUVlMuXsque+XZ/5tzgGC+FFoH0jYhP+NuQJCwYMuSfytCItmpN6k/aQ0
 hQkJB011pcJqOwRjOc5UiDaQGxG2saPKKBOQfzdjQ/VPo7xaNxyf0URwHbTnIS0N7F++
 tWrvfWEjyeGmIKyms8g7kOgri1Rl3ZU2qO2ecWYJDswSWE9D8Jr+/V/yAphGRCvVDNMr
 /+05oS1v7+eh8qzs/H8jJg/DJe1EHMY3ybNqrk4lbHKGEUBzZSTj2+8v14b3RfK1X8wa
 CxczHCrywnXcXfdrcHeD/o1kocgj3w4oRq104HThNIfV5hSDWRfmldA69SWxxAVHzZCk
 NSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eEiIlGCXVH2pZCpZJkG7oXSs8ESAPVLe1adfZADFIp4=;
 b=MJH4H6sFPr4gNvrtlZzTVQbKh2apCQWp2WoXKpSSh34xLzGQ2oeqJjrURmjhaYhTkf
 JEAsvpKkr/OrSeFFfsD3osGBPKe6vJbRhG8vGCwrytvk/hvIq8b3eXknNof2ddGH/QDW
 oqM/JfdD0H/e8i2Xl+3rAqyMOabgqtMgn7xbIG6Mms2fIEoRwkrgl5px8lcUS2hISTJ9
 7HhUO0SThpfMPAYblMfJRl27EOTnsLN2UGn6CEATdbk1hJzBTRuTDyPrlLiSa5vkK5yA
 cRYv1jy0s1DHBmivFbUOBD1X86E1PWGsBAfjc09YJYtWm20aOpPDgLxNY+Nlh8n3Uktd
 2ENw==
X-Gm-Message-State: AKaTC00GEHTsg8e4pe1UitA6JbdyfmWatOGbwAK9fVA94wlOSm5AGH4OqIjDMoBv+zMuWDzc
X-Received: by 10.99.2.142 with SMTP id 136mr73075333pgc.25.1480627126878;
 Thu, 01 Dec 2016 13:18:46 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r21sm2264446pfd.44.2016.12.01.13.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Dec 2016 13:18:46 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: openbmc@lists.ozlabs.org
Cc: sjg@chromium.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v3 3/6] aspeed/scu: Add definitions needed to configure
 pins for I2C
Date: Thu,  1 Dec 2016 13:18:32 -0800
Message-Id: <1480627115-5759-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480627115-5759-1-git-send-email-maxims@google.com>
References: <1480627115-5759-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 01 Dec 2016 21:18:49 -0000

Add missing definitions for configuring I2C pins

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
Changes for v1:
	Split patch into two with this part adding definitions.
Changes for v2:
	Dropped redundant parens.
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index 5445023..be8c8d7 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -844,11 +844,15 @@
 #define SCU_FUN_PIN_I2C5		(0x1 << 18)
 #define SCU_FUN_PIN_I2C4		(0x1 << 17)
 #define SCU_FUN_PIN_I2C3		(0x1 << 16)
+#define SCU_FUN_PIN_I2C(n)		(0x1 << (16 + (n) - 3))
 #define SCU_FUN_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
 #define SCU_FUN_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
 #define SCU_FUN_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
 #define SCU_FUN_PIN_MII1_TX_DWN_DIS	(0x1 << 12)

+#define SCU_I2C_MIN_BUS_NUM			1
+#define SCU_I2C_MAX_BUS_NUM			14
+
 #define SCU_FUN_PIN_MII2_TX_DRIV(x)	(x << 10)
 #define SCU_FUN_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
 #define SCU_FUN_PIN_MII1_TX_DRIV(x)	(x << 8)
@@ -914,6 +918,11 @@
 #define SCU_FUN_PIN_ROMA4		(0x1 << 18)
 #define SCU_FUN_PIN_ROMA3		(0x1 << 17)
 #define SCU_FUN_PIN_ROMA2		(0x1 << 16)
+/* AST2500 only */
+#define SCU_FUN_PIN_SDA2		(0x1 << 15)
+#define SCU_FUN_PIN_SCL2		(0x1 << 14)
+#define SCU_FUN_PIN_SDA1		(0x1 << 13)
+#define SCU_FUN_PIN_SCL1		(0x1 << 12)

 /* AST_SCU_FUN_PIN_CTRL9		0xA8 - Multi-function Pin Control#9 */
 #define SCU_FUN_PIN_ROMA21		(0x1 << 3)
--
2.8.0.rc3.226.g39d4020
