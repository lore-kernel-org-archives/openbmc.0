Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::242; helo=mail-ua0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XN3QJvwL"; 
 dkim-atps=neutral
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yn8MM3v25zDrbX
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 05:34:22 +1100 (AEDT)
Received: by mail-ua0-x242.google.com with SMTP id j14so4037253uag.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=BedR3awGLZKzmxQ7qVPwFFO3U4W8iPF53OUZDhSDgSc=;
 b=XN3QJvwL2UiF4lab0PSnZbiFuzQhjw1Epb+FbicZOi0/NUroaJPilEvd6en1Hl1zF4
 GBxAciMUPRYfvuzgNkHcI6PKPP4Br5s3RPlOC00UdS3Nve3snso7IoKchg/B0TsI2nBZ
 /9zv+QDvLMe9bpCF34VO/4pdt7R4kUWwGlEFWyj85ltNam2/lTmsFs63PIQgAx5xWz5d
 W7RtvbIeajDDGyf++HzBHEqDWjSitxzeKrief4YcIxjne16eq/s6QbtEEL5BDydgdF+z
 EPG9XApd6CZ6Q5PRvOt3jOGHlq4xt9otn+1nChVGM1q2sI6+vugoy4AVg5RkRlE0kWAd
 3V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=BedR3awGLZKzmxQ7qVPwFFO3U4W8iPF53OUZDhSDgSc=;
 b=osQU8mPA0/S6D6PinFW2BZ827iIBWRHmgXPe5H/OfUlHwmNxye5J19CK8ZF34OYAmk
 vWZzCrSXbS7tSKTTmkllqg+tFWgLqoNnEVDzetknQO/SZLlD0IIxfHz2zBJuOgb9Ss6v
 ty7FsbJkn66F4F7RAH5kzd60CYXDKrr77XfZEp1WXI4UsozG/8Q8dzubj01VIPZICM3y
 821ks2mCLM0OJZfdbW6RUlGSegXfMKZZ+Y+cBKkq3iHzPAqiyBG3exRADqoNpCHqjyeV
 AeN41RNlMu42aqk0BSPx7DItvPmVeQrt3Yz9kYVWD40gAV6umqBbvVMrzlcFJuJZD+Q7
 XFAg==
X-Gm-Message-State: AJaThX5o/YIy49QHS1x97j5hZ1Y9qkJCv1yd7d9vSEhh/qKCZsxSa3Og
 0x20GF2a8RJM5K6Xu2bEV0ut2cKLNwz+1O1AmWUAnA==
X-Google-Smtp-Source: AGs4zMYO4M55upSbe1xiTfWYnAkf/cXA7ELozJcHEM1iGAK//GPN+F+Wko4Mx1RHlk4OM450Z3OfXAYREnkEItirK18=
X-Received: by 10.159.61.196 with SMTP id e4mr3102997uaj.156.1511980459182;
 Wed, 29 Nov 2017 10:34:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Wed, 29 Nov 2017 10:33:58 -0800 (PST)
In-Reply-To: <20171120185445.146061-1-venture@google.com>
References: <20171120185445.146061-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Nov 2017 10:33:58 -0800
Message-ID: <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, 
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
X-List-Received-Date: Wed, 29 Nov 2017 18:34:25 -0000

Can I get a status on this patch?  The device datasheet has 4K
reserved for the range, but only the first 512 are registers
controlled by this driver.  The rest will be handled by a separate
driver.  Or at least that's how it's planned.

On Mon, Nov 20, 2017 at 10:54 AM, Patrick Venture <venture@google.com> wrote:
> Instead of 4k, it should be 512 because the latter
> part of the memory region are registers for the serial
> gpio driver.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6505062ac6c7..424d843ec1da 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -231,7 +231,7 @@
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
>                                 compatible = "aspeed,ast2400-gpio";
> -                               reg = <0x1e780000 0x1000>;
> +                               reg = <0x1e780000 0x200>;
>                                 interrupts = <20>;
>                                 interrupt-controller;
>                                 gpio-ranges = <&pinctrl 0 0 220>;
> --
> 2.15.0.448.gf294e3d99a-goog
>
