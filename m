Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="WZc0ExB+"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wv0X65TKzDqRP
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 23:01:16 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id s5-v6so2726089ljd.12
 for <openbmc@lists.ozlabs.org>; Fri, 08 Feb 2019 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USGx2kho1odtp/xVaq0QRLPVGc74cEK/ucDAsuKh7GE=;
 b=WZc0ExB+dCeAAilJyNmQBHYWZ7AOoOxRPfu2mQkVslrldtDcdHXVdmXwWyy2jLzlnx
 GSUh/8BxY1f+5tVZcIgO0SeVMOSls/GjgvT4Z4XzE3ezyiXaqAjFVpqe68o/ZnXO9+pM
 ppS6PpLsPgYcvla1AB8fN5AhqAY7PjQYQ3VOLPwL9YLrvWjv4noYEqdJE8W8SdeDjdmP
 iRtm5VEuehj15KUBK0I6eMDhPZIpWCxxrzImVMJ4Y5vgMbV0wIlPT5vva2LKnTecyRP8
 PC0frpAU15QXpauPNpd6Z4NJsCh+2R64B1mQU6ot1WxrHANKBJXDDi4oTvgidezsj1r+
 FCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USGx2kho1odtp/xVaq0QRLPVGc74cEK/ucDAsuKh7GE=;
 b=X0zVgy3wbIElbTqIg1/brJAynU7jwhO8b/S9RtmMMLA13FX/87heUv0FRrCXl22dq1
 Pma0xV7VV5PqdANQq6SPZhcsiTzSEcFQ+TS2hSQCBgRISbawMfLL/Wj5L7TPfosYIYRv
 jGgsW+bb7/HMtNp+0pLTKeWPU5Ox02blDnue1L4kDoJXxdFyPLXCp5/M5AvrAl/GVAUy
 9hAOIoyhegHJEoOMJj9/tzmpjKQ6fsHaJFaxKoRZfEUiHkycM4YSsJImKC+HCri50nMp
 dU+EnD114c/kNZ8mxd8o1KlislcfkyWLTyHVpcywQOmL5FvNcLyu5Gx32a2YE4+dfn/A
 /KdA==
X-Gm-Message-State: AHQUAuZxZX50JEIavk27S0HoY0H5LrQQxfTb8E4IQtaY1vr0wpnN+BeU
 IWOfWX8F0WCHUD6DzzfRFw8RRR1D1ZgoZJqZHOKmjA==
X-Google-Smtp-Source: AHgI3IYznAnlYtGESrMmKm3KhCsKC3AcqrTDXXSJo7MStjZIgdE2dBa0w36QAU2VPqxYQRgoziEhf45ZWz51wLP7Xbk=
X-Received: by 2002:a2e:6109:: with SMTP id
 v9-v6mr13051776ljb.126.1549627272978; 
 Fri, 08 Feb 2019 04:01:12 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
 <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
 <CACRpkda6PZnoF83mYeTDYxqaFYLTp2jn=E6WJe6KptRuYbFLuQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E451F18@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E451F18@shsmsx102.ccr.corp.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Feb 2019 13:01:00 +0100
Message-ID: <CACRpkdaiLv94-bcE85E5TyRQWG-EXOCUVu0fLpOr++5_Q0Qqfw@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery,
 Vernon" <vernon.mauery@intel.com>, 
 "Feist, James" <james.feist@intel.com>, "Yoo,
 Jae Hyun" <jae.hyun.yoo@intel.com>, 
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Khetan,
 Sharad" <sharad.khetan@intel.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2019 12:01:18 -0000

Hi Kwin,

thanks for your patch!

On Thu, Jan 31, 2019 at 4:11 PM Wang, Kuiying <kuiying.wang@intel.com> wrote:

> Below patch is based gpio character device and extend .set_config() property to
> support pass-through.

This is starting to look good!

> And I plan to add passthrough setting for gpioset of libgpiod, patch is attached.
> If you agree I will upstream it together w/ this pass-through patch.

Bartosz is the maintainer of libgpiod so he can answer about that.

I'm not sure why it needs to be a userspace thing, can you explain
this?

Why can you not just set up passthrough in the device tree file?

It seems like a dangerous thing for userspace to deal with.

> BTW: I have 2 questions hope could get your answer:
>         1. why we have to switch to gpio character device and what's
>             the advantage of it?

- We get a proper topology with local numberspace per gpiochip
  instead of an unmaintainable large global numberspace with
  numbers that are magic and different on every system.

- Discovery mechanism, you can inspect the available GPIOs
  by gpiochip and name.

- When a process using a character device crashes, it will
  release its resources and release the GPIO lines it is holding.
  When using sysfs, if a process that exported a few GPIOs
  crashes, sometimes things are left in an undefined state,
  never cleaned up and the best way to get control over the
  machine again is reboot.

All of the above issue of the sysfs ABI were pretty
serious.

>         2. As you mentioned " sysfs ABI is deprecated since
>             over three years ", why sysfs ABI is still in use and
>             most of cases are still using sysfs ABI?

What are you basing this statement on? It is deprecated,
and people have to actively choose to compile it into their
kernel. Big distributions like Fedora does not support the sysfs
ABI and disable it in their kernels. If others enable it, please
tell then they are wrong and the GPIO maintainer want them
to stop using it.

>  And when sysfs ABI is removed totally?

Around the year 2020.

Maybe not even then, if people are still using it. However
the GPIO character device is design to last ~100 years so
I think it will win in the end. I have patience.

> Please share all the related information (including web page/video/PPT/etc.)  ASAP. :)

I have some presentation here:
https://dflund.se/~triad/papers/GPIO-for-Engineers-and-Makers.pdf

> +static int aspeed_gpio_pass_through(struct gpio_chip *chip, unsigned int offset,
> +                                   unsigned long usecs)
> +{
> +       printk("kwin::aspeed_gpio_pass_through is called");
> +       return 0;
> +}

I guess you want to actually implement this too :D

>  static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>                                   unsigned long config)
>  {
>         unsigned long param = pinconf_to_config_param(config);
>         u32 arg = pinconf_to_config_argument(config);
> -
> +       printk("kwin:: aspeed_gpio_set_config");

Please remove debug prints when submitting the final patch.
BTW pr_info() is better for this kind of stuff.

> +       else if (param == PIN_CONFIG_PASS_THROUGH)
> +               return aspeed_gpio_pass_through((chip, offset, arg);

Yes this is good.

> @@ -579,6 +579,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>                         set_bit(FLAG_OPEN_DRAIN, &desc->flags);
>                 if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
>                         set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +               if (lflags & GPIOHANDLE_REQUEST_PASS_THROUGH)
> +                       set_bit(FLAG_PASS_THROUGH, &desc->flags);

This is good if we support this on the character device.

> @@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>                         ret = gpiod_direction_input(desc);
>                         if (ret)
>                                 goto out_free_descs;
> +               } else if (lflags & GPIOHANDLE_REQUEST_PASS_THROUGH) {
> +                       ret = gpiod_direction_pass_through(desc);
> +                       if (ret)
> +                               goto out_free_descs;

OK looks good too.

> +/**
> + * gpiod_direction_pass_through - set the GPIO direction to pass-through
> + * @desc:      GPIO to set to pass-through
> + *
> + * Set the direction of the passed GPIO to passthrough.
> + *
> + * Return 0 in case of success, else an error code.
> + */
> +int gpiod_direction_pass_through(struct gpio_desc *desc)
> +{
> +       struct gpio_chip *gc;
> +       printk("kwin:: gpiod_direction_pass_through");
> +       VALIDATE_DESC(desc);
> +       /* GPIOs used for IRQs shall not be set as pass-through */
> +       if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
> +               gpiod_err(desc,
> +                         "%s: tried to set a GPIO tied to an IRQ as pass-through\n",
> +                         __func__);
> +               return -EIO;
> +       }
> +       gc = desc->gdev->chip;
> +       if (test_bit(FLAG_PASS_THROUGH, &desc->flags)) {
> +               gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
> +                                           PIN_CONFIG_PASS_THROUGH);
> +       } else {
> +               gpiod_err(desc,
> +                         "%s: desc->flags is not set to FLAG_PASS_THROUGH\n",
> +                         __func__);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_direction_pass_through);

I think you should skip this. I don't think users in the kernel need
to dynamically set this up. It should be done as a flag in either
device trees, machine tables or from explicit request from the
character device ioctl().

>  #define FLAG_SYSFS     3       /* exported via /sys/class/gpio/control */
> +#define FLAG_PASS_THROUGH 4 /*Gpio is passthrough type*/

OK good.

> @@ -124,6 +124,7 @@ enum pin_config_param {
>         PIN_CONFIG_SLEW_RATE,
>         PIN_CONFIG_SKEW_DELAY,
>         PIN_CONFIG_PERSIST_STATE,
> +       PIN_CONFIG_PASS_THROUGH,

Good.


> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 1bf6e6df084b..44d9876b4aa2 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -62,6 +62,7 @@ struct gpioline_info {
>  #define GPIOHANDLE_REQUEST_ACTIVE_LOW  (1UL << 2)
>  #define GPIOHANDLE_REQUEST_OPEN_DRAIN  (1UL << 3)
>  #define GPIOHANDLE_REQUEST_OPEN_SOURCE (1UL << 4)
> +#define GPIOHANDLE_REQUEST_PASS_THROUGH (1UL << 5)

Seems right, if we should support userspace.


Things are missing from this patch set:

- Adding the flag to include/linux/gpio/machine.h so we can set this
  up from machine descriptor tables.
- Adding the flag to include/dt-bindings/gpio/gpio.h
  so we can set this from the device tree.

Also code for handling both above ways of setting it up.

And I think what you want to do with Aspeed is to set this up using
device tree and not in userspace, unless you can explain some
reason why you wouldn't do that and instead do this complex
and dangerous system operation in userspace. Definately you
want the system default to be set up from device tree and then
that should support passthrough, right?

I can't comment much on libgpiod, we'll see if we want this for
userspace first.

Yours,
Linus Walleij
