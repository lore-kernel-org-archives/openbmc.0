Return-Path: <openbmc+bounces-2709-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B3CA5FEF
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 16:12:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hySGJ3gDGz30V2;
	Mon, 05 Oct 2026 03:12:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791130344;
	cv=none; b=iSkMG2V4aVoGDkIKbV+3rgPOggB6e5vkDdapZwzZVX7XHm54g2yngS9miLaUj5tWfdMZERnJrSvhDSdveNut75aa9/arjtrZGudUIiqfUvMHlcqPBhaqjcYEPuUC8ULshKFIWMTYHu6GXXEJskfkt1hWEi4FMZ11zEN+4JjllbAAg8wC5J2bdkidp/mWMIlqaQdTk9LiQae9ZPDn9/0ieZbnxn94gjLznGPwpY3n0KyCLPkssTtFXHzLx76snCVrFMDrglTzwRZFlBpxB/40hGAgzXbM6nFD3kc/wONlmLGN5rlgwWuIKpUfD7Ue3P0Em+wa1nD9UO3v/3/MTR1PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791130344; c=relaxed/relaxed;
	bh=ybxlrlx1Ff+lveu/EBWApT9PoULzQ9pSYJTj7oZbCz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FH1G9zwn6zl6LBlvtGsyfYAsiOXfpOPV9awjGnVepXiYa8ya2Jp6C8j9xnIGGS53A4qfykMP8rvS7yaLHfRhG/G1LMB1J712AdY9xxcAHWMyxHgC51PsYrhatL9aAKPwhVnHyjyopqseq/+1kMQyC9KSGZd+D8ralGaqrF13UrxVqFB3Hfze/RgGAV1VbnfaeiJPrGmP80hVFpQjeR25dCrfmteY3887J9dyai85uI/FL4rhST3Nw5jdl/XMy8DB5wEegrjVZYX9xliIFylbL8x8CvAIMjYMUCFqvGYuP57QTJdLctLpviIYgYPTMjTspBUC7tCTTmOeDH1kaKviSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r54QQHhm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r54QQHhm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com [IPv6:2a00:1450:4864:31::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hySGH2PbGz2y2K
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 03:12:23 +1100 (AEDT)
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso9166495e9.2
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 09:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130340; x=1791735140; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybxlrlx1Ff+lveu/EBWApT9PoULzQ9pSYJTj7oZbCz4=;
        b=r54QQHhmZw0XfNraCX8AXirM5O9dDFbxTrXFtxn4yEXd8BTIaBubu9YZihsUciCrbn
         4rVYgrgHvgcjfRONBcyPr68zCsf4KSyHCXKVun5ZVo/QUsCd6w+kdUDOsCLG898PT0V/
         jzOs96fpjGhCwI40RPlA2oYMT3XIyPB2vpM3bayWIXNGKsTc0WVcMLKw0L5iDIJG1ktx
         lKxr+VJ9tv8F68GN7+mM2vCt9ComsdCjWAb8/nKDkiyNwEJTGjpj7air8KcpTNYh04LF
         Wi1FXlyupknW6XOcig9aVtHyXcGbiFS6scDIrFlvrlRhbmB2vJITJMtoqScYuTgeQYM+
         ZEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130340; x=1791735140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybxlrlx1Ff+lveu/EBWApT9PoULzQ9pSYJTj7oZbCz4=;
        b=PkYm4zEdHVNgQEy0p9kt1VsaqxWSh/QdpcDrPFUVeu63ogQJyy2njfDOIgmCbaETFp
         2MYQ6Wz9/5lTMP7rSjee1wK8L3Cex7rqi/+wUOSlpGKgvtCYeiLm2uuy2y5piUu+JApC
         2mHD4mUcsZEPARqyNZv0VVpv8gRheFRAS0ScpTKDiob9OqkN6gMi65syX3iokxInvptK
         1fgOTDeoto87srKJtTHW5Lg0QxIeaga4bdVU2Acvs2VRNH0QwPltaBy7neYBLFL3bJqe
         18AAVlC6iw433oTNeN3zlHsdPLHOEuMq2dljZMret45UMnFhP3FDYgLiHlwxH3dAUOfz
         uVPA==
X-Gm-Message-State: AFuF++mGZNV/gAcRNhAF/mlWZPgaHVOsKi1gc6rLTC6Z4gHQdZtWVnQY
	WZF4wEYqXb6FhoCrFg9Bi4odi0tYuNBTWPvj6Cz8hFAV+KqE3Abs8w08
X-Gm-Gg: AYBFou2Xeie2AH9ohpbdWgMV3tdfKZQWad55theAktn26jhUV1qY9GHjpGTUjHjMhzf
	y7JEX1z53SrtcH2z4x3ZrAOjIV2dzmuYp55VJ7zLMhmWOr8jQs0ioHzxboM0xrtn0ugbXPE/o9h
	+05AyPKnvLFU2XheFmn0/2b3UekmEaE/Yawpx0CsgrcwfP2LDBt1MIhDZzUd+kkkOguoCUy6YyQ
	bPeB0O/JZvSK2QUjtKQh6ZGF8i+UV+N7AD5aWxt9lih5ejIRoDITjRjY8eFBJXfuYT8X3fBSjQ6
	yMYa1UdOrTmIoE65aHd/GQ6PmTvop3pev8uvuoAwprykV57UsIfg6bTnGRJzUiBA09GseXeCoij
	Efj4SiscbDliIGivcbH0HMwwIOX4MnW55z5G/pYL8mIXkPKR/lv2STEM5V0g3eIbAbDGYG7XLIM
	vTb6/S31uPjXYlBrgA8WsM3oKXzdGovdvDbq0UXYOd6bDWtJYg9hkzajqCYoehqHx3ZqR2RQLg9
	waGndD8TdLQ7Flos//xDmUE5w==
X-Received: by 2002:a05:600c:4e93:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a02756715fmr150200555e9.6.1791130340000;
        Sun, 04 Oct 2026 09:12:20 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:19 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
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
Subject: [PATCH v10 2/6] arm64: dts: nuvoton: npcm845: Split APB address ranges
Date: Sun,  4 Oct 2026 19:11:47 +0300
Message-Id: <20261004161151.803563-3-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
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

From: Tomer Maimon <tmaimon77@gmail.com>

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


