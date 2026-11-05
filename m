Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5D606A331
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fk87PFjo
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKnzF2dP7z2xlk;
	Thu, 05 Nov 2026 14:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793849785;
	cv=pass; b=CAetiVgm9DHrMCnGBCNxnSASSVO8PSG+BUWMpgvniaKsqDwvDFiAD88Wp9jcuorZ/oWiC1VMeZ6GeC3RjC6LBUlGgGdPQgiJ5nVYAnPDhpCeJTYZjbJY9+oaDBP8BkTfS6clgcYNccDDQiItV7WmecUDUqANJuV8z8uwe+RfOhe8R6BFXOqCcZy15odqDucl48EJnIqrH+han0pjcce/l3brnxXpDBb1RI1TmnuE/JvMrFeUJ2oHPFZNfCI7ww0klhUDA0c51M4jxhB3zsGEb3Gcj+PXoQCelshoZzMpGXllSFrg43tOt5X9gpSWoRBKtr5WWAhPdvYR8Y/LANOAJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793849785; c=relaxed/relaxed;
	bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQuS6H/ujDJkOTwCEdrWgRzw2C+dbuH0IGEYx2WxE8V3fcCQvp/uxRLmfn8b1p/JtDQLIWS4szGXu2sSJU0HgsGYnX7GmxNAblUo7TrqzajqlMUqrFCGykNUTjVRzhLnDcikmdc9hMcoAsMmkcmWQxnq3CG9USBt2r47VfUhXzgcPBMpfcSPULNC0dbagj93sPElWOoYaf/jxpUnzmEvo1ukzGqEvRLXkDTa36p7K3AvA3TUpME7ZwPueYPeVzHxcZuOu0PhCZgKEpPNip+UWO8L3o/KwJ92HNanT0SZgG1HC4ijcAg9PHJjxOmvnBep3bfmTJyLQPHbvDwTatUs+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fk87PFjo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fk87PFjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKnzC615pz2xLd
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 14:36:23 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b31448caccso11973107b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 19:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793849780; cv=none;
        d=google.com; s=arc-20260327;
        b=piw2hKjx6IYjnKA+LIdZCFyHVeqFZ+wnOve3xol2NuKuUjk6ex/TChLS0vd7o9s83s
         Z4YDqaL9DNIlOjFeq4bGWeaIK2Gnc5K6TN/AoS/Af0MPfoceUqohCdlLYQe4q9qKEE9W
         UUYn81JwKjOOJq8yRLew6w35Mk3lkkK1+GT+m8lQF05k3DTKStxiYvSSM+XLtN8n5dxE
         71xGJSo/PJb0qdFNP3tUbFvrhJ9C2irJw6uHIegsny+NLDG6g6DhHiDQ1DgU83ZYdUep
         BsXK1n74+zDejI30dNltIBxNq4jGsU+RS8W9IsVmoyk8p6nx8DNZ22HvIl/hGbJAe8NP
         uBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        fh=uZWv787j/BHW3b+vdt9nl09uBD9F7xr7b773IaqPfpA=;
        b=DrUCT16xf5YNbAf2TBa9BW0hRGACYMBPgoPOTm1oDcRev+QZ8S1jrMctveh2vie/KX
         B1QuWZIF/C4zVRy58c5I6M6Mg3QARAiD8wgiJWGCKtzj6M1PJJnlbNf6F7jPVU3imEfu
         EZL3Y2wOem+K246xdOEwHlRs+5NVpnyKVERwBvoQBUEDN8+mrH5VHH7Ejk/hPirT0o0U
         xVB+ul3MXl7UQ5CsyojwaZcass4Q8uLwMJpd89+1610aYFlYAzk8RhoLmmKmwiiEh4Ta
         4zdg9TSbGSdztfnqjHgO/m5RgRzYLP+kxCYAu9PcPaLtKl+gFUlY6G7HzNxIjoZnrd1m
         9GIg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793849780; x=1794454580; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=fk87PFjoc0hYsGNiAKbr6MaBK4qdErtbMH3PxXexgdlzXXKcozzL04OlVFg2Ab0Q58
         CqIU48JCWRg/s5NOZTIwtUFu6YQjircETqbSrGDUhkqLoaMeKKyn6gFLL50ZWjBf2ofn
         bLsXmMDJWKy2LUY1I7n5k/uO4jeuugcBFf8Gq634dZSyl/xYcNodcXzBIAae/ECUMhoJ
         tjKM298brpFVl5++D8WBLMlCCro7Q2i5ybK+4REp/BCnILJ2uBqNdEXSHul8oAWlCkSX
         qXvyOyYdlr2E7iEQ6GvbC2PH3A10QFCGvrORA3cBjtg7vLeSUZwaaOE4N9WIaQVFuHwn
         ZOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849780; x=1794454580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=Y+iGNSuoV/imTOMIG21vDSh5uqGiKksbt9YZsCxNccmy9cDYej3el7gcwwSe0eYciv
         x8oaGW+VvfZ3MDe4tzo7NTVK2IzY+Wpm3dKFZf2CCocecimX1vBfDH+2GTgl6BxrCn3t
         yT3PcpdWMB02yIInw6SKnmHKDgEU06RMO2e+Pbp0mGFpXtBNHOlJw6eznJEPa2TQT6+n
         xFa9p5KiYg/0m29dkzyCZOPWw6oNoYBT6/YcbRElb+pYY97padHRWZvZjrkdUZy9duZS
         jfCDaVkMeth+8sfiPXj/mKREzwwMb4AEDRFEp6aA1w9D4soI8JnEQX10OwCqqPYWs1Wv
         59Uw==
X-Forwarded-Encrypted: i=1; AKwUvBx1hFQ/dICXO7WUN9Wzym82z3kvl3//YZcZ0YONp31Gzz1LYVvDPwSVNZXP0GCYoQkShZIrpzNE@lists.ozlabs.org
X-Gm-Message-State: APuU4Z8Lnj0n7kRt2HuBTz+t+ZSOEM4ova3yyRNkPuriinJfRT07TibA
	MNcrySm+dVAW6GS29dbqDPYOOLrInzwDya4MFtYmjO1CNWKlK61guD+SaHMs4B3479c4tmmj066
	J+ZoqHiiotodHcYlDMrH42ieuVmUJLj9w8ULE
X-Gm-Gg: AYBFou2Hh1ucxedHqlqiUeUUoIqeruc3p53MmGlBiaH51I+zQnU9W5z6qXz3btOCjae
	PZADhLdLt0lvuUtdvkFUu0KJMkZcXa93qOdAWaXgXt9KhRBl0mU25sX87xFzKGuSH4SEcAXsaYL
	R+MjZkm4lyIrZzhBzM6PptaHStg2mO9840SLNQ/VA5QiJlMpHhFwyN9fZNJBzOugN32Cwfe4KlD
	1shdjiRESnyhKj9BYd/F/DdEbutvTc6JxStb3PzRJ0cWJlrEUyuIJYizrFyuITZeqmb5kGtzTs4
	QYij1OP288osaVPHIRtBpeMPK8p2x7xXdHvD2mLzS3AD/CTL3MBNvAL1gxYLb95RG1QFXDkq3jG
	JXj+Kl6qAMNRcX8/PmyyN4nX1TrDilEyLw0leDQ==
X-Received: by 2002:a05:690c:e3cb:b0:8b0:e385:edc3 with SMTP id
 00721157ae682-8b2b6719311mr132765087b3.33.1793849779988; Wed, 04 Nov 2026
 19:36:19 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
In-Reply-To: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 09:06:09 +0530
X-Gm-Features: AclHuK9YMOK-xz_gxOFW3IfSoWRvHeDrckSu5fgcWiOJM4mFO9QGiU-P0B7A4RY
Message-ID: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Linus Walleij <linusw@kernel.org>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Thanks for following up. This work is still active.

The October 15 GPIO-request callback was superseded by RFC v2,
submitted on October 22:

[RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment

October 22 RFC v2 cover letter:
https://lore.kernel.org/r/20261022024314.48623-1-prasanth.padarthi10@gmail.=
com

V2 transfers the global pass-through selection to per-pin SCU4BC
controls before pinctrl registration. It also handles SCU510[28]
through SCU514 and restricts affected requests if handover fails.

I have retested this implementation on B650D4U with a newly built
image and GPIO-only x86-power-control. Remote power-on, remote
graceful power-off and physical-button power-on passed, with
power-good transitions recorded in the journal.

SCU4BC remained 0x30000000 and SCU51C remained 0x1c80 across the
remote power-on/off tests. Electrical continuity, mixed-pair
forwarding and fault-path behavior remain unvalidated.

I will verify the requested base, rebase the October 22 version
and resend it as RFC v3 for renewed review.

Regards,
Prasanth

On Wed, Nov 4, 2026 at 5:49=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Prasanth,
>
> On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
> <prasanth.padarthi10@gmail.com> wrote:
>
> > On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> > not provide working host power control when the GPIOZ6 pass-through
> > strap in SCU51C[9] is set.
> >
> > With the existing GPIO request path, SCU4BC reads zero, but a host
> > power-on request through x86-power-control times out waiting for
> > power-good:
> >
> >   SCU4BC =3D 0x00000000
> >   SCU510 =3D 0x00000000
> >   SCU51C =3D 0x00001e80
> >
> > The AST2600 A3 datasheet describes SCU51C[9] as an additional
> > pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> > SCU510[30] is clear.
> >
> > A diagnostic experiment that cleared only SCU51C[9], preserving all
> > other bits, allowed the same GPIO-only power-control implementation
> > to power on the host:
> >
> >   SCU51C: 0x00001e80 -> 0x00001c80
> >
> > SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> > or additional userspace delay was required.
> >
> > Add an AST2600-specific GPIO request callback that performs the
> > existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> > when SCU510[30] is clear. Check register access errors and verify
> > that the strap bit cleared. Other GPIOs retain the existing path.
> >
> > This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> > unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> > GPIOP0-P5 requests when SCU510[28] is set.
> >
> > Hardware testing on B650D4U with this pinctrl candidate confirmed:
> >
> >   - Remote power-on: power-good asserted.
> >   - Remote graceful power-off: power-good deasserted.
> >   - Physical power-button power-on.
> >   - Physical power-button shutdown.
> >
> > These tests used x86-power-control with software button forwarding.
> > The earlier board-specific SoC driver, its DT node, custom sysfs
> > interface and diagnostic boot parameter were not used.
> >
> > This replaces the approach explored in the withdrawn B650D4U
> > power-passthrough RFC. The new proposal changes the existing pinctrl
> > driver and introduces no DT binding or userspace interface.
> >
> > Feedback is requested on two unresolved issues:
> >
> >   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
> >      Clearing it for one GPIO request may affect forwarding on
> >      another pair. How should that shared control be represented
> >      and coordinated with existing mux ownership?
> >
> >   2. The SCU510[28] enable path has not been validated. Returning
> >      -EOPNOTSUPP is a limitation of this candidate, not a proposed
> >      complete solution for every AST2600 configuration.
> >
> > Is the GPIO request callback the appropriate place to handle this
> > strap interaction, or should it be modeled through the existing
> > signal-expression mechanism?
> >
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> I don't quite understand the status of this patch, if it is still up for
> grabs, please rebase it on v7.4-rc1 and resend so we can restart
> the review.
>
> Yours,
> Linus Walleij

