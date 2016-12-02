Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVMvt3WkvzDvyZ
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 16:21:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rv3ngH6G"; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id w194so12034326vkw.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 21:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=23wdhyu/89k8oEY2hdbD055qlYoER1muE5ekPbJhxMU=;
 b=Rv3ngH6Gn8bnPgvR9Bcsd1QESrTLMAYm4yHbwblgh4M++Bw1tWvY7RW1Hc71AZl15D
 zeiSFp7kAQ1wyYfkcupMXu697Nd4dSGauS8dm9ngPeb+9Wlx3OMRrC0qlFLZYNz6FvrB
 i4hVWp2lwtydispmmwZLR5UMO4anEvHtmqb2HVmdhI/v+uTL0d1Y8vNi8lPlAw01oo9n
 cKIfOsr6jDCnB5qNNuv1yqXqr4WRxXGDqjW077x4D3NvRTUkWkj2KLuDoz/q6Ff6bzeA
 V7+l/3y/K3RuTCri6c9rl3y8PrqyjHv3v/78KY+8qGu6JNWODQaBcysVx8hvJVkeMvJ6
 sNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=23wdhyu/89k8oEY2hdbD055qlYoER1muE5ekPbJhxMU=;
 b=RQmutpe+eElse9s6ZWsM7FxkeOtreEB57qjPvsHn8XSP0esbAPnoQ622P0AZYg/cgd
 H2MxwRJZ3Sl359hf9AcVW5LlpcE7/TkTtmJRly/LPiecgIaPk/A5PFGaE0kpAal2Dszy
 Qm0zoNEECe3RjUDnXHKADw755Xfgfw9vDKCCxGTQ4We0lGHePy69M9eSGzEL2jr4RVQV
 g9Qkj+cmt9LM+LgFKff9Qvk0WChu+mse2M/a9KMVt59ha+Rq6H1GlVEFUzJr3OTTJgyU
 IboEPDblCH013DZ4sqrBeIf3CRJDC+x5fZW9mXsBU/3BMqRATf+LHw46ON7Bg3OFY+Mw
 9s2w==
X-Gm-Message-State: AKaTC03tfbh6mBt3LBqF+LxMR+gi+pVf+gyQ9TqQd5v5KOYUq5tWPEQHHl6nyRhKm2R9URknArM2DUW1TBmYWA==
X-Received: by 10.31.231.194 with SMTP id e185mr13097204vkh.145.1480656103660; 
 Thu, 01 Dec 2016 21:21:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Thu, 1 Dec 2016 21:21:23 -0800 (PST)
In-Reply-To: <1480630970-13319-1-git-send-email-eajames.ibm@gmail.com>
References: <1480630970-13319-1-git-send-email-eajames.ibm@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Dec 2016 15:51:23 +1030
X-Google-Sender-Auth: 2djU53ZdX-qDR8n6r20yWOsmFhw
Message-ID: <CACPK8Xev08ezNzKt3MVj9hPV-9+FyP9ZRjOxoQct4JEmmDZ-Kw@mail.gmail.com>
Subject: Re: [RFC linux] drivers: fsi: Add SBE client device driver
To: eajames.ibm@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, 
 Alistair Popple <alistair@popple.id.au>
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
X-List-Received-Date: Fri, 02 Dec 2016 05:21:47 -0000

Hi Eddie,

On Fri, Dec 2, 2016 at 8:52 AM,  <eajames.ibm@gmail.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This is a driver stub for the SBE FSI client driver. Just looking for
> feedback for driver structuring. SBE doesn't use traditional reads/writes
> but instead submits requests and receives replies from the SBE fifo (as
> far as I understand it - need to check with Karlo).

I assume this builds on top of Chris' latest OpenFSI series?

Does this only work for the P9 SBE, or is it relevant for P8?


>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/Kconfig   |   6 ++
>  drivers/fsi/Makefile  |   1 +
>  drivers/fsi/fsi-sbe.c | 161 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 168 insertions(+)
>  create mode 100644 drivers/fsi/fsi-sbe.c
>
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index 5917006a1f..e314f82 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -36,6 +36,12 @@ config FSI_MBX
>         ---help---
>         This option enables an FSI based Mailbox device driver.
>
> +config FSI_SBE
> +       tristate "SBE FSI client device driver"
> +       depends on FSI
> +       ---help---
> +       This option enables an FSI based SBE device driver.
> +
>  endif
>
>  endmenu
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 36bcbd8..174c524 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
>  obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>  obj-$(CONFIG_FSI_MBX) += fsi-mbx.o
> +obj-$(CONFIG_FSI_SBE) += fsi-sbe.o
> diff --git a/drivers/fsi/fsi-sbe.c b/drivers/fsi/fsi-sbe.c
> new file mode 100644
> index 0000000..e1c7914
> --- /dev/null
> +++ b/drivers/fsi/fsi-sbe.c
> @@ -0,0 +1,161 @@
> +/*
> + * SBE FSI Client device driver
> + *
> + * Copyright (C) IBM Corporation 2016
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Take a look at our other headers of the text we chose to use.

> + */
> +
> +#include <linux/fsi.h>
> +#include <linux/module.h>
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +#include <linux/slab.h>
> +#include <linux/miscdevice.h>
> +#include <linux/list.h>
> +
> +#define FSI_ENGID_P9SBE                0x22
> +
> +#define SBE_IOCTL_SUBMIT       0x01
> +#define SBE_IOCTL_REQUEST_RESET        0x02
> +#define SBE_IOCTL_RESET                0x03

This is not where we declare ioctl information. Take a look at the
impi-bt patch for an example.

http://git.kernel.org/torvalds/c/54f9c4d0778b3f9ab791b1b7eb1a5d2809f02f50


> +
> +struct sbe_device {
> +       struct list_head link;
> +       struct fsi_device *fsi_dev;
> +       struct miscdevice mdev;
> +       char name[32];
> +};
> +
> +#define to_sbe_dev(x)          container_of((x), struct sbe_device, mdev)
> +
> +static struct list_head sbe_devices;
> +static atomic_t sbe_idx = ATOMIC_INIT(0);
> +
> +static ssize_t sbe_read(struct file *filep, char __user *buf, size_t len,
> +                       loff_t *offset)
> +{
> +       return len;
> +}

This is incorrect; the read call will return the users *buf
uninitialised (or with whatever was already in it).

Please omit the callback if it's not doing anything.

> +
> +static ssize_t sbe_write(struct file *filep, const char __user *buf,
> +                        size_t len, loff_t *offset)
> +{
> +       return len;
> +}

Same here.

> +
> +static int sbe_submit(struct sbe_device *sbe, unsigned long data)
> +{
> +       int rc = 0;
> +
> +       return rc;
> +}
> +
> +static int sbe_reset(struct sbe_device *sbe)
> +{
> +       int rc = 0;
> +
> +       return rc;
> +}
> +
> +
> +static int sbe_request_reset(struct sbe_device *sbe)
> +{
> +       return 0;
> +}

I assume this is the information you're waiting on?

> +
> +static long sbe_ioctl(struct file *filep, uint32_t cmd, unsigned long data)
> +{
> +       struct miscdevice *mdev = (struct miscdevice *)filep->private_data;
> +       struct sbe_device *sbe = to_sbe_dev(mdev);
> +       struct device *dev = &sbe->fsi_dev->dev;
> +       ssize_t rc;
> +
> +       switch (cmd) {
> +       case SBE_IOCTL_SUBMIT:
> +               rc = sbe_submit(sbe, data);

Can we not read back from the SBE?

I suggest you use the normal write api for doing writes into the SBE.

The ioctls are useful for resetting.

> +               break;
> +       case SBE_IOCTL_REQUEST_RESET:
> +               rc = sbe_request_reset(sbe);
> +               break;
> +       case SBE_IOCTL_RESET:
> +               rc = sbe_reset(sbe);
> +               break;
> +       default:
> +               dev_info(dev, "Ivalid ioctl command:%d\n", cmd);
> +               return -EINVAL;
> +       }
> +
> +       return rc;
> +};
> +
> +static const struct file_operations sbe_fops = {
> +       .owner  = THIS_MODULE,
> +       .llseek = no_seek_end_llseek,
> +       .read   = sbe_read,
> +       .write  = sbe_write,
> +       .compat_ioctl = sbe_ioctl
> +};
> +
> +static int sbe_probe(struct device *dev)
> +{
> +       struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +       struct sbe_device *sbe;
> +
> +       sbe = devm_kzalloc(dev, sizeof(struct sbe_device), GFP_KERNEL);
> +       if (!sbe)
> +               return -ENOMEM;
> +
> +       snprintf(sbe->name, 32, "sbe%d", atomic_inc_return(&sbe_idx));
> +       sbe->fsi_dev = fsi_dev;
> +
> +       sbe->mdev.minor = MISC_DYNAMIC_MINOR;
> +       sbe->mdev.fops = &sbe_fops;
> +       sbe->mdev.name = sbe->name;
> +       sbe->mdev.parent = dev;
> +
> +       list_add(&sbe->link, &sbe_devices);
> +
> +       return misc_register(&sbe->mdev);
> +}
> +
> +static struct fsi_device_id sbe_ids[] = {
> +       {
> +               .engine_type = FSI_ENGID_P9SBE,
> +               .version = FSI_VERSION_ANY,
> +       },
> +       { 0 }
> +};
> +
> +static struct fsi_driver sbe_drv = {
> +       .id_table = sbe_ids,
> +       .drv = {
> +               .name = "sbe",
> +               .bus = &fsi_bus_type,
> +               .probe = sbe_probe,
> +       }
> +};
> +
> +static int sbe_init(void)
> +{
> +       INIT_LIST_HEAD(&sbe_devices);
> +       return fsi_driver_register(&sbe_drv);
> +}
> +
> +static void sbe_exit(void)
> +{
> +       fsi_driver_unregister(&sbe_drv);
> +}
> +
> +module_init(sbe_init);
> +module_exit(sbe_exit);
> +MODULE_LICENSE("GPL");
> --
> 1.9.1
>
