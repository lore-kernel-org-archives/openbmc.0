Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="TOtT/47O"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ydhn42czzDqR6
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 19:08:41 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id u21so1549572lfu.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxXwznqUP9TmNNlIeZ2S/QX+2H+5vNVNuMAI7j0s1Ww=;
 b=TOtT/47OQPdHTTXRwdeytfJsQbaxZFlrxZxFnDw0fKjWs9TfYJIGea6VQg8ReeOw1i
 lGqXGbsMfSspSidgf8uFuLm50LOltF2hO6deFih4KGnQTwTHoJQ7Q1NRaEfy2xEsjBY6
 hb2iTSUfahnxryC9cJmOYiGRbQFFA2auIb6Uyitq2MKOMeNpF947JvVDYr0sh7jCB1/D
 lGLHXLNUnS6Q3GdxQZccHQbsi/7mBSWedmvYPBwd/3ZpF5RO51N+eFVY1Ecu8Zy0widc
 aT70em5CXVabVxdTKpF19S7iVDSHrFrcNEEySx2adjXO5HrGejlxwQDDRxT1pljfbEw4
 amZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxXwznqUP9TmNNlIeZ2S/QX+2H+5vNVNuMAI7j0s1Ww=;
 b=f8LEZmUJX+d3E20LXeqADEKMHsQO1in1Q3gz2j/pINGKm8YulEwRxCyVUKD4iq+Zy9
 TIslvkEiLq5REvFuEPg/ElWN0hlf/YofKGwzPeVpJIL0EIuhEZz23ARTf3eAVIkp5NEL
 Fqje7sNJ8Oagca5qNpsN1SacOlsyos9Qm+F59OVkoYlJJbrxqlUHIiGw1u8VSoNGeL8e
 IOk55El7Eg1t8W8siTrpvZoant6j1SQmtux16uLOZHDfIFwaLfRCNwF87hlAm8QcjWnA
 oMirazJVYXMpP6nhILVOkae8V5mgDFEeOFbnM7RQHEM4uAbefjvV16w7p7pS0PHShyW7
 EwlA==
X-Gm-Message-State: AHQUAuYx3AxQ1xA4OrLYKWGP+W8dDhd8d48i/fs/cPLTQzciMrsQrnbQ
 eVA6334cKMEg0RnKz1DoEU2YYtim+Hu3IPsUIer1lA==
X-Google-Smtp-Source: AHgI3IayLlO+RBa9Q42/dlp+AfoSx9B38Dyn4j92Hl7Qj5I0BIT4eQOL/kZrKgHIJA6EburSEKDRGd1VGqnYcn48tOs=
X-Received: by 2002:a19:7dc2:: with SMTP id y185mr21934735lfc.27.1549872517719; 
 Mon, 11 Feb 2019 00:08:37 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
 <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
 <CACRpkda6PZnoF83mYeTDYxqaFYLTp2jn=E6WJe6KptRuYbFLuQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E451F18@shsmsx102.ccr.corp.intel.com>
 <CACRpkdaiLv94-bcE85E5TyRQWG-EXOCUVu0fLpOr++5_Q0Qqfw@mail.gmail.com>
 <1549860867.1161225.1655227592.67A55C10@webmail.messagingengine.com>
In-Reply-To: <1549860867.1161225.1655227592.67A55C10@webmail.messagingengine.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Feb 2019 09:08:25 +0100
Message-ID: <CACRpkdbqGvRXtsTZwhDvd77H3Tpgt5H5YaATyEbyAGKJ-OhBzQ@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "Wang, Kuiying" <kuiying.wang@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery,
 Vernon" <vernon.mauery@intel.com>, 
 "Feist, James" <james.feist@intel.com>, "Yoo,
 Jae Hyun" <jae.hyun.yoo@intel.com>, 
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Khetan,
 Sharad" <sharad.khetan@intel.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 11 Feb 2019 08:08:42 -0000

On Mon, Feb 11, 2019 at 5:54 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 8 Feb 2019, at 22:31, Linus Walleij wrote:

> > > +static int aspeed_gpio_pass_through(struct gpio_chip *chip, unsigned int offset,
> > > +                                   unsigned long usecs)
> > > +{
> > > +       printk("kwin::aspeed_gpio_pass_through is called");
> > > +       return 0;
> > > +}
> >
> > I guess you want to actually implement this too :D
>
> Something to keep in mind is that the ASPEED pinctrl already supports configuring the
> passthrough bits. What we don't want is to cause some inconsistent state between
> the GPIO and pinmux subsystems by just whacking the bits directly.
>
> Looks like we should be able to make it work with PIN_MAP_MUX_GROUP() and using
> some custom name for the state (maybe "passthrough")? It's a half-baked thought
> though so I'm not sure if it's feasible let alone acceptable, but hopefully Linus can
> comment.

Since its a real odd thing this "passthrough" I would certainly prefer if you
could keep it as a custom thing on the pin control side of things. Then I
suppose that you set it up using the device tree and all is fine?

What I'd like to hear from Kwin is a convincing story why Aspeed SoCs
need to do this from userspace, as that seems to be his goal.

Yours,
Linus Walleij
