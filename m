Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE48606A905
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7g3URJj
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVrFr0BG7z2xWt;
	Fri, 20 Nov 2026 07:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795121423;
	cv=none; b=Ugch1vPQEaVjdQWJtXNlO+VdRHzi+TCuXEO0NkINiOqo24yWzeD5/6pQRJw5L8H0SxFPC7mIh8KRrCu/Ckzqm1BTonbiDgQ5pLfwr1P1y5ogKyC2UgoqrYN7VgV/K/h8ERCRGdqoL+2zPb0zS9iuQKaN7OvMoIjhO6rl0lJVRX9p1BGKxjth0gLJMeeMMmPJJii6hOxnmv0r2gsj8TqlmZfU26+6h4iEdvSM+C9PfwJRVZz0luKAUmIZwgmLes+qKw8n7yIEBWe5oZS1JAZ+8AZs/QFwe78e0XiE5GvnH1Sn3aEfFDQx/6AgJnkxTdBzyEq8kbo7Fznfa5xl1F25FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795121423; c=relaxed/relaxed;
	bh=9kpI7Vq4supsYlMGRpz50aG63c4CSQV96+wn8mS3O4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KPLf931zj2pj0f3C4T63tt2GoTJl6HiLoRZH+dk6exkqwt0D0xGGx3LDOgoepJgcR1OtQ45g6YHDW4x6HBLr3hujN6NnrSx+KI/oC8luc80LPs0mKZw8k2XSUnuDgqIXyI1c6CzeSQkwOMVOS0DAaAN1Jg3dnDMR72FfoZFqX+AIyByf7UkjU9hTPwcKL4I78l0FBaOTgH/+GpL8e4asvXNyT29IbjEbeyBWne+5WvD05zcVlaneUFBanYAdIpChbW8EP9FYd0jvrmfFqZgkcoGMn5l3fo9Wo1Q1SBQwRQYzxNIczE9veUBtNjVvKwMmsKhS5Xbo1+ebO/nZoQjykg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7g3URJj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7g3URJj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVrFp534rz2x9N
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 07:50:22 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 325494739D;
	Thu, 19 Nov 2026 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6122D1F000C6;
	Thu, 19 Nov 2026 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121420;
	bh=9kpI7Vq4supsYlMGRpz50aG63c4CSQV96+wn8mS3O4I=;
	h=From:To:Cc:Subject:Date;
	b=B7g3URJjIH6bQfbnjExdaBIFhBZy+ITUC6TvmuTsYjj9Ev6hyn8K/sM3jmzyhXran
	 dXDMiO2QjapDv+UTqIv0OuJZN7FM5Vki90dte4g5d+aaaT1k8ZYX4SfegB7R6A3AtH
	 c1m/TX5wzsegJeN1t7uXFQl2Ae7d56oSf8tvh+hpvVro4EWtYoWIZh3x2ALcupEP2V
	 7nBltUj2R3fZA1bUvKOVZwXO4huEeRgCOU6F+a6SHZG4WZ5jbkxmFCnGJODJk+hKc9
	 JFz9yAeqcEMbQuWNdxOcVgDkXwJEdnvXa8ZNXQz/Mdyds5ZJ34C6HfSQizlRv6PZY7
	 UyJGIDXNhDLAw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alex@sverdlin.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andrew Gaylard <ag@ffroot.co.za>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Benjamin Fair <benjaminfair@google.com>,
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
	Nancy Yuen <yuenn@google.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Tali Perry <tali.perry1@gmail.com>,
	tomer.maimon@nuvoton.com,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Tzuyi Chang <tychang@realtek.com>,
	Wells Lu <wellslutw@gmail.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: [PATCH v2 00/12] pinctrl: Fix resource leaks, out-of-bounds accesses, and error handling (batch 2)
Date: Thu, 19 Nov 2026 20:48:56 +0000
Message-ID: <20261119205013.2563811-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

These issues were reported by Sashiko (batch 2).

v1 => v2:
 - Rebase onto pinctrl for-next, dropping the manual fwnode_handle_put()
   in npcm7xx_gpio_of() now covered by __free(fwnode_handle)
 - ma35: Explicitly include the I/O mapping header for iounmap()
 - ma35: Retain a reference on bank->fwnode in ma35_pinctrl_get_soc_data()
   (Sashiko)
 - ma35: Correct the description of commit 3fd976afe974 in the
   dt_node_to_map commit message (Sashiko)
 - npcm7xx, npcm8xx: Release GPIO bank fwnode_iomap() mappings via devres
   on error (Sashiko)
 - single: Switch *map and settings in pcs_dt_node_to_map() and
   pcs_parse_pinconf() to unmanaged kcalloc()/kfree() so devres teardown
   cannot free *map before pcs_dt_free_map() runs

v1: https://lore.kernel.org/all/20261111215256.1982044-1-lee@kernel.org/

Cc: Alexander Sverdlin <alex@sverdlin.org>
Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andrew Gaylard <ag@ffroot.co.za>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>
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
Cc: Nancy Yuen <yuenn@google.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: tomer.maimon@nuvoton.com
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tzuyi Chang <tychang@realtek.com>
Cc: Wells Lu <wellslutw@gmail.com>
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
  pinctrl: single: Free pinconf settings array in pcs_dt_free_map()
  pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
  pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without
    duty-cycle support

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 70 +++++++++++++++++++----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 20 +++++--
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 15 ++++-
 drivers/pinctrl/pinctrl-single.c          | 49 ++++++++--------
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 12 ++--
 drivers/pinctrl/sunplus/sppctl.c          |  7 ++-
 6 files changed, 126 insertions(+), 47 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


