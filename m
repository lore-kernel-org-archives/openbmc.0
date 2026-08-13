Return-Path: <openbmc+bounces-2403-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2C7C5DF66
	for <openbmc@archiver.kernel.org>; Fri, 14 Aug 2026 01:05:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hLkYZ3Yxrz2yv9;
	Fri, 14 Aug 2026 11:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786605936;
	cv=none; b=Yge1oh0s+KEkYwVSsZU1v7eKJAYqE6gnIbose+wZvt/OZWI2kQ6euDrz7xFwIeutMUH/VFqHXPQx4KMkLHwvVhyZSDgrRzYPiFWoa00wjjruT2BSzVEKu55SEmRgIPzO5RaMTyFJM3D/TJMGISRiXj9HTDeVOT7fClLfNVSTY2oTFEsP2YXVqV8KeRsPxyLtmfKr1B1lz7pGRnu5NulG5T118BfRonzjLFjlKsjz+qZw1ZQWZcW8Ugksx9PVHUsnqjoNdGk10/8dDCiqZ3rYHzMxD0LNvDO2SyMB/gtJLOd+y4gjD4MlMn+f2Bhd5snwdeQOBXY7huH9XIo0/or6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786605936; c=relaxed/relaxed;
	bh=gi9z0zpx+ayou6Y3PPf7EqHXan2g8ulf19Ed0YKK120=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PTigCpDGfD2rupDIghJVLJS8uu13YLIw3qmd++jiqxGZtZt/MG8u8/Ap6KzMCacR1mHen01t81osoKKaQhayMEjXmN4FIewKCXRE+JAoZpZTvmbBx2d6pi7TT2/e9pY4YaQugIVtVjneATZcTH/qljETtM5IF/zU4EjH6d4xRf3cmo8gmzTtxtyYlxD+LoyAHkjhf06JNVhgrbUcNxM/p2XRrXTIxyYWv75dfV1uABMsILKbYVmcdbD9XqQN5tpx7b/Ycny5WAL06Tp748j0W3xX/jLRW1dtXKDJ/KjTdDDUGbxEoWNnrFIsI64sDQUXHk4AGgOtbRKP8mRmzComPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bQ1XmX7Z; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bQ1XmX7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hLH2Q5QK1z2y0B
	for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2026 17:25:32 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 509401A15EC;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0D6602B8;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F66711C4D9FD;
	Thu, 13 Aug 2026 09:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gi9z0zpx+ayou6Y3PPf7EqHXan2g8ulf19Ed0YKK120=;
	b=bQ1XmX7Zja82hyUTkT4mPesDx8oWs929yPKcRrUwI0/m20hHg4eA3HStZyMfRwR3o0Ajd5
	ypxAxkRMVKQwN5iuuM3BrSKjx3Rz3RFUVvRaL6mrlVitk/yh6kyZ2z31OcHJk5B/PiC0Li
	1+m82NRQvYcPf1bChBf4MqZnXv6WyunRg6Hfgx1duFFhPuDPaBTHHrznJBeUD7utvij2VK
	n6tBaH5al3KnhsB3uPREFx91Ktz+IucFmanRK9OxIeTJhr89mW+UCmlAiQOyndM4aBFUnL
	HQrf26ALjz0DoHjjaKChXgkWzqwcVuIB0gjCVxYGvsnlQyYJ9JCEN19ouc47gQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] arm64: dts: nuvoton: Improve MA35D1 support
Date: Thu, 13 Aug 2026 09:25:05 +0200
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBdoKpa5Vxk7lDZqDtWSOBmI7
 77i8Tv8/wnGKmzw6k5QPsRkWxvo0UFa4jozSm4G73xwT+qxstqGJfZDJvxW25VjwbwbjuMUKLN
 PjhK0vipP8rvf7891/QHHhWJ0awAAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but:
1- it lacks a DT description
2- it does not work with current clock driver
3- it can be improved

This series is addressing #1.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      arm64: dts: nuvoton: Add QSPI0 node
      arm64: dts: nuvoton: Add NuMaker board

 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi        | 11 ++++++++
 3 files changed, 49 insertions(+)
---
base-commit: 1ec281b42ee249cfe9bad52a54149de29ed6aa78
change-id: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


