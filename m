Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XzH0KETw"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ypvwV4jWrzDwP1
 for <openbmc@lists.ozlabs.org>; Sun,  3 Dec 2017 02:20:41 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id p139so5592120itb.1
 for <openbmc@lists.ozlabs.org>; Sat, 02 Dec 2017 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WSZUUEGkQi2n16BTwef5R0hVQptowd286xGPcu3RYYI=;
 b=XzH0KETwNbgo2S+JF5HwRvAfwumUcDodQvY21CPiLm5K43v0oyRY81dXoU3k3djS+N
 puXBTBmWbWh2WlpbcoRcsy+0F17zEVpH4CALvmyeVrn053UOmyc9NCcnt0HEUO4mtETO
 0t7CoPlYhkQEsIz/gqOThZ6r07wNuL9I2PVZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WSZUUEGkQi2n16BTwef5R0hVQptowd286xGPcu3RYYI=;
 b=Chy7w7+Lyw8usFpndsliufojHiccAmnuU3A1epZjocfPBkFI47cTFrNRUnwluauwVO
 0w+4kjjGbWd9s4Q3DPtE/PdZwGZFcY+I7EyxfdVpi2dz3y0FmlW/ngoqYsIC2b25jdRj
 /3ShbPwF07mf/jHl2litfy0K3/be9HwwRQZVF/JCbDhJQbUNatOB7UDU4xEdMtKO+peL
 tzjGmoCZTBKOVXk7ExeHScpGsPfRf01cosNSNr20kJZXWNevU0QtUL9O+3GTfW+aW4yu
 lcoBwKZf2B/GuqdnfTA3VpyJfE75FnY7ImashDhixYOcBwXZ8xjJA6EuwKipBWrD11j7
 lGHw==
X-Gm-Message-State: AKGB3mLsm8y5Hh2Y8icajqIBd11Yd/0FFLC22ooiSzMnx2LVCkjZ6mY0
 ofKKAdlkhszhl2rTnmt/brfCIREDYUU9bLWXkQ8fTg==
X-Google-Smtp-Source: AGs4zMa6AMip6RXmjNkxf21smEE0ie18GxVO1KPZyy0jYHWys082O034GV3xkuK6SX4pEW6En6iuxoQwOqdEVx6u/r0=
X-Received: by 10.36.57.13 with SMTP id l13mr6505908ita.101.1512228038548;
 Sat, 02 Dec 2017 07:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.29.76 with HTTP; Sat, 2 Dec 2017 07:20:37 -0800 (PST)
In-Reply-To: <20171130035525.29653-2-andrew@aj.id.au>
References: <20171130035525.29653-1-andrew@aj.id.au>
 <20171130035525.29653-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Dec 2017 16:20:37 +0100
Message-ID: <CACRpkda2ix77k3noL3Ze6L3=g8cH_+DK1-HUh6fMkWnSJ1SfUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: gpiolib: Generalise state persistence beyond
 sleep
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, 
 Joel Stanley <joel@jms.id.au>,
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Sat, 02 Dec 2017 15:20:43 -0000

On Thu, Nov 30, 2017 at 4:55 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> General support for state persistence is added to gpiolib with the
> introduction of a new pinconf parameter to propagate the request to
> hardware. The existing persistence support for sleep is adapted to
> include hardware support if the GPIO driver provides it. Persistence
> continues to be enabled by default; in-kernel consumers can opt out, but
> userspace (currently) does not have a choice.
>
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
>
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Rob Herring <robh@kernel.org>

Nice work, patch applied!

> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 3f454eaf2101..0bd472ffb072 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -474,11 +474,15 @@ static ssize_t export_store(struct class *class,
>                         status = -ENODEV;
>                 goto done;
>         }
> -       status = gpiod_export(desc, true);
> -       if (status < 0)
> -               gpiod_free(desc);
> -       else
> -               set_bit(FLAG_SYSFS, &desc->flags);
> +
> +       status = gpiod_set_transitory(desc, false);
> +       if (!status) {
> +               status = gpiod_export(desc, true);
> +               if (status < 0)
> +                       gpiod_free(desc);
> +               else
> +                       set_bit(FLAG_SYSFS, &desc->flags);
> +       }

Part of me just wanna drop this hunk of the patch and let
the old sysfs ABI rot.

But I guess that is especially malevolent so I will abstain.


Yours,
Linus Walleij
