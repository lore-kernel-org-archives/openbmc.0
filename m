Return-Path: <openbmc+bounces-1950-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F72CD4F4A
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 13:50:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJzj24qqyz2y7Y;
	Mon, 18 May 2026 23:50:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779112246;
	cv=pass; b=Nndt4Rl8SEhq4wjzfKVwz+hDPCkle0WXJsAlgjD3mHR2fhTTRdT0X2oEHrmtiawO2XQ/g/T4++AAVjeS5iYfSqhC2A89Ofze94GtYZ0X4gL8YKQI/iK8avpkr6YAIrcTEU7LCOXU0aQNHPiNsyRywLxC4Rk39OkS8M6Zx0DKw/t6CFFTiAhmYC7t5I6uCN+fCpe9qaUa6fhX2EgWa0utoSvyvbYBFkAvIREJt+OC1q8nifQzTYK508HmWSuiBNTraL+x/AP2x4kZV6LmmjHU1O8P9ODAXIPzBkRNj5SlPtY6GWwaT1fbBVQsvTYmR5YsesrZZvJZgIrEDX6lMQlP8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779112246; c=relaxed/relaxed;
	bh=j2tV2Hx9o1y2qmj0Z+MC7Nph7HK69hC1O+UJacqW0zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W85M5b8OUov7KaWjFLqv4pSKvsrxB6zIXzAK/djIFiAvNrPOAx2TheaKfGWTHf9jt0rtwH7ZLhnr/7DtgGlV+iPhZ5UJVpboBvvwJenzPoVNmY5Cq4u1u+kvgC5s8AqOs986HC3hfPhktytpuYW5Br+efi1zrJjI8ZsS2/5VSgoy9SC1TrSElWDpZsyczrNtn9Pr9kAivArAoLngkwtYte0ql8SZ8BLxbMTmT3si6NyeYTmiHYM59lFVNYhtbK3VLrd84XuoA810yB3sy4nKhWVSUKTmS2+0kxOz6CdrxXT0BG5FUCUCWw8+9bmS19uS6rkQQWaBTMh5Vux7TtY8Aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F4zpd7Yi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122d; helo=mail-dl1-x122d.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F4zpd7Yi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122d; helo=mail-dl1-x122d.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122d.google.com (mail-dl1-x122d.google.com [IPv6:2607:f8b0:4864:20::122d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJzj073DWz2xRw
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 23:50:43 +1000 (AEST)
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-133466cf955so9087105c88.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 06:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779112241; cv=none;
        d=google.com; s=arc-20240605;
        b=Zgp4C2aUEYhw5yQ95qcVEZL3yEoZ5872CHggwktpY+ULG3ExnsnxWw8pobufsZYRsp
         SnMB5hG6PD6HizflEFLwPR2C/0IoblxDKQLMvNDSRyV0l5ng6XIA0h9cfwmcZ3CtlJml
         WR/ezWCc1VhZ49OA4tm2shu+U8VSc5/1rainlcQNql2ItN3UU8Omf7jXhAyvaPqJBYyn
         kNBOvD3VDCgxgkDcO0fgt/3kZL3+V//DNa+ZlKe5PLPozAqEQB3N8gSjtfFbsyaLn8Tt
         mJBVBjVHkimj78KmrkXz8+EcDnp8pkjjYCIJDmvWAGEWhd9HY0k3/EysSG+ZYRGVvk+X
         z54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j2tV2Hx9o1y2qmj0Z+MC7Nph7HK69hC1O+UJacqW0zk=;
        fh=Wx3bTxSv98apH/AOASrdddJ/7JFbqwwdiNvIO0VKDFE=;
        b=kh9pFzEuqIwtuOXp7x7aEnjmtiZS8+J9PSYewbfUeckcbixgPo2eHTUA/Hu8V9RhVj
         Z+78dD2dv17+2CLeZca4hW972FBsyHKSC5bRvrVeNN78bDzZoP6zMxmNu/+JDINIdKAs
         wkCZLjMWBWmMvscS/sfdKzZovLzedug32MV7UPGApoKXj3KP24rw/dVGq3HsR4japRIX
         VxLsRRRF1tKCHsHhNfkFH2VZCVyU35gJAfwGPcV4kXbBS8yngb9yf93m6YNdSzN99dmv
         YIszw8gNpefWofQ1TJ0JvCzn3qlkPiUPyGc2s1A9qExilucN10NybySojf4AgVuaJ7iT
         MH7A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779112241; x=1779717041; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2tV2Hx9o1y2qmj0Z+MC7Nph7HK69hC1O+UJacqW0zk=;
        b=F4zpd7Yi8WYtE1Qvr5VgeI+alpzfPMeVJoqhuY7hEi3/QchHKXRzs9hdG/6SboBhUn
         FgW55lkB1qBa6qIHO+m0Wsx6me3eDK96KuBQ8amoW8ypmfmmfRtTKhvECCSADTqSHOKA
         1TpHUvUW1g6Fu2s4vDGNf/TxrfiuVy1hPlPGN1VdukgLL2eifkrFnaMTfnle+BjpjNZC
         CprpMTfr3MREJrWj6H2ZObSMbXp5IFpAdXSsu0HqWzQ3ooTwj4cCZJ0ECkusuekw1tPy
         ctNxk1BDVJjj+7jzeQs+K4uwjbA08xDwV9RSYWwNVcMBuS0FckrUXcCLROlHb9G+MYt5
         TIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112241; x=1779717041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2tV2Hx9o1y2qmj0Z+MC7Nph7HK69hC1O+UJacqW0zk=;
        b=SdtREtAR0ccWcyrsvZ6zCwwtmk34ACmbGL9n3130f6JixUmjn+sQCXQjLOJw2l7CgF
         d51Rbi20qdC7AoUIVmJHqqXXa+szMut3Q5qVIffxrWwGkmLFdeX01K7IJiTfMOSl3eE5
         022vPj6SuFiWE39J0s5gWqLeUsLOku5JXeOauu/O5Lg2QvU3ZcLcpjxywwf0+AvEqynN
         wmF6gA/WQb8fL3EQmBjaLQXwEXwXwg2LUBAc2WDEynrvFSyBRzQeFsZWOQ7rQlzjzRKo
         8GOwbjbfGJIGP7dVhSWSZvXbQ0+alWsq8wdwP/l6GLjjrcZ1zOdXIpCyo3Bof4FKPAQn
         lH+w==
X-Forwarded-Encrypted: i=1; AFNElJ/XWIXcinZ/3IkQEPAY2k46duK5iIRrJnzAxDEerKS7XlInLAmpfzZ6vR4SJgJyfa24IzNS0CVe@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdOkofVt3Wk2MH0sW8UdVhNIRGneJuePFFQJoWdIPcvujCOR99
	xJ/uJvzVgTlIJQCncMxzcLAFFX73fyJxkLuFee4aSVkX5W5XmW4mitX4tO9/kidpzTQ3xcL0bNN
	9H1SdC/Fj+JUkBAWLJl8jJ0D+9Xpb29VmLu71
X-Gm-Gg: Acq92OHqlnWM6dST4mhfNW5upqCKdHOqUCw8F31nzHNaLVp2QIvyxc5/N9CDUV5Qc7B
	1UKAHmPoZaRC31xHYy52aSqgL+BFpoO3TAPK3C5Du+yqMB8kcxZb8tN9XIu6cqtW9HXOCJws3P9
	zXqVY79iUYIddBXPmYBuFguN2dvENihC53ve2V0IcIvQ2QKttNb7GIapzcL9i72CqMiOCQAQ4Pn
	zLghrAM4QUtuTh719+HusEdxntU+BeIJxPy9cV1j0L/a/URd9y15MQjDQMupliBCfijNIu5iS5l
	VrCK1WDosyvTpDc/SJl5IvIoA5VLMVSQt8R7Jf1/
X-Received: by 2002:a05:7022:eaca:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-1350483f0efmr7645897c88.19.1779112240927; Mon, 18 May 2026
 06:50:40 -0700 (PDT)
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
References: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com> <943cfc3799373dffe67d5624af5fe10432150857.camel@codeconstruct.com.au>
In-Reply-To: <943cfc3799373dffe67d5624af5fe10432150857.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 18 May 2026 08:50:29 -0500
X-Gm-Features: AVHnY4JuKIPZb66_dVUUE6w27jZXrDdyVjUeb6KKuCXCj8i8skzezOxMrSf4i18
Message-ID: <CAJ13v3QJ-sDBp_sUJ8ywk0QD7eADSq55SyGposb1_F=dmQQHOQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, May 18, 2026 at 7:59=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Anirudh,
>
> Sorry for the delay :(
>
> On Sat, 2026-03-28 at 14:14 -0500, Anirudh Srinivasan wrote:
> > Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.
> >
> > This version of the DTS doesn't support networking due to u-boot insert=
ing
> > mac delays (when it isn't really needed) and needing to misconfigure th=
e
> > phy-mode in linux due to it. See discussion here [1] for more details.
> >
> > Networking can be enabled in this manner currently.
> >
> > aliases {
> >         eth0 =3D &mac2;
> > };
> >
> > &mac2 {
> >       status =3D "okay";
> >       phy-mode =3D "rgmii-id";
> >       phy-handle =3D <&ethphy2>;
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> > };
> >
> > &mdio {
> >        status =3D "okay";
> >        pinctrl-names =3D "default";
> >        pinctrl-0 =3D <&pinctrl_mdio3_default>;
> >        #address-cells =3D <1>;
> >        #size-cells =3D <0>;
> >
> >        ethphy2: ethernet-phy@2 {
> >                reg =3D <0>;
> >        };
> > };
> >
> > &scu {
> >        mac2-clk-delay =3D <0 0
> >                          0 0
> >                          0 0>;
> > };
>
> So something I didn't appreciate in our previous discussion was that
> this was a property on the SCU node (I should have looked then).
> Checking the implementation, it seems to me like this is the same as
> not specifying the property. That corroborates Ender's efforts here:
>
> https://lore.kernel.org/all/20260505050541.3031447-2-andhsieh@nvidia.com/
>
> I think we just drop the property and add in the mac nodes, and remove
> this note from the commit message?
>
> Possibly some confusion comes from the EVB DTS specifying the property,
> and everyone just copied it, then wondered why it was all broken.

I think that the u-boot implementation [1] uses a default value for
the clk delay if it doesn't find a clk-delay node in the DT. My
testing also seemed to suggest this, i.e if I dropped the clk-delay
node node, networking wasn't working. We need a zero clk delay, and
the default isn't zero.

Am I correct? I can try testing again when I get some time later on in the =
week.

I looked through Ender's efforts and it seems surprising that it works
for their board. Maybe the board design is different in some manner
there?

>
> Andrew


[1] https://github.com/openbmc/u-boot/blob/17ae8f018476af91f9c80da8e9ec9ef2=
18e0b6de/drivers/clk/aspeed/clk_ast2600.c#L980
--=20
Regards
Anirudh Srinivasan

