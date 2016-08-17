Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDfKG65XzzDr4y
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 16:22:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jpcwad42; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 109so8189597uat.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 23:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=BVp71FDX9fWW2L9nKcA+5V4PXYz26xGw4o7HCXZxLzU=;
 b=jpcwad42RwpNEQGkfDBA4Re1ONAS1CiDLi03y9vUFnaS/8pIGzALPEK57kEGEsxt3z
 9yChJyEyG74oLXDqrko2d+n4TrxdYffNbHEmj+FJPoubDwq0RxknorfG0O28241KEPG5
 965fKU+OIG7e0mOdwKPIdo4eCDPx8GLlseCclRA7qkXr9h7n2iGhsyC9RmTn6Yvs9dwZ
 vYHhf+KzjzwBKbsZ77KzqpKJSpopugoTqS148OWgFhSM+XUocoKwgn8vBcoyC/Qh3Q8X
 zWCVy4V+3fEhzlCz441W7MQCa5XxhROEsICd4zzeh40KDpyAwuBm2LLkIRbLa497Jgup
 f4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=BVp71FDX9fWW2L9nKcA+5V4PXYz26xGw4o7HCXZxLzU=;
 b=USz1m4MjyuJfRJ+7MQc2FahEkYgaUNpb6/tKndj5v4wbnz7Du8RmpJVs6ThJrSvSkT
 sRfDW3OrCC0UY8z6qr0CPt+AjFV9wKlFp/HokEx93qPg+kmK35mYU9YdHc0tyQ6yboDG
 BUi42Rir0SlwslRbMj/BlalmH+TOxp2Am+XWH4T5Pv20w854qHH78tqLquX1owSat1en
 JWu4WyxADV2TajqPasY6bRSjbYLu2ff3KEvPxwbZhT6Rbe1jT+29/nNlk4H98ijEB9Ew
 TatqEIOOJKBbXQUIq0PRA9Qo2XjVDi+UdUKRrxxAYOoxSq6J+gCvErV6o5PhF0s7UR2u
 jbNw==
X-Gm-Message-State: AEkoousa15tLeOxcxOJ0GwJST+osktZkwNa8YXBqFXppPisWEdyDA4CkFAR8WvIgEuO1Na3//horqIybcIi6Dw==
X-Received: by 10.31.134.20 with SMTP id i20mr2289001vkd.21.1471414944626;
 Tue, 16 Aug 2016 23:22:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 16 Aug 2016 23:22:04 -0700 (PDT)
In-Reply-To: <AM5PR0501MB209735B93C5DDB37EAD5FB43A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
 <CACPK8XeYAMWCZpQ+TrZuwxuxfCzzCCkoq5wCdk8HuPyhFVzBBw@mail.gmail.com>
 <AM5PR0501MB2097FD63488A7D938298B753A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CACPK8XfWdp=8tGE9UFJTR_6aWK=tUonpZtNtwVhBhH6L-FSgBw@mail.gmail.com>
 <AM5PR0501MB209735B93C5DDB37EAD5FB43A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2016 15:52:04 +0930
X-Google-Sender-Auth: sCigI8WxIY7XS_5hmeM3AvOukJg
Message-ID: <CACPK8XfU86SALm0wndbak7c=_Ks05isSE0cJd6-eH1C+0GwT4A@mail.gmail.com>
Subject: Re: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jiri Pirko <jiri@mellanox.com>,
 Michael Shych <michaelsh@mellanox.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 06:22:27 -0000

On Wed, Aug 17, 2016 at 3:36 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
>> > By the way, I see that in 4.7 upstream you already added some minimal stuff
>> for Aspeed SoC.
>> > Do you have some plan regarding upstream other stuff to kernel?
>>
>> Yes. I intend to merge all of the drivers upstream.
>>
>> > When you think it could happen?
>>
>> We have watchdog and irq controller in 4.8.
>>
>> 4.9 will have clocksource, gpio and pinmux.
>>
>> Brendan is working on i2c which I hope will be ready in time for inclusion in 4.9.
>>
>> We also have bt, clock, mtd and vuart drivers that need review and submission. I
>> hope to get as many as possible into 4.9.
>>
>> > And are you going to submit upstream all Aspeed files together or you are
>> planning to do it in some particular order?
>>
>> As each of the drivers are going to different maintainers, they do not have any
>> dependency on each other. They can go up when they are ready.
>>
>
> Great,
> Thank you very much for your detailed answers.
> I'll re-work the patches according to your comment and re-submit them.
>
> As I understand you don't need peci, jtag, pwm, usb at the moment.
> Could we submit these module for upstream review after your approval by ourselves?

Yeah, I think that would work best.

> What about RTC and SPI stuff?

The SPI driver (I called it a MTD driver, another name is a spi-nor
driver) is being worked on by Milton. I hope he is able to send it
upstream for 4.9.

I forgot about the rtc driver. I wrote that over a year ago; it can go
upstream in 4.9 as well.

Cheers,

Joel
