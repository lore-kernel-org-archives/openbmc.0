Return-Path: <openbmc+bounces-2711-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ECECA5FEF
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 16:13:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hySGR4gszz30Vn;
	Mon, 05 Oct 2026 03:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791130351;
	cv=none; b=hVtgs+AbwDKVOHgp8yaXmP4/elbRpix9+RryPEV03aqT/RgMNdsqqKezIfpPcWlrkqxFIjZn3SSJGaqjQHVuVMoEw0XynoEUwXqbOm54VMdSuBCiCSwGlOONqYE524fhImVd3UDd/nP79dvrc+Xi9H+MnNxgpWMt1/iC52JCMzqsadZjMfFkNyQ4o38TrD5/Wb9Z5wZK/fZFWkNNEwUn1oo+BKFx3uK4ZuV4PM4C+cqbSDydtBRMhLpTUh2kpDUZZ0MnyLfcda4gWwPCkhmnvJgSejmR6yLhSGaGWGWtwCOEFGsGletlaqQOwEZon5d2TjL3h3I4ewShC2r8Rxgifw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791130351; c=relaxed/relaxed;
	bh=ZusJdekpvX4PX2r/sDPDS2JQlQc7VESUY/IytRH+5Us=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=My9nc2s9M1SVNLD/jx0QZ+EQJki31OxIOUS0fkgRnsdhShOGSOJ4VKu2xf/dicEj3eafPHzQ/gciYp5mVskwjWzNaX28G9PC63O6RR/MAhF3drpGchCOQBIEwxevdjTLxPgdT16qNuhh+yNovhZRavThffdvEjo3EHlEB0oARSJd7izuezFKQb0oqvBrb+KwjNNnI7s26aHie0ipBA144Jhhyr6OSIgnLDkor5phW0Yu6EBzfhWaLqAZi2346fJz6IwZbUvojKpil9g+qYuuqiaz0l3VpiqI/D7DXxtm1weSx40HHXE1ZUA12nJe5kCJrtE4kiE7y3X4VY6tBmjPnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezn+JsUV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezn+JsUV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com [IPv6:2a00:1450:4864:31::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hySGP5stQz30VQ
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 03:12:29 +1100 (AEDT)
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so5859175e9.1
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130347; x=1791735147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZusJdekpvX4PX2r/sDPDS2JQlQc7VESUY/IytRH+5Us=;
        b=ezn+JsUVnundPG6jha1NBUultPSxEe6KajuHzLHjqepFJWfzKrKUr1+8xhlK0tIa+q
         xZ6KCSRD3SZCf3YX+WyDpvnRIXgZr0WiM9yfXIOQIcHd638z8+QidYLsUaa5tj9eg0IV
         VFWsUwSR3++L64gWmZ/uf7S6sjM00ZwPDCuW0nyqPBAurHLBDgclKzxcE+L5P6Qk6fXb
         4p/H/tyc67Hd9il2L+QQdGQuRKvo4dWR/GaHHhCaSl6nRDoB9uGmsardA8b2zvt1agwT
         ejdSPAkrNf38ZFCYoVWqjTsFj2KwAaIhcC3ep/wFBMkmt2A7GWWb57yQtK/DL6Y4cFOe
         h9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130347; x=1791735147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZusJdekpvX4PX2r/sDPDS2JQlQc7VESUY/IytRH+5Us=;
        b=dP/uEwiUiX3UGYZQ9r4QMJpOfrZiVBbJD1uuWCWWamuVrDubcGemb/U7FjkvKLTt3w
         OgukTfCLy0MANAHG9+SIOaHPkLMP5NBA2EUCUafCmw73L6dFg4kDZX6LGWewhIa1MBlT
         L5/peVpEJxCxm1ilA0GHGr8qcZHtMpbnfcfACy2KcKPv+P8GCvtAwO2GMmXlYS+C4mbG
         XMI3UIFR6FAKuK0lKpLAlZt1VdrRY7z/d6kEv8KlxEZ+PixTFa4fkWx2ZERNBgPknUof
         11266vHTG2X+O48jhDnNsHb1ByCnqEjTT7vEaOsuSqqGyYgyAx6UuoWDREdrnikuk1PK
         qfAQ==
X-Gm-Message-State: AFuF++mA9hEXI9X70qRRSHp/JHf+AStcOjurSQ4OzaawC8vEi7S4TEcP
	uUN73+x6LRoESWWTqr/0LgxnghV7w+0F55MTCG/l3uL8kdyJ0esodvlU
X-Gm-Gg: AYBFou1c3oUmb5OFkanE/NqnUJqxmhBbOO5zj/K0z4UxvMw8gepBEHRiW3EgEMSxJHo
	1H3T2CETDouekNoHoFgXy8FXKR8FIGZQFMIVTMrx2uPb+ywV9aZGxS6JMReOETWTVJUJ55P0mP7
	caMCPk/YP36NYo9tEULzdjM4ITJWmRJUpQjcy9tWFN3Nn9uOOK/FkNrYsvbXViYXt65Mi7tVLlP
	CmonLMXzjfoKLPEG3uGdZZ4JSwOikRLxpLy9G4nbW0f4tCNZ6V7IAABY6qA8GNS1uo5J9XDX4H4
	ZECJEHeSlJmsuCdDui6kbObJvJqVApIVxh6K2l4YWihW+wrdQle2irKU7lcryln63b2T1G1Anj6
	dQfPo7Vrs1bTjSaKw4izsBnUpVWoktksZkikJhdURGhK/3ShR1EWXZFfPVcOqi6ei5j59OL7PzQ
	cdduSWiYKbB4dFCkz8a7biInxWZ3dabOGNONI3Cu2fZBOXZma5wS4ZlTfIwoT7ZMqM53/lyrzwO
	BRs4YBXfGs4gRykFz4FzMATQg==
X-Received: by 2002:a05:600c:1f93:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a1728f7420mr2621165e9.26.1791130346465;
        Sun, 04 Oct 2026 09:12:26 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:26 -0700 (PDT)
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
Subject: [PATCH v10 5/6] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Sun,  4 Oct 2026 19:11:50 +0300
Message-Id: <20261004161151.803563-6-tomer.maimon+nuvoton@nuvoton.com>
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

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so
the functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d1..2dc1a4f 100644
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
@@ -17,14 +17,14 @@
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


