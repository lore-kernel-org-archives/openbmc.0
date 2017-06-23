Return-Path: <venture@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wv12P1YLzzDqjD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jun 2017 11:24:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eHhaKDkE"; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id q86so16511770pfl.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2017 18:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=kOu+Rfdpm/1iT3+zDcCHVHOa2qEKUyzL1mocytIcFrQ=;
 b=eHhaKDkEyi70R478E19FIjPZ7L40DpB04aRs+nyKP1Jch0lrCXGu2TuLxQZiCnvCYk
 3UaW+DcK7GvqXoxgAiuUTCY3plpMzIZfsm9pbSwjc+sfcfuwpiUIW9O/nawlnEMJzcXH
 6ROH8+K4Bdrh7LWeq+7yGnHay331QEE/we+gEcTZXCouoLcDyqMQgmSXW1Rg8WtJGbrW
 PGqyACCrUzP4GYwlC6A6mrCA2wPeIfRJjFvjo9CknO8ZHR4u40l4VWjTz5AvVPf28OTt
 jGIAZMwT+qZbAJwOjmPhiK9b8Ex5k+fwjtNskkUtS7HqbbVkxwRRERhT1RNtC6GknIz6
 dzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=kOu+Rfdpm/1iT3+zDcCHVHOa2qEKUyzL1mocytIcFrQ=;
 b=LpVv4Z84xULqIPX3BdHW/2vXa5X6EoQxwY1Yb2Kr/8F3wnELhoC1qfz4Oy87tGAEfM
 4iHKbaR3JfAyY8IW9rox8eEXw2C9/mLAAAnLRSMzdKgm+mk4DyYaGSGrHBZWqvTrnNZA
 HGtrmt7lCOB8s+9Vjbj21alXzLpeqZ2q9+eHNIyyT0W4X4ZLCBpoNm6MOnuQp+w81YtY
 Yf53HefrW6L4AWBbWHwJjoPHcryP6dN9sSUWx7qEl3dpWDbrQ0wp0fil8XjvjSnriNIl
 WtkETH36TBqXRxJkRuyJeXyI47F6elaz4B1FsVWcyd6VfED9FBq/7NE0WykL5yWc4dyj
 R+hw==
X-Gm-Message-State: AKS2vOwlkcJEgiI5catj8iaN9BRP02QJPkxMXKD3qzWHDMDQ9KsC/FAN
 guxaUs6mfNafuWZD
X-Received: by 10.84.224.133 with SMTP id s5mr6003196plj.93.1498181066172;
 Thu, 22 Jun 2017 18:24:26 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id d19sm6249106pfd.35.2017.06.22.18.24.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 22 Jun 2017 18:24:25 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: Enable pwm fans
Date: Thu, 22 Jun 2017 18:24:21 -0700
Message-Id: <20170623012421.63639-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
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
X-List-Received-Date: Fri, 23 Jun 2017 01:24:29 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi             |  6 ++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index e609c53d58f5..3abc2954d26e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -46,6 +46,57 @@
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	pwm_tacho: pwm-tacho-controller@1e786000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x1000>;
+		compatible = "aspeed,ast2500-pwm-tacho";
+		clocks = <&pwm_tacho_fixed_clk>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+
+		fan@0 {
+			reg = <0x00>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+		};
+
+		fan@1 {
+			reg = <0x01>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+		};
+
+		fan@2 {
+			reg = <0x02>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+		};
+
+		fan@3 {
+			reg = <0x03>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+		};
+
+		fan@4 {
+			reg = <0x00>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+		};
+
+		fan@5 {
+			reg = <0x01>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+		};
+
+		fan@6 {
+			reg = <0x02>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+		};
+
+		fan@7 {
+			reg = <0x03>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+		};
+	};
 };
 
 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index a998a00a2728..c93b0460cada 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -184,6 +184,12 @@
 					reg = <0x2c>;
 				};
 
+				pwm_tacho_fixed_clk: fixedclk {
+					compatible = "fixed-clock";
+					#clock-cells = <0>;
+					clock-frequency = <24000000>;
+				};
+
 				hwrng@1e6e2078 {
 					compatible = "timeriomem_rng";
 					reg = <0x1e6e2078 0x4>;
-- 
2.13.1.611.g7e3b11ae1-goog
