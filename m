Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMVsT4wVCzDqnH
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 08:11:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cAt8RnAF"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id p3so2966420qtg.5
 for <openbmc@lists.ozlabs.org>; Tue, 01 Aug 2017 15:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=s4ZQyiqAH7sfFRnwTSoOS43ws4FifNveR8N2o6Ut4q8=;
 b=cAt8RnAFxj12ei9Lyw7eKh8ksOmu21vLp3LKd7O8lsyHOW7d/vz0iFynX26culA1xR
 VBncTci5sYTIhScSNu4xwRgAFGjcUKPqNsGWVO/ZfS8IiemxJZ/rENJTUZ8nz66BzyjE
 DQqW2FXpq4Ne3d1sVT1R/oNurPCt5GJwbyMf0QfoGdfTChh1YSdPFscKFioROtz38QaE
 Xhf9wrJbY1FIEbIKuAM2ljZlTGzloLGQA/pcLwxNswq6aSe73GsxjwpmjHJkC/LHJXsb
 lqX7JqMEiKilAZ3dQagpuBKiTdPGDd6uOsTF7hkQNQAb7KSTMQtYr8AUwrK2sQ0pQjbT
 0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=s4ZQyiqAH7sfFRnwTSoOS43ws4FifNveR8N2o6Ut4q8=;
 b=TluzON2W5iJT2rU+XXCIfCK0WTFttnfdojVethxOWfMNSUr7pGOKBe58bua4MbaCTK
 qe+Wq8iSc5aa6Ulk9YZnvztfO4WxUpgMA0IG9zd1LRTM+fbBgrFX96sQKhJVXQ8k7e8w
 Is1hv5tCcpwMPGz+WPvg7t7tVipVWQ4xTdOSgxPokUC4obVcBPNh53/+V7W80VOJAc9p
 dKhsJQoxaNBJs8ZSmkCldF7bGNuBjEKovNXCYkKsVvwVjtr6O3m0Qex0fhtVsljukS3I
 H9je+iB+EPg6r+qza1HDHiwk0LbqBHD5GHYxEXWJJ6dYJKthmkno/NEDhi2s6fsprZkj
 fi+g==
X-Gm-Message-State: AIVw1135DMnmD99Fnu8rSasQiH4swJCOkKDYuJeI+6BDof/eBwz3BBl7
 DX6+yZ1Mmw1PU4tSFqM7LEEFW4+Uk1YH
X-Received: by 10.200.42.241 with SMTP id c46mr30240423qta.9.1501625498418;
 Tue, 01 Aug 2017 15:11:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.39 with HTTP; Tue, 1 Aug 2017 15:11:37 -0700 (PDT)
In-Reply-To: <1501531952-490-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501531952-490-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Tue, 1 Aug 2017 17:11:37 -0500
Message-ID: <CAK_vbW2yUVMviULWeiFoz5yx_YTgmf+80f4ATF7eRA4PA6qOFA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/5] drivers/hwmon/pmbus: Add IBM P17531
 driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
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
X-List-Received-Date: Tue, 01 Aug 2017 22:11:42 -0000

On Mon, Jul 31, 2017 at 3:12 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add the driver to monitor power supplies with hwmon over pmbus.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/pmbus/Kconfig  |  10 +++
>  drivers/hwmon/pmbus/Makefile |   1 +
>  drivers/hwmon/pmbus/p17531.c | 165 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/p17531.c

This p17531/P17531 name for the device driver, files, and constants is
a bit cryptic. Without going into too much detail on why that is a bad
choice (refers to a document revision, not actual device), could a
better name be chosen for this device driver?

>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 04f6baa..033aeda 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -135,6 +135,16 @@ config SENSORS_MAX8688
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
> index 663801c..b0625ec 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_MAX20751)        += max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785) += max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440) += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)  += max8688.o
> +obj-$(CONFIG_SENSORS_P17531)   += p17531.o
>  obj-$(CONFIG_SENSORS_TPS40422) += tps40422.o
>  obj-$(CONFIG_SENSORS_UCD9000)  += ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)  += ucd9200.o
> diff --git a/drivers/hwmon/pmbus/p17531.c b/drivers/hwmon/pmbus/p17531.c
> new file mode 100644
> index 0000000..2190f8c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/p17531.c
> @@ -0,0 +1,165 @@
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
> +#define P17531_MFR_FAN_FAULT                   BIT(0)
> +#define P17531_MFR_THERMAL_FAULT               BIT(1)
> +#define P17531_MFR_OV_FAULT                    BIT(2)
> +#define P17531_MFR_UV_FAULT                    BIT(3)
> +#define P17531_MFR_PS_KILL                     BIT(4)
> +#define P17531_MFR_OC_FAULT                    BIT(5)
> +#define P17531_MFR_VAUX_FAULT                  BIT(6)
> +#define P17531_MFR_CURRENT_SHARE_WARNING       BIT(7)
> +
> +static int p17531_read_word_data(struct i2c_client *client, int page, int reg);
> +
> +static int p17531_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +       int rc, mfr;
> +
> +       switch (reg) {
> +       case PMBUS_STATUS_BYTE:
> +       case PMBUS_STATUS_WORD:
> +               rc = p17531_read_word_data(client, page, PMBUS_STATUS_WORD);
> +               break;
> +       case PMBUS_STATUS_VOUT:
> +       case PMBUS_STATUS_IOUT:
> +       case PMBUS_STATUS_TEMPERATURE:
> +       case PMBUS_STATUS_FAN_12:
> +               rc = pmbus_read_byte_data(client, page, reg);
> +               if (rc < 0)
> +                       return rc;
> +
> +               mfr = pmbus_read_byte_data(client, page,
> +                                          PMBUS_STATUS_MFR_SPECIFIC);
> +               if (mfr < 0)
> +                       return rc;
> +
> +               if (reg == PMBUS_STATUS_FAN_12) {
> +                       if (mfr & P17531_MFR_FAN_FAULT)
> +                               rc |= PB_FAN_FAN1_FAULT;
> +               } else if (reg == PMBUS_STATUS_TEMPERATURE) {
> +                       if (mfr & P17531_MFR_THERMAL_FAULT)
> +                               rc |= PB_TEMP_OT_FAULT;
> +               } else if (reg == PMBUS_STATUS_VOUT) {
> +                       if (mfr &
> +                           (P17531_MFR_OV_FAULT | P17531_MFR_VAUX_FAULT))
> +                               rc |= PB_VOLTAGE_OV_FAULT;
> +                       if (mfr & P17531_MFR_UV_FAULT)
> +                               rc |= PB_VOLTAGE_UV_FAULT;
> +               } else if (reg == PMBUS_STATUS_IOUT) {
> +                       if (mfr & P17531_MFR_OC_FAULT)
> +                               rc |= PB_IOUT_OC_FAULT;
> +                       if (mfr & P17531_MFR_CURRENT_SHARE_WARNING)
> +                               rc |= PB_CURRENT_SHARE_FAULT;
> +               }
> +               break;
> +       default:
> +               if (reg >= PMBUS_VIRT_BASE)
> +                       return -ENXIO;
> +
> +               rc = pmbus_read_byte_data(client, page, reg);
> +               break;
> +       }
> +
> +       return rc;
> +}
> +
> +static int p17531_read_word_data(struct i2c_client *client, int page, int reg)
> +{
> +       int rc, mfr;
> +
> +       switch (reg) {
> +       case PMBUS_STATUS_BYTE:
> +       case PMBUS_STATUS_WORD:
> +               rc = pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
> +               if (rc < 0)
> +                       return rc;
> +
> +               mfr = pmbus_read_byte_data(client, page,
> +                                          PMBUS_STATUS_MFR_SPECIFIC);
> +               if (mfr < 0)
> +                       return rc;
> +
> +               if (mfr & P17531_MFR_PS_KILL)
> +                       rc |= PB_STATUS_OFF;
> +
> +               if (mfr)
> +                       rc |= PB_STATUS_WORD_MFR;
> +               break;
> +       default:
> +               if (reg >= PMBUS_VIRT_BASE)
> +                       return -ENXIO;
> +
> +               rc = pmbus_read_word_data(client, page, reg);
> +               if (rc < 0)
> +                       rc = p17531_read_byte_data(client, page, reg);
> +               break;
> +       }
> +
> +       return rc;
> +}
> +
> +static struct pmbus_driver_info p17531_info = {
> +       .pages = 1,
> +       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +               PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> +               PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> +               PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> +       .read_byte_data = p17531_read_byte_data,
> +       .read_word_data = p17531_read_word_data,
> +};
> +
> +static int p17531_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       return pmbus_do_probe(client, id, &p17531_info);
> +}
> +
> +static int p17531_remove(struct i2c_client *client)
> +{
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
> +static const struct of_device_id p17531_of_match[] = {
> +       { .compatible = "ibm,p17531" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> +
> +static struct i2c_driver p17531_driver = {
> +       .driver = {
> +               .name = "p17531",
> +               .of_match_table = p17531_of_match,
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
