Return-Path: <openbmc+bounces-1703-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145A1F532D6
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 05:08:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffykB456dz2yjq;
	Tue, 24 Mar 2026 16:08:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1230" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774328930;
	cv=pass; b=LvlXmHFqFu1czbDM58fI8N/7eL67mGdx559JkJ1Mmck1bG4QCj6X8cbFCHueHkH9DYku29gEbUX4JDgertyZD00NTNQqvbzKtJtfZJZXmivHuajANQhp2HMLo9I3su2MR1zAaCu7uCNELsC+nr7A5MZAUQUiwtFNLiO092PjDxgNCtR9/Zkh9xP1nM4ImuqMUkU0Vp4WSVaVsLlaYpssWDvImTtTJx7P7fGyharDMkezPON2S/yZIeei2OzmDty0RdCxxYsiuw+biHPoFTdkH+JN6bsXbMJUJQUE0wQ/DgP9z3+mwzFI2TGSuqOSn19d17p2RIBxnhXlMaMmmwSOGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774328930; c=relaxed/relaxed;
	bh=LixiEbiyEWLnePqgBNURR9Z72E7Yar2adrZUrudhcIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBbnbKImdgQui7dUIvKD9Op4YifZyoJeZLyRoB+hDFqVSg+WcycPxfxqbSOo90mWzjFsuwxGFlNMQ/wIKZ2bptJSHub3TRNayEELivdFVvNuTtpiofrmdPC1gzZcTNI2Nhy3O3/cPebCVtPdWAvqio4fmoI4N10OSuCWMnosI6/uPF0g6FMxFroWCD2U2UI5X3Mf81iWVReCZLr5RPOMZslaztRV5OCPsIiEQKBP4D5L5YCyuF6u0G13+DxwWjJDImUJQy3H/MbgATCQwIMa/T44BHa+EDzpO+O1iBWWDoxMb2d6MYJG3ArZMruD6fSNLUeWma1ryFpfcVHAxA37dw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7UzsFb0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7UzsFb0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com [IPv6:2607:f8b0:4864:20::1230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffyk85sp7z2ygh
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 16:08:48 +1100 (AEDT)
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-128e4d0cc48so3874456c88.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 22:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774328926; cv=none;
        d=google.com; s=arc-20240605;
        b=JLBlp5Gc3Cy1q29pLYSesLyHpmx3fpp/jB7NlNB1JSL8gnSKwpj1ON6Q+Bxh3JfXOW
         kazHeJIvtOwjxye3luT6f3DgCvZbsFMO5XBEXXHpkkanFwy7KUPG+5/m8Is2Ot3G1VpI
         QE6uhwRwVp5WAlwuurpzR99SRy5Cx2SghdlYF59R7dwXAAqzA9YhSblaOjbhrUtRWAch
         6cpY2UPTUwY1jIbepj3i2/Jk/ooRSAO495NHs0OxUl1i6vl0jm9TZwXJulsiXM2yjRpY
         BTvqT2LVPw4XxxXkA/5BZQGj8oy6D+tbeBSk2fyNa9DSiS3saUpycSqWLoKAh0QhIRsT
         KYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LixiEbiyEWLnePqgBNURR9Z72E7Yar2adrZUrudhcIc=;
        fh=eOLaVgxBut8UBC2o2IHLldvMXXyY/xhNypVd38JG4/U=;
        b=BQaMbNWPhgJjYvSVikyfdB83GPUQ4X7lLSIw+FspHnAhXVtwIcD3NC4cAppsZ6U09a
         wuihfuMas68Sh7DsSAaAERQ9nknWNP9Wxll1Sw/aUTBlLxKdsg0cG2n1Si6R3WyJA2pl
         O9lelVGmWHCG+fu4AMKI1Y7sAmLj/ov8PXyXx0JIjqNUFPFwHjMVdbnIWyv6bp6mwRHQ
         nhD22hNhYlK60DZfbPBj4du9+owjdINnZThUqSJ8e2Mhz0bb7NjPPYwRP4ad6eNPxwKm
         uSp5oQatOtau22Q+bbpEA0meyaPpuoIuIW5x2zImxrdrANYQttkfAFe0gArMhm3nhFwx
         1MYg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774328926; x=1774933726; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LixiEbiyEWLnePqgBNURR9Z72E7Yar2adrZUrudhcIc=;
        b=P7UzsFb04AeGUFBmdBPJX33LKvpkDqSaJYYdS4dYfAdLbIP80WRSVam3MYe3Hb2Lxq
         G/yH2vDCYgm5xIT7KRePURDZLBPB4j9kvUbGjBQbGB5I86rUtNQ9iS5A6kxosn0odqXH
         WmM5sVqgj3VSpPLoxfUQZrqf5qRDOXQduXyHLWHSNMop2cAFvAbXJejzH7WrYlDO5l4m
         b2fLiGJwagYqrXpgIu99WCbHRr1l5kmZaZjT8D4Tqst8lXxpiUk7pOokEa4hz9YnN5Iu
         0MzVXxf/gWRvyFO2e+QPjYja/zYBZBeJcCaBx/j8PZERQcahjs5AhDGkOfr0zPmdV8eC
         mbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328926; x=1774933726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LixiEbiyEWLnePqgBNURR9Z72E7Yar2adrZUrudhcIc=;
        b=OQeU3+Ar6fCEbQNkMgIMqZwfyZh8yC8JOkMxXC1BhWoe395qFEr+FRKQRnfLJBSz9/
         P84qxYRiQU5dbes8OS5bapUpB4oEQJsuapLQAjaxlUrfcEvvamD+YJsRyl1rITu4OouG
         aSGA5w7uNoAvjBi4UcSFAhy1X11yGuZZHlucz1+SCB7JRfcIXZ6/naAiKibCpQz97xT7
         eQD3msz1E0SKOSPTwUwYN4QYBsJWrWCjsN6QH0aiqZKds8wRSAqUPldTJH90dcX6MtX3
         Nr0SViOJHzOeW8c4TyUHrXzXW1Nm9HOdCKM865FoG4hqeqL3vMA8vRIz8xkWxwSULOHg
         54Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWwaagUls++HqkKLkaEgCRyryuBo5pcMr8aTeYQdF7gxd8zJLco+RxKLpnHFx70e+uvVDKU6/9y@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4UhucH0/d9gAiwcyhW2XLQxG36hQO93Y6WzVoL3jN7e0Vxk0f
	bGvSHXcTGhzSWryRTxeIFJ33PhGEYEuq2H3xJOChawH0YGyy7mLbU3/TLEpGtVrsLkpLPh6eA7w
	tGUkggm00Xc4zjEx0EDJZNOplv9ZRE8k=
X-Gm-Gg: ATEYQzztHVoB9hLiMtfo4yadCjw1UFmzO2i6T2Xm5RtxGz9/VpAI7skecInJbb8RCar
	1Z/XkUhqR8f1eaEELmA+E/Z16LeWfNlNHCGtdTHTJj/yE9r89S/0RQgJoUmCd/N3H5hZrdprlpS
	5CDIb3tvQoe/XBeYPOrayQsnAxmq4A4mv7C5ExCmwkGVb6l7M8Ec9t9SffHBVKL43x2/8+ve/Y9
	ScHuWBIRcHVEFwC8cZB4F0m4mqiiwrc+5pDZeU9O8WwS7GP2Dc2sKiONmIbrRk+1CClXp8An4WH
	Fw8jCiV57zDYs55XaC1f
X-Received: by 2002:a05:7022:626:b0:12a:6a64:81f1 with SMTP id
 a92af1059eb24-12a7267d7c1mr6496466c88.5.1774328925579; Mon, 23 Mar 2026
 22:08:45 -0700 (PDT)
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
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
 <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
 <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
 <CAJ13v3RhazyeTJZKnh7SOK2O51F2-jW7SYSbs4ro70pdvfKncg@mail.gmail.com> <61cb0ad57b4c79d3a026d8ebf316ea95552fff93.camel@codeconstruct.com.au>
In-Reply-To: <61cb0ad57b4c79d3a026d8ebf316ea95552fff93.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Tue, 24 Mar 2026 00:08:34 -0500
X-Gm-Features: AaiRm50lZd7MUnxn6gDzaNTKfZyrjjEY_x-sncFNyPkRFXhqs7RNWiAGPeS_Z9Y
Message-ID: <CAJ13v3QLjmikAYVuxU3CN-GNq+PMq-531x8MJEciV3B7HZc1dw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew

On Mon, Mar 23, 2026 at 6:42=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Anirudh,
>
> Sorry for the delay in reply to this thread.
>
> On Sat, 2026-03-21 at 17:24 -0500, Anirudh Srinivasan wrote:
> > Helo Andrew,
> >
> > After doing some more reading and experimentation, I think I might
> > have a clearer understanding of how things work.
> >
> > Andrew Lunn's suggestion in the patch series from Aspeed was to patch
> > u-boot to not insert clock delays anymore. And then use rgmii-id as
> > the phy mode in u-boot and linux for all new device trees.
> >
> > I tested this by setting the mac2 clk delays to 0 in the u-boot device
> > tree like this
> >
> > &scu {
> >     mac2-clk-delay =3D <0 0
> >               0 0
> >               0 0>;
> > };
> >
> > Setting the phy-mode to rgmii-id now gives us working networking in
> > u-boot and linux.
> >
> > So how do you suggest we proceed here?
> > 1. Add this DT to u-boot now, set phy mode to rgmii-id and set
> > mac2-clk-delay values to 0. Networking will work in u-boot and linux.
> > Update the DT to remove the clk delay values once Aspeed updates
> > u-boot
> > 2. Add this DT to u-boot now. set phy mode to rgmii-id. This means
> > networking won't work in u-boot, but it works once you're in linux
> > 3. Add this DT to u-boot now without networking. Add networking later
> > when Aspeed updates u-boot based on the discussion in that thread.
> > 3. Wait for aspeed to update u-boot, then add this DT to u-boot.
> >
> > In any of these cases, we can also now add networking to the linux DT
> > for this card (it's missing currently) with phy-mode set to rgmii-id.
> > No need to wait for Aspeed to update the linux driver (or I think
> > they're not gonna make any updates at all if it's just u-boot that
> > needs fixing).
>
> Working backwards here, yes, I think we should add the correct (but not
> necessarily yet functional) description to the linux devicetree
> (probably best to point out the lack of functionality in a comment in
> the relevant devicetree node).
>
> Then, do your first option 3 above, except add the description of
> option 1 in the commit message so people understand how to make
> networking function for both environments. That way it's apparent that
> anyone who has enabled networking in u-boot is also aware of the
> (future) problems of doing so, as they likely will have read that
> description. Please add links to the relevant discussions between
> Andrew Lunn and Jacky to the commit message as well.

Sounds good. I'll do things in this manner:
1. I'll send v2 of this u-boot patch without networking support, with
a description of how to enable networking in the commit message.
2. I'll send a kernel patch to enable networking with rgmii-id as the
phy mode. The commit message will mention that this requires patched
u-boot without the clock delays (with a link to the above u-boot patch
series).

I'll add links to the discussion between Andrew and Jacky in both.
Once aspeed updates u-boot, we can add networking in u-boot.

>
> Any concerns with that approach?
>
> >
> > Let me know what you think (or if I've gotten any info incorrect here).
>
> That all sounds about right to me.
>
> Andrew



--=20
Regards
Anirudh Srinivasan

