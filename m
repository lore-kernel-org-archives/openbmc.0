Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eysld/q7"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS9HN6p8vzDr5Q
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 14:17:04 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id g70so4746086lfl.3
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 20:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=920zAtzuOLcenyXcKLHCmidVAhxraKTxbP4ur2yZxSs=;
 b=eysld/q7Mw+sFoQ5OPsVa+cW6AVJQA6Szmt7Ic8glmxxX8w3YKEpeS8Wr/wlPMY2i9
 EjWvIBWPZearPVWS2Wd3GHr8fgwxIXgebnu9uUtZb0mNDoR8RHDCVkF8f5yw5TH6f3Ny
 aVK0jd/F6gaNsq2LqTUodZPyvLr3xzXnaRER3WDUJifq6GyXtk+DsWD1ffVGnDumun9D
 cDjE/9mVwOioDNrduy5Sr1GB6AIrooGT43jzLVKjIhWYapPJWpHIQ/RML1ssVChu9Kh7
 xgX8mU94lCY9WTCyYP0eaG7tJ1l2IWapPcdT6o5AkFU2RVLOI5NJQIN+yGWzKOt5krik
 gSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=920zAtzuOLcenyXcKLHCmidVAhxraKTxbP4ur2yZxSs=;
 b=f9wrXaaiOAfHUMAvF9FCrFJLhGnIfDcdY6NRh4ltIj6I8cmnadjU3xuTyH1sHDI+pw
 yz8pxVQhj0C9+/2OgBNMFntBi4aboEi1tOyOOFX1Dz9/PpWiE+DRD4VL/c+V/24F1km6
 22cDmbX3Gz/IvJ7tnmW72wYl0vI0OxlHcfCGu60779zq5m4dZOWnVkYDlAABJrmfZFW8
 TEz/sdO0zAgo6EwWweU9m/yfzK3gQqoQTtNH7GktmY6YjAZgouj972zt0U8i1o/SXPTN
 eHQSg9Sl/aH8WwUbUk9kQHu+xSiT6ZTo5rBDRIdzeSQbgNlNuoa1G/QcQYo37toWUZ2r
 5Meg==
X-Gm-Message-State: AJaThX7fJQRk/xdQMETf6NyspQ+jkWnUoaYgGxO+Xric2NBkix2D00tX
 2qI6vBVSDUnzkbEHh7QQUfgZXMbdcSYLZ3cCgoP/Zg==
X-Google-Smtp-Source: ABhQp+QhrPf5mpsFDcrdvA1rmUyAaQCj9qaunU8vQj9HxPktM+hol/CJNQAJRPnXusa0jLp9u+e4ux+2grhKaPu+LOI=
X-Received: by 10.25.233.81 with SMTP id g78mr677105lfh.197.1509592620928;
 Wed, 01 Nov 2017 20:17:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Wed, 1 Nov 2017 20:16:40 -0700 (PDT)
In-Reply-To: <1509589459-26637-1-git-send-email-mine260309@gmail.com>
References: <1509589459-26637-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Nov 2017 13:46:40 +1030
X-Google-Sender-Auth: YgShXe65pwACrjAFueMqeR5RaGQ
Message-ID: <CACPK8XeG=xBE9+atAWJWV32zX5JPfgo2OvtjMomCH+CR9LUH=g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/3] drivers: hwmon: Add W83773G driver
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Nov 2017 03:17:06 -0000

On Thu, Nov 2, 2017 at 12:54 PM, Lei YU <mine260309@gmail.com> wrote:
> Nuvoton W83773G is a hardware monitor IC providing one local
> temperature and two remote temperature sensors.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Great work. Please send v2 upstream; you can find the email addresses
to use by using ./scripts/get_maintainers.pl

I've got some trivial comments below.

> ---
>  drivers/hwmon/Kconfig   |  11 ++
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/w83773g.c | 284 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 296 insertions(+)
>  create mode 100644 drivers/hwmon/w83773g.c
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9256dd0..40dfa93 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1703,6 +1703,17 @@ config SENSORS_VT8231
>           This driver can also be built as a module.  If so, the module
>           will be called vt8231.
>
> +config SENSORS_W83773G
> +       tristate "Nuvoton W83773G"
> +       depends on I2C
> +       select HWMON_VID
> +       help
> +         If you say yes here you get support for the Nuvoton W83773G hardware
> +         monitoring chip.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called w83773g.
> +
>  config SENSORS_W83781D
>         tristate "Winbond W83781D, W83782D, W83783S, Asus AS99127F"
>         depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 98000fc..fc26696 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ATK0110) += asus_atk0110.o
>  # asb100, then w83781d go first, as they can override other drivers' addresses.
>  obj-$(CONFIG_SENSORS_ASB100)   += asb100.o
>  obj-$(CONFIG_SENSORS_W83627HF) += w83627hf.o
> +obj-$(CONFIG_SENSORS_W83773G)  += w83773g.o
>  obj-$(CONFIG_SENSORS_W83792D)  += w83792d.o
>  obj-$(CONFIG_SENSORS_W83793)   += w83793.o
>  obj-$(CONFIG_SENSORS_W83795)   += w83795.o
> diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
> new file mode 100644
> index 0000000..87cc85c
> --- /dev/null
> +++ b/drivers/hwmon/w83773g.c
> @@ -0,0 +1,284 @@
> +/* w83773g.c
> + *
> + * Copyright (C) 2017 <ngruend@us.ibm.com>
> + * Preliminary support by:
> + * Nick Gruendler, Lei YU

Take a look at the other IBM copyright headers. Usually we write:

Copyright (C) 2017 IBM Corp

And optionally put your name after that.


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
> +/*
> + * Driver for the Nuvoton W83773G SMBus temperature sensor IC.
> + * Supported models: W83773G
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/sysfs.h>
> +
> +/* Addresses to scan */
> +static const unsigned short normal_i2c[] = { 0x4c, 0x4d, I2C_CLIENT_END };
> +
> +enum chips { w83773g };
> +
> +/* The W83773 registers */
> +#define W83773_CONVERSION_RATE_REG_READ 0x04
> +#define W83773_CONVERSION_RATE_REG_WRITE 0x0A
> +#define W83773_MANUFACTURER_ID_REG 0xFE
> +#define W83773_LOCAL_TEMP 0x00
> +
> +static const u8 W83773_STATUS[2] = { 0x02, 0x17 };
> +
> +static const u8 W83773_TEMP_LSB[2] = { 0x10, 0x25 };
> +static const u8 W83773_TEMP_MSB[2] = { 0x01, 0x24 };
> +
> +static const u8 W83773_OFFSET_LSB[2] = { 0x12, 0x16 };
> +static const u8 W83773_OFFSET_MSB[2] = { 0x11, 0x15 };
> +
> +/* Manufacturer / Device ID's */
> +#define W83773_MANUFACTURER_ID                 0x5c
> +
> +
> +/* this is the number of sensors in the device */
> +static const struct i2c_device_id w83773_id[] = {
> +       { "w83773g", 3 },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, w83773_id);
> +
> +static const struct of_device_id w83773_of_match[] = {
> +       {
> +               .compatible = "nuvoton,w83773g",
> +               .data = (void *)3
> +       },
> +
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, w83773_of_match);
> +
> +/*
> + * W83773G has 3 temp sensors:
> + *   Channel 0 is the local sensor
> + *   Channel 1-2 are two remote sensors
> + */
> +struct w83773_data {
> +       struct i2c_client *client;
> +       struct mutex update_lock;
> +       u32 temp_config[4];
> +       struct hwmon_channel_info temp_info;
> +       const struct hwmon_channel_info *info[2];
> +       struct hwmon_chip_info chip;
> +       char valid;

this looks like a boolean, use the 'bool' type.


> +       unsigned long last_updated;
> +       int channels;
> +       s8 temp_local;
> +       s8 status[2];
> +       s8 temp_hb[2];
> +       s8 temp_lb[2];
> +       s8 offset_hb[2];
> +       s8 offset_lb[2];
> +};
> +
> +static int temp_of_local(s8 reg)
> +{
> +       return reg * 1000;
> +}
> +
> +static int temp_of_remote(s8 hb, s8 lb, s8 offset_hb, s8 offset_lb)

You're putting this in a long, so use that as your return type.

> +{
> +       return (hb + offset_hb) * 1000 + ((u8)(lb + offset_lb) >> 5) * 125;

Why the cast?

> +}
> +
> +
> +static struct w83773_data *w83773_update_device(struct device *dev)
> +{
> +       struct w83773_data *data = dev_get_drvdata(dev);
> +       struct i2c_client *client = data->client;
> +       int i;
> +
> +       mutex_lock(&data->update_lock);
> +
> +       if (time_after(jiffies, data->last_updated + 2 * HZ) || !data->valid) {
> +               data->temp_local = i2c_smbus_read_byte_data(client, W83773_LOCAL_TEMP);
> +               for (i = 0; i < data->channels - 1; i++) {
> +                       data->status[i] = i2c_smbus_read_byte_data(client, W83773_STATUS[i]);
> +                       data->temp_hb[i] = i2c_smbus_read_byte_data(client, W83773_TEMP_MSB[i]);
> +                       data->temp_lb[i] = i2c_smbus_read_byte_data(client, W83773_TEMP_LSB[i]);
> +                       data->offset_hb[i] = i2c_smbus_read_byte_data(client, W83773_OFFSET_MSB[i]);
> +                       data->offset_lb[i] = i2c_smbus_read_byte_data(client, W83773_OFFSET_LSB[i]);
> +               }
> +               data->last_updated = jiffies;
> +               data->valid = 1;
> +       }
> +
> +       mutex_unlock(&data->update_lock);
> +
> +       return data;
> +}
> +
> +static int w83773_read(struct device *dev, enum hwmon_sensor_types type,
> +                       u32 attr, int channel, long *val)
> +{
> +       struct w83773_data *w83773 = w83773_update_device(dev);
> +
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               if (channel == 0) {
> +                       /* channel 0 is the local temp */
> +                       *val = temp_of_local(w83773->temp_local);
> +               }
> +               else {
> +                       /* channel 1-2 are the remote temps */
> +                       channel--;
> +                       *val = temp_of_remote(
> +                               w83773->temp_hb[channel],
> +                               w83773->temp_lb[channel],
> +                               w83773->offset_hb[channel],
> +                               w83773->offset_lb[channel]);
> +               }
> +               return 0;
> +       case hwmon_temp_fault:
> +               if (channel == 0)
> +                       *val = 0;
> +               else
> +                       /* Check the status register bit 2 for faults */
> +                       *val = (w83773->status[channel - 1] & 0x04) >> 2;
> +               return 0;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +}
> +
> +static umode_t w83773_is_visible(const void *data, enum hwmon_sensor_types type,
> +                                u32 attr, int channel)
> +{
> +       switch (attr) {
> +       case hwmon_temp_fault:
> +               if (channel == 0)
> +                       return 0;
> +               return S_IRUGO;
> +       case hwmon_temp_input:
> +               return S_IRUGO;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int w83773_init_client(struct i2c_client *client)
> +{
> +       /* Set the conversion rate to 2 Hz */
> +       i2c_smbus_write_byte_data(client, W83773_CONVERSION_RATE_REG_WRITE, 0x05);
> +
> +       return 0;
> +}
> +
> +static int w83773_detect(struct i2c_client *client,
> +                        struct i2c_board_info *info)
> +{
> +       enum chips kind;
> +       struct i2c_adapter *adapter = client->adapter;
> +       const char * const names[] = { "W83773G" };
> +       int addr = client->addr;
> +       u8 reg;
> +
> +       if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +               return -ENODEV;
> +
> +       reg = i2c_smbus_read_byte_data(client, W83773_MANUFACTURER_ID_REG);
> +       if (reg != W83773_MANUFACTURER_ID)
> +               return -ENODEV;
> +
> +       reg = i2c_smbus_read_byte_data(client, W83773_CONVERSION_RATE_REG_READ);
> +       if (reg & 0xf8)
> +               return -ENODEV;
> +
> +       kind = w83773g;
> +
> +       strlcpy(info->type, w83773_id[kind].name, I2C_NAME_SIZE);
> +       dev_info(&adapter->dev, "Detected Nuvoton %s chip at 0x%02x\n",
> +                names[kind], client->addr);
> +
> +       return 0;
> +}
> +
> +static const struct hwmon_ops w83773_ops = {
> +       .is_visible = w83773_is_visible,
> +       .read = w83773_read,
> +};
> +
> +static int w83773_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct device *hwmon_dev;
> +       struct w83773_data *data;
> +       int i, err;
> +
> +       data = devm_kzalloc(dev, sizeof(struct w83773_data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       mutex_init(&data->update_lock);
> +       if (client->dev.of_node)
> +               data->channels = (int)of_device_get_match_data(&client->dev);
> +       else
> +               data->channels = id->driver_data;
> +       data->client = client;
> +
> +       err = w83773_init_client(client);
> +       if (err)
> +               return err;
> +
> +       for (i = 0; i < data->channels; i++)
> +               data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> +
> +       data->chip.ops = &w83773_ops;
> +       data->chip.info = data->info;
> +
> +       data->info[0] = &data->temp_info;
> +
> +       data->temp_info.type = hwmon_temp;
> +       data->temp_info.config = data->temp_config;
> +
> +       hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +                                                        data,
> +                                                        &data->chip,
> +                                                        NULL);
> +       return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct i2c_driver w83773_driver = {
> +       .class = I2C_CLASS_HWMON,
> +       .driver = {
> +               .name   = "w83773g",
> +               .of_match_table = of_match_ptr(w83773_of_match),
> +       },
> +       .probe = w83773_probe,
> +       .id_table = w83773_id,
> +       .detect = w83773_detect,
> +       .address_list = normal_i2c,
> +};
> +
> +module_i2c_driver(w83773_driver);
> +
> +MODULE_AUTHOR("Nickolaus Gruendler <ngruend@us.ibm.com>");
> +MODULE_DESCRIPTION("W83773G temperature sensor driver");
> +MODULE_LICENSE("GPL");
> --
> 1.9.1
>
