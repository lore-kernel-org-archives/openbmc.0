Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV8106ZZLzDsN0
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 15:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=KFr5TS68; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id f38so314820uaf.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 22:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=89Y3IzxwDgNy+/XxOCE37XB6Ro7kvZJLNrqGZEEJXpo=;
 b=KFr5TS68Ty3CX9Vk7JhNiD6hzrxTXkcaqgqChvNJ0kugG7dH/KiKxTJEEMAkxsfczD
 O5ZwhINLdQd2WFwYo/H0kGWuIdNZhVhq3h6kEQj789WIYjz77R4DaMTUgpetEp9Eo1yF
 D9HEO9U9kRT9esCIJkkcZp+1JDGlMRWCmBgZkov/AoB8ZMptqiwJeyVCVJEuc82xbhdP
 7FMuCk7ckNozk92BF/1YoUgKd3ZZod7PNMhVqUorrpKZlTNKgUt6fNdGgNTuqZdZi+7m
 LDczpR6uqjqBCnLWNb/L9fm/NrtYvYEM5xgkSvjdUUR394IkGNdssk7uZylVcNiuRqz2
 Lumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=89Y3IzxwDgNy+/XxOCE37XB6Ro7kvZJLNrqGZEEJXpo=;
 b=LHUxstSeBoRM0jLiDyrhKDMU2N2SX7iZ/0MFvhO0kE3lNbCblP7WJ7l1OKb2TdrS6W
 CGGSyxdHAp/ATljJkK+45JMD0usdMwB9d+fIC+xY91xBERUfiyyWN1PsLRlt/V/1it2z
 /YztxABsRfrNyDez53wOtVuFxlUO093D87Aa9v1VBr4FLWhp+ViggPnhydOetiQKetTY
 8ze6hSIizTIynt4GFtXkMbo3tCr+a21pLLBijDt59GHdwKVfn603QjSr9A7fyG6FC3jH
 5ht6wF7GRiTf1haEZpVz0bYUYsKpdsQ+UHDbKEuQ7ZmycWFDXF1i9JMhkD5Qv28YXMo7
 UU/g==
X-Gm-Message-State: AE9vXwN3oAKGsQA9MYosA/DZsMNmI2UV76Jzk0HFPuIOIRZ7UzYhe/LoxvVQn4m4pZ1bI+UVlqDmOVnpyo/Pig==
X-Received: by 10.159.54.209 with SMTP id p75mr12040970uap.57.1473312306516;
 Wed, 07 Sep 2016 22:25:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Wed, 7 Sep 2016 22:24:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Sep 2016 14:54:46 +0930
X-Google-Sender-Auth: 6i-e16XdxthmO3INl-iM1lMXZu4
Message-ID: <CACPK8XeJpNJHaYYEja_BQoh5mvBnFPyaQTB5btDjCj3tP5boYA@mail.gmail.com>
Subject: Celebration in the streets (aka pinmux is merged)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 08 Sep 2016 05:25:09 -0000

Congratulations Andrew and everyone who has helped with design,
testing and review.

This is a major component of the Aspeed SoC support that is now
complete. It allows us to configure the pads (pins) of the SoC using
the device tree and/or from other drivers, instead of looking up
registers in the datasheet and sticking values all over the place.

The driver is in the subsystem tree and on it's way to appear in Linux 4.9.

Cheers,

Joel


---------- Forwarded message ----------
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, Sep 8, 2016 at 12:20 AM
Subject: Re: [PATCH v3 5/8] pinctrl: Add core support for Aspeed SoCs
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot
<gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring
<robh+dt@kernel.org>, Benjamin Herrenschmidt
<benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>


On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The Aspeed SoCs typically provide more than 200 pins for GPIO and other
> functions. The signal enabled on a pin is determined on a priority
> basis, where a given pin can provide a number of different signal types.
>
> In addition to the priority levels, the Aspeed pin controllers describe
> the signal active on a pin by compound logical expressions involving
> multiple operators, registers and bits. Some difficulty arises as a
> pin's function bit masks for each priority level are frequently not the
> same (i.e. we cannot just flip a bit to change from a high to low
> priority signal), or even in the same register(s). Some configuration
> bits affect multiple pins, while in other cases the signals for a bus
> must each be enabled individually.
>
> Together, these features give rise to some complexity in the
> implementation. A more complete description of the complexities is
> provided in the associated header file.
>
> The patch doesn't implement pinctrl/pinmux/pinconf for any particular
> Aspeed SoC, rather it adds the framework for defining pinmux
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Patch applied! It's not getting better than this through iteration, it is better
to get the system up and develop inside the mainline tree from now on.
