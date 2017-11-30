Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::242; helo=mail-vk0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="avJ8MFEi"; 
 dkim-atps=neutral
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynhM91JnyzDrvM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2017 02:36:04 +1100 (AEDT)
Received: by mail-vk0-x242.google.com with SMTP id q189so3672151vke.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 07:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qpSFZUtswdJGcU57T3rVHcyAedge7Sca4w/vcHGdpEM=;
 b=avJ8MFEibbsM2VDFZTeEpjEmPJa69hBr05tJ0HQKjqlgfiEE+1NsE9F5PYk8H4OZan
 uuQ/F5K1mFAVeUTYjamzFPf+8+kmi0ZrFAH8fpa3OpP/YrbKD6m2STaJXLbdnenhV0GW
 xVduL3VF9FHQxpzLEe1NsrOTe1PHQjfz2uALuLDp3a/AmiSoH16NDAuXFLeKdMEaFNV0
 AZavQ/JmgS8wB87ofTk9wiLG5wHrXowQgBzt5zndvMaWDfuSUAJVsN4AUilW2OH/bPVr
 1GV2cXyoE/93G0jc0AnutWJYQTeOstUiMKeey7gzmcUMbNaztBqXe2om4pPOnW38nDaL
 NErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qpSFZUtswdJGcU57T3rVHcyAedge7Sca4w/vcHGdpEM=;
 b=P6cRho0jwdd5QHvMA9RYJIHMqm8F8Oo7BnVTE1xw9XlgBJ3lEKLsScH1suGyQQU39y
 j0cILYPc1Ay2TxH5ojLxRwD6LDEVvuVdOPkxAR47Y1Tgh6nUZoXwgI8dT2gZSqt/OdHQ
 N3jz67rSvWChTO5XHmAvdnqPpJmKE9iYLnswcSzgL5mqeChkK5fKJ2BJh06UIoYV3WN1
 IBaJYYWLhpil84PCzzCWqfqDx9U6FBJNZO3NHuYNci54kubgJs0O8kgp3uVEDIg++k6f
 zrujKoar+glIRJNQM8ABMHdyDuTqPI/pYnhpMnDoV0y59LWUOR9ZprWOS9OWkbKrMM8J
 oCDQ==
X-Gm-Message-State: AKGB3mKX17Q8Rs6RM0AJjKHcQE94Q03o01iqP3qsLalgFgjJnYpO5oZU
 KNIF4BvHJQFSsU7B+j6Ja64luYcGlGUaEcM9WT5BXQ==
X-Google-Smtp-Source: AGs4zMYO3MvyH3I8JJnZHSAMRbJqAwlxqdDCJvLgmM4i18QtExAG/Pre6XQJz2Yxu6VIO0BQDkZn5Flwq7leY4j3jX4=
X-Received: by 10.31.51.4 with SMTP id z4mr1881378vkz.127.1512056162111; Thu,
 30 Nov 2017 07:36:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Thu, 30 Nov 2017 07:35:41 -0800 (PST)
In-Reply-To: <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
References: <20171120185445.146061-1-venture@google.com>
 <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
 <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Nov 2017 07:35:41 -0800
Message-ID: <CAO=notwPBvHSvHgnQCycajUyJ-13sa+TrXYxmzKc5SL-V+8_-Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 30 Nov 2017 15:36:05 -0000

On Wed, Nov 29, 2017 at 7:53 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Nov 30, 2017 at 5:03 AM, Patrick Venture <venture@google.com> wrote:
>> Can I get a status on this patch?  The device datasheet has 4K
>> reserved for the range, but only the first 512 are registers
>> controlled by this driver.  The rest will be handled by a separate
>> driver.  Or at least that's how it's planned.
>
> +cc the people who have worked on this.
>
> I think that's okay, but lets see what the others have to say.
>
> Do you have a driver for the rest of the GPIOs you can submit? I'd
> like to see  that code so we can decide if there is good reason to
> make that completely separate, and not part of the existing driver.
>
> This work is best done upstream, as you will need to make the same
> arguments there.

I should have a driver ready sometime late next week that I'll be
sending upstream first.  I still need to finish up a few loose ends on
it.  It wouldn't be unreasonable to have them in the same driver,
you'd just end up with two groups of gpios that are handled
differently, and extra soft-irqs.  That said, if you have two large
groups of things that need to be treated differently, then that's
somewhat of an argument for having them separate. :)

I'd actually appreciate hearing some thoughts at this point on which
way to go, since merging the serial handling into the main driver will
require re-working a few things -- I'd rather take the extra time to
handle that merge if it's going to head in that direction anyway.

I have read through the gpio-aspeed driver before, as it was a bit
useful as a guide, and I could see it getting a bit cluttered with
also handling the serial gpios.

Thoughts?

>
> Cheers,
>
> Joel
>
>>
>> On Mon, Nov 20, 2017 at 10:54 AM, Patrick Venture <venture@google.com> wrote:
>>> Instead of 4k, it should be 512 because the latter
>>> part of the memory region are registers for the serial
>>> gpio driver.
>>>
>>> Signed-off-by: Patrick Venture <venture@google.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>>> index 6505062ac6c7..424d843ec1da 100644
>>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>>> @@ -231,7 +231,7 @@
>>>                                 #gpio-cells = <2>;
>>>                                 gpio-controller;
>>>                                 compatible = "aspeed,ast2400-gpio";
>>> -                               reg = <0x1e780000 0x1000>;
>>> +                               reg = <0x1e780000 0x200>;
>>>                                 interrupts = <20>;
>>>                                 interrupt-controller;
>>>                                 gpio-ranges = <&pinctrl 0 0 220>;
>>> --
>>> 2.15.0.448.gf294e3d99a-goog
>>>
