Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHY8x4RDNzDq5W
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 16:40:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZNXXzUQg"; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id f2so9375297uaf.3
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 21:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vyp3w8xbqUPevUk+8GlgYds4W0d+ZzH/kOb1BXwrXBQ=;
 b=ZNXXzUQgaQg2MWxMFpBnAfOmInIAAQ34mz5S/H3Q4fc+p4/9O5lgJ7s2HAgJPmJIXG
 o23Fl3S5c/S2HJ6kLncmS1P9unwHbtnIONKr9xFKIZdSB2Or60tx6fAeKJXTGk7lyG+b
 5RxbcSUVZlfP6Jvr8osoQWS9YMmjs+SAejLIhCMXAX0mSvF05poRhB+PBD0ELU+trk4K
 d6yLeDhqCsUswIUCxQASHse75nj1nHzZHXOdueoX/vazxm3kdPxMLz3wmT1BvabrpU3J
 jwc9Cj1JnJt6TTKGyg+yav+Kkght1dU0HQimtY1DiSez9kfCyJ1TTvBuWtMSCcF8te1v
 JvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vyp3w8xbqUPevUk+8GlgYds4W0d+ZzH/kOb1BXwrXBQ=;
 b=LWOz7dBc+AYMTOxvvYLNftfF7Ph3jaJZ/NwN079mPHSUjePZeyKjPTR0IIosg4+ui9
 2mdQzvd/nR5e5tRwg91vRiHT7ykipWfGeVZlmKYcvITz0hGx86NioD1CeA1NGWjVVQcM
 LofAKjTSVXZMv8rB2ORGBpNJwSDqBhumA4OdLUIOsAmVO3WUM+mrPXBXl59OEhit7K5+
 1LK1vbd972r3IAGLOkA81HvADq/7kHNj0AxVCwEhqapTX97jOe4GyrBmQSpC5KJd9BrW
 0TdMQitCCRK/rZDa+nnNYo0Tb7xf/Vs157AolyBEwwApIbYqqqvUPW2BsM/yDCP2Br8+
 vnVA==
X-Gm-Message-State: AIkVDXK4PvjyIdF2WfA/aYcYMHEw0qK/gc39QGWYezphy8L1ovzG8AROcujjfExcL0BS4xyfw2e/nGlDWj1iLA==
X-Received: by 10.159.38.229 with SMTP id 92mr7040248uay.102.1486446045860;
 Mon, 06 Feb 2017 21:40:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Mon, 6 Feb 2017 21:40:25 -0800 (PST)
In-Reply-To: <20170112002910.3650-5-cyrilbur@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-5-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2017 16:10:25 +1030
X-Google-Sender-Auth: Qf8s_uCxO5rxRDSVparlO5YDiPA
Message-ID: <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
 Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Xo Wang <xow@google.com>,
 Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 07 Feb 2017 05:40:50 -0000

On Thu, Jan 12, 2017 at 10:59 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> This provides access to the mbox registers on the ast2400 and ast2500
> boards.

s/boards/SoCs/

>
> This driver allows arbitrary reads and writes to the 16 data registers as
> the other end may have configured the mbox hardware to provide an
> interrupt when a specific register gets written to.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Send this to lkml as well next time you submit.

> ---
>  drivers/mailbox/Kconfig       |   9 ++
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/aspeed-mbox.c | 334 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/mailbox/aspeed-mbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ceff415f201c..10a7f3f2765c 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -152,4 +152,13 @@ config BCM_PDC_MBOX
>           Mailbox implementation for the Broadcom PDC ring manager,
>           which provides access to various offload engines on Broadcom
>           SoCs. Say Y here if you want to use the Broadcom PDC.
> +
> +config ASPEED_MBOX

Call this ASPEED_LPC_MAILBOX, as it's a in the LPC IP block.

> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +       bool "Aspeed ast2400/2500 Mailbox Controller"

Call this Aspeed LPC Mailbox Controller, as the layout is shared by
SoCs other than the 2500 and 2400.

> +       default "y"
> +       ---help---
> +         Provides a driver for the MBOX registers found on Aspeed SOCs
> +         (AST2400 and AST2500). This driver provides a device for aspeed
> +         mbox registers
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 7dde4f609ae8..db5b4f3f29e0 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -31,3 +31,5 @@ obj-$(CONFIG_HI6220_MBOX)     += hi6220-mailbox.o
>  obj-$(CONFIG_BCM_PDC_MBOX)     += bcm-pdc-mailbox.o
>
>  obj-$(CONFIG_TEGRA_HSP_MBOX)   += tegra-hsp.o
> +
> +obj-$(CONFIG_ASPEED_MBOX)      += aspeed-mbox.o
> diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
> new file mode 100644
> index 000000000000..c4ee6ba228ea
> --- /dev/null
> +++ b/drivers/mailbox/aspeed-mbox.c

> +
> +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +       char __user *p = buf;
> +       ssize_t ret;
> +       int i;
> +
> +       if (!access_ok(VERIFY_WRITE, buf, count))
> +               return -EFAULT;

As discussed in the LPC driver review:

 "And don't call access_ok(), it's racy and no driver should ever do that."

Make sure all of the things you fixed in that driver are fixed in this one.

> +
> +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +               return -EINVAL;
> +
> +       if (file->f_flags & O_NONBLOCK) {
> +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                               ASPEED_MBOX_CTRL_RECV))
> +                       return -EAGAIN;
> +       } else if (wait_event_interruptible(mbox->queue,
> +                               aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                               ASPEED_MBOX_CTRL_RECV)) {
> +               return -ERESTARTSYS;
> +       }
> +
> +       mutex_lock(&mbox->mutex);
> +
> +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +               uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> +
> +               ret = __put_user(reg, p);
> +               if (ret)
> +                       goto out_unlock;
> +
> +               p++;
> +               count--;
> +       }
> +
> +       /* ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */

W1C? Write to clear?

> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +       ret = p - buf;
> +
> +out_unlock:
> +       mutex_unlock(&mbox->mutex);
> +       return ret;
> +}
> +

> +module_platform_driver(aspeed_mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("ASpeed mailbox device driver");

ASPEED or Aspeed.

> --
> 2.11.0
>
