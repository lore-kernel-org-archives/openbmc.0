Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td29s4Dd1zDvkS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 12:26:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFtD581U"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id b35so10393087uaa.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 17:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=beqthRvvHJN1irJf5+6VqZLb1leJ6ufx2lKWVu6hhuI=;
 b=WFtD581UDJQ0skTLXSSDIq9flWBXzL0JTGteOCGDL2dgtMzPKsfJmBuIKCp2tDFQDG
 VPx9lj+u4WUjxFyvjjpIOijbzUKvTEoKB6B7sn5lWJcC16I1wfEgExdPpoGEB/tv8vqi
 1PU9smrP88SgTq2YhiNTkig2H/ZSaxmd934wyxYxEAKdevW72P1m/OmiN1U37MhPJFEE
 1TgeNF+xpeG5P5HBFAUZtwpEtzTIkjgl61CPumMXhVuCqOU1qqwEcGomry/V9ebnpvnZ
 nIp+V+O7e7199jomGwx/YJ7AGNlK26wCj+N9FAi6CvfhMdq4cnUBoCZupFpQYsVtDiku
 ozaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=beqthRvvHJN1irJf5+6VqZLb1leJ6ufx2lKWVu6hhuI=;
 b=PzdeH+gSoFyuOWhegylZniEyhkhTu1wXej37efo1NCCJMaDF8GmjVQEOIlUC6sF0Hu
 doazQFJWzplwIUFXC4dqJd/10g6Xq2PR/gCRHHKqbUKMPQCN9COCo0FU18+brSnZ7ZF7
 T+iMyXsKPZiwMR8+r6nMJ/UaHrMwV285sw17nzg0ss4LUGuOPXP7sY2s/Dh28/wkE6MA
 lyCWPctGkfkDLWLKNgwWbcFnFJDPwcKbcm3hwRHH68pYHQ7aom1NJkkVLjLBUDJ/6R/E
 S8HFVtIXEmQ7pitWvNZRMg3GdYwhRUJI3JNjJFTw7BtOhWBotAGDBj+n1c4Su/PkEApt
 qp2w==
X-Gm-Message-State: AKaTC00hLyxFSVcYhKdd7D0BQva1TPsyNT0KWq8QsJ/2irR51j+4UWg4f41iXi45i1Eq8Vhh+HyXesSXGA6kRw==
X-Received: by 10.159.34.41 with SMTP id 38mr29690745uad.160.1481592415323;
 Mon, 12 Dec 2016 17:26:55 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 17:26:34 -0800 (PST)
In-Reply-To: <20161209054323.7320-3-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 12:26:34 +1100
X-Google-Sender-Auth: htWhaDn91u0YyIRcNbV_8PsmLMQ
Message-ID: <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 13 Dec 2016 01:26:58 -0000

On Fri, Dec 9, 2016 at 4:43 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Explain why we need this chardev, why it needs ioctls, etc.

> ---
>  drivers/misc/Kconfig           |   7 +
>  drivers/misc/Makefile          |   2 +
>  drivers/misc/mbox-host.c       | 326 +++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/mbox-host.h |  18 +++
>  4 files changed, 353 insertions(+)
>  create mode 100644 drivers/misc/mbox-host.c
>  create mode 100644 include/uapi/linux/mbox-host.h
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index a216b46..44f191d 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -804,6 +804,13 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init time. Any other
>           printf()-formatted message is valid with newline and escape codes.
>
> +config MBOX_HOST
> +       depends on ARCH_ASPEED

or COMPILE_TEST

> +       bool "Build MBOX driver for BMC to HOST communication"
> +       default "n"

If it's depending on ARCH_ASPEED I think default y is ok.

> +       ---help---
> +         Build the MBOX driver

More text here please.

> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index b2fb6dbf..7bcaf30 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile

"misc seems a bit too misc" - Andrew Jeffery.

How about drivers/soc? Or drivers/mfd?

> +#define DEVICE_NAME    "mbox-host"
> +
> +#define MBOX_NUM_REGS 16
> +#define MBOX_NUM_DATA_REGS 14
> +
> +#define MBOX_DATA_0 0x00
> +#define MBOX_STATUS_0 0x40
> +#define MBOX_STATUS_1 0x44
> +#define MBOX_BMC_CTRL 0x48
> +       #define MBOX_CTRL_RECV 0x80
> +       #define MBOX_CTRL_MASK 0x02
> +       #define MBOX_CTRL_SEND 0x01

If you want to do show these are bits in the CTRL register, do this. I
think it's more readable to represent the bits as shifts, or even
better, using the BIT() macro.

#define MBOX_BMC_CTRL 0x48
#define   MBOX_CTRL_RECV BIT(7)
#define   MBOX_CTRL_MASK BIT(1)

etc.

> +#define MBOX_HOST_CTRL 0x4c
> +#define MBOX_INTERRUPT_0 0x50
> +#define MBOX_INTERRUPT_1 0x54
> +

> +
> +static u8 mbox_inb(struct mbox_host *mbox_host, int reg)
> +{
> +       return ioread8(mbox_host->base + reg);
> +}
> +
> +static void mbox_outb(struct mbox_host *mbox_host, u8 data, int reg)
> +{
> +       iowrite8(data, mbox_host->base + reg);
> +}

As mentioned in the other email, all access to the LPC address space
is through regmap.

> +
> +static struct mbox_host *file_mbox_host(struct file *file)
> +{
> +       return container_of(file->private_data, struct mbox_host, miscdev);
> +}
> +
> +static int mbox_host_open(struct inode *inode, struct file *file)
> +{
> +       return 0;
> +}

This means userspace can open this device an unlimited number of
times. I think we only want one user at a time?


> +static int mbox_host_release(struct inode *inode, struct file *file)
> +{
> +       return 0;
> +}

Why not omit the callback?

> +
> +static unsigned int mbox_host_poll(struct file *file, poll_table *wait)
> +{
> +       struct mbox_host *mbox_host = file_mbox_host(file);
> +       unsigned int mask = 0;
> +
> +       poll_wait(file, &mbox_host->queue, wait);
> +
> +       if (mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> +               mask |= POLLIN;
> +
> +       return mask;
> +}
> +
> +static const struct file_operations mbox_host_fops = {
> +       .owner          = THIS_MODULE,
> +       .open           = mbox_host_open,
> +       .read           = mbox_host_read,
> +       .write          = mbox_host_write,
> +       .release        = mbox_host_release,
> +       .poll           = mbox_host_poll,
> +       .unlocked_ioctl = mbox_host_ioctl,
> +};
> +
> +static void poll_timer(unsigned long data)
> +{
> +       struct mbox_host *mbox_host = (void *)data;
> +
> +       mbox_host->poll_timer.expires += msecs_to_jiffies(500);

Why 500?

> +       wake_up(&mbox_host->queue);
> +       add_timer(&mbox_host->poll_timer);
> +}
> +
