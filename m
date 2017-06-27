Return-Path: <venture@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxnHB1mkYzDr27
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 23:45:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ex4v4z7+"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id c73so16881938pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=D2aDs+LOHJVZf1FEaRLYiqmaKdwfJm5W+vPfRKaeO+0=;
 b=ex4v4z7+Yf5M+mMFcXIqLMTovn0iVL65m0V8mI8xlc8xOOJ25E481A0krnOK+66wLX
 m8IESG253k/CI5zx4rETy5Lyg2JDs50WY5OW0sPAsES9h0WkMlM7E7PEXGmXWr9RQmKq
 5wJHEadcnsyPY8oTdgs2GVJKc6AIdw50A10p+wp/qKSdT3EYCXcDD2Lfykg6XbSFV6M4
 F/KPgNliCuWJ/elOynxTTQ1GwdGt+JUKVTzH4OAN7dQjs1hYLQZWb9DxVyyNSCcLwYDo
 e4qlXOWexn6RU+o2N8UUM6I24nwNXcKjb2MOg2DeLWbWPeom8SIemwRl3oSR9oFbCsVk
 vndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=D2aDs+LOHJVZf1FEaRLYiqmaKdwfJm5W+vPfRKaeO+0=;
 b=luLLzmOR2apJ2kvPUJCAaBfNCX0Mg76SIZcHU5qyqZcs9SE1tJSwGYdz7Mi3XgN1OJ
 c4305zxQJ4MRKfzDY81eCYtLqat48Jj/yummXKwfLnk7a6+uyLr7MA8cCa13x2XcKiDw
 5vqUXAOlEghkwdm/3fsaNKG60krct0vQ5Z0eHGs8MuMfpS8E8+60D9HOmQF5/uEbllUO
 /WINTEhFjJxtpoWC8xgYi0ZgYpkk8Jh1bZuFhNBJPqn4cF1HREN7ShiQEE5N7XHfcNns
 QSpDhXE7sRPYrxHMQYndWtDlMiZl80yCGNjb2LGLdCx3Whdh7MkkC4AnY8jbB/yRoOvm
 3Lxg==
X-Gm-Message-State: AKS2vOxpUyYHho8Lxls7ba12SwEFXneG0Lo67YFQ3to9W0JpEAMgdsIR
 XKeMShN9wmmaTPtoWpCV6Q==
X-Received: by 10.84.172.1 with SMTP id m1mr5857207plb.174.1498571107060;
 Tue, 27 Jun 2017 06:45:07 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id o1sm8327325pgq.10.2017.06.27.06.45.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 27 Jun 2017 06:45:06 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: quanta: Enable pwm fans
Date: Tue, 27 Jun 2017 06:44:59 -0700
Message-Id: <20170627134459.125774-1-venture@google.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 13:45:10 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
v2: Moved pwm_tacho_fixed_clk to clocks.
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi             |  5 +++
 2 files changed, 56 insertions(+)

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
index a998a00a2728..9cc959fccfa0 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -36,6 +36,11 @@
 	};
 
 	clocks {
+		pwm_tacho_fixed_clk: fixedclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
 	};
 
 	ahb {
-- 
2.13.1.611.g7e3b11ae1-goog
