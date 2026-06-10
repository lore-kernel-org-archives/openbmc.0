Return-Path: <openbmc+bounces-2073-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E211CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 12:18:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb4Z83SMcz3bp7;
	Wed, 10 Jun 2026 22:18:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781093920;
	cv=none; b=WPmNo+BD+FCindom+P53nl7AjYzpsLz3UTpJeqAb3pZLg3rwoSSW5rIdje7btLEvzfne3fnesFraNDmuWuBXNRpZ3h1ZPng5qJsgg3eXRDonqWPkjNKBddFz1YlQkugMf4SV+6kIKLRvPf9BXoydwLvdVXFhnOKwILSfqEmVu50Odd33K0u3UlzxPrW6GV/4xk/ROuwWlkfEBtPBajI9ajJqUHDudiODF873Pbx0JEsv4Dvi5MM/Snxox8N6M+Q/03oi/bHLpHYn5ncl5Xna4UiB7v7FK7XPe6h/jtjAa7cKU4pz3dDkCwzvTgTo/DlO/5H9qSKyD4NKmW7Vkk16aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781093920; c=relaxed/relaxed;
	bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opM9fD8s4xLtect+iTmXnBJ9U9VHKT+AhAUvcKaqUSP0gTU7XRUSGQY1FseLX3E41ChPEavRn1ueUd96stRkpXVXB/C5daOFrNXrEJAc/Mv3tQq5G7nJG9GV7Mz0N9zQsOaJ6Gg/a5L4Om9B+jisfn/gEkWyTDVNUedgwCSQORIH1+Vk1Tb3P3jKnvR9Bk4qgVQESEaJce1EIEKG35Dp9XCFK8GJ2ohR4mKPhMBFtS1mThS1rfqovO8Rs2qTyHwsFyV1IrrAcTByAQuPaIh+N4VLsQqtenUUUJ9nMfSlLaGOBDp8OpLoA3Ie72YXnUghvqyO+NR7dFf/sLDDOZyNPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pEk6HoF2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pEk6HoF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb4Z70JFwz2yv0
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 22:18:38 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4600ddc4017so4634589f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093915; x=1781698715; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=pEk6HoF2LQhLIv7Kwlh05l5zgHbwl3FnI4DjjPRUsWWFBDyGqmF8oqmAXPjfu8jWVC
         02En+GLyahlUDheDlDQoyO35L7Y6IttbjA8GEX2T1JrZhyYmR2qW7gdE9okg0BuM1WhD
         haG0hThZ+u3fyEggwnAjdmykG3IFjvdfBjlwF59KU2896IGBH2e7ha+jE6ODFfgyK9U0
         pK0xFJz7UrW+BHwzlqtg0ReuPU/TtCYvdAu6bhpFIBUf2n6Qafecz+cGKKgA7mPDYEQn
         h2ALC1PYDW0v88LW9kLF8Qv/sNxiDm8KG+te7ztcYqPwDaLyf9FIY2aB8txKWhOVoMKR
         mmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093915; x=1781698715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=OFK1NnBexlGd26NjspdolhkAAEw9ksWRNGZY3lGDBk7e1LyQZEbcnVX+5z8iv+k306
         Fvrbkg31+KwUMdNOed3TldH9cfDaDXG9M1Faiy8PUR3TdJEbuJVBZjEWfXHOzx4pSDt4
         CLgHfr4QGkdOYSjQj0BFVnkUtgakepaB+P09c+Vk1Ao4bmoEFFo2JmLAKRKwADbrL+UQ
         5V8q2crC8K/UB7WlW67V+LPOYNjyFBRdDmL+F/Dsqf++vojzHwYrCBgVqrW1FdBr7/x8
         UiYp2FOzGBz7nuQ9CgNCRI15C/+6FAPg3NdBEZT/2Uf/MIz9JNApD1/vOfi7ZBEO9B2d
         lB4A==
X-Gm-Message-State: AOJu0YxipLDvn6BK2atsLhFt2YNYCQoxmfiqgUfsdQl42IE9rUXmFXpG
	CW76qm1aMqq8xeFNrk78zT/uF2XFziqNzLE2RDg+IJ1ExJiMmgY6C1yl
X-Gm-Gg: Acq92OGD5lQUZlU0ZaQyIMlPoP6jhBhp9BylkxyTjniEZXjVjreqkspj4992t/Ia1Xz
	uIDuhlQe9WFS7X4M1P+3DMYKvcn4oTRpXuAx534k75EE3GhdgYmxVALP96Ky3D0XPqFTN3w7uXh
	PHZKBy/8ts924xyYfOvxa8rmgJUOJwP2+sL0HbIIJ1tBA/KBhmI36iWTofjcaHxN+OfvK2XhnWL
	ZmmAtz9AtzbDSCmalRTdW71O7j2rSRCww1UlRcUdq5fVphneX31L/tPjjnlhZIVj6tscdvaEmpG
	UH4aM9ZO1gcxm7+AtKC9u6MtlBVkLlj8Qp88zFW3Ud9CHaSyrhcZcSYQ5wcfE3+Cleb9AOFdX3X
	2y2Awd3jdNpmEU5Xhr6xOlQcK3BziEUWTye/1zq7mT4oWYTaUXp4mo/FrhdMJ1YqVBGKit/pTz0
	JrseadItoRRCQzvsQvlfpL/E5Py46++qCFKTQqbFhQKqS5INUzuWAlWD8=
X-Received: by 2002:a05:600c:a117:b0:490:c2a3:23d0 with SMTP id 5b1f17b1804b1-490c2a32441mr294659765e9.35.1781093915295;
        Wed, 10 Jun 2026 05:18:35 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:34 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
Date: Wed, 10 Jun 2026 15:18:20 +0300
Message-Id: <20260610121822.2524634-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610121822.2524634-1-tmaimon77@gmail.com>
References: <20260610121822.2524634-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

The NPCM7xx FIU controller nodes only describe the control register block,
but they still advertise a second "memory" entry in reg-names. Drop the
bogus name so the DTS matches the resources actually present in each node.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/a=
rm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..a16450abea0e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -191,7 +191,7 @@ fiu0: spi@fb000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
 			clock-names =3D "clk_spi0";
 			status =3D "disabled";
@@ -202,7 +202,7 @@ fiu3: spi@c0000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xc0000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
 			clock-names =3D "clk_spi3";
 			pinctrl-names =3D "default";
@@ -215,7 +215,7 @@ fiux: spi@fb001000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb001000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
 			clock-names =3D "clk_spix";
 			status =3D "disabled";
--=20
2.34.1


