Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZV0b6QZHzDsWc
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 17:09:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Qef9yY8A; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id c124so646856vka.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 00:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=1KWRFIvP58Vcy24qtlkwbFYQPKtpITERMS+2FxwnljM=;
 b=Qef9yY8AsyoI55584THvZA8pFD9C1aIpZBAhg8StC3ZuUy28JxngtViTcsyXPF1VNS
 No8Gf+pliQ+K8zDichGQmy1+6mJqStdi8kDeLqgL2wf8fM4qXRu540X+G0mcG4KDfEbU
 e6UzKGsiO1J/eALlJNUQkf4snEOOP5M9W3M2v6KFz2C4BAVpYkWJCLTNmEoXHHZdtax5
 JSSvq5uzgI/d1WUs4t2Y1jn/13M14xiC2aVE4uCVRVvinncF/8WfhlwR09Qs3yB8QHbu
 fNRdWYrp+HDl9Hzm3lIaZBZDOWa4ZXGTpEpOaoB1bXYvEh91STFOQE4AbD2/mHuiBKYj
 ihBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=1KWRFIvP58Vcy24qtlkwbFYQPKtpITERMS+2FxwnljM=;
 b=Bq0PnKwVFuY4CBH1FAOADrkkWROiiKLL6CJ1niJEiKzxm3ZGZmgyCqiGCphYZsZ0sC
 klpHVOIkLbE9ocVB+wdU4Ecpc9mDzBwUqVvqQEQtgy5EJX24jw5TtxVfJB2OB+939EPB
 7Vq4AkhPGgGf/PJjhStUnqZNZfeik9NW+ASCNrkCIFXBo9oi6z29U/ztayZoZllx29T7
 WDST1ONREfu+oqWaAnjgQ4vnuNdRfZLy269vbJ1Q/mqdxxdlpamivs1BdJLLHzAXBIDR
 Uzq8oyaMcLSsLhiVXueaOes0f9etUFjH1qrtk4Rw1Hq6RhGY/6/wg1PtLi9Q5u0v7xce
 1PbA==
X-Gm-Message-State: AE9vXwPd7KksRJvvedUnJKboIsyf2SyMFrjK+p6ZjYIxwymcAni8C+OL6M92Z+8Wn8qfc5xR7uCWUVKdgtP1fw==
X-Received: by 10.31.168.9 with SMTP id r9mr1880434vke.38.1473923388592; Thu,
 15 Sep 2016 00:09:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 00:09:28 -0700 (PDT)
In-Reply-To: <1473921146-19509-5-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Sep 2016 16:39:28 +0930
X-Google-Sender-Auth: tF5uGn1UOUj2_LtZusJnJdDCayE
Message-ID: <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 07:09:52 -0000

On Thu, Sep 15, 2016 at 4:02 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> From: Alistair Popple <alistair@popple.id.au>
>
> This patch adds a simple device driver to expose the iBT interface on
> Aspeed SOCs (AST2400 and AST2500) as a character device :
> /dev/ipmi-bt-bmc.
>
> The BT (Block Transfer) interface is used to perform in-band IPMI
> communication from a BMC to the host. Entire messages are buffered
> before sending a notification to the host, or the BMC when on the
> other side, that there is data to be read. The driver implements the
> BMC side of the BT interface.
>
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [clg: - did some checkpatch fixes
>       - added a devicetree binding documentation
>       - renamed 'bt_host' to 'bt_bmc' to reflect that the driver is
>         the BMC side of the IPMI BT interface
>       - remaned the device name to 'ipmi-bt-bmc'

I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
device?

>       - introduced a temporary buffer to copy_{to,from}_user
>       - used platform_get_irq()
>       - move the driver under drivers/char/ipmi/ ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  .../bindings/char/ipmi/aspeed,bt-bmc.txt           |  19 +
>  drivers/char/ipmi/Kconfig                          |   7 +
>  drivers/char/ipmi/Makefile                         |   1 +
>  drivers/char/ipmi/bt-bmc.c                         | 475 +++++++++++++++=
++++++
>  include/uapi/linux/Kbuild                          |   1 +
>  include/uapi/linux/bt-bmc.h                        |  18 +
>  6 files changed, 521 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,bt=
-bmc.txt
>  create mode 100644 drivers/char/ipmi/bt-bmc.c
>  create mode 100644 include/uapi/linux/bt-bmc.h
>
> diff --git a/Documentation/devicetree/bindings/char/ipmi/aspeed,bt-bmc.tx=
t b/Documentation/devicetree/bindings/char/ipmi/aspeed,bt-bmc.txt
> new file mode 100644
> index 000000000000..551323606f6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/char/ipmi/aspeed,bt-bmc.txt
> @@ -0,0 +1,19 @@
> +* Aspeed BT IPMI interface
> +
> +Required properties:
> +
> +- compatible : should be "aspeed,bt-bmc"
> +- reg: physical address and size of the registers
> +
> +Optional properties:
> +
> +- interrupts: interrupt generated by the BT interface. without an
> +  interrupt, the driver will operate in poll mode.
> +
> +Example:
> +
> +       ibt@1e789140 {
> +               compatible =3D "aspeed,bt-bmc";
> +               reg =3D <0x1e789140 0x18>;
> +               interrupts =3D <8>;
> +       };
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 6ed9e9fe5233..f0cf4889ba66 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -88,3 +88,10 @@ config IPMI_POWEROFF
>          the IPMI management controller is capable of this.
>
>  endif # IPMI_HANDLER
> +
> +config ASPEED_BT_IPMI_BMC
> +       tristate "BT IPMI bmc driver"
> +       help
> +         Provides a driver for the BT IPMI interface found on Aspeed
> +         SOCs (AST2400 and AST2500). The driver implements the BMC
> +         side of the BT interface.
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index f3ffde1f5f1f..0d98cd91def1 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_IPMI_SSIF) +=3D ipmi_ssif.o
>  obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
>  obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
>  obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
> +obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> new file mode 100644
> index 000000000000..5069ed6f0646
> --- /dev/null
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -0,0 +1,475 @@
> +/*
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/errno.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/miscdevice.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/bt-bmc.h>
> +
> +#define DEVICE_NAME    "ipmi-bt-bmc"
> +
> +#define BT_IO_BASE     0xe4
> +#define BT_IRQ         10
> +
> +#define BT_CR0         0x0
> +#define   BT_CR0_IO_BASE               16
> +#define   BT_CR0_IRQ                   12
> +#define   BT_CR0_EN_CLR_SLV_RDP                0x8
> +#define   BT_CR0_EN_CLR_SLV_WRP                0x4
> +#define   BT_CR0_ENABLE_IBT            0x1
> +#define BT_CR1         0x4
> +#define   BT_CR1_IRQ_H2B       0x01
> +#define   BT_CR1_IRQ_HBUSY     0x40
> +#define BT_CR2         0x8
> +#define   BT_CR2_IRQ_H2B       0x01
> +#define   BT_CR2_IRQ_HBUSY     0x40
> +#define BT_CR3         0xc
> +#define BT_CTRL                0x10
> +#define   BT_CTRL_B_BUSY               0x80
> +#define   BT_CTRL_H_BUSY               0x40
> +#define   BT_CTRL_OEM0                 0x20
> +#define   BT_CTRL_SMS_ATN              0x10
> +#define   BT_CTRL_B2H_ATN              0x08
> +#define   BT_CTRL_H2B_ATN              0x04
> +#define   BT_CTRL_CLR_RD_PTR           0x02
> +#define   BT_CTRL_CLR_WR_PTR           0x01
> +#define BT_BMC2HOST    0x14
> +#define BT_INTMASK     0x18
> +#define   BT_INTMASK_B2H_IRQEN         0x01
> +#define   BT_INTMASK_B2H_IRQ           0x02
> +#define   BT_INTMASK_BMC_HWRST         0x80
> +
> +struct bt_bmc {
> +       struct device           dev;
> +       struct miscdevice       miscdev;
> +       void __iomem            *base;
> +       int                     open_count;
> +       int                     irq;
> +       wait_queue_head_t       queue;
> +       struct timer_list       poll_timer;
> +};
> +
> +static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
> +{
> +       return ioread8(bt_bmc->base + reg);
> +}
> +
> +static void bt_outb(struct bt_bmc *bt_bmc, u8 data, int reg)
> +{
> +       iowrite8(data, bt_bmc->base + reg);
> +}
> +
> +static void clr_rd_ptr(struct bt_bmc *bt_bmc)
> +{
> +       bt_outb(bt_bmc, BT_CTRL_CLR_RD_PTR, BT_CTRL);
> +}
> +
> +static void clr_wr_ptr(struct bt_bmc *bt_bmc)
> +{
> +       bt_outb(bt_bmc, BT_CTRL_CLR_WR_PTR, BT_CTRL);
> +}
> +
> +static void clr_h2b_atn(struct bt_bmc *bt_bmc)
> +{
> +       bt_outb(bt_bmc, BT_CTRL_H2B_ATN, BT_CTRL);
> +}
> +
> +static void set_b_busy(struct bt_bmc *bt_bmc)
> +{
> +       if (!(bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_B_BUSY))
> +               bt_outb(bt_bmc, BT_CTRL_B_BUSY, BT_CTRL);
> +}
> +
> +static void clr_b_busy(struct bt_bmc *bt_bmc)
> +{
> +       if (bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_B_BUSY)
> +               bt_outb(bt_bmc, BT_CTRL_B_BUSY, BT_CTRL);
> +}
> +
> +static void set_b2h_atn(struct bt_bmc *bt_bmc)
> +{
> +       bt_outb(bt_bmc, BT_CTRL_B2H_ATN, BT_CTRL);
> +}
> +
> +static u8 bt_read(struct bt_bmc *bt_bmc)
> +{
> +       return bt_inb(bt_bmc, BT_BMC2HOST);
> +}
> +
> +static ssize_t bt_readn(struct bt_bmc *bt_bmc, u8 *buf, size_t n)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < n; i++)
> +               buf[i] =3D bt_read(bt_bmc);
> +       return n;
> +}
> +
> +static void bt_write(struct bt_bmc *bt_bmc, u8 c)
> +{
> +       bt_outb(bt_bmc, c, BT_BMC2HOST);
> +}
> +
> +static ssize_t bt_writen(struct bt_bmc *bt_bmc, u8 *buf, size_t n)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < n; i++)
> +               bt_write(bt_bmc, buf[i]);
> +       return n;
> +}
> +
> +static void set_sms_atn(struct bt_bmc *bt_bmc)
> +{
> +       bt_outb(bt_bmc, BT_CTRL_SMS_ATN, BT_CTRL);
> +}
> +
> +static struct bt_bmc *file_bt_bmc(struct file *file)
> +{
> +       return container_of(file->private_data, struct bt_bmc, miscdev);
> +}
> +
> +static int bt_bmc_open(struct inode *inode, struct file *file)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +
> +       clr_b_busy(bt_bmc);
> +
> +       return 0;
> +}
> +
> +#define BT_BMC_BUFFER_SIZE 256
> +
> +static ssize_t bt_bmc_read(struct file *file, char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +       u8 len;
> +       int len_byte =3D 1;
> +       u8 kbuffer[BT_BMC_BUFFER_SIZE];
> +       ssize_t ret =3D 0;
> +       ssize_t nread;
> +
> +       if (!access_ok(VERIFY_WRITE, buf, count))
> +               return -EFAULT;
> +
> +       WARN_ON(*ppos);
> +
> +       if (wait_event_interruptible(bt_bmc->queue,
> +                               bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN=
))
> +               return -ERESTARTSYS;
> +
> +       set_b_busy(bt_bmc);
> +       clr_h2b_atn(bt_bmc);
> +       clr_rd_ptr(bt_bmc);
> +
> +       /* The BT frames start with the message length, not including
> +        * the length byte
> +        */
> +       kbuffer[0] =3D bt_read(bt_bmc);
> +       len =3D kbuffer[0];
> +
> +       /* We pass the length back as well */
> +       if (len + 1 > count)
> +               len =3D count - 1;
> +
> +       while (len) {
> +               nread =3D min_t(ssize_t, len, sizeof(kbuffer) - len_byte)=
;
> +
> +               bt_readn(bt_bmc, kbuffer + len_byte, nread);
> +
> +               if (copy_to_user(buf, kbuffer, nread + len_byte)) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +               len -=3D nread;
> +               buf +=3D nread + len_byte;
> +               ret +=3D nread + len_byte;
> +               len_byte =3D 0;
> +       }
> +
> +       clr_b_busy(bt_bmc);
> +
> +       return ret;
> +}
> +
> +static ssize_t bt_bmc_write(struct file *file, const char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +       u8 kbuffer[BT_BMC_BUFFER_SIZE];
> +       ssize_t ret =3D 0;
> +       ssize_t nwritten;
> +
> +       if (!access_ok(VERIFY_READ, buf, count))
> +               return -EFAULT;
> +
> +       WARN_ON(*ppos);
> +
> +       /* There's no interrupt for clearing bmc busy so we have to
> +        * poll
> +        */
> +       if (wait_event_interruptible(bt_bmc->queue,
> +                               !(bt_inb(bt_bmc, BT_CTRL) &
> +                                       (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN=
))))
> +               return -ERESTARTSYS;
> +
> +       clr_wr_ptr(bt_bmc);
> +
> +       while (count) {
> +               nwritten =3D min_t(ssize_t, count, sizeof(kbuffer));
> +               if (copy_from_user(&kbuffer, buf, nwritten)) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +
> +               bt_writen(bt_bmc, kbuffer, nwritten);
> +
> +               count -=3D nwritten;
> +               buf +=3D nwritten;
> +               ret +=3D nwritten;
> +       }
> +
> +       set_b2h_atn(bt_bmc);
> +
> +       return ret;
> +}
> +
> +static long bt_bmc_ioctl(struct file *file, unsigned int cmd,
> +               unsigned long param)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +
> +       switch (cmd) {
> +       case BT_BMC_IOCTL_SMS_ATN:
> +               set_sms_atn(bt_bmc);
> +               return 0;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int bt_bmc_release(struct inode *inode, struct file *file)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +
> +       set_b_busy(bt_bmc);
> +       return 0;
> +}
> +
> +static unsigned int bt_bmc_poll(struct file *file, poll_table *wait)
> +{
> +       struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> +       unsigned int mask =3D 0;
> +       uint8_t ctrl;
> +
> +       poll_wait(file, &bt_bmc->queue, wait);
> +
> +       ctrl =3D bt_inb(bt_bmc, BT_CTRL);
> +
> +       if (ctrl & BT_CTRL_H2B_ATN)
> +               mask |=3D POLLIN;
> +
> +       if (!(ctrl & (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN)))
> +               mask |=3D POLLOUT;
> +
> +       return mask;
> +}
> +
> +static const struct file_operations bt_bmc_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D bt_bmc_open,
> +       .read           =3D bt_bmc_read,
> +       .write          =3D bt_bmc_write,
> +       .release        =3D bt_bmc_release,
> +       .poll           =3D bt_bmc_poll,
> +       .unlocked_ioctl =3D bt_bmc_ioctl,
> +};
> +
> +static void poll_timer(unsigned long data)
> +{
> +       struct bt_bmc *bt_bmc =3D (void *)data;
> +
> +       bt_bmc->poll_timer.expires +=3D msecs_to_jiffies(500);
> +       wake_up(&bt_bmc->queue);
> +       add_timer(&bt_bmc->poll_timer);
> +}
> +
> +static irqreturn_t bt_bmc_irq(int irq, void *arg)
> +{
> +       struct bt_bmc *bt_bmc =3D arg;
> +       uint32_t reg;
> +
> +       reg =3D ioread32(bt_bmc->base + BT_CR2);
> +       reg &=3D BT_CR2_IRQ_H2B | BT_CR2_IRQ_HBUSY;
> +       if (!reg)
> +               return IRQ_NONE;
> +
> +       /* ack pending IRQs */
> +       iowrite32(reg, bt_bmc->base + BT_CR2);
> +
> +       wake_up(&bt_bmc->queue);
> +       return IRQ_HANDLED;
> +}
> +
> +static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> +               struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       uint32_t reg;
> +       int rc;
> +
> +       bt_bmc->irq =3D platform_get_irq(pdev, 0);
> +       if (!bt_bmc->irq)
> +               return -ENODEV;
> +
> +       rc =3D devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED=
,
> +                       DEVICE_NAME, bt_bmc);
> +       if (rc < 0) {
> +               dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> +               bt_bmc->irq =3D 0;
> +               return rc;
> +       }
> +
> +       /* Configure IRQs on the bmc clearing the H2B and HBUSY bits;
> +        * H2B will be asserted when the bmc has data for us; HBUSY
> +        * will be cleared (along with B2H) when we can write the next
> +        * message to the BT buffer
> +        */
> +       reg =3D ioread32(bt_bmc->base + BT_CR1);
> +       reg |=3D BT_CR1_IRQ_H2B | BT_CR1_IRQ_HBUSY;
> +       iowrite32(reg, bt_bmc->base + BT_CR1);
> +
> +       return 0;
> +}
> +
> +static int bt_bmc_probe(struct platform_device *pdev)
> +{
> +       struct bt_bmc *bt_bmc;
> +       struct device *dev;
> +       struct resource *res;
> +       int rc;
> +
> +       if (!pdev || !pdev->dev.of_node)
> +               return -ENODEV;
> +
> +       dev =3D &pdev->dev;
> +       dev_info(dev, "Found bt bmc device\n");
> +
> +       bt_bmc =3D devm_kzalloc(dev, sizeof(*bt_bmc), GFP_KERNEL);
> +       if (!bt_bmc)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(&pdev->dev, bt_bmc);
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(dev, "Unable to find resources\n");
> +               rc =3D -ENXIO;
> +               goto out_free;
> +       }
> +
> +       bt_bmc->base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (!bt_bmc->base) {
> +               rc =3D -ENOMEM;
> +               goto out_free;
> +       }
> +
> +       init_waitqueue_head(&bt_bmc->queue);
> +
> +       bt_bmc->miscdev.minor   =3D MISC_DYNAMIC_MINOR,
> +       bt_bmc->miscdev.name    =3D DEVICE_NAME,
> +       bt_bmc->miscdev.fops    =3D &bt_bmc_fops,
> +       bt_bmc->miscdev.parent =3D dev;
> +       rc =3D misc_register(&bt_bmc->miscdev);
> +       if (rc) {
> +               dev_err(dev, "Unable to register device\n");
> +               goto out_unmap;
> +       }
> +
> +       bt_bmc_config_irq(bt_bmc, pdev);
> +
> +       if (bt_bmc->irq) {
> +               dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
> +       } else {
> +               dev_info(dev, "No IRQ; using timer\n");
> +               setup_timer(&bt_bmc->poll_timer, poll_timer,
> +                               (unsigned long)bt_bmc);
> +               bt_bmc->poll_timer.expires =3D jiffies + msecs_to_jiffies=
(10);
> +               add_timer(&bt_bmc->poll_timer);
> +       }
> +
> +       iowrite32((BT_IO_BASE << BT_CR0_IO_BASE) |
> +                 (BT_IRQ << BT_CR0_IRQ) |
> +                 BT_CR0_EN_CLR_SLV_RDP |
> +                 BT_CR0_EN_CLR_SLV_WRP |
> +                 BT_CR0_ENABLE_IBT,
> +                 bt_bmc->base + BT_CR0);
> +
> +       clr_b_busy(bt_bmc);
> +
> +       return 0;
> +
> +out_unmap:
> +       devm_iounmap(&pdev->dev, bt_bmc->base);
> +
> +out_free:
> +       devm_kfree(dev, bt_bmc);
> +       return rc;
> +
> +}
> +
> +static int bt_bmc_remove(struct platform_device *pdev)
> +{
> +       struct bt_bmc *bt_bmc =3D dev_get_drvdata(&pdev->dev);
> +
> +       misc_deregister(&bt_bmc->miscdev);
> +       if (!bt_bmc->irq)
> +               del_timer_sync(&bt_bmc->poll_timer);
> +       devm_iounmap(&pdev->dev, bt_bmc->base);
> +       devm_kfree(&pdev->dev, bt_bmc);
> +       bt_bmc =3D NULL;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id bt_bmc_match[] =3D {
> +       { .compatible =3D "aspeed,bt-bmc" },
> +       { },
> +};
> +
> +static struct platform_driver bt_bmc_driver =3D {
> +       .driver =3D {
> +               .name           =3D DEVICE_NAME,
> +               .of_match_table =3D bt_bmc_match,
> +       },
> +       .probe =3D bt_bmc_probe,
> +       .remove =3D bt_bmc_remove,
> +};
> +
> +module_platform_driver(bt_bmc_driver);
> +
> +MODULE_DEVICE_TABLE(of, bt_bmc_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Alistair Popple <alistair@popple.id.au>");
> +MODULE_DESCRIPTION("Linux device interface to the BT interface");
> diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> index ec10cfef166a..9493842de93b 100644
> --- a/include/uapi/linux/Kbuild
> +++ b/include/uapi/linux/Kbuild
> @@ -74,6 +74,7 @@ header-y +=3D bpf_common.h
>  header-y +=3D bpf.h
>  header-y +=3D bpqether.h
>  header-y +=3D bsg.h
> +header-y +=3D bt-bmc.h
>  header-y +=3D btrfs.h
>  header-y +=3D can.h
>  header-y +=3D capability.h
> diff --git a/include/uapi/linux/bt-bmc.h b/include/uapi/linux/bt-bmc.h
> new file mode 100644
> index 000000000000..d9ec766a63d0
> --- /dev/null
> +++ b/include/uapi/linux/bt-bmc.h
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_BT_BMC_H
> +#define _UAPI_LINUX_BT_BMC_H
> +
> +#include <linux/ioctl.h>
> +
> +#define __BT_BMC_IOCTL_MAGIC   0xb1
> +#define BT_BMC_IOCTL_SMS_ATN   _IO(__BT_BMC_IOCTL_MAGIC, 0x00)
> +
> +#endif /* _UAPI_LINUX_BT_BMC_H */
> --
> 2.7.4
>
