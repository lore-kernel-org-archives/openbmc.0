Return-Path: <openbmc+bounces-2220-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C333C43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 14:49:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv6gJ6qgPz3brT;
	Tue, 07 Jul 2026 00:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783349324;
	cv=none; b=O2srVEwjbAYu5ieIXDZ1T5cnL0djEqBsc41PzVOB68QbuEcNwcDmRr2XrHzQ6h2jc55mfm6Wxsa6gz7QPXC0781kr6qsgG12k3rys/ofzlb7PC3tFRXU3jX0h0tqNpXnVkuR8/K/RsxRgRhOeLdrE4Nm53lvokwSlKRHM4ioEa4gpJtp8n0EwsyoBU9yT7ENlIlqu7/EKoRkDmnOEqWeRBohDLKEVhLF3y+HzNXCRGghRlzVz+FRdoyizB2KMrDhCIRsdBUyMfrNViBcE8HkxZqbQf5A/IUtUU+jzI1tCVvFRlp+MGx3ny9xOYvNZrYNVM3jbKR2n/2snKD+WsR/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783349324; c=relaxed/relaxed;
	bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bLo0IfF83aXkGP4oRCDJ7LB21rGv/OjHV8yDmhCFN5oRX1sHzN1aTxDcw0O+PagoZwzFAVZN77wY9LwJLRdHz57I5x6pW3jiJp4iJ/PqhxXdijwKQ8goegYJA163EEA3WqAaU4rdmv3XQDKxEckK5SJPjmwBTdUfoTGf5QPYdQGQajeYT8MP/1PcetQcsHhzEwMmCVxbZutAaFv9AGHmPukOSB8Lio2m+tDRJwE13dMXOeNUJZHslNIKR8MK7eds9Vd/zcfcWctrb4SeyKIKHb8xf75FMmTej5KljCt0qKvJHV0ghJEy5FfujNKKjs2rOQNU17SfWe3QOOncwWW6Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JoPashJP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JoPashJP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv6gJ06bwz2yfS
	for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 00:48:43 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3511270f8f.3
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349321; x=1783954121; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=JoPashJPbryc8vXdHLyvZod+dJOzUF+3xczeKeLymTZ3y9xJejnFpu5jW85DTfQxRA
         c4H74WFkt2DmAQkvSpx197dmThvjQKsfSZ5CWZMglqQkHOCCRcss1fAkaRtx0zmIIp1V
         hmcBBbl1TTrYYEcfVpITZscVc2aAHkZE0PUn6GxbHoUj4RY6H6XTMuwH46dcxAE60ffz
         pHN2x00pY+k4AC8RfnWbzJMQtSRta4zNDRcDAjPAAb6b/oSAkBkENgr/omO3EHQGYkrS
         k8gJbU0mMAz22fmP9ixZeuP2qkCg7lCuh88AdvNIs5PG/taZyZHQbdU0A+rGyku3OQLj
         1K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349321; x=1783954121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=rDrfDj7ZyyG4snqQ+03Zt0v54BkXXmIumilHIysAa8P3TvvEtPcBONlCcrW7+/dkhy
         Vvr9xmgJgLzEdJRigbHJU4F/8um3RG6Uwn0xHGUKE8dcoYCOiwppyhk05gX3RlDCZViT
         36tC9fLgpb7NTlQbUZSog4vHLM70d2Mfh/RfO5EC+sD4Dxji30d9YV//b/dpl4WAZdhJ
         v4Le0E5lN2DWGckc9krC5YSHGwHJEgxRHd4+cVE3G3OIH3wJgU+811RwTasKERksimhs
         w9ARw86JsgfIoaI+7KkhubeCUfT3nDSKbi6I9KhpQu51pdscf/VmO5hY/eY0hB2LXo1N
         kXJQ==
X-Gm-Message-State: AOJu0YyMuiG2ZWQjqLUD2DrrEW1n0585tgvPdTtmK1WhxqXvBkUtyeYk
	EpyyG6hN8ZF9dk9iUE9WKEwKmDOnVRi8wim5QBe4xq+CLXFp14gfEcjZ
X-Gm-Gg: AfdE7ckd2owZiwjTty8YUU4VZe1WCnkrc3esmN1nk8G4czu89I4bSnrmeroArlqsshb
	/MvZgbnH1yvMHJ/A9lSSWqjcySSxLu8EzVixh0prInLEmcH/H/dt3Xgq+nWRzKwAxzwTA9AwQZB
	BusZdkj/RvWCpn69vhnoHN7cFLBZYS3sdRElLuEF6/qb6NzQOANpJtBb4zqO+pdXSmjuVH25LTw
	Krm8xU4Tn3cLm3FuSV7kLEmYQoe0QRSGrqb+Z4HQpU39dQznktb4YTIt0aIlE+LNSOLhZZA+bnq
	B7bWnQ66H+vx2VJUBqmAD2PqOfqiF0+A5ma2qi9SDGuIOEqEUAfczKKSrSYL1Wk/BUqQLCZcXm1
	M22nH6jTD+vmDxi7GFtTRwbvhVEJbza+e7tV181b36QK6KKONWhxGNaC+iu1ho9AZDgnIZhB9ao
	0xyJKrIQ6MOIr5ane9GV+4GxM=
X-Received: by 2002:a5d:6541:0:b0:478:2698:72f8 with SMTP id ffacd0b85a97d-47de66e581amr498285f8f.49.1783349320613;
        Mon, 06 Jul 2026 07:48:40 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:39 -0700 (PDT)
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
Subject: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Date: Mon,  6 Jul 2026 17:48:27 +0300
Message-Id: <20260706144828.3517631-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
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

Add documentation describing how the NPCM watchdog driver reports reset
causes through bootstatus on NPCM750 and NPCM845 systems.

Document the reset flag mapping, the watchdog instance mapping for
WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
sysfs bootstatus reporting when watchdog sysfs support is enabled.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/watchdog/index.rst    |  1 +
 Documentation/watchdog/npcm_wdt.rst | 71 +++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index dbc702b31a43..eb9e76275fa0 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -25,4 +25,5 @@ Driver specific
     hpwdt
     ics-wdt
     mlx-wdt
+    npcm_wdt
     pcwd-watchdog
diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchdog/npcm_wdt.rst
new file mode 100644
index 000000000000..cdc45ade9e0d
--- /dev/null
+++ b/Documentation/watchdog/npcm_wdt.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+NPCM Watchdog
+=============
+
+The NPCM watchdog driver can report reset-cause information on
+``nuvoton,npcm750-wdt`` and ``nuvoton,npcm845-wdt`` systems.
+
+Userspace can read the latched reset cause through
+``WDIOC_GETBOOTSTATUS``. When ``CONFIG_WATCHDOG_SYSFS`` is enabled, the
+same value is also visible through ``/sys/class/watchdog/watchdogN/bootstatus``.
+
+The mapping is fixed in the driver. It exposes the SoC reset indications
+through the generic watchdog bootstatus flags and is not configurable from
+Device Tree.
+
+.. list-table:: Reset-cause mapping
+   :header-rows: 1
+
+   * - Platform
+     - Reset indication
+     - Bootstatus flag
+     - Reported meaning
+   * - NPCM750 and NPCM845
+     - ``PORST``
+     - ``WDIOF_OVERHEAT``
+     - power-on reset
+   * - NPCM750 and NPCM845
+     - ``CORST``
+     - ``WDIOF_FANFAULT``
+     - core reset
+   * - NPCM750 and NPCM845
+     - ``SWR1RST``
+     - ``WDIOF_EXTERN1``
+     - software reset source 1
+   * - NPCM750 and NPCM845
+     - ``SWR2RST``
+     - ``WDIOF_EXTERN2``
+     - software reset source 2
+   * - NPCM750 and NPCM845
+     - ``SWR3RST``
+     - ``WDIOF_POWERUNDER``
+     - software reset source 3
+   * - NPCM750
+     - ``SWR4RST``
+     - ``WDIOF_POWEROVER``
+     - software reset source 4
+   * - NPCM845
+     - ``TIP reset`` (``INTCR2[25]``)
+     - ``WDIOF_POWEROVER``
+     - TIP reset
+
+``WDIOF_CARDRESET`` is reported only for the watchdog instance whose own
+reset-status bit is latched. On systems with three watchdog instances, this
+maps ``WD0RST``, ``WD1RST``, and ``WD2RST`` to ``watchdog0``, ``watchdog1``,
+and ``watchdog2`` respectively.
+
+The driver may report ``WDIOF_CARDRESET`` together with one or more of the
+reset-cause flags listed above.
+
+On NPCM750, the driver samples ``RESSR``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD2`` so later watchdog
+probes can report the same boot-time state.
+
+On NPCM845, the driver samples ``INTCR2``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD10`` so later watchdog
+probes can report the same boot-time state.
+
+The WPCM450 watchdog continues to operate without this reset-indication
+mapping.
-- 
2.34.1


