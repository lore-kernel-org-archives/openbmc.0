Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJ0BJ6DQNzDq8f
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 09:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNIwYumo"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 194so13259733pgd.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwV6+QffEDuQt48VSA/rJ6Azb/DWsgh6SqJqnRZ+XmU=;
 b=lNIwYumokIqoKav240jpoT61HqNqGBxPKGN7A/m4mbwPD+0mmWc6A/U09taujy99ui
 9JsCITFzxmaq/DEFO5rNWIwYh8LyXrlmI/5lhoXuKXORQTAFbtQtmzH78ls6I17l22ZI
 7y1zKHbtbFnT2RCKXQIo9hPzptcqdCH+MOgeJT8ILGdnxpR8DM+TkxlMFc60EzGrbl15
 GuZrBFbWaHGewP1mLQHZobph0eK282eAcLfCUwT5t1s79fkxEKUyOJ4PpZHjRVmBzef8
 aATYPTqZZwEjCu3i+uV9xfYtNErwKD//u6NGRMwJ0WzYcvjRmJ4tF+yKuZBTOgK3qejU
 CPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwV6+QffEDuQt48VSA/rJ6Azb/DWsgh6SqJqnRZ+XmU=;
 b=sxKajSmdagipm2Y4n2zO4NQQXnazlD7VkX4/OW2XYa87q0ivmB3sK9BidW2lve2pEt
 Y9hdP8E82KmaxLL3gq0PSWFZA3biZ0zLal4csS8HvTWemvzda0L1FoueogG2qDh8xPHf
 jnCbVbsMUmPm2TXVuWy/JK9HvOEc/mHIBGLFafbL2uLAjrrzonkKi8X8KtLtxAgDiFDj
 Lds4SFaGv5A4m/3/7ojqP/8MkQNsIzHGAHhb18jEGjdJ7EcGkeUKrh//PlBzws4a2HlT
 i11vRE+756hIg8CeBo27fStUKpAH/g2LWRxh1OKZT8+4pCkF9pj1YvyuQeGAIRg8vYg4
 /RjA==
X-Gm-Message-State: AIkVDXL7/c9ZSEgguuh9ZWYjrmrXOs1oU8yD46ZUGl2CkXbseQLlx+KZ4qn0TNyzORL/xQ==
X-Received: by 10.99.94.71 with SMTP id s68mr22850230pgb.181.1486508310875;
 Tue, 07 Feb 2017 14:58:30 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 191sm14001465pgd.40.2017.02.07.14.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Feb 2017 14:58:30 -0800 (PST)
Message-ID: <1486508229.3824.1.camel@gmail.com>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, Arnd Bergmann
 <arnd@arndb.de>, gregkh@linuxfoundation.org, Mark Rutland
 <mark.rutland@arm.com>,  Rob Herring <robh+dt@kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Xo Wang <xow@google.com>, Jeremy
 Kerr <jk@ozlabs.org>
Date: Wed, 08 Feb 2017 09:57:09 +1100
In-Reply-To: <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-5-cyrilbur@gmail.com>
 <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 07 Feb 2017 22:58:33 -0000

On Tue, 2017-02-07 at 16:10 +1030, Joel Stanley wrote:
> On Thu, Jan 12, 2017 at 10:59 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > This provides access to the mbox registers on the ast2400 and ast2500
> > boards.
> 

Hey Joel,

Thanks for review, just one thing, I'll fixup the rest.

Cyril

> s/boards/SoCs/
> 
> > 
> > This driver allows arbitrary reads and writes to the 16 data registers as
> > the other end may have configured the mbox hardware to provide an
> > interrupt when a specific register gets written to.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> 
> Send this to lkml as well next time you submit.
> 
> > ---
> >  drivers/mailbox/Kconfig       |   9 ++
> >  drivers/mailbox/Makefile      |   2 +
> >  drivers/mailbox/aspeed-mbox.c | 334 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 345 insertions(+)
> >  create mode 100644 drivers/mailbox/aspeed-mbox.c
> > 
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index ceff415f201c..10a7f3f2765c 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -152,4 +152,13 @@ config BCM_PDC_MBOX
> >           Mailbox implementation for the Broadcom PDC ring manager,
> >           which provides access to various offload engines on Broadcom
> >           SoCs. Say Y here if you want to use the Broadcom PDC.
> > +
> > +config ASPEED_MBOX
> 
> Call this ASPEED_LPC_MAILBOX, as it's a in the LPC IP block.
> 

I think I'll stick with ASPEED_LPC_MBOX, the rest of the file uses MBOX
more widely when talking about controllers.

> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > +       bool "Aspeed ast2400/2500 Mailbox Controller"
> 
> Call this Aspeed LPC Mailbox Controller, as the layout is shared by
> SoCs other than the 2500 and 2400.
> 
> > +       default "y"
> > +       ---help---
> > +         Provides a driver for the MBOX registers found on Aspeed SOCs
> > +         (AST2400 and AST2500). This driver provides a device for aspeed
> > +         mbox registers
> >  endif
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index 7dde4f609ae8..db5b4f3f29e0 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -31,3 +31,5 @@ obj-$(CONFIG_HI6220_MBOX)     += hi6220-mailbox.o
> >  obj-$(CONFIG_BCM_PDC_MBOX)     += bcm-pdc-mailbox.o
> > 
> >  obj-$(CONFIG_TEGRA_HSP_MBOX)   += tegra-hsp.o
> > +
> > +obj-$(CONFIG_ASPEED_MBOX)      += aspeed-mbox.o
> > diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
> > new file mode 100644
> > index 000000000000..c4ee6ba228ea
> > --- /dev/null
> > +++ b/drivers/mailbox/aspeed-mbox.c
> > +
> > +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> > +                               size_t count, loff_t *ppos)
> > +{
> > +       struct aspeed_mbox *mbox = file_mbox(file);
> > +       char __user *p = buf;
> > +       ssize_t ret;
> > +       int i;
> > +
> > +       if (!access_ok(VERIFY_WRITE, buf, count))
> > +               return -EFAULT;
> 
> As discussed in the LPC driver review:
> 
>  "And don't call access_ok(), it's racy and no driver should ever do that."
> 
> Make sure all of the things you fixed in that driver are fixed in this one.
> 
> > +
> > +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> > +               return -EINVAL;
> > +
> > +       if (file->f_flags & O_NONBLOCK) {
> > +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV))
> > +                       return -EAGAIN;
> > +       } else if (wait_event_interruptible(mbox->queue,
> > +                               aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV)) {
> > +               return -ERESTARTSYS;
> > +       }
> > +
> > +       mutex_lock(&mbox->mutex);
> > +
> > +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> > +               uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> > +
> > +               ret = __put_user(reg, p);
> > +               if (ret)
> > +                       goto out_unlock;
> > +
> > +               p++;
> > +               count--;
> > +       }
> > +
> > +       /* ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> 
> W1C? Write to clear?
> 
> > +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> > +       ret = p - buf;
> > +
> > +out_unlock:
> > +       mutex_unlock(&mbox->mutex);
> > +       return ret;
> > +}
> > +
> > +module_platform_driver(aspeed_mbox_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> > +MODULE_DESCRIPTION("ASpeed mailbox device driver");
> 
> ASPEED or Aspeed.
> 
> > --
> > 2.11.0
> > 
