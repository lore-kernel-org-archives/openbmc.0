Return-Path: <SRS0=fhgC=HN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDEC433E0
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:49 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F5E64E44
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14F5E64E44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc6rl0G7lzDwq2
	for <openbmc@archiver.kernel.org>; Fri, 12 Feb 2021 06:58:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=doEZvJX0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc6pk3JjYzDsYC
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 06:57:02 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2688E64E5F;
 Thu, 11 Feb 2021 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613073419;
 bh=NYyqM+APAuRJfRRlkyIxgJlHUt2fMaHxusXG+d+xXn0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=doEZvJX0SliViRD0VWtz8IRsGjKRDC5owplAazugK7Ri1uusadscl35cQ/rQqtFh6
 ScnzPoB2iABIy0z7UCTlrtnI9MHm0zQp7wFe3keaifyJMhCGnL2i5qdc5+QP9BnDNe
 u4Wqfvw8xr+T4agPz66NrPcDmzEkgWg7+ms/WuSBamJNGvswCZ7XbawLD9DGSi8zxI
 6TcWXX+MjYBb0Fsw99ubNrdIpvm0j0HhixG7Bv46u1rCdkYav+1SAHd4d97KJLyyOM
 /ZS/AS/qfsf3rfuGjC/VQE1sUBDkqZHw/kzGynP1Y6TJKHQu/Smf11v0AE/2kxpg7Y
 tywAc8ikzZz4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-16-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-16-lee.jones@linaro.org>
Subject: Re: [PATCH 15/21] clk: clk-npcm7xx: Remove unused static const tables
 'npcm7xx_gates' and 'npcm7xx_divs_fx'
From: Stephen Boyd <sboyd@kernel.org>
To: lee.jones@linaro.org
Date: Thu, 11 Feb 2021 11:56:57 -0800
Message-ID: <161307341789.1254594.6715719974957898063@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Nuvoton Technologies <tali.perry@nuvoton.com>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Quoting Lee Jones (2021-01-26 04:45:34)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/clk-npcm7xx.c:438:43: warning: =E2=80=98npcm7xx_gates=E2=80=
=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/clk/clk-npcm7xx.c:365:48: warning: =E2=80=98npcm7xx_divs_fx=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
>=20
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
