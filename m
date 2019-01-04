Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VO0K11K0"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WSVC36bXzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jan 2019 01:54:11 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id r136so18418718pfc.6
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WyNwvvmB7Y0SxjoBpNJMU5F6oVWThqtshgbUQc2EguI=;
 b=VO0K11K0rGzoVuMK8Eun3V59n6IqlZd/ICje3VTXPKo066E0pCT6A/a1qTuKtO3fjL
 e7QFzhQFs6xT5pit2O6ueSYR8Od3Ta3kaCtPpAUPXhRvp7Yg/pR+5YJY42jfnHZEgQEw
 sRXKVEIiVm6Wrs+HW+C/tkQV6f3UnspSovVvXFRuFkDm2rLY5wf7pFFyRFZRa6pgALRk
 HjRLJK145Vevh+kqwQyHiTX+EtIqF5OaH2P0JAO8ME+WROkI4T4dPHvfyCtbiy7S9FQY
 k2We62KmYQ9mT+GNDpxWyzywwDd2sxRhYsDfQ+tpIO2NDziYk1AJQgPH7FlAED4pSaW5
 9Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WyNwvvmB7Y0SxjoBpNJMU5F6oVWThqtshgbUQc2EguI=;
 b=nLHNoNahxUDMBJvwAADuYvDhNI2t9Y7C3NhZoXuo1xqyzW53l5B+Ui1SHvdxus/a9c
 cDIGw4yRB74g0Sa5RRY20Hj88WTVsvqa8vX33jZPtI0ruXEuTzwhppdP+6qfaUu6sI3m
 vhRDTNJon8p+bE75YNGR9QfC9iWpXy2wjdQVWFnNGCmokyrTOLB2VDFjXyQweWrr7Ejz
 OfersOHtNWS9G5ZTgLbGgZdWIZMLQy7t0v5j6q9LGxDkiTLnsRdhut5cVKNW4MnW9fNm
 r7KVxVNezeXkGHAWAWLcuBgUcFTzolA0qxq1PionB/6EIQ5pY6p9qM+/7zwlZf9tcldc
 oo3Q==
X-Gm-Message-State: AJcUukei4OBte5i7jtp7w4yks8d9YKK59kjGYfwHfw9GzV1CoEw0yt2I
 NCH8B2FCdO7qaEThuZd7xk/Px59L
X-Google-Smtp-Source: ALg8bN5M9kaVnmnvLAZiRPO6hyLIi5HYji/reH8QNwr2avqARx6Dc32KU4muztyO70zg9At4lTK9nQ==
X-Received: by 2002:a63:2054:: with SMTP id r20mr1912011pgm.328.1546613649411; 
 Fri, 04 Jan 2019 06:54:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e131sm97228328pfg.75.2019.01.04.06.54.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jan 2019 06:54:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, jdelvare@suse.com
Cc: openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shunyong Yang <shunyong.yang@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <680b4d5659971cc4f6e1a6878837c2ce49962a7c.1546591275.git.xiaoting.liu@hxt-semitech.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9548ce0-97d2-a3d4-d578-015fc5419967@roeck-us.net>
Date: Fri, 4 Jan 2019 06:54:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <680b4d5659971cc4f6e1a6878837c2ce49962a7c.1546591275.git.xiaoting.liu@hxt-semitech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 04 Jan 2019 14:54:12 -0000

On 1/4/19 12:55 AM, Xiaoting Liu wrote:
> Current code compares device name with name in i2c_device_id to decide
> whether PMBUS_SKIP_STATUS_CHECK should be set in pmbus_platform_data,
> which makes adding new devices with PMBUS_SKIP_STATUS_CHECK should also
> modify code in pmbus_probe().
> 
> This patch adds pmbus_device_info to save pages and flags. Its pointer
> is put in driver_data of i2c_device_id, which makes adding new device
> more straightforward.
> 

Good idea, but I don't see at this time where the patch is needed.
Maybe in patch 3/4 which is missing from the series ?

> Signed-off-by: Shunyong Yang <shunyong.yang@hxt-semitech.com>
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
>   drivers/hwmon/pmbus/pmbus.c | 54 +++++++++++++++++++++++++++------------------
>   include/linux/pmbus.h       |  5 +++++
>   2 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 7688dab32f6e..aa4cf9636e99 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -172,13 +172,15 @@ static int pmbus_probe(struct i2c_client *client,
>          struct pmbus_driver_info *info;
>          struct pmbus_platform_data *pdata = NULL;
>          struct device *dev = &client->dev;
> +       struct pmbus_device_info *device_info;
> 
>          info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
>          if (!info)
>                  return -ENOMEM;
> 
> -       if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
> -           !strcmp(id->name, "sgd009")) {
> +       device_info = (struct pmbus_device_info *)id->driver_data;
> +
> +       if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {
>                  pdata = devm_kzalloc(dev, sizeof(struct pmbus_platform_data),
>                                       GFP_KERNEL);
>                  if (!pdata)
> @@ -187,36 +189,44 @@ static int pmbus_probe(struct i2c_client *client,
>                  pdata->flags = PMBUS_SKIP_STATUS_CHECK;
>          }
> 
> -       info->pages = id->driver_data;
> +       info->pages = device_info->pages;
>          info->identify = pmbus_identify;
>          dev->platform_data = pdata;
> 
>          return pmbus_do_probe(client, id, info);
>   }
> 
> +static const struct pmbus_device_info default_pmbus_info = {1, 0};
> +static const struct pmbus_device_info dps460_pmbus_info = {
> +                               1, PMBUS_SKIP_STATUS_CHECK};
> +static const struct pmbus_device_info dps800_pmbus_info = {
> +                               1, PMBUS_SKIP_STATUS_CHECK};
> +static const struct pmbus_device_info sgd009_pmbus_info = {
> +                               1, PMBUS_SKIP_STATUS_CHECK};

Three structures with exactly the same content does not add value.
Please merge into one with a common name that reflects its use.

> +static const struct pmbus_device_info pmbus_info = {0, 0};

default_pmbus_info and pmbus_info are badly named and ordered.
The name should reflect that one sets one page and that the other
leaves the number of pages unset.

I would suggest three structures and names, such as

pmbus_info_one
pmbus_info_one_skip
pmbus_info_zero

though I am open to better names.

>   /*
>    * Use driver_data to set the number of pages supported by the chip.
>    */
>   static const struct i2c_device_id pmbus_id[] = {
> -       {"adp4000", 1},
> -       {"bmr453", 1},
> -       {"bmr454", 1},
> -       {"dps460", 1},
> -       {"dps800", 1},
> -       {"mdt040", 1},
> -       {"ncp4200", 1},
> -       {"ncp4208", 1},
> -       {"pdt003", 1},
> -       {"pdt006", 1},
> -       {"pdt012", 1},
> -       {"pmbus", 0},
> -       {"sgd009", 1},
> -       {"tps40400", 1},
> -       {"tps544b20", 1},
> -       {"tps544b25", 1},
> -       {"tps544c20", 1},
> -       {"tps544c25", 1},
> -       {"udt020", 1},
> +       {"adp4000", (kernel_ulong_t)&default_pmbus_info},
> +       {"bmr453", (kernel_ulong_t)&default_pmbus_info},
> +       {"bmr454", (kernel_ulong_t)&default_pmbus_info},
> +       {"dps460", (kernel_ulong_t)&dps460_pmbus_info},
> +       {"dps800", (kernel_ulong_t)&dps800_pmbus_info},
> +       {"mdt040", (kernel_ulong_t)&default_pmbus_info},
> +       {"ncp4200", (kernel_ulong_t)&default_pmbus_info},
> +       {"ncp4208", (kernel_ulong_t)&default_pmbus_info},
> +       {"pdt003", (kernel_ulong_t)&default_pmbus_info},
> +       {"pdt006", (kernel_ulong_t)&default_pmbus_info},
> +       {"pdt012", (kernel_ulong_t)&default_pmbus_info},
> +       {"pmbus", (kernel_ulong_t)&pmbus_info},
> +       {"sgd009", (kernel_ulong_t)&sgd009_pmbus_info},
> +       {"tps40400", (kernel_ulong_t)&default_pmbus_info},
> +       {"tps544b20", (kernel_ulong_t)&default_pmbus_info},
> +       {"tps544b25", (kernel_ulong_t)&default_pmbus_info},
> +       {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
> +       {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
> +       {"udt020", (kernel_ulong_t)&default_pmbus_info},
>          {}
>   };
> 
> diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
> index ee3c2aba2a8e..3c05edad7666 100644
> --- a/include/linux/pmbus.h
> +++ b/include/linux/pmbus.h
> @@ -46,4 +46,9 @@ struct pmbus_platform_data {
>          struct regulator_init_data *reg_init_data;
>   };
> 
> +struct pmbus_device_info {
> +       int pages;
> +       u32 flags;
> +};
> +

This should not be needed here. The structure can be declared locally
in pmbus.c (its use in patch 4/4 is wrong).

>   #endif /* _PMBUS_H_ */
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
