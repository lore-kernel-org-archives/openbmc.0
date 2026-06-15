Return-Path: <openbmc+bounces-2095-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F56CD98CF
	for <openbmc@archiver.kernel.org>; Mon, 15 Jun 2026 14:26:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfC8l2K5pz3c3g;
	Tue, 16 Jun 2026 00:25:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781533558;
	cv=none; b=joMIPhmAPxKQkVrYISK5zh+WYxhm/IMP0L+DVV/OvQp8TXbABfsNVjBa/kokNsCn/HD09ryO2D2OTL/POUrSXqqhjy6Gd9atBdv7EmuVQMN3O+JKE7ZtjV8mD09TKFLqwS4OUuAKiNvoPGK8UWXMxSl8TKjhUAIvhujHe5X9PlW2eWStIV7J0eU368xWkIJIR1u8PREh5zSrstjD+XfVLmqZMPmmkaWUhoznvurMkwoRC67j3rCq9T1jyNugdnF5htEGUAYGgiKOwGQW/9AsJEz4HdR5D3MQlFU4l5g9GurVhOcc9OQEazrXA3nfzt6ZBds2eAc5C77OF+J4sc6k9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781533558; c=relaxed/relaxed;
	bh=IS4hKl08e5fFQM7CS+6rOZwYJSvHMZdWZRds5aVjNjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FtP+Eb5I1Y23p+KhLKL4IGFoz6bFMwevljGQcFezlb2sndPwj3NCGocaS71EY+bA3FGOC9eDkOE26Jnu45u7hWAOdqQbEWnDZKsx5V1SiR5saIbaMf2nzx/cl4Uztbbnph2fwNWL0stpgZIAd5IvznrDgPV2fy+7GhhlGW4rgT/e9Nd1n/LL51VjwGgmjmjK59QsFO9N0EHQ3+ZH7x86rupL000B3e7gWYYW7ofdpxo5c2Ul386puFOATH1HLUd1tAfzL/OCq2bV17rMUDltIO4ffXfjjdALS1e3Ii3uDCjw5PgHexnQXtF/I+nb5i9GcR9mfV6nWQRWkWfRV8AhMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FbWkh+cn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FbWkh+cn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfC8j3hcwz3c2Z
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 00:25:57 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso30548075e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2026 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533554; x=1782138354; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS4hKl08e5fFQM7CS+6rOZwYJSvHMZdWZRds5aVjNjQ=;
        b=FbWkh+cndMG9fJVsI3h/3VvUx0yjy3rOX/X66rXjitZBuTOoA9UfVPi+8vpDPcxZH3
         D/rFNe1TrZ3h5gcEjRgRiwr5eEG9JyFAf9NNYvGvu0gb94GdWmZzjNQyxLsVNanxphWk
         935vJ2lR0PatD/xw37B0lF5+UVeE2MDRM0OQBY+RPBIwjY9Pr4OuKLv1685IpjO2tYTq
         t0KgqV+Pbqk468V9rZR2Oca7aZYlqnLNfW4n8Tvru/4qBGVXrt53ssGUk/vz/htZ0MGI
         8FaNK5+ztgS2k6ebjIF09F3YlOxRnfOZJJr+LeJ7ZSxMYPh+GdihKN0bOh6EltVQkc20
         dJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533554; x=1782138354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS4hKl08e5fFQM7CS+6rOZwYJSvHMZdWZRds5aVjNjQ=;
        b=QDxWTTH8LHvTGciu792//OoPsujOhxI8I/WpTZwEdAi8d6Q8piBMT7gqkRZZW4nPBS
         k64BqkKVJhfBBCLgrIE1Bg7459Zhxq1sfaTIt7dUSXxHK9TL1ugPph60lmjtsQwK6ods
         39w0Bn5Fs5qTAQOIz0bd0Udzv99RobKpAn1jKm8ZnfnX7JhBaf6mbBMW3ScylU7rtfFQ
         IDN8QOqXb7oASnvRK44wYfX/p49RcnHTvl0mx+ZzrZ4V5gkWrFBk2O/WPYENYkD8gOC0
         gmBulxCjUZkJBMtTlrgIesA2YXsDkSRcZV9St6NT0iRml4ITskTT2gev+e4Vn667civa
         m3nA==
X-Gm-Message-State: AOJu0YwUlVn6EnDvgyimO99R1QfE95yRhXzGLQ/WiAcnCwEFytoLhFPj
	5HwQpIt8kE8Kd+A3YR9hiJ+trucSe6McON2ZYlIohNEEpoD5Jd9RDKiP
X-Gm-Gg: Acq92OEWQLMRAT33jWDBoF2ukNaa9GAYGUmSfba9eJApYs9a3gU2Firccyo2cyttt+1
	37bFxgC7IF6bHJhQE9CuHp4hChRsnsRrwn9+1uwiI7WKDWuO9N6QDMlt3fuUuP2ouam3Pu5hEew
	gsfVYYuvNzacZ/9lJCCfj1/LP9d5kb6cpK1nUfkFINUXGjCtiNmErCSkMbdEjO0IF5dMP1zaFVI
	cqqQoyzuAAeinOTiqkqCKGKljZTa+j4dCZKl6vNKOkda3jH8RUsG+SDn9l2HGJD//oew9QNjkUU
	8Sr+hUE0S3r4NYay198/zuP2TMfzIAzPFmFllorLdO4FpLGUjYqFV+xmQxKVugU9g/WoE+YWJsP
	Uta9TvexIJjUVQ1eg+ObTj6Ou9GWFyZ7I+p7+BGAtzMK7j4p1MmLCFiN6EW6DTwXSmRVqcwXeBb
	ckijk6MGt12oG0WTQBrPibr+q23dsTCHSA5w==
X-Received: by 2002:a05:600c:c0c3:10b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-4921fcb3ffemr112530735e9.0.1781533553436;
        Mon, 15 Jun 2026 07:25:53 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:52 -0700 (PDT)
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
Subject: [PATCH v5 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Mon, 15 Jun 2026 17:25:44 +0300
Message-Id: <20260615142548.1373799-1-tmaimon77@gmail.com>
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
The fourth patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
such as PHY modes and SPI flash partitions.

The NPCM8XX device tree was tested on NPCM845 evaluation board.

This series depends on:
https://lore.kernel.org/all/20260610121822.2524634-2-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-3-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-4-tmaimon77@gmail.com/

Addressed comments from:
	- Rob Herring

Changes since version 4:
	- Split the timer0 clock-names cleanup into a separate first patch.
	- Remove nuvoton,sysgcr from udc8 and udc9.
	- Rename apb: bus@f0000000 back to apb.
	- Add no-map to tip_reserved.
	- Rename spix-mode to nuvoton,spix-mode.
	- Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
	  as /bits/ 8.

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 413 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1126 insertions(+), 19 deletions(-)

-- 
2.34.1

