Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3TxR194dzDr3s
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 06:34:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFSQJtpz"; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id 16so1859306qkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eNnBnf4I5P6m1+GlePB104fkvy7RB/fMLkb/bWQl5gs=;
 b=VFSQJtpznsewFuTXRjZkcLbaWX0UF9MacZkWIlRdiTiICLdTdzXAhUZbgu3AD6DoMb
 vBMrCeqsxq2dGl1CMn0+8c6X0TF5G8xDwOxVT1tVLjy5CbiVGVVZmnfEgWRt9hrUd9dt
 YbNaEoj0ybYHaaKm3UX9kSLMKvzd+7OdsP7dT0VWdNrh+yU00Say1cSljc2POcwSw7PJ
 FZZvdX9JSsi0+2tfzGlwr/L1nOAl1sqQ8PFqA3z8Uhxx7WDlMVkqgxmf1kAcFOUxS45V
 I/mdzgjghZC/22DWVQWVtXwbWOmYqUGXS940i83612S6IAOk4gU92sFjoSaIBg6Gwx4y
 /TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eNnBnf4I5P6m1+GlePB104fkvy7RB/fMLkb/bWQl5gs=;
 b=ScR+qPP1ADKjeYtuP3W8DjLcg0KqYZJQ83me12NL7Y7PEQng/QUy+CYOBIpy5Gq3Fx
 ryojaCdLP2oV+9umB1IuXZxun2ofD4MjUeWnVDEGVMr9vjCWgAqNzHtLhGX12W4+qzvI
 me3XvJqHg73eRO+Xp2mLMr08eBgHzcYDQzbvdmc1fa048aaVG+xgbuGH20OVgozhz2AJ
 +OfJVnHu4M3v5WXhdXdQ2tFqDS/eK8Ti54jeMi0xCqcvvqr591KYCV/2MS+PKn5KX31m
 G353kJjz3Aw2oOtYMDqlmw/wbS3BQ7RaOA75FQP2a8HXjwELUQl4KhoVnp0OscVFciaB
 zsig==
X-Gm-Message-State: AKS2vOypmKwbupjo84k+ZZhBcFWwbo8rlGRtYD9vybnMpIsltCEfQkL/
 FHInPwa6v+vhHA==
X-Received: by 10.55.18.225 with SMTP id 94mr58317849qks.251.1499373272006;
 Thu, 06 Jul 2017 13:34:32 -0700 (PDT)
Received: from gfwr703.rch.stglabs.ibm.com ([129.42.161.36])
 by smtp.gmail.com with ESMTPSA id v47sm982304qtb.11.2017.07.06.13.34.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jul 2017 13:34:31 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: joel@jms.id.au
Cc: Brandon Wyman <bjwyman@gmail.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Add fan card PCA9552 to
 Witherspoon devicetree
Date: Thu,  6 Jul 2017 15:33:55 -0500
Message-Id: <1499373235-5412-1-git-send-email-bjwyman@gmail.com>
X-Mailer: git-send-email 2.7.2
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
X-List-Received-Date: Thu, 06 Jul 2017 20:34:36 -0000

The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
is used for fan fault and identify LED control. Adding this chip and the
LED lines to the device tree.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
v2 - Add required address-cells and size-cells.
     Update aliases and labels to match up with MRW XML.
---
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 31315d0..45e63ba 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -203,6 +203,56 @@
 		compatible = "infineon,dps310";
 		reg = <0x76>;
 	};
+
+	pca0: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan0: led@0 {
+			label = "fan0";
+			default-state = "keep";
+			reg = <0>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan1: led@1 {
+			label = "fan1";
+			default-state = "keep";
+			reg = <1>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan2: led@2 {
+			label = "fan2";
+			default-state = "keep";
+			reg = <2>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan3: led@3 {
+			label = "fan3";
+			default-state = "keep";
+			reg = <3>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		front_fault: led@13 {
+			label = "front-fault";
+			default-state = "keep";
+			reg = <13>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		front_power: led@14 {
+			label = "front-power";
+			default-state = "keep";
+			reg = <14>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		front_id: led@15 {
+			label = "front-id";
+			default-state = "keep";
+			reg = <15>;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
 };
 
 &i2c4 {
-- 
2.7.2
