Return-Path: <openbmc+bounces-1996-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1444DCD5BC9
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 02:04:08 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPbdV24M3z2xPb;
	Tue, 26 May 2026 12:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779761021;
	cv=none; b=UMoEvbMEz90Id1VikMLGDuC0ZJT1Qbysyo2/hhOg5VM//DgaZQIE5FxOOu6YHFQYvkQOPXcnW5NMrGxW1D1JNLbRsqRZKhrDoGVWpwyE9Nl5yGnAgtCQLmFxuVafeH6Mn+enBVyBTgj4ynwRotDLEvgyDSttTUP0lyBJ3BKicmTSD/9q3AuRD/R/kMP29bs2fZQpAh/bUVEP/Dnj5sCQ8fZclcI2YaEXFXFK0zcuWIe/zUauWctKzPUCCPJz36+oUuZ2DFhooPJosAC8hh6P2JIMbcEAx0cZV0L0/UmssjZC+oc6Aajy3BgAK3We7fbS+w8LtSy1klkhLuqpiApelg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779761021; c=relaxed/relaxed;
	bh=7vrHqZ8pdOthFWl6cEHWN6fXQMLzs94TQsFPENb27c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOoHc+fhhgDWhmGCqQMO/DP6ydA0RGACw9rhSU4FdV4Mc9jqzZrW/yUfY2D2YhiqtD+zZ2Y2MHt2pHBy2KNB3m2DiGJPXYjK1vQtv+MvFdOvI2iCasOB+kVqM7yToge4m24g+q4+TZ+VHBHP/9BDxBxAgv1soqOYwLfB0Y6hzEz9SUxVLgwaSGnDfum7kknstUK30hYHv8SMdYNy5ctuUlBNJ2VkqFVWwT9p8sMlK9XJTuOx5KvAJA0gk7ZDsSW3KoS/Ic6iJF6ij4TdgXBXQgj34C/KsbSHwNGig1KulRPOSguP4yzqQVVvXqnXZtF6KnQU9CucMo/D9MJnTzuLYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lcu1WT0c; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lcu1WT0c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com [IPv6:2607:f8b0:4864:20::b12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gPbdS0dJlz2xjQ
	for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 12:03:39 +1000 (AEST)
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-651c366f7efso10212869d50.1
        for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 19:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779761018; x=1780365818; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vrHqZ8pdOthFWl6cEHWN6fXQMLzs94TQsFPENb27c8=;
        b=Lcu1WT0c3KPuH5ovjmcIgI68Fdduqbv4izayDau2iHOj0lwnzee0TLmPK4BW9eI5Ve
         0p7ZMWxJJ8Gjgr34MOoGc3jnqpTmLtYpmVMdiBNldqJtqc2Y3yP1txhWjK7vQ1MPTR04
         760Q+WWA6GxWmZROt54s7+xh4X6ZvfqHWQVLjAlt4U86jwZ/uOzF58FOjX5oVJExw649
         kF5iPFEn1V1+S+bzOscE5wM9vHLsE9H+v8XlwsAgqSLI+PtdiTlBrrzGXqg+jWH/OG8b
         Qi5QikA5D45n+f0mEDAajF0nr0Fc2hMrnLeBknJUkRW60u8LsYXxhiTxCAfZkhOG9TpW
         6C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779761018; x=1780365818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7vrHqZ8pdOthFWl6cEHWN6fXQMLzs94TQsFPENb27c8=;
        b=skoIvFQgZFRM62qYCQth7wmsnsc0EoP+SVHxdeK7muhrT2dZ0WqcEgCC6g9E6J2dQU
         pJomElrbukOp2vATf4D1+J8AQZtMJ4A4tnff0gUaGRv1cLublVJmDIhrFyNsuMEhDwcQ
         eMkVtcpCDy6EgzMe3wesT2TyfWrnFqxemHWVdzqD2u8dFPbJDcqyHs5MJ2BKQ7NVDLBm
         8RGlw+6XlB2gzyKBaaDrvpxxHwN80P5aufB9yDJ2Gdf2/wKGeaxrA7D3Y2NtAR7N9Ghq
         zPlSpGKa8Sa4v0CiIJ0t5a0zZOgSpH2oDaQZ3YNRA3kWTtgREFA5QfXPo+nsNTk58ACQ
         NyoQ==
X-Gm-Message-State: AOJu0YzKUUroo9tvRw19runoPsmpjxSzOkECqACdIbv0rpbV/+L2nJBn
	2W2TKBAmxJMVrX+02x3ETzvQOAhI/LvSgQrtEj99XK2fwgj7DGXquhwt
X-Gm-Gg: Acq92OFh6Sy0sjsj1FK0KotEllm6OAtQ/cOYPn6c/7cegJPaO+D2VwlFkYuGiCiBuYG
	NqSza67bVgbKPPZQuO6j1AQN3CJ1ogVwzkbmNz0K2auzJovyx6eh3wh/YW6C96YAO2n2aIEwomI
	ZHLMrmaF5yv31KArtxlbrFitN1ZaAHPQYZ7Ql7/EDqzRStiUHN3mfJO+SQkXUcx2W5jmjxBEe4C
	5fRl5IUVgLyVs6h5pbFqLxWxiUcMtzhtigNTwCQKrWH2wtXBhbDWXe+0ZP8fKidm2usbiirCPDQ
	dv3oQGFehdwPO5cRKQFY7TERHTDySG0MvWLK1One4yC5SPfITBwHG9hVSi3XC1Gjgx2iKgniYGQ
	tsVSBoWkF5aDgJNtosJeCC+XQQ8nORrhnekf6tlAPwWB6DFmWU0LQcHAZ857/WFUUlsBxjIIPa9
	zhY4E6QdiDoilp6aXozyWTitMFwMWW18NoudeX
X-Received: by 2002:a05:690e:13c8:b0:653:1b1c:1dae with SMTP id 956f58d0204a3-65ec96129e1mr18184788d50.11.1779761017917;
        Mon, 25 May 2026 19:03:37 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0:cdff:ce3f:ce69:17a1])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-65ecfb62626sm5376016d50.5.2026.05.25.19.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:03:37 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 25 May 2026 21:03:24 -0500
Subject: [PATCH u-boot v3 2/2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
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
Message-Id: <20260525-asus-kommando-v3-2-e6a0ca1b4a3e@gmail.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
In-Reply-To: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Ender Hsieh <andhsieh@nvidia.com>, 
 Marc Olberding <molberding@nvidia.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.
This DT has networking working in rgmii-id mode.

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 arch/arm/dts/Makefile                            |  1 +
 arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 92 ++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

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
index 0000000000000000000000000000000000000000..bad3b011bae63c058fecd4790e3243bb0df4b770
--- /dev/null
+++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
@@ -0,0 +1,92 @@
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
+		eth0 = &mac2;
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
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio3_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy2: ethernet-phy@2 {
+		reg = <0>;
+	};
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

-- 
2.52.0


