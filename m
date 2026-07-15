Return-Path: <openbmc+bounces-2272-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1808C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:29:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8b4DYpz2yll;
	Wed, 15 Jul 2026 22:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118575;
	cv=none; b=cWkEdgGjyjOi7LQHwOmYvK1+fUPMWG94cxpRxFsz4WI/8zk45MKg97umwdtIMH3FaMMCP40kJBTsfF/Tn66GwMBy4Vi2IxxyngSZSvj+Yt94zObNNlPfx44KmwmJCgzu5GuLXnd0OuSzooPuBwyBok3rat/t4NCmPWHxXRbb1S4wWJq4tqsNy0wJgL510BhddLI4AmAMLcTA7RDhLPxWpd9mL7iAS/3rpgciRXa3YetrpDQCQvTX51qkw9OUhIwcUYFDgplbtme06lcJT/N7D2wuACYorP2suwZVi4Vuf7vri/xcqXYiWab929h/2NDglPgsqkDIFDvNqypgc2LWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118575; c=relaxed/relaxed;
	bh=TZb00h5hfFOKxcA2YDsgi1Cyl6kp++jnfEPqiAT7MH0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YFkWRhBLHksYIYg/bGNzkHTppW+V3Xf/BSO2G6v5Sk74cpwBonqu1jFjjR60QQYaj8A7vkab2SUxfUnTX7cznnaD8s1e4Pp5fOgoulA2Crq1sDorln/3VHgoPubuHpSq4nR1/+CHNfyWDyYDJC9kFkOme5bvvZDh3dR7kJVm8Ru/sUAnLxGuWCQZ5O5JN+X/zBUjxPu+jZSt9afjNEKw5erNahcOdhRwnmVVLWA/5kYy9Ihq4z6A5o9qz0Mjrz+tt9MMuzGJESru3w7V0yE2cbXBDxLq5YTKyV1eIcbsnKlnEugzlxR3ihO+HNNl6/PAfuKRiBwPvnvPP4W3Wk08cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l/MPRwbA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l/MPRwbA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8Z0nTCz2xC3
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:33 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so12223595e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118569; x=1784723369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZb00h5hfFOKxcA2YDsgi1Cyl6kp++jnfEPqiAT7MH0=;
        b=l/MPRwbA4xjjNhon/tDvxhSdJkFv8bhwW8m7c/842u/A0pwCjjDXwKLckC/wzdqVHG
         xr4Qr7nAgbPsEdFeoOpMD1lwTeGGgEZ5eilG4wp/ul1TuIVWilKVX/V+1x0nhZbr+BIC
         TRuqHtMYzUVng6uDFdlqTYdLVqOPzXL0k/qSqoOLL5gALNzxCT3HDcUk3m9hFLthKYCK
         FrMlCkIFfbeajwKxpq2qT6xgFe8Gq3hSFBOAIv+Qn9DEiHPsrD6WfQwv0qm4gVHhpZ6w
         fVXG/p8ZjW9vqe/6pg7LBpD0cDeNoyumM9OpOgmM2qqUx90mpUQWml8ofk6IvAyRI8wI
         7pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118569; x=1784723369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZb00h5hfFOKxcA2YDsgi1Cyl6kp++jnfEPqiAT7MH0=;
        b=i7+c8jH/QiO+kg55LaJytmjc84izMQsaXzVXnO0ugDnZa4XtBrD3MpPvrTuPDnDTNc
         keg+Fd7GCUCrGewH7mqgGp0JGtUkSbYa2ZCi2nKoriD4t8tdhBlKxFImLTtiP3gdvfI1
         dmsEA94RZKQfDcL2xe4H9NsBeI/DvWsuALwBSSPiv0XgyvJPHiismImu83+rdadhD4NI
         /j3kXSyJE0RYesupcrySJktweW+QDbrTYmXJ1VVmg72uj3r4LYbn//xU2nZAIZofu5MU
         mDPNXL3oMLXggVdQn1SNYEi5sNWyhGxdeyoeTiPYWkscZ1+gMAIsb4TrQxKxMS0jn2kw
         Ajtw==
X-Gm-Message-State: AOJu0YynsjNtU/HqwLPao9W5LkxUuDgNqmuUmcfaNVABa4pocjc6NfYp
	+qvlNE6SxYMq8jTp/D9CA0193UWaUpNvLc3jzuIbMlL7Mr4jqqhvTP22
X-Gm-Gg: AfdE7cm64xfb+XSABB57ZyXPWN0JOKxMltjs5IBaVXgXMtQBbXYoNjHeWXnWskCKzgh
	kKtp1yiF+A4cCXcYaSwGAmgw7U2DPoMEQMf7Wz47XO1mNo58hsrnxSUFZT8N4tDB3p2iRQCnt6F
	tla/NziXBtKb/AcnpBmY38aV5iYu543S3hNO40su8H5ACfUJyX3KZXi7ccZMAhWuD/V+6wiWx/Y
	BcjboNxljVZMy2NVjk9lUlV9omgbtuLbwJNa3lB9o8+UhN3bvdnuWVlp4Nh/kNs1YlmSbFU1lTi
	l5WAsyfWRBLGgWw4sIUPuqmrw8YNMAeeTviupdUr6y8FN1LG8YGXvDiJu/A3vtMR/VK6q6wpLTx
	eU+TAzCIWg16eacsctoDvigTFQt03iSv4W+uC/kaZpr7CeYh+5H/4Nz4wbqC61k20iDOc/18Vn5
	SWOmWBrt/MR3TtcXolcpMlHG1G6dKfKg07sg==
X-Received: by 2002:a05:600c:8b32:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493f88db5a9mr173251105e9.18.1784118568917;
        Wed, 15 Jul 2026 05:29:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:28 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 0/8] pinctrl: npcm8xx: fix pinmuxing and configuration handling
Date: Wed, 15 Jul 2026 15:29:15 +0300
Message-Id: <20260715122923.1938327-1-tmaimon77@gmail.com>
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

This series cleans up several NPCM8xx pinctrl issues found while
comparing the upstream driver with the newer Nuvoton tree. It trims the
bmcuart1 group, enables RMII outputs from the mandatory RMII mux path,
fixes the RG2 drive-strength encoding, and corrects a few GPIO and
pinconf details.

The remaining patches clear stale GPIO events at probe, move the GPIO
direction change out of IRQ startup, and fix the IOX2 naming, JM1/SMB7
flags, and debounce selector bank calculation.

Tomer Maimon (8):
  pinctrl: npcm8xx: drop RTS/CTS pins from bmcuart1
  pinctrl: npcm8xx: enable RMII outputs from RMII groups
  pinctrl: npcm8xx: support RG2 drive strength selection
  pinctrl: npcm8xx: clear pending GPIO events during init
  pinctrl: npcm8xx: rename GPIO7 IOX2 signal to DO
  pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
  pinctrl: npcm8xx: correct JM1 and SMB7 pin flags
  pinctrl: npcm8xx: fix debounce register selection

 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 191 +++++++++++++++++++---
 1 file changed, 166 insertions(+), 25 deletions(-)

-- 
2.34.1

