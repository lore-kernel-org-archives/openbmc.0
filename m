Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::243; helo=mail-pl0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHPpge0M"; 
 dkim-atps=neutral
Received: from mail-pl0-x243.google.com (mail-pl0-x243.google.com
 [IPv6:2607:f8b0:400e:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cHbb47ckzDqk8
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 15:30:02 +1000 (AEST)
Received: by mail-pl0-x243.google.com with SMTP id f6-v6so1829695plo.1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iG9z+r69zGkg/nBQp5+TDujWUkhRfdl9IRPpXRU/8LA=;
 b=hHPpge0MLXzaZ7rB7m/YfSwT1Z652XgVqs0P9BmRC7Aj4xW5mh88+JmgOi7LTbMrfI
 HUOPgBfy4lPXn2BF2Ouqe61DFHEfHC817BSweyIfBiKtfdpNmuVgs32aSVbH946RS76x
 mNd94QqUcqeRoyLQ/MqAnTwSyOGPUpPO5we9QGHZ8KAEsLxH1wEhLMb8Y07zFZBXmUt6
 B5D5QAEGzar5s6X4furGAF8FgHBP3FKi9PtsRm6jRYB2I6WwOmByTpziO72d+ZUdjplx
 yqfAfhliy+QoKIJ5rGaU57S6DGX+UVpII6wCFvg8k5dyKpCHe3pj12VltCTQ58bKw4uy
 4Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iG9z+r69zGkg/nBQp5+TDujWUkhRfdl9IRPpXRU/8LA=;
 b=PipS5wYs3mw+RPyKmjR9Dj3O781choADnX333uv6qXuAlP0Btsm8M8PxBxF2Yu4QiN
 zqjUBpXXbXaLslZ3Ib/fyNKX+bIjqqpsBLxmSEXUlLm6B+V73f37+/rYEUYoSmlQHekR
 MCAZfuZMieMJ5q0l9MC8Y+S15Sr5a8BgnvrgoOvxlcLPR8IVpbPLAJ0iJJANmiK/6koO
 Cdet3w1BXYNEndtFFUidejPVs+Dd4E8QSzk9O34AZHPnu8+v06X32PDu2dMwNqsnMw4J
 HEpC47EIul6gbr0snVj2njgXHTV2yI4CYV2lrn+65eiTuZgQeFrLOMh7Tc2CtfMxJLgP
 RSDg==
X-Gm-Message-State: AOUpUlEdLmYEt+Aa/SBnduOQJnXdkbqM3J4lQGvWocFIrof/8+vQDp7Z
 jZJG5Z31YIv5itWK1n09H7F1ZHyE
X-Google-Smtp-Source: AAOMgpdQ/mawlqL0jBYcuEkbhdb46AZfUZwdWRwM72QYOO+fDBT7G4gwN2oOnuaKqAg5LIOeTWoasw==
X-Received: by 2002:a17:902:1:: with SMTP id
 1-v6mr4687159pla.167.1532669400274; 
 Thu, 26 Jul 2018 22:30:00 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id j71-v6sm4498310pgd.23.2018.07.26.22.29.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Jul 2018 22:29:59 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17] ARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
Date: Fri, 27 Jul 2018 13:29:45 +0800
Message-Id: <1532669385-45493-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 05:30:05 -0000

Add iio-hwmon-battery using adc channel 12;
Pull GPIOR3 high to enable RTC_ADC;
Enable adc to make adc running.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 852b552..461564c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -83,6 +83,11 @@
 			linux,code = <ASPEED_GPIO(Q, 7)>;
 		};
 	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
 };
 
 #include "ibm-power9-cfam.dtsi"
@@ -236,6 +241,12 @@
 		output-low;
 		line-name = "seq_cont";
 	};
+	rtc_adc_en {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "rtc_adc_en";
+	};
 };
 
 &vuart {
@@ -304,3 +315,7 @@
 	status = "okay";
 };
 
+&adc {
+	status = "okay";
+};
+
-- 
2.7.4
