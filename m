Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lLIiG3vQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y5H91NqJzDq9T
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 17:35:16 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id gn14so20400950plb.10
 for <openbmc@lists.ozlabs.org>; Sun, 06 Jan 2019 22:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mIbqUppx7dXtchBf+xYJZ6LmFQeVAzEnWphgzqCFBIc=;
 b=lLIiG3vQ+ceANz0tsx8FfDHkhwPb3NF9M9lobp66tRCxZE2q0EJvYr9qrl9Oq3mf6S
 P2l5vrq7paD4IpVHw6/90BRhq+S7zG4edW2otTcm0bigLCKWmkeZRWlWJmsKoDihn1P8
 4gybR+apGqzJiCSZUPhhObYDR8lRDZni+haX0aBYVccOH3t8d7edbnl7mvkbhBl+1W9T
 3J/oIs+gzIDjMaGKXu/XLp8adGGBLf6iGLZBAZ0/NW1mjOXZnlwShHd4V3CSpekIvQQd
 wuwPQOksbx7YhDsm91OFr0G4Q7D6VFat9chz3aMItemUxa8rGE2bI4cm0ssWtFxjfc0p
 Ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mIbqUppx7dXtchBf+xYJZ6LmFQeVAzEnWphgzqCFBIc=;
 b=CCkalXkrlYFgitogbZXHTi/QiHey3ZiAOMqU7lx1Q+qRH63Q+7xb1N53A0/vLB06k9
 FIrvhmi3RYrG9p9vMKYUjyVSxTjOQbJwhv22qVv4i9wublvKLRWsK6BjUINQLgXoff3C
 Iew8TZB5WrJEHZTpYeZex57scNwTIJQtjGBX3v6+sWzabD/423xqV/G/Qj5hTzzlS6Ay
 dM1ZGXHLUGKhcMI4o0IJovUhCXkjNepj98G3z3XY7Z9K/UTSNDfXiXuYsEEaKI21vM5B
 oJ7ecy7n/QnBZX8B+vt99KL3rRNzv4kREsFPWk9j6eVH1XDtTMTpmyWSHSDgkWq21qDx
 +shQ==
X-Gm-Message-State: AJcUuke/nS+Jt0z5098PdqE7itWx4fi6t2lhB1a2BY9RDMjpGEOJKjGI
 8UITjvHDBRljMFpJbIyoih0=
X-Google-Smtp-Source: ALg8bN75VpWo4HOmpQ0AOP2x+osoYj5Y29CZhTzWMfpxDIDgPO0WTYDQLADShAIDA0WjMazrc+s/5Q==
X-Received: by 2002:a17:902:780c:: with SMTP id
 p12mr58764861pll.197.1546842914887; 
 Sun, 06 Jan 2019 22:35:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x26sm97346946pfn.50.2019.01.06.22.35.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Jan 2019 22:35:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/4] pmbus (dps650ab): add power supply driver
To: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>,
 "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <e0ad8b6bb620f9fc2f818cbda66825c297f73d67.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170847.GA14962@roeck-us.net>
 <a494c032f6344528a89bf9b9aa81a3d7@HXTBJIDCEMVIW02.hxtcorp.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <60d19f7a-8977-fa64-f7ca-5b5940f16bb2@roeck-us.net>
Date: Sun, 6 Jan 2019 22:35:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a494c032f6344528a89bf9b9aa81a3d7@HXTBJIDCEMVIW02.hxtcorp.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 07 Jan 2019 06:35:18 -0000

On 1/6/19 10:25 PM, Liu, Xiaoting wrote:
> Hi Guenter Roeck,
> 
> Thanks for your apply, we will drop this patch and add the structpmbus_device_info in PMBus.c.
> 

NP. Make sure though that the auto-detection finds all properties.
If it does, there is really no reason to have an extra driver.

Thanks,
Guenter

> Thanks,
> Xiaoting.
> 
> On 2019/1/6 1:08, Guenter Roeck wrote:
>> On Fri, Jan 04, 2019 at 05:05:27PM +0800, Xiaoting Liu wrote:
>>> The Delta dps650ab provides main power and standby power to server.
>>> dps650ab can be detected by MFR_ID and MFR_MODEL referring to
>>> manufacturer's feedback. This patch adds driver to moniter power
>>> supply status.
>>>
>> Another comment: The subject should be something like
>> 	hwmon: (pmbus) Add driver for DPS650AB power supply
>>
>> Additional comments inline below.
>>
>> Thanks,
>> Guenter
>>> Signed-off-by: Xiaoting Liu<xiaoting.liu@hxt-semitech.com>
>>> ---
>>>   drivers/hwmon/pmbus/Kconfig    |  10 +++++
>>>   drivers/hwmon/pmbus/Makefile   |   1 +
>>>   drivers/hwmon/pmbus/dps650ab.c | 100 +++++++++++++++++++++++++++++++++++++++++
>>>   drivers/hwmon/pmbus/pmbus.c    |   3 ++
>>>   4 files changed, 114 insertions(+)
>>>
>>> --
>>> 1.8.3.1
>>>
>>>
>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>> index 629cb45f8557..de4638396592 100644
>>> --- a/drivers/hwmon/pmbus/Kconfig
>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>> @@ -184,4 +184,14 @@ config SENSORS_ZL6100
>>>            This driver can also be built as a module. If so, the module will
>>>            be called zl6100.
>>>
>>> +config SENSORS_DPS650AB
>>> +       tristate "Delta DPS650AB"
>>> +       default n
>>> +       help
>>> +         If you say yes here you get hardware monitoring support for the
>>> +         Delta DPS650AB controller.
>>> +
>>> +         This driver can also be built as a module. If so, the module will
>>> +         be called dps650ab.
>>> +
>> Ahplabetic order, please.
>>
>>>   endif # PMBUS
>>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>>> index ea0e39518c21..414818230a26 100644
>>> --- a/drivers/hwmon/pmbus/Makefile
>>> +++ b/drivers/hwmon/pmbus/Makefile
>>> @@ -21,3 +21,4 @@ obj-$(CONFIG_SENSORS_TPS53679)        += tps53679.o
>>>   obj-$(CONFIG_SENSORS_UCD9000)  += ucd9000.o
>>>   obj-$(CONFIG_SENSORS_UCD9200)  += ucd9200.o
>>>   obj-$(CONFIG_SENSORS_ZL6100)   += zl6100.o
>>> +obj-$(CONFIG_SENSORS_DPS650AB) += dps650ab.o
>> Alphabetic order, please.
>>
>>> diff --git a/drivers/hwmon/pmbus/dps650ab.c b/drivers/hwmon/pmbus/dps650ab.c
>>> new file mode 100644
>>> index 000000000000..3c300e621f5a
>>> --- /dev/null
>>> +++ b/drivers/hwmon/pmbus/dps650ab.c
>>> @@ -0,0 +1,100 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Hardware monitoring driver for DELTA DPS650AB
>>> + *
>>> + * Copyright (c) 2018 Huaxintong Semiconductor Technology Co., Ltd.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include "pmbus.h"
>>> +
>>> +#define DPS650AB_MFR_ID                        "DELTA"
>>> +#define DPS650AB_MFR_MODEL             "DPS-650AB-16 A"
>>> +
>>> +static int dps650ab_probe(struct i2c_client *client,
>>> +                        const struct i2c_device_id *id)
>>> +{
>>> +       struct pmbus_driver_info *info;
>>> +       u8 buf[I2C_SMBUS_BLOCK_MAX];
>>> +       int ret;
>>> +
>>> +       memset(buf, 0, I2C_SMBUS_BLOCK_MAX);
>>> +
>>> +       if (!i2c_check_functionality(client->adapter,
>>> +                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
>>> +                               | I2C_FUNC_SMBUS_READ_WORD_DATA
>>> +                               | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
>>> +               return -ENODEV;
>>> +
>>> +       ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>>> +       if (ret < 0) {
>>> +               dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       if (strncmp(buf, DPS650AB_MFR_ID, strlen(DPS650AB_MFR_ID))) {
>>> +               dev_err(&client->dev, "DPS650AB_MFR_ID unrecognised\n");
>>> +               return -ENODEV;
>>> +       }
>>> +
>>> +       ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>>> +       if (ret < 0) {
>>> +               dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       if (strncmp(buf, DPS650AB_MFR_MODEL, strlen(DPS650AB_MFR_MODEL))) {
>>> +               dev_err(&client->dev, "DPS650AB_MFR_MODEL unrecognised\n");
>>> +               return -ENODEV;
>>> +       }
>>> +
>>> +       info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
>>> +       if (!info)
>>> +               return -ENOMEM;
>>> +
>>> +       info->pages = 1;
>>> +       info->format[PSC_VOLTAGE_IN] = linear;
>>> +       info->format[PSC_VOLTAGE_OUT] = linear;
>>> +       info->format[PSC_CURRENT_IN] = linear;
>>> +       info->format[PSC_CURRENT_OUT] = linear;
>>> +       info->format[PSC_POWER] = linear;
>>> +       info->format[PSC_TEMPERATURE] = linear;
>>> +
>>> +       info->func[0] = PMBUS_HAVE_VIN
>>> +               | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
>>> +               | PMBUS_HAVE_STATUS_INPUT
>>> +               | PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12
>>> +               | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>>> +               | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>>> +               | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
>>> +               | PMBUS_HAVE_STATUS_TEMP;
>>> +       info->func[1] = info->func[0];
>>> +
>>> +       return pmbus_do_probe(client, id, info);
>>> +}
>>> +
>>> +static const struct i2c_device_id dps650ab_id[] = {
>>> +       {"dps650ab", 1},
>>> +       {}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(i2c, dps650ab_id);
>>> +
>>> +static struct i2c_driver dps650ab_driver = {
>>> +       .driver = {
>>> +               .name   = "dps650ab",
>>> +       },
>>> +       .probe          = dps650ab_probe,
>>> +       .remove         = pmbus_do_remove,
>>> +       .id_table       = dps650ab_id,
>>> +};
>>> +
>>> +module_i2c_driver(dps650ab_driver);
>>> +
>>> +MODULE_AUTHOR("Liuxiaoting <xiaoting.liu@hxt-semitech.com");
>>> +MODULE_DESCRIPTION("PMBus driver for DPS650AB");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>>> index aa4cf9636e99..930e8a3e2366 100644
>>> --- a/drivers/hwmon/pmbus/pmbus.c
>>> +++ b/drivers/hwmon/pmbus/pmbus.c
>>> @@ -204,6 +204,8 @@ static int pmbus_probe(struct i2c_client *client,
>>>   static const struct pmbus_device_info sgd009_pmbus_info = {
>>>                                  1, PMBUS_SKIP_STATUS_CHECK};
>>>   static const struct pmbus_device_info pmbus_info = {0, 0};
>>> +static const struct pmbus_device_info dps650ab_pmbus_info = {
>>> +                               1, PMBUS_SKIP_STATUS_CHECK};
>>>   /*
>>>    * Use driver_data to set the number of pages supported by the chip.
>>>    */
>>> @@ -227,6 +229,7 @@ static int pmbus_probe(struct i2c_client *client,
>>>          {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
>>>          {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
>>>          {"udt020", (kernel_ulong_t)&default_pmbus_info},
>>> +       {"dps650ab", (kernel_ulong_t)&dps650ab_pmbus_info},
>>>          {}
>>>   };
> 
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
