Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B9606A330
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtbdMjPL
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbZvp5Cfvz2yMl;
	Sat, 28 Nov 2026 01:06:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795788374;
	cv=none; b=KsBmAf73nTanuN10bsjGoBjn171BPAi6XFX7IXMWDi/KbIfBeoi2Z1/Wut670WGo898Kl5ecSmKZpqLmqF1FtXB6yKcTkOn2h1WsKByI/IdHCZxaZ03WPQ488zfE57791CAJso/E8lNOZdxPFRbAD3HWumOJ+ckl/yoPQuH9hM7tLHaO0Mva/0wGr3gJZgM11JjygjbFp0+j05Vsw7eOmPgxco2cDW2rakjRg8Q6IcDj+duQVeLL0nFWDtjLrMhnB/FKFMEHRWFNhmvySE1UmXTtItHUxBHKNzgxLIc0R2FiB7fPN+kkxX+hRpDoSKyAcgI+8CBNVSNSFooR4zBLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795788374; c=relaxed/relaxed;
	bh=7GOB/E9/w4+QB2YM44F2JEEKj4p9ZduGdyqEC2k4F4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hzmYKBxM4KVVyZrUNDe9o6IIOf2qHr1Fg0mZWYl9aH1DGV44H+0jvU3uRbXmAne+ogCnZWRmXaDTzRd03myYCnwwtKnSL1lhwJX98XfI4huptDuoE4NVuquNiS/tF24cWfL6nzIvGh1AS+itXEgiLwq5iIcunApMCj6C0NdCypXloIQcp4CHYyQD1NM+w5qGcKL9gKkJaJQLfPmSFFwV0nAdtf5EGAbOmqUeQTdCzs8/M/gS7XbDmpYFWjnJoH4+QS80RYNGbdIZqdNyvhPj2wnUXbf/hTKazEM6eCDpX4xUriYwW9sGaTYmplk4MByu51Bo/fg34+34KVvhk8GYqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtbdMjPL; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtbdMjPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbZvn2Zs1z2yLH
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:06:13 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5D4661213;
	Fri, 27 Nov 2026 14:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1CD1F00893;
	Fri, 27 Nov 2026 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788369;
	bh=7GOB/E9/w4+QB2YM44F2JEEKj4p9ZduGdyqEC2k4F4o=;
	h=From:To:Cc:Subject:Date;
	b=KtbdMjPLJSHotPfFnBfjjNdlVcccrI0qrEAeLFi3O8c9Y2fB1ZWOkTDqLgo16BQOx
	 82Ry299J/BGSuVxwCUxqo1E0c9aeyG3F9eBKsAU5s3a9rbrycRA4W1Ad/m762S5Zdf
	 Wod+fA95q8f1Ina3HGjsLvOyxa3WAie2K0sq8roKN5jhD3ABGgyPjdE6WpzqRRloQD
	 PDjUvCuR2KJz8Jeb88/hW08E9A+NlbVaMByQpFOALY50CdmmWcQanmaBQWKJgMpMmM
	 9cZjkIRu3QSnRtL/WG8kSdTDsgm0sSXEen4i8JF2uG9VlvCN6EPWuz2lCPS/0UHN7X
	 Jckf+YaUpmbbA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andrew Gaylard <ag@ffroot.co.za>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Dan Carpenter <error27@gmail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	James Tai <james.tai@realtek.com>,
	jordan_hargrave@dell.com,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Nancy Yuen <yuenn@google.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	tomer.maimon@nuvoton.com,
	Tony Lindgren <tony@atomide.com>,
	Tzuyi Chang <tychang@realtek.com>,
	Wells Lu <wellslutw@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: [PATCH v3 00/12] pinctrl: Fix memory leaks, OOB writes, and resource handling bugs
Date: Fri, 27 Nov 2026 14:04:48 +0000
Message-ID: <20261127140602.2790001-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

This v3 series addresses Alexander Sverdlin's review feedback on
pinctrl-single and rebases the twelve patches onto pinctrl/for-next.

v2 => v3:
 - Rebase onto pinctrl/for-next.
 - Add Alexander Sverdlin's Reviewed-by tag on patch 09.
 - Update patch 10 (pinctrl: single) to use kzalloc_objs() with pinctrl_utils_free_map() directly and update its Fixes tag, per Alexander Sverdlin's review.

Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andrew Gaylard <ag@ffroot.co.za>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>
Cc: Dan Carpenter <error27@gmail.com>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: James Tai <james.tai@realtek.com>
Cc: jordan_hargrave@dell.com
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-realtek-soc@lists.infradead.org
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Nancy Yuen <yuenn@google.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: tomer.maimon@nuvoton.com
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tzuyi Chang <tychang@realtek.com>
Cc: Wells Lu <wellslutw@gmail.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>

Lee Jones (12):
  pinctrl: nuvoton: ma35: Unmap reg_base and release clock on probe
    error
  pinctrl: nuvoton: ma35: Prevent out-of-bounds write in
    ma35_pinctrl_get_soc_data()
  pinctrl: nuvoton: ma35: Retain child firmware node reference in
    ma35_pinctrl_get_soc_data()
  pinctrl: nuvoton: ma35: Assign fwnode to gpio_chip in
    ma35_gpiolib_register()
  pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
  pinctrl: nuvoton: Unmap GPIO bank registers on error in NPCM7xx and
    NPCM8xx
  pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in
    probe
  pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in
    npcm7xx_gpio_of()
  pinctrl: single: Reject invalid register width in pcs_probe()
  pinctrl: single: Free pinconf settings array with
    pinctrl_utils_free_map()
  pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
  pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without
    duty-cycle support

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 70 +++++++++++++++++++----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 20 +++++--
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 15 ++++-
 drivers/pinctrl/pinctrl-single.c          | 52 +++++++----------
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 12 ++--
 drivers/pinctrl/sunplus/sppctl.c          |  7 ++-
 6 files changed, 123 insertions(+), 53 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


