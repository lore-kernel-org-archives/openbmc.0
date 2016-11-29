Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wj0-x236.google.com (mail-wj0-x236.google.com
 [IPv6:2a00:1450:400c:c01::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSrnG4drKzDqml
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 04:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bLAu4zC3"; 
 dkim-atps=neutral
Received: by mail-wj0-x236.google.com with SMTP id v7so152300648wjy.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 09:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QIacQpMrUKsoQCu7fm9x5JlFfNUF1Axe+7IlPb1QFI0=;
 b=bLAu4zC3ughDBfAbD9EhSDumrXkTImKXo00XsJ2AfaEN7LDl0tGj0IWbcxpiRgQwgU
 kLMwFx3J7OgIy+L1pfmqLc6Gq1SykO6FbP1VX7DzJ6QC585fCis5K/pPOFxq1c4O6ZpY
 Dr4ClalXw3/PE65fqXcbkgvzQS/Y1gUDXAuvxZQ0gsY9EwHUB1BEJF/MHqRVJ3Zwml5S
 GRUkL/yOua0pUiIJEB3Ej4hYWKd+5i6GBN8yLwRjGWPJ9JPPqMI6mJ0HNFlDr5jbMK8/
 UEnL5kSH4toTUFh702oxAtPf9xfR8Ds1JG8w3tvxve4IaHAuta7rReb1byJusIwO6kzS
 s0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QIacQpMrUKsoQCu7fm9x5JlFfNUF1Axe+7IlPb1QFI0=;
 b=O4zqWLMiqDQKamp5RHDWzYXUsjMsgjx+jmeIfAflMp++epQa9/Xjr/0JCi5wv6bW+N
 1CFSiSpJj5tf0tMO3Nay544GljW/eTxTiwRnc8sz0I35oh4hAV3QEIttxN2dt04JMZrh
 op2PJ7Qv2CX9mrmS6DZMV/5DTmTxQsKhlNTXYDcaKMhHhBzk7MlJpEskuZ7UreMOk2mM
 bl3v8+f3WydC/wQEXlWcGVtjyHxDQTaLpjILH3bl9hMO+75smsfICpnSnoFLd2Rg3trH
 fKtuG5EXzMf0J1FFsbDA+/24DSNT42lMuNNP+/GirP/IvVyDLKNpuWzdES1PwwyHPOtA
 PQKQ==
X-Gm-Message-State: AKaTC00z+Sn/RhIKQ5LYDUtwIYcalZ54rWpIKjmT+xQ/Q19DnB05AHrOexQu2R9ZRnJXHPQXdnb5ZlvnzkAP4w==
X-Received: by 10.194.121.6 with SMTP id lg6mr28619490wjb.105.1480442143611;
 Tue, 29 Nov 2016 09:55:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.173.108 with HTTP; Tue, 29 Nov 2016 09:55:43 -0800 (PST)
In-Reply-To: <1480378504.2503.87.camel@aj.id.au>
References: <CAA0LjjUbmBkFU2YDpvSK01uBGrLyK_H2Dvt3UdG-LC09uWg_9w@mail.gmail.com>
 <1480378504.2503.87.camel@aj.id.au>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Tue, 29 Nov 2016 11:55:43 -0600
Message-ID: <CAA0LjjUSPqRb452Up-VR4xHTWs3OP2EoZsqmYmW+rsFS3Law1Q@mail.gmail.com>
Subject: Re: Palmetto GPIO pin configuration for Voltage Translator Control
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 29 Nov 2016 17:55:47 -0000

On Mon, Nov 28, 2016 at 6:15 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-11-28 at 14:56 -0600, Christopher Bostic wrote:
>> Note that this is not directly related to the GPIO hog updates that
>> are in process of being added to the palmetto device tree.
>
> So, to clarify:
>
> The patch I sent to the list a week or so ago isn't in the process of
> being applied in any way for two reasons:
>
> 1. Per Joel's reply it will not be carried in the OpenBMC kernel tree
> 2. The OpenBMC bitbake build process *already* applies it to the kernel
> during its build process, as of September. The patch is carried in the
> OpenBMC tree[1].
>
> [1] https://github.com/openbmc/openbmc/blob/a103a3723b4329225d9316393bf0620027d02aa6/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%25.bbappend#L3
>
>> This issue exists without that change.
>
> You can confirm the presence of the hog at runtime either from dmesg or
> sysfs:
>
>     # ls -1     /sys/firmware/devicetree/base/ahb/apb/gpio@1e780000     | grep h6
>     pin_gpio_h6
>     # dmesg | grep -i h6
>     GPIO line 382 (H6) hogged as output/high
>

Hi Andrew,

The hog messages weren't there prior in my tests.  I was using a
slightly older dev-4.7 kernel and the Palmetto dts file didn't have
the hog definitions.

> If you are booting your own kernel built directly from the OpenBMC
> kernel tree with your patches applied and are still seeing the pin in
> use then that's certainly odd. The existence of the hogs patch can be
> ignored and we need to investigate what is going on.

I have been booting my own kernel from a forked version of the OpenBMC
kernel tree using the bitbake build process.  Maybe I had missed some
updates.  In any case, today I updated to the dts file with all the
hog definitions and removed only the H7 pin lines.   I see that H7 is
not hogged and that I can successfully grab the pin.  I wasn't able to
do this before.  I'll back up to v4.9-rc1 and see if the problem is
resolved there as well.

Still not clear to me what was grabbing the pin prior to this.

Thanks for your input
Chris

>
> However, if you are booting the kernel produced from the OpenBMC
> bitbake build process, then seeing this pin in use is expected
> behaviour as the hogs patch will have been applied.
>
> Can you please detail how you are building the kernel you are testing?
> I want to make sure we're not sneaking in the patch when you weren't
> expecting it.
>
> Cheers,
>
> Andrew
