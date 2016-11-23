Return-Path: <maxims@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPCcM5MkPzDw37
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 06:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UzFrFkZc"; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id 189so4977438pfz.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 11:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oHq3kCfKJ7OmFhLD859dqf0QUR0gnCwbJR2G0xTzwto=;
 b=UzFrFkZcdX4RuHNcIbHNJ/a5hxjQX3I6c3FAxnAD1VTnc84vzt/V6oHb4p/yFkBtMw
 0gSbJtgxaq8ktFVRg9mwWkEl0f13kPxXAePqw/BnLKvcs0i5oIC56DKqUtKDMdw7YdUf
 BV+nn1G3OM09eLsCkIVBtQa+47kMYp29sxwGKBYw8xXsn1wBHoA8KjIGi2nPJqhtphI+
 PezRtNJ3cLnFmfBAEjxlczZOHBgJFwLmVQQ78luDZtRuwogxwdsCje8q4eVpC7NM/PEJ
 E736mG0Yp+FjzI1M5/Bhan+j0W4YrgY+faUIqNGjWtFNJBWSp5LxGNC+wLGzVfvRQj4S
 ogHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oHq3kCfKJ7OmFhLD859dqf0QUR0gnCwbJR2G0xTzwto=;
 b=HZots8T1aAIf9gUb0syaobiayo57Q4xzCTb0ggPd+ZFcj/65yZDIMpYqeXSNl2NQFD
 33oVmSLnBKpAEUxhM2GxHYS/5skwEO7Wg7EW4/Kcetn1oX+E+YQcJXYu0AZNQJ0I1nNe
 J3S4ipCUaDdMBSx6L5OFAPxjtpk87E3ocF8wROlKa3KINJbTQJ+5W4oNX24oFgkjCOQH
 oV2mP+67GdmY+LXTnIJKJOo1uqIhyT5XLWGnYhBrxzECbrFMIV61j3UqX0/QCSeu6AgV
 Ef7DEQFLCgeaVYx2rWStve9jIv6VWTd5j4A++WQeIGUcs6K8b9+SVtB4pSvvyw+oYUbV
 GPYg==
X-Gm-Message-State: AKaTC01UTZ0hEu9r8dzizn+aYR/3m1Am0AtVtmMUkmU3MbYJUBdQyyTa/wXU8uV0d5+DCs76
X-Received: by 10.99.208.21 with SMTP id z21mr7937127pgf.79.1479930625748;
 Wed, 23 Nov 2016 11:50:25 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id b12sm52335523pfb.78.2016.11.23.11.50.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 11:50:25 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v1 3/6] aspeed/scu: Add definitions needed to configure
 pins for I2C
Date: Wed, 23 Nov 2016 11:49:59 -0800
Message-Id: <1479930602-91012-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479930602-91012-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 19:50:28 -0000

Add missing definitions for configuring I2C pins

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index 5445023..6cb4d0d 100644
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
 
+#define SCU_I2C_MIN_BUS_NUM			(1)
+#define SCU_I2C_MAX_BUS_NUM			(14)
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
