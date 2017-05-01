Return-Path: <xow@google.com>
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGtXs5vnDzDq5W
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 04:41:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KyYMfzFZ"; 
 dkim-atps=neutral
Received: by mail-qt0-x236.google.com with SMTP id g60so95493441qtd.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vzHhmB+rqx0F9VmjztPXZrGpU+XuXsUK2Hq6d22ITBw=;
 b=KyYMfzFZFcX9YckGDyPfo1lEcJPjDKUfIo+2tFcYWTchl6kQdhADj6dFv42wiZB5Xc
 CqrCX4Jr17wcjVdk1mQzN7YhpWYwr5ukGKOtwopLIt9+xyyZEsoDhP4rpe+20H2l6WCx
 pmqLjImqIVPPSoxd4dQxwxWSJljmGU0jC489tmvKauwG1LfjjL84bIE4l1bpfZqM2uuX
 qdsLFEZX/9sTKHyRwKux5eKkMwlBC3QQNAzdy9+Z5taps5t1BUuNwCGgCvlK3uICF/W4
 cOWj0nsJrXkRlx6Va8Vg92PGz91QirDgviCCwji7oxuUR7FG0C4o/dkNy6PrZ2ZTJrt7
 7O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vzHhmB+rqx0F9VmjztPXZrGpU+XuXsUK2Hq6d22ITBw=;
 b=V+4TvdF2orBZxFiAxpBy3tcFwgVkcmKCvV+/jGuAu+XO8ShMwqPrYLSmMegVfDUnXL
 v/vCgk4DbAS0mTcMFRhQxyAskKi7TMT3/FIwbM8dKk7U3h7t53YxecSpUp3LjizZ9gja
 TmlodtIqzAYgSqprEQgpnckgsAGb6Xl50t4+sJxtyEExQhu5fFdZEqIfqUYQrR4jo2Wb
 097gGvvqMaWOwIYWsZ3hKQm1Mf1Wk8Nu7ZmEbuvAte28PyznGPADuVR4tYO9jhPdqFjt
 Nh9bcx8jUykNcJR9FHWVRhsSrCnQY7QMKX9LnNGBUa6ddE5tqSCWHp4kiL4rekSTEMxq
 kntw==
X-Gm-Message-State: AN3rC/5izgrynL08mx/hq5W/AAR6TpbV5JP71pXVRWIyRJD2nexuli0u
 Q3AHfIlTHnjl7tKpaTZQIE72taTUzNOG
X-Received: by 10.200.44.205 with SMTP id 13mr22081670qtx.108.1493664059050;
 Mon, 01 May 2017 11:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Mon, 1 May 2017 11:40:58 -0700 (PDT)
In-Reply-To: <1493463462.232472.960218944.25DF2EF7@webmail.messagingengine.com>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-12-andrew@aj.id.au>
 <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
 <1493463462.232472.960218944.25DF2EF7@webmail.messagingengine.com>
From: Xo Wang <xow@google.com>
Date: Mon, 1 May 2017 11:40:58 -0700
Message-ID: <CAPH-5w4+MEL8EoQdKa-cws4BxyjVfh7-pMdeycfAAHH54YgexQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 11/11] aspeed: zaius: Disable GPIO bias
 via devicetree pinconf requests
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 18:41:03 -0000

On Sat, Apr 29, 2017 at 3:57 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> On Sat, Apr 29, 2017, at 06:03, Xo Wang wrote:
>> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 16 ++++++++++++----
>> >  arch/arm/mach-aspeed/aspeed.c              |  4 ----
>> >  2 files changed, 12 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> > index acf7cc8d0e6d..b5c4c0fb2986 100644
>> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> > @@ -333,7 +333,19 @@
>> >          */
>> >  };
>> >
>> > +&pinctrl {
>> > +       aspeed,external-nodes = <&gfx &lhc>;
>> > +
>> > +       pinctrl_gpioh_unbiased: gpioi_unbiased {
>> > +               pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";
>>
>> Out of curiosity, do you need to specify all eight pins affected by
>> the "unbiased" register bit, or only the ones that you need for some
>> functionality? In this case, only the first four pins are required for
>> the 1-wire interfaces, but the whole port's pull-downs are controlled
>> by one bit.
>
> Yeah it's somewhat arbitrary. Any of these options will work. A downside
> to specifying multiple pins is redundant writes (though they happen
> once, at boot). The downside of specifying one pin is a broken
> abstraction. Maybe your suggestion is best, that we only specify the
> pins Zaius needs to configure, even if the result is all of bank H has
> the bias disabled. Should I send a v3?

I don't have a preference as to the current patch or to specify only
the four used pins. This has its own advantage, that it explicitly
spells out (to the reader) all the pins affected by the bit change.

>
> Andrew

cheers
xo
