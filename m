Return-Path: <openbmc+bounces-1797-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC78F45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:47:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsykz3xWHz2yl2;
	Sat, 11 Apr 2026 12:47:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719292;
	cv=none; b=e6IYStaeD+74TIzD9PZAVnXR+OJpZWBxzey8WlocTY5fAwlKseJanw/d7lGkvxqoUOnH65OcSkWHPFJS7AM9nbzAQPBXa/DX2BptkMO6j+mZtEfdSfeuAgAZGX/EthZ4Y0le/DJ2O1KpvE98xONp6Ple7HA8f1ITae661uE+BNHQta2f+gm0bmMmiRzvrAjZ/zBZl3gs4SKEscivrUrt3u8qtFy0TafG8tsvEiySY6w9FrfymIuOzflwFbLOdtaVIGrh3VXmMlFLDd5ZGEq+55/gFsNrAWBMDuvqnBW/DTCmUksxPFqzbdiifqGy5H1WUKRrtxG20f3LvKBuBxZtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719292; c=relaxed/relaxed;
	bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UzoDr2VdCXNPS6ticease0FywliVq1LI6VKbm+GmDjxEYCeFgy08f8mTdG/cueqWI328ZgIFCa9AXXxwmDCZO9e7zYZ/i4EH+d+hesQfH7UqZTk1JeR8EtFur6IYzWe4WTfd4w6Y8pbzEUkSHxROyzUfVy/zGyKvtfyxbpy7+38SCsNfDxJUqnUE35fLqTnnMQpPGDKGpGj8JeLi03c2pvrvixZ4essBKDVi1NWkVRj/2IiQcsAgvXiUmSEPx0IoGl0+Pq7z3NkaOLHw//14/kiMLKBomjwX+OzbdcifuhCAUbRgL7UIrTblpQqQSsqDpgDP65/kzXUVcg/zGDCD/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=afMOLbzA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=afMOLbzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frrvt6wMtz2xTh
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 17:21:29 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c76b9efc299so287745a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719287; x=1776324087; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=afMOLbzAzMZxnNLk/mm51SELhwgSyx2oWvOFgRncKMpSpliZPTNQ/Uos+tCzcZ2gWB
         VggWoiKsRGiWo1ZGkU7aChwRaHKOj3gY1AtMoz0oCycMuCMzvwJLkNzqEF2IFBMsuUEi
         WDmd201pXBCwRctcwB9NXD/2Ix5ViX0BgKvqbaRGrtcRvONbSBckE7qAetmvce6zZiK5
         kWxlAFL/cWiaz1c9h/ZT8MDet8TyTSJsv8T+PsDlLQH6FVkqiZC4A+WJqiEAHv/3px2a
         q6tQuW+UeeAj6uM1s+DTsuYAJTGDu+SX2SIj+llXjnfj/hjvpZr9cNm+9W4LUYLSQJxL
         YMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719287; x=1776324087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=Zy6zB4IBWxHwRen2Xt6lTFQakdV4bgoozpVUrNZKJdCs4QzH+gVWGK/d4PYa+/jK/z
         9vCNnUimtvJqOmsEw4vEM7BnS4xc5C0a53TiTfLQiB1TURUphGzjeJgXXeuoROzUMchn
         QENbeHbFRdki5n2hq7Xd7NKOwsZPsNHs9QBPWPz9u44fA9vbZiJYXrB36sLxCXPR7g9F
         l7A/C3fK1VbSKMPsLL01PluWfWFvYUwAeWhK7DJjurRQhsCzEBNmLO/x40ulRhcQYCoo
         6wIkdcmX0rm8cvZxlekvj0HUzeJite/Q6zU8SNBDSmNyehNXK5ZRZY/RqboqHTo36N2E
         dSLA==
X-Forwarded-Encrypted: i=1; AJvYcCUESXhg5N5tXcozLti5DV20reKwEbnNeiwcv5eTOTPxkyjCYTmURu89IG41JY9WumtfU1GXrdFY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAyEqqqLMGLzbHdzp1gbwjoH+24lVA4vQgbEdT2QxHVyoQariO
	tbhoNOfbGCWHdp/dCb6R9+RUdkSaAK79uZLaKb6bRU/qigymQqaNbZi+4UIkKdy7
X-Gm-Gg: AeBDievtDvJH905c8N9+dIYPIRwWsdiQqxUDSfkjvRhrbAwbtURxGB+btdTbruseu2f
	E9qvPjwknQr9Z0UrwGxi1tZPsy1XovvW2yHyXdX/xaEYf/g0Qgpz+wwEkNJWorbV6x/03Gq0/BY
	oPskB6ZUMC0eYrmy3bFHICqMmYkZdZgHyAZPKfv7EI8/DtzyVHgpeKSdVsbJCAhGhoP2k8VB15C
	Od9homqXDWZz7vnp0SrpQ6r7FVN8PArshTr0y1RdMdN2oV2tDahQ5YVUVfjbWK3PdXUdCEOrm4+
	Dm6RvMwgzQznVNQmyZGewSc6mFpbwzkFUSell9kexLFCel09Dszq/sxipBy2aXLpglHBpfJsdRL
	j3Uy29DkKOtiHcfNJQ2/GCyZrtlnLENBBrADUipmTqvS/YzLawA7mmBg3qhgKR6mhDNcck40tJl
	4kEc7FHEQCo30ZErCJgO1VvCkfFgEgY6C9+VfiCT/WfMiyDvMITU7mOBWoKGJKfipEF2vcjA==
X-Received: by 2002:a05:6a20:9191:b0:39f:1f92:28e with SMTP id adf61e73a8af0-39fc81d208fmr3244860637.27.1775719286684;
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 0/2] rtc: nct3018y: add support for control register initialization
Date: Thu,  9 Apr 2026 15:21:03 +0800
Message-Id: <cover.1775717959.git.tomato1220@gmail.com>
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

This series adds support for an optional Device Tree property
"nuvoton,ctrl-reg-val" to initialize the RTC control register (0x0A).

This provides flexibility for different platforms (especially in
server environments) to configure behaviors such as 24h mode and
write ownership without driver source modifications.

David Wang (2):
  dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
  rtc: nct3018y: add optional control register initialization

 .../devicetree/bindings/rtc/nuvoton,nct3018y.yaml        | 5 +++++
 drivers/rtc/rtc-nct3018y.c                               | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1


