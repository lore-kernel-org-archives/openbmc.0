Return-Path: <openbmc+bounces-2466-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC278C5DF87
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 10:09:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRGHd0vlQz3c7q;
	Fri, 21 Aug 2026 20:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787306956;
	cv=none; b=DLfTI/ZVsRTJUv4iN1FPs4Ekfjw3zZlCnise14u5EVNZ+4tgaVSXH0ZuNFjkdKAFoC/Bk+B+vpugSMcPU5gjfwu89M5hBuICXoNedWQvr+QdgkJOWnlytk48sfhpiiS+bsBOie6PvjEAw3iKGt1sefa/Gg9gY7O9Fp2sq+noOWok+ow1Z9CU0DfH8I+1I5Oz/aJKjGAzOxZX+bESjqquoJpvMaU0iezm2m9m/W4yaaUBBkrcTHpc8DZquRRkWJQzJmST730zY10pEtTcGdZHeV+Pynq137iec9Ur5h4LP2saEmQF3Q8+5KGnzC7ZWWngs+lmJrofAqWxpxJrWyaLog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787306956; c=relaxed/relaxed;
	bh=JNGuhDmbS/pmfaU8GCe3wP7d66m7pXh7gWjA9aIwJ48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0+TrfkBcxKzRrQmgjtGrPDSnTps5++5DwdIZ5iF5hBAYPaBKqI5fm3DWuzMGHK2jB2S9NxCQdWxiBxjzxkAdufdatTd0szSnyqCV9osPwZP92cOkKmuMCa+0Y0jdh0Ywrh1uejiCWUjJOiQRXlnCD0WA/fULH2F6QKj977Jk9u0fVF0ftGIEfGqgo1owGSR5xzn27OhdsTyXnCrGdIMhJoNQGQLVSYC+GdGbHtmWGt9tvtrD4FvV6UmH/GYHzkZclq+nlzC0Vg9JJwAawNmYzCcaCu4n32q/GWOmtnbgmeYRyDsLwhxuLChihjjfB/LM24DEsYq24nLAfF6qReZkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRGHc1Zylz30BW
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 20:09:16 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFCAE60A71;
	Fri, 21 Aug 2026 10:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFCD1F00A3A;
	Fri, 21 Aug 2026 10:09:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>
Cc: linux-rtc@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] rtc: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:09:01 +0200
Message-ID: <cover.1787241693.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the RTC subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (5):
  rtc: hym8563: Make sure clk_init_data is fully initialized
  rtc: m41t80: Make sure clk_init_data is fully initialized
  rtc: nct3018y: Make sure clk_init_data is fully initialized
  rtc: philips: Make sure clk_init_data is fully initialized
  rtc: microcrystal: Make sure clk_init_data is fully initialized

 drivers/rtc/rtc-hym8563.c  | 2 +-
 drivers/rtc/rtc-m41t80.c   | 2 +-
 drivers/rtc/rtc-nct3018y.c | 2 +-
 drivers/rtc/rtc-pcf85063.c | 2 +-
 drivers/rtc/rtc-pcf8563.c  | 2 +-
 drivers/rtc/rtc-rv3028.c   | 2 +-
 drivers/rtc/rtc-rv3032.c   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

