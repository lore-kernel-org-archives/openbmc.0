Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D822C433EF
	for <openbmc@archiver.kernel.org>; Wed,  2 Feb 2022 12:13:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpgg73M5tz3bZ0
	for <openbmc@archiver.kernel.org>; Wed,  2 Feb 2022 23:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lPmznDYB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629;
 helo=mail-ej1-x629.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lPmznDYB; dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpgfN2yXvz2xvW
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 23:12:26 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id jx6so65371729ejb.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VjxU+a2631orSbCKcBoAIyvpjxFX1VaObSlXXapMheA=;
 b=lPmznDYBDqGWnpjW6z/4KKkgngH4UAH6UYRkX022/L/VRYMydkxDBdSnZDIIVpoGf6
 vNz8i22QOdNKX3Mzs1fnpOq6ROt/rxeJkAu3Y/HPYwvaQ8QWSOVvDT4FHhFAI5x782Zp
 dIryYRcfkLwb1VvqsoCIM4lQe/ZMTHA7zTHDhUqTeOusTnG7YgnLzu/m5PY3fGOsAjiX
 bQZ/eZzvXqnfAKD8XR8uGhHUOEAmi5glijpCEW83ULTaLnxW/jkfNXCDeyFEnR/km/r3
 FK7aqARULTQCGWlHiW8xrhACbht9PaXysi/N7RHNQ5ZaZzAJHROL9PK8y6up3JF83pi8
 kCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VjxU+a2631orSbCKcBoAIyvpjxFX1VaObSlXXapMheA=;
 b=5VHapxqHmVNJNJ+WM5Wdn+G0RoxqrL9tytBebtG1L83g3mFLAjQVNCNzsIwMZCqkqb
 NbDN25BQiPJo+ub1qnfinDVg9AiSEtCTDWdfqtBlUMkBaRG+lpbNzohXdgU9TE5tnoQV
 ZGHIVVZC/qHJeU+qP8swSbexJ31LvE/nwRSMD3MLsJwCeokhSFPM+GE7xeXpwqJVWJng
 EKU0lekOropOpLWreKzVYUVtxFL3WxQ9t6rRxZHUxk8pAtpwQR1YqZIRQNk60lBtT36t
 nCe6EVXVRZQjFrXFyEH7HehzE5yZ57ZlVMat8WTO2issu5gr7TeJePrljxETRffyIxfl
 VwZA==
X-Gm-Message-State: AOAM5324xVUlt9OVVDEJegJcQM9nPL1WA0szrvVX60UGHzq6aRqiaPVZ
 h6HlNUWSxtqBU7GRBTElKrXz1c6fRy4bIYEbMdk=
X-Google-Smtp-Source: ABdhPJytPcdANFl4Q+b3tRRf1U9ZJ1u1gJh3CsJfOpIUZz3WCczhVwN0LJHBSl+IL87Pl8TNOg02kfBqbBb37NgLhqI=
X-Received: by 2002:a17:906:c14d:: with SMTP id
 dp13mr25287460ejc.132.1643803941259; 
 Wed, 02 Feb 2022 04:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
In-Reply-To: <YfpyjDBH83FE7r4o@latitude>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Feb 2022 14:10:44 +0200
Message-ID: <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@gm=
x.net> wrote:

...

> > I assume you're sending a v6 to fix some of the warnings?
>
> No, the warnings are fairly independent of this patchset, it's just that
> the adjacent pinctrl-npcm7xx driver started to be built by the bot, due
> to my Kconfig change. I'll fix them in a separate patchset.

I guess you need to fix that first.

Because now and then all CIs will complain to your patch and confuse people=
.

--=20
With Best Regards,
Andy Shevchenko
