Return-Path: <openbmc+bounces-2349-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B531C55184
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDDl96L8Sz30HB;
	Mon, 03 Aug 2026 21:21:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785756085;
	cv=none; b=j6k/wCxVspOBSQfx/Giy+qsPA7MULfdqE/SNDXrh5DmWk9+J3Q/MukZrcKjitGfWKwdT9dKp9hB+tFAX+fD6ROVZik/WsZ0COHyYtOVAh+BRq7lbgHu9sS6UU4lKP2vU2nud/mvqw25NPvQaO/FwJbkjM2jBRXNnuWyx85+q0VmLZHXrslKplKAkjl7B00AKh5yCd2qr0QFZqUPyWapRNoO2Rebpb+TQBqEeauXzfUSGrirk7vengbApnntHwjHmO1zXpFMk0G8wkZRuxVtK7z4+9a7W5Tx0UIe6h1DmVouRNBddLAxdZYCv+EJ9amZzNb/rMgFLMJpA51TIAT+jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785756085; c=relaxed/relaxed;
	bh=OE3uND4Z2avCBL2hS5rIJ6Hp23ST+cHbCiiTEUWZqK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FrjILiz99GkXzC5RK6677UicpCLbX2G9xZoyoZo6XAFE7BEa3aKoykDTfoFoXdFcc7kVL9x5CNfBk8PCdkxV7pZ54R21jQtz3qYGeYOKFpkln4Z0iQGS2OYuYqPgpuvgtoTCnBpF+JkYPG2HV9aTjBp13kfRJYCOu/ZG32P2guPjh1rzBAbH7oC7Q0khSHTk6TPDN/MU3sfhAEvmgZ1yfN1V9dC6mDtZDdNRwy4lBaWuNLhHxy14dlj2uTu0HyCJSjJEVJpFUDF1dhp03ldbIAOWC70kduBPS0U2FtbgURQYv6Oas1Z6T9AgTYDmpdY+PaGD9f7k21BFTo/IF5Hh/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NMJfVQv5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NMJfVQv5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDDl76Vhqz30DY
	for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:23 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3483897f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756080; x=1786360880; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE3uND4Z2avCBL2hS5rIJ6Hp23ST+cHbCiiTEUWZqK4=;
        b=NMJfVQv5uutKWj5PwKYDlp8An+Xn6vb4HoksyY872AP9OojFv5Iq4rG8WfHnjAfv7L
         lvKasEN93bkVL4TgjcOZmoIaIEqdetHKwxBgx0Fc01BKt8ZwYsEZ6DYBynvKN1UQ2SpG
         DZS9PPLPDmZnJ2T+CboZZ7HMEXigAD7Y3Epx+vEIg9rdHbKIQDuTnT0D3+iPlafXBFEF
         svUtETtmdL8/YTyO38AAMGS4syU64btlLj51XH+2bKr73RYngTTAfB25+15weR5BxqwP
         cMXnRpVZXbzmBJaXFgPzKEc8z6xci0XtOUdtCh6no2Wmx717fAJuol4XVB88qc00fa2J
         grsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756080; x=1786360880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE3uND4Z2avCBL2hS5rIJ6Hp23ST+cHbCiiTEUWZqK4=;
        b=ooaPS2+4rUM2yNbyDT6ATey1yat3wiH0ZMYCaX15sWo3BrqouigJMtw3WgKJq3pe2z
         B2SqTeG+leixSOFbePwzQrAIHhLWuRc77TZcwZxN7+RKmtLjNDKWiHvvDoX3cOCN9sJp
         rEGaeWwM2PvIz1ZrV3dVomrtgYUM6UDpgx02yonQlBCTuzxLxh+TMXpn9tPtqlbfclPu
         gyncNhL1B4Hov6rdnmFXwPKiDuDXoEbFpQYt1/SKO3UgARiwAU9OaRqW77mA2aGshkMW
         UbWjOG2sdgbMEptbu+ZVKgbDxT43+ZWaJdNtVwJk6UmS2v5R0TzC2Nwjw++n2nG/w9SY
         nibg==
X-Gm-Message-State: AOJu0YwUx6VJQkwFjgW361xsRJttfGjWnYdxuJOd7OwzN7X1Mdyk/GeO
	arf8j87G8gQVytJ5mdeoh+nDiukOxykX547ekHDTnI259cO1Xrb9d+LZ
X-Gm-Gg: AR+sD10fPRgpnFP4Y+XEhAVUQBkcFh+ZhCCJcqaZ5pbaujXv7U9A5UU11OcotXffMs+
	CM+Cw8a/H5dhrATXWbIwnh8+OG9Eeom8Um29vR/GZ8hBTqaFQrUunTcN1rAsrz6PQIc8M0NovfY
	hDhBhFkUnOlALqw5DmLj9SV/FPebjBKOVmL8ilaeCgqa+82vqLnj7jEcVugX2C5Bpqn7xHKl4s/
	p7lkpKHgmqItkliMqRCIFJnEIq5yoQ5fNQneVcIeZdcz7k7Iqt+al1uTMYZmHrcMsJCsnR7ZZtJ
	PE0l/KMr/kf1rZEM0xuAOEZ+SxwCx81mWIwOUUt6woP9EkaRk5zZRtrtqnicD2zqbmtBVd1+byq
	e/QOPfczskhf3X9HCe/lggMdZ00FS9lk07HMf3ZVLbrpcl0m8TPVEdfkHu1GXW9H+mcajO5a9G8
	fGbkfboxbMWL8nhywFH2llhzyhwWvFPq3wMdqjRv7bXnQrXkE+rYfJe8FbEsu5NOX1JuOBCBQ=
X-Received: by 2002:a05:6000:2483:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd72c353emr23278471f8f.24.1785756079458;
        Mon, 03 Aug 2026 04:21:19 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:18 -0700 (PDT)
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
Subject: [PATCH v9 0/5] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Mon,  3 Aug 2026 14:19:01 +0300
Message-Id: <20260803111906.1931384-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device
tree.
The fourth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The fifth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on NPCM845 evaluation board.

Addressed comments from:
        - Andrew Jeffery: https://lore.kernel.org/all/22ecb2fc6f4a4ca3c3018fffba8a56bcf5ca89fc.camel@codeconstruct.com.au/

Changes since version 9:
        - Modify dts code style.

Changes since version 8:
        - Split the EVB changes into a DTS coding-style cleanup patch
          for the pre-existing board file and a separate peripheral
          enablement patch.
        - Fix strict dt-check-style issues in the EVB DTS by reordering
          properties and nodes, normalizing blank lines and continuation
          alignment, and lowercasing hex literals.
        - Drop the unused tip_reserved label.
        - Keep patches 1-3 unchanged.
        - The remaining refclk unused-label report is a false positive
          because the label is referenced from the included common DTSI.

Changes since version 7:
        - Move timer0 to keep APB child nodes in unit-address order.
        - Add PSPI to the commit message.

Changes since version 6:
        - Remove IPMI I2C device.
        - Add FIX enable property.
        - Keep patches 1-3 unchanged.

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first patch.
        - Remove nuvoton,sysgcr from udc8 and udc9.
        - Rename apb: bus@f0000000 back to apb.
        - Rename spix-mode to nuvoton,spix-mode.
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
          as /bits/ 8.

Changes since version 3:
        - Remove tmp100.

Changes since version 2:
        - Fix DTS warning.
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message.
        - Fix dtbs_check warnings.

Tomer Maimon (5):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1149 insertions(+), 20 deletions(-)

-- 
2.34.1

