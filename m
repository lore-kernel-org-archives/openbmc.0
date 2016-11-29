Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wj0-x241.google.com (mail-wj0-x241.google.com
 [IPv6:2a00:1450:400c:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzXT67vBzDvnR
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m0lGgmiZ"; 
 dkim-atps=neutral
Received: by mail-wj0-x241.google.com with SMTP id xy5so20049349wjc.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=08D0pSa1o3cNwj9TjgOBtG5swL5fcuodFlYYF8jYdHE=;
 b=m0lGgmiZ9YQAlrjzShaHS3Te2xoGJ7PxX3vZEqHSK66qYVldiFe5K6+Orb3iBEKOue
 bNVmeWsv+bNs/eax1KoSUqqIzvfI2sUyOBpvmqfggWnHaiyunDo+369BWfs3FeQgiVYF
 v//CWOGjvVWp4nipGPkwJGE2dKYNDZRCFzBhEdiuojHX0eCSJOczLjXerQIKvlLWwObh
 EOfy3nuemMZlTvivl8W7rKjYxZ+8PaittzTyQRf7ugne71+YXB+5+Qxtzzb1lchtfL5M
 cuyFUwr+c/qkC8WgHjtlVqANV2d17nPlDwPUGAwWLBvYKdzQRoIbCt/fRfYQduCgMafN
 +uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=08D0pSa1o3cNwj9TjgOBtG5swL5fcuodFlYYF8jYdHE=;
 b=ioh6ExC4c6iukH6CUKLNJWm4aWtWIV5CHFisvfNnUnGVYaguX17gujZoNAWgOYDIRB
 ATrRm7/evwc2adtAA6wspkuQ4gV+QzO6ia3XriP+/+t/ROdX++RM2u+B0uklw/EaIfoi
 /Xi8nHIG5QqJ01dsIewmVxivqXKnBRj3GrOiR1CVVQF1de1T8M1WahJu9iEG8SeFF8lT
 3Kc0eTx8wWnOMlBNAcdkdP4OdEvRWReCrLTi06RPznKv82/D743+7/3b5SRER7cuC71v
 1hMLkwSmVkH+axCw0d0xaOURx0Yvj516Nnkna5B5z2s5P+0nqSqpg6uGRoOKG72ZWTm+
 35Tg==
X-Gm-Message-State: AKaTC02VPFRfrJN83ZM06fyWgo/Se1gHfxCe66i2AhRr+ZxZXI0J/uRjkIId/nvxFMC6n3bP3GgQEwDiGQXDaQ==
X-Received: by 10.194.169.227 with SMTP id ah3mr25428143wjc.2.1480460406701;
 Tue, 29 Nov 2016 15:00:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Tue, 29 Nov 2016 15:00:06 -0800 (PST)
In-Reply-To: <a8d6f13b45861401ffc6ea5b2e1d89519301483a.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <a8d6f13b45861401ffc6ea5b2e1d89519301483a.1478835488.git.andrew@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 29 Nov 2016 17:00:06 -0600
Message-ID: <CALpMbd=eu5gmjZ_-5mt0mkXs+RKXVjQ6ddLXmYzawa4PJJob9A@mail.gmail.com>
Subject: Re: [RFC PATCH linux 6/9] hwmon: occ: Add hwmon implementation for
 the P8 OCC
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
X-List-Received-Date: Tue, 29 Nov 2016 23:00:10 -0000

Hi Andrew,

One comment on this one.

Thanks,
Eddie

On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/occ/Kconfig      |  14 +++++
>  drivers/hwmon/occ/Makefile     |   1 +
>  drivers/hwmon/occ/occ_p8_i2c.c | 133 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
>
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index cdb64a71af6e..085e1f370c42 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -13,3 +13,17 @@ menuconfig SENSORS_PPC_OCC
>
>           This driver can also be built as a module. If so, the module
>           will be called occ.
> +
> +if SENSORS_PPC_OCC
> +
> +config SENSORS_PPC_OCC_P8_I2C
> +       tristate "POWER8 OCC hwmon support"
> +       depends on I2C
> +       help
> +         Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
> +         exposing temperature, frequency and power measurements.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called occ-p8-i2c.
> +
> +endif
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index a6881f93067c..05a84e987127 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
> +obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
> diff --git a/drivers/hwmon/occ/occ_p8_i2c.c b/drivers/hwmon/occ/occ_p8_i2c.c
> new file mode 100644
> index 000000000000..1b66f302fe16
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8_i2c.c
> @@ -0,0 +1,133 @@
> +/*
> + * occ_p8_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
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
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#include "scom.h"
> +#include "occ_scom_i2c.h"
> +#include "occ_p8.h"
> +#include "occ_sysfs.h"
> +
> +#define OCC_I2C_NAME   "occ-p8-i2c"
> +
> +static char *caps_sensor_names[] = {
> +       "curr_powercap",
> +       "curr_powerreading",
> +       "norm_powercap",
> +       "max_powercap",
> +       "min_powercap",
> +       "user_powerlimit"
> +};

Does it make more sense to define this in the P8 callbacks code?

> +
> +int p8_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> +       /* P8 i2c slave requires address to be shifted by 1 */
> +       address = address << 1;
> +
> +       return occ_i2c_getscom(bus, address, data, offset);
> +}
> +
> +int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +       /* P8 i2c slave requires address to be shifted by 1 */
> +       address = address << 1;
> +
> +       return occ_i2c_putscom(bus, address, data0, data1);
> +}
> +
> +static struct occ_bus_ops p8_bus_ops = {
> +       .getscom = p8_i2c_getscom,
> +       .putscom = p8_i2c_putscom,
> +};
> +
> +static struct occ_sysfs_config p8_sysfs_config = {
> +       .num_caps_fields = ARRAY_SIZE(caps_sensor_names),
> +       .caps_names = caps_sensor_names,
> +};

Same as above for this structure.

> +
> +static int occ_p8_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct occ *occ;
> +       struct occ_sysfs *hwmon;
> +
> +       occ = occ_p8_start(&client->dev, client, p8_bus_ops);
> +       if (IS_ERR(occ))
> +               return PTR_ERR(occ);
> +
> +       hwmon = occ_sysfs_start(&client->dev, occ, &p8_sysfs_config);

I see why you defined those here. But I guess I don't see why
occ_sysfs_config has to be separate from occ_config structure. It
could be populated in occ_p8_start and then passed to occ_sysfs_start
here.

> +       if (IS_ERR(hwmon))
> +               return PTR_ERR(hwmon);
> +
> +       i2c_set_clientdata(client, hwmon);
> +
> +       return 0;
> +}
> +
> +static int occ_p8_remove(struct i2c_client *client)
> +{
> +       return occ_p8_stop(i2c_get_clientdata(client));
> +}
> +
> +/* used by old-style board info. */
> +static const struct i2c_device_id occ_ids[] = {
> +       { OCC_I2C_NAME, 0 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, occ_ids);
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] = {
> +       { .compatible = "ibm,occ-p8-i2c" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, occ_of_match);
> +
> +/*
> + * i2c-core uses i2c-detect() to detect device in below address list.
> + * If exists, address will be assigned to client.
> + * It is also possible to read address from device table.
> + */
> +static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
> +
> +static struct i2c_driver occ_p8_driver = {
> +       .class = I2C_CLASS_HWMON,
> +       .driver = {
> +               .name = OCC_I2C_NAME,
> +               .pm = NULL,
> +               .of_match_table = occ_of_match,
> +       },
> +       .probe = occ_p8_probe,
> +       .remove = occ_p8_remove,
> +       .id_table = occ_ids,
> +       .address_list = normal_i2c,
> +};
> +
> +module_i2c_driver(occ_p8_driver);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
> +MODULE_LICENSE("GPL");
> --
> 2.9.3
>
