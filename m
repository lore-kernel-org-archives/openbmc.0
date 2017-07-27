Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHvZs1jk6zDrD6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 11:31:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YrXcdegJ"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id s143so3807684ywg.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=N8Sp/Hul/VcW5ZGTSC2vV6ItN+taV4hef/FvbP4NSqM=;
 b=YrXcdegJOI791FrEXeDS7idMcSdgQZcknOUaT16EIowlddrlOe/g8UINPIyGJWxvir
 qzUCOm58pYCI9VFZSQRIhzF2YoEpsyT2hghX7WzHHyVVG3oIZS0HydogWq5PoJktbo0k
 69nDgZGraG44/cC9kCtcigX4g+DVQ/9KGS0Kv4lYyzXG3CEHDRkiVOSDDQtQk5wgixe7
 nuiniZuO0tbOUENQRuoWqyQf1PpJvmpfxroTadf4NB0EAXZafJ7+9+bIBIiZXdl8ZWUJ
 Y10kBHEQhyFYJPK12jvId9/UOsyaSIew3+xcdU2T7QhUpvIL+IonJrCKAnVZ7iGn5HUK
 AnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=N8Sp/Hul/VcW5ZGTSC2vV6ItN+taV4hef/FvbP4NSqM=;
 b=ATD2xrwXOcqBlJCZw/JwRKPxfb5kX2AoGoFC3jMMJkSyvB0Sobs9/QC0bki16rRsZB
 Dq8+6v1DOMAzmDvvI41U+kur6EoXUeSKZyAoX8cR1irK/HxHKSUAGZhfNq7ufKwHFQP5
 oLUBXsgaaZKp44o81cnPr5OVVeiHn8A9HnL660EA2+tpba4dig8pTgJ6Sqatxx0tUbcP
 ZEtGrdBV+iUFpMQ+ksDrKG6NlD5or9iegNWsUBD7Nsr1S7otEPrl4ItFfOtuxgV8GtPb
 hFicuNoRyfNt8Tb34IupNsb/TzmLN0J9IkAGUebJaqCnQyM7uz87PYFBmrvfBe0pRRZa
 vwPw==
X-Gm-Message-State: AIVw112hS4WndTRrkY/8yxAlgNoXZJOk/qhyF1cU/MFzXhpc6gZiUKTb
 dfvHFOJ1+hFY0DXaR/tHL9NvfQ4FAQ==
X-Received: by 10.129.211.12 with SMTP id y12mr2411102ywi.220.1501119091055;
 Wed, 26 Jul 2017 18:31:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 26 Jul 2017 18:31:10 -0700 (PDT)
In-Reply-To: <1501105213-13881-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501105213-13881-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jul 2017 11:01:10 +0930
X-Google-Sender-Auth: 4SqbiY6w4iA0ZRbSepbHwLYLnW0
Message-ID: <CACPK8Xc33U5Wu8EWmxnw0dJ9eEo2opDoykpDs2Mb606EpvgthA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/pmbus: Add IBM P178531 driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 27 Jul 2017 01:31:33 -0000

On Thu, Jul 27, 2017 at 7:10 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add the driver to monitor power supply with hwmon.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Very neat! Great work.

I assume there are no public datasheets for this one? Mention that in
your commit message if so.

Can you please post this to the upstream list? I want to get their
opinion on the fault clearing. I don't have a suggestion for an
alternative, unless we make this part of the pmbus core so that all
devices have a clear_fault sysfs knob.

Cheers,

Joel

> ---
>  drivers/hwmon/pmbus/Kconfig  | 10 ++++++
>  drivers/hwmon/pmbus/Makefile |  1 +
>  drivers/hwmon/pmbus/p17531.c | 81 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/p17531.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 68d717a..808ef2f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -125,6 +125,16 @@ config SENSORS_MAX8688
>           This driver can also be built as a module. If so, the module will
>           be called max8688.
>
> +config SENSORS_P17531
> +       tristate "IBM P17531"
> +       default n
> +       help
> +         If you say yes here you get hardware monitoring support for IBM
> +         P17531 power supply.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called p17531.
> +
>  config SENSORS_TPS40422
>         tristate "TI TPS40422"
>         default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 75bb7ca..f43628f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_MAX16064)        += max16064.o
>  obj-$(CONFIG_SENSORS_MAX20751) += max20751.o
>  obj-$(CONFIG_SENSORS_MAX34440) += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)  += max8688.o
> +obj-$(CONFIG_SENSORS_P17531)   += p17531.o
>  obj-$(CONFIG_SENSORS_TPS40422) += tps40422.o
>  obj-$(CONFIG_SENSORS_UCD9000)  += ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)  += ucd9200.o
> diff --git a/drivers/hwmon/pmbus/p17531.c b/drivers/hwmon/pmbus/p17531.c
> new file mode 100644
> index 0000000..ae6a19f
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/p17531.c
> @@ -0,0 +1,81 @@
> +/*
> + * Copyright 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info p17531_info = {
> +       .pages = 1,
> +       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +               PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> +               PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> +               PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> +};
> +
> +static ssize_t p17531_clear_fault(struct device *dev,
> +                                 struct device_attribute *dev_attr,
> +                                 const char *buf, size_t count)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +
> +       pmbus_clear_faults(client);
> +
> +       return count;
> +}
> +
> +static DEVICE_ATTR(clear_fault, 0200, NULL, p17531_clear_fault);
> +
> +static int p17531_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       int rc;
> +
> +       rc = pmbus_do_probe(client, id, &p17531_info);
> +       if (rc < 0)
> +               return rc;
> +
> +       rc = device_create_file(&client->dev, &dev_attr_clear_fault);
> +
> +       return rc;
> +}
> +
> +static int p17531_remove(struct i2c_client *client)
> +{
> +       device_remove_file(&client->dev, &dev_attr_clear_fault);
> +
> +       return pmbus_do_remove(client);
> +}
> +
> +enum chips { p17531 };
> +
> +static const struct i2c_device_id p17531_id[] = {
> +       { "p17531", p17531 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, p17531_id);
> +
> +static struct i2c_driver p17531_driver = {
> +       .driver = {
> +               .name = "p17531",
> +       },
> +       .probe = p17531_probe,
> +       .remove = p17531_remove,
> +       .id_table = p17531_id,
> +};
> +
> +module_i2c_driver(p17531_driver);
> +
> +MODULE_AUTHOR("Eddie James");
> +MODULE_DESCRIPTION("PMBus driver for IBM P17531");
> +MODULE_LICENSE("GPL");
> --
> 1.8.3.1
>
