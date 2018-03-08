Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::241; helo=mail-it0-x241.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bRKIM8JV"; 
 dkim-atps=neutral
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zy54Z6TgXzF1tP
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 09:37:50 +1100 (AEDT)
Received: by mail-it0-x241.google.com with SMTP id k79-v6so534952ita.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 14:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TeOI6T4/M6oWzSzMFcK50l7uZEnrSR63aK/dMXN4p/8=;
 b=bRKIM8JVluIWWolrPuUeKSNrwy1wSQsbLKKEdNnC0QbJ6jiIM5Wb9pbLA0hDsQwRej
 v4XEbJqSjLOouEwZ7qhnqudFv8vB03fKE4p755IuCfBys79FnBR7kD6obND8gtcMrzDw
 vnkxMKpG6Q4y8XzOtOlDKNK4MMb+TbRQ4ts7zKHvqOOzmybvDDjAGKs6FkgzWpGC2ugU
 TN/kM8HgemxwJkDdGRh94UbQBryi4FijyLjCcf2UIEmZnbCnoGj/O18crzS1tIKXS9DB
 q8TqhOHt6gZ+Rlbjb6CvCkME3zgwmwhL3VxRzB71liZMYyJWPBumjRYomSLIklTITNi/
 UjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TeOI6T4/M6oWzSzMFcK50l7uZEnrSR63aK/dMXN4p/8=;
 b=gRSP4lunFgpRuKdFb8dQeh+iK5Xtb4WMW3Ovj7evxFJnRypcJmFMI2eLx/G+VrjKPl
 u7MqxPYg6f7jRPdp7+S8rurfswazkRU1tXH/CRWyntChqOT7jN5T9cOXXNBYxgVdTusY
 IyejQTkquEJsqfr35GE9pE//tfnn08vTVak9xbfPyPLfiSaO3TuJRQGZr+1/Kxvx2i5Y
 2VXBhD2o0mZ09Z4LHpQ25/ZSO/JzP0x8wksC7BCrc9RrZvi3lURlvzZ7jVHuRc9zDheq
 nsaxfSInnuQ5aZfDiTwXBgHtOBw5ys/KXHILTUv/u9XBZJO86jyJkWjITpjC0fA+JCN+
 wvxA==
X-Gm-Message-State: AElRT7GauZ6ls2fRfVzegNsV5sDYqC9yqhXj/3FNDVQUtbDqSin4Zb7p
 lOdIb0Q0Lkk9ItrTgoQr5ukHF6MUxGR9AKIm1t8=
X-Google-Smtp-Source: AG47ELudhbcrhrUq56sn1A9iKnU8GVTwtgeLxdpLE0miFvtlFa6nX+lZMXQFotpSCTnipqKY7O+yggLd1u5cP5ioIr4=
X-Received: by 10.36.245.138 with SMTP id k132mr649205ith.96.1520548668062;
 Thu, 08 Mar 2018 14:37:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Thu, 8 Mar 2018 14:37:47 -0800 (PST)
In-Reply-To: <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
 <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
 <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Mar 2018 00:37:47 +0200
Message-ID: <CAP6Zq1gKE0xUGHuwXa7eLEsUisnaaz=QLgs=6uYnUYDGdX5ryw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Brendan Higgins <brendanhiggins@google.com>, venture@google.com, 
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 08 Mar 2018 22:37:51 -0000

On 8 March 2018 at 17:33, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 08/03/2018 16:24, Tomer Maimon wrote:
>> Add Nuvoton BMC NPCM7xx timer driver.
>>
>> The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
>> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
>> ---
>
> [ ... ]
>
>> +
>> +     pr_info("Enabling NPCM7xx clocksource timer base: 0x%x, IRQ: %d ",
>> +             (int)timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to)=
);
>
> You can use '%p' instead of '0x%x' and remove the (int) cast.
I think we need to use in the pr_info %px, if I use %p I get in the
kernel boot print "(ptrval)" instead of the address.
please refer: https://lwn.net/Articles/740249/
>
> I'm fine with the driver. If there is no comment, I will take it and do
> the change (if you are ok), no need on this case to resend a v6.
Yes great, Thank a lot!
>
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
