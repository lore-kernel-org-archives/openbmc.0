Return-Path: <openbmc+bounces-2191-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5BBC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 14:01:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtTfz2n69z2yfH;
	Mon, 06 Jul 2026 00:01:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783260075;
	cv=none; b=MBTRGgrBXpEBD6StVdOijEnfEjh9otHZZJD+byca8+3tUETIU8KaS+HLW0JsHdpMlsSy/V4m77UTE/x7ZmZwd4l+AbmotwJ0edk9GbC3lxQ9k2otZSU+2XD7ie9z2qgC+M0U5sOmhFAC68ed/obQxtC0bzgUP4IFGRID+fsSMGNLz8y76qhuBZ/LMV84BtQWhcE8CoSVzsPAsoev73fT955SoYiXPz1HivI3oEBbqSRP04c9aGzQonGmepvr8zuyDbXNWw+nKOLhzl+b5Y+KF40iG3jdlI4Y9yn0S/5QoHXYu+yhnTKVL07kcRvQUg1svYfpNoRaHNExPRaoiULa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783260075; c=relaxed/relaxed;
	bh=0Xmqz/oZ7aMrIDGMWhF1UArCU3La3CqQcUQWUOpBKws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jl/8iDHmUwshZbPqHjm3gpzKzxYIOr3M6rq7vSNr0V95gzIExTyPuoOJoFNb5DAFDypWekM6hDQZf8edOTpxX/l5SlgswWK61E7wGF2I8d8UmB/7PwyW1wtrjTv9nir1uYv2zaQ8pQCQh9zM8QOYX+PyjwkfXu1Dosia0lq2PNNSZIV+WANRwnuOpZz3/yrsry7DfQujtt94maw3Q2kAv6UFckTYt1Vc3SC1MGuEpOkbKW7pMMXx/yyyHU9zBYBC4B+qKv1xfCiFSrldEa1JEA8UT3kc3nSmShk4ExnoprITs7VS45IwMfhKT0Pgw4MOR3qLunNinkrb4SDkBUrQ6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ivp+xdTu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ivp+xdTu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtTfx3L3Wz2yRM
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 00:01:13 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso12770955e9.2
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260065; x=1783864865; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xmqz/oZ7aMrIDGMWhF1UArCU3La3CqQcUQWUOpBKws=;
        b=ivp+xdTuPGNBx5qjBfDslWuV42jqGoASbuAD/eGCZnxPNJ9W1bb1SJ3Y8tKKAVNp1B
         55NESE47QKjV7W02p1/M/HCEfaRHaHb/LoQAO4pA7VuA7JuWEDGbpfsXoirD+Qckpm80
         YYG41np+ATDakljoZegu0KY9NjBSBUTb8UCOoIFvbXKonILKC4gYwnOmmY5HkE0S/yri
         035BuQMZc3her7z8nJobSWMeIv8BpPo9BsYyK+rDFPG35gE7wn4Zg2KYc8UtWHubLRlG
         sUl/6kpIw/RLAnrjRLp/TaG1B4oCsiTam79MLIjY85kYTKroXHE/CyhiFLvbnSOPe6Y5
         aEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260065; x=1783864865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Xmqz/oZ7aMrIDGMWhF1UArCU3La3CqQcUQWUOpBKws=;
        b=IqdgjSUdAgwtkDKlJ898blLOizvSFrTJnmzORqngXhfWdj/7llii6/+Cz6Mq0HQgf0
         WTHWYlfSQOj9lruBv6Z+5ioEmuKfruO1AWHS+zf/k93rSU9N65zRTfWRhQ4izc5RyjFV
         4nxaFVJNVvDEzCZdmSASQ7+GQfbrenz8SqqH/55cc4jsa11brI2k+Vdpk8fUWmMLugiA
         82TllOWvza5vpzLGfouIVXB/WIrQAM4uXJKaGKm9mab3/vPTch+ZqAOy2be+QIxSnUWH
         7qzOx6CGZwCzS/v/U866pcolpXcfr7w9Ntvs5yBQjCJS648dvNhjfkYj6hzmj+e67/Ho
         mNhQ==
X-Gm-Message-State: AOJu0YyzuwgeLxvztCSbotVjZPeVXnrippjccpxsjre2+yw7mOiQrLuD
	o5d6Rm1yyjPEKVhJNGeG9l8BuFF52N147z0Vyuj1JJglB4SlYiEZJWU9
X-Gm-Gg: AfdE7ckZO9LDmaHnEJHb9BI6ANyNFG/y0G2IVeQMVMfnb6RhowsDPB83sJiBTDUrjZj
	zxhA+a8asjFae96rMIH8BerC3YeVcKwxkPp2Wd0Mhrp1+Jmcs8mpZ7X6IllgIlUhcXXcrWwoaAZ
	WXAz6UIhIeEoHcnkKZWuFRenON5TprT2Abaf58Dpviv6igRC0/goDINw0od3y5JqyKAkFW/KVmh
	DghAf59FhYBaNOyRLUvsWV0dG1vKvHFuHN/YkrmzX2V9lT3QjwZSDFtj33k91UcMitrlV9Y1WHH
	BSnao4MIyGh2KfY/wxZk/zHT9DzLWpnNfj7w54iFWYxTOO3xYpnbV2yXhbfNUsHEQ2q49BGBTRb
	pKpZJWKy/xKnhQixGdfZ3cNg4gqkfrxrmV4/hI3j+Z/+WNZ+IcuB5ZEg6cYKYFgXzFrYnkqiq3d
	pCViyT9jdO4zFPfnElz23xGJ8=
X-Received: by 2002:a05:600c:524b:b0:492:40e2:358d with SMTP id 5b1f17b1804b1-493d11de9bcmr79035685e9.16.1783260065332;
        Sun, 05 Jul 2026 07:01:05 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:04 -0700 (PDT)
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
Subject: [PATCH v3 0/3] watchdog: npcm: Add reset status detection support
Date: Sun,  5 Jul 2026 17:00:57 +0300
Message-Id: <20260705140100.1543486-1-tmaimon77@gmail.com>
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
0260622083046.3189603-2-tmaimon77@gmail.com/=0D
=0D
Changes since version 2:=0D
- reword patch 1 to explain the hardware reason for the GCR phandle and=0D
  why it is needed for the reset-status support, per Krzysztof's review=0D
- cache NPCM750 reset status in SCRPAD2 so later watchdog probes can=0D
  report the same boot-time state=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.=0D

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |   6 +
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  71 ++++++
 drivers/watchdog/npcm_wdt.c                   | 217 +++++++++++++++++-
 4 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1


