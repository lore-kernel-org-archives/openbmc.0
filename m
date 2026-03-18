Return-Path: <openbmc+bounces-1612-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41BB1088E49
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:39:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkKf45mWz2ynT;
	Thu, 19 Mar 2026 09:39:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773862605;
	cv=none; b=brRC/YYF734SlVsIiIs4vHfEZWD23txueWSj/KmHkpPcG4eaRndlzzhPo+tA7V3V1EEpnOXCOqYnJl77G8eThbxAEtAIQDYlIY6EDyx0fIXBWr2oiyffmwpjqN8WkPfztUg/qyXCXqgJeUKUL/1ZhQWBGx2ikgTyXltSZ819zwyATgvxXSiTTUQnf3xH8WAfxa+Kr3rL05lIcL2BlDVuQJvKgB/Xbp42A7Zsx6PFHRxEoKqws0ZwD8C9ZHgS6lk6KxpEITkol1seXUzWrXKEbeXYP5nGQs8N7cppFGP6+svCDNfsbLnxScxDp8oR+eGSd9zPuFt8vS4RetXqg15+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773862605; c=relaxed/relaxed;
	bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8Y4Ccp4ZTHZ+o9VzutKUsAbU6/9ErZK8ZG9wc3kK2P5JQuuKNq+s/nzl5910FefIjsYvgIUK1YAOiwtjQJGqO4toU7ru94F9VRqOr0tGSK00jAw95jvpxSEXWJe2gOA2BTOB27FF5+NuUY9Ax2Xx+k89bQg/nVfX0iZkmxo7GOJ9RsUnHw85q40emFFVfoQV2MXtdjaYm0To2m0rxAz74tUjfvDkzZInAHe6HCqNjTW1J2D9mTnVHAyIcPbRUN7SUJJSJOgnCUjMbn8S+lb5uFxKqyflNjl7+GDEosEtVIKQikks8mK3sn9Xz56JEfPbrCPyF8wIUzfDgZkW1JK9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mgg8y2Fa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mgg8y2Fa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbfGM5m6Sz2ykf
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 06:36:42 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-358ed696623so181764a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862599; x=1774467399; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=;
        b=mgg8y2FaWjp/EECn4cf1riY/ZWLrtqo2BZVEQ8gHef/3UvwQWCJcQeF1QK63/T6TZ4
         Py8RTc9/HADddDfSsQz4F8IorkoGUS0MxojbIgUbZRrcnX0vALwQe6QhZ3qxKRGcwmot
         322XcmGgJVqLE6IGLy4kOXnn7ogVTkdUz1RV6c0e+5shVp93sd5JqIOhj+ZoWZI6E2NA
         6plgAvp1aEepRRKvBT/vOYsa/MTFVWi1viaVF32ddYfwsOwcgTQLUb5t2f88gBIKU2i/
         lykOthjMTJZrtdCqMPl4UO1QIaPPz1AZbdYSbBZHG6oIjqD5Blya3/6ZmTkFAlibSRJI
         Gqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862599; x=1774467399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=;
        b=BDVEd2hSXU4TLscV5JFJ0SUb9hcl8+DQMDYGucNGmyi8O3L1bZfi4z95k3tS0Vtwhu
         RKKankW8Y5IzIqMh48z8zMCw9/bEMqTELBViavjNSxZ8fPo4JGKiKJwsQtFgBfw6hC/+
         jx0fHsj3mbccfYNwdkoJlqgl7UwlsJifmDNsNeJK5ZjgC28YTWKmeJgxr6WcL9JMBRLP
         fOSrANbsPEi3FuWnYNkHDJPQpYQTGUnj1dQFi5O4FXG25nFUJnFnh1HDppEhG5Mc5rto
         3TOtKtHCkUiruD5SEL1rBrYCcoJKBXDQC0lsE4xPoa9nMVGHkzUFLhi6ju18ZtFa0TAf
         ltng==
X-Forwarded-Encrypted: i=1; AJvYcCVY7ZhFSyLwdM6a2h1RjnqoAsNwMjC8zRd4tSH/h7IzZkaXGyQQb7d24B2xKHIOwRISDzhD8aW6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YykoLZMLCr9OFvi8LFHhA07HRL5kSEWDJm6kBjFZ/ijT9ea7ZYl
	QIuiTP9cHvKHNerLEg6BfV87/cPR34qNywjsn1u68t8QElRDp0CrPjF/
X-Gm-Gg: ATEYQzz+S5356332mxn4hrUlDlmtxRvgklfz6zuF/tYUAkBjiQ3169ohAD9uAjsXO12
	jDQ3gEzTQJDwLKM8+sEETKu7VrYnYhb5TRBKn269afr5W4oOVu/5rj3ltYnDxJoSuEA9eBOgGmt
	xfXjAxW0DLJV1f48zWbQbtZEkFz9MyygARPLNA9OSnbtRsgcVUEbHKsxiaQwFXpM4ErjAWyG1aR
	xwzs89wN0S3aSDaSBWtv1zz/5qAK+dCodf92J/eqmaslUalQNqFzVsKwsRdMY9xxb/AIMX0an1n
	GK7aXpiBDbzJeDM2PsiD17y7pv2J10+zrOuRYBvkKcv5gANci8obrK2vHNhG+BsN6xp2Xa9Wzyc
	1PhYn63sRS4cKZ5ILwjEvQl8i0xwk5K6CM5HzbOMD9UNYfoz1R7Br5K5enYE8fbq4uNgjPVw95S
	4GPFUasfTaETa0yn2bHmEEK243+xLZrdRkiL3yjK2wmBnl/cpua0qMvGGT0nQyAUFsPor2xSGee
	98bMVUtQR5e1s/VDmnrvX1BjgBhtJssHk2g9UU=
X-Received: by 2002:a17:90b:3f10:b0:35b:a418:698e with SMTP id 98e67ed59e1d1-35bb9d6cb2cmr3852750a91.0.1773862598753;
        Wed, 18 Mar 2026 12:36:38 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:38 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/3] nvmem: Add Nuvoton NPCM OTP driver
Date: Wed, 18 Mar 2026 19:35:35 +0000
Message-ID: <20260318193538.246853-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
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

Add support for the OTP memory controllers found on Nuvoton NPCM7 SoCs.

This OTP is read-only and manages two independent arrays: Key Storage
and Fuse Array, which contain cryptographic keys, hardware strapping,
and calibration data. Each array provides 1024 bytes of storage.

You can use qemu-system-arm -M npcm750-evb to play around with it.

Kuan-Wei Chiu (3):
  dt-bindings: nvmem: add nuvoton,npcm750-otp
  nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
  ARM: dts: nuvoton: Add OTP nodes for NPCM7xx

 .../bindings/nvmem/nuvoton,npcm750-otp.yaml   |  35 +++++
 MAINTAINERS                                   |   7 +
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  10 ++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/npcm-otp.c                      | 129 ++++++++++++++++++
 6 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
 create mode 100644 drivers/nvmem/npcm-otp.c

-- 
2.53.0.851.ga537e3e6e9-goog


