Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wN8Fh09fbzDqL0
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 18:16:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jnny9Ce8"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so1711047ywe.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l2GtqByDKjkPUDCNkw5leBHN5435KD3mTBeFInm39YE=;
 b=Jnny9Ce8CrkOWHppSTES+5aYisTXA76dj9prGofBPTJbdAaqbwm6qewbVxYQUZe45l
 mtNp43eRdkVqvgtKNzJrrrBlA29KjlfY2bgGOs+oZRnHaY5qS2DGNWbs8m6vgn+khvhT
 zWtJJ2DfckMSlDLdw4oQ6wCvzcIlM3kC7QMDPg0qqotJcJCAp2J/RjCynfMLO+K9eMoZ
 EAOVaaeNYRm+3jfEXLCYxRxe+w5cPtgt4DB6VX4vb1vekPxYMGgYw3ukl4kcjo0RfJN7
 afdeT1sK/Rpa94VvhFp2LGnosE/mzszbRzOpnhwxrFoOQoAqSZCrtZoCfElG23w0/h6a
 0rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l2GtqByDKjkPUDCNkw5leBHN5435KD3mTBeFInm39YE=;
 b=V8d8VskSg+3LgM5NBtq11m/p6VIqEUL+7ZE6/9AsIUPSuaGc6s2+JfUxZwo2L+gEkY
 CIoLHGjEBV+e/dx1aaxeEaAVNo//EVIuwsSVSUtLdybkN6FWHwZZbhWEFniBMwL378Tt
 OcC7sHx+rU5yh/OknpOkQ2gEuTYLC3lzxzIiBNHoUrtMtUi8ks8gg48indSMs2ZOINTF
 b7KrMGe1hLmiBOiNTCtEKpzlFYjjXf6Ggkk5NrHmE1u2Y0hDg8VwxaQOXei7mUs3SQZf
 dfr2pK7MwVP6Vnxc/md0HV9l5T8slMiWHB2JXJ72EqiYpCfgt51bj2oFhecqfXeJcnOs
 cdTA==
X-Gm-Message-State: AODbwcAi+92tYewOyYKddAfXcp+hwowy6mF7hslWOtdZK3djur9gzNE6
 0vV98MyPLtm0ADpiVGLE9fyHX69ER4PHRPs=
X-Received: by 10.129.46.66 with SMTP id u63mr3573536ywu.219.1494404165933;
 Wed, 10 May 2017 01:16:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 10 May 2017 01:15:45 -0700 (PDT)
In-Reply-To: <1492714297-13845-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492714297-13845-1-git-send-email-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 May 2017 17:45:45 +0930
X-Google-Sender-Auth: hvQAw3HRvZ7y2Lg53BIy9mWq818
Message-ID: <CACPK8XdP+9G_BGqupcbHCYCsNyLvO0TdsNb8E7JfqDkcmoKhmw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add FSI SBEFIFO driver
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 eajames <eajames@linux.vnet.ibm.com>, 
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
X-List-Received-Date: Wed, 10 May 2017 08:16:08 -0000

Hi Brad,

I started looking at this a while ago and didn't get around to
finishing. I'm sending my comments for the bit I did look at so you
can fix those issues.

On Fri, Apr 21, 2017 at 4:21 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> IBM POWER9 processors contain some embedded hardware and software bits
> collectively referred to as the self boot engine (SBE).  One role of
> the SBE is to act as a proxy that provides access to the registers of
> the POWER chip from other (embedded) systems.

Is are "other embedded systems" service processors (FSP, BMC)?

> The POWER9 chip contains a hardware frontend for communicating with
> the SBE from remote systems called the SBEFIFO.  The SBEFIFO logic
> is contained within an FSI CFAM (see Documentation/fsi) and as such
> the driver implements an FSI bus device.
>
> The SBE expects to communicate using a defined wire protocol; however,
> the driver knows nothing of the protocol and only provides raw access
> to the fifo device to userspace applications wishing to communicate with
> the SBE using the wire protocol.
>
> The SBEFIFO consists of two hardware fifos.  The upstream fifo is used by
> the driver to transfer data to the SBE on the POWER chip, from the system
> hosting the driver.  The downstream fifo is used by the driver to transfer
> data from the SBE on the power chip to the system hosting the driver.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v2:
>     Unexpand list_first_entry_or_null.
>     Unexpand list_for_each_entry_safe.
>     Reschedule a full 500ms later when fifos are busy.
> ---
>  drivers/fsi/Kconfig       |   6 +
>  drivers/fsi/Makefile      |   1 +
>  drivers/fsi/fsi-sbefifo.c | 810 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 817 insertions(+)
>  create mode 100644 drivers/fsi/fsi-sbefifo.c
>
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index c78b9b6e..087f239 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -18,6 +18,12 @@ config FSI_MASTER_GPIO
>         ---help---
>         This option enables a FSI master driver using GPIO lines.
>
> +config FSI_SBEFIFO
> +       tristate "SBEFIFO FSI client device driver"
> +       depends on FSI
> +       ---help---
> +       This option enables an FSI based SBEFIFO device driver.


"You should select this for kernels that run on service processors for
IBM Power9 systems" or something.

> +
>  config FSI_SCOM
>         tristate "SCOM FSI client device driver"
>         depends on FSI
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 3a106ba..edd84b2 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -1,5 +1,6 @@
>
>  obj-$(CONFIG_FSI) += fsi-core.o
>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
> +obj-$(CONFIG_FSI_SBEFIFO) += fsi-sbefifo.o
>  obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>  obj-$(CONFIG_FSI_I2C) += i2c/
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> new file mode 100644
> index 0000000..c289508
> --- /dev/null
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -0,0 +1,810 @@
> +/*
> + * Copyright (C) IBM Corporation 2017
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Check out the wording we use in other drivers.

> + */
> +
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/idr.h>
> +#include <linux/fsi.h>
> +#include <linux/list.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +#include <linux/uaccess.h>
> +
> +/*
> + * The SBEFIFO is a pipe-like FSI device for communicating with
> + * the self boot engine on POWER processors.
> + */
> +
> +#define DEVICE_NAME            "sbefifo"
> +#define FSI_ENGID_SBE          0x22

Should these engine IDs be kept in in a common fsi header?

> +#define SBEFIFO_BUF_CNT                32
> +
> +#define SBEFIFO_UP             0x00    /* Up register offset */
> +#define SBEFIFO_DWN            0x40    /* Down register offset */
> +
> +#define SBEFIFO_STS            0x04
> +#define   SBEFIFO_EMPTY                        BIT(20)

Are STS and EOT_RAISE bits too? It's confusing to have a mixture.

> +#define SBEFIFO_EOT_RAISE      0x08
> +#define   SBEFIFO_EOT_MAGIC            0xffffffff
> +#define SBEFIFO_EOT_ACK                0x14
> +
> +struct sbefifo {
> +       struct timer_list poll_timer;
> +       struct fsi_device *fsi_dev;
> +       struct miscdevice mdev;
> +       wait_queue_head_t wait;
> +       struct list_head link;
> +       struct list_head xfrs;
> +       struct kref kref;

I tried to work out what the kref was counting. Can you explain how
the reference and timers are used?

> +       spinlock_t lock;
> +       char name[32];

The miscdev has a name too. What do we need this one for?

> +       int idx;
> +       int rc;

Try to create some groupings here for things that are common.


struct sbefifo {
       struct fsi_device *fsi_dev;
       struct miscdevice mdev;

       int idx;

       struct timer_list poll_timer;
       wait_queue_head_t wait;
       struct list_head link;

       struct list_head xfrs;
       struct kref kref;
       spinlock_t lock;

       int rc;
}

> +};
> +
> +struct sbefifo_buf {
> +       u32 buf[SBEFIFO_BUF_CNT];
> +       unsigned long flags;
> +#define SBEFIFO_BUF_FULL               1
> +       u32 *rpos;
> +       u32 *wpos;
> +};
> +
> +struct sbefifo_xfr {
> +       struct sbefifo_buf *rbuf;
> +       struct sbefifo_buf *wbuf;
> +       struct list_head client;
> +       struct list_head xfrs;
> +       unsigned long flags;
> +#define SBEFIFO_XFR_WRITE_DONE         1
> +#define SBEFIFO_XFR_RESP_PENDING       2
> +#define SBEFIFO_XFR_COMPLETE           3
> +#define SBEFIFO_XFR_CANCEL             4
> +};
> +
> +struct sbefifo_client {
> +       struct sbefifo_buf rbuf;
> +       struct sbefifo_buf wbuf;
> +       struct list_head xfrs;
> +       struct sbefifo *dev;
> +       struct kref kref;
> +};
> +
> +static struct list_head sbefifo_fifos;
> +
> +static DEFINE_IDA(sbefifo_ida);
> +
> +static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> +{
> +       return fsi_device_read(sbefifo->fsi_dev, reg, word, sizeof(*word));
> +}
> +
> +static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
> +{
> +       return fsi_device_write(sbefifo->fsi_dev, reg, &word, sizeof(word));
> +}
> +
> +static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
> +{
> +       return sbefifo_inw(sbefifo, SBEFIFO_DWN, word);
> +}
> +
> +static int sbefifo_writew(struct sbefifo *sbefifo, u32 word)
> +{
> +       return sbefifo_outw(sbefifo, SBEFIFO_UP, word);
> +}
> +
> +static int sbefifo_ack_eot(struct sbefifo *sbefifo)
> +{
> +       u32 discard;
> +       int ret;
> +
> +        /* Discard the EOT word. */
> +       ret = sbefifo_readw(sbefifo, &discard);
> +       if (ret)
> +               return ret;
> +
> +       return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
> +                       SBEFIFO_EOT_MAGIC);
> +}
> +
> +static size_t sbefifo_dev_nwreadable(u32 sts)
> +{
> +       static const u32 FIFO_NTRY_CNT_MSK = 0x000f0000;
> +       static const unsigned int FIFO_NTRY_CNT_SHIFT = 16;
> +
> +       return (sts & FIFO_NTRY_CNT_MSK) >> FIFO_NTRY_CNT_SHIFT;
> +}
> +
> +static size_t sbefifo_dev_nwwriteable(u32 sts)
> +{
> +       static const size_t FIFO_DEPTH = 8;
> +
> +       return FIFO_DEPTH - sbefifo_dev_nwreadable(sts);
> +}
> +
> +static void sbefifo_buf_init(struct sbefifo_buf *buf)
> +{
> +       WRITE_ONCE(buf->rpos, buf->buf);
> +       WRITE_ONCE(buf->wpos, buf->buf);
> +}
> +
> +static size_t sbefifo_buf_nbreadable(struct sbefifo_buf *buf)

non-blocking readable?

> +{
> +       size_t n;
> +       u32 *rpos = READ_ONCE(buf->rpos);
> +       u32 *wpos = READ_ONCE(buf->wpos);
> +
> +       if (test_bit(SBEFIFO_BUF_FULL, &buf->flags))
> +               n = SBEFIFO_BUF_CNT;
> +       else if (rpos <= wpos)
> +               n = wpos - rpos;
> +       else
> +               n = (buf->buf + SBEFIFO_BUF_CNT) - rpos;
> +
> +       return n << 2;
> +}
> +
> +static size_t sbefifo_buf_nbwriteable(struct sbefifo_buf *buf)
> +{
> +       size_t n;
> +       u32 *rpos = READ_ONCE(buf->rpos);
> +       u32 *wpos = READ_ONCE(buf->wpos);
> +
> +       if (test_bit(SBEFIFO_BUF_FULL, &buf->flags))
> +               n = 0;
> +       else if (wpos < rpos)
> +               n = rpos - wpos;
> +       else
> +               n = (buf->buf + SBEFIFO_BUF_CNT) - wpos;
> +
> +       return n << 2;
> +}
> +
> +/*
> + * Update pointers and flags after doing a buffer read.  Return true if the
> + * buffer is now empty;
> + */
> +static bool sbefifo_buf_readnb(struct sbefifo_buf *buf, size_t n)

n is number? or the length of the buffer?

> +{
> +       u32 *rpos = READ_ONCE(buf->rpos);
> +       u32 *wpos = READ_ONCE(buf->wpos);
> +
> +       if (n)
> +               clear_bit(SBEFIFO_BUF_FULL, &buf->flags);
> +
> +       rpos += (n >> 2);
> +       if (rpos == buf->buf + SBEFIFO_BUF_CNT)
> +               rpos = buf->buf;
> +
> +       WRITE_ONCE(buf->rpos, rpos);
> +       return rpos == wpos;
> +}
> +
