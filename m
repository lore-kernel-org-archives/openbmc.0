Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1ZrN2XYlzDq7Z
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 13:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rkqt81RK"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id k6so4541677ybk.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Apr 2017 20:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l5FotMJY3oQ2ABxKdvsaWfyd5Z2ei4tPZKyUop8Qmtg=;
 b=rkqt81RK2T8DG0kX/JfsJNITPXWlTIqWjRmD+JCzG0m8LbCn3IqqJtKMySlWVQSW4q
 Sm2nC3ShBKP/v3aTpZwol3pIFH1OdD8uvFIVNfF+MWBv+1zczy5Nd4Q7i2U0eM+SxJrJ
 yeIyp15bGIYSEPTU2Ytmv1UEoHABYKBqUVuFwl//JUA/dKcWTkYzEl0as0DWP9AJc7JY
 h8hYnOY4BiV1VhJRf5aW2d+mL8wjxnlQlspi1pzv3VXSESHBuBqXZEsuUMxiltw+FLMQ
 MlUSTC6qaV49/8UOswo/Dapz6oUJY9/5qNr6aLqvhNTcjgnn69LZUKLR1NnmFSwcp5f+
 xT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l5FotMJY3oQ2ABxKdvsaWfyd5Z2ei4tPZKyUop8Qmtg=;
 b=bB8BclEm1p+IoegYhZnfMxYDQGFxVrPjxXxJO7DfI2MtzwLbpQOzFm+zE15L/L7LYq
 fKkn01ViUuI2cr4tu/Vis273EQW4dtudzdW9NM0D1GBTi+RLi3d2J3V5yY6t5NqRnuR1
 HRZUvqQExMe27Xgm3jNzNcxU+rnf+IhNx5QMQIq515MCeKJzqakSZRurR7Y7A3l1Xnli
 ADWF0mYRIneBxwmaBBCwq2dugln/UOi+FaFbc0WN9qLP24M5Sp4YgaEcb1+AJXvn3T4j
 6Ne/HRwqJnIyP/AwJOmBYFaBZokEg6dUwh2baPFjkDZMZVBU0J++iIdCUZ8JCO7erXYP
 NVeA==
X-Gm-Message-State: AFeK/H2ZaIuQFOIEc+uVgAehxNUWJieyUQU30xMSnLpQNAoBKDHZ7UceAE5k9C8bThOrJKrZtRchccECo4NB8w==
X-Received: by 10.129.71.198 with SMTP id u189mr37103116ywa.174.1491793697430; 
 Sun, 09 Apr 2017 20:08:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.20.87 with HTTP; Sun, 9 Apr 2017 20:07:57 -0700 (PDT)
In-Reply-To: <CAHp75VckYiBccVN+_K+Tm38kcdC10=sekQZg7Uz_HwS4xyW2UA@mail.gmail.com>
References: <20170405040352.5661-1-joel@jms.id.au>
 <20170405040352.5661-3-joel@jms.id.au>
 <CAHp75VckYiBccVN+_K+Tm38kcdC10=sekQZg7Uz_HwS4xyW2UA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Apr 2017 12:37:57 +0930
X-Google-Sender-Auth: VFrmANaBLewtXxTatZ3a2a-iIJc
Message-ID: <CACPK8XfJT-sGuTwDDSxevm50DLzh5qJ3+qa4qiA6f3enC6r_iw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Apr 2017 03:08:21 -0000

On Wed, Apr 5, 2017 at 8:24 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 5, 2017 at 7:03 AM, Joel Stanley <joel@jms.id.au> wrote:
>
>> +       port.port.irq = irq_of_parse_and_map(np, 0);
>
> Isn't better to get this via platform_get_irq() ?

I can't see the benefit.

>
>> +       port.port.irqflags = IRQF_SHARED;
>> +       port.port.iotype = UPIO_MEM;
>
>> +       if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
>
> I would still go with usual pattern.
>
>> +               switch (prop) {
>> +               case 1:
>> +                       port.port.iotype = UPIO_MEM;
>> +                       break;
>> +               case 4:
>
>> +                       port.port.iotype = of_device_is_big_endian(np) ?
>> +                                      UPIO_MEM32BE : UPIO_MEM32;
>
> Hmm... And this one is not in align with IO accessors used in this
> driver. (readx()/writex() are little endian IO accessors).

We only perform readb/writeb, however you raise a good point that
we're assuming LE in the register layout. I will remove checking of this
optional property.

I will send v3 with the other cleanups you mentioned.

Cheers,

Joel

>
>> +                       break;
>> +               default:
>> +                       dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
>> +                                prop);
>> +                       rc = -EINVAL;
>> +                       goto err_clk_disable;
>> +               }
>> +       }
>> +
