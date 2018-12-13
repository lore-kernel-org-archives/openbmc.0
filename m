Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HW5tLmKw"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FbVk69B8zDqSM
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 12:21:34 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id p17so431293qtl.5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 17:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pgGLrXqUdV+Gq7LlbjL9Dnxek3sMiFb6VCpIT3rOOlk=;
 b=HW5tLmKwTuRN8Og9J0uxdjTCxALcQItwbpngch812894EDrfcI329gLt61NnIl2jno
 dj6npjDoByYIvp2b2tXW0F2JjwITrdEVnGQ3CGwo5pfvNGo4Jqzpo7K/M8trS6wm95+j
 nYgMT2nfSns1iuln7cfp7iwfawVTz9/nElskA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pgGLrXqUdV+Gq7LlbjL9Dnxek3sMiFb6VCpIT3rOOlk=;
 b=MxZGPqVWiNIc1NiwMS0yBtKZLbxVFRicUZel5mb8V67IeTVDU1iesgob1iSw8x2rxH
 XutLyQDYuY7Ziq7QCTQ6wImN/cD1AmKxPc4dPzP+wrdGzuEbXKfUZW4DJt/yRY1XGJI9
 ceG27pOyyt6GOHA9YA2IZb22L/Mj+rjYtqf6r7xDBAKqUmq5vzsMzQ154j7MDFSeIs2h
 9mDxhZ+246HEAiQH8E6bQO//0XieZ5soN8qDEvC1HyMv3N1BzWue8b9hyqb6a6G4tLGP
 Ka/WbNNhs4fxjXLhzwLIfD7cEC312RTy0Z2IkNp9XhFzs+X7heOOYymmHtNP5u/nooxr
 wu+g==
X-Gm-Message-State: AA+aEWZ0eiNrsrEyr4+kvO1Ym1Vxc4Tny/A0o6YWEIea2xian5iN0jml
 4m9zPrUWs+Dpy5XG9XlSRGn/Q7AIXrctyJhJlEALqVfmtnU=
X-Google-Smtp-Source: AFSGD/WLValOf9ICuuUniLG0u1cgOeVvdCQF29z4KTmN4tdNX+dytCyV+6LXUC6mrtRenagEgVc2Z0whhR2vUYZkDMY=
X-Received: by 2002:ac8:7308:: with SMTP id x8mr22524495qto.284.1544664092584; 
 Wed, 12 Dec 2018 17:21:32 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Dec 2018 11:51:20 +1030
Message-ID: <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: kuiying.wang@intel.com, Linus Walleij <linus.walleij@linaro.org>, 
 linux-gpio@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 vernon.mauery@intel.com, james.feist@intel.com, 
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 13 Dec 2018 01:21:35 -0000

On Tue, 11 Dec 2018 at 18:32, Wang, Kuiying <kuiying.wang@intel.com> wrote:
>
> Hi Joel/Andrew,
>
> I write a drive to enable GPIO passthrough for buttons (like power/reset/=
id button) as following attached patch.
>
> Do you think it is acceptable?
>
> Or we could do it in pinmux and extend gpio driver? Design passthrough st=
ate except in/out.

I think that this direction would be better than a misc driver. I've
added Linus, the maintainer for these subsystems, and the linux-gpio
mailing list to cc.

Cheers,

Joel

>
> What=E2=80=99s your suggestions?
>
>
>
> Thanks Kwin.
>
>
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>
> index f2062546250c..e94ee86820d3 100644
>
> --- a/drivers/misc/Kconfig
>
> +++ b/drivers/misc/Kconfig
>
> @@ -4,6 +4,12 @@
>
>  menu "Misc devices"
>
> +config GPIO_PASS_THROUGH
>
> +             tristate "GPIO Pass Through"
>
> +             depends on (ARCH_ASPEED || COMPILE_TEST)
>
> +             help
>
> +               Enable this for buttons GPIO pass through.
>
> +
>
> config SENSORS_LIS3LV02D
>
>               tristate
>
>               depends on INPUT
>
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>
> index bb89694e6b4b..13b8b8edbb70 100644
>
> --- a/drivers/misc/Makefile
>
> +++ b/drivers/misc/Makefile
>
> @@ -61,3 +61,4 @@ obj-$(CONFIG_ASPEED_LPC_SIO)   +=3D aspeed-lpc-sio.o
>
> obj-$(CONFIG_PCI_ENDPOINT_TEST)      +=3D pci_endpoint_test.o
>
> obj-$(CONFIG_OCXL)                     +=3D ocxl/
>
> obj-$(CONFIG_MISC_RTSX)                         +=3D cardreader/
>
> +obj-$(CONFIG_GPIO_PASS_THROUGH)   +=3D gpio-passthrough.o
>
> diff --git a/drivers/misc/gpio-passthrough.c b/drivers/misc/gpio-passthro=
ugh.c
>
> new file mode 100644
>
> index 000000000000..0126fc08ae55
>
> --- /dev/null
>
> +++ b/drivers/misc/gpio-passthrough.c
>
> @@ -0,0 +1,260 @@
>
> +// SPDX-License-Identifier: GPL-2.0
>
> +/*
>
> + * Copyright (c) 2018 Intel Corporation
>
> +*/
>
> +
>
> +#include "gpio-passthrough.h"
>
> +
>
> +struct aspeed_gpio_pass_through_dev {
>
> +             struct miscdevice              miscdev;
>
> +             unsigned int        addr;
>
> +             unsigned int        size;
>
> +};
>
> +
>
> +static struct aspeed_gpio_pass_through_dev ast_cdev_gpio_pass_through;
>
> +
>
> +static long ast_passthru_ioctl(struct file *filp, unsigned int cmd, unsi=
gned long arg)
>
> +{
>
> +             long ret =3D 0;
>
> +             struct passthru_ioctl_data passthru_data;
>
> +
>
> +             if (cmd =3D=3D GPIO_IOC_PASSTHRU)
>
> +             {
>
> +                            if (copy_from_user(&passthru_data,
>
> +                                           (void __user*)arg, sizeof(pas=
sthru_data)))
>
> +                                           return -EFAULT;
>
> +                            if (passthru_data.idx >=3D GPIO_PASSTHRU_MAX=
)
>
> +                                           return -EINVAL;
>
> +
>
> +                            switch (passthru_data.cmd) {
>
> +                            case SET_GPIO_PASSTHRU_ENABLE:
>
> +                                           ast_set_passthru_enable(passt=
hru_data.idx,
>
> +                                                                        =
 passthru_data.data);
>
> +                                           break;
>
> +                            case GET_GPIO_PASSTHRU_ENABLE:
>
> +                                           passthru_data.data =3D ast_ge=
t_passthru_enable(passthru_data.idx);
>
> +                                           if (copy_to_user((void __user=
*)arg, &passthru_data,
>
> +                                                                        =
                               sizeof(passthru_data)))
>
> +                                           ret =3D -EFAULT;
>
> +                            break;
>
> +
>
> +                            case SET_GPIO_PASSTHRU_OUT:
>
> +                                           ast_set_passthru_out(passthru=
_data.idx, passthru_data.data);
>
> +                            break;
>
> +
>
> +                            default:
>
> +                                           ret =3D -EINVAL;
>
> +                            break;
>
> +                            }
>
> +             }
>
> +             return ret;
>
> +
>
> +}
>
> +
>
> +static int ast_passthru_open(struct inode *inode, struct file *filp)
>
> +{
>
> +             return container_of(filp->private_data,
>
> +                            struct aspeed_gpio_pass_through_dev, miscdev=
);
>
> +}
>
> +
>
> +static const struct file_operations ast_gpio_pth_fops =3D {
>
> +             .owner          =3D THIS_MODULE,
>
> +             .llseek         =3D no_llseek,
>
> +             .unlocked_ioctl =3D ast_passthru_ioctl,
>
> +             .open           =3D ast_passthru_open,
>
> +};
>
> +
>
> +static struct miscdevice ast_gpio_pth_miscdev =3D {
>
> +             .minor =3D MISC_DYNAMIC_MINOR,
>
> +             .name =3D GPIO_PASS_THROUGH_NAME,
>
> +             .fops =3D &ast_gpio_pth_fops,
>
> +};
>
> +
>
> +static u32 ast_scu_base  =3D IO_ADDRESS(AST_SCU_BASE);
>
> +
>
> +static inline u32 ast_scu_read(u32 reg)
>
> +{
>
> +             return readl((void *)(ast_scu_base + reg));
>
> +}
>
> +
>
> +static inline void ast_scu_write(u32 val, u32 reg)
>
> +{
>
> +#ifdef CONFIG_AST_SCU_LOCK
>
> +             writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base + AST_SCU_=
PROTECT));
>
> +             writel(val,                (void *)(ast_scu_base + reg));
>
> +             writel(0x000000AA,         (void *)(ast_scu_base + AST_SCU_=
PROTECT));
>
> +#else
>
> +             writel(SCU_PROTECT_UNLOCK, (void *)(ast_scu_base + AST_SCU_=
PROTECT));
>
> +             writel(val,                (void *)(ast_scu_base + reg));
>
> +#endif
>
> +}
>
> +
>
> +static int gpio_pass_through_probe(struct platform_device *pdev)
>
> +{
>
> +             struct aspeed_gpio_pass_through_dev   *gpio_pth_dev =3D &as=
t_cdev_gpio_pass_through;
>
> +             struct device *dev =3D &pdev->dev;
>
> +             struct resource *rc;
>
> +
>
> +             dev_set_drvdata(&pdev->dev, gpio_pth_dev);
>
> +             rc =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
> +             if (!rc) {
>
> +                            dev_err(dev, "Fail to platform_get_resource\=
n");
>
> +                            return -ENXIO;
>
> +             }
>
> +             gpio_pth_dev->addr =3D rc->start;
>
> +             gpio_pth_dev->size =3D resource_size(rc);
>
> +             gpio_pth_dev->miscdev =3D ast_gpio_pth_miscdev;
>
> +             ast_passthru_init();
>
> +             printk("GPIO PASS THROUGH DRIVER is loaded \n");
>
> +             return misc_register(&gpio_pth_dev->miscdev);
>
> +}
>
> +
>
> +static int gpio_pass_through_remove(struct platform_device *pdev)
>
> +{
>
> +             struct aspeed_gpio_pass_through_dev *gpio_pth_dev =3D
>
> +                                                          dev_get_drvdat=
a(&pdev->dev);
>
> +             misc_deregister(&gpio_pth_dev->miscdev);
>
> +             printk("GPIO PASS THROUGH DRIVER is removing \n");
>
> +
>
> +             return 0;
>
> +}
>
> +
>
> +static struct platform_driver gpio_pass_through_driver =3D {
>
> +             .probe     =3D gpio_pass_through_probe,
>
> +             .remove    =3D gpio_pass_through_remove,
>
> +             .driver    =3D {
>
> +                            .name  =3D "gpio-pass-through",
>
> +        .owner =3D THIS_MODULE,
>
> +
>
> +             },
>
> +};
>
> +
>
> +/* GPIOE group only */
>
> +struct gpio_passthru {
>
> +             u32 passthru_mask;
>
> +             u16 pin_in;
>
> +             u16 pin_out;
>
> +};
>
> +
>
> +static struct gpio_passthru passthru_settings[GPIO_PASSTHRU_MAX] =3D {
>
> +             [GPIO_PASSTHRU0] =3D {
>
> +                                           .passthru_mask =3D (1 << 12),=
 /* SCU8C[12] */
>
> +                                           .pin_in        =3D PGPIO_PIN(=
GPIOE, 0),
>
> +                                           .pin_out       =3D PGPIO_PIN(=
GPIOE, 1),
>
> +                            },
>
> +
>
> +             [GPIO_PASSTHRU1] =3D {
>
> +                                           .passthru_mask =3D (1 << 13),=
 /* SCU8C[13] */
>
> +                                           .pin_in        =3D PGPIO_PIN(=
GPIOE, 2),
>
> +                                           .pin_out       =3D PGPIO_PIN(=
GPIOE, 3),
>
> +                            },
>
> +
>
> +             [GPIO_PASSTHRU2] =3D {
>
> +                                           .passthru_mask =3D (1 << 14),=
 /* SCU8C[14] */
>
> +                                           .pin_in        =3D PGPIO_PIN(=
GPIOE, 4),
>
> +                                           .pin_out       =3D PGPIO_PIN(=
GPIOE, 5),
>
> +                            },
>
> +
>
> +             [GPIO_PASSTHRU3] =3D {
>
> +                                           .passthru_mask =3D (1 << 15),=
 /* SCU8C[15] */
>
> +                                           .pin_in        =3D PGPIO_PIN(=
GPIOE, 6),
>
> +                                           .pin_out       =3D PGPIO_PIN(=
GPIOE, 7),
>
> +                            },
>
> +};
>
> +
>
> +static void ast_set_passthru_enable(
>
> +                                           unsigned short idx, unsigned =
int enable)
>
> +{
>
> +             u32 val;
>
> +             unsigned long flags;
>
> +             struct gpio_passthru *passthru =3D &passthru_settings[idx];
>
> +
>
> +             local_irq_save(flags);
>
> +
>
> +             val =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);
>
> +             if (enable)
>
> +                            val |=3D  (passthru->passthru_mask);
>
> +             else
>
> +                            val &=3D ~(passthru->passthru_mask);
>
> +             ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
>
> +
>
> +             local_irq_restore(flags);
>
> +}
>
> +
>
> +static unsigned int ast_get_passthru_enable(unsigned short idx)
>
> +{
>
> +             unsigned int enable;
>
> +             unsigned long flags;
>
> +             struct gpio_passthru *passthru =3D &passthru_settings[idx];
>
> +
>
> +             local_irq_save(flags);
>
> +
>
> +             enable =3D (ast_scu_read(AST_SCU_FUN_PIN_CTRL4) & passthru-=
>passthru_mask) !=3D 0 ? 1 : 0;
>
> +
>
> +             local_irq_restore(flags);
>
> +
>
> +             return enable;
>
> +}
>
> +
>
> +static void ast_set_passthru_out(
>
> +                                           unsigned short idx, unsigned =
int val)
>
> +{
>
> +             unsigned long flags;
>
> +             struct gpio_passthru *passthru =3D &passthru_settings[idx];
>
> +
>
> +             local_irq_save(flags);
>
> +
>
> +             /* Disable PASSTHRU */
>
> +             val  =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4);
>
> +             val &=3D ~(passthru->passthru_mask);
>
> +             ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
>
> +
>
> +             local_irq_restore(flags);
>
> +}
>
> +
>
> +static void ast_passthru_init(void)
>
> +{
>
> +             int i;
>
> +             u32 val;
>
> +             unsigned long flags;
>
> +             struct gpio_passthru *passthru;
>
> +
>
> +             local_irq_save(flags);
>
> +
>
> +             /* 1. Enable GPIOE pin mode, SCU80[16:23] =3D 00 */
>
> +             ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) & (~0x00F=
F0000),
>
> +                           AST_SCU_FUN_PIN_CTRL1);
>
> +
>
> +             /* 2. Enable them by setting SCU8C[12:15] */
>
> +             for (i =3D 0; i < GPIO_PASSTHRU_MAX; i++) {
>
> +                            passthru =3D &passthru_settings[i];
>
> +
>
> +                            val  =3D ast_scu_read(AST_SCU_FUN_PIN_CTRL4)=
;
>
> +                            val |=3D passthru->passthru_mask;
>
> +                            ast_scu_write(val, AST_SCU_FUN_PIN_CTRL4);
>
> +             }
>
> +
>
> +             /**********************************************************=
****
>
> +             * 3. Disable HWTrap for GPIOE pass-through mode
>
> +             *
>
> +             * Hardware strap register (SCU70) programming method.
>
> +             *   #Write '1' to SCU70 can set the specific bit with value=
 '1'
>
> +             *    Write '0' has no effect.
>
> +             *   #Write '1' to SCU7C can clear the specific bit of SCU70=
 to
>
> +             *    value '0'. Write '0' has no effect.
>
> +             ***********************************************************=
***/
>
> +             if (ast_scu_read(AST_SCU_HW_STRAP1) & (0x1 << 22))
>
> +                            ast_scu_write((0x1 << 22), AST_SCU_REVISION_=
ID);
>
> +
>
> +             local_irq_restore(flags);
>
> +
>
> +             printk("HW_STRAP1 =3D 0x%08X\n", ast_scu_read(AST_SCU_HW_ST=
RAP1));
>
> +}
>
> +
>
> +module_platform_driver(gpio_pass_through_driver);
>
> +
>
> +MODULE_AUTHOR("Kuiying Wang <kuiying.wang@intel.com>");
>
> +MODULE_DESCRIPTION("GPIO Pass Through Control Driver for all buttons lik=
e Power/Reset/ID button");
>
> +MODULE_LICENSE("GPL v2");
>
> +
>
> diff --git a/drivers/misc/gpio-passthrough.h b/drivers/misc/gpio-passthro=
ugh.h
>
> new file mode 100644
>
> index 000000000000..a7274b8ab31e
>
> --- /dev/null
>
> +++ b/drivers/misc/gpio-passthrough.h
>
> @@ -0,0 +1,60 @@
>
> +#ifndef __GPIO_PASS_THROUGH_H__
>
> +#define __GPIO_PASS_THROUGH_H__
>
> +
>
> +#include <linux/kernel.h>
>
> +#include <linux/miscdevice.h>
>
> +#include <linux/uaccess.h>
>
> +#include <linux/module.h>
>
> +#include <linux/of_platform.h>
>
> +#include <linux/mm.h>
>
> +#include <asm/io.h>
>
> +
>
> +#define PGPIO_PIN(PORT, PIN)   (((PORT) << 3) | ((PIN) & 0x07))
>
> +#define GPIOE    4
>
> +#define AST_SCU_BASE                    0x1E6E2000  /* SCU */
>
> +#define AST_SCU_PROTECT                 0x00        /*  protection key r=
egister */
>
> +#define SCU_PROTECT_UNLOCK              0x1688A8A8
>
> +#define AST_SCU_FUN_PIN_CTRL4           0x8C        /*  Multi-function P=
in Control#4*/
>
> +#define AST_SCU_FUN_PIN_CTRL1           0x80        /*  Multi-function P=
in Control#1*/
>
> +#define AST_SCU_HW_STRAP1               0x70        /*  hardware strappi=
ng register */
>
> +#define AST_SCU_REVISION_ID             0x7C        /*  Silicon revision=
 ID register */
>
> +#define GPIO_PASS_THROUGH_NAME          "gpiopassthrough"
>
> +#define IO_ADDRESS(x)                   (x)
>
> +
>
> +enum GPIO_PASSTHRU_INDEX {
>
> +             GPIO_PASSTHRU0 =3D 0,  /* GPIOE0 -> GPIOE1 */
>
> +             GPIO_PASSTHRU1,      /* GPIOE2 -> GPIOE3 */
>
> +             GPIO_PASSTHRU2,      /* GPIOE4 -> GPIOE5 */
>
> +             GPIO_PASSTHRU3,      /* GPIOE6 -> GPIOE7 */
>
> +
>
> +             GPIO_PASSTHRU_MAX
>
> +};
>
> +
>
> +enum GPIO_PASSTHRU_CMD {
>
> +             SET_GPIO_PASSTHRU_ENABLE =3D 0,
>
> +             GET_GPIO_PASSTHRU_ENABLE,
>
> +             GET_GPIO_PASSTHRU_IN,
>
> +             SET_GPIO_PASSTHRU_OUT, /* !!! The PASSTHRU will be disabled=
 !!! */
>
> +};
>
> +
>
> +struct passthru_ioctl_data {
>
> +             unsigned short cmd;
>
> +             unsigned short idx;
>
> +             unsigned int   data;
>
> +};
>
> +
>
> +static void ast_set_passthru_enable(
>
> +                                           unsigned short idx, unsigned =
int enable);
>
> +static unsigned int ast_get_passthru_enable(unsigned short idx);
>
> +static void ast_set_passthru_out(
>
> +                                           unsigned short idx, unsigned =
int val);
>
> +static void ast_passthru_init(void);
>
> +static inline u32 ast_scu_read(u32 reg);
>
> +static inline void ast_scu_write(u32 val, u32 reg);
>
> +
>
> +/* IOCTL */
>
> +#define GPIO_IOC_BASE       'G'
>
> +#define GPIO_IOC_PASSTHRU   _IOWR(GPIO_IOC_BASE, 1, struct passthru_ioct=
l_data)
>
> +
>
> +
>
> +#endif
>
> --
>
> 2.16.2
>
>
>
> Thanks,
>
> Kwin.
>
>
