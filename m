Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHYG01qY1zDq5s
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 16:45:11 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v175iQ6S030237;
 Mon, 6 Feb 2017 23:44:28 -0600
Message-ID: <1486446266.4850.129.camel@kernel.crashing.org>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, Arnd Bergmann
 <arnd@arndb.de>, gregkh@linuxfoundation.org, Mark Rutland
 <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Xo Wang
 <xow@google.com>, Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 07 Feb 2017 16:44:26 +1100
In-Reply-To: <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-5-cyrilbur@gmail.com>
 <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
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
X-List-Received-Date: Tue, 07 Feb 2017 05:45:13 -0000

On Tue, 2017-02-07 at 16:10 +1030, Joel Stanley wrote:

> > +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> > +                               size_t count, loff_t *ppos)
> > +{
> > +       struct aspeed_mbox *mbox = file_mbox(file);
> > +       char __user *p = buf;
> > +       ssize_t ret;
> > +       int i;
> > +
> > +       if (!access_ok(VERIFY_WRITE, buf, count))
> > +               return -EFAULT;
> 
> As discussed in the LPC driver review:
> 
>  "And don't call access_ok(), it's racy and no driver should ever do that."
> 
> Make sure all of the things you fixed in that driver are fixed in this one.

Well... I don't entirely agree with Greg on that one :-) In this specific
case, since he's using __put_user() below, he must use access_ok() first.

The "alternate" option is to bounce everything via a local memory array,
copy_to/from_user (to/from that array) and then do the loop of inb/outb,
but in the grand scheme of things, what is written here is correct *and*
more efficient than the alternate approach. On such a slow SoC, those
cycles do count.

> > +
> > +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> > +               return -EINVAL;
> > +
> > +       if (file->f_flags & O_NONBLOCK) {
> > +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV))
> > +                       return -EAGAIN;
> > +       } else if (wait_event_interruptible(mbox->queue,
> > +                               aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV)) {
> > +               return -ERESTARTSYS;
> > +       }
> > +
> > +       mutex_lock(&mbox->mutex);
> > +
> > +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> > +               uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> > +
> > +               ret = __put_user(reg, p);
> > +               if (ret)
> > +                       goto out_unlock;
> > +
> > +               p++;
> > +               count--;
> > +       }
> > +
> > +       /* ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> 
> W1C? Write to clear?
> 
> > +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> > +       ret = p - buf;
> > +
> > +out_unlock:
> > +       mutex_unlock(&mbox->mutex);
> > +       return ret;
> > +}
> > +
> > +module_platform_driver(aspeed_mbox_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> > +MODULE_LICENSE("GPL");
> > > > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> > +MODULE_DESCRIPTION("ASpeed mailbox device driver");
> 
> ASPEED or Aspeed.
> 
> > --
> > 2.11.0
> > 
