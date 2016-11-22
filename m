Return-Path: <maxims@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNj735zQxzDvxm
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:56:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WEMAIKdd"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id p66so12589343pga.2
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lNmBSia75mIPwAkHSmTJYXw/EkvxTwEjwv+x+oDZ54g=;
 b=WEMAIKddyLmWOfaK9A9dm+Oiw7HsV36g6hxbjhdevRZVroFAHDj95iJCQtTdrON1DZ
 nZX56jN+zCjI3PCRo+KKPlVdaq8m3/eE62Thq0CMG6G2FVcM8+fLZKVSsj9bFURRbqb8
 KcuTyKrclfqiNK2KpPhIKqzCDc4R+D+p4FfmARf0FzXph2PIN+Q8Zu+l1hxABnyz4Oyl
 HLf7/WLEKOwu+L/5Whnp6P9JdyYBACC7IXDlCmF/bK+kAWzUH7fRDRt08kyhzxQ2YKVU
 FZvm082XShDlj35kuo8PVK0L+PP89MFn11DL1wFYVDbENwzAt2Q28j4OZAe3uwBRMTWv
 Z3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lNmBSia75mIPwAkHSmTJYXw/EkvxTwEjwv+x+oDZ54g=;
 b=ZdsCs10HNAdkojvw2mr0HirwPGDtD3FHC64jP+U2D9pDnApOQp/Eotb3oYNRgLInsj
 HiwrRqAOMc+2pqpcQmjC8yhOCilBMPwtPKbgo7W3OAKGWYZenH+aNBNImJJz7MQl+5pQ
 qYuoJzcY7QUuVjz+iOEYpf+ImAhLU/Bw+qv+x5mnxOBaZW1UaXoH0waN+mJjufBVzvp3
 IylhMK+j7WHjJchzGgEEaRV+l/SnR3ZkFoz+oE98U8hybDiM/HbkGG6wC49kOTfvJUcj
 uAiTBi06LgulzUReNJt37SlF/KMxMRHlBhGpv9/rRACJF0AwRI1Bahzxma5fqea0j0Ld
 Ab/A==
X-Gm-Message-State: AKaTC02Z/fBXpEnuBG8TmYbBV5TEsvw+U152RyHXAZekFnat+fdxdylzjD/NvOtqG2Rh3lvT
X-Received: by 10.98.97.7 with SMTP id v7mr233102pfb.39.1479859006074;
 Tue, 22 Nov 2016 15:56:46 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id s2sm47626060pfi.10.2016.11.22.15.56.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Nov 2016 15:56:45 -0800 (PST)
From: maxims@google.com
To: sjg@google.com
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org,
 Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot 4/5] aspeed: Added function to configure pins for I2C
 devices.
Date: Tue, 22 Nov 2016 15:56:15 -0800
Message-Id: <1479858976-139210-5-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479858976-139210-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 23:56:48 -0000

From: Maxim Sloyko <maxims@google.com>

In the absence of pinmux driver, I2C driver will be
configuring pins directly.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  5 +++++
 arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index eb5aaa2..80ebd6f 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -46,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);
 
+/* Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index e00dbe2..b5aa8bf 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -507,3 +507,31 @@ void ast_scu_get_who_init_dram(void)
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
