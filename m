Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcVDG0NchzDt0V
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 15:27:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nXriYrgG"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id w194so3591310vkw.3
 for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2016 20:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9CROrPMmI+OqIxSbVjYgGD+WK5IPevi/3Wgi4EwJAMo=;
 b=nXriYrgGvPfKIL4w+5Jqv1+lsZ+wd2tKtwmITu3VunjKNY7+qFTULy5g6pg1Mqw49H
 biFRdtgKIPtZygV6hkq6ZXgyJ6fVdDj+IEMEclLtjNuOhuvt7vpqpWpAbXxn+dgORySf
 DC+Y8bNaJLqfy5dQPrF28N8CNyybt3KUX5a6tO3UjSpTtJL6w+DtPzHV+gZ4yo1LM8zS
 AiLjvl29FNFvQjV2C0K/ozvLDBrxAHNDsmndDpIwd70QRwdZBMgVdAHorOzeM5JBEFXI
 S4kYSB4jrL41AvJpd4uZawUpeSHzHb9G4UWe6vhiMAQy4HLc/MvZo6rL/JlI20S3gegW
 2fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9CROrPMmI+OqIxSbVjYgGD+WK5IPevi/3Wgi4EwJAMo=;
 b=b/dkNu8jR6+qgqxO4EhDUQOqAl7SKlem1TmjT+pL2gS8LB/Cz4IsmUhYPm0VayqY9i
 P3k0KFfihBBNh56/whFXcMTke+wm4d64KLIBsl//61QW5Psdo2HV1Dp+F46qxQXs2WSh
 9lJDYL636DtHHlr1o/1rrY/fpA0tYQ1EzQyQsdS2i91i+s9GbEBgSUgy5ZXkjDBFedJ+
 8Vc6Gkw5psCFKJL1w6FGfO8k+Aa0T2JLu1vpz60L/kG5GhH/sLXNXKH5uRGwH2IXRAhn
 30FMEXEeIo0sv3/GiOf7EupX9xlzfbkhJzivOGXVVVLtecpGbO9YxF+JkbRpFg9vh6xy
 owPg==
X-Gm-Message-State: AKaTC02SEnozOlg2NSA/SywHY2mhprwC06IZjpqH0F4oqXnar99JRIuzL8NvE2yTjodKog9k8JyN16DuWMJcPQ==
X-Received: by 10.31.231.194 with SMTP id e185mr28899856vkh.145.1481516827309; 
 Sun, 11 Dec 2016 20:27:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Sun, 11 Dec 2016 20:26:46 -0800 (PST)
In-Reply-To: <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
References: <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 15:26:46 +1100
X-Google-Sender-Auth: 6wi0aevqtzniSAthCHi9E4WFLzA
Message-ID: <CACPK8Xcwk-ctKv-G-RdOo2xcwb3PHfDVfBJa=r4qkm5Ncbuoqw@mail.gmail.com>
Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client device driver
To: eajames.ibm@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>, 
 "Edward A. James" <eajames@us.ibm.com>, Christopher Bostic <cbostic@us.ibm.com>,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 12 Dec 2016 04:27:10 -0000

Hello Eddie,

On Wed, Dec 7, 2016 at 9:45 AM,  <eajames.ibm@gmail.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This driver provides an interface to the SBE engine on the P8/P9. This
> builds on Chris' openfsi patches, as we need the FSI protocol to talk to
> the SBE.
>
> I'm not sure if we want or need the actual read/write file ops I included,
> as those were not there for the P8 driver.

Lets have a discussion abut what client drivers we will need to have
in the kernel for FSI.

We should consider only creating kernel drivers when the code cannot
live in userspace. This would mean situations where exclusive access
to some part of the address space is required (SCOMs), when the
sequence of reads/writes are timing critical, or when there are IRQs
involved.

For cases where we're simply writing or reading values to the register
CFAM address space, writing userspace code should be sufficient.

What do you think about this approach?

Cheers,

Joel

>
> I haven't tested this yet, as Chris is still working on getting engine
> register access working.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/Kconfig          |   6 ++
>  drivers/fsi/Makefile         |   1 +
>  drivers/fsi/fsi-sbe.c        | 235 +++++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/Kbuild    |   1 +
>  include/uapi/linux/fsi-sbe.h |  27 +++++
>  5 files changed, 270 insertions(+)
>  create mode 100644 drivers/fsi/fsi-sbe.c
>  create mode 100644 include/uapi/linux/fsi-sbe.h
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
> index 0000000..8a4f29a
> --- /dev/null
> +++ b/drivers/fsi/fsi-sbe.c
> @@ -0,0 +1,235 @@
> +/*
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
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
> +#include <linux/fsi-sbe.h>
> +
> +#define FSI_ENGID_P9SBE                0x22
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
> +enum SBE_ENGINE {
> +       SBE_UPSTREAM_FIFO = 0,
> +       SBE_UPSTREAM_STATUS,
> +       SBE_UPSTREAM_EOT,
> +       SBE_UPSTREAM_REQUEST_RESET,
> +       SBE_UPSTREAM_PERFORM_RESET,
> +       SBE_UPSTREAM_ACK_EOT,
> +       SBE_DOWNSTREAM_FIFO = 0x10,
> +       SBE_DOWNSTREAM_STATUS,
> +       SBE_DOWNSTREAM_EOT,
> +       SBE_DOWNSTREAM_REQUEST_RESET,
> +       SBE_DOWNSTREAM_PERFORM_RESET,
> +       SBE_DOWNSTREAM_ACK_EOT,
> +       SBE_DOWNSTREAM_MAX_TRANSFER_COUNT
> +};
> +
> +static ssize_t sbe_read(struct file *filep, char __user *buf, size_t len,
> +                       loff_t *offset)
> +{
> +       int rc;
> +       struct miscdevice *mdev = (struct miscdevice *)filep->private_data;
> +       struct sbe_device *sbe = to_sbe_dev(mdev);
> +       char *data = kmalloc(len, GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       rc = fsi_device_read(sbe->fsi_dev, *offset, data, len);
> +       if (rc)
> +               goto done;
> +
> +       rc = copy_to_user(buf, data, len);
> +
> +done:
> +       kfree(data);
> +       return rc ? rc : len;
> +}
> +
> +static ssize_t sbe_write(struct file *filep, const char __user *buf,
> +                        size_t len, loff_t *offset)
> +{
> +       int rc;
> +       struct miscdevice *mdev = (struct miscdevice *)filep->private_data;
> +       struct sbe_device *sbe = to_sbe_dev(mdev);
> +       char *data = kmalloc(len, GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       rc = copy_from_user(data, buf, len);
> +       if (rc)
> +               goto done;
> +
> +       rc = fsi_device_write(sbe->fsi_dev, *offset, data, len);
> +
> +done:
> +       kfree(data);
> +       return rc ? rc : len;
> +}
> +
> +static int sbe_register_read(struct sbe_device *sbe, unsigned long data)
> +{
> +       int rc;
> +       struct sbe_ioctl_register reg;
> +
> +       rc = copy_from_user(&reg, (void *)data,
> +                           sizeof(struct sbe_ioctl_register));
> +       if (rc)
> +               return rc;
> +
> +       rc = fsi_device_read(sbe->fsi_dev, reg.address, &reg.value,
> +                            sizeof(unsigned long));
> +       if (rc)
> +               return rc;
> +
> +       rc = copy_to_user((void *)data, &reg,
> +                         sizeof(struct sbe_ioctl_register));
> +
> +       return rc;
> +}
> +
> +static int sbe_register_write(struct sbe_device *sbe, unsigned long data)
> +{
> +       int rc;
> +       struct sbe_ioctl_register reg;
> +
> +       rc = copy_from_user(&reg, (void *)data,
> +                           sizeof(struct sbe_ioctl_register));
> +       if (rc)
> +               return rc;
> +
> +       rc = fsi_device_write(sbe->fsi_dev, reg.address, &reg.value,
> +                             sizeof(unsigned long));
> +
> +       return rc;
> +}
> +
> +static int sbe_reset(struct sbe_device *sbe)
> +{
> +       unsigned long val = 0xFFFFFFFF;
> +
> +       return fsi_device_write(sbe->fsi_dev, SBE_DOWNSTREAM_PERFORM_RESET,
> +                               &val, sizeof(unsigned long));
> +}
> +
> +
> +static int sbe_request_reset(struct sbe_device *sbe)
> +{
> +       unsigned long val = 0xFFFFFFFF;
> +
> +       return fsi_device_write(sbe->fsi_dev, SBE_DOWNSTREAM_REQUEST_RESET,
> +                               &val, sizeof(unsigned long));
> +}
> +
> +static long sbe_ioctl(struct file *filep, uint32_t cmd, unsigned long data)
> +{
> +       struct miscdevice *mdev = (struct miscdevice *)filep->private_data;
> +       struct sbe_device *sbe = to_sbe_dev(mdev);
> +       struct device *dev = &sbe->fsi_dev->dev;
> +       ssize_t rc;
> +
> +       switch (cmd) {
> +       case SBE_IOCTL_READ_REG:
> +               rc = sbe_register_read(sbe, data);
> +               break;
> +       case SBE_IOCTL_WRITE_REG:
> +               rc = sbe_register_write(sbe, data);
> +               break;
> +       case SBE_IOCTL_REQUEST_RESET:
> +               rc = sbe_request_reset(sbe);
> +               break;
> +       case SBE_IOCTL_RESET:
> +               rc = sbe_reset(sbe);
> +               break;
> +       default:
> +               dev_dbg(mdev->this_device, "invalid ioctl command:%d\n", cmd);
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
> diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> index 9493842..d092ce0 100644
> --- a/include/uapi/linux/Kbuild
> +++ b/include/uapi/linux/Kbuild
> @@ -132,6 +132,7 @@ header-y += firewire-constants.h
>  header-y += flat.h
>  header-y += fou.h
>  header-y += fs.h
> +header-y += fsi-sbe.h
>  header-y += fsl_hypervisor.h
>  header-y += fuse.h
>  header-y += futex.h
> diff --git a/include/uapi/linux/fsi-sbe.h b/include/uapi/linux/fsi-sbe.h
> new file mode 100644
> index 0000000..57726de
> --- /dev/null
> +++ b/include/uapi/linux/fsi-sbe.h
> @@ -0,0 +1,27 @@
> +/*
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_FSI_SBE_H
> +#define _UAPI_LINUX_FSI_SBE_H
> +
> +#include <linux/ioctl.h>
> +
> +struct sbe_ioctl_register {
> +       unsigned long address;
> +       unsigned long value;
> +};
> +
> +#define SBE_IOCTL_MAGIC                0xF5    /* not sure about this magic number */
> +
> +#define SBE_IOCTL_READ_REG     _IOWR(SBE_IOCTL_MAGIC, 1, struct sbe_ioctl_register)
> +#define SBE_IOCTL_WRITE_REG    _IOWR(SBE_IOCTL_MAGIC, 2, struct sbe_ioctl_register)
> +#define SBE_IOCTL_REQUEST_RESET        _IO(SBE_IOCTL_MAGIC, 3)
> +#define SBE_IOCTL_RESET                _IO(SBE_IOCTL_MAGIC, 4)
> +
> +#endif /* _UAPI_LINUX_FSI_SBE_H */
> --
> 1.9.1
>
