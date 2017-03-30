Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtmjb3v1GzDq7Z
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 12:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IpeGqWdM"; 
 dkim-atps=neutral
Received: by mail-pg0-x22e.google.com with SMTP id 21so22982791pgg.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=3ENEL9CvnEH9WDCVQXqH0ZumkA/gnQlYNfZjYeG9yAY=;
 b=IpeGqWdMrN8qOicmj024GU2jL1BT4iRy5oXIXTsfrTE7d5py8x0WK1JMG2jm6zAkNs
 r+SmR41VMJX8u5fl3dXa55WO8z4k+crReJ3s/qE91tcKJQmnluK9DnQ3CGIA6Y68RT0P
 30B6DupVFSmO393CNHxEyrt81n/0Q8NHRQflmEYx/IKURb0wggzKltEBrRYfEvfcIAdo
 y2uKQJ4Q5V7egmarE729wNMMZmbuH9nwHG6S8iA25R1HZLNTzLW9N2D17Qw8agZpoQM+
 5soFeQ0bwDzkYIFjCD1Lg68dsalhAHatqWbP9rTKX46X1elbGvGIcIiuQvMoS4vZp92A
 q/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=3ENEL9CvnEH9WDCVQXqH0ZumkA/gnQlYNfZjYeG9yAY=;
 b=Ts56CjNfR6hDcHF4Xn/joBGvchof+s0sJcBDyZWosn5zdsw29Ioy51eBNoXjwp0i4+
 eQY7Vw5tvoedWlSdR8NVq6SY3JerbS3GR5J/duJeWZowrI+UlPpr9kSkJfIpY1O90tCi
 npFWFOaG+cYBl3FlCLVgFDK+nVYZRxWKQRy4aluq3L+U6HMEPMfDmOH3z2++gFb2TrHC
 jpcLBkwzQofPN+dy7TqfaK5HbL/f/TGHz1Wxd+gIhi1q/tG4/k9M2+drd+A+q0wdpQyk
 uC67Xo/FySudUghIu3db8VI2lZ9N1d27ndmff82/C8uij/YDp5/9nRkmhuTJ38A021Ct
 ujhw==
X-Gm-Message-State: AFeK/H1bENpnizgk0jnkSScgsTCY1ZnhK8Olj+6oJsV6dmFmorvFiAwtbapcJTMyIF0EJxO1
X-Received: by 10.84.205.70 with SMTP id o6mr3803527plh.63.1490836128885;
 Wed, 29 Mar 2017 18:08:48 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id j188sm515566pfg.27.2017.03.29.18.08.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Mar 2017 18:08:47 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-4.7] arm: dts: aspeed: Describe ADCs for
 AST2400/AST2500
Date: Wed, 29 Mar 2017 18:08:46 -0700
Message-Id: <20170330010846.6394-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
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
X-List-Received-Date: Thu, 30 Mar 2017 01:08:52 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 28408a2e2ad5..e5be87076a6b 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -840,6 +840,13 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2400-adc";
+				reg = <0x1e6e9000 0xB0>;
+				clocks = <&clk_apb>;
+				#io-channel-cells = <1>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x8000>;	// 32K
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7c09a26eea6e..48fd068251d6 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -394,7 +394,6 @@
 						function = "LAD0";
 						groups = "LAD0";
 					};
-
 					pinctrl_lad1_default: lad1_default {
 						function = "LAD1";
 						groups = "LAD1";
@@ -1019,6 +1018,13 @@
 				status = "disabled";
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2500-adc";
+				reg = <0x1e6e9000 0xB0>;
+				clocks = <&clk_apb>;
+				#io-channel-cells = <1>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
2.12.2.564.g063fe858b8-goog
