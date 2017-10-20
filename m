Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="BsBi9FsN"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHps0ZDjzDqJ7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 18:43:32 +1100 (AEDT)
Received: by mail-it0-x243.google.com with SMTP id n195so12347727itg.1
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c/JGLS12evEKzo0SydRFmEgvxDhRUPM53OPSYS/23oc=;
 b=BsBi9FsNjt73PDrpk3IkZfIIqDQN21dAqEwVs7UN4QseaN9wAgeL0li8FZmiYT72VJ
 FKvIyttm6ZzRC1RWrLtBiwP2OKkmDAkJUy2ZzYY0T2kDto8BtoC7zunpRrtbFg5JKn5c
 BmFV00cpX9kYe4cVePaknlNoYJnB4dIrUQpfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c/JGLS12evEKzo0SydRFmEgvxDhRUPM53OPSYS/23oc=;
 b=Jfe5NJQrBfLTq35DDREMDcw9eQq4o9cALkiC0HXgicDu6jklcU0Q2CV+x1HJ9930R8
 01fCTMgn4OvxGZTUENPe6sRqyvZB+Nt2pN4OesQUQ6X6JcJqh3QsTdoo1MWp9sq2SA3W
 ikZcplXaBHn3Mh0A8kbmb/fnL1O/ypPDRM8ieBC7xG6jSDSAmlXl5SDTSQPG376Ex6IM
 uxDkpQ8nQ0Oz2q6HvKRzworuc/GahTO2KjvAOIoZ2Bs7jpap31PMOKAYIePW3b/tFz3I
 7V1T/FMmSNXhSRB1EnUTKBwYa9tQfwpnCm4ryLYKqJfznHwsRrHABWhoU7DKoqIGCrcw
 SF+g==
X-Gm-Message-State: AMCzsaVIDxfyW2YBlE93pwgoiDOEHB62noKxfW8a6spILh1QIaMGrHnk
 VzktEk9wEzX63XQfsjykuyikzuw8Oc8BlUZoO/xARA==
X-Google-Smtp-Source: ABhQp+Sq99ID28XaOlRphdx7PYsGjEFLeDChMuGZbOxWwbNuOunaCa0KPcGU98MjYKteNc3bUXJEss7dHLk2o60yUs8=
X-Received: by 10.36.29.208 with SMTP id 199mr1402709itj.40.1508485410213;
 Fri, 20 Oct 2017 00:43:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Fri, 20 Oct 2017 00:43:29 -0700 (PDT)
In-Reply-To: <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-2-andrew@aj.id.au>
 <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2017 09:43:29 +0200
Message-ID: <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
To: Andrew Jeffery <andrew@aj.id.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 Michael Welling <mwelling@emacinc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 07:43:33 -0000

On Fri, Oct 20, 2017 at 9:17 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>> GPIO state reset tolerance is implemented in gpiolib through the
>> addition of a new pinconf parameter. With that, some renaming of helpers
>> is done to clarify the scope of the already existing
>> gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
>> means on suspend, reset or both.
>
> Isn't it most reasonable to say persistance covers both cases, reset
> and/or sleep? This seems a bit like overdefined.

I should also add: right now persistance is defined in negative terms,
you can supply the flag "may lose value", which means the subsystem
by default, and driver by default, will try to keep values persistent across
sleep.

Then it is possible to opt in for not doing so. (Usually to save power I
think.)

I think that especially for userspace use cases, saving power should
not really be the concern, but correct me if I'm wrong. I am thinking
of a box with a DC plug wired up to a factory line here.

What we have in the Arizona driver is an opt-in where the DT can
say "don't preserve the value  this line during system sleep" i.e. "lay lose
value" and we can extend that flag to mean "don't preserve this line
during reset either" but by default assume that we should.

Yours,
Linus Walleij
