Return-Path: <venture@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyQ4d6fR3zDr3q
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 00:23:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RWLE+OjO"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id s66so34297072pfs.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=J9OOoZraDKZiVCjXwN9z7vzatF+dn1sAlMHxz+u1kMA=;
 b=RWLE+OjOr+j9oFVvJpRUxhORNEf/TGrvTdr9QMn7q+Z1cwi/cuFtEUZdMa2BifhFix
 42rEwB+36bWmDMX+DfBHgmLrPbjda5d7qZKcare2FMwYmx4t4Ft5+Ycnl2HewLeBjZEP
 cnw4sK/4PsYBD/3e5iPym9AQMm992ermq0K2v53Wf6kKt2O/0QRRpIbqszQFREzBfthL
 ITOfaazQtzl9BU1R3gRW54Z9+6pF7G2xam/8cYEB6jxjIkPnJoL2tADC2fht3D0Irz30
 FZd2gSCCD1FUseniO/oqYWxB4cdRf6og/QM1XfVrTz71LJJ4fSq1Y94g9ANys/ntpirz
 qgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=J9OOoZraDKZiVCjXwN9z7vzatF+dn1sAlMHxz+u1kMA=;
 b=gc8NnOi6p4iZ22+7DCEiRQggAMutvZ5ympD1TODlHzjwzCFnrGkgDYnwkIdB/wo1HM
 OImllpDJ+p98qPPuEHgr8GlyVu3CLtjYnK662JAuympcLj7dTyGM6V7teJCaCpoK7zIk
 GrdSTysOhP7vLwpivMNTii5vcVx4crIj4gI0+gqTTnLLha1z5PxgIppZ6GrJM24m60SF
 sLXVntV9ChaXmmtF+OiKdqMX0CA88hThIKknUsji/hXwP7Zmdd1wI/GsIJPLqhdQweU1
 E5JUeyJ83HlR8dqF+CRMHhHX2OEYJA7d2js9EgBj6jN0yDl5kfWzDspHb4ekeD2MBkRg
 quiA==
X-Gm-Message-State: AKS2vOxq/XMUeAIP0sBuOiOXp8XNksApAh4R3xR0VisrkdQsbMRdS74T
 rP9ixRDpyqwB1ucO
X-Received: by 10.84.197.69 with SMTP id m63mr12222008pld.50.1498659791182;
 Wed, 28 Jun 2017 07:23:11 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id k73sm7364983pge.13.2017.06.28.07.23.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 28 Jun 2017 07:23:10 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pwm fans
Date: Wed, 28 Jun 2017 07:23:04 -0700
Message-Id: <20170628142304.34433-1-venture@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
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
X-List-Received-Date: Wed, 28 Jun 2017 14:23:14 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
v3: lowercased hex address
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
+		reg = <0x1e786000 0x1000>;
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
