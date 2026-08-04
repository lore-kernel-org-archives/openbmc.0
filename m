Return-Path: <openbmc+bounces-2361-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B97C55184
	for <openbmc@archiver.kernel.org>; Tue,  4 Aug 2026 07:03:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDkym2bvHz2yMl;
	Tue, 04 Aug 2026 17:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785826992;
	cv=none; b=keSdEm4c/lZ4i1TDjAcX2tIDneqKQIlXKRfRJcuC3uWo0gCoKVQuQUrtDY1a3f0RXULRgDHgG5PGwDH+aoBwZAuRinoOYM9j9S8BAXBN9+PkfVTf7SEGFUjH6qjGU+bonNvCPh/O7+Fy58XwwPB4TCx5UaxYQEehFs77kDBK27xQIiB0tjGPJiItkPLYZin+VlMMmag4OBu7Hkff6bmZalGIlbNIiGUTeAYeTq1swLJ/tAh6clcM4EpV1ymP/502VxIcpDTdylSZ61JpjpvNRnNhoo2aCqk4/EW3Ztf9Cicr4ZAcqhZhV1YH3MeyB8outoeBXYOzSj1uaOBZZioUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785826992; c=relaxed/relaxed;
	bh=qXzc8xnYbWowhoGDOoifA47wg1cCzQKm9c6k8J0ADYE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=EindbRos/Mr2Uj7Qn5SO5SrFHJADfHIhSrdqpD2fjGIBKBjcdE3BlEv1q7hf6OO7gLBUpauRvs8S0csviFMhNyg4bSjvvu36SUvY1bd6WITjWvPhvZDPrLh/o9XlWLax5ar5EC43K/Kb9zhdTJdKetXOWKmaYP9YNBa1D295dFt8naB0waPtjrwU5j+qe6WU3GSWfvJQ7bezIbdeoGd9d1TGepWifzt1FymIDnnm25CIo9Ymf34OE5pGIsS26WHvtHjQWUK5OM0irTnBrCyTUL77DsZpum4yN9vp44/E8r5qSDnZI8+Jod0issxNnYVNSl4afQrvzoCik1yrwYOdqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H4K9HCfP; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H4K9HCfP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDkyl4Fssz2xpn
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 17:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785826990;
	bh=qXzc8xnYbWowhoGDOoifA47wg1cCzQKm9c6k8J0ADYE=;
	h=Subject:From:To:Cc:Date;
	b=H4K9HCfPzmEExrjN+zsd2ZVcn+t2WRv2iUUva8SxCmNBBjexcqtLxevBzZDC0+p3K
	 AmochYOVQHZLBHkUuzNZk+ScehrWG4l9y0FWf1LFpeVRLsr/dHtE8/AOulT0KZhLNG
	 idNvzygCWS/c5xu2eu1vV3pRxCXebHEkj0KK05hRqOtVTrUJXWz4RsZJJDjbJy9KbJ
	 dsE1oRDLTfbMzKhbpMqYZau3k4KZIWE2VFL1tspgSTBaIWjsP5C3QCa69pdlgXtVwZ
	 kDrBVwsQ+K0rYQgVw+EY0I3c7FWMVDuFzZU8O2AqB7rCJA2PGpvM3SYsU7wHMtiBig
	 QAIc6a3IjviPA==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2F47655A9;
	Tue,  4 Aug 2026 15:03:09 +0800 (AWST)
Message-ID: <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of ARM arch fixes for 7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:33:08 +0930
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-arm-fixes-0

for you to fetch changes up to 8eb052f48331474c2789d07b7f11165c323bd2f9:

  ARM: npcm: Fix OF node refcount leaks in SMP setup (2026-07-22 23:11:56 +=
0930)

----------------------------------------------------------------
nuvoton: First batch of ARM arch fixes for 7.2

Again a one-off change, fixing OF resource leaks in the SMP-bringup code fo=
r the
NPCM7xx SoCs.

----------------------------------------------------------------
Yuho Choi (1):
      ARM: npcm: Fix OF node refcount leaks in SMP setup

 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

