Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpr681SkczDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hLosaZGu"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id 84so1346844ybe.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=H6w9uuz9+u8PbwmAYGVwz8d5V3GSvJm9+SzMhT031IQ=;
 b=hLosaZGu79VxJ6RweAUDjNyaNFfd5daAtvnpW5P4BYxfSjsEVCdTeH+TZtWSZnGtqb
 WS9mtVo0YoEfMlzY9dWQj4MScQlofma5S0AJLO7+/Djxex3j1uwStDHR4YPZ0AXFQP0P
 xGLYXt91rl047p7t9clGeX8Dj2rYLEBaX73bV2no4j31bjIIbLwHPXCau2walSuRlaqz
 r2K6JDFLFNfyNU/mvVmONF1TnJBME59K/F6VyTguANac8vsrrJXXICgLGCw7YoAlbQNH
 ZXyoeSIeKkxU5ijKEmqqmdVEpQzam+jZqi8sjwXT6rCTYhf5A2Fo+3y8n3os1AJWOHYu
 GCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=H6w9uuz9+u8PbwmAYGVwz8d5V3GSvJm9+SzMhT031IQ=;
 b=bMlaxbpOpDvQS+vT+9vuTepMx1aERCOz/hQT8G4x7g9C95q1ZhVM3sJnAbuRMZh9v+
 s5i519BmRP3qmsMbFdBT8rp1jMX2nTaXalZhNSb+xCPJebepxVCYhhgcnX22OjzjgCID
 +UzmQpURCfyfoTnZkmvk9N3Lc5DfpmKBIW/KkXbsIHhbM5X+Mxngt74M4lUqXi3G696f
 iurEZh1eAbd22dgbobdNtP5fzqn2iKQ5K+6ZSMgexjZs/hzR+AYxS9JAWhCx7ITZ+gbA
 4mzvFMdhMfXflRXT7B20D4N+GGyQ8HyV77Hbr4UXlHaAkcezYNki4/0x4ZVOJH28u44o
 7sUQ==
X-Gm-Message-State: AKS2vOw7NR6YgpqYtU/z+f7a5Pj7kv4J4Np0Ff+LK5TnWX6QadCMlc+A
 JmT0javcv7ufjoO9HnOHeqjwN7MyJg==
X-Received: by 10.37.177.158 with SMTP id h30mr7084632ybj.214.1497594492804;
 Thu, 15 Jun 2017 23:28:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:27:52 -0700 (PDT)
In-Reply-To: <1497471966-6420-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497471966-6420-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:57:52 +0930
X-Google-Sender-Auth: LGtk7NFq3awQg4q-LL-aXW--mlk
Message-ID: <CACPK8Xd89nmigT==9j5Xdgi9bkLWA2hKmZDT9_+a2-_RYW1oOg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers: hwmon: occ: Add "master"
 attribute and remove status files
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Fri, 16 Jun 2017 06:28:16 -0000

2017-06-15 5:56 GMT+09:30 Eddie James <eajames@linux.vnet.ibm.com>:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Driver did not remove status device attributes when the device was
> unloaded.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.


> ---
>  drivers/hwmon/occ/common.c | 39 ++++++++++++++++++++++++++++-----------
>  drivers/hwmon/occ/common.h |  1 +
>  drivers/hwmon/occ/p8_i2c.c | 10 ++++++++++
>  drivers/hwmon/occ/p9_sbe.c | 10 ++++++++++
>  4 files changed, 49 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index bee64cd..f34b400 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -10,8 +10,9 @@
>  #include <asm/unaligned.h>
>  #include "common.h"
>
> -#define OCC_NUM_STATUS_ATTRS           6
> +#define OCC_NUM_STATUS_ATTRS           7
>
> +#define OCC_STAT_MASTER                        0x80
>  #define OCC_STAT_ACTIVE                        0x01
>  #define OCC_EXT_STAT_DVFS_OT           0x80
>  #define OCC_EXT_STAT_DVFS_POWER                0x40
> @@ -236,21 +237,24 @@ static ssize_t occ_show_status(struct device *dev,
>
>         switch (sattr->index) {
>         case 0:
> -               val = header->status & OCC_STAT_ACTIVE;
> +               val = header->status & OCC_STAT_MASTER;
>                 break;
>         case 1:
> -               val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
> +               val = header->status & OCC_STAT_ACTIVE;
>                 break;
>         case 2:
> -               val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
> +               val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
>                 break;
>         case 3:
> -               val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
> +               val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
>                 break;
>         case 4:
> -               val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
> +               val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
>                 break;
>         case 5:
> +               val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
> +               break;
> +       case 6:
>                 val = header->occ_state;
>                 break;
>         }
> @@ -1061,29 +1065,33 @@ int occ_create_status_attrs(struct occ *occ)
>                 return -ENOMEM;
>
>         occ->status_attrs[0] =
> -               (struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
> +               (struct sensor_device_attribute)SENSOR_ATTR(occ_master, 0444,
>                                                             occ_show_status,
>                                                             NULL, 0);
>         occ->status_attrs[1] =
> +               (struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
> +                                                           occ_show_status,
> +                                                           NULL, 0);
> +       occ->status_attrs[2] =
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_ot, 0444,
>                                                             occ_show_status,
>                                                             NULL, 1);
> -       occ->status_attrs[2] =
> +       occ->status_attrs[3] =
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_power,
>                                                             0444,
>                                                             occ_show_status,
>                                                             NULL, 2);
> -       occ->status_attrs[3] =
> +       occ->status_attrs[4] =
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_mem_throttle,
>                                                             0444,
>                                                             occ_show_status,
>                                                             NULL, 3);
> -       occ->status_attrs[4] =
> +       occ->status_attrs[5] =
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_quick_drop,
>                                                             0444,
>                                                             occ_show_status,
>                                                             NULL, 4);
> -       occ->status_attrs[5] =
> +       occ->status_attrs[6] =
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
>                                                             occ_show_status,
>                                                             NULL, 5);
> @@ -1097,3 +1105,12 @@ int occ_create_status_attrs(struct occ *occ)
>
>         return 0;
>  }
> +
> +void occ_remove_status_attrs(struct occ *occ)
> +{
> +       int i;
> +
> +       for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i)
> +               device_remove_file(occ->bus_dev,
> +                                  &occ->status_attrs[i].dev_attr);
> +}
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index ad21538..a6582a7 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -137,5 +137,6 @@ struct occ {
>  int occ_update_response(struct occ *occ);
>  int occ_setup_sensor_attrs(struct occ *occ);
>  int occ_create_status_attrs(struct occ *occ);
> +void occ_remove_status_attrs(struct occ *occ);
>
>  #endif /* __OCC_COMMON_H__ */
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index a2f10ea..a4d9965 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -245,6 +245,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
>         return 0;
>  }
>
> +static int p8_i2c_occ_remove(struct i2c_client *client)
> +{
> +       struct occ *occ = dev_get_drvdata(&client->dev);
> +
> +       occ_remove_status_attrs(occ);
> +
> +       return 0;
> +}
> +
>  static const struct of_device_id p8_i2c_occ_of_match[] = {
>         { .compatible = "ibm,p8-occ-hwmon" },
>         {}
> @@ -260,6 +269,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
>                 .of_match_table = p8_i2c_occ_of_match,
>         },
>         .probe = p8_i2c_occ_probe,
> +       .remove = p8_i2c_occ_remove,
>         .address_list = p8_i2c_occ_addr,
>  };
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index c70858d..6226f6f 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -151,6 +151,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>         return p9_sbe_occ_setup(p9_sbe_occ);
>  }
>
> +static int p9_sbe_occ_remove(struct platform_device *pdev)
> +{
> +       struct occ *occ = platform_get_drvdata(pdev);
> +
> +       occ_remove_status_attrs(occ);
> +
> +       return 0;
> +}
> +
>  static const struct of_device_id p9_sbe_occ_of_match[] = {
>         { .compatible = "ibm,p9-occ-hwmon" },
>         { },
> @@ -162,6 +171,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>                 .of_match_table = p9_sbe_occ_of_match,
>         },
>         .probe  = p9_sbe_occ_probe,
> +       .remove = p9_sbe_occ_remove,
>  };
>
>  module_platform_driver(p9_sbe_occ_driver);
> --
> 1.8.3.1
>
