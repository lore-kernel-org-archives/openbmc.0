Return-Path: <openbmc+bounces-2062-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E8CD8CB9
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 16:39:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZZPb6rx3z2yv2;
	Wed, 10 Jun 2026 02:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781023171;
	cv=none; b=moxzk2xa5M42Np5nMk9hRrRNwo4/sS5i45Ga5Dl2KHRPn3vXpT4+MFAuupqtAlnvbJdn9X5GvFOi6coJXrcry+cE69rk+VkZjOhw62Ey+soLs8pa0tO3TTBnlMc1gQIzBgCh4lEi84WdeoAd1Rr2AWhKu+KvtvKpEjWMNcJvPO4cGtkBgQ55WBDgzW6xtHbMcBwAL7kBAxHqC4Ukq+wL610+mCNyk27X8Ud3top2w/NeosAxD/waKREXzuqsMFPpitAr13e8+gRS5O5o/Gx4r8myCwwSPITFQjM8L3YJ78GImE9hS9jlXFxzt9UxVgIYGXKxL8JNl0NPLXd16Ozbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781023171; c=relaxed/relaxed;
	bh=rEZz4XYqJIq2oFsihOIDTN5BDVC6/Vtpv4g/jjgK7qE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PVQMGcJop3poJvZrOOK0c6a12+8imV+nuOBJTJ/qvuXzNzQvadnEfYIbDfvFbW0+88fjG3GyF3CCODFA2Gi8qvhvqx3LCoCdoMWhUE02HbjIPxpl5zDdrgRRmVNE42IkfYOaT9muX3o+JR9caKmh9yY3UfopSY3VOM0zk9C0c34uSa3m5KeNS1J0aKARWkt/vQhIL37TSmSyr234rTOQ/g4/2G0Bo7vuoHdCJWZAlZZrykijFCf9O4o08XqtQ06LPLDliBgAWK2cgiq84hNQd4oSVR1MDOEam8Qrsv1UXUx+tsm7Lqe7IdNjhegKGJEpjL1fMeSgYLYBzdQgfVS2Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XJzNiPKB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XJzNiPKB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZZPY0dyKz2xk7
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 02:39:28 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso44665405e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023165; x=1781627965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEZz4XYqJIq2oFsihOIDTN5BDVC6/Vtpv4g/jjgK7qE=;
        b=XJzNiPKBoy2+IKaFZrJkqyetVU8lR6hTkK8RuNUktLkSIOejObTia0ZN0mbXxheMAi
         pzaY+2b5RWlGfGzoItMg0RVe3h9srXfJLPV+uyvLCKsc+Nz0vdDu8gsRzD5wUAVqYBVc
         tTcHhXzqmosEvPXsS8VJtf9J+GO8zQF0jEDdKjqk+qUghE+dAurSvAYs1KMhl//WSxo8
         zTMN4VEp7YMXAFX++bQ7slZKAo3HHacZzJnvafw4C/ne3ChcDGEEay9/nNpdN288rycT
         J4N3fFHFa3HuQGQ1dHEUekhyvhetbpBgX5IXJMuR3rn1K9DxFTUJ7lT9dPKpCSShsFjw
         wlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023165; x=1781627965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEZz4XYqJIq2oFsihOIDTN5BDVC6/Vtpv4g/jjgK7qE=;
        b=DZXUCNJQmg5RZW4YZd73+WMngJeayRtjrPmMzsIXYPFYR8SYsZsAVGzvaFs6p6G7dV
         mocpJPkGebFTRYhoXxUfgXb2v65hIkzAdN3YblqJdncJpyE8FZTk6UjwJ8eTM/GBxt14
         IFDoHL4ceDbIIdwI9gM5ppMUTOJoyF3Otlmv6DHIhdnSR1Gf+S0a+JUESeGjXEHm3Z47
         VuQQL4fyPcAZqO5P869A+gpbPIl9OkQufB1kBDt6/t+Ayi0pGPi3xFl7WapPCZq5/Gy6
         2UeLjid12VGtyHFvpbWw/ooZpH3Ti9aCo5qkat5Vdq+Q/Tck5/54YUHMzh2uy4siJI2O
         Wtsw==
X-Gm-Message-State: AOJu0YzHelMT0jr0dgFkHTmlulJ5ES+RWs4OiTvow+T2pgJm/suYiRbm
	E12jqd+rmq1YdVNKxobedvKKgoFnHkUQ/qfbAWHW9VHDSKKt4IBZZUaLzkB+bA==
X-Gm-Gg: Acq92OEhdQIw7E1hYuzZDW7Ne6McPF7UvXCO+T/tk9FIq91uMBt2qVy8MG/q4ptzpZk
	Q6cfvOWaQ4RUDjwF8nhp5TxFI8CUvk3IXzRmFYHRrnJ8xZG9PH6SbM4tSGnNbktFtc/vEM949SE
	MXlUPrv8VVqmRZ44xwMrglesCCxSDFTuzUUpYqpjEeCNW2255ZJ/y/4OlzZ7MFiZQqUhJa0eKx3
	Tu+ZOzlwQtE0wv9nG+/w2nEzTcOtdngsFIKPCx/zOG+ctcOyp4ebBiqguamuT7sdv/mc2ZZkDqU
	gpyB+quuyfgFcibZFmP+xQ/eA/Ktf1MU8a4vOKqAk+NozOwlPl+eq/jUQaP8y+9pEIHAgjd0HuK
	olmOM8zE92GYN6ucljRj9DmGhh7pPr8hwpAVOwjv/kWKyzi4a30msnPv4P19ltZjmbGJ864ti73
	kajxSsr6+Sy9O9dDieTfvoacl88jwo1TN974R+sK7+IUYo
X-Received: by 2002:a05:600c:8285:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490c25b09bcmr362197115e9.19.1781023165112;
        Tue, 09 Jun 2026 09:39:25 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:24 -0700 (PDT)
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
	benjaminfair@google.com
Subject: [PATCH v4 0/3] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Tue,  9 Jun 2026 19:39:16 +0300
Message-Id: <20260609163919.3321228-1-tmaimon77@gmail.com>
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

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes.

Patch 2 drops redundant clock-names from those single-clock FIU
controllers.

Patch 3 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.
=0D
Changes since version 3:
 - Split the DTS cleanup so the reg-names fix stands alone as patch 1.
 - Added review tag to Drop bogus FIU memory reg-names commit.

Changes since version 2:=0D
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the=0D
   bogus reg-names cleanup.=0D
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names=0D
   immediately after compatible in the example.=0D
 - Explain why the direct-mapped flash window is optional and model=0D
   reg/reg-names as ordered minItems arrays.=0D
 - Drop clock-names from the schema to match the driver and updated DTS.=0D
=0D
Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (3):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1

