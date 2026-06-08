Return-Path: <openbmc+bounces-2050-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24723CD8C9D
	for <openbmc@archiver.kernel.org>; Mon,  8 Jun 2026 17:54:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZ06q3Zcfz2yv0;
	Tue, 09 Jun 2026 03:54:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780941283;
	cv=none; b=emm5AcaUxkI+6noRx2FxfOgkkJf/1EfTUaqgt0EctQAJsMkU454nrLUYRSYnIpfXAqYVx0GkGKIcHZ3a0UPy7eS7vzQ0iObzyTflYNT0sKw+8lZdC/FMSAeKRAM5oienqp2jCacncofc7wqA7Ri+PecThJpVdp+wc+YeJNHdDtN59ntJPa7y5uKNDcyFHq8YVFJzYvviRpbT8Fozsa0JUfw9uL94SwZluYxAYyZFE8jIEZW43cwXIeMI+0YFx2ZFe635/torU6q+y/LEPIHYPqlQrRB39tnOPc/4N0dJB7Ywa9Ih1+adiV0uFLkrn0v6DjJOFjxGQP82s5KwdumQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780941283; c=relaxed/relaxed;
	bh=cGF7+QWpJakGRZT4D0HON+vY+LPOCmvLkPwggXClSNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GxCftflxStsG2WUFujmFdktwz/Zc5Q3flKQg5OMZnPg7TZnj81S4zC5pIV+I2wi2HDJn34ncZCpM/ht7u4EX3CFRQr3KmNhNAlKEJWNl+46iFVYo/ujnEpiIW6UPiHcYmRw9c3Ka/7MPZwrPBDsoC7XctSadMDF65hCJR79tEeyASkzSPSWL40izTblpttp7UaN28jmeq6pgMgLL7Ea+JNVnFCUlLirmkpnmG+NraT93igNNXeSVZHhp69LapJ1y1r9EFC9fKk4gwdt9zindTpFk1fFjw/XpezRZX9OpRwWTKa869MuCn/xwD/Foz9X2rCY8+pvm6Ifjxn1K23DHCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YYr7wgHH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YYr7wgHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZ06k4Dfbz2yRM
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 03:54:38 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4908b92904fso53722485e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941274; x=1781546074; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGF7+QWpJakGRZT4D0HON+vY+LPOCmvLkPwggXClSNo=;
        b=YYr7wgHHI+Pbtc0aPjcA+zzpZCRW2QQPOMF3vAuutJhGZlRPtLnH3i/NCBRcv8724E
         fs1ITESvo4ZbiRyHmyPeCZLw8JYjDj2q8QN3UO3YTtlP68bbCO/it5DyFoJApu46TktS
         6GW/igXoFkrcjZqIoJ4UMpDiOz60bcN6htD/FZ9UmxUBaQ4uZTPMzSEoB6y5yJV2igxW
         MNmaIJoD8iBxl23ax1SeqwYu5O3gcr39wIcibfMFkz0ayYrGwuVJV7cHo0tVN2v9x5u9
         3KVq3BcoSPVL4Dl8qUj49VpYc/7FJUi3ICGrjDAhp+L5YI6dGa67iTt7I8FwtfX8xCo1
         rlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941274; x=1781546074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGF7+QWpJakGRZT4D0HON+vY+LPOCmvLkPwggXClSNo=;
        b=O9/Q0u6FT8H0DVHErDc7VsDqfHUpeg/TT47ohFnK1unhOYwyzO94zFVt34Kqse+b73
         Lblqir/0BSYfS2C8dFk2u1wcZgnYZhvC+wrjxJVCgQd/YfmNHvmRxiTDvpQlJ+jo1OM1
         pWOmh24qjJOB9tPg4ybtIW2m15PxWAJOygwV8+Lwd9UEsm0sWO6IgCSOIXiqkBgX4Odx
         gbaDDECx9ETUrem0dVeVECb14cXawLGEdjEFZ2N1coKjRNQysHnPEWe4SR6CbvPGxbYt
         xcem6vDCYwYo/eFrzqJHYfDux9xMvIhLAXW+YrSf+iNdxDOwmkgEdI0DBe6AnTzLpN9t
         XKzw==
X-Gm-Message-State: AOJu0YzeFJBkUUOl3ArvDs3I7PNbwk9c5oXIKyYhINCYXpuJw+zdbmUd
	Wu9qCgqAHkP3qu0KH7h03PB4CKw2/1/nl1ZPkuX7IWVLAjjtMr+/7ie8
X-Gm-Gg: Acq92OEz9xycdV/VCBu0t4oGDovONUtd4Pnsz6ggo8N1owJhwK6Czj67pw0TgVtXMZi
	JB7Hb8QmS2+veG2pLIi2NkkGajW49o6rgW0J8h1VN9IP2uj70dTsES0HipDV/tEjRkvm7vgQQMC
	g82/jNMGDzuAkUOI9XQjg+YoAXxkk0yjwo8MSLOh/ScgXhnTe1ZdNJB4iY+rSsxzZakl2lAAjW9
	/yHO7NFKbxhjq3XCCGMokNx+D5yv9kM/TytiLLYCQg0HovjRre6atY9LK5G4jaDBIVJXICcGYNI
	Iz/SV+X/1rJzyqVB/fr65QwTk5EFJrwooSNvmOxAdW7KLVg2G/k2yFcU7wgQqy8nPxhOPyTRPwu
	WALEVAaVYc3CSlW8Q0lT1E8Ussx76XjqrYqRCB9uLGzn4zzUpa0fBhTRlAadM+Wrf2ODAZoqWrX
	VycXbpcEvNoBNNozJH71wtF8I1SqVFTEe/WTCoJTSzfdlA
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr304459345e9.2.1780941273354;
        Mon, 08 Jun 2026 10:54:33 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm56269275f8f.28.2026.06.08.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:32 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Mon,  8 Jun 2026 20:54:16 +0300
Message-Id: <20260608175418.1936892-1-tmaimon77@gmail.com>
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

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes, which only describe the control register window today.

Patch 2 replaces the TXT binding with a YAML schema, documents the optional
memory-mapped flash window explicitly, and accepts the existing FIU
clock-names used by the in-tree DTS users.

Addressed comments from:
 - Krzysztof Kozlowski : https://lkml.org/lkml/2025/11/13/473

Changes since version 1:
 - Drop interrupts property.
 - Drop unused label.
 - Keep reg as the second property, followed by reg-names.

Tomer Maimon (2):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema

 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm-fiu.yaml        | 91 +++++++++++++++++++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  6 +-
 3 files changed, 94 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

-- 
2.34.1


