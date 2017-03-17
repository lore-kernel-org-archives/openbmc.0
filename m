Return-Path: <lukma@denx.de>
X-Greylist: delayed 384 seconds by postgrey-1.36 at bilbo;
 Fri, 17 Mar 2017 19:48:05 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkzWT4rBkzDqZJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 19:48:05 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 3vkzMk59y8z3hmlj;
 Fri, 17 Mar 2017 09:41:22 +0100 (CET)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 3vkzMk47B6z3hhV7;
 Fri, 17 Mar 2017 09:41:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id T5i7gnuO4iDp; Fri, 17 Mar 2017 09:41:19 +0100 (CET)
X-Auth-Info: S9lpLv/ohI0e1zTbDQe0nG7Emfm2CSCFeMiia56w2RY=
Received: from jawa (89-77-92-62.dynamic.chello.pl [89.77.92.62])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 17 Mar 2017 09:41:19 +0100 (CET)
Date: Fri, 17 Mar 2017 09:41:18 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Maxim Sloyko <maxims@google.com>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot] [PATCH 02/17] dm: Simple Watchdog uclass
Message-ID: <20170317094118.76279295@jawa>
In-Reply-To: <20170316213624.140344-3-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-3-maxims@google.com>
Organization: denx.de
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Mar 2017 13:51:35 +1100
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
X-List-Received-Date: Fri, 17 Mar 2017 08:48:06 -0000

Hi Maxim,

> This is a simple uclass for Watchdog Timers. It has four operations:
> start, restart, reset, stop. Drivers must implement start, restart and
> stop operations, while implementing reset is optional: It's default
> implementation expires watchdog timer in one clock tick.
> 
> Signed-off-by: Maxim Sloyko <maxims@google.com>

Reviewed-by: Lukasz Majewski <lukma@denx.de>

> ---
> 
>  drivers/watchdog/Kconfig      | 11 +++++
>  drivers/watchdog/Makefile     |  1 +
>  drivers/watchdog/wdt-uclass.c | 79
> +++++++++++++++++++++++++++++++++++ include/dm/uclass-id.h        |
> 1 + include/wdt.h                 | 97
> +++++++++++++++++++++++++++++++++++++++++++ 5 files changed, 189
> insertions(+) create mode 100644 drivers/watchdog/wdt-uclass.c
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
> +	bool "Enable driver model for watchdog timer drivers"
> +	depends on DM
> +	help
> +	  Enable driver model for watchdog timer. At the moment the
> API
> +	  is very simple and only supports four operations:
> +	  start, restart, stop and reset (expire immediately).
> +	  What exactly happens when the timer expires is up to a
> particular
> +	  device/driver.
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index a007ae8234..1aabcb97ae 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_XILINX_TB_WATCHDOG) += xilinx_tb_wdt.o
>  obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
>  obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
>  obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
> +obj-$(CONFIG_WDT) += wdt-uclass.o
> diff --git a/drivers/watchdog/wdt-uclass.c
> b/drivers/watchdog/wdt-uclass.c new file mode 100644
> index 0000000000..98a8b529f9
> --- /dev/null
> +++ b/drivers/watchdog/wdt-uclass.c
> @@ -0,0 +1,79 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <errno.h>
> +#include <wdt.h>
> +#include <dm/lists.h>
> +#include <dm/device-internal.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +/*
> + * Implement a simple watchdog uclass. Watchdog is basically a timer
> that
> + * is used to detect or recover from malfunction. During normal
> operation
> + * the watchdog would be regularly reset to prevent it from timing
> out.
> + * If, due to a hardware fault or program error, the computer fails
> to reset
> + * the watchdog, the timer will elapse and generate a timeout signal.
> + * The timeout signal is used to initiate corrective action or
> actions,
> + * which typically include placing the system in a safe, known state.
> + */
> +
> +int wdt_start(struct udevice *dev, u64 timeout, ulong flags)
> +{
> +	const struct wdt_ops *ops = device_get_ops(dev);
> +
> +	if (!ops->start)
> +		return -ENOSYS;
> +
> +	return ops->start(dev, timeout, flags);
> +}
> +
> +int wdt_stop(struct udevice *dev)
> +{
> +	const struct wdt_ops *ops = device_get_ops(dev);
> +
> +	if (!ops->stop)
> +		return -ENOSYS;
> +
> +	return ops->stop(dev);
> +}
> +
> +int wdt_restart(struct udevice *dev)
> +{
> +	const struct wdt_ops *ops = device_get_ops(dev);
> +
> +	if (!ops->restart)
> +		return -ENOSYS;
> +
> +	return ops->restart(dev);
> +}
> +
> +int wdt_reset(struct udevice *dev, ulong flags)
> +{
> +	const struct wdt_ops *ops;
> +
> +	debug("WDT Resettting: %lu\n", flags);
> +	ops = device_get_ops(dev);
> +	if (ops->reset) {
> +		return ops->reset(dev, flags);
> +	} else {
> +		if (!ops->start)
> +			return -ENOSYS;
> +
> +		ops->start(dev, 1, flags);
> +		while (1)
> +			;
> +	}
> +
> +	return 0;
> +}
> +
> +UCLASS_DRIVER(wdt) = {
> +	.id		= UCLASS_WDT,
> +	.name		= "wdt",
> +};
> diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
> index 8c92d0b030..b73a7fd436 100644
> --- a/include/dm/uclass-id.h
> +++ b/include/dm/uclass-id.h
> @@ -83,6 +83,7 @@ enum uclass_id {
>  	UCLASS_VIDEO,		/* Video or LCD device */
>  	UCLASS_VIDEO_BRIDGE,	/* Video bridge, e.g.
> DisplayPort to LVDS */ UCLASS_VIDEO_CONSOLE,	/* Text console
> driver for video device */
> +	UCLASS_WDT,		/* Watchdot Timer driver */
>  
>  	UCLASS_COUNT,
>  	UCLASS_INVALID = -1,
> diff --git a/include/wdt.h b/include/wdt.h
> new file mode 100644
> index 0000000000..1da5a962df
> --- /dev/null
> +++ b/include/wdt.h
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
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
> +
> +/*
> + * Expire the timer, thus executing its action immediately
> + *
> + * Will either use chosen wdt, based on reset-wdt
> + * chosen property, or the first one available.
> + *
> + * @flags: Driver specific flags
> + * @return 0 if OK -ve on error. If wdt action is system reset,
> + * this function may never return.
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
> +	/*
> +	 * Start the timer
> +	 *
> +	 * @dev: WDT Device
> +	 * @timeout: Number of ticks before the timer expires
> +	 * @flags: Driver specific flags. This might be used to
> specify
> +	 * which action needs to be executed when the timer expires
> +	 * @return: 0 if OK, -ve on error
> +	 */
> +	int (*start)(struct udevice *dev, u64 timeout, ulong flags);
> +	/*
> +	 * Stop the timer
> +	 *
> +	 * @dev: WDT Device
> +	 * @return: 0 if OK, -ve on error
> +	 */
> +	int (*stop)(struct udevice *dev);
> +	/*
> +	 * Restart the timer, typically restoring the counter to
> +	 * the value configured by start()
> +	 *
> +	 * @dev: WDT Device
> +	 * @return: 0 if OK, -ve on error
> +	 */
> +	int (*restart)(struct udevice *dev);
> +	/*
> +	 * Expire the timer, thus executing the action immediately
> (optional)
> +	 *
> +	 * If this function is not provided, default implementation
> +	 * will be used for wdt_reset(), which is set the counter to
> 1
> +	 * and wait forever. This is good enough for system level
> +	 * reset, but not good enough for resetting peripherals.
> +	 *
> +	 * @dev: WDT Device
> +	 * @flags: Driver specific flags
> +	 * @return 0 if OK -ve on error. May not return.
> +	 */
> +	int (*reset)(struct udevice *dev, ulong flags);
> +};
> +
> +#endif  /* _WDT_H_ */




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
