Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPKnF1dZczDvnn
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GkldM+Kk"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 3so11572020pgd.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fJcuAejCaXhUj7AcIqTLN2b2rXUS/iQYOZE72+g5uBE=;
 b=GkldM+KkUDAA+JkQYTYjmz2YlZUdyi5g1ozMAkulUxFChQhfDgmwn6RxkLyMa+l884
 mLwrRpRC1EAfbh0Kc5UtnGbCM2L/34FEiqqHfu6b0t4GRFjcJtAWGFOE7j6dcz1K2jd7
 F9aC68Ft0nasXPx9bPoEjQzqOYMUOuruBKZPseaUmjlA/RDMZzibj6NKdonAiaWSuv5E
 54gnaJ7iTUaDF3ETj7g+bj2q/0SAtoldA9bDB/GYsx0mqioHlxG0tIF09tUiz+bIbkFn
 im047xBGS/Mtjo1WET9s4mzRkN4LD2CZQ7K0X2jy9gmREkIvaVUTzlczVQ7RCiOzE/m7
 OFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fJcuAejCaXhUj7AcIqTLN2b2rXUS/iQYOZE72+g5uBE=;
 b=CSjnt/FjhrZLutkw3SV+Rqa2ya1jqB/0X3w9MLD9o2DX/PYcw2C/QaDDfTAAyH9DtE
 rquGyOXAZ9T6HuNWLjx5EAh5MKbjBak9L2Ujiy3kqFD0HTmkDKlDKLU90sTw97vLIZC0
 dXVsNK5qZ2apgKOmjZWavLeu+0u4qOBnPboL4XOQHG9Qs8lvnT1L7ZFnvkzwDr0LW6yH
 3hu2GDZjr33ym1Czu/b0ogCfQw7q3eOBN1gcBgx/bhRXA3FTTc1nOA8hySVM92aQc9Y2
 pbTYx8kmMEXbQGTb32ekIcDD8Z8VNn1T7LJQShgkhC32ZDTD4imRUvYdiKkEVN/mVCe0
 oPxA==
X-Gm-Message-State: AKaTC00t0BzAfAx/riHVTz1ZYntguW6cVI0THU/SEEqX4OPDSr6q3WUTQwKb9jZnJobXnbJ8
X-Received: by 10.98.23.88 with SMTP id 85mr5536357pfx.21.1479947311235;
 Wed, 23 Nov 2016 16:28:31 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id d1sm55255435pfb.76.2016.11.23.16.28.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 16:28:30 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v2 3/6] aspeed/scu: Add definitions needed to configure
 pins for I2C
Date: Wed, 23 Nov 2016 16:28:09 -0800
Message-Id: <1479947292-121635-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479947292-121635-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 00:28:33 -0000

Add missing definitions for configuring I2C pins

Signed-off-by: Maxim Sloyko <maxims@google.com>
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
