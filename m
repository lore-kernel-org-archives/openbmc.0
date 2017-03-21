Return-Path: <sjg@google.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkV5bBpzDq7d
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gOMRiRoR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nycj5Tgh";
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id r69so308937vke.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yzAskAsI8mgQqf0nIm6zG81LieBl5nvjJeiWGq9bnwI=;
 b=gOMRiRoRVWZqFN6FcLOGnhy+eA4mJLdHzsrj4W4m7wQH564X+fuyTeQHXmD5xGwU9b
 O5LcOWObAKRX8yfGdds38F0K5sKBZlB6AhThoyP7GL5t5EU3OemG+aKA6NPu3xJyUa08
 04+XQeFI1krA9xsbxGJ44AZivwEVZFMUKkL/G7HV0NTJ863tCi0T8dtjsfz0jpseSwiQ
 Ekf/jL2fhUTLvcbKE6Aecr3z9gzrG8KmC5AE/tOdbsoVYxrP8OAc93v2Xu58R+ZalWp2
 +qHagH3I8be0tWe7ZhOaTERfIaVRKf8d0dD0actYXrEZTqMmdAdB815b/ZChVX51HbPa
 /8kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yzAskAsI8mgQqf0nIm6zG81LieBl5nvjJeiWGq9bnwI=;
 b=Nycj5Tghx2Qft1gKYGApt0VpVGBGwiszBAId4sj6UO+38Yi7KzN081kYXaHXy4RQph
 fyCnQPVkHuP1rAyjVNlMSSVp3tZUCn0wiqK+IsL8yBqRQns8ku54LhdV+u50sUbRRVm4
 nniGum7w1zMqIXWEZzHxC8S5wWOd0Hk+/Rt/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yzAskAsI8mgQqf0nIm6zG81LieBl5nvjJeiWGq9bnwI=;
 b=nT5Z3OqAqVv5N9LFO83SyR2dTTIPiT8W/TJ3xk0udm2fFfKxrAHz3FLdMG+oGOyB7J
 BvRXgBBvvanTMqryi+umtaPyN0HUzvPWtMyZH4fwGkpdQw/LRm5fijh9pnP44ECKYkzw
 3Kmsl8cFcjKgVU3XDbEej+9EAwVrFPWz05HdUCPzRUhTuFzlc7K0z0AjUDCPvFJ28qw1
 ta6IBgLlFYEq/5e6MjBJK4Ga4xGIf9PAN6445/B1x7NoN8YGhFUOa91ljlNEoyCBf81l
 P22F2sDReqDOBBWp245XfCRO3xvrM/Uo9PB5z8ra2NkB/UoRG7jP5hhomRwG+o1KK1LU
 hTZA==
X-Gm-Message-State: AFeK/H1ZUJwFF3GcsCO2mj5lx8KR3jYa7IcFcr8PyzQCae3pImJ6nyapW2SIqEQKnBqnlzyrhxCix1BuFQU5wzsR
X-Received: by 10.31.175.74 with SMTP id y71mr9565866vke.34.1490138543999;
 Tue, 21 Mar 2017 16:22:23 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:03 -0700 (PDT)
In-Reply-To: <20170316213624.140344-3-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-3-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:03 -0600
X-Google-Sender-Auth: kVJLF3LGRzS8qeLziZCWawVzMu4
Message-ID: <CAPnjgZ0Jm0SDDOG5zOtZA3VCHHN3xGd8_0smfNYiELQ4Rf-RJg@mail.gmail.com>
Subject: Re: [PATCH 02/17] dm: Simple Watchdog uclass
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:27 -0000

Hi Maxim,

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> This is a simple uclass for Watchdog Timers. It has four operations:
> start, restart, reset, stop. Drivers must implement start, restart and
> stop operations, while implementing reset is optional: It's default
> implementation expires watchdog timer in one clock tick.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  drivers/watchdog/Kconfig      | 11 +++++
>  drivers/watchdog/Makefile     |  1 +
>  drivers/watchdog/wdt-uclass.c | 79 +++++++++++++++++++++++++++++++++++
>  include/dm/uclass-id.h        |  1 +
>  include/wdt.h                 | 97 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 189 insertions(+)
>  create mode 100644 drivers/watchdog/wdt-uclass.c
>  create mode 100644 include/wdt.h
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index e69de29bb2..0d7366f3df 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -0,0 +1,11 @@
> +menu "Watchdog Timer Support"
> +
> +config WDT
> +       bool "Enable driver model for watchdog timer drivers"
> +       depends on DM
> +       help
> +         Enable driver model for watchdog timer. At the moment the API
> +         is very simple and only supports four operations:
> +         start, restart, stop and reset (expire immediately).
> +         What exactly happens when the timer expires is up to a particular
> +         device/driver.

My main comment is that I think using 'reset' to mean 'reset the
board' instead of 'reset the wdt' is confusing w.r.t the rest of
U-Boot. Resetting the board could be handled by something like
expire_now(), perhaps?

Also please add a fake sandbox wdt driver and a test/dm test.

> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index a007ae8234..1aabcb97ae 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_XILINX_TB_WATCHDOG) += xilinx_tb_wdt.o
>  obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
>  obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
>  obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
> +obj-$(CONFIG_WDT) += wdt-uclass.o
> diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
> new file mode 100644
> index 0000000000..98a8b529f9
> --- /dev/null
> +++ b/drivers/watchdog/wdt-uclass.c
> @@ -0,0 +1,79 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <errno.h>
> +#include <wdt.h>
> +#include <dm/lists.h>
> +#include <dm/device-internal.h>

nit: move this up one

> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +/*
> + * Implement a simple watchdog uclass. Watchdog is basically a timer that
> + * is used to detect or recover from malfunction. During normal operation
> + * the watchdog would be regularly reset to prevent it from timing out.
> + * If, due to a hardware fault or program error, the computer fails to reset
> + * the watchdog, the timer will elapse and generate a timeout signal.
> + * The timeout signal is used to initiate corrective action or actions,
> + * which typically include placing the system in a safe, known state.

This comment might be more useful in the header file.

> + */
> +
> +int wdt_start(struct udevice *dev, u64 timeout, ulong flags)
> +{
> +       const struct wdt_ops *ops = device_get_ops(dev);
> +
> +       if (!ops->start)
> +               return -ENOSYS;
> +
> +       return ops->start(dev, timeout, flags);
> +}
> +
> +int wdt_stop(struct udevice *dev)
> +{
> +       const struct wdt_ops *ops = device_get_ops(dev);
> +
> +       if (!ops->stop)
> +               return -ENOSYS;
> +
> +       return ops->stop(dev);
> +}
> +
> +int wdt_restart(struct udevice *dev)
> +{
> +       const struct wdt_ops *ops = device_get_ops(dev);
> +
> +       if (!ops->restart)
> +               return -ENOSYS;
> +
> +       return ops->restart(dev);
> +}
> +
> +int wdt_reset(struct udevice *dev, ulong flags)
> +{
> +       const struct wdt_ops *ops;
> +
> +       debug("WDT Resettting: %lu\n", flags);
> +       ops = device_get_ops(dev);
> +       if (ops->reset) {
> +               return ops->reset(dev, flags);
> +       } else {
> +               if (!ops->start)
> +                       return -ENOSYS;
> +
> +               ops->start(dev, 1, flags);

Check error here. Is the intent to start the watchdog and force it to
reset the machine?

> +               while (1)
> +                       ;

Can you use hang() here?

> +       }
> +
> +       return 0;
> +}
> +
> +UCLASS_DRIVER(wdt) = {
> +       .id             = UCLASS_WDT,
> +       .name           = "wdt",
> +};
> diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
> index 8c92d0b030..b73a7fd436 100644
> --- a/include/dm/uclass-id.h
> +++ b/include/dm/uclass-id.h
> @@ -83,6 +83,7 @@ enum uclass_id {
>         UCLASS_VIDEO,           /* Video or LCD device */
>         UCLASS_VIDEO_BRIDGE,    /* Video bridge, e.g. DisplayPort to LVDS */
>         UCLASS_VIDEO_CONSOLE,   /* Text console driver for video device */
> +       UCLASS_WDT,             /* Watchdot Timer driver */
>
>         UCLASS_COUNT,
>         UCLASS_INVALID = -1,
> diff --git a/include/wdt.h b/include/wdt.h
> new file mode 100644
> index 0000000000..1da5a962df
> --- /dev/null
> +++ b/include/wdt.h
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#ifndef _WDT_H_
> +#define _WDT_H_
> +
> +/*
> + * Start the timer
> + *
> + * @dev: WDT Device
> + * @timeout: Number of ticks before timer expires
> + * @flags: Driver specific flags. This might be used to specify
> + * which action needs to be executed when the timer expires
> + * @return: 0 if OK, -ve on error
> + */
> +int wdt_start(struct udevice *dev, u64 timeout, ulong flags);
> +
> +/*
> + * Stop the timer
> + *

What does stopping the timer mean? Does it pause so that the watchdog
is now disabled? If so, how to enable it again?

> + * @dev: WDT Device
> + * @return: 0 if OK, -ve on error
> + */
> +int wdt_stop(struct udevice *dev);
> +
> +/*
> + * Restart the timer, typically restoring the counter to
> + * the value configured by start()
> + *
> + * @dev: WDT Device
> + * @return: 0 if OK, -ve on error
> + */
> +int wdt_restart(struct udevice *dev);

At present in U-Boot this operation is called 'reset'. It might be
better to keep the same name.

> +
> +/*
> + * Expire the timer, thus executing its action immediately
> + *
> + * Will either use chosen wdt, based on reset-wdt
> + * chosen property, or the first one available.

What does this refer to? Also, the function title is a little vague.
Perhaps somewhere you should include that it may (for example) reset
the board?

> + *
> + * @flags: Driver specific flags
> + * @return 0 if OK -ve on error. If wdt action is system reset,
> + * this function may never return.

This doesn't seem to match the args.

> + */
> +int wdt_reset(struct udevice *dev, ulong flags);
> +
> +/*
> + * struct wdt_ops - Driver model wdt operations
> + *
> + * The uclass interface is implemented by all wdt devices which use
> + * driver model.
> + */
> +struct wdt_ops {
> +       /*
> +        * Start the timer
> +        *
> +        * @dev: WDT Device
> +        * @timeout: Number of ticks before the timer expires
> +        * @flags: Driver specific flags. This might be used to specify
> +        * which action needs to be executed when the timer expires
> +        * @return: 0 if OK, -ve on error
> +        */
> +       int (*start)(struct udevice *dev, u64 timeout, ulong flags);
> +       /*
> +        * Stop the timer
> +        *
> +        * @dev: WDT Device
> +        * @return: 0 if OK, -ve on error
> +        */
> +       int (*stop)(struct udevice *dev);
> +       /*
> +        * Restart the timer, typically restoring the counter to
> +        * the value configured by start()
> +        *
> +        * @dev: WDT Device
> +        * @return: 0 if OK, -ve on error
> +        */
> +       int (*restart)(struct udevice *dev);
> +       /*
> +        * Expire the timer, thus executing the action immediately (optional)
> +        *
> +        * If this function is not provided, default implementation

a default

> +        * will be used for wdt_reset(), which is set the counter to 1

s/set/sets/

> +        * and wait forever. This is good enough for system level

a system-level

> +        * reset, but not good enough for resetting peripherals.

Why not? I don't really understand this bit.

> +        *
> +        * @dev: WDT Device
> +        * @flags: Driver specific flags
> +        * @return 0 if OK -ve on error. May not return.
> +        */
> +       int (*reset)(struct udevice *dev, ulong flags);
> +};
> +
> +#endif  /* _WDT_H_ */
> --
> 2.12.0.367.g23dc2f6d3c-goog
>

Regards,
Simon
