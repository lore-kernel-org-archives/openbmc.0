Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aIP2aP1U"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjGpY16CkzF1Gv
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:11:16 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id f4so2172222qtj.6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uhvtn1Rx719xXrV2Al3kqTZ5WkcgTg3O4ikwdBmlwvk=;
 b=aIP2aP1UkjNYE+XNQz8++8XAmFNnwFaNPrewDv9BUa1LkhjQsAPNF4Rk62E/S4xEMU
 sLlxD/3Sc0krfYj4FJC0v0Bavo4B0HcTU8KZ19KEoCUSfmmvDP3ID7t0p9lU8B6UDwF7
 EZmcYImpYeuBv3LSV3UYLX7ixRGg7SNg9gZGgROHlfo+mJohwBSYUNfjBHgdk69Z5wB/
 vYAnkMKI7WDfGCdM0RBpPvM9xdfmclnGa3yoy2r8P1lTreHMsjBbFkQBTYu3rVQiXQlP
 Y1gqMN0hLGyfD4xbTFo01elzWVFr0Mt7VKm+FfZroLmIcT4igK7TUmkFkxkun0pSWigP
 8+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uhvtn1Rx719xXrV2Al3kqTZ5WkcgTg3O4ikwdBmlwvk=;
 b=Q7e8oe5bekFeMPIpSzNhxDE/S/L1gTvXnQt48IkQIBZGzhArwUu2WGHEOeZPvDCSB6
 eltAtM4WJG+n4tzH9hKIE3Ql3OT1J/SxZvjaBXHoR1xcFc8Xju5BVx7/94fIxR0Hxx5I
 /dR+Z5o2JojNkYgdklIAfrdizuTBt66zg9gx0FiV8FyYQRyfPBhudtREpdQIldluW8CV
 6mnZvl/l5Ust7K+46aNmg9ISncG+zQOpJv0ptfyTHkX2hNIAKU7kCxWnyl/wlmmIjrVC
 R+yBVS5LynNmX3aaroTJW3hHdjiTVfPGxMFRUODAPsDvbstRueWBbH4BFrP7R7GD5hdA
 F+JA==
X-Gm-Message-State: APf1xPBu+E5IStVIfO4gdbf40EiM9K6+SuFQuXqk5457S3JXHWp/gygb
 VzgbSf4SyVWmhQXBcRmA14alqnI/Xth0+Fn6bNQ=
X-Google-Smtp-Source: AH8x226XARwkQr6knT3AcO3Y2kI/js3Kr6smr4Dwrl+T1jJApv5c1ANhTh6jTRevatpoZ+Pm7Fhd7Pz6cIQPAI2DSt4=
X-Received: by 10.237.59.59 with SMTP id p56mr7899364qte.84.1518747074132;
 Thu, 15 Feb 2018 18:11:14 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Thu, 15 Feb 2018 18:10:53 -0800 (PST)
In-Reply-To: <20180212121047.24831-1-chen.kenyy@inventec.com>
References: <20180212121047.24831-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Feb 2018 12:40:53 +1030
X-Google-Sender-Auth: DAHjMzoqFvYRXKAkB0IpvL_OfOs
Message-ID: <CACPK8XfqpOFnMekHjOAvw_ge_T_ouaGQdEF9gTmEZYEKLOFbqw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v5] Add ARM system BMC device tree
To: Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 16 Feb 2018 02:11:17 -0000

Hi Ken,

On Mon, Feb 12, 2018 at 10:40 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> Centriq2400-rep is ARM system reference evalutiion platform
> with ast2520 BMC.

How about:

The Qualcomm Centriq 2400 REP (Reference Evaluation Platform) is
aarch64 Armv8 server platform with an ast2520 BMC.


>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>
> ---
> v4->v5
> - Removed strange whitespace
> - Removed aspeed.c commit
> - Modify commit content
>
> v3->v4
> - Modify Makefile for centriq2400-rep dts
> - Fix typo label
> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
> - Removed lpc device
> - Fix coding style
> - Removed ssif device
> - Removed max31790 device
> - Removed register control of GPIO and Watchdog
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
>  2 files changed, 277 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c54fc8..77aef19 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
> +        aspeed-bmc-arm-centriq2400-rep.dtb \

Nit: we keep these in alphabetical order.

I notice that this patch is against the 4.10 branch. Please rebase
your patch on dev-4.13.

>         aspeed-ast2500-evb.dtb
>  endif
>

> +&gpio {
> +       pin_gpio_c7 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
> +               output;
> +               line-name = "BIOS_SPI_MUX_S";
> +       };
> +}

Have you built and booted a kernel using this device tree?

I get an error when building:

Error: arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts:276.2-277.1
syntax error
FATAL ERROR: Unable to parse input tree

Please fix up the missing semicolon, do a build, and ensure this boots
on your system.

When you send v5 you can add the Acked-by line from Andrew to your
commit message.

Cheers,

Joel
