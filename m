Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916D606A331
	for <openbmc@archiver.kernel.org>; Fri,  6 Nov 2026 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTAeiYud
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLNRM3TDsz2xSS;
	Fri, 06 Nov 2026 13:29:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793932159;
	cv=none; b=aR5R7k3ECP6v2QSvJq2aWEx/Pk0uQWbcRWWdyzZwBzjII8oxvhivxetjZGRsUOecalxHgMI/n5QcCmEF4vMisUoYynVX6PcJrVQ3xkn70RAbXKwjeU2A2BjtR5iyaw0huLqOOg8DWlaEFpTL5UO6dM4zfQxGQhM+acTV4aLvClWEp6nvI2mbX/4x2Trvag2SB/mMEoEqOSE43yqL97hTKbljenCb+MchGIv9MOLIqDtzaaPKPE5rbjTttUXfDxlcY/GfKNopDogLfxIc0UyIz69i7NSiLhC27z5PSa6g9v+uXFaT8Isfjjbq2Sa/JuP8a7Ku+LRxQ9SS6lGlSR8RcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793932159; c=relaxed/relaxed;
	bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQ352BVDbKh8FcxahOyKIBj94ODut40t9XQUDESiXH9FsCyWAhqmNb7wM5SpE8qfr6grKnPLgh3fxeTNcKmtzBm88Zj0Kspbi3dKqlDlpdMIBak4OmKXvPIrB3sZ6wpDVzZ9O3i6YRwbpOeHknqQPtdGI/GGnePL8lP5IoBCKpHtwm174Yzx9OLl4IvT3dCCxuouo8zKf3kT8jSOqBfMUCQqUzmCL+c2KLbRKM/17+Q/u9Xqs3Yti2GHYA5rllTCdm7dlYtjo0JBiYhffru6RJdGnna4tTsscu9GfKeGxCDrihuwU3UL1UrdeWf06qIKcZw001rPge1W9T/RJeoCCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTAeiYud; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTAeiYud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132c.google.com (mail-dy1-x132c.google.com [IPv6:2607:f8b0:4864:20::132c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jLNRL2SsBz2xGr
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 13:29:18 +1100 (AEDT)
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so179537eec.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 18:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932156; x=1794536956; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=iTAeiYudwA3PTDM7w6bLOG3NM6cyqWwgHD0NHvBTdJbOh8yJfzfQPkBGZhUHuW0r9X
         1b3pxvzthNRJTUA9OiEm/IeRcS74IjCgzJg1kAqJoBwGCfke+cINqrZ5oiCTV6kQqoGH
         vO8+ykzWhlNXPVgrrod75Sfp0Y/i934YZA7pNN7bBjAjK0LRRF9QF9X+XUqz2TqhhT9M
         bQfRzNwkFoCz8qfiW9xCKBZ3vAyv5RxmqeeVlfpeh4BedVHkHrKZNRmmOYdmHwHeZg/U
         5yNNJnW3DUjiHdaGcgQp0+xynj5PMgsvM/HoOF7sVLcIe1+mXY6RD48lWwcV2IfxZQ61
         gPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932156; x=1794536956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=aP/CymSO3KDMlC83wNMtoSSmsoGXah16m0BvF8y9Ebz3XHcmIyL9ailuMBM+GX5Se/
         gWX/RRuyX/UGoZs+ltfVJattfrpztU7nmiM9CKgLR46LUWUqJt3Gb1NclonNWt0LxzFr
         KEeyfmxzAYqdo54iAWhEmbg1Jt+DAJkTH8aCLxIY/FD1h2B3lPbWLLTRjiXBipFT7n0v
         5xXRk1Zl+HrIvN7ICUBD2ZRvOn9KoZA6UjHaKnvqh4UeE3m9YEcTivdScvXOC5zceGHH
         0hRjU/KIW9snHwoAhuPJlUPHI5p7ZMBMFhplfmw7EJQvINO2OWnOin4VgDylR36p3XiW
         SVEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT5Pe2pG57wzkP8jZLRCPa09KJggnnYLQcS2a5lJfC8lLsAts9bHRTqGV6TOY4Jy4k3QUXMK6u@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/4xTZNCRGuiT9yh6QOUkfPoIsqMScsMhlvRA4jQ3QAwKoQNgO8
	1gp1mCf/H4qJKNFsB/+xoF93EW/mfNboC+F7SDTsmEVIOYnD71fbGs8e
X-Gm-Gg: AYBFou1+imRjPr46qICsuzq/RGVpY9SkZE6sL9rEOWJ7uF4w8/WU/FGAtpJjlkHsQZX
	bQxP39Xv2q46gEDFj8f6UE0HtuQktE9LieA4fs+GOJjhm6UGuvNwWqGuk9a0AGKJBbygwy3VEDJ
	FGFo7NhGnfW8w2icLRKnuLTyZ53PeZHsCy/+jtA6pSADG183QYVn8OBxy0RuGTZWRT/ghVxvomE
	vObkkt5vk6AcncFuS2+8JA1TxZ3wizW2bOWaV84YUeGWJxctkssejZJsKlMk78QxbZxhQEQhnVu
	8zk4IQM2Fu2mjTtZVxjvx2fJDqd3jrDWulSJprtLPfF158ay8TGUNoPLPjhed3vWcGLFvSTw0Tq
	U2XBeJrhTPDvS+MkQ2/sodX7VqMKYW0fXvMPrK9H1zzhVsSpfvgwpWpr23/WuxCX2jw4RjwJJUr
	VEl0V9yQnVFBeVPfgahTfbQg4gI28z3Fjbi56yEL60RmSFcGQAnR3AJhbZSksixjuaiubXFx3sQ
	H9TMN1jLPlYc4/5DB+hUibHm6pYfIrmwId1S2UbTDSbP1fQx5cHwbVpoM0EOVXdvA+J8jnW0ObO
	DjOdz8peerUNhYSeu5VnG6PkVHrMUZEcF+jnFTV05kCmRQ==
X-Received: by 2002:a05:7300:f58b:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36f75e295e2mr1519316eec.20.1793932155955;
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller lifetime
Date: Fri,  6 Nov 2026 07:59:05 +0530
Message-ID: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the AST2600 global-to-local GPIOP passthrough
handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
fix before the G6 handover change.

The registration lifetime issue was identified by automated review:
the G6 callback data is devm-allocated, while the shared helper used
unmanaged pinctrl registration. Patch 1 switches registration to
devm_pinctrl_register(), ensuring unregister runs before earlier
devres allocations are freed. Patch 2 retains the v3 handover logic.

Changes since v3:
- Add managed registration as a separate prerequisite patch.
- Keep the handover implementation unchanged.
- Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
- Update validation statements to distinguish lifecycle and power tests.

Validation:
- Shared helper and G4/G5/G6 objects compile-tested with W=1 on ARM.
- G7 SOC0 object compile-tested using ARM COMPILE_TEST; this was not
  an ARM64 build or G7 runtime test.
- Generic KASAN boot and one unbind/rebind cycle passed in AST2600
  QEMU and on physical B650D4U hardware. Controller entries disappeared
  on unbind and returned on rebind; a subsequent debugfs pins read
  succeeded. No KASAN reports were observed in the captured tests.
- The final v4 source tree matches the tested v3 tree plus the
  managed-registration change; only commit order and messages differ.
- Earlier remote power-on/off and physical-button power-on testing
  used an OpenBMC 6.18.24-based kernel, not this v7.4-rc1 test kernel.

The unfixed runtime comparison has not been performed. Concurrent
readers, probe-failure injection, mixed-pair forwarding, protected
writes and SCU510[28] hardware handling remain unvalidated. Existing
questions about probe-time normalization policy and concurrent SCU
writers also remain open. Electrical measurements are outside the
scope of this lifecycle test.

Supplementary procedure, exact source/config and logs:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/tree/64eaccfde9ac4ec35646c0b7a8663486775b5d3b/docs/experiments/03-pinctrl-lifecycle-kasan

Previous version:
https://lore.kernel.org/r/20261105152348.8567-1-prasanth.padarthi10@gmail.com

Please review the shared lifetime fix and the GPIOP handover policy.


Prasanth Kumar Padarthi (2):
  pinctrl: aspeed: Use managed pinctrl registration
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |   3 +-
 2 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


