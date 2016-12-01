Return-Path: <maxims@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tV9Bf1gFZzDvxS
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 08:18:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MAbQV1wX"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id f188so98615867pgc.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 13:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KJ5d58gBg6k5hyeureFA8Fl6nUbovB/J/7olDJwE384=;
 b=MAbQV1wX5bnnTiIPGuRL9ShNMMPrK6PlUjk7dGZnQf70YDo9UM0ZgEJA2UZYAtInhu
 ua0k0eRr54t8kThSurBS52fpJ6rFooeey1HVF84U9cZiYo/vz+4fM/V/kVwyvXL6A0A3
 kPfzDoAHsBQqjPw2fyGngP4BumSHk2g5HA43I9vBkjaBAsqjdMLehiG/KGhdgliki5/w
 1KVHxyHg+MS2OJm14WFRzI5tlih8jr1TyYCZWedPxykcVh0o3SxAQEOIvkFda2LqLDLx
 FDxP6Z66+3hauVKWgwAJuRleCinEAZCwzQZ6jnvn4rPKbUlesLBYZQASnD2AtHy1dlS4
 t1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KJ5d58gBg6k5hyeureFA8Fl6nUbovB/J/7olDJwE384=;
 b=mQ0X2rSfrepCA1hyPwoSfNzEGyR8esNok/qDBjTCf+Fp78Ffxh0D+cZ9Hwh3UqKES0
 cB4OWxH8zWnxIPPyhMzflaMohgFJ0eos3KWpDEMyKeCgYZHPqiumq5zGgWfpFSydkTOM
 8YsHMyq6QAdtexPk6Pv/e5wZ98eDAQQxkTUiIGssskmnubQ5mERI8dgEW8eacraG+HTW
 JWk80ymlX+9PQc1wLTUUCIcTkj7biYGZ0pGm7FMMvyxuC84qniQoeRAu9HrVLJ3OmPf+
 NU6ZQNDNOQjjfeJ06n44LFFP0pYwLJ7PmQP1WkrJ8CuBh8OionEvfi3+3lpCW3rFfU/2
 t1Vw==
X-Gm-Message-State: AKaTC00RY71E/olHlnnYnLF5ofpS0AD4M6rjS4MXGV94yyeXb0jHB3K78KtQE4JnnIZw8q1o
X-Received: by 10.99.181.17 with SMTP id y17mr71244732pge.97.1480627128474;
 Thu, 01 Dec 2016 13:18:48 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r21sm2264446pfd.44.2016.12.01.13.18.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Dec 2016 13:18:48 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: openbmc@lists.ozlabs.org
Cc: sjg@chromium.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v3 5/6] aspeed: Add function to configure pins for I2C
 devices
Date: Thu,  1 Dec 2016 13:18:34 -0800
Message-Id: <1480627115-5759-5-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 01 Dec 2016 21:18:50 -0000

In the absence of pinmux driver, I2C driver will be
configuring pins directly.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  6 ++++++
 arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index 6f00e37..5ab28cc 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -49,4 +49,10 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);

+/*
+ * Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 87236e2..8232d88 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -509,3 +509,31 @@ void ast_scu_get_who_init_dram(void)
 		break;
 	}
 }
+
+void ast_scu_enable_i2c(u8 bus_num)
+{
+	if (bus_num > SCU_I2C_MAX_BUS_NUM) {
+		debug("%s: bus_num is out of range, must be [%d - %d]\n",
+		      __func__, SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
+		return;
+	}
+
+	if (bus_num == 0) {
+		/* Enable I2C Controllers */
+		clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
+	} else if (bus_num >= 3) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
+			     SCU_FUN_PIN_I2C(bus_num));
+	/* In earlier versions of the SoC these pins are always assigned to
+	 * respective I2C buses and require no configuration.
+	 */
+#ifdef AST_SOC_G5
+	} else if (bus_num == 1) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+			     SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
+	} else if (bus_num == 2) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+			     SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
+#endif
+	}
+}
--
2.8.0.rc3.226.g39d4020
