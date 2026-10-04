Return-Path: <openbmc+bounces-2707-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007BFCA5FEF
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 16:12:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hySFw6dPyz30Sx;
	Mon, 05 Oct 2026 03:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791130324;
	cv=none; b=ikUecasXe6Rb/qfevdW2WPzi2rJwe6alP2hd8TB0S7tbEw7sELDAgxgqNGu1H7LJtx2/xfKMjyrYg/fuSjCGbo/eglTzI6NgJO9WzKb6R83EP3o+BUC8X/ZEm+KGUlqE4XG4qmhrMtSprQnmWzjW5m+YBGAjNUKViA3pY1+otyy6Uc3n3lUrZhuKPmHcR7QYS1QSAaf0pEWd000+LXVd2fy+gNeZ1q6TRCaVsMD4NEkVXJCKksduIKMscFmyrG+sQwsD7qJ9xosIqEkvFT0rUkXLsOMTPkJ+XfyZ5lqHsrpAIxrbdW17RKXzbkJBHHU81nyaGLc45AVkqk3dM5JDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791130324; c=relaxed/relaxed;
	bh=SFJPZ85mXAU4ZGN5RqoO6kBnTnwcMDemIX6Rzrz1AgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jUsbs/aodTUGVWBbt890tB1y0GPI62CwDlXzQAs/GsPA1i/MEUkPkbtBvQkCZCOKtM4DELGnCORgVlHPi9SyW50IL9HqUNlDC4muo7P+GBMpgE5JZpMn07keEEYFPwWZzQq5mExh02X0zDB866SY2loqRL2CNjs1UbxNNGPxAvauKKi2zyhfzLSGckWbCif0ZETtRNA/B2DiIYPQprrLtAOQxpOO8DtAY4oxWVII0C86hEhdvYs10V4qRqMYywrAcHK8ehpOBz+g8wBnGyGP5ZIuSyQ7I/El3CZ6z/g/vWx/aJ5JQDtpkoDFL07lZqjm3w/Sugsluj+6M5E4rBmJyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y6nap5l+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y6nap5l+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com [IPv6:2a00:1450:4864:31::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hySFs3cvMz30TP
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 03:12:00 +1100 (AEDT)
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff72474fso7205435e9.3
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130317; x=1791735117; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFJPZ85mXAU4ZGN5RqoO6kBnTnwcMDemIX6Rzrz1AgI=;
        b=Y6nap5l+G4vFm7M2TKGlhRqOQQtjoDaDtZgGyPsJ8Z59iy5Ax1q0iochnV85Vu909q
         Z0cvlsLPMxk1PwNvBHptVkswgNwLMBlkIOKiFi/Jjx0071X59VrYo541MiEyqRubLCZ1
         bEhGaymCE+kfDyuJKeq0qDXmR56RvRrGffD69Pgilsq64XWt3XMa8uZcek4yIA0V718S
         1ut2N/2U33x8BOpAzrWDgzqml9HqK0/KkEdTUs+hizp5bMg6yiGqByCakVMRRJnTTHtu
         OT+h0NGVqCajgKSVszgl9xuCbFDacN6jcqUbuTeo62Lc4B+0UMrtJgx5seMPfetcQ/31
         lyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130317; x=1791735117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFJPZ85mXAU4ZGN5RqoO6kBnTnwcMDemIX6Rzrz1AgI=;
        b=azvT4KP5q1w3t+0WanP94grO1o+LOzQ5R6maNsnXz1MURiRpee4xSKjG3g6+a+rO+/
         b3kHvt4BYHEvdTPsYD3Gc2y7k04o5Jspt6KUWZ2NXdbf+YyaIwdI73UmXezBrn05EDbs
         rPoh53tU7USRI1TzDWRQgSdJAhAbjM4GM+SShwSCIsf9w+LcnC8pdsA+SDAMeh2UYY8L
         D8vmAGRlP1GFsiz5mqU1mf3/QRsPhpoalZXXonsBCDhUPmsaoVmagreasWMRsqF373OU
         Wm6hm4WFTitbtxUwdkrXds7Zy5grVtzc+6nBHjVI3GAlQt+QszYxLytmENDM/1j4PMIO
         Q+tg==
X-Gm-Message-State: AFuF++kB2j96GetA2IC+btiWOnK0YWvlOQqJQsG4k1JIOtyuEOj5rBzy
	vPq1h/VmuNOVP+FF/+WMGpMxrH4TFL24lD3WIk7WYSrfQnrsZB6Nwhm+
X-Gm-Gg: AYBFou1YMG/YgRy+WXkM4pS7OUmet5jC4OLRI3w7mEAbvmw8cl+6Vy/0VrngRDvR0QM
	WbbwuUsYLomzzLZmbT6mZzoAZcbBC8ItcjEhfpZjYFCt9HYzasV6lgr/SC9QdqCCEkbuxJLAd7X
	jarHHgNLaj6yhZFwcEFwJ4xMXuzlrdCQ/BOLq0KTZTBc6/QF+twMFBGYSMvyywW6g3/2abYDsdv
	/Rax/DIa5t99Ie/kh0TsqIttXUBkNZ7Dkv4nSHff3hfQim3etVceNU3AFDjhX+R0yFUYXM237AQ
	d4+Y+R66RIvOlBeiMZHtTsDfCCV+t4W7ZVJz/+mX0TXPTExZegwni+dD9CR5mLcWStayvU3JMtf
	8guVfZgpmNaYz+3HGgrox6vhZ+oCguEH/1/ku4z2u1qoU0w8HluiSZyv2olHyWDixCcLM+VimY/
	IJWh5oo0Ns53ouk8QnUkn+xy7Xd0CR9mMlE80dRx/mNoFQGGUM6ES8rHksXCADJQN7XGTDxBDs/
	iVPkPPHsm8l2dDHWHIiOg6Zhw==
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr140205015e9.1.1791130316569;
        Sun, 04 Oct 2026 09:11:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:11:56 -0700 (PDT)
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
Subject: [PATCH v10 0/6] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Sun,  4 Oct 2026 19:11:45 +0300
Message-Id: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
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

From: Tomer Maimon <tmaimon77@gmail.com>

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch splits the two APB address windows into separate bus
nodes before any peripheral nodes are added.
The third patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The fourth patch introduces peripheral nodes for Ethernet, MMC, SPI,
USB, RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC
device tree.
The fifth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The sixth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on the NPCM845 evaluation board.

Changes since version 9:
        - Split the F0000000 and FFF00000 APB address windows in a
          separate patch before adding any peripheral nodes.
        - Add peripheral nodes directly under their final APB bus.
        - Renumber the timer/PECI ordering and peripheral patches.
        - Renumber the EVB coding-style and peripheral patches.

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
        - Drop the unsupported snps,eee-force-disable property from
          gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first
          patch.
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

Tomer Maimon (6):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Split APB address ranges
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 731 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   6 +
 3 files changed, 1155 insertions(+), 23 deletions(-)

-- 
2.34.1

