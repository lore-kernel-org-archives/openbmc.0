Return-Path: <openbmc+bounces-2117-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0400CDB46B
	for <openbmc@archiver.kernel.org>; Mon, 22 Jun 2026 08:31:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkLxv6XwKz2yVd;
	Mon, 22 Jun 2026 18:30:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782117059;
	cv=none; b=G6ZIStDxoal8DIJ41ik+p0EvT0gCy+Q/TuOJNc/wh9sQuMK1Us0ct39sdBZKPiE+uJ1TsgVIR5/fu1q2nv3ZSEhXJ8DL5CiaXYtYiHdBmUbhHdDJ/zBl89rn4YBxZmjEvlzmKzmRBuS0IZIrBUssVzftQYVlyWM2pt8qMElFlErIo5tu/rXAIPmrJ0GH/uLWGXBCKHKRZtCCPktS7qP2TMigdfkdTtiGw+8bTMZXraIxJIqnZ+FonLnRnoJ1p2TiXP2CaHvmjrfeTaB11Av3ymjdqybbqTMLV24Xkd5Lc/WGgO7eJkPHPwyhrEXKMr4kuOaR1k/9PhUeSqdSFCVtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782117059; c=relaxed/relaxed;
	bh=wQOCUaRpEixwkQO/jMCRS1iA3oZk4GEUUJDXJCaOQNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hG0LHTJmMaiE90m2DqNPldJqXYsSpwB1/igsnzjliwKN309ZRdxrKOEcSVNP5bgEHDhPPWtmjKZsxzZDCt1ZKavdFVdqUsvSh4HMykwLSRMKRzcA6Q464LyNW4lQKbPLLrYC386jedWJe7UiIVIjXh1rdwUrT0wiqnzy3Fywoc2IhocwD+Pcw6LY0GtDavL+QlFAYpjy5OPvPhFXf9CKjPX+0a8z/5VTWpxfcrU94aGIew3ij219WcJx82Q/sehwxd5LBD1XyT6Ngp+G0g4FcpZqKVekTH+H/3D2U9+6JV0ZwWk3DLmcoeWG61lShStyA4r0wq5oT462RHdS8L4evw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZBMEZEHd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZBMEZEHd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkLxs52Xzz2xPL
	for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 18:30:56 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b9318997so27288785e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117052; x=1782721852; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQOCUaRpEixwkQO/jMCRS1iA3oZk4GEUUJDXJCaOQNE=;
        b=ZBMEZEHdjHU3IL/aGxr4peQK+rpYQy8rEL16JUmjslVt5TkqZDkMw+lYq/p4TlkDT8
         ZGGk3sH7mC53/h4FC4OfOLRIcfgamcKZFTcWSixZdMmurob3grmf9hTXP9xfLgRb1Qk/
         SnS0UJHge98eMlyvmL/46V1NihgldUj+UaMgEIjdH13d5LAaLKLnjzyK1VKPGwt5pgSx
         bDw7YpAUxmCmIEiVQA65mvtVsBiz3b7/ft7a0dVvOrjZrnNJWFeSM8dwZKmYFnHhfQ9O
         BwoejXgypODqvnKFRlDoKtlW1CHxBm1OPntxqCJRZAmTSS1vAyBAj+6/rgd4ZHN7X7+w
         KnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117052; x=1782721852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQOCUaRpEixwkQO/jMCRS1iA3oZk4GEUUJDXJCaOQNE=;
        b=b2VXBoV3yG3lUYQ8dhL/+s7SG3WvV73eR+h4qL0YqUILOk6Tta+pvgYMb+wuwmQqOF
         bA/sz+uOk6VKWcERK8xf0XzMVT03S+QdbLe6huqU+jpZyDw2J1BP4WIeN1rcrIcPo6WL
         a8nFjyE0xw13STzZ2mRQ28oAQVYeNvnEwbPy6KNg3w1tJ9838osOsUYN7Sr7IkIRBy5F
         qGI/zzukiBy1atDLD9j019EqRIpjZflN8hgN9oGrcD6dKaI+QT7uI1gmmPggI80Yy9RT
         7MI8QOmPCWc6Yc9xtMTPljkwpvgIEc6UdcyQsX9qUe8CtweBF1e4P2niAUZhOGJhKmq2
         hFow==
X-Gm-Message-State: AOJu0Yz/ww9eTIjz0GjMpc8gKCBY1ZvD4nBoH85xDZQtfS0q6DF50otK
	VC4s3fsuA0+gQmgasGrzUY8IlNuAYR1wKLKe0XWBud61SzLkJVgRJIEu
X-Gm-Gg: AfdE7cm/MIGf8ptYlxyYl7xzeHruu08Fk/pcEdTJyzFYl1rvIaOh6KO4EMBWpciNgPx
	WtfH34LPmFylIHCddiQhFNLSCUs1JEwweQblpG8mD8aknCXtepT+c7nHYSU4zwXE64WX/zIwaJj
	cmAEeu0sgW9Inh3WM5CvufS73YM0BAE9/CmKyRGAzyxTiObR7vcRXoEfRpMQaUoHKMUl2zF93Ph
	CEjON6jtFK/QnC1zJGfvq8oCnZJaDEskA7/rNL0eZgDnUI5Sh6xCqR/WfLGa64ODtmCuB9bsOO8
	VOKUXQEcsflKMQNh9b4lUuuAI1j094cXK9tQgA1d7DzT+/TXhLDe9gCwQWhqcmUbSu9SC9n0mpi
	qikzCIuKtIeKsoDe5N4XQlNXnvDB/7ueBwo5A0QDLgULlsFd2PCdV3baUY6KriVcId+Arm19Qxa
	zBd7HBwWBKTSa1XatfBE88ajA=
X-Received: by 2002:a05:600c:468c:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923eeb494emr220979255e9.0.1782117051481;
        Mon, 22 Jun 2026 01:30:51 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:30:51 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v2 0/3] watchdog: npcm: Add reset status detection support
Date: Mon, 22 Jun 2026 11:30:43 +0300
Message-Id: <20260622083046.3189603-1-tmaimon77@gmail.com>
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

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Krzysztof Kozlowski: https://patchwork.ozlabs.org/project/openbmc/patch/2=
0260210133843.1078463-2-tmaimon77@gmail.com/=0D
- Guenter Roeck: https://patchwork.ozlabs.org/project/openbmc/patch/2026021=
0133843.1078463-3-tmaimon77@gmail.com/=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |   6 +
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  70 +++++++
 drivers/watchdog/npcm_wdt.c                   | 197 +++++++++++++++++-
 4 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1


