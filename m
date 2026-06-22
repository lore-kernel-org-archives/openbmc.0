Return-Path: <openbmc+bounces-2119-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BCFCDB471
	for <openbmc@archiver.kernel.org>; Mon, 22 Jun 2026 08:31:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkLyF0kn7z2yYs;
	Mon, 22 Jun 2026 18:31:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782117076;
	cv=none; b=a2EAUfcmYPFKP2osmx4N6gDgTFz9y0GS0wt1Og6Cjt5K49KZZjNoVJBYmaSdWeQ/XwdjQJwpAxN3c1kE0ut5RiI34NrdQ5ak6TYNbeSUG/A3JKng2Cb/Q5MpgNGLLkGCFdACSKoHIhTplAHasISaXSLKy/bPrLxgKa7WxOZ6ySjqQrKSLO/70o70f2CH2cLzKESUB6XOqn6vQ4QwruAsKf8+qz5ZhGMP2nlPeI4MAJ6jVDfm0ESfeuIzn92D7Rdf/xQjoiShQ6DWCq2/nafiaaRxBSMXjDnRI55Y3i3St+Qqr/5k7PUqsDufdPljhdy8mUxEMx23jkzPLNZFpqEnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782117076; c=relaxed/relaxed;
	bh=wCw42dfMKoRdIXvSRtooW3yTtI3yB3GDP2Hqbg56URg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bk/OZwcC5pNhTLatkwXmmfOvQHDT4aA5KUO5syIFGcJYSu7YXGQfQGJjra3IoJKeZcRzJlKbN1b2NVD+q1Cg8VqR5W2V4C9w1KXHQxjanyGR9wStBZBAwMELM3jvArTm1q1ZyNHPCwQUu8Dx5VEmG0YjM1veRCKoc8TaPFAp1tPSl91CG8iHeHN6y8Uq7NgBRYr84Nb1W/eUd0eqUrj8SNhh0kfd6mx+jFquFuWeBRVlqxfc46OXkNviuBXn49tV/fk1EtIhFXis2vlsIxp/kJVXz42PD6AJSX+5amQluYouf7Rct1XqGYl4ZS0DLeC1zyC4y2023GOEAiLnawhDEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZVvG3xYS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZVvG3xYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkLyC65vBz2xPL
	for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 18:31:15 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b3637b90so31195755e9.3
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117072; x=1782721872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCw42dfMKoRdIXvSRtooW3yTtI3yB3GDP2Hqbg56URg=;
        b=ZVvG3xYSuioEJ/qWmmNjSzjrN3ec7Sx9BfefCVmCQKOVz+BDh3kBGhurD59c9Q3DwR
         54g3oJfbcTUZPEbnxWaFtAcU9pkGOzC2u4v0QUad7rQFjWkR21XTTuF+hb06Lan7I9Z8
         QseX1BdQ/UPfbSTrC3aGRzHjMAKuO89oLF6IggFsKDZaPSugrrrW8TbZQRfNNkywCmpm
         hc2tDlZAXWY7q7OVhXzg1Gl5WLxv6EmSUrzJTR1ItEh/QnSARv8AaiAU0anKlc5meDzf
         7fSZTolzcGiMPdOTPjYAFx2VIuR8Y1tTPG4I6R/CpUcm0X/5pSTwsFEIkdN+jv/mqlag
         JKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117072; x=1782721872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCw42dfMKoRdIXvSRtooW3yTtI3yB3GDP2Hqbg56URg=;
        b=Rz3BwkZ1rfVqjnGTJY9xaQdRrNak4P2XLJtu7VVhdSwd2uoi854f0mXPkjKpgmDdQy
         WOzSbDOedSLK9DfTxBdLFQerB/tMnH1ZyNIbTivvAn8T6X0y7fMnOLbbgwXoD89vlqyO
         J/QFrOSLrkU14VYT0BJf4EkTez0AAGDhIkdBXCccINDwtXjHCQbCKFy9OpOONeqnQVVz
         9JeqXkrUnPqDxrbThVAfsqWDCkI6WdapqupkAcMFgeWUcxmN1R67S5lmqyPgQa6pvAKb
         svFPWmBY1qK7+pX7guw81WnRYm5IgmLNTpT1Y6EXopYU7PemNY5u4tav68uQKsZejtuA
         u6aw==
X-Gm-Message-State: AOJu0YwsW7xR7GNWF0RUHfq95/twcRb65utor+L4Jwou7Yu+85qiTlOW
	QLh8wwoEfxwJ541hwcIh6kfvP0cRuEr77krGvKLuWBca56qdlnWeD6Kx
X-Gm-Gg: AfdE7clGXEEbYRDErxYvyx/KZmqtHiusAiAUDJuKwED3zO2oJj8jSkncb1MAQHfaBZ/
	slNxU6WWVf82Kh2u9MD8FtpQ/fECm2NfLR4Tb5DZRJ4PX/MpeTTphcFsM5tFOphCGyDfwOiJ8jM
	LWDhb2r3dntjhfiK37++A7QLuuTp9LvqyqDVyA0tVd7eFSkUSc5kV9x8Y/xEGLCkDap4jSCnEao
	xRw7qc9+4zbhgzjM1nid854gAkMKkAyq+8ltmlEL5R2/BnSYWS20mfrYC10RPRjrv/fUaRrwVqI
	a4UOYYt4cLSgayg6tyRPD6g9Vc1jDaV59r1NWs820X69Yml2JxLwMxuEp9Zj+ExCLiMZXJtw871
	Rq02jufDamfwPCMWYmXQ0+6Nhr2w1wci6/8QU0nP6FzaDlA+V2HTS4TcK95dW2Iw87HpZz5D+UT
	0Oie3csDQh2v5/0ei86oKmKW4=
X-Received: by 2002:a05:600c:c088:b0:490:c2a3:23d3 with SMTP id 5b1f17b1804b1-4923f59465cmr201609475e9.35.1782117072491;
        Mon, 22 Jun 2026 01:31:12 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:12 -0700 (PDT)
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
Subject: [PATCH v2 2/3] docs: watchdog: npcm: Add reset status description
Date: Mon, 22 Jun 2026 11:30:45 +0300
Message-Id: <20260622083046.3189603-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
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
 Documentation/watchdog/npcm_wdt.rst | 70 +++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 1cea24681e6b..ef29e861e837 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -9,6 +9,7 @@ Watchdog Support
 
     hpwdt
     mlx-wdt
+    npcm_wdt
     pcwd-watchdog
     watchdog-api
     watchdog-kernel-api
diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchdog/npcm_wdt.rst
new file mode 100644
index 000000000000..48f0c7920c11
--- /dev/null
+++ b/Documentation/watchdog/npcm_wdt.rst
@@ -0,0 +1,70 @@
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
+On NPCM750, the driver samples ``RESSR`` and clears the latched reset bits
+after reading them.
+
+On NPCM845, the driver samples ``INTCR2``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD10`` so later watchdog
+probes can report the same boot-time state.
+
+The WPCM450 watchdog continues to operate without this reset-indication
+mapping.
-- 
2.34.1


