Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cJRsv5qy"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylyfr0BznzDr8f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 07:13:39 +1100 (AEDT)
Received: by mail-io0-x242.google.com with SMTP id q101so37676775ioi.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ynKO6lHIpJ42pBphFAZauX/P0dwKg+4d3C68IwZNiUw=;
 b=cJRsv5qy+EqlG9N6qv19slbgwvAzWk+xktAhA0JSRl2AafCouQbhs4KqTwltB5PL9n
 EyQa+8m342P27eqBQSJAI05coOAF4u2XkLd8OuIuG1U8lHQT6GhpjzVatIr1ws2C68dH
 YeqFu2G0iko7G6CeZpk1zKRMxHr24ygUeFCE/82Ic8QBegz4/RtFCiYlwE/FYfLfzjSh
 qJtbZbJQPEfkMH2UZi0Y+JD9SjcUGu2PRbr1YfU89/aQkbpkslzYGdN9J+qe4JUUCSWS
 8wvuM86W+DUzvqJpMWfUlgXg2qKFGWf2GzfK9JUGpeF1c/c/SkYfOgBF5pcpIC/QCSSZ
 B2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ynKO6lHIpJ42pBphFAZauX/P0dwKg+4d3C68IwZNiUw=;
 b=fRV0vOtvV3AwRQ9PoTnYsVB4ZnhSlBsJwscUOV87gJ6P0GSbf8AW75NLzmzODh69JR
 lJoODNdILuahIIcrNhFvTCdyQXu79K3I8CaMB/TkvhyaXlmHkQRO9en5rzrsm+YKtUKM
 /PoruhoVqPpYANJ8JQHw0Wc0h+vA/+oW6jkah8qErjT9yw6O4Vk3Zc3hKg8QT5eezTmG
 5qGpY4lO7IrQE/YEtoZlXm0q07rQUH4EivmN5H86k3Ik2wI+c0TBJYRI+U9XtD2094g1
 /sYiMU5pKqwqkqA/o1uaYpTtMavJXzI2DcK4EK5f3XeO/QtCH4D1eUS+O5Nv8zcJAfOq
 tI0g==
X-Gm-Message-State: AJaThX4GKW2GX7ff5MdHBlE2vxaGOHZjufN/CwJiOYNSgP6x/6m0rbcP
 ZSto5ocAl1ZMFmMYrcIGo2yguw==
X-Google-Smtp-Source: AGs4zMZe4ZAiZtGnig8Q/MkJi0QHDWCZDH1TwD4vOTBp+c0rzxLwDA0Clm70Lin/16fZABysTXhsvg==
X-Received: by 10.107.198.84 with SMTP id w81mr45242319iof.151.1511813617490; 
 Mon, 27 Nov 2017 12:13:37 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id u14sm12097199iou.1.2017.11.27.12.13.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Nov 2017 12:13:36 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: quanta: add i2cmux for frus
Date: Mon, 27 Nov 2017 12:13:33 -0800
Message-Id: <20171127201333.189812-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.417.g466bffb3ac-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 20:13:40 -0000

The memory riser frus on the board are controlled
by a gpio mux.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 93 +++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 42b1d8007316..b93b29191960 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -119,6 +119,75 @@
 			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
 			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>;
 	};
+
+	i2cmux@1 {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mux-gpios = <&sgpio 10 GPIO_ACTIVE_HIGH>;
+		i2c-parent = <&i2c1>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Memory Riser 1 FRU */
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+			};
+
+			/* Memory Riser 2 FRU */
+			eeprom@51 {
+				compatible = "atmel,24c02";
+				reg = <0x51>;
+			};
+
+			/* Memory Riser 3 FRU */
+			eeprom@52 {
+				compatible = "atmel,24c02";
+				reg = <0x52>;
+			};
+
+			/* Memory Riser 4 FRU */
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Memory Riser 5 FRU */
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+			};
+
+			/* Memory Riser 6 FRU */
+			eeprom@51 {
+				compatible = "atmel,24c02";
+				reg = <0x51>;
+			};
+
+			/* Memory Riser 7 FRU */
+			eeprom@52 {
+				compatible = "atmel,24c02";
+				reg = <0x52>;
+			};
+
+			/* Memory Riser 8 FRU */
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+			};
+		};
+	};
 };
 
 &fmc {
@@ -196,30 +265,6 @@
 		reg = <0x4f>;
 	};
 
-	/* Memory Riser 1/5 FRU */
-	eeprom@50 {
-		compatible = "atmel,24c02";
-		reg = <0x50>;
-	};
-
-	/* Memory Riser 2/6 FRU */
-	eeprom@51 {
-		compatible = "atmel,24c02";
-		reg = <0x51>;
-	};
-
-	/* Memory Riser 3/7 FRU */
-	eeprom@52 {
-		compatible = "atmel,24c02";
-		reg = <0x52>;
-	};
-
-	/* Memory Riser 4/8 FRU */
-	eeprom@53 {
-		compatible = "atmel,24c02";
-		reg = <0x53>;
-	};
-
 	/* Baseboard FRU */
 	eeprom@54 {
 		compatible = "atmel,24c64";
-- 
2.15.0.417.g466bffb3ac-goog
