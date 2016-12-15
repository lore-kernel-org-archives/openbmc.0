Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfQnz17t1zDw5P
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 18:59:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OEzE7x+r"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id x23so5318363pgx.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5atGO8jMIjuQznrFkUIFFQDtYO0HW97/h6jzwu1Xgk=;
 b=OEzE7x+rRmpX/+L1K53peqT8RkmV46/CQuL4MjQrRdVT4up32O4qWcvW2od2QLZ06Q
 PI33QSNMEEPiTxEdxiX0NCSQLX5x1dBbiejkW/sL2KgzZamxsi8XbSyQ0qAjC8tpYa26
 eNseNCCrX8JBWYC29Z+iVYUkwsmNwg/maCA2LooDeWvaGp0+MiJVUy0OHLOW/Ri197kk
 MQz5Op6xinDzeAU7VPWejuWZ+HV4h2FHmMqMQTL8qUMlU4+XW2EYYta5yYA8qRhwGP6q
 ZGaKJhcZX9uGXdgbiNY47qrcXCgi8l8oOigX62jlaBIfojIPQM1hZGDrBzFHs76h9h2o
 xIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5atGO8jMIjuQznrFkUIFFQDtYO0HW97/h6jzwu1Xgk=;
 b=jRblp4hGBEdW8xNARkuov2I2GqZL/tL/PeZMLahiONBRwCViMzH3zm6sbubaWxzXx1
 9CH9Yn04CjOByF5CeE6N35buQV2kdYezicKdMWt05iZ4j5zhrKslnmrCgubG9i3xyvOc
 6jY+1CJcWG8fpwvIdYbe07y6hvf2DpyMtjzScjS+U22d4cUUhqDSwihYGgyrSOWbcAce
 xZWMxeVkrz2JqwZyceyIDpq5V/+JuBnKZLOsojBXhBKvGu8jKRHsjw60qnfnSiDky8LT
 pkQFwShh7MPwBXfR3FbNcUGcaJPIZRoR3HiOjqm5f0nFl1BLyKUfoOEnInHxJyPzozw4
 YHHA==
X-Gm-Message-State: AKaTC013OgSAiIdpTU6mYEpUgo7UFH22QdnUgEHt1cULY/Y4+8ZlS1zApdUlty1bvcDJxA==
X-Received: by 10.84.129.35 with SMTP id 32mr23935plb.179.1481788772339;
 Wed, 14 Dec 2016 23:59:32 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id i194sm1979910pgc.46.2016.12.14.23.59.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Dec 2016 23:59:31 -0800 (PST)
Message-ID: <1481788767.814.8.camel@gmail.com>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Thu, 15 Dec 2016 18:59:27 +1100
In-Reply-To: <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
 <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 15 Dec 2016 07:59:36 -0000

On Tue, 2016-12-13 at 12:26 +1100, Joel Stanley wrote:
> On Fri, Dec 9, 2016 at 4:43 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> 
> Explain why we need this chardev, why it needs ioctls, etc.
> 

Yeah, we should probably also work on the name and stuff

> > ---
> >  drivers/misc/Kconfig           |   7 +
> >  drivers/misc/Makefile          |   2 +
> >  drivers/misc/mbox-host.c       | 326
> > +++++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/mbox-host.h |  18 +++
> >  4 files changed, 353 insertions(+)
> >  create mode 100644 drivers/misc/mbox-host.c
> >  create mode 100644 include/uapi/linux/mbox-host.h
> > 
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index a216b46..44f191d 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -804,6 +804,13 @@ config PANEL_BOOT_MESSAGE
> >           An empty message will only clear the display at driver
> > init time. Any other
> >           printf()-formatted message is valid with newline and
> > escape codes.
> > 
> > +config MBOX_HOST
> > +       depends on ARCH_ASPEED
> 
> or COMPILE_TEST

Is both a good solution?

> 
> > +       bool "Build MBOX driver for BMC to HOST communication"
> > +       default "n"
> 
> If it's depending on ARCH_ASPEED I think default y is ok.
> 

Yes

> > +       ---help---
> > +         Build the MBOX driver
> 
> More text here please.
> 
> > +
> >  source "drivers/misc/c2port/Kconfig"
> >  source "drivers/misc/eeprom/Kconfig"
> >  source "drivers/misc/cb710/Kconfig"
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index b2fb6dbf..7bcaf30 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> 
> "misc seems a bit too misc" - Andrew Jeffery.
> 
> How about drivers/soc? Or drivers/mfd?

I think we settled on mailbox?

> 
> > +#define DEVICE_NAME    "mbox-host"
> > +
> > +#define MBOX_NUM_REGS 16
> > +#define MBOX_NUM_DATA_REGS 14
> > +
> > +#define MBOX_DATA_0 0x00
> > +#define MBOX_STATUS_0 0x40
> > +#define MBOX_STATUS_1 0x44
> > +#define MBOX_BMC_CTRL 0x48
> > +       #define MBOX_CTRL_RECV 0x80
> > +       #define MBOX_CTRL_MASK 0x02
> > +       #define MBOX_CTRL_SEND 0x01
> 
> If you want to do show these are bits in the CTRL register, do this.
> I
> think it's more readable to represent the bits as shifts, or even
> better, using the BIT() macro.
> 
> #define MBOX_BMC_CTRL 0x48
> #define   MBOX_CTRL_RECV BIT(7)
> #define   MBOX_CTRL_MASK BIT(1)
> 
> etc.
> 

Ah yes looks much better now, thanks

> > +#define MBOX_HOST_CTRL 0x4c
> > +#define MBOX_INTERRUPT_0 0x50
> > +#define MBOX_INTERRUPT_1 0x54
> > +
> > +
> > +static u8 mbox_inb(struct mbox_host *mbox_host, int reg)
> > +{
> > +       return ioread8(mbox_host->base + reg);
> > +}
> > +
> > +static void mbox_outb(struct mbox_host *mbox_host, u8 data, int
> > reg)
> > +{
> > +       iowrite8(data, mbox_host->base + reg);
> > +}
> 
> As mentioned in the other email, all access to the LPC address space
> is through regmap.

Yes.

> 
> > +
> > +static struct mbox_host *file_mbox_host(struct file *file)
> > +{
> > +       return container_of(file->private_data, struct mbox_host,
> > miscdev);
> > +}
> > +
> > +static int mbox_host_open(struct inode *inode, struct file *file)
> > +{
> > +       return 0;
> > +}
> 
> This means userspace can open this device an unlimited number of
> times. I think we only want one user at a time?
> 

That would be wise yes

> 
> > +static int mbox_host_release(struct inode *inode, struct file
> > *file)
> > +{
> > +       return 0;
> > +}
> 
> Why not omit the callback?
> 
> > +
> > +static unsigned int mbox_host_poll(struct file *file, poll_table
> > *wait)
> > +{
> > +       struct mbox_host *mbox_host = file_mbox_host(file);
> > +       unsigned int mask = 0;
> > +
> > +       poll_wait(file, &mbox_host->queue, wait);
> > +
> > +       if (mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> > +               mask |= POLLIN;
> > +
> > +       return mask;
> > +}
> > +
> > +static const struct file_operations mbox_host_fops = {
> > +       .owner          = THIS_MODULE,
> > +       .open           = mbox_host_open,
> > +       .read           = mbox_host_read,
> > +       .write          = mbox_host_write,
> > +       .release        = mbox_host_release,
> > +       .poll           = mbox_host_poll,
> > +       .unlocked_ioctl = mbox_host_ioctl,
> > +};
> > +
> > +static void poll_timer(unsigned long data)
> > +{
> > +       struct mbox_host *mbox_host = (void *)data;
> > +
> > +       mbox_host->poll_timer.expires += msecs_to_jiffies(500);
> 
> Why 500?

Why not? I feel like I should test and justify a number, I honestly
have no idea whats good but 500msecs feels decent... perhaps I'll
determine a better number, or a good reason for 500 in my infinite
spare time ;)


Thanks for the review,

Cyril

> 
> > +       wake_up(&mbox_host->queue);
> > +       add_timer(&mbox_host->poll_timer);
> > +}
> > +
