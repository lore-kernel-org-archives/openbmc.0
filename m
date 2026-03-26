Return-Path: <openbmc+bounces-1731-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C53109E543
	for <openbmc@archiver.kernel.org>; Thu, 26 Mar 2026 03:26:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fh8Lk5B6Nz2xlf;
	Thu, 26 Mar 2026 14:26:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774495566;
	cv=none; b=UPmQjBRhfSLnswTHcIdCC9baf8rVyMIMP3Pqot86gqpmW+HJIxyrA2d1rWzShnGIfEYfezrFe/q+W+tLnOPVLXi/+g8uOJ7CD9lDHp6KdH70Yg/ZBmSLTFWvnA2+26gbZKxRDi4Uos/IrfSMCnjSRGRUVka+mHPklQn43nvqeLD9BOnAESR51Rl7kTlKOgoUvYWL00o4gHoS6FPm/SAi0raUFVaQrpxK/8ep6TVqGGKXO+rld7oYdydRJxconlQXOHYvpVbjJ7mpVWPe1tbwomagdgA1IdrSHH+ZVOpdDBwprLS86rv3Iz3+FzVHE34CJHKijqEm/fBzSZDZLOHCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774495566; c=relaxed/relaxed;
	bh=eB+dLsG5tXfnyNIFXfqQOMNtjQr+D5glJc3VgXXmzsk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=lhhNqyDAyJxVijnC5314AfVqtkzVnDbiOZ1XdqI39DuoaQrUdkXkdVNrlIX6jHIuJRCUiqxwW3AyfWQSZmXawX6okz0qe98UyR8eEtgSsKwAStZoLB03K6mjfdh+M9s0AE40aUQ22rz+YcbgO1d3drcLpnJMyygkF5EW065Ja4cvYaePlpFXZfeE4o8gOGsfC6K5hy1Sirkt7NwgWmWEycRmgG5+ycoR2xV9rA2EqVwxXCv2x1v9Uck4FojE6FCbCpKKaf61jjjtPW4tmJLLrLNI5tpfb/nkQDJXDtIYvcMNLI7LkGUg8pZ3tL1vhfTg0+OLCRdJ6XkQG3CP4D0cPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EOR0wMes; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EOR0wMes;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fh8Lj28yVz2xcB
	for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2026 14:26:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774495564;
	bh=eB+dLsG5tXfnyNIFXfqQOMNtjQr+D5glJc3VgXXmzsk=;
	h=Subject:From:To:Cc:Date;
	b=EOR0wMesdSerzGer9QZ3uJSHa96ISOkKd/JLd+h6xt0wovzpoeic096Drj2uVMemy
	 jEQjI7RRhvADgnBKnNloQuEClQpWoSksAjGnA/cQMtHh+0FydaCtHbhvsyWvg//XUq
	 cqGyGvWV7ZOc0Z9n0pW2VBIr+ALXaOrlkLeFjuIMX49YMmIvpm0ApWprGbV0MlfMv2
	 nGVy4g4HkiChklNJ0s5q2b3NA1ya+j/GRxoZxPVD3nzvS9pQGDwrcHwQpOG1F6Rt7C
	 kjf2pu/yAxt89bNWLqHmHeKF1NlA86DgRZnLs/JueF5onfqBmDFz0x1WOWqj5BsBJH
	 AUo2McuK1U74Q==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F53A645CA;
	Thu, 26 Mar 2026 11:26:04 +0800 (AWST)
Message-ID: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for v7.1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:56:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

Hello SoC maintainers,

Just the one Nuvoton devicetree change for v7.1

Please pull.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-7.1-devicetree-0

for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:

  arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026=
-02-23 09:43:36 +1030)

----------------------------------------------------------------
nuvoton: first batch of arm64 devicetree changes for v7.1

Just the one change this time, dropping syscon properties where they weren'=
t
defined.
----------------------------------------------------------------
Tomer Maimon (1):
      arm64: dts: nuvoton: drop unused syscon property from watchdog node

 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)


