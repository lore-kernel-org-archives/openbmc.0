Return-Path: <openbmc+bounces-2353-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6C2C55179
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 11:22:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDDlJ6NYDz3brT;
	Mon, 03 Aug 2026 21:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785756092;
	cv=none; b=cW9nMUWwuhwhklBPMtQNthrr6I3gZPsIicP1coANiV0Xbxs4zIGBbaVIxoD8Va0yVHEetskcgKaWLgszVdsnR/yMbKQu+sSfklAaX1xS86IN7wuA7FwH+hQEM1aFWE5kJG+Tf/D2N9TpiiB2+zS7X35vhtcv1F6VuwDYuobmSObo6ZHw7DqF6UsixCUfPmfgvhB0Q8gLk92Fp1dER6eWhY4P2GfIXyANGVC71FtSNtOcS/P/DlhuAKNNevMmFlaF2hkk/e7faCld3rqbwBQVVuwau6+lSt4toO3PlMb3zl3Qodr/iCAYx81T3ehZVmz4l0+NTgYYy077/dYs/4+wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785756092; c=relaxed/relaxed;
	bh=MkZQi8HNIyl+jY+toKPeCTTFAzrs+zl5FwBtHYkecaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dgltceg7gBA+lweLF5Y4ayGAepW3YYNdP7mAZQg/Jys9EKmUgJzPQaJWFWAXN/6e71ms3dWsBw1iBOQ6/pEm6yIFqufcf59fPqNlIeA8LVehOM2Hmz0v7KOkm0AvomNaR6lw4LOGBgY00GjI5Ch7DATWdB1Qz6al8q6P6i+vXKxcb57xUvEh58Uf7FjQt8hljucpu3PM+/YKPOB/kxlOGYWbK5ukJnp4jly2fRJ0DcMthWms/lODCayEEWuF5+O6cgFoQ4P9NgWp+F2iJCmueQGzoTYVhoUMucvXQDXcVYyNplkZaM5SjCzI2vvkGKgSJlHzHMkgWfNECekocf0j1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0nRBdZn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0nRBdZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDDlH5h8fz3brH
	for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:31 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fde295992so901886f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756088; x=1786360888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkZQi8HNIyl+jY+toKPeCTTFAzrs+zl5FwBtHYkecaI=;
        b=N0nRBdZnjSyTtAdufkJMt9wkDsbXrYFa1yotjQ2Fv3fHRZP0Xh3rA7/d6yRts8xyMf
         W6NZrTkkTcrgBjAc6VFUqkWc426tBpKbZJy8YXp3SsA7YW20jcCazl3IsbhmAhHsQcCt
         clnmOSTBoyMtVZGLenp4yvZZbLnJY6lILKu9bthRTTLPB7j5M/DElcJ/MKooHW8QEcmr
         1d8bk0CPzMWwpD1ufJTEAQEWwTlBRGIGuSaKN5GlVr/6RxwbufJ9WnmLxQ09uVrHtisj
         lX0JiqBwCidTJZz32QJ9i7ZSQG/S+geAUbRdQw7n5CghrkqzMbqScBsEJwWSh0bd43Gv
         YXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756088; x=1786360888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkZQi8HNIyl+jY+toKPeCTTFAzrs+zl5FwBtHYkecaI=;
        b=l2WB82CW5ljOJ+VjMdF2JEjsvP9vP2+boAjnu6e5HQ5O7rAM0zih7Rfocpf96PCXek
         hh8T3GJEfrHRPQn7rh8NGRDPBeXjcihdAyxaQ8/xG+r0D7NXtgrkxiKIZyZ07Y/XyrAH
         cKgwWyYuqQX0vUqiJbcS4xod6k7njx8GFH+ef1/KWUOTQi+QKwXtKuC5XeuOHpinBsjv
         D9vYfPbWQcnHhfhxoSX46VeIcU637UK/umKyHoNGTq9qIb9nkp5qZvOdNS/WTmQywoPq
         phgaPQVnSNsoGQqrkabjciUJLfdamiQSzXSbIAzmPKqt98jpcQH7NCzRbAlLXkyTWt4P
         pFXQ==
X-Gm-Message-State: AOJu0YwIEd32bd0Illn/Nb5KvLbu9RVkYJl74PBeWEsivC5yDxeGQxWv
	JuB1vseI4b8WuL1fNcsZ0olbFHBmKcMITMDCaufHxYYaYrQtfEToMO4J
X-Gm-Gg: AR+sD13X9APClh5EyRCd4vhEgU0fRwNr75SxxP2P9BPCjhPraktT0oZoiTQV/UDwaXn
	ItWGF10Jtas9D5zojvKOnV2MzEl63TOtGZ1685sHiSwUoa9wRTB4UeHsL7OylzwlNrmlIh3P5+t
	pR9jEea4ikD4YYrqlQXQzVPsQen+z4S9jKRqu37/1HZDEA5jb5zM1zbBQUSiitJmmPw7oHFRPHj
	LTXQyPkgEaPrbf82EqvSolQoDz5wRL+chY44CQBLtgosozniZVsz6aY6NcAuRdJ3pUthBOhSRpS
	BCQVS3/UZDNF3IrL2dq3GijIhi7xVMIOVOvJ1zGn/MXdtt9rmkuiE4kLjR8VGRS66Zini5U+Hw6
	RIdDoKxIMZ/uGOLc+RVsOUmd/bUIqZF98hvjFmSA3BHWhFJT5nQPqzNYmM2UAkNosqj4eZOwzon
	KLk2blnRM4uRD+TEiivNeVcGaf63HRM+tsGvV2/WFDlLIiqh1e4S+eN7K0z67dE/OF9Iy4M9A=
X-Received: by 2002:a05:6000:2683:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-47fd32b982amr27124917f8f.10.1785756088129;
        Mon, 03 Aug 2026 04:21:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:27 -0700 (PDT)
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
Subject: [PATCH v9 4/5] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Mon,  3 Aug 2026 14:19:05 +0300
Message-Id: <20260803111906.1931384-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so the
functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d133..2dc1a4fbb 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@ chosen {
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1

