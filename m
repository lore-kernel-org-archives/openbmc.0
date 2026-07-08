Return-Path: <openbmc+bounces-2242-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51F8C43602
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 17:00:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwPTc5q73z308k;
	Thu, 09 Jul 2026 02:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783529988;
	cv=none; b=AQtGk2X1RCKXdfmCfQy2oK4e3cNTZ0eP1ZiHsVaJWjFDwvvi/6/suDaZPpNI75i44zMOMKh6qArNtU46NkMhWW1n3w1NkMHkbeU9mBdRboHpWFs1rPZegxPwUpBQ6qF3T+78QAWpqMYLrDADt+o7Q5XtzkEj+8M0wTA/EdAxsazP4bg7bAZwalZyGeRbk4IV82ApczsM9oN1y1en0/qmMphP22gbM7tT8TPpXKm4/KdJEzH32MJ029XVBJ+qEcaohUFPXY0f9pawnn5Fnqf+74hv+sYgssF6fhGiSxplPwFkwD5uclEnqmwFa08azvjtC/XiYU6tVp+OLi355pipFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783529988; c=relaxed/relaxed;
	bh=Zq3p9Jd1uMf+zvKdqsUxTIR3QC8XpydmsK8x33evoe0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QpvPBqixCOtX0b71u+VUbYna+JKtaXv+kxW7AmANmsgx1TWwC2BJkqW8I+SYisc5dLxkAEoVaBT8Zm54JfbnDbDhOAFjMOfEdpUTQ0IWe54nlP7s+v5FM92d6N1da6giVs2hWhkitbCRQaOg4AiuMlldGgxsYi6VpuE9M2kjI7C9peBWfnfcu5VOzfNhAMNAddGNWpsrvttxilLPqqjhHiOwlZzHMnSPGdbJzp5bPyoRE1xS/QrNmDfh4UflGmSobnZ7T8fzqIGSnQiVaHQfq4iploLaX5ieuM3RUyc5j+LQBmnoMDm39Y4fTI7/IXJHovl2Vz4mCsQG3cSenw45wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TNrpEK2q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TNrpEK2q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwPTZ6zDXz2y7r
	for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2026 02:59:46 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso4164415e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529979; x=1784134779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zq3p9Jd1uMf+zvKdqsUxTIR3QC8XpydmsK8x33evoe0=;
        b=TNrpEK2qSX10p8Y133sIlYn6Ops347BdS2A6Pw3BJkUVefloHb7AoPz3xhfJ2sXty0
         Etkcd60UPG5SgN2KnqGhGiXK/e+IL4bJvGHW63MFIfqUTgDbe9yFSrrPQylXKtJdx6QF
         V/x9lI29f2PBEZXhQYiLYQZ2BNHR9xzIOmm9nmpDofrKSfjvvhbh20vpMXsENbU+79B2
         85AlPnNAWCAOy+eVkmzaNzAiEmKmMFglqHODYOqIaU25KpPrBNjX/4dINjmo/VT2Sr7f
         VPOyTDoMEDqiIT5X3scFMWhPMhR/NqCmNq33/68adRADA0bbmhenrRS9907iK9AZF+ZP
         xC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529979; x=1784134779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zq3p9Jd1uMf+zvKdqsUxTIR3QC8XpydmsK8x33evoe0=;
        b=f735jeqY0MUe2BMyKaTDDVJADw5ILNxBBlvNdOrC5u9PWqxw2DKTRH+SCYdk0unG4v
         03v0Yf/8VdvvoqYvLxdG3ZNhCBB2u3G6sDNYCtQKEKxz1HNmCKAP8OjZ7fLEVUf4mMdT
         9ABfIlNdMseOUF2VLTrmKCbR6gHbSiXNoHH0CYzVtBzDzCvz6O1LczkZDySgPVk4SxUH
         KduE8SA03VbuwspOKQMv1Si6GoglXuTAYZU8m0dUfGGXijq/VYNdNa29aiO5EHpE/T2M
         rVeaIN+hXk7iiEBldKp1s8KnCzdDmADQtL6jH4042b3KRxf5mDBuWY2+3WcCQO3lOANj
         iktA==
X-Gm-Message-State: AOJu0Yze+4CFDNzVeQGPBANqoJyj1ZkiTYqjyy+nh3o8Hgwv61l2fuC8
	EMHAkzrUCPmbO96ymMCPbJPagre241l0An+EFdvPli91PJzLLB3JGJaF
X-Gm-Gg: AfdE7claGJmLrLqil8BPT5yziNvBQTqdzKg2qEXmsj2nD1WRaCzum8OBhowyDcVjoMW
	pjQ5sXkIsP052graBE3g+caTzfTUHoD7EFihkLOj30o4CRC4PFp7zhep1MAl7BXPGOl3FC0/vq2
	TDfmYx4NYIglFE59rEXkfYOKwN3i1qX1xSIic/zED1+W1P0oYZgUcCKDJX8zkSNPGa/kKzTQ3jU
	DXuElRiGYvimZxQG82sbtRywfR7BHTlLkpDPlv5SEvWPG+z4hvoH5mJ3qrSqto20O+hkoAiB8dD
	zTYCmWFMhqIQ4d/GvPNVA40twF/jPJRo5xxJfVwPqlf+JvB0pcJZZgKK9cleX2sYIVAuHxGUwqB
	4qozGbfHfPV6sucrS8KtU25+TivNrbL/Xs4IjYm3yZaelCejNmNpRgGOfrcYA82AIfkXgNP/395
	VfzjeQSdbC4hM+ItYnnxlaEIs=
X-Received: by 2002:a05:600c:b90:b0:493:e97c:10e0 with SMTP id 5b1f17b1804b1-493e97c10f4mr6839135e9.35.1783529978222;
        Wed, 08 Jul 2026 09:59:38 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:37 -0700 (PDT)
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
Subject: [PATCH v8 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  8 Jul 2026 19:59:25 +0300
Message-Id: <20260708165929.2233934-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

This series fixes the remaining timer binding issue and adds device tree=0D
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation=0D
Board (EVB).=0D
=0D
The first patch drops the undocumented timer0 clock-names property.=0D
The second patch reorders timer0 and PECI so the APB child nodes stay in=0D
ascending unit-address order.=0D
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,=0D
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device=0D
tree.=0D
The fourth patch enables these peripherals for the NPCM845-EVB, adding=0D
MDIO nodes, reserved memory, aliases, and board-specific configurations=0D
such as PHY modes and SPI flash partitions.=0D
=0D
The NPCM8XX device tree was tested on NPCM845 evaluation board.=0D
=0D
Addressed comments from:=0D
        - sashiko-bot=0D
=0D
Changes since version 7:=0D
        - modify timer place.=0D
        - add PSPI to commit message.=0D
=0D
Changes since version 6:=0D
        - remove IPMI i2C device.=0D
        - Add FIX enable property.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 5:=0D
        - Add no-map to the tip_reserved firmware memory region.=0D
        - Drop the unsupported snps,eee-force-disable property from gmac1.=
=0D
        - Rework the FIU0 boot flash layout into nested fixed-partitions=0D
          under the bmc container.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 4:=0D
        - Split the timer0 clock-names cleanup into a separate first patch.=
=0D
        - Remove nuvoton,sysgcr from udc8 and udc9.=0D
        - Rename apb: bus@f0000000 back to apb.=0D
        - Rename spix-mode to nuvoton,spix-mode.=0D
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch=0D
          as /bits/ 8.=0D
=0D
Changes since version 3:=0D
        - reomve tmp100.=0D
=0D
Changes since version 2:=0D
        - Fix dts warning=0D
        - Arrange node order by ascending unit address.=0D
=0D
Changes since version 1:=0D
        - Fix commit message=0D
        - Fix dtbs_check warnings.=0D

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1115 insertions(+), 17 deletions(-)

--=20
2.34.1


