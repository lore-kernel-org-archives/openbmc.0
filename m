Return-Path: <openbmc+bounces-2192-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C35C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 14:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtTg02q4jz2yfy;
	Mon, 06 Jul 2026 00:01:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783260076;
	cv=none; b=S/O1V+RJusz7ZcaCheS5J4biMa/Ho6a26IPslZSQZE4fFiAo4+jXR+SMWoWKJHndVhsigx+ubmJ46AOw61qsK4CYC9PWK1DblxzptHlO4fOeoKa4uH1UWCHj16IblwX6rhYbeIas/eL7OlmLvlByFmqyLNSideGMsIRBXVIa5FpAHoBu1fygJqo74c4Cyj+uj9WNW5JbRnYVwPN31pAu8XQlNLPe8TNChpAqKJhOVf47Qws3ATrUs9e7N+Z5de1OCr/CNlvGZzh1evRy1YftOtc0hACxC/EqCPKF03I5BraSvT1wWp/DaOk6ffL32ADDm9ma4ChbqEGXR9uijJ01jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783260076; c=relaxed/relaxed;
	bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LpDzNOL4nsDICUd6/j1LSS4rEAzmkvypLIzf8gbIwoU83HwDc8eDy046ATZGzd8i+U3L7QBEYXVXJ40K3EsiFhnhes4WmS3naY5V3fhrjGP+HE7bxOIcmA2QGbCz/TI1Ks9zLIzgSskQbw9DBwcknt6yUOZOzYwN3HEfpezq8Sl7JBG/IulFtz6ycudsjbq3jKoyjuWgWnByeUGUjPi2h+L5I98gWrPnC9cwK7WAr6NynFDZ260m4Uwz/FsR12K2VKgpacM0diNWlkft0ZSwJVGa2An/ipOow7fXrrR0dT3NKc4M6I5rgvyEYIUDCP3e6h7GQ2G/pBmQkp8VbBU+jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KaqKs5j5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KaqKs5j5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtTfz1DJQz2yf9
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 00:01:14 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so11278495e9.0
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260072; x=1783864872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=KaqKs5j5hxd6+f/2DwIz1mM/VfAW5kKI/4dS7R9l1FYv/M5+GzwWyQQKn3iA33H4JF
         eJbShQstg5pM8O28NYoJY+leDS2r9s/FyAfw66qhQTFcEERbx1x5QKCY4miB10RoQFBx
         hHf3kmJbMcUB6qHRmilFze+Q//nc2Q2tlpyu9sQKRFrSZ8pLbKB4uF1Bcq3rohMYhEMg
         6fDqZWmFvivxR+3oKmoGhdH4VGL5mXvIPrt8xsg/FxBfOvA2l8xusVEQBMfh30yicOH0
         CmZ+yHvpkTtdz24UHUz9U8zV0OzYp9p9qt41IvBcTm0yQ4VUZkYBVdtOgK7WzWVpNKHq
         FNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260072; x=1783864872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=TL5VyNSyWj/5+fy8q1FWZlkKswhY9oZqXBgWvG8ZN136AmehV9sk0q0cMYvnHQDxoO
         8j22G3b+qsop/NqrDQNefZjAf6scRH4QEHWNsFBrGb0QPngcw1Z8HUdfZdV8twvSdntk
         ACq/EyP/9lfI2Aj06PB94RfWo5TQlOhn3WJyJ/Wj6g/c6aGpGcKIxQ3utk4zVl4zhy8h
         TwrjjH3pvsNb/08nV5P+KbRniGidn9xGNeNLIHRqAtxbf0eguVdjJJXE5qvyO32Qbwy6
         7dDvUVmdXexPVuUf04KO5sdSotR0Lm5kVo6lPHjTB9cHeb8FJFgJizKytt8GOmU+8WP8
         Pa+Q==
X-Gm-Message-State: AOJu0YwYBkyRBGYlBq0yJS5IbGx+vb4grfFUzoUd5GEMsTUTlFxvnmOF
	zIksQp2sp9JcE7YTojN/nk+7W2prJs8PXzxpW3H1ln515FiOnz4CSqL+
X-Gm-Gg: AfdE7clMpNsjU+//9/IktNoJgjHjDH0iibQahmwgp2Jg1LSSqG+gbO3BmjGWZEgAoUS
	5rEFVUNnJle012F5zYha6KV2WbIKDNm2vzIPCPh6Ukh/hwl5E/xqTi5+/0iuNuRjI428nifjhIS
	ymYfXl1WuDsTMF6IUlzNPh+AVPYhgG6FFvFE0Mwrxz2XShVDuznjN0lAPk7baYoYhGFE2q16xZu
	UJwtZ/WAymxrInIm8Nic9Tyj9CYTQXur6XXzjzr/C6l6FZ7MPpZbrY0Rl5yxH9FtshS9iyHSP/4
	e90C4kQAovmilm4R1/u6XC9ZVaZS4Qv3crvtVwqOweZa3zAMyYAiawj9XsImJ880sf9rSUqs/Xd
	KbpuY17AfhXSUXYrM4MlnXr4IU+piic+ie4QpDNI3n7IpxiYMOyFgBCmrfW5jxKt1SsVIjnLO3N
	rpqgElQ/WDZaxi3kKT9h+Ja9g=
X-Received: by 2002:a05:600c:13d6:b0:493:b771:ddf9 with SMTP id 5b1f17b1804b1-493d11d076amr45112645e9.1.1783260071622;
        Sun, 05 Jul 2026 07:01:11 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:10 -0700 (PDT)
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
Subject: [PATCH v3 2/3] docs: watchdog: npcm: Add reset status description
Date: Sun,  5 Jul 2026 17:00:59 +0300
Message-Id: <20260705140100.1543486-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260705140100.1543486-1-tmaimon77@gmail.com>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
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


