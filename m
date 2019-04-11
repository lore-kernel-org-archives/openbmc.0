Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="A9pSiWXe"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gBj24MPNzDqNG
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 06:00:38 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y6so3894613pll.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKAYmsoM8fivfjogilvyz5rw2DRTiQty2w9zPwwOJQo=;
 b=A9pSiWXeiV7Ft+iESgFsW/I2lBFWr2nPox4wP/uD8LmTdfsxPQLFiHaUJsc7mkcRPU
 1DUpdlt5DDE+QP0OgdXzcHQ/INkpBfBFEp+lDX21eqPTIz7G65mCKM0m5qQ3wKwGDHC6
 p2EJ7+qFdV6wfoYOyApQo56e1PdezHQxYfk2+KMOwqtp8iAxAnCjMHSY8l/Q1Y3ahA1o
 OYjwNrI88A6wu5iPhi9y97iF8lucAf+O8W300k/23OrmijKa0hc6YRldrhhTEnMCLLkM
 UHWsZD42k0dJ7gFcnK80doBL2ACzFwbWJuBD5eCbfFxy46sA7tzpSDWgA78FwmsTvse1
 fLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKAYmsoM8fivfjogilvyz5rw2DRTiQty2w9zPwwOJQo=;
 b=PVkXGVrJh8vb9b3iyRnf10MwSBz1ASA0jPVNxCv2nmwfH/p1mWKzFSBHxgTgjV6zNz
 1YnfvApWjRje7QjNu+IasAZqKMq9TZVtEo07yI3YmUfdut5sPTMKdn7BLLQuOJK9OfAg
 a2YR/i5w9tvYeLotW1WCVi2zy5u4ZMoGpycM3fv6ArIZz4S5ClEYQn2wrLX2AW16ld0B
 N4nDDT9zFRCSQbHniHObHoXDat+Q2NDPEcshIyp9Jee1UD5HNpGVGmob9gxjmbnEVpVI
 jCmmG1/B6aNSZuslovIGGaRDQK+t0KquXMrzlKrxIlNfn2MFXguDjOg/Bu4O2i5zdWGR
 JGqw==
X-Gm-Message-State: APjAAAV/mtqtOrQCasCaT2TpFyrwVu86h+hb5JTiOo1nrtLut+jZZWbk
 zulWcex7nvWx7bR7Gy2i8uhJCBWRJ0O5YoDbcKCPcw==
X-Google-Smtp-Source: APXvYqxN91XYhXaLlezYZcvX7B/Kzziux75/InXO3abbzcgpc7r2ApTEu5t8kyT2igYvrvod5daCIA+bzrsJB0ZQSyc=
X-Received: by 2002:a17:902:407:: with SMTP id 7mr53192562ple.62.1555012834192; 
 Thu, 11 Apr 2019 13:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190411194557.65574-1-venture@google.com>
In-Reply-To: <20190411194557.65574-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 11 Apr 2019 13:00:23 -0700
Message-ID: <CAO=notzCNjd+0hHB4Hrm+D3Ej5+JXKKkKoM8+ZnApK=7BoHDnQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] hwmon: (pmbus/ir38064): Add driver for Infineon
 IR38064 Voltage Regulator
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 Apr 2019 20:00:39 -0000

On Thu, Apr 11, 2019 at 12:46 PM Patrick Venture <venture@google.com> wrote:
>
> From: Maxim Sloyko <maxims@google.com>
>
> Add the pmbus driver for the Infineon ir38064 voltage regulator.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  drivers/hwmon/pmbus/Kconfig   |  9 ++++++
>  drivers/hwmon/pmbus/Makefile  |  1 +
>  drivers/hwmon/pmbus/ir38064.c | 60 +++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/ir38064.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 15c197f1c4c4..b6c228a55da2 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -64,6 +64,15 @@ config SENSORS_ISL68137
>           This driver can also be built as a module. If so, the module will
>           be called isl68137.
>
> +config SENSORS_IR38064
> +       tristate "Infineon IR38064"
> +       help
> +         If you say yes here you get hardware monitoring support for Infineon
> +         IR38064.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called ir38064.
> +
>  config SENSORS_LM25066
>         tristate "National Semiconductor LM25066 and compatibles"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0684b35216da..8ee236b1d986 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1275)   += adm1275.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)        += ibm-cffps.o
>  obj-$(CONFIG_SENSORS_IR35221)  += ir35221.o
>  obj-$(CONFIG_SENSORS_ISL68137) += isl68137.o
> +obj-$(CONFIG_SENSORS_IR38064)  += ir38064.o
>  obj-$(CONFIG_SENSORS_LM25066)  += lm25066.o
>  obj-$(CONFIG_SENSORS_LTC2978)  += ltc2978.o
>  obj-$(CONFIG_SENSORS_LTC3815)  += ltc3815.o
> diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
> new file mode 100644
> index 000000000000..4b957ebb6fa7
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ir38064.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon IR38064
> + *
> + * Copyright (c) 2017 Google Inc
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info ir38064_info = {
> +       .pages = 1,
> +       .format[PSC_VOLTAGE_IN] = linear,
> +       .format[PSC_VOLTAGE_OUT] = direct,
> +       .format[PSC_CURRENT_OUT] = linear,
> +       .format[PSC_POWER] = linear,
> +       .format[PSC_TEMPERATURE] = linear,
> +       .m[PSC_VOLTAGE_OUT] = 256,
> +       .b[PSC_VOLTAGE_OUT] = 0,
> +       .R[PSC_VOLTAGE_OUT] = 0,
> +       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +           | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +           | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +           | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +           | PMBUS_HAVE_POUT,
> +};
> +
> +static int ir38064_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       return pmbus_do_probe(client, id, &ir38064_info);
> +}
> +
> +static const struct i2c_device_id ir38064_id[] = {
> +       {"ir38064", 0},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, ir38064_id);
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver ir38064_driver = {
> +       .driver = {
> +                  .name = "ir38064",
> +                  },
> +       .probe = ir38064_probe,
> +       .remove = pmbus_do_remove,
> +       .id_table = ir38064_id,
> +};
> +
> +module_i2c_driver(ir38064_driver);
> +
> +MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
> +MODULE_LICENSE("GPL");
> --
> 2.21.0.392.gf8f6787159e-goog

I will also send this to upstream-upstream once I finish the isl
patchset since that will require documentation and reworking various
aspects of it... Although maybe I should flip them and push this
patchset up ahead -- maybe it'll require less documentation since it's
really an empty driver.

>
