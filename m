Return-Path: <openbmc+bounces-1380-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9621CE7BDA2
	for <openbmc@archiver.kernel.org>; Mon, 16 Feb 2026 18:03:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF9cv5RFLz2yhZ;
	Tue, 17 Feb 2026 05:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771265023;
	cv=none; b=QFBiHOzzBnRtXj6aBlTfkhFo2nYM1cgPuzup9C833wbSYN1E3ov4LYvfjQLcYA3KPntYNEtDTCcL5IY6Vi+d+s05wekm64GlU/SuHW/0C+Lksy43xEfnVV1xq/8h8/YCNBgSO53+w77YQpbdZ1XeZVW3HcC+jDLu3G6YDBNvCeinbmv84rAEVkzqsQmRE8/ML/9GSE8k/hdcSqtTSZmp7Jn8QxpiXBDQRdG1mOdEatvQxxhREzTcAewLX9P5bVSoDFPx7EC/fOm0e7XGjjZDOyN5AMRtJGyhl/wpEgsaaL8WXFJs/MCNFl2P8hJLMMCyyep9jZ7oWEJR1JRSTV1V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771265023; c=relaxed/relaxed;
	bh=gkzhdUED15YzdYs2NkZ9Osm9dKyg7sifyncHcTitdIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPs60Pzkh2EvOeMYE6erJ07L5Ozp/A3l8yu7Yn84RGUDkQ0Iw9IPFfhLo/q2eCZ7I1+//r9UgN+IRfIKTgszUeSfZQFedjmx5S2I/M9hlgJhA7oifYQ7u+Uf2IdwYDsUgyXZvGbBUfPsozPN84hp77MERtjPZq/lDJDXFjQgCikiwVZesdY2RyN5KzgHJViieqV18HoT3ez8CCz0XH2Q+ARFQUEna6lrXoj/w5VeY2RCz75c7sdtBso32ZYj+Z4Njyz3qlr3JOT3Oy8wih5Jj7d1cvzKYadg1FUHa+mxXsh2pAuf2OjX7tSbY6sbiTxeBAaVrimdb3UizPA9N5p6jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QDduNgEO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QDduNgEO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF9ct0yY1z2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 05:03:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B38A6012B;
	Mon, 16 Feb 2026 18:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C3AC116C6;
	Mon, 16 Feb 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771265017;
	bh=12AobuvfJC0/Rr3kiMzktENzoZVeN1x1pS64b07jWBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDduNgEOcqajMkaro+wm6lM84ZiDLoeR3Vbzlbe+KK03k2fqCPjOe4giRn7+UeXZu
	 BAsF2nw1KPHivF+8b3EhqXSraau6Vi5DwRcBik5uDmvklN/DPYXIlC1XKtKYUMHKAD
	 c+bISUM8EiIwjtXVCZDvURseuxeiscpq77i80dhKUvj8k5viIJmLsm4wWgp4vXy2Cd
	 BwFxwu9h++MVvlw99tfHzlfXht/sLShN7Znj0Y27vvhM1CpUMeATAUFq0uSI3tSewO
	 k3LxBduIeJQQ0D5R/4v3mxxs8/72oxil35egyvvvHuT85KdKrjWOn6Dj3/p97AFDLp
	 9GczmUS2sdFEg==
Date: Mon, 16 Feb 2026 19:03:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, 
	tali.perry1@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status
 support
Message-ID: <20260216-prompt-boisterous-worm-fed8d9@quoll>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-2-tmaimon77@gmail.com>
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
 <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
 <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
 <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
 <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>

On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer Maimon wrote:
> On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>>>> +  syscon:
> > >>>>
> > >>>> First iteration. See "How to Get Your DT Schema Bindings Accepted =
in
> > >>>> Less Than 10 Iterations"
> > >>>>
> > >>> Thanks, it was very helpful.
> > >>> the syscon property is already found in the WD node
> > >>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
> > >>
> > >> How is that file related to this binding?
> > >>
> > >> Either you document existing ABI or you add new (for new device). Co=
mmit
> > >> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
> > >> discouraged) ABI was already used then it depends how and when it got
> > >> into the kernel, e.g. if someone bypassed DT completely just to get =
it
> > >> inside.
> > >>
> > > The syscon property is already used in the upstream NPCM8xx DTSI watc=
hdog
> > > node, so I will document it as existing ABI and mark it deprecated. I
> > will
> >
> > And how it is used? I cannot find its usage, so I do not agree on
> > documenting it. Property should be removed or at least provide the
> > justification/impact of removal, if you need it to stay.
> >
> > Understood. The syscon phandle is used by the watchdog driver to read a=
nd

You messed up quotes.

Can you point me to the line? I REALLY want to be sure that we are not
wasting each other time, e.g. me looking at wrong code or you telling me
some bollocks from downstream.

> clear the GCR reset=E2=80=91status registers and then report the reset ca=
use
> through the watchdog bootstatus bits.
> Therefore, this property should appear in the binding only because the
> watchdog driver actually uses it =E2=80=94 which I am implementing in thi=
s patch
> set.
> I will document it accordingly, and also add the new nuvoton,sysgcr phand=
le
> as the preferred name.

Best regards,
Krzysztof


