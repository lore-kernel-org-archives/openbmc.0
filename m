Return-Path: <openbmc+bounces-1740-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDD10BA423
	for <openbmc@archiver.kernel.org>; Sat, 28 Mar 2026 19:15:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fjnKB2vWMz2yh4;
	Sun, 29 Mar 2026 06:15:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774725326;
	cv=none; b=VbzzF+J+yVghecSK+WVlCjcGipKx/xq3/8e/OknACdQiaGWIPlysfJSadtScx1G5g9KMdVvbcICRaJFtg5Ft9yk5RDlrDPITlR1QxZNSLmhH3Dd0nbPHNBLPCnrSqGAsVrctbac7G9YbfD9iLutzftGAflFV6OIhNivbytv5XJxBsbcUZi4kOE/RNCUb+uNYB0iwKVKI7mKLth5Xm2nRh0JcgkJPu9T2QTdLc0sQJrC6eF6vxeTZnbKqR+rG0Mt4XwsxnN5+SAzTbQDlWTqnfmqj2rkcyiRp8pNnYRb9e9DA/CUohRGkmyT1HCjgRYDOhdIrWMD3yqZXtFqISaAg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774725326; c=relaxed/relaxed;
	bh=6IJ8YoE11tVs3LNb7UXpBr9FONR77QLAzD+LG42p7+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y8udPG+OdJZh1fmfRwC8pr8el5cmSVAytg805qS3sgdz+55k4ukXAC4TatIU1FB7CcJS0Ffj15AJ884ejsZkcjetg1Mm8MmV/xELXy0plvvENp0e/45zzPc/MVZPFGwzikqLcokv7PSiI1mszzfljPMESAUIJVbzQDTzckIBYwaHTHStf+Bir6etJ64HfBFpUnX1Iu9okJOtNcxFgce8BEollctZpvztFy1Rcr582mMir+qfqje0taZDzzQta+/7CRRH+AXSkOdx+UFPG3zOUJ+IH5RKbN8IjwHqQFkS1lzbipIRRsZAxa1V3sYhIJE95IgTRq858kKYGP0yzBszZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TVbdVdLU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TVbdVdLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com [IPv6:2607:f8b0:4864:20::b136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjnK90bwcz2xN8
	for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 06:15:23 +1100 (AEDT)
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64e9f9226a7so4061304d50.2
        for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725321; x=1775330121; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6IJ8YoE11tVs3LNb7UXpBr9FONR77QLAzD+LG42p7+8=;
        b=TVbdVdLUQexD9gRAxPVnDxCcvuJs2PWq3CXCwnNEnm8AR/41+T1koQrsOoQIB+Lfe8
         IgK4qE3RYeDNzmoMGZLaPc0zKyOuY2rvgIJPNtRH7PS0dQfpB07h6z8G06HMjvoISS7O
         jwRhhYulGs4ZzWjU9ZmGFXUcMWuapI1aTxGKMO8sWeCb8do5TTtvNeGicxnUnZuhE2Sm
         /pvkoZ0HWcXkmeq58PgI5NHAVqLy5FBiKptg2LkQY/hU5lcPUc1uIWP4+kTCKqtvLUGx
         Hbs48ZPN2P44Q+7tPnYL60BWxQtofcmaNanag5/1aAxsDY8fU7zWCdjPoSWTFqi4bPbL
         EX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725321; x=1775330121;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IJ8YoE11tVs3LNb7UXpBr9FONR77QLAzD+LG42p7+8=;
        b=igXytl+S4W/cYp8/Gbm+YkuLvPclUnb4OiJTn/Kf8+t9s3jM4ARstRn7jAdfcERgLT
         wWOFuKEXaYBzPPal8xJzWiWp5r2EOCpERPG6f9nimoNR+I7DqXh/yR9XgOZE4gTVHFK1
         lQwIl42awawnkslZK+Pk5wHCoCvc3BDddhd/0SkVR3MxmNTMVtM6S2mQw2nIXdKA5yIz
         ow/MO5/1lKAYdAt05PZNSwYfnO2qU8zAQiXoVK+snhLRm0bRIpnWLadUKuXOrKLJZVrV
         BNjOjKJggc1lbu9fxYYmp5gHWqfMCoVce+z7/V6SJBVs9nYSltZdbWVwelGngmGdnUE/
         epgA==
X-Gm-Message-State: AOJu0Yy4aZ4Kj4YrxiurkBo5Zy+Snvdp2QX3nv9ZWwJ1oG2NHtu6v8hV
	u83A93Za1z+2iPdCQAgP2MvB+jlleyWa3Miq1Gvap2vVnlGyT6ABl7RD
X-Gm-Gg: ATEYQzwQd9JEwG4kMrhGflVmPKARbcQALSYHmdt+H8miYKsz2my4tsj2tRq/wbzCaJ/
	Wp36kdX84IeX3wFC6wflNv/9HmCpUUf0fcdw4oZy8DGcudK9gzkQ2UMMy9mLEv6+Skcmy8pUH6E
	YqjfGhwFQigTHOdws8UUtGULV632JyH5eQwTRUe4FL+C09qpuRiI2HVbnEb7fIjf3ENxEEJynwC
	Xf6LVd8mu4Be5sWiHClu9R9lW039mWMfl9hAh3//4rZGOpkH0kzpTtVFSZpRSRDGkfw/Fa68oPE
	LCoMb1xPJW6e6/8hrNv0uGZVa75SfgtipJdS79CUCuKSbqtdrcMsWY1tYq8ZtPvTJt/TzSqF51b
	GdQFKAMTdGsAAWmFRrKXK0/pE/7fwkqGLP6ZKdY5lgF7Ush6PJLY6eg4u6kbhqAHNo+mqVeVjaG
	hpq1cqIHjj7BLkFc6v4ADOU8abGOY=
X-Received: by 2002:a05:690c:d85:b0:79b:e346:fd07 with SMTP id 00721157ae682-79be3470334mr57650137b3.33.1774725320806;
        Sat, 28 Mar 2026 12:15:20 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-79cb7c05b88sm12902227b3.20.2026.03.28.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:15:20 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Mar 2026 14:14:26 -0500
Subject: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI
 card
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2TVlY0rryf8wHAqtsNGypgWiI
 fy7DXePbybzZoMcEocM12qDFFbOLFMBOlXQj24aArIvDKRIKyKDLi8ZnxKjm7yg9eHiddc01hk
 om3cKD/4cvjss2InM0JZ85DxL+h43a320f4xrjTVaR8ZoUspqfxui49e5lwjtvu8/pwU3NLIAA
 AA=
X-Change-ID: 20260228-asus-kommando-9de4d6b779a8
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.

This version of the DTS doesn't support networking due to u-boot inserting
mac delays (when it isn't really needed) and needing to misconfigure the
phy-mode in linux due to it. See discussion here [1] for more details.

Networking can be enabled in this manner currently.

aliases {
        eth0 = &mac2;
};

&mac2 {
	status = "okay";
	phy-mode = "rgmii-id";
	phy-handle = <&ethphy2>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_rgmii3_default>;
};

&mdio {
       status = "okay";
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_mdio3_default>;
       #address-cells = <1>;
       #size-cells = <0>;

       ethphy2: ethernet-phy@2 {
               reg = <0>;
       };
};

&scu {
       mac2-clk-delay = <0 0
                         0 0
                         0 0>;
};

Once u-boot is updated to not insert these clk delays, the scu node from
above can be dropped and networking should work in rgmii-id mode as
expected

[1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
Changes in v2:
- Drop ethernet node from DT
- Add info to commit message on why this was dropped (references to
  linux kernel discussion about aspeed MAC driver fixes) and how to
  re-enable it
- Link to v1: https://lore.kernel.org/r/20260228-asus-kommando-v1-1-9a288620096d@gmail.com
---
 arch/arm/dts/Makefile                            |  1 +
 arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 71 ++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70..fa6837be747da4fbe102ac27e60ee3d81e230cb7 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -682,6 +682,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2500-genesis3.dtb \
 	ast2500-romulus.dtb \
 	ast2600-ampere.dtb \
+	ast2600-asus-kommando-ipmi-card.dtb \
 	ast2600-bletchley.dtb \
 	ast2600-dcscm.dtb \
 	ast2600-evb-ecc.dtb \
diff --git a/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
new file mode 100644
index 0000000000000000000000000000000000000000..52ee7484ea3019cecbcb6b521a2bc418a9122002
--- /dev/null
+++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "ASUS Kommando IPMI Card";
+	compatible = "asus,kommando-ipmi-card", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&hace {
+	status = "okay";
+	u-boot,dm-pre-reloc;
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&uart5 {
+	status = "okay";
+	u-boot,dm-pre-reloc;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};

---
base-commit: d40130c7056b84dc5213f3ff6764d0e45bb84035
change-id: 20260228-asus-kommando-9de4d6b779a8

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


