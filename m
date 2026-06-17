Return-Path: <openbmc+bounces-2110-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECCCD98E2
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 13:32:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ggPt045vdz2xK7;
	Wed, 17 Jun 2026 23:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781703144;
	cv=none; b=OmgLPiTuE+Sdv2xeLTcaLxBg5oDjRBjXzROKQyvsiShznACehyj733xykWz+ZHn1Q83Xt2zuXpMFSWbUPCUCjSjuV3rSO6e8pMAlKpFaAu7ujxcWS+JYFEi71wPdE9uQ8Y8lZjqEVSjtc9UIQIbwjen821SHEv5+85HegLL41+mbNwYUR3OIoffR75VwmpJh4pJ0jiXtS8DRhIoQfgjyX903L2HY/+SPfEFd7R10IXwqAMI5k60o2a4rEs8B6oECGK2HiwpyP18dmUwAQSsUbZbx5i7sa4woWJ3KiY++g5mrTIMYvEYIv8PLpLMRfrMWWbA2jFLr3mPjlNrHQw1gTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781703144; c=relaxed/relaxed;
	bh=fFTX+AiRaMQbMH9lj/OuYWyjAe3WfpdoaTeBbXZUDPU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A9W4tly0NDQ0oAORCFwt+aRtVN+dKcT+pOpZJNsXPi8atTWfn15nGWLUfKVsaca9NQ3NZ8fOgTXMTDupVT6xIFTqTR46vOcC7YL79fVsjYiymqrtFIQdu4WNIDMuGxD6bLlW1UMW+eJcx8brHTNY5gtOAQl5cKVkWoPdN2F4GFlMBx4mggJxGij48T+FIbLmw1kvCQ0080NmcNLz4gGVgHRs23mOz1ihz+k2xrKoeIq2S7gCW8pLJQYNnxbKH8qUEEA34rzm+ZihxCXkVnQEJ2/J3adyccZ8SVbGY1KayDcWoQdZe9R5/iBm28K34mAWji/LMVpVasO1Xy5GIisTRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ebpLQ81N; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ebpLQ81N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ggPsy6sGqz2xC3
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 23:32:21 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49222b6e871so42356575e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703139; x=1782307939; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFTX+AiRaMQbMH9lj/OuYWyjAe3WfpdoaTeBbXZUDPU=;
        b=ebpLQ81NYjw0vvczuZlE6VMAI2Sg6F/cUHwtSMZanlcxFKFySXjHo/Q4m473FhPRTi
         LAZl8gwnYHNNyzQ2E8ZUIMjtghusopVl0wPJui0x1Eaa0jWqM5nRsnmFtg1gjt21xzB1
         YXkwvyf3RnKut3vr3Aw917nFcyrZUCRbaoO2eS1q10jiuwTdqywNdvuzEgLfzRrPFB96
         GCo1bYKZnXjkP39S0XF2djtA79JkgLe4JS1nYtn5FfYlDvQ/IyD08J32KnifFpkAxFUS
         BVd57Q3IhYYjovg4Nlzi1P0YUivznL5vYy6y56SjLN8pugrNL5EmRv3HqMQxHIShQeue
         kpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703139; x=1782307939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFTX+AiRaMQbMH9lj/OuYWyjAe3WfpdoaTeBbXZUDPU=;
        b=fw6dnR/D5zrXm8U2WSkieOvc2EYhm8zI/fz60H/Z3SAedg8nUBgE6UUJrCwAiBSyB0
         itIk4qdf1n2LbWbCBwJmQUJQFIgqItdklglhFx1BwQZ3cg4dsBN2ZI5zWOsYWc+TOZk6
         O4LLT/owl0hIwMKM14gNmJzHxXoNBoCxTQq/BkTMqwELxEXl3hdpo9ZWuzKf84QAM+AM
         qi2Is+WqsAV3izExDYR1Ggzh5zekaNUer4wK/sYGpIgviemyD9k8FgVBH2isjCP4QwJM
         D7o3+qtaKJ4z6DdS3aTQwGIkDCroumdOL7lwkSF1XXEr/FIjMccZCgp7ySROefnjRH6i
         FBYQ==
X-Gm-Message-State: AOJu0YzbS4ADCabfE94NGVJAj4Hd4h82tLXPObnOa2+/4D7x/m+H+NFS
	RVH0KZd3zLVMsBE42ZLb/BqJ6YDqepNEdptZuIW/gmLZazTV3U+jx+E9
X-Gm-Gg: Acq92OHGbpqv01tVu0TXUOdxsYk5I9OzMLi+9dLN0Q4XZmV3IlT7jON1d+c6gkpPS2c
	gkZBxTmQ++qB4698Q/QYBD7vfvLtHr822I2T9pi5lYfTzWscswRmbTIJ2T1ZXMrDmzPFGsWfm1k
	bnI7XaAK7Z3JxCsny1i0dym0isrrkrq4PZVmATAuNr/3RswEQg/9kgnAZN1F0uGVswDImGFKghh
	8T0nbCRZHqdmdo119vt5ufY1qo1VqNerSJ28DvgYyYmHpjZLBvhis8cAiL1QqHYuPhh9822kO8c
	0Hl3KxzCWcr65D0JazQ8XchyMWX+kQ7TrG/SxkS2rx3T6DiG8Ggt7pJLXEhktPXPFE7MFfbYQ0T
	/l6dHrwQNWWptluYfPfv3/+cbGpbf/5YbhiRb0wWgNJzIzc3E0Oq8CtsPzw2uYB1fgJNfrHcM30
	1QmeNRyjVGuaJ4drgUMzcUshs=
X-Received: by 2002:a05:600c:8a1b:20b0:490:601f:d776 with SMTP id 5b1f17b1804b1-4923410091dmr42265145e9.3.1781703138441;
        Wed, 17 Jun 2026 06:32:18 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:17 -0700 (PDT)
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
Subject: [PATCH v6 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed, 17 Jun 2026 16:32:08 +0300
Message-Id: <20260617133212.287768-1-tmaimon77@gmail.com>
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
        - sashiko-bot

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
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
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 417 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1130 insertions(+), 19 deletions(-)

--=20
2.34.1

