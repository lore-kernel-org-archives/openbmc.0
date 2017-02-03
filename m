Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDz5t2GxrzDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:59:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2rdpflw"; 
 dkim-atps=neutral
Received: by mail-ot0-x242.google.com with SMTP id 36so558785otx.3
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eIk/EvSwGeLli6eZIJGTKwOptHuZ/J7WWzlxywu2SIY=;
 b=k2rdpflwZz0xc6p2Kn2JUSluof4Qov3nSYAMVE50HjhoZNDTja8AhSBUPiyj7GxN3D
 FgI2ZgNXz2L6PrrNGNsZeYklwLM6KAZYyw5R5xN3xQr/CmtV4hOF8++cYHRS30BYzqMT
 Ucyqjpj3bTi/TGCaxUOOjVrKGxTydiGflAnTUn3mAcVOx8XtNv4joEFKj0ZB2DH9ovgc
 F4U6tpaztGZFgcrIIhl207/UkAFretUemfoJw8N+z8s75Y4mqBo15ivnrshZZ3DBl0oW
 7AI3c2bsPECCsGa4IyR6BFn58gxd/u0bde2txj5sNovy7Kum/dfteTNB8Ot0g0Npw0uf
 W4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eIk/EvSwGeLli6eZIJGTKwOptHuZ/J7WWzlxywu2SIY=;
 b=L8JO8XpYqmwf/pnxphW/BqdZkAiUTmo9+uwf+q8JK6srjfr9VqDvSukMNpF0ln/RTT
 hfRc9wIc1FX37cPAJ+YxPZo5QP/eUFuBfaut9pppUj5AVQtZ7zxu9kOeuhIE6tkODHJg
 GkjmynZ9TXLonwOaGVIKnNjUIdbEyUaS2EOHh5PnJPxlT5F3LEmvFzTENZPbGUJZU7a2
 c1BP9BIhzjQXCw6Hbf15lg+P6MmNhqb3qHjwIvjBltzizlybFcD7p2+JtxXlug9AeYhJ
 S4V0r/cZPXu3NhFYTklTlLrTTq8eOqYVHIJFQXf492duPX+51UKibsdVnFGyZ2s5hO2L
 xgug==
X-Gm-Message-State: AIkVDXIj7/TnuG7TvAB4HgjkGEHkA7EhVo+3mSJxn46ANTKiR0xodlfqn7OXcV0KI9U0+Bvlmmea0cwiw2s87A==
X-Received: by 10.157.10.202 with SMTP id 68mr5182852otq.51.1486083552249;
 Thu, 02 Feb 2017 16:59:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 16:58:51 -0800 (PST)
In-Reply-To: <4318525.UUk3yeK6CH@new-mexico>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486077964-11346-2-git-send-email-eajames@linux.vnet.ibm.com>
 <4318525.UUk3yeK6CH@new-mexico>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:28:51 +1030
X-Google-Sender-Auth: rQAHU16vfSHoM9bC8SqIRBii0dw
Message-ID: <CACPK8Xc+x_g-36StPMVjjzdeLbAsfmjOu45_KTa5kGy5gE8j+w@mail.gmail.com>
Subject: Re: [PATCH linux v1 4/8] drivers: fsi: Add i2c client driver
To: Alistair Popple <alistair@popple.id.au>
Cc: eajames@linux.vnet.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 03 Feb 2017 00:59:15 -0000

On Fri, Feb 3, 2017 at 11:26 AM, Alistair Popple <alistair@popple.id.au> wrote:
> Hi Edward,
>
> On Thu, 2 Feb 2017 05:25:57 PM eajames@linux.vnet.ibm.com wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> stub for I2C driver over FSI
>
> Unless I've missed something it doesn't look like this uses any of the
> existing I2C infrastructure in the kernel. This should live in
> drivers/i2c/busses and register the I2C bus adapter using
> i2c_add_adapter(). This way all the existing kernel infrastructe for
> probing and assiging I2C device drivers can be utilised.
>
> For an example see how OPAL currently exposes I2C busses on the host
> in drivers/i2c/busses/i2c-opal.c.

Alistair is right on the money. This should have never seen the light of day.

Alistair, and others: we did agree that due to this functionality
being required in short order, and a proper driver not being started
yet, we will merge these patches temporarily.

Eddie and Chris will be working with me to write a proper i2c driver on Monday.

Cheers,

Joel

>
> Regards,
>
> Alistair
>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>  drivers/fsi/Kconfig       |   6 ++
>>  drivers/fsi/Makefile      |   1 +
>>  drivers/fsi/i2c/Makefile  |   1 +
>>  drivers/fsi/i2c/iic-fsi.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/fsi/i2c/iic-fsi.h |  29 ++++++++
>>  drivers/fsi/i2c/iic-int.h |  80 ++++++++++++++++++++++
>>  6 files changed, 283 insertions(+)
>>  create mode 100644 drivers/fsi/i2c/Makefile
>>  create mode 100644 drivers/fsi/i2c/iic-fsi.c
>>  create mode 100644 drivers/fsi/i2c/iic-fsi.h
>>  create mode 100644 drivers/fsi/i2c/iic-int.h
>>
>> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
>> index 0fa265c..c78b9b6e 100644
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -24,6 +24,12 @@ config FSI_SCOM
>>       ---help---
>>       This option enables an FSI based SCOM device driver.
>>
>> +config FSI_I2C
>> +     tristate "I2C FSI client device driver"
>> +     depends on FSI
>> +     ---help---
>> +     This option enables an FSI based I2C device driver.
>> +
>>  endif
>>
>>  endmenu
>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>> index 3466f08..3a106ba 100644
>> --- a/drivers/fsi/Makefile
>> +++ b/drivers/fsi/Makefile
>> @@ -2,3 +2,4 @@
>>  obj-$(CONFIG_FSI) += fsi-core.o
>>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
>>  obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>> +obj-$(CONFIG_FSI_I2C) += i2c/
>> diff --git a/drivers/fsi/i2c/Makefile b/drivers/fsi/i2c/Makefile
>> new file mode 100644
>> index 0000000..f9f9048
>> --- /dev/null
>> +++ b/drivers/fsi/i2c/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_FSI_I2C) += iic-fsi.o
>> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
>> new file mode 100644
>> index 0000000..51a15a4
>> --- /dev/null
>> +++ b/drivers/fsi/i2c/iic-fsi.c
>> @@ -0,0 +1,166 @@
>> +/*
>> + *   Copyright (c) International Business Machines Corp., 2006, 2010, 2012
>> + *
>> + *   This program is free software;  you can redistribute it and/or modify
>> + *   it under the terms of the GNU General Public License as published by
>> + *   the Free Software Foundation; either version 2 of the License, or
>> + *   (at your option) any later version.
>> + *
>> + *   This program is distributed in the hope that it will be useful,
>> + *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> + *   the GNU General Public License for more details.
>> + *
>> + *   You should have received a copy of the GNU General Public License
>> + *   along with this program;  if not, write to the Free Software
>> + *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> + */
>> +
>> +/*
>> + * This file contains the architecture independent IIC FSI code.
>> + */
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/fsi.h>
>> +#include <asm/io.h>
>> +#include <linux/mm.h>
>> +#include <linux/interrupt.h>
>> +#include "iic-int.h"
>> +#include "iic-fsi.h"
>> +
>> +#include <linux/delay.h>
>> +#include <linux/moduleparam.h>
>> +
>> +struct class* iic_fsi_class = 0;
>> +dev_t iic_devnum_start = 0;
>> +
>> +static const char iic_fsi_version[] = "3.0";
>> +
>> +int iic_fsi_probe(struct device *dev);
>> +int iic_fsi_remove(struct device *dev);
>> +
>> +struct iic_reg_access fsi_reg_access =
>> +{
>> +     .bus_readb = readb_wrap,
>> +     .bus_readh = readh_wrap,
>> +     .bus_readw = readw_wrap,
>> +     .bus_writeb = writeb_wrap,
>> +     .bus_writeh = writeh_wrap,
>> +     .bus_writew = writew_wrap,
>> +};
>> +
>> +static const struct fsi_device_id i2c_ids[] = {
>> +     {
>> +             .engine_type = FSI_ENGID_I2C,
>> +             .version = FSI_VERSION_ANY,
>> +     },
>> +     {
>> +             .engine_type = FSI_ENGID_I2C_BB,
>> +             .version = FSI_VERSION_ANY,
>> +     },
>> +     { 0 }
>> +};
>> +
>> +static const struct fsi_driver i2c_drv = {
>> +     .id_table = i2c_ids,
>> +     .drv = {
>> +             .name = "iic_fsi_dd",
>> +             .bus = &fsi_bus_type,
>> +             .probe = iic_fsi_probe,
>> +             .remove = iic_fsi_remove,
>> +     }
>> +};
>> +
>> +/*
>> + * Called when an FSI IIC engine is plugged in.
>> + * Causes creation of the /dev entry.
>> + * Not allowed to access engine registers in this function.
>> + *
>> + */
>> +int iic_fsi_probe(struct device *dev)
>> +{
>> +     return 0;
>> +}
>> +
>> +/* This function is called when a link is removed or the driver is unloaded.
>> + * It's job is to remove the device from the device hierarchy including
>> + * removal from sysfs (this is where device files get removed).
>> + */
>> +int iic_fsi_remove(struct device* dev)
>> +{
>> +     return 0;
>> +}
>> +
>> +/*
>> + * Initialize this module.  Creates a class for fsi connected iic devices and
>> + * allocates device numbers for them.
>> + */
>> +static int __init iic_fsi_init(void)
>> +{
>> +     int rc = 0;
>> +
>> +     IENTER();
>> +
>> +     rc = alloc_chrdev_region(&iic_devnum_start,
>> +                     0, /*starting minor number*/
>> +                     IIC_FSI_MAX_DEVS,
>> +                     "iic-fsi");
>> +     if(rc)
>> +     {
>> +              IFLDe(1, "master alloc_chrdev_region failed: rc = %d\n", rc);
>> +              return rc;
>> +     }
>> +
>> +     iic_fsi_class = class_create(THIS_MODULE, "iic-fsi");
>> +     if (IS_ERR(iic_fsi_class))
>> +     {
>> +             IFLDe(1, "class_create failed: rc=%ld",
>> +                             PTR_ERR(iic_fsi_class));
>> +             goto exit_class_create;
>> +     }
>> +     /* Register this driver with the FSI infrastructure */
>> +     rc = fsi_driver_register(&i2c_drv);
>> +     if(rc)
>> +     {
>> +             IFLDe(1, "fsidrv_register failed: %d", rc);
>> +             goto exit_drv_register;
>> +     }
>> +
>> +     printk("IIC FSI support loaded, ver. %s\n", iic_fsi_version);
>> +
>> +     IEXIT(rc);
>> +     return rc;
>> +
>> +exit_drv_register:
>> +     class_destroy(iic_fsi_class);
>> +exit_class_create:
>> +     unregister_chrdev_region(iic_devnum_start, IIC_FSI_MAX_DEVS);
>> +     IEXIT(rc);
>> +     return rc;
>> +}
>> +
>> +static void __exit iic_fsi_exit(void)
>> +{
>> +     IENTER();
>> +     IDBGd(0, "fisdrv_unregister()\n");
>> +     fsi_driver_unregister(&i2c_drv);
>> +     IDBGd(0, "unregister_chrdev_region()\n");
>> +     unregister_chrdev_region(iic_devnum_start, IIC_FSI_MAX_DEVS);
>> +     if(iic_fsi_class)
>> +     {
>> +             IDBGd(0, "class_destroy\n");
>> +             class_destroy(iic_fsi_class);
>> +     }
>> +     printk("IIC FSI support unloaded.\n");
>> +     IEXIT(0);
>> +}
>> +
>> +module_init(iic_fsi_init);
>> +module_exit(iic_fsi_exit);
>> +
>> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
>> +MODULE_DESCRIPTION("IIC FSI Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> diff --git a/drivers/fsi/i2c/iic-fsi.h b/drivers/fsi/i2c/iic-fsi.h
>> new file mode 100644
>> index 0000000..4decb2c
>> --- /dev/null
>> +++ b/drivers/fsi/i2c/iic-fsi.h
>> @@ -0,0 +1,29 @@
>> +/*
>> + *   Copyright (c) International Business Machines Corp., 2006
>> + *
>> + *   This program is free software;  you can redistribute it and/or modify
>> + *   it under the terms of the GNU General Public License as published by
>> + *   the Free Software Foundation; either version 2 of the License, or
>> + *   (at your option) any later version.
>> + *
>> + *   This program is distributed in the hope that it will be useful,
>> + *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> + *   the GNU General Public License for more details.
>> + *
>> + *   You should have received a copy of the GNU General Public License
>> + *   along with this program;  if not, write to the Free Software
>> + *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> + */
>> +
>> +#ifndef IIC_FSI_H
>> +#define IIC_FSI_H
>> +
>> +/*
>> + * we don't know ahead of time how many minors will be needed as this is based
>> + * on platform type and the possibility of sparsely populated FRU's on special
>> + * systems so picking a safely large number
>> + */
>> +#define IIC_FSI_MAX_DEVS     1024
>> +
>> +#endif
>> diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
>> new file mode 100644
>> index 0000000..545b2c3
>> --- /dev/null
>> +++ b/drivers/fsi/i2c/iic-int.h
>> @@ -0,0 +1,80 @@
>> +/*
>> + *   Copyright (c) International Business Machines Corp., 2006, 2012
>> + *
>> + *   This program is free software;  you can redistribute it and/or modify
>> + *   it under the terms of the GNU General Public License as published by
>> + *   the Free Software Foundation; either version 2 of the License, or
>> + *   (at your option) any later version.
>> + *
>> + *   This program is distributed in the hope that it will be useful,
>> + *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> + *   the GNU General Public License for more details.
>> + *
>> + *   You should have received a copy of the GNU General Public License
>> + *   along with this program;  if not, write to the Free Software
>> + *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> + */
>> +
>> +#ifndef IIC_INT_H
>> +#define IIC_INT_H
>> +#include <linux/list.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/fs.h>
>> +#include <linux/kobject.h>
>> +#include <linux/cdev.h>
>> +#include <linux/device.h>
>> +#include <linux/kdev_t.h>
>> +#include <linux/wait.h>
>> +#include <linux/i2cfsi.h>
>> +#include <linux/semaphore.h>
>> +#include <linux/fsi.h>
>> +#include <asm/atomic.h>
>> +
>> +#define FSI_ENGID_I2C                0x7
>> +#define FSI_ENGID_I2C_BB     0x17
>> +
>> +#ifdef FSI_I2C_DEBUG
>> +#define IDBGs(num, msg, args...) printk(msg, ## args)
>> +#define IDBGd(num, msg, args...) printk(msg, ## args)
>> +#define IDBGf(num, msg, args...) printk(msg, ## args)
>> +#define IDBGl(num, msg, args...) printk(msg, ## args)
>> +#else
>> +#define IDBGs(num, msg, args...)
>> +#define IDBGd(num, msg, args...)
>> +#define IDBGf(num, msg, args...)
>> +#define IDBGl(num, msg, args...)
>> +#endif
>> +
>> +#define IENTER()
>> +#define IEXIT(RC)
>> +
>> +/* IFLDx traces will not get compiled out */
>> +#define IFLDe(num, msg, args...)\
>> +     printk("ERR: "msg, ## args)
>> +#define IFLDi(num, msg, args...)\
>> +     printk(msg, ## args)
>> +
>> +#ifdef FSI_I2C_DEBUG
>> +#define IFLDs(num, msg, args...) printk(msg, ## args)
>> +#define IFLDd(num, msg, args...) printk(msg, ## args)
>> +#define IFLDf(num, msg, args...) printk(msg, ## args)
>> +#define IFLDl(num, msg, args...) printk(msg, ## args)
>> +#else
>> +#define IFLDs(num, msg, args...)
>> +#define IFLDd(num, msg, args...)
>> +#define IFLDf(num, msg, args...)
>> +#define IFLDl(num, msg, args...)
>> +#endif
>> +
>> +struct iic_reg_access
>> +{
>> +    int (*bus_readb)(iic_eng_t*, unsigned int, unsigned char*, iic_ffdc_t**);
>> +    int (*bus_readh)(iic_eng_t*, unsigned int, unsigned short*, iic_ffdc_t**);
>> +    int (*bus_readw)(iic_eng_t*, unsigned int, unsigned long*, iic_ffdc_t**);
>> +    int (*bus_writeb)(iic_eng_t*, unsigned int, unsigned char, iic_ffdc_t**);
>> +    int (*bus_writeh)(iic_eng_t*, unsigned int, unsigned short, iic_ffdc_t**);
>> +    int (*bus_writew)(iic_eng_t*, unsigned int, unsigned long, iic_ffdc_t**);
>> +};
>> +
>> +#endif
>>
>
