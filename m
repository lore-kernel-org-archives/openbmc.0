Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzY136trzDvnR
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:00:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bv3tHcnL"; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id u144so26706514wmu.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AmU0XEPXkUre0wWBsWOtroCFl5DeseTevUY3Ghnuu9g=;
 b=bv3tHcnLH6H+s+DohZrpJFCGqzHtOK7+XSYIV5GYfcGVyvQoa0IXB96L/R0F4NSI3e
 xptEydpbKXelLILn4Ip5rncychhQfSWIYP6zU4zTHek4RILr+p+BcC+fkmmgzfFmN1z1
 MoGeD3/P9QmNd4/idNQE1UWf5LOzpHI7SnPkVVk4d1dSBubitvN/CseHk4C65n4JJDWC
 p+/t7OMtR//jvNb2q5kRO4NnzjWN+xJTjaFmP6hoRvjjg8kcttr5JBmFz2WTEodixjjV
 5YegzE8sbt1k3gTKgIrzDfos2OyEYffePT2tD2TcgYl1SYqvzmDRaaZKYk2nOm639bjt
 q9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AmU0XEPXkUre0wWBsWOtroCFl5DeseTevUY3Ghnuu9g=;
 b=KvZNXuqdU3Zg7zRR9yLPlVSCNTVz7Lmq5xEB+lR7pLGgTroqMGiIlwC95h9J5uhvBa
 N5wQH6V27PclAZhHQumz8KiLCmETF1vraObeHz9vQPTDS5ffyFUM+RHEZun9gH1MJBSK
 Rbebe+3gZNe1oJrs5uGAJknBeUH4tueIr1aFYJoaaxXtaM8vhbOsmxqIultV+HFMqsp3
 Z8Jl/u6P3UyHdI5R8ST9b1TxYkZfGLTQ0CesRjP5eaKlYPvjJVvia2JYu408Rym6ytpA
 yR6fiVrDnGG35guPMD8DyzX1+WVxBKa+EGS+tHp79pEXQTmaabXVZ35YqpAZdjJuAbQm
 wLSg==
X-Gm-Message-State: AKaTC02jn7TkZ1FRRLQPIXVaUjOyYO5Pva8hUTxZjQ9G+jj3pXfb7TwRM06/ljP52IihYb1wT/CHVMyn7kGaYg==
X-Received: by 10.28.21.1 with SMTP id 1mr28244314wmv.133.1480460434822; Tue,
 29 Nov 2016 15:00:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Tue, 29 Nov 2016 15:00:34 -0800 (PST)
In-Reply-To: <89c567400dbd58b02a90720004eacb27d5c58ed1.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <89c567400dbd58b02a90720004eacb27d5c58ed1.1478835488.git.andrew@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 29 Nov 2016 17:00:34 -0600
Message-ID: <CALpMbdnqzBsmEnGV6vZCQkxTFH8z57OnGsG5Sz2+UwSKhMfQfg@mail.gmail.com>
Subject: Re: [RFC PATCH linux 9/9] wip: hwmon: occ: Add sketch of the hwmon
 implementation for the P9 OCC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
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
X-List-Received-Date: Tue, 29 Nov 2016 23:00:38 -0000

Hi Andrew,

Looks pretty good. Do we need to get this finalized before getting
into our kernel or submitting it upstream? I don't think the SBE or
FSI interfaces are nailed down, are they?

Eddie

On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/occ/Kconfig      |  9 ++++
>  drivers/hwmon/occ/Makefile     |  1 +
>  drivers/hwmon/occ/occ_p9_fsi.c | 93 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c
>
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index 085e1f370c42..97b97b391bf9 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -26,4 +26,13 @@ config SENSORS_PPC_OCC_P8_I2C
>           This driver can also be built as a module. If so, the module will be
>           called occ-p8-i2c.
>
> +config SENSORS_PPC_OCC_P9_FSI
> +       tristate "POWER9 OCC hwmon support"
> +       help
> +         Provide a hwmon sysfs interface for the POWER9 On-Chip Controller,
> +         exposing temperature, frequency and power measurements.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called occ-p9-fsi.
> +
>  endif
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index 05a84e987127..77e47e10195e 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
>  obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
> +obj-$(CONFIG_SENSORS_PPC_OCC_P9_FSI) += occ_p9.o occ_p9_fsi.o
> diff --git a/drivers/hwmon/occ/occ_p9_fsi.c b/drivers/hwmon/occ/occ_p9_fsi.c
> new file mode 100644
> index 000000000000..2f651d1b16bf
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9_fsi.c
> @@ -0,0 +1,93 @@
> +/*
> + * occ_p9_fsi.c - hwmon OCC driver
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#include "scom.h"
> +#include "occ_p9.h"
> +#include "occ_sysfs.h"
> +
> +#define OCC_I2C_NAME   "occ-p9-fsi"
> +
> +static char *caps_sensor_names[] = {
> +       "curr_powercap",
> +       "curr_powerreading",
> +       "norm_powercap",
> +       "max_powercap",
> +       "min_powercap",
> +       "user_powerlimit"
> +};
> +
> +int p9_fsi_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> +       return -SCOM_READ_ERROR;
> +}
> +
> +int p9_fsi_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +       return -SCOM_WRITE_ERROR;
> +}
> +
> +static struct occ_bus_ops p9_bus_ops = {
> +       .getscom = p9_fsi_getscom,
> +       .putscom = p9_fsi_putscom,
> +};
> +
> +static struct occ_sysfs_config p9_sysfs_config = {
> +       .num_caps_fields = ARRAY_SIZE(caps_sensor_names),
> +       .caps_names = caps_sensor_names,
> +};
> +
> +int occ_p9_probe(struct device *dev, void *client)
> +{
> +       struct occ *occ;
> +       struct occ_sysfs *hwmon;
> +
> +       occ = occ_p9_start(dev, client, p9_bus_ops);
> +       if (IS_ERR(occ))
> +               return PTR_ERR(occ);
> +
> +       hwmon = occ_sysfs_start(dev, occ, &p9_sysfs_config);
> +       if (IS_ERR(hwmon))
> +               return PTR_ERR(hwmon);
> +
> +       return 0;
> +}
> +
> +int occ_p9_remove(void)
> +{
> +       struct occ *occ = NULL;
> +
> +       return occ_p9_stop(occ);
> +}
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] = {
> +       { .compatible = "ibm,occ-p9-fsi" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, occ_of_match);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
> +MODULE_LICENSE("GPL");
> --
> 2.9.3
>
