Return-Path: <openbmc+bounces-2359-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F515C55822
	for <openbmc@archiver.kernel.org>; Tue,  4 Aug 2026 05:09:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDhRM3jX3z2yYs;
	Tue, 04 Aug 2026 15:09:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785820159;
	cv=none; b=XKIN3SF+CJYcxqrlVVezgBBopYeLkOTantGBwEAbCjBRRJjfGDjtrv2OoMn75rct9oukXSHe/GfKp+n21ySbvoFmVNmtYTw4LHe/wdqqWcI6XIPNOaJ1DcFq1yGYujLNVu2b5Vye9IIa4C3+CDoETgjkpVnvF+StruPwPJkhnjriS4ZQ1T4sS22s7/DnZs5lYNy0x7BhA9GImTUfQ0X42elxqNdIpTW+tTLLFVC/5uwmb3G/5Aa97uU83vXWNriyo5e1MWuTuXbw1eHs8GxSE9/NrsEE4FRmQMbLa2j2fAnwbrNNpTMLhBdBonriMO7keFZBTEg6uf9UVT9df9ZPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785820159; c=relaxed/relaxed;
	bh=htfmEBxdWe4p5gPSeaGp5t+0L7Q2woMpJDia0Suxgoo=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=IptYcw7Wil1mb4iDAje6VFIHdbjpPHT8c1GBZTTQw7NSZkPuYlklOPD6Py4aAnq4QzCM4uXBqJ8eKQaakAgvBGEO2aXZnndJx+uz9BEeVuGYMGIjL86VIvQ7Fgm9rf0TDCJDXzIfxNz/61dKSwSxKGw4ppo3lndVGbGWOjn0k05umz6VljlemN5z9cq4dlEg08vhMxITrar5sWOxzsijtZq+Wf76f6xJI/B/1cA0wrNJbaNSTEiXa2dchfxTl/hnLMzrNGQyOTebrbJgxYpNyBQDAU7VEuIBilB3ckljTknoqEPpW6wXyt5F7AxFtkkdQSjvwO2Znba6u6CMWNxZeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BqMdCbTk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BqMdCbTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDhRL1BhLz2xy3
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 15:09:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820156;
	bh=htfmEBxdWe4p5gPSeaGp5t+0L7Q2woMpJDia0Suxgoo=;
	h=Subject:From:To:Cc:Date;
	b=BqMdCbTkkdnKbfagIRggDfKtkEFATJAkuuLRP8aGfremiaQB/VJJJ6AVE5E/LXkXn
	 ViSIaIIIHmziTH4bhotsbtvs8475vMBqtjUhPrR6FSH5XAtt93JutXreqpXgMm2/cS
	 BHG2zvdSDrjdi6VXClLaFx5GmZp6rrPu2/cmQhDlftLRNyyOKZCaXLJEZY4Hp0+QAt
	 sJ1Xyhf0lBn1xVqVkIqT3yaipnwl8jOJavzSQak/y66etc7QAOnV0aFRpAsfKSlBKc
	 nskKCMhjj6YNO3Djb0A5nS21qifWdnUXF6nN8D8IoJoXFwxTokSUocgfiKhsrq5fIS
	 eENXhCNkDgd8A==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 436AC655A9;
	Tue,  4 Aug 2026 13:09:15 +0800 (AWST)
Message-ID: <47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:39:14 +0930
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
n-arm-7.3-devicetree-0

for you to fetch changes up to d7cb66fad58d8fe3cb8c43f5e48dd51a8c15358c:

  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names (2026-06-29 09=
:59:10 +0930)

----------------------------------------------------------------
nuvoton: First batch of ARM devicetree changes for 7.3

This time around we have a couple of cleanups from Tomer that make way for
improvements in the bindings.

----------------------------------------------------------------
Tomer Maimon (2):
      arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
      arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

