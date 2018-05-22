Return-Path: <andy.shevchenko@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22b; helo=mail-qt0-x22b.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ei1rj6ju"; 
 dkim-atps=neutral
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40r6VF3N9fzDqnw
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 06:21:09 +1000 (AEST)
Received: by mail-qt0-x22b.google.com with SMTP id e8-v6so25219565qth.0
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0F99He8TphMnyIuMuEtYljvIxgUbjCm1IEBHBBlbo2Y=;
 b=Ei1rj6judLnhxWEqK93pP/dhf1Ie1K8nsfgtgiCz8jNvZPufYSVm3pVCxdbBEcHjsc
 s0rJqy+m+KyKFfLha8t9tlHiYVj1H2awkJbX73Lmo0UvZlMHur4gHwV0016qQ0MW7N6s
 9nhcgro0hw2Cq0VnkJGYiNJJQH9O/cV6sn6lxT5ElhvWLWUoVmoJu88rukJlfeEF+sZx
 pfbFvfVUuwClfTFvz6ZCu70s74T6oCOGqEvUsUSgGbs8Y493/PGq4f/UFbOOJqj+ha4V
 8yW4HCkb0DXlKWcBHUhgSY1G2Z03xbi/zHrhHXRF9blURkofc/QHbXFeOLtMKif3vsMM
 aeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0F99He8TphMnyIuMuEtYljvIxgUbjCm1IEBHBBlbo2Y=;
 b=pcOzQBQ5C8kcImeQ5GgGGshH4VP5YbwFp914BbWTxWdAlq2VWs+X9g63nUnmJukUc3
 +JYj21vhFAJEnN++VjUfwh6Z4B9/Y/KRBO8ph3KDRnSwdtmZVbzFVdHjYeuPY3fUNrAE
 iR8uAAKFV4y6vTnlJV7OJJ3g9/bh2FjtO3QYC3964X1t4ZEDgXl8NvFbSXsWKLU4fWwL
 KXaJBTDN4PMHFkSiNtHvqi5Y7+v45vdwRXM7Yq70cwKEz1flsyrFR7n5NDYpFxMocAu9
 rDzX3HmWTygjN5+suy1J1WpMc9Bl0ph4WK8E61Pj/nfYUpCNYu/oodo6bcjgZDmMq7nu
 7qBg==
X-Gm-Message-State: ALKqPwfAG8g/vu5OYGdOmDqnSJWs522IAxYVKkU0X/4KAnDxuLJImUZl
 D+fzgnw+AbR0tmdwu7/f4CgPDhTqMOw2FYcKsukSiHa2
X-Google-Smtp-Source: AB8JxZqy9+8heJJJxIA1eKkqzbot4V4qt+6YMYyzC4xajLo7Gb4RS+vvdwktd+Urg/xMrh8/Vp9xzb7Q2mIC82bcTew=
X-Received: by 2002:a0c:bd89:: with SMTP id
 n9-v6mr22940544qvg.153.1527020466719; 
 Tue, 22 May 2018 13:21:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9896:0:0:0:0:0 with HTTP; Tue, 22 May 2018 13:21:06
 -0700 (PDT)
In-Reply-To: <AM5PR0501MB244981D83DD33BD29FD64924B1940@AM5PR0501MB2449.eurprd05.prod.outlook.com>
References: <1526394095-5069-1-git-send-email-oleksandrs@mellanox.com>
 <1526394095-5069-3-git-send-email-oleksandrs@mellanox.com>
 <CAHp75Ve7EYiWBiE73i0CmyJhPMOdSKsGzCr0SUvta3Uya=Ov1Q@mail.gmail.com>
 <AM5PR0501MB244981D83DD33BD29FD64924B1940@AM5PR0501MB2449.eurprd05.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 May 2018 23:21:06 +0300
Message-ID: <CAHp75Vedcsbet3L0p0t5-=J0PmSe26VFXDbcRmk9943D9_FSqQ@mail.gmail.com>
Subject: Re: [patch v21 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Vadim Pasternak <vadimp@mellanox.com>, 
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 Rob Herring <robh+dt@kernel.org>, 
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 20:21:10 -0000

On Tue, May 22, 2018 at 6:00 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:


> Ok. Changed to:
> #define ASPEED_JTAG_IOUT_LEN(len) \
>                                (ASPEED_JTAG_CTL_ENG_EN | \
>                                ASPEED_JTAG_CTL_ENG_OUT_EN | \
>                                ASPEED_JTAG_CTL_INST_LEN(len))
>
> #define ASPEED_JTAG_DOUT_LEN(len) \
>                                (ASPEED_JTAG_CTL_ENG_EN | \
>                                ASPEED_JTAG_CTL_ENG_OUT_EN | \
>                                ASPEED_JTAG_CTL_DATA_LEN(len))

What about

#define _JTAG_OUT_ENABLE \
( _ENG_EN | _ENG_OUT_EN)

#define _IOUT_LEN(len) \
 (_ENABLE | _INST_LEN(len))

#define _DOUT_LEN(len) \
...

?

>> > +       apb_frq = clk_get_rate(aspeed_jtag->pclk);
>>
>> > +       div = (apb_frq % freq == 0) ? (apb_frq / freq) - 1 :
>> > + (apb_frq / freq);
>>
>> Isn't it the same as
>>
>> div = (apb_frq - 1) / freq;
>>
>> ?

> Seems it is same. Thanks.

Though be careful if apb_frq == 0.
In either case the hw will be screwed, but differently.

>> > +       if (xfer->direction == JTAG_READ_XFER)
>> > +               tdi = UINT_MAX;
>> > +       else
>> > +               tdi = data[index];
>>
>> > +                       if (xfer->direction == JTAG_READ_XFER)
>> > +                               tdi = UINT_MAX;
>> > +                       else
>> > +                               tdi = data[index];
>>
>> Take your time to think how the above duplication can be avoided.
>>
>
> In both cases data[] is different, so I should check it twice, but I will
> change it to, macro like:
>
> #define ASPEED_JTAG_GET_TDI(direction, data) \
>                               (direction == JTAG_READ_XFER) ? UNIT_MAX : data

Perhaps choose better name for data, b/c in the above you are using data[index].

>> > +               dev_err(aspeed_jtag->dev, "irq status:%x\n",
>> > +                       status);

>> Huh, really?! SPAM.

> I will review and delete redundant debug messages.

Just to be sure you got a point. This is interrupt context. Imagine
what might go wrong.


>> > +       err = jtag_register(jtag);
>>
>> Perhaps we might have devm_ variant of this. Check how SPI framework
>> deal with a such.
>>
>
> Jtag driver uses miscdevice and related  misc_register and misc_deregister
> calls for creation and destruction. There is no device object prior
> to call to misc_register, which could be used in devm_jtag_register.

Same question as per previous patch.

-- 
With Best Regards,
Andy Shevchenko
