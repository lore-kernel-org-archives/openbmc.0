Return-Path: <openbmc+bounces-2735-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36B4CA5FFF
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:27:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sj5l1Cz30VX;
	Wed, 07 Oct 2026 18:27:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358021;
	cv=none; b=n2fxsba3/jKbu0HGhhoO3t8O4b+h6bodcHIFMDQW16EdE8GyHsuUspr1mkxN6osMW3XhZY4p5LAOMx2SKW+3ATpGKvYE6AvHPOzem5Zcc3bjd8XDyKC0hOZa+MdQhed8ju8IAY0aJDyD387iTLn3FHMZWdKMBhk/dUXi7d66wzX5xKilGQ3Ysjb5s++RljJVYKuhk1t7WMSeoOJw474W+fyuDWK3MKknUh6BhkBLalJMHXwH6ol4EJAXfRJlQPPV1Z/GU/vZUbVerkrmdDuMVo8b1vHs23Wou0Bv9fNNy+WQAs53in7yEJt8VTi8cNtevNVuYW4huJSkmmS70q96fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358021; c=relaxed/relaxed;
	bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a2PsqevTD6LIHcWpm9qhcSvU9BEY56El1kGuAwFBuu1dkEHWuQI/9XtpZA1wWdjlz5XGz+1bujqs9D+3uaU1TltYkHvAIhhdTSn7haa7JKgNdaw2WCDxhDaZfpjiW1qVjWdjDHmaF2bvxGS/oghQKjPs4ci5zDdt/urUprwiTVr2iNkz2txkbU2iqufQl4QN7akKZ42Vm2GGs9GAZLt/2yQo/no7HovVNNvtLjoJt2o+TE+AW60MamQuLIlzwCd+dHyXwAvAFMRoXOpxU+k0jyY69+lUZTVosG91fn+dWS7hCuX3DdDgTnJFQ+IQ70YPyrKE3B1Y0cSfyI77x5P49w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYoW6TBz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYoW6TBz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sh0Ndtz30Cj
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:26:59 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so23016065e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358016; x=1791962816; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=LYoW6TBz2TSf2+e6+Kjzg5DXggRqR7+HjGNSiSEiDXWthJE97X1mTFDfXHh3KooGaf
         GswJUxwtQxybQM3T6MxgUfXb2G3NhyMIp0ZF1sCnQ+H75fTUmfHCrjjhF9WOxrcjwNFG
         kfMCFSC3d6IIez+8Fu7JZphp1jCaRAdlqMEwv+uVNAFd7ITCrs6UO3ByO9J4KHc1ya7J
         oy0YlcZuK4JwMWCA9GWzHaXIOISc7Vcb8L5RyH/jg7do5ejXE8vrxHiB46Swdz9wCZ2I
         0rUbGXsW77BN+lnEB8Zut+eGoaLhQpUIfIiwfbgOpCsjNAGneMCFzN6voF7EDP3Nc4xz
         wibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358016; x=1791962816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=FPVt5ED91VMncTiuS3PD9O6242+Sebw8yeYNJSWEcc+DxRc+lwJB7k9tlRiSX3ForC
         GLpqgXoLdAGg2TM3vSRn+5b1mBu7NHwpC3XYkTzRFqFMgkQDQoTEGCLTQb4onFTkKC1S
         +kB9/aZbFu4lfUdUEthPiOaVuavmy4MW3S6a6komPKQjYUqsVkeRem9JYsSEllhPgqvB
         QDYpTuTdBauHEIkjhQLx7Zx8is6DgOFCgRftERSS9A77iPM+RQXG9P9HoBW4L/1drWk0
         4AoJrl5x28QiaYOv/BTcVGqVbv0mnZlrUBSb02zyiE5EsmojJWPvprU/1z0zfMNrg36F
         arNQ==
X-Gm-Message-State: AFuF++mAPN7cEyNDmCeaEUsbbyj3gLntjWWUDwWQ043c0cXicfgpRRit
	MGh4sdSWJH+GJyz+k3eup/LdX9wPBxjaZ/sYjTNLeGyXgm5h+VIK6kQn
X-Gm-Gg: AYBFou2hUj7AamBkq53gPyklA3F5oy7fFx8TZUyjeQ1G5Tqtv7eT9FsKoEiJJyAokiS
	grywdVZYRt/hbyE5A7Ed7vvgcvl4AbE2Y+TJXi+DRbRJPR89D1NO1zqMHco4hkX+7haEvXAXPD7
	2WPG3EnrFp/YCvBiZrdXHj5jx3CrFLV7TshhUps2go2yUAyZ7dZyMZ0wnvJaUZaXe+fbYJEaIYK
	m+489pViT6ArbfrvZNeNX2q/z+PR7KCZMK/u/SqoNUyBis3gkZKjNNhA0D0QqjWDCtyJ7WCsosE
	HHgoCoBj7kJlEifCVjF/yQcaEqQ4zJ8G0TX/VJkUWOY3lZXBWAT8Ry+YrALwUufslz98SYTdpMV
	msMTX97zsFQJG8324ulV/U5eI4jHalRpHt5pJQeAnYyU3++PQ1tgDTzgOFxfDwfWt4z1ofbCCzx
	UNyzDBrMODpLwrA9E3S9fcVlmaCCLC3mjElItuNoIEzGw2FkwcmE3wJ3KM04PXNqqkb0DwwFqyV
	pRAWqukpKDpLMLcNy8=
X-Received: by 2002:a05:600c:4687:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18065e235mr18138445e9.25.1791358016421;
        Wed, 07 Oct 2026 00:26:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:55 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 2/6] arm64: dts: nuvoton: npcm845: Split APB address ranges
Date: Wed,  7 Oct 2026 10:26:41 +0300
Message-Id: <20261007072645.1618147-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: 8bit

Describe the F0000000 and FFF00000 APB windows as separate bus
nodes. This lets each bus use child unit addresses relative to its
own range.

Keep this structural APB update before the peripheral additions so
nodes can be added directly under the correct bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ab8a01c..a92fbd3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -51,13 +51,12 @@
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
-		apb {
+		apb@f0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
 			interrupt-parent = <&gic>;
-			ranges = <0x0 0x0 0xf0000000 0x00300000>,
-				<0xfff00000 0x0 0xfff00000 0x00016000>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
 			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
@@ -164,6 +163,13 @@
 
 		};
 
+		apb@fff00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0xfff00000 0x0 0xfff00000 0x00016000>;
+		};
 	};
 
 	pinctrl: pinctrl@f0010000 {
-- 
2.34.1


