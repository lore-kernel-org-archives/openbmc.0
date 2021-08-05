Return-Path: <SRS0=rp11=M4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EA2C4338F
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 22:29:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D6361102
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 22:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D6361102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggjvt3V6kz3d9K
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 08:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SxRdkHyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SxRdkHyQ; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggjtq0w09z3bTW;
 Fri,  6 Aug 2021 08:28:33 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so15228413pji.5; 
 Thu, 05 Aug 2021 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G7AJcm8fOQqUhjFWYk2UN/7Uz0dfNNvyDbmqqe3ttDA=;
 b=SxRdkHyQPBwwyirpGyIXezUPbdDoEsp4VVrXlFG5lSKNH/YLU+ZkIJMfVOQSDasuah
 joqgB8BhwcdiWHUJRLuGBJEZew232GG2nx9rEmocOQlTeXf/4bvullaixRrO2qTNl8tQ
 WUhfN+KAOmAWZo9Nkf+XuOobM4Bvhr/47slFBOEto01Dg4slGxsQecQ/WM3X71Um/PFC
 5MofTL34uiebaz8MJqOSV001bTASaUixGi5dTSSXbt2XIkjAMruv8uAhNLKZMc9r0oDk
 u8BZqtxN1BImL4PskLd0VfOGx7aWS5ihdsQZXSCZ2qsq77I+lOjUKTizUmiZgZVGjpN4
 krrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G7AJcm8fOQqUhjFWYk2UN/7Uz0dfNNvyDbmqqe3ttDA=;
 b=bQFMXbve6oj2gB4O81MixqKiKOboLRsN1gwd2uzeXPPGSs/DvJ02YCQX8hH++qPPjR
 q7Xw7w5xeuIVpQ/Cmx1FpV3ActVdYGzb/6TMra8OXP1hd46+fvgRSyO3gyn1Wos6yHaX
 bQX3fk876R2K9rPoJ4KnWy+FHpKrflOdu33L8UmaNNGoIwIX2vkk2SDwExo6TAmbqocs
 3c3j0iK9MCEBDdVH3EsZHLOhbXIbH4/OAyYb1F5AMVL1ua3aohvywDhrREtVFZKv9tQL
 l39UNQ3845rr8iQ+jxtAhdwKq6taZ6apUvNu6HFPe8tp974ZwnFBu1TvY9PZpg4B11Ji
 EI4Q==
X-Gm-Message-State: AOAM533kgFXMvbqiz8Tb0O/3/kBfSrs7ZjL8YYZr1rDlmf7EnuAALMRO
 +8cE6k166PvGHwcrObJnOag=
X-Google-Smtp-Source: ABdhPJw5VVE+dy/T9QASyoUM4UYts9qEOKA/h08HTH7cLwzt441x0wobT26tUg+hM/bCyiu/JUOTDg==
X-Received: by 2002:a17:902:c20c:b029:12c:ef04:faa3 with SMTP id
 12-20020a170902c20cb029012cef04faa3mr263057pll.44.1628202508308; 
 Thu, 05 Aug 2021 15:28:28 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b26sm8082292pfo.47.2021.08.05.15.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:28:27 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 0/6] ARM: dts: Add Facebook AST2600 BMCs
Date: Thu,  5 Aug 2021 15:28:12 -0700
Message-Id: <20210805222818.8391-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introuces 3 new BMC platforms for the Facebook's next
generation switch platforms: Cloudripper, Elbert and Fuji.

Patch #1 adds dtsi file to describe the fixed flash layout of 128MB mtd
device. The flash layout is used by all the 3 AST2600 BMC as well as
Wedge400 (AST2500).

Patch #2 simplies Wedge400 dts by including the flash layout dtsi.

Patch #3 adds common dtsi which is included by all the new Facebook
AST2600 Network BMC platforms.

Patch #4 adds the device tree for Facebook Cloudripper (AST2600) BMC.

Patch #5 adds the device tree for Facebook Elbert (AST2600) BMC.

Patch #6 adds the device tree for Facebook Fuji (AST2600) BMC.

Tao Ren (6):
  ARM: dts: Add Facebook BMC 128MB flash layout
  ARM: dts: aspeed: wedge400: Use common flash layout
  ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
  ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
  ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
  ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC

 arch/arm/boot/dts/Makefile                    |    3 +
 .../dts/aspeed-bmc-facebook-cloudripper.dts   |  539 +++++++
 .../boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 1251 +++++++++++++++++
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 .../dts/ast2600-facebook-netbmc-common.dtsi   |  169 +++
 .../dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 7 files changed, 2208 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi

-- 
2.17.1

