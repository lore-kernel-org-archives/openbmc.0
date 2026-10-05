Return-Path: <openbmc+bounces-2727-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E727CA5FF0
	for <openbmc@archiver.kernel.org>; Mon,  5 Oct 2026 15:03:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hz2hb3jqtz2yjw;
	Tue, 06 Oct 2026 02:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:41::c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791212623;
	cv=pass; b=a0Er06PVO/0bn6lvFvwIPtnWDKl+cekBdE+NSYPsyne+VrFpFdtw2WoL3t5fFuQhati186xUMIRMwkn9a2yLBGyq+EpLhrZPx9mQ6Vfn1Wy//HsKtQMQx2v8Upja7SUE9K21zbuBxONRROiwbLuwMLS9FwT908vp5c/fvjWTJqxdPQgLJWP93GpHiz3I2jVYvXouB2WfYe04kRELhaTAvx4JzFcLoLcEZ016eR56Sd0EhC9gg99w8Lw9Ak1pRXOVuf4/M5I16Ky/SnrvMkhg8GSDgnQwyVBA0nA7VLYjoojvW+m7urTpqvNRb+fatFtYiAy5ypTqFGRPZzR38iMF/g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791212623; c=relaxed/relaxed;
	bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYKD5S2b84Va7kr6AvAemyInijat3RtV8Rc6yTL59OBQezyBucXoxP5T2Ziu59nmE34No47e6CbVQhZtngLYPZSJ1L+jhZ/S0cpeVUha8fhGrSO7rLIbW5boNTPL48UlNwiCVVwVcWiqHHHqycB7G2wSiGE+864CQITDQtSRkEiyJ0igaMnewGdbu7vYlCBL0T19OT+WvWnhnncGrAK8/B4BFdcZg2diUVYIyONXlHCkPH7ywH3y0sAtudGUVjB8+JGSTstNng/nyQWJcWiIj3JLhgim5Tr6cZZ0J5h/s2Ycr/ZFUkaDniNUb03draZq2+wQ7XE+CvpHI39wrdJQqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lUGY27je; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:41::c; helo=mail-yx2-x0c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lUGY27je;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:41::c; helo=mail-yx2-x0c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx2-x0c.google.com (mail-yx2-x0c.google.com [IPv6:2607:f8b0:4864:41::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hz2hZ1Pdhz2yTP
	for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 02:03:41 +1100 (AEDT)
Received: by mail-yx2-x0c.google.com with SMTP id 00721157ae682-8ab46253999so17841757b3.2
        for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 08:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212618; cv=none;
        d=google.com; s=arc-20260327;
        b=a8W8o3JCVOhSwBjMWU9RWXYQw04RHGeI9iSzAWTplUfuBKf8uEWeGku8XLzAvAXOkP
         AHy79vQ9AyWmNebclO+ThKgO6A/lN3U7gxLKRn6CHnZaulX217ePDyEfFNB0dYYGNjZH
         wmA3rOxDUhlG/QR4DyBUbUDiC5qOzSHgqVeYvlpvv5oN2rW4YJNfgT5dx3eEsX027Gah
         nbaXw4/SIhdKTf9WvvQ13Y3NIJ+E7xQ7Pc3huDfj46ZhhX8s7Zozys6BJkFogixkW1FS
         0QfsxC49shP0TLYNS+kvXMIkEpCqRZiwKYp8IHMH2vRiDqWYKLKEl6b0xcgsPI29pgXE
         cLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        fh=4ft8D3OBQo4gZ+s5hdLue7ejJ1oQgj2fr2V0vIADM8w=;
        b=sD+77m1S9vm0PBwmbX8/23GDS0xxGelq9ooHgDWCRSGpWhEyd3+54H8/3vt4Hw7qQd
         Gxj+ybWlee28h4ITLfi9KMa+xVG1G7yZQvp+yv8e3ca8cJcP1AlsFZTOhEw+nsGWTF4m
         4IgA8D8EkEfY4dL7IhABi/o5hZROs8VzgmhP8Dmww76s+W0qbGmaVxk5RJRtG6ak1WgV
         PFdiLrSV3EYAYW3HINUoL9s0ENwWbPhGAbmznDFnqQ5p4sDxdT+tjtiVJwB/3N/O2nkv
         jZj91+0q+PgXORQznfr80d6htsl8elOlMjL+YPdxC3zLUnlRQUUjrScyrgjLO2H3GuWX
         gjjg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791212618; x=1791817418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        b=lUGY27jefzg+2l9SxqLAR0ZDXcWZ30jq9GiQCjxip788p8ZxKRCadSPWnzwYd4c5U9
         ubmonQ6/SaRj0s5PWwYTrOJ9sIsHNQ0rEgEllZ+xcXoPFYHC2oGXRy+bl9v0U7wUhBc+
         i3nwRi8pZtA/iH6s3PyEZ4dns/+su/JiDpSI91dAmjYoFIcdLNuc96obthGKd2lLB5qo
         UMZaYVVJPR7wCtXWnXvSzI9RTN48GjZOS4SMaMHhvZFC2xtQdoPvoBW6HHgEPqEDKTWS
         SLGEFklZZ+4HaaaSLRnlz9Z8QH97+27mqi/9sypKWRGmHSVfJ0pl2niq153jOCsmZ9OI
         zPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212618; x=1791817418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        b=QFyAuSXQZPpuBjP2bSxON3l6sLNWb1tl/w4vLBc53amnOtadtAKsr0SYtH3+775NM0
         tUL3Nw/2jImrG4wwL/NpHFlGRq3rUn+Q6TjVGuSle3Ipbxn3iKyO7pxiah4Tkn2JDuXo
         7hIXq0IxGbsIyxD7DTPjRGVdQFGqO5osK26PABYk1QrU0I+C/QpbfJlF5medtK3HVOJw
         TTtZsvscYbajVKweVYv6YdKLONbwgFtRvT4Z79JdF64+mk7uv3A8P5Cy5i2Wo2i7PovF
         iJoSVJORRv3+tLoauwGafbECasHi9XZXGLFVO9Z+lX4lnzeyxxxIiVmPQbynQlw6+w6z
         TTNA==
X-Forwarded-Encrypted: i=1; AKwUvBwj3sn/hkgQ4C/pxYpU6TEyX0IABbeO4AgYIdMiD7ZM/ekj+HI7CvIUMxwSi/K7Qrbz00KZZl0A@lists.ozlabs.org
X-Gm-Message-State: AFq9FYJVaLO00gI6v68d0kXYucH0vnV7lFfKgrTlkSHdUgk5zGx4+mEa
	KYG0Xvg0wXEv1IC2oavVjt4QKN6dptg7tD1DR/ujIOPcXQm2w64hvIEin44JO8Vwnj6B7wnKNVN
	dFvBO7IHHLqW+iBU0Ci83MGEPJ5jqi88=
X-Gm-Gg: AYBFou2mCh/zUtPHr1SxNrhwHEH8874pIvAs+P4w5WBNZ2VVS52Ws0cG1qn1mTBQimW
	FxULWDpXQ/NyE7gFFwM1lf1/Le7nYqJQjM/cleuPhD7skG4fQQ7wdmZH20O1pvcRPmEJNYXyhqZ
	eF5ujzaiZlsK9Kt8/EO+mLdCCRs31eHiAxMJh9St4z2yopRn09yNX8fMeqCwoHbTZswWL8ZV1nD
	6oONRg7mYvVP/LvfdO4TeKokNgo6zTIfPxf8/LgTeOmoiQ5HK8u8W0nQkwkisZfDikE8Ekkt3NB
	RB+EIGS9jJEZR4+m5kj3h5WXmcizjb3FQTycNrlDWagxdWo8LL9cMvYI+w==
X-Received: by 2002:a05:690c:9988:b0:81f:64e8:cac5 with SMTP id
 00721157ae682-8ae3690bfd6mr39572787b3.7.1791212618431; Mon, 05 Oct 2026
 08:03:38 -0700 (PDT)
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
In-Reply-To: <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 5 Oct 2026 20:33:26 +0530
X-Gm-Features: AclHuK_6E3giw7DMVtI3NjFHjcW3o3GAmqzSvLwH6NZdDb9tYMvxI8L2SsjXb4U
Message-ID: <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since THRU1 claims both pins and is mutually exclusive with GPIO
control, should the power-control consumer acquire GPIO122/123
normally and select a temporary pinctrl state that disables THRU1
before driving GPIO123, then restore THRU1 afterward?

On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Hi Prasanth,
>
> On the AST2600, the THRU1 pass-through and the GPIO123 output share
> the same path and are mutually exclusive, they cannot be active at
> the same time, so having the pass-through pair also controllable
> through gpiolib isn't achievable in hardware. This matches both your
> observations.
>
> Could you help us understand the use case? If the pass-through
> already handles the host power path, why is switching to GPIO control
> needed at all =E2=80=94 rather than simply keeping THRU1 enabled througho=
ut?
>
> Thanks

