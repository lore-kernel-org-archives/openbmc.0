Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B2606A31C
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LIZN1ueL
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvw140RNz3bSn;
	Sat, 28 Nov 2026 13:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834352;
	cv=none; b=TbxHdQhIX2Ym1vLqwz09bZXsZUQZk8O9fH/u7ic6GpigLbzJLkJc/g88/i7xOXuRFnVYXYml40ydAqdV3nvIlG/5ck6DSxkP7qApTCkvk9qyG9oxAqz/StqnEp/K+p6LUFFOPgKtEoSuu0pHZFkr+vqCXndxjxzPSAWQnY5OxN2r2cYfb08K59o9AWsf/AxPYYacuLSvZWL0/PCUATwjuPaj+LP7pYa1WYFiV3xKhhTRVDWmwRualEop7Lbnh65ZH05J2B8Ex5lN0fuvVGku3e1h1FRHo9zpdxCgPJwNu7E7DDiESFGMenm2kbWXnHrBFlTuSSUE4f7sjG+BWwzc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834352; c=relaxed/relaxed;
	bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J61hhxips0O4rDrlrJLWboWnym9hzNTySxf0BUMpUqdfUVC+TSaSkqcOBdDDX1mJ92nctdFLmDBU2dNIAYazlDAo2aiOvPyYFGR/9ZLt85cr2YN23w4vC6cSvoLTiWPUFdwLZ+CQb2wq/n176a/Iw7/dt8nrN5WH2mZH9UhqrpMvJNCkAwmnkg55tL02tMYJ9Bg6uIAtQsQXExNVBiPOA2UDS2NOiU59M9NX5J+vBtHrGyA34bmM1/yMGvGOwGF9XIsEGSobBeh0f4hGope2R8RWK3k2zlsOe9hzgzs3cl2rl+yv4Ntj8+wRhLmnsK5yGKSxPiQZDEmzAGv0IKhSTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LIZN1ueL; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LIZN1ueL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvw5CFDz2y1W
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:28 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so3763938a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834346; x=1796439146; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
        b=LIZN1ueLaTeUeO6RY4Rkey9rjLYbreoLY/BDBt53ZnqgGgNP5MqhBqvpLP2MQA6GV5
         MOMV+WaCfssXu1hhi7lG5v1zDDKf/SRPHn9d3x/cNAQPXYJegoTtDgtFhoc2eonhOg0u
         kbeCT5SmQiKCVnXP3NHfYwQJmFMoxQt+rLpzMNKG2+5Veza6IZ936AQLdd+jjq7JJClY
         peOtXwWx11YjjgME3tJzpKY9JW7ivV6Y8iqvR6ge2MZwGHcA23SkRDEhPY5/AcnTJjui
         l4wAga/7i+vHAbtv2/Xq8/pL0QKJx+b/U9ju47qSkxZqmPJOhJdNeUPdnaPC2P0w1bbW
         kg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834346; x=1796439146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
        b=QPJM0lIGRU2Bs2JbX98gEJ+q/lcLPHAiZck89RGZKt/5fMqFempgBfA51lbOq6wilK
         Qb+JjyqpzuVtCLbD5p5OYfxl3yEPFuYrtG/X3AGYb6uYjNtrhIjKwYqqFbpu+sFm4vv2
         urxuYTpG8fevI30v2+rQZxIO4+e4shHCwN5/mB9lCiZhIQmoyhdac99Fg61IU5VMyje5
         tHCNtrVvett8SBFpovo0SkS7Ty0tDy9ABBLkUgBMvA1qVGhwTGyPpOGeeef2NA/dCHvC
         kyxce2Ro62/uIQWaH7NBRuRSnwu6ly9+5fvWCaz8JBsB/dR5L9dWB9v/V/lvwbThJi8B
         uOSw==
X-Forwarded-Encrypted: i=1; AL+hErExZqRvWCLaTo0DaxzK3Fciw542fCK9CtCUk7O3PDGzGQe9upg3EfXZeb/jLEQ/P1AHBJ3owrU1@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/Fn+lJZ81H/1fL4Bqouyd+ZSax5rNh4YaDjc/AmVThHoLnnDU0
	KX/0PAoJsIGIO5RbXDCDbSwsZEKBQ+azqBb2RYKjB8QNGU01e4V6Yx5UIKrP7aW4n7Q=
X-Gm-Gg: AZFdTZf1y5KzV97Tx3UgxEnjRmswJFuSioHTcgg/23PrKSyRZWnvfCb06RhJNGGcBUL
	3gd9Evj3mMuVSqg34McR4rX4xBmyGw+RoZm0lGDKmrBcSU1ez+PXDOeUIf0FE3boJzvrmJACnME
	jh5DZjdmljeD9A3Nmxb21Qj9RrwNsd+d+r4SBARXgh61VbzctCDEWj0xFubs6K6Ie9TH4z7UC98
	zHUFr01Q0ppBUBsU1f0zmAA8DreCjx/vt1b+IvRMgwNPrap2Y6M4Dx9e5+dkYhX6EXNwNfEXwmN
	dbIz9yDVL+wQHckjsWZGS8HPWZJ3yFxJ0YnqEZluwL2PDgCFSSTNHrwDUzVGfbVYMkNbqjhpOT9
	mm2SMUVxIuqLlwavkn+M1/FzrSTI94b4+OLEJhj9re+awi4m6CIHoHzcYa2rvmWngtnHsBveype
	pIRCqG4zhh7XlaiOJLHVIsx8iylSMHQR0vwWBbgvNGOuvLnjR5y2PsIlbzFHDQnWM/U0RYwPmRK
	0q5KAG5EGBs/dDdQ1fG3wv1+gyIWhxm2aDce8WRRWvOQ8NVN9JAA19ek/wsyzzqLKS8Rpv6Rg4f
	TPIxerrnQfyXf92106G6e3m5g7trGoKTygjdLBYqEGi9bIpOPRF+eXw33R6OHBD7G+dkb1IKB/p
	kA1L9d2O79vzzoA==
X-Received: by 2002:a17:90b:4a88:b0:3b5:29e:11b0 with SMTP id 98e67ed59e1d1-3b5029e14a7mr8814612a91.17.1795834345981;
        Fri, 27 Nov 2026 18:52:25 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:25 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 0/2] clocksource/drivers/timer-npcm7xx: Fix timer1 warning, add sched_clock
Date: Sat, 28 Nov 2026 02:52:22 +0000
Message-ID: <20261128025224.2680046-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for drivers/clocksource/timer-npcm7xx.c found while bringing
up Linux 7.3 on an NPCM730 BMC:

1. of_clk_get(np, 1) returns ERR_PTR(-ENOENT) when only one clock is
   present in DT, which is the case for every in-tree device tree, so
   boot always logs a spurious warning for the optional timer1 clock.
   Ignore -ENOENT, add the missing newline, and check
   clk_prepare_enable() errors.
2. Register the 24-bit free-running timer1 counter with
   sched_clock_register() instead of falling back to jiffies, which
   also enables CONFIG_IRQ_TIME_ACCOUNTING at runtime.

Tested on an NPCM730 BMC: the timer1 -ENOENT boot warning is gone,
sched_clock registers at 80 ns resolution with microsecond dmesg
timestamps, and /proc/stat reports live IRQ time under TCP load.
WPCM450, which shares the driver, was not tested.

William A. Kennington III (2):
  clocksource/drivers/timer-npcm7xx: Fix spurious timer1 clock warning
  clocksource/drivers/timer-npcm7xx: Register timer1 as sched_clock

 drivers/clocksource/timer-npcm7xx.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)


