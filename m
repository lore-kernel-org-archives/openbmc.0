Return-Path: <openbmc+bounces-2729-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D332CA5FFE
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2026 01:54:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hzK7S5FJKz30Pp;
	Tue, 06 Oct 2026 12:54:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791251668;
	cv=pass; b=buPq0uk/nJ7uX8FuYV15POU7Hm5FV7oJIMUW0Cd2MbBP5FsTfoanQ+nUHYF4px+dEWKFO0vXii7b5GVWeJR6EpFdIcWdYIT49yUIDBBe43jajHPqN/QU5YCSxVCWchAgeTz9TuclUNbTF1sNB2WB5uPnbjDg04Qq8/YnZgBQQIqU/McGHeUeoqqDFRRBSA6s6/e2BKAx94c55UMWy6LWrF7/SjLBUnTWwgQhvnEGlmCLd/K3mVBzEHWSbEXODrKy4ercEHJnBcFbal8dOcVE7o6rlSeGJ/sbOExMSWTHnEDiAaAnl78nqKdBjA/Uu+9AvPAiqgL7f9FuwRcJ+6JkNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791251668; c=relaxed/relaxed;
	bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epSU1dSM8y8xauCO4YPPcnDvdqnX+4+Nh/4noqGcvApRD2X3ldeDb8ZAaI5RmPHPAZ/gqlTqEH6x1cvXq/zr0QQQ+SMc+7MDYFqA7s5k9c54k0PDt/W7DwqPp4/y/YavMilaZbL/POUjoJUFkOpY2RhX9DcpDVYROpi8dqB9Kpbn9YNP0LYWNmdPJxHiPH3sZpKWfgbeKURSTIXuW9V25r/8ptZd6BaqRiXBJ9qdBdUKLZD1s3ic4E724xUIuYdLvmD30MN73tUtGNjE3rV8CM1S/n7rj8L3UxuC/dOYen4dv2OmZZQdvSXLT+VtQkxY8Z2fe+khYRQZ3FqrKrt5ng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p6s5i0Vn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p6s5i0Vn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hzK7P5pShz304x
	for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 12:54:24 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8ace0741488so22605847b3.3
        for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 18:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791251661; cv=none;
        d=google.com; s=arc-20260327;
        b=Hek2gu3/3ADgQHK7zWbvsBimEbajucO8+1Kug+nWLQzQMt2dxRLhd6/vGRtpX7E2Fp
         PNunYLI03OueBfbqRikdtemmmizepXPmstDKpfSed2RCz0c+OAif0bVUesEUxavBtzLm
         ib9DCBXmIWhx90dzI9UCFOZA945Br8ZYsPdHLwa+Uza9Sm79tb2v8Y3E7wNp5P171QMT
         ULmY1anUBD3W1u5zUpzpr0ACbRBTbZkMXhktfHda3B4yIbKVAAugJ5W5CkVtg4yzJaYP
         KZFXVHK7on/0Kc/j92NGPNp/qnXPXGSGU9c22GFsqAJxkZ0eYuAovUcZywdgrxgsEXQl
         9tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        fh=xBna1+F6lVCNrCoBNcng1BuZKHb86HEepM0KZbdTGcc=;
        b=V1aNqDm41qFpQ1crgXnLb6soykQ4IhCaDXT/+7nn5Y7XAYPKyzivXr/F1WQSZcIhGx
         Y/ED5G4c7nd5Z1mhCAitrwqAoHyRGBFpLt3NNnBI26hqrom2F2kBA6dJgfMEHtev37BD
         q7Q4Q6+5yHwLSjEDaEvHhcskQnMKly8iwSOc6HfasApQ5kFaEPxqD1KcU/r/fTgMvE+Z
         uvgwxjCVjW+ZLfbnwsdyzb+6qvM3d3+vtfrrjffJYSbL2MbYH0jo9DV/hH7GfxWSUlsV
         o5zGBEXM21HKvLutDbteHKbSMicR+XZ3oQoFmlgc2k8zr2SeMbzAn8F3t7w2dlJ4JSog
         Tf/Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791251661; x=1791856461; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        b=p6s5i0VnRmiR87MVTAdC4w94Yat9vFkESQNh8xCowLwDEsuNjPGxaCbHe73ImgE3eL
         FLVoSLokejffWRHq75K5EMydqKxnQMlzauLUOcuXLaOFId17EXKnsBEwQBzuRr5xbwcU
         7c+6zOj9OZtGHgCDIEDAOBTrEXBobMVYk/fsZf/M/TQSU61MTzLNgdwKG4qLB/u7+0Lc
         Wi2RTFavfY6G/3g/k28Z/+tUtCyxpnXEROdWpPxfvvTKmbozrwoH8zKZuk1rIbXJLF7F
         p/1ftI2YuVTjUYgbBsev2RSjaZQv1P4fA7+SB1QG+QM+NdHg60yImNAwP9MlduW9LYY2
         9JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791251661; x=1791856461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        b=Bm/GjavaE2P90l4+tfQ5pMRXcokDsLRurja5I/GF/NuJ9cVbEt2+PDM1rK0TygA+0X
         LSsgXHcP7LWk6ZLFX9dxWTSsQtXY5XLCU+mydfpQXFz0WnI4DoYv66gH2O6XD6RGHueZ
         0C9XdfRVkyNQz9xampnv05IA+TCIpNt9u/j1rCVIsGke19OGAxBMaMq0Fc1K0d91oyeW
         6rDbM6W1P1fyibBviaNbNA9U37pT8kO2mu0P5kP9ucEmXSv++eKbpQA6XZf7Lqu07u/A
         iBjeexFt90+1ZVuUNmlBatjuoB2JPY4/DDh4T977g9eoALGxryZAq/0d1Yf6Ji1hO0Ie
         hEyw==
X-Forwarded-Encrypted: i=1; AKwUvBzOyeGpf5OmvRJs7fyrsIQqFcZoYqF3nhIwZB8mT4+cX2Q6iC6LxDkfeZrJj0pv3nDRTrJACZ7Z@lists.ozlabs.org
X-Gm-Message-State: AFq9FYI1Kkzx9Nfaht84fcHMmn8SFm22Py9dWoJJDSQQqOkwQ3B06r1g
	CfVTgdzdWsYBS2SM7ceHwh5BRPbUIOem8MyoqbEyNhCOoiGsreuZIynbeASs0H1AtFWmlbp6yeR
	sXHry4POYOUb5z4HmK9cr6wY29o+oFpk=
X-Gm-Gg: AYBFou2aAu62w5wx2LqXRuaq35EpRvVylxBmTsxvJjDNN5wHAzvwr2+ls1fFNLVgw6M
	FFIScDWSbKs8tsqc1sIBJE9nLmrBpal5krvOCH2a5ROefoA3FSXjSm4si85HajQDm1YWbqjdcaF
	Oj2RZoDTeGOeZftBfCbERS9nTtmAFkD9RkpuDuAlHrTMLmAHPa+JVAG4FyOd33ON6Vl4Bo0wxdH
	GJG9kh2OhAJVGzVIxwFn4cg3R5VcqqNVRobBn1wwqw41SoRqt2W5o81sXHu8OODuJuX4zjNv5yZ
	n+cdsHGyybZ7iB0TLPgAz2Bpi0sEKGf4UmmRZ/R3dsW6REtKhJG/YyYlwA==
X-Received: by 2002:a05:690c:1c:b0:8ac:4b34:6082 with SMTP id
 00721157ae682-8ae95af37f7mr32992497b3.73.1791251661017; Mon, 05 Oct 2026
 18:54:21 -0700 (PDT)
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
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
In-Reply-To: <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 6 Oct 2026 07:24:10 +0530
X-Gm-Features: AclHuK-Bp0TStH-ztm8tO-ezZOGxNIzT501802shaVBj9EoaYz799U7UGfa0dyU
Message-ID: <CAMFFDGgv0+sUL4V4itKw3pezB4MccYr1rGwrS6F0qwD=0HLB0A@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the guidance. I continued with a private B650D4U experiment.
The experiment now reproduces the exact vendor sequence:
SCU4BC idle:                        0x0e000000
SCU4BC transition:               0x02000000
GPIO123 pulse SCU action: cleared
SCU4BC restored:                0x0e000000
On real hardware, OpenBMC now successfully performs:
- Host power-on through DBus.
- Power-good assertion.
- Graceful host power-off through DBus.
- Power-good deassertion.
The private implementation is intentionally B650D4U-specific and is
not proposed for upstream as-is.
Given that THRU1 and GPIO123 are mutually exclusive, what upstream
subsystem should own this temporary transition? Should the
power-control consumer coordinate GPIO and pinctrl states, or is an
Aspeed pinctrl extension preferred?
I would appreciate guidance before preparing a generic implementation.

On Mon, Oct 5, 2026 at 8:33=E2=80=AFPM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:
>
> Since THRU1 claims both pins and is mutually exclusive with GPIO
> control, should the power-control consumer acquire GPIO122/123
> normally and select a temporary pinctrl state that disables THRU1
> before driving GPIO123, then restore THRU1 afterward?
>
> On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:
> >
> > Hi Prasanth,
> >
> > On the AST2600, the THRU1 pass-through and the GPIO123 output share
> > the same path and are mutually exclusive, they cannot be active at
> > the same time, so having the pass-through pair also controllable
> > through gpiolib isn't achievable in hardware. This matches both your
> > observations.
> >
> > Could you help us understand the use case? If the pass-through
> > already handles the host power path, why is switching to GPIO control
> > needed at all =E2=80=94 rather than simply keeping THRU1 enabled throug=
hout?
> >
> > Thanks

