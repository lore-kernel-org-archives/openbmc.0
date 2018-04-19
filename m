Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pSPhnP4x"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Le14p68d"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RP7d6r2XzDr3t
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 13:08:13 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id c136so4045390qkb.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 20:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I5c5izz6JhofF1fq068rzSq6EB0J3whgCmidpCnd0DI=;
 b=pSPhnP4xwtx1rDxE5EqyJUk6FOK2ZqN6Fg3VxOb/Awuwa7qbHPd5SIKighVa8T96rv
 m+Ul5mh76ALNQt3g8yTCkpJYwJFqdpycLnhIBmqcQQ1fcuiyVjCKDTQIf/jbatPYpQvv
 IX1hStNqefvfsTI08/JIlgYNjGS3+GNVcCohtBH58kju2XcmYjwWA6vmrM5cfFLZfUV6
 9UnyZ4qXpY4IEXBbuCKZDGZNCv9/1RL15XCbAzkK8lu/OJu5jmGWeLmnsM5TRdjS++Ad
 w0OuoDGG1vF4Pn41uXDuXAtuYaupenQp+9VxZ2I/24Z2N8ZVc6gCAYncFTTFTLcPXKX1
 lLbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I5c5izz6JhofF1fq068rzSq6EB0J3whgCmidpCnd0DI=;
 b=Le14p68dD8sWxbhNCMEL4tKYxInk8JKefYtdH71UmK7XdmGqR720uQMLAgaflUJkP7
 QJXj5KCuHxG1fOkIRKgvE4EVxe5p1HbUjvGk+PB939+0MgqXstBTn9hUzd6T8tM+Tm71
 B2X49/JXNREL9JOvIAOcIF+slCg1XT/Z8nhHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=I5c5izz6JhofF1fq068rzSq6EB0J3whgCmidpCnd0DI=;
 b=tlFXlrxWt6spvnICFZDsfaH0v9zxUokXKwSKKLbEZpnCuvyWSElYL/2EwABKt5nIo4
 sqsaws9Jg0/EiuNtxI1470bCjWgNmWmTqSJ+RpdDe4DbUJEWjGbc6UEvfVrEpie2SmxY
 l9XgOx+kuOrvLQvhhNYmAjbfHJyWiUiugq/iWaYCQkaZlKL2P60aLhHKwDCGFOfpjUmN
 bN/+FNUg7RnSHBKJfjuG9kL87JoSAjSrc4KKqjphqdeHW6gcmm+fhyflVRRH47ahSKmI
 4ZpNcbLN3Plbo45ZHUwOjShGkk5ao9jyhu6pbxYdRIZpYatkVRhDEXK4zriyAFUBaYwm
 J1Tw==
X-Gm-Message-State: ALQs6tDE5N9zCynkoA+QJ6PYcHOt5RexUIqjTn2xWEHtT8TI40WENl5I
 /oCng/F0IQUQ7QzLKcIovEOYKQH3ghMZFgtyOzE=
X-Google-Smtp-Source: AB8JxZqki3SSdBqbUaZXO6s94RJ+r6fyRAjv/RySPwDOLkmVUh7nh7R2i8w3iT3Js+J09LQ50+J1yu45kv3rcq+Up5E=
X-Received: by 10.55.31.129 with SMTP id n1mr4101276qkh.416.1524107289476;
 Wed, 18 Apr 2018 20:08:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 20:07:48 -0700 (PDT)
In-Reply-To: <20180412035145.21488-2-andrew@aj.id.au>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 12:37:48 +0930
X-Google-Sender-Auth: F4IfbQFFxA0WUpxOXcMldblce1k
Message-ID: <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 03:08:15 -0000

On 12 April 2018 at 13:21, Andrew Jeffery <andrew@aj.id.au> wrote:
> The ASPEED BMC SoCs have many knobs and switches that are sometimes
> design-specific and often defy any approach to unify them under an
> existing subsystem.
>
> Add a driver to translate a devicetree table into sysfs entries to
> expose bits and fields for manipulation from userspace. This encompasses
> concepts from scratch registers to boolean conditions to enable or
> disable host interface features.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/soc/Kconfig                  |   1 +
>  drivers/soc/Makefile                 |   1 +
>  drivers/soc/aspeed/Kconfig           |  11 +++
>  drivers/soc/aspeed/Makefile          |   1 +
>  drivers/soc/aspeed/aspeed-bmc-misc.c | 187 +++++++++++++++++++++++++++++++++++
>  5 files changed, 201 insertions(+)
>  create mode 100644 drivers/soc/aspeed/Kconfig
>  create mode 100644 drivers/soc/aspeed/Makefile
>  create mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c
>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 07fc0ac51c52..776fd5978f70 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -1,6 +1,7 @@
>  menu "SOC (System On Chip) specific Drivers"
>
>  source "drivers/soc/actions/Kconfig"
> +source "drivers/soc/aspeed/Kconfig"
>  source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 9241125416ba..94a5b97c4466 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -3,6 +3,7 @@
>  #
>
>  obj-$(CONFIG_ARCH_ACTIONS)     += actions/
> +obj-$(CONFIG_ARCH_ASPEED)       += aspeed/
>  obj-$(CONFIG_ARCH_AT91)                += atmel/
>  obj-y                          += bcm/
>  obj-$(CONFIG_ARCH_DOVE)                += dove/
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> new file mode 100644
> index 000000000000..704a4efe180f
> --- /dev/null
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -0,0 +1,11 @@
> +menu "ASPEED SoC drivers"
> +
> +config ASPEED_BMC_MISC
> +       bool "Miscellaneous ASPEED BMC interfaces"

Do you mean bool or tristate? if you mean bool, drop the module-y bits below.

> +       depends on ARCH_ASPEED || COMPILE_TEST
> +       default ARCH_ASPEED
> +       help
> +         Say yes to expose VGA and LPC scratch registers, and other
> +         miscellaneous control interfaces specific to the ASPEED BMC SoCs
> +
> +endmenu
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> new file mode 100644
> index 000000000000..d1a80f9a584f
> --- /dev/null
> +++ b/drivers/soc/aspeed/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ASPEED_BMC_MISC) += aspeed-bmc-misc.o
> diff --git a/drivers/soc/aspeed/aspeed-bmc-misc.c b/drivers/soc/aspeed/aspeed-bmc-misc.c
> new file mode 100644
> index 000000000000..48522a736a05
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-bmc-misc.c

copyright headahs

> @@ -0,0 +1,187 @@
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define DEVICE_NAME "aspeed-bmc-misc"

This is the name of our chardev? No, it appears to just be the driver
name. You can probably just use it directly.

An observation: It's the only thing inside this file that is aspeed
specific. If not for the name, it could be generic code.

lgtm. I suggest writing up some bindings and putting on the asbestos pants.

I'll merge this into openbmc with the IBM copyright added to the top.
With this adding userspace ABI, anyone who writes code against it will
need to make themselves available for rework as it goes through
upstream review.

Cheers,

Joel
