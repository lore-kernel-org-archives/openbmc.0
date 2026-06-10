Return-Path: <openbmc+bounces-2076-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D590ACD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 16:08:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb9gJ590kz2ysW;
	Thu, 11 Jun 2026 02:08:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781107708;
	cv=none; b=oPE9jwq7owFoXc6/I0HSgktf8YOkw45RG0wUCPhh1QvhDeXigvwiJVwKUjewrIQo3eNrYJqCzgVe59muMioe8X+BLqpeHv0oXx4ziXv/HCbVokbMrYpCPsalsQu2aI2RqnvEcFxzD12GrnPhq7TfUtuvanqnYy5MLdVOBwaIpokYxgAI4IlEu11rr4qWqaAyR695rzuhZ5jypaHHfgSihRQhtUA5CIkqdcyHu37ciJS/fAbnC89J4p4XiB1Er8Z86tH0zeR/Drg4YKME0uJIZCs8FpFjR0Y0d5bWDNRUNk7u9K4NwPUOlAXgunuK2JFcG/QVglmUPCdd1AY+Ae4M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781107708; c=relaxed/relaxed;
	bh=87qOkU8oqq1VUwaehKFFwgiT8WrliwcwSFGHfQj5ht0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOrnzvPYeOhRsW4tPoC5tvtTPW0riC0Pu5GsJ2fdB0uvU+pdOmYGBKyVWdgDmTDMXFTPL3tLzgA06m6N1h2JS5iMnBKD0MR1SFMFWtFL6UXTH3vbCcrw6n6GeDptimqlFfHeHGGr0T3Lz9ko+ugXf4dg+K1JUEdHe9MqFRl3CpAbKQpzMFBqI1k1Mw2Vy1cEYQDy0Zait+jlE/nHbaMxCLLBgneICyMuaISE7EgfQ7jg0GIqOfe+H6pjh9tIw2OVSUb0wOUQJqekxQwfC0l9zYLCjpzJWB958yFlopFgeEFg9tfn6ZANYjE8hrQJMDpLVmAJiiYz4iRAqZXirVqHnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbz3kp57; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbz3kp57;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb9gF71KHz2y2B
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 02:08:25 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-bebbc325000so918549766b.0
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781107702; x=1781712502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87qOkU8oqq1VUwaehKFFwgiT8WrliwcwSFGHfQj5ht0=;
        b=jbz3kp57FOd8StA/I4APWuIwYeS+J/8dKlbY0WTypcn1v5b7m7XvQIxlO9LnMjSIvs
         G5Pm9JRKHEpZ+7XexOqImip+O4Q/xypv18qU3BAvtbF0BFp8yzmSH5FHPEyf7fc8bKWi
         ykjhZInCmsPuI+lmfT92HwzuCLXUR4jhSyeowzQEC1YZVdfoj9yACzX4D664WyGUxcCi
         rGDWM+3h0T2FnWUbkn8cjZqnvm7prL55AoaxTO0KcHoIljWH5WzWJYnfYGJC9D3WQPXY
         ggli+rlP2FFSrTvGu/jol9zgTbw8WsSoADG/hVUnZ4LM8PyId5q/LFfZ6SbDBkpLNw9k
         ia1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107702; x=1781712502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87qOkU8oqq1VUwaehKFFwgiT8WrliwcwSFGHfQj5ht0=;
        b=QOroRon6vhzjAkIOl3zP7ksV6oxFe1Znv30Z1MUSu6wkPPA7fhFqVAekn6T6hFo/GV
         taKq6Ns9Lt2UHHl8khDlaLJosQlhUH6afwCw1US/dVeQiUKx4G3e19+u1Ntv+vzACequ
         pwFJEWuYKrD+sGD7qj1mV698bsJlZ7DtIG8qqV8DuH6j6ZQos5fibzdh8s1BSaJdYt97
         MHjl9TZogFPrLUqovdxunhot/W+ik7/EaUEd6Dh2l2uRnH+YCtyUIg+E1+Ayc2P3ep5e
         YAoZ/9ismopxgoH6IBYp8yL0E6kNAiz82KddfFKU9FpOo/z1SWtFwCFGFAwjDkVGTycF
         /3hQ==
X-Gm-Message-State: AOJu0YxfSdDrE7CQWvn1jD0MVZZMHlJh259B1RIZDO4z5MihbhhLQsGD
	y3uqd4V9dhxXi+2/mEhlHa9JE2XoYzQ03HWG8Ki8J4wWrqViv77bzBgK
X-Gm-Gg: Acq92OGAFOTmUPU3Dwl7X+vccaneBtb/ISxUOFTL+qU41X6u+wzIY7abUfRKg89Wzjg
	cudhR9Y0b8Fs4VlMejLmM6Mhj7Jf3hx6BGVYledOQbfCANkNdx9d7tXc33qWvM8HcFaqcam4oqF
	aUPbqrUlm9+GPV1hsGm1btXEzPNTHwzBbIsd0zW+H3aBOg539VPku8/KtsFFofa64PdtLV5zN2H
	ssKADb/u1teWDXKCq7fJdA99TlDt/NbkbnWU8Av7TlkwoTcYE5ZKY20s8xtLLvtHlQBlUVP3No0
	Q0qKsO0y/WRYe4uMhntDw/PExqcfouba7S01r5M9CrCZsDWT3GZHznUUKwaN0sGQfinOniv4zYT
	YW8VOurvv5F8+uVrNXeI/kW1ape80mtWIT6bSO+XgxzVPiy25ZLv4mJre7yFXxnKHSI++R4DkVk
	UsSB1EOkhEDC/im8a8L/lcWwuMaf9wLysp6cx/zj0e7Baz
X-Received: by 2002:a17:907:1c85:b0:bcb:d9c7:c6f with SMTP id a640c23a62f3a-bf371360f21mr1366420466b.7.1781107701795;
        Wed, 10 Jun 2026 09:08:21 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1188524466b.45.2026.06.10.09.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:08:21 -0700 (PDT)
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
Subject: [PATCH v4 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed, 10 Jun 2026 19:08:13 +0300
Message-Id: <20260610160816.2828713-1-tmaimon77@gmail.com>
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

This series fix warnings and adds device tree support for peripherals on
the Nuvoton NPCM845 SoC and its Evaluation Board (EVB).
The first patch fix warning and arrange node order.
The second patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
The third patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
like PHY modes and SPI flash partitions.

The NPCM8XX device tree tested on NPCM845 evaluation board.

This series depends on:
https://lore.kernel.org/all/20260610121822.2524634-2-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-3-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-4-tmaimon77@gmail.com/

Addressed comments from:
	- Rob Herring: https://patchwork.ozlabs.org/project/openbmc/cover/20250925200625.573902-1-tmaimon77@gmail.com/#3588084

Changes since version 3:
        - reomve tmp100.

Changes since version 2:
        - Fix dts warning
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message
        - Fix dtbs_check warnings.

Tomer Maimon (3):
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 726 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 413 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1130 insertions(+), 20 deletions(-)

-- 
2.34.1

