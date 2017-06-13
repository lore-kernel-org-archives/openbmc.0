Return-Path: <venture@google.com>
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnP5w5PwKzDqLB
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 08:08:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EzUY/7KJ"; 
 dkim-atps=neutral
Received: by mail-io0-x233.google.com with SMTP id k93so82470876ioi.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 15:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q6z+5DYcVCxgR4HkHTImqveYdSexYsggFNlR93tqShg=;
 b=EzUY/7KJpJXHMnHgrrq+eZGDCX54RzAdLfaZE0XcBsWGrBT3KDe8nSjXm6xh0XEP4z
 9uj8jCCoX9InnC4QLg6WQRB3tapJB2KNmndBKJOV8aW8CfFNbS/mkFHeWluIPHAeIHcy
 RhVsggmPn6W0c1BJO982nswQJXhlH1E6Mnzj79K8ElzwS5/VUKy8zZh8FZbU5x9Wu+8U
 CM87E5/8siGfiI00JOTaVH7Cn2CNgdlzH5HGX1IT8ketu7QaXt4ma8SYRJAty2QNcLZL
 eh1FnqrivX8NgHj6vkgkMr7eKiYj1U9/vDR38KGLrn4sFcjP4grBL3ro3pQAAJT09fmx
 GGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q6z+5DYcVCxgR4HkHTImqveYdSexYsggFNlR93tqShg=;
 b=g3jBZShlSwpW7/VUbFTqdLJpRuO/n8pSfaBFr9XUJKM7WLxRZSkAP59yNRYd/kKn9b
 5aqE5b3dXxXvZT/jHO/XYwtKnuTifq0ruCqfHmn7ngixJPEEV3F1t9d9veMqUTqoNC3A
 D7lazaiOwXfIsLMWmp7+8RlsnXcC+ZDgRKsnfwMseD2NS5CKRc5k8Ul+LZlOyMSegoR1
 Fv7AQtiWXXj5LO8Mrwzvv34kFx3KiB/HtT+7NiSjcknbeZ6ARE/OAzIIPYXPoly7+Vkm
 Oi9kSMMBFvaxwyzEe4ptzdJcbhX7ZzmSVzy56UZNHRA6oWf3OGcNikF02uVejZcyraXq
 eF/Q==
X-Gm-Message-State: AKS2vOyoYaIaXZhC0Fi3PDdKMqB9+MBF0gTygUPXmDEF/T7mKlUS9t6H
 bYCxLI3guYVAI1pp
X-Received: by 10.107.161.145 with SMTP id k139mr2866665ioe.141.1497391682638; 
 Tue, 13 Jun 2017 15:08:02 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id 66sm6726179iov.21.2017.06.13.15.08.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 15:08:01 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/4] ARM: dts: aspeed: quanta-q71l: Risers and
 i2c muxes.
Date: Tue, 13 Jun 2017 15:07:59 -0700
Message-Id: <20170613220759.99854-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
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
X-List-Received-Date: Tue, 13 Jun 2017 22:08:05 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 675281b11e70..4b5047b5d592 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -84,6 +84,30 @@
 &i2c1 {
 	status = "okay";
 
+	/* Memory Riser 1/5 FRU */
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+
+	/* Memory Riser 2/6 FRU */
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+	};
+
+	/* Memory Riser 3/7 FRU */
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+	};
+
+	/* Memory Riser 4/8 FRU */
+	eeprom@53 {
+		compatible = "atmel,24c02";
+		reg = <0x53>;
+	};
+
 	/* Baseboard FRU */
 	eeprom@54 {
 		compatible = "atmel,24c64";
@@ -99,6 +123,34 @@
 
 &i2c2 {
 	status = "okay";
+
+	/* 0: PCIe Slot 2,
+	 *    Slot 3,
+	 *    Slot 6,
+	 *    Slot 7
+	 */
+	i2c-switch@74 {
+		compatible = "pca9546";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	/* 0: PCIe Slot 1,
+	 *    Slot 4,
+	 *    Slot 5,
+	 *    Slot 8,
+	 *    Slot 9,
+	 *    Slot 10,
+	 *    SSD 1,
+	 *    SSD 2
+	 */
+	i2cswitch@77 {
+		compatible = "pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+	};
 };
 
 &i2c3 {
@@ -130,6 +182,7 @@
 &i2c8 {
 	status = "okay";
 
+	/* BMC FRU */
 	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
-- 
2.13.1.518.g3df882009-goog
