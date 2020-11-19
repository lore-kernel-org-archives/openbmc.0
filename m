Return-Path: <SRS0=4Xag=EZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDF6C63697
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2020 17:55:55 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D97246AD
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2020 17:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUXaa1+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D97246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcS5h41nyzDqpv
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 04:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EUXaa1+d; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcS360FW6zDqcQ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 04:53:37 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id a18so5209722pfl.3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 09:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q5bokItvl+fmuIZW/0y8NwDSrtKawLhWKURQ2+FWucA=;
 b=EUXaa1+dR5q61YJ40WibXLDQtMqjkX2z3HUPNxZCT4F0baHJnL4zDsSFOkfKHK7gEt
 x9BUpxhQo3dAQ9WrWmssEC5Ntrgu8Eg1fudHqtbpRvgrfuE20rdjVHJtSQ3cXgPe/Ykm
 A5W+9KONVdkO4ETFuaZDyE4DQCPQnhj7iM4EMMUzmXfLsSK1GCYA+JqJuCNV5Baydt3R
 s0RkufpD308s5/h3HHxHG4Ly2Gy8m3qfzuKdhLmIFfFZmQkDgMRQ+P4OmtSw1LOmYZEv
 t5EJuTzTDyQbelOQZs8gvgy2AsuMRaapOPwJPVLZzmpcGxiayd+bASsj7a3A9jSOX5Vp
 WAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q5bokItvl+fmuIZW/0y8NwDSrtKawLhWKURQ2+FWucA=;
 b=S7xY0kVSzN/B3kZqJYbrj/N1tCoTCHw+wez32diAIW7DqUu+E8Cx3je29c3Z6Bhu9n
 LPN+sR5lVS/68PN7UP00IX8/8zPebdhaf7qsFOVfS1FESW8vop4WBgGtvpyUlf6Z037k
 qvxHZExdyAF3DDmIbAphORRgnOVOKs3CypYWSgnMMleJbQOkl2rhlpW/FgGfMG7/6DJJ
 Md0KGhiDzcjf07uzNuo7Pi/ehukPFtK67MfmDRkixGdMGKeOgy4zcCPM6POgNtEBIdIi
 1EhUyYY25lrdQ6I9p3dhwFPhNYsnS1mq1mJPgOpOe7I1OQrHQHQykYcsAUxXj9XVKl01
 TizA==
X-Gm-Message-State: AOAM530bxApERmRXv40AM4rsVXOjLPdyH7C+bTwWqkv7GQvcBH62tbd5
 5AhvfBYsqy9OxTXTMBr8034=
X-Google-Smtp-Source: ABdhPJzpp2pD+waX4s/GGGEVKwpsDvaGKkli/44tFNmwJvveZ6gIWvD46Y+t/gxjlnuxyxifYbo7hQ==
X-Received: by 2002:aa7:9198:0:b029:18b:3835:3796 with SMTP id
 x24-20020aa791980000b029018b38353796mr10893256pfa.9.1605808413518; 
 Thu, 19 Nov 2020 09:53:33 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id 144sm482858pfb.71.2020.11.19.09.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 09:53:32 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v3 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date: Thu, 19 Nov 2020 09:53:22 -0800
Message-Id: <20201119175324.22472-1-rentao.bupt@gmail.com>
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

The patch series adds hardware monitoring driver for the Maxim MAX127
chip.

Patch #1 adds the max127 hardware monitoring driver, and patch #2 adds
documentation for the driver.

Resending the patch series (v3) with XDP maintainers removed from to/cc
list to reduce noise.

Tao Ren (2):
  hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
  docs: hwmon: Document max127 driver

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/max127.rst |  45 +++++
 drivers/hwmon/Kconfig          |   9 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/max127.c         | 346 +++++++++++++++++++++++++++++++++
 5 files changed, 402 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

