Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=7qdu=iq=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJMQJx6l"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w4mB3ZdtzDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 17:16:55 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED21E20842;
 Tue, 29 May 2018 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1527578213;
 bh=V0PAqC+aydYXox+8iYNm1m7R/OMNr6CrcYTD+vFOiOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJMQJx6lnBaYS1ZaiQeG4RsZP3MbpB2ix91npdtOQSdSeb6rUGooRVUIWQ6Tb6Tag
 k/fpza9bXWooNZS29J0vIDzzK+11wsoLoxZWi5c902XndTeUaZAvii/T/jXQj6PJhf
 EBi2hu3OZNoEXTP4skfzzBieTW9kQQVP9LQybQxw=
Date: Tue, 29 May 2018 09:16:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "jiri@resnulli.us" <jiri@resnulli.us>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Vadim Pasternak <vadimp@mellanox.com>,
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>
Subject: Re: [patch v22 1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20180529071633.GB20427@kroah.com>
References: <1527503652-21975-1-git-send-email-oleksandrs@mellanox.com>
 <1527503652-21975-2-git-send-email-oleksandrs@mellanox.com>
 <20180528123527.GA17613@kroah.com>
 <AM5PR0501MB24490173AD50A2E478DFCF35B16E0@AM5PR0501MB2449.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR0501MB24490173AD50A2E478DFCF35B16E0@AM5PR0501MB2449.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 07:16:59 -0000

On Mon, May 28, 2018 at 03:59:46PM +0000, Oleksandr Shamray wrote:
> > > +	const struct jtag_ops *ops;
> > > +	int id;
> > > +	bool opened;
> > 
> > You shouldn't care about this, but ok...
> 
> Jtag HW not support to using with multiple requests from different users. So we prohibit this.

Ok, but then that's a userspace problem, not your driver's problem.
Serial ports can't handle multiple requests in a sane way either, and so
it's a userspace bug if they do that.  It's not up to the kernel to try
to prevent it, and really, you are not preventing this from happening at
all, you are only keeping more than one open() call from happening.  You
aren't serializing the device access at all.

So you are giving yourself a false sense of "We are protecting the
device" here.  Just drop the whole "only one open() call" logic
entirely.  It will make your kernel code simpler and you aren't giving
yourself false-hope that you really prevented userspace from doing
something stupid :)

> > > +	case JTAG_IOCRUNTEST:
> > > +		if (copy_from_user(&idle, (const void __user *)arg,
> > > +				   sizeof(struct jtag_run_test_idle)))
> > > +			return -EFAULT;
> > > +
> > > +		if (idle.endstate > JTAG_STATE_PAUSEDR)
> > > +			return -EINVAL;
> > 
> > No validation that idle contains sane values?  Don't make every jtag driver
> > have to do this type of validation please.
> > 
> 
> I have partially validation of idle structure  (if (idle.endstate > JTAG_STATE_PAUSEDR)).
> But I will add more validation.

Go to the nearest whiteboard and write this at the top:
	ALL INPUT IS EVIL

Don't erase it.  You have to validate all the things, otherwise
something bad will happen, I guarantee it.  Wait until the syzbot gets
ahold of this layer if you don't believe me :)

> > > +static int jtag_open(struct inode *inode, struct file *file) {
> > > +	struct jtag *jtag = container_of(file->private_data, struct jtag,
> > > +miscdev);
> > > +
> > > +	if (mutex_lock_interruptible(&jtag->open_lock))
> > > +		return -ERESTARTSYS;
> > 
> > Why restart?  Just grab the lock, you don't want to have to do restartable
> > logic in userspace, right?
> 
> Will change like:
> 
> ret = mutex_lock_interruptible(&jtag->open_lock);
> if (ret)
> 	return ret;

No, what's wrong with a simple:
	mutex_lock();
?

You are only holding it for a very short time, people can wait, there is
no rush here or "fast path" happening.

Anyway, this whole lock should just go away entirely, due to the lack of
needing to track open() calls.  But in the future, keep locks simple, no
need to add complexity when it is not warranted.

> > > +	if (jtag->opened) {
> > > +		mutex_unlock(&jtag->open_lock);
> > > +		return -EBUSY;
> > 
> > Why do you care about only 1 userspace open call?  What does that buy you?
> > Userspace can always pass around that file descriptor and use it in multiple
> > places, so you are not really "protecting" yourself from anything.
> > 
> 
> Accessing to JTAG HW from multiple processes will make confusion in the work of the JTAG protocol.
> And I want to prohibit this.

See my previous comments for why your attempt at protecting open() does
not prevent this from happening.  Hint, you forgot about dup(3) :(

thanks,

greg k-h
