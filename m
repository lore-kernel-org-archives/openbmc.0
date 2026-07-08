Return-Path: <openbmc+bounces-2236-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C3C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 12:54:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwJ230GzTz2y7r;
	Wed, 08 Jul 2026 22:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783515242;
	cv=none; b=SOV2zUMX+HRGLRYHPEJSjFKV4vBOT48ZQqJHojHGTAmkAZRH2PbPk1aEwb2FDmRV9NFBviCngSsGqqPZh2befqUpGDG0vii8crwqe6/YWss20eb4qsFsc9np42fggCHE65qbGD9VZbltQfN87y1CWRNdVpzcQiLS9nl0yrPQapad8uJ4+rrzxyEUjG7I9J0c7NYkbn1W9mGUsF7JbZ7Q6P5KV78BZ75TD+EDtrtNnLmKssrS9uR4YNDP+2AIlVUaOVC98KITQPPIx+YYcoislwgRJDPIhXDe64rALf5/OiIK9m1aWfMz361vvvTC81I/qp/jPLH1LPIZ4cuEHZ2kdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783515242; c=relaxed/relaxed;
	bh=1RSaJMjeaGB6GcB8fb52mqXxqJO7LMKxD2/vBnG8XFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bOINvKXO94aNN93AFotvs4gzo0wW6SfITkI3gWDyDQ7n9mzq3vrelpCrqQCBOL5UVeDiJneUvrqQneRx0zVkz5b7GurBH12iSji6Flf2HCqt92PNzATb+ivBPTMN/24MOaX6myIFQjwK49fO3mwoxy85nVVsCvQFI0BiJqKikE0P2aFCMD8q7GYSBlIkodFflbt5SeakjW/BDMtYZSrfbkyzVLa9lzM6M7WJ470xB7ugxQPAeJ6lv0IkD5UQKkKaTxxebvgG2mU0GYui66Io1+9ISCnn1qKB3InQTpdT5reVXMD53n+TOp+sGNfv7FOuUeHr+reZI3yXho33WZQliA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aZNrYvTZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aZNrYvTZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwJ2103M8z2xKh
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 22:54:00 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c1950518so11491395e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515237; x=1784120037; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RSaJMjeaGB6GcB8fb52mqXxqJO7LMKxD2/vBnG8XFY=;
        b=aZNrYvTZ8wclZdrH0ShmqFKPLF/A/7cMOAlxH6vwnrrqAPYFiBdlCRzTAv25Gh6eTk
         s7jQU9A0kukkHHoMlWNnuIWGhxK9/e2NTXTGOMYu61KCq7WN9+NB9s79xbPBtHj9s1fM
         sIXJAB6FRaVM7dFNcMWTQX97Q7HgjpUng3vJeAm3QaO4eCgFZP/hLEIBGduUCsNcccHF
         nsZeK6TczhMmLN0+xX+0m9XwRnmltsPVXGrLG8nHWggnwt1BTs1Rlys6FHbTR6q7Eon/
         AFZm4/muJQFVxrZgsXLTVKkYj4vKdL4FD+opPevZ/dvyk7mXltLsCG9Zcu7/81BCfkIc
         wjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515237; x=1784120037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RSaJMjeaGB6GcB8fb52mqXxqJO7LMKxD2/vBnG8XFY=;
        b=GFNuDaHagRicQKt7s2hJFEKmGWzRVKx1tZSFW3bkJcw4UvWxCgLblu2AKlShqYCOd4
         A7SmMAR7XOh8V1syllnV6W+CRnIUZZvvcTmi0ZiSf0Po4e3SCUx6E7n5lyMp+/6FlVNw
         W4XXZLI94gzNDUwZx5k22olJMCeYJcLSVJfNEkvHOpxuld0DXMQNRXXNpi+6n0Xu+0mR
         mA8Lhz3GhbO+wDndFR5NPXxFIdeTa0HliX49BKIMUwH3L1IfsF5QbIEeq6l/AADMfRSn
         GZByHRHdgi1J9dNRZpgHOD0rwrpPKaZbYW9n0wGqQf69DJO6Bawjx4bOjeySag/uwVrk
         D6MA==
X-Gm-Message-State: AOJu0YypPfnFn1vbwSdUjR/O5AJDAyPmL8Jq3M05/6svYDvTrnio+6DT
	CATumlVIvfkUCE5uGcGs+gS+YKG7/EYc/33g0PeH2Lnvaziu4xVCDO6v
X-Gm-Gg: AfdE7clGBqS3ZVXkOCv4YkdiEUzQEt6/OD2/5lEuXLgWp9g981hFWN5m8p3FBDeH1QC
	O+1R1XbxzDTq2xjFRmuLjXgP817TRaIzM0xTZcnvwv6iIBmVOLHyDq+rMmRgsCW+p+sajoDf8FR
	0i+s015DBLcJQN5my4ruQZrngJ2uvmq6jbmkFwtSU37HVqnnJ/c96UrVpdaLw+46NtcDw6gpHW/
	MEwOW61B80fHn5h+Ty7Cq+f2tUkXcyyfEPaL5hiJcdqNqaovV2D0TOTZVrmcnWDcKFKzmjvxqkq
	TRvEb9vKnumveOIHOL+4IcDo/tqfq20yhX8b9YcTWURQbkHe0tCGnOY5ONUciD+WZ1h3d/P7ktF
	QuD5SWaqmzU3+borVYFGlg0Vb3O0ZouZB74fWZyX6t4D87Mx6BNbEU8gn0khn0TSGetAYteTjS9
	1EsTJXu+12F94IhX7Kb/5JAOw=
X-Received: by 2002:a05:600c:6208:b0:493:e542:ffd5 with SMTP id 5b1f17b1804b1-493e63706b2mr24744225e9.5.1783515237090;
        Wed, 08 Jul 2026 05:53:57 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:56 -0700 (PDT)
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
Subject: [PATCH v7 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  8 Jul 2026 15:53:48 +0300
Message-Id: <20260708125352.1915040-1-tmaimon77@gmail.com>
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
        - Fix dtbs_check warnings.

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1117 insertions(+), 19 deletions(-)

--=20
2.34.1


