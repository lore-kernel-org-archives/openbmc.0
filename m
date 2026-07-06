Return-Path: <openbmc+bounces-2219-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8DAC43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 14:49:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv6gG3RxXz3brH;
	Tue, 07 Jul 2026 00:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783349322;
	cv=none; b=P4Mt3dHV5rVbHuZTsNKxmwbUK9t02IWS6RKUxpiVSPuU0d3ZdPVTXROR7Cpzp5EDhip8cRr8/jDTOmANj+C547YsT5HFm+4fM33UH9s+7qRnnhOgrU6OKyf2TEL80TJq4XoN1pRFEqQrGiKe+1nJviARtA48WHMs5L+yZj6cNOgzAVXa+6nWkog7IAmpANL1wI+hlOaVOfoU6yxL9q7m/mjqPA0z5PXqs5Tmann8DNx56kiJ/NRzSMdMy/e192E0hDoQcX2TOONCp6yEqb/6bPcm58MQGjY+eiUdbSo7gsr8Utx5Uiyol4GIAC9qyiEEpRpQ2ySJpfK0zMR3Z5jmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783349322; c=relaxed/relaxed;
	bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZVBaikpOfRKHRUeC5saLZlPGdq0hOI3luQmk7y5uuJNGqMW4LNNw9bKhGFeGhHxh59ZeJrIkONNSVCCi+yJd+VV+JtvGX6EAlLdzktEORZnQHWeR6fYjfRc1iZ/x7yRz8GIUfniimVZ/4IUgiuQXSTjK5Hh5aH6EMXOHXh9gTTWqwklZaM6xkqjySVEJSgWQykmR9rj4GB+oFCv8c8617VCd+3uC/NskwGi19YQvLtSRnnpBmticONCnqKx790hLiYbkdJXl6kBkWYRqLuz7ikYfS1u63jOOOJ077KeDZXnIDLZRnIUXp5IWQ0ycHoRMdmHGCmRvfNDoCCHLmp2wkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOVx+tlk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOVx+tlk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv6gC5j6Jz2yfS
	for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 00:48:38 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b1710405so19295365e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349314; x=1783954114; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=hOVx+tlkHlip8FQQFlaL8cGe0k8GljstkPkC2Nfn8JTfYodX6HvBvxKsg07JlbzFhN
         upwLjxz4QySBuyKFbMQVTJGhRwNU9v6CJr/x/+zGqaXvNezmPIY5TF3C4Z5S1P/A+e14
         j5aVctmuf0VvaVU3Qcu8lSY3dyhgLxyYAzp8/YUKD/wiruSJwRh/5waf7JRgEQed4a0Q
         UosEXWNTNPxJ0kd4C9JyFGzeIz6ZnAR+PzMyOEQtlef1AlGxYhZHlikZHjWuw2BmV1Yl
         dsZBWfSfgeaO9H/oJObIe/JpAVSt+wTlY12qGQYJC/vXD+njO4Ccr2hS5frPh0MqP5cc
         ZgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349314; x=1783954114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=XXYuFQ3w1eq9RxxT/ng7tCQcJpxeLKb5Vkq3Zm+EfmlshSdLGxaAqimJysLDTPC+hp
         R+vqVRxKuJvazckYuz+zBWSaUR33Op6iog1diLggiIceLsHWuouNTmF2JRlJyFkmFyai
         /zh/QoryWxUPqkaRzRGAKCdkuzVrj/KC98/DsHPmAEgxwlOsf6ABERuhzI4xq6iyLMz4
         a0OkPDKUNu3h92oEldqI8pztcXdGtiD76gDsHP4ypWVJXGkUpy6KZBcqO03F3Fqwhoh5
         +ol4oA+PObSo2s/KKyPM54Qhds8ihp7RlNi8OT/BxPgGWPkpAtfCPG9I2A9u0BwmrEkc
         hU6Q==
X-Gm-Message-State: AOJu0YwM+JQS+b5pt3wiuMNZi6RB+8W4rLz/TwjJ8eJSY+cqdzxkpWra
	4/bNeG/ujMrzGIijK9j0ZQth9wwqs1ZMt2WYLD2V8baEinvTnWS1v5iT
X-Gm-Gg: AfdE7cnow3ran32ix8P3AyyO4gX74KNBJCyxQA8SJUeMRpCSSdzBzTChlKyHxNWnfWn
	PxM+492vda6H4ZktWPGAcSquforJcyV0RbzOrmsBky91IXu6E1qhK4LTXCdwmkc49SN5PUPf/ZJ
	3RT9ZfmvilE/0AsVg8UjcVdECC2W9E9Lv+20iVZBcpUXWp4Jn2rSA2XnB8IA4azDHjhcburUs4v
	mWaxsraikiL5SxSD/Nnh0xttHFuxQA0ZZRzdo2T3Ie3WO1dh37Wu/OaZ2K/g4sl4TF3kEuiIIRP
	TRuE6Ry8aGVTJGDndYIjyctw5wcjfBhHtIRS0iXaPRzzwkMefGVr7p7x2x6EKbKpy3LL6LKbn0e
	ZcOyrifTdD4YcQSJ3dSBpwXkc2NE1KhK7SwhEv1xS93RSBCExNZ1cqxdMVvbYD+drbb9zWvHvFo
	ruCEsV2Ag1JcFhBVo+VpaiBpo=
X-Received: by 2002:a05:600c:c16d:b0:493:bd67:316 with SMTP id 5b1f17b1804b1-493df074319mr9805435e9.16.1783349314326;
        Mon, 06 Jul 2026 07:48:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:33 -0700 (PDT)
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
Subject: [PATCH v4 0/3] watchdog: npcm: Add reset status detection support
Date: Mon,  6 Jul 2026 17:48:25 +0300
Message-Id: <20260706144828.3517631-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Conor Dooley: https://patchwork.ozlabs.org/project/openbmc/patch/20260705=
140100.1543486-2-tmaimon77@gmail.com/=0D
=0D
Changes since version 3:=0D
- make GCR syscon-property conditional.=0D
=0D
Changes since version 2:=0D
- reword patch 1 to explain the hardware reason for the GCR phandle and=0D
  why it is needed for the reset-status support, per Krzysztof's review=0D
- cache NPCM750 reset status in SCRPAD2 so later watchdog probes can=0D
  report the same boot-time state=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |  14 ++
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  71 ++++++
 drivers/watchdog/npcm_wdt.c                   | 217 +++++++++++++++++-
 4 files changed, 301 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1


