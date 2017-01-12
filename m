Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzhpz4XcLzDqJ4
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 21:30:19 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 51DD192B;
 Thu, 12 Jan 2017 10:30:16 +0000 (UTC)
Date: Thu, 12 Jan 2017 11:30:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170112103038.GA19239@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484216163.11416.8.camel@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Thu, 12 Jan 2017 10:30:20 -0000

On Thu, Jan 12, 2017 at 09:16:03PM +1100, Cyril Bur wrote:
> On Thu, 2017-01-12 at 08:47 +0100, Greg KH wrote:
> > On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> > > +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > > +{
> > > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > > +		return -EFAULT;
> > > +
> > > +	return -EPERM;
> > > +}
> > > +
> > > +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > > +{
> > > +	if (!access_ok(VERIFY_READ, buf, count))
> > > +		return -EFAULT;
> > > +
> > > +	return -EPERM;
> > > +}
> > 
> 
> Hello Greg,
> 
> > Those functions don't actually do anything, so why even include them?
> > 
> 
> Apologies, I should be more careful with what I send.

Hm, that implies you never tested what you sent, nor intended for us to
merge it, an odd thing for you to do :)

> > And don't call access_ok(), it's racy and no driver should ever do that.
> > 
> 
> Oh, duly noted. I'll be sure to check out how and why. Perhaps it
> would be wise that no driver actually do that, I'm quite sure I used
> other drivers as examples of best practice.

You did?  Please point me at that code so we can fix them up properly.
Cargo-cult coding is not a good thing, but it happens, so if we can at
least provide clean code to fixate on, it's good overall for everyone.

> > > +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > > +		unsigned long param)
> > > +{
> > > +	long rc;
> > > +	struct lpc_mapping map;
> > > +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> > > +	void __user *p = (void __user *)param;
> > > +
> > > +	switch (cmd) {
> > > +	case LPC_CTRL_IOCTL_SIZE:
> > > +		return copy_to_user(p, &lpc_ctrl->size,
> > > +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> > > +	case LPC_CTRL_IOCTL_MAP:
> > > +		if (copy_from_user(&map, p, sizeof(map)))
> > > +			return -EFAULT;
> > > +
> > > +
> > > +		/*
> > > +		 * The top half of HICR7 is the MSB of the BMC address of the
> > > +		 * mapping.
> > > +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> > > +		 * firmware space address of the mapping.
> > > +		 *
> > > +		 * The 1 bits in the top of half of HICR8 represent the bits
> > > +		 * (in the requested address) that should be ignored and
> > > +		 * replaced with those from the top half of HICR7.
> > > +		 * The 1 bits in the bottom half of HICR8 represent the bits
> > > +		 * (in the requested address) that should be kept and pass
> > > +		 * into the BMC address space.
> > > +		 */
> > > +
> > > +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> > > +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> > > +		if (rc)
> > > +			return rc;
> > > +
> > > +		rc = regmap_write(lpc_ctrl->regmap, HICR8,
> > > +			(~(map.size - 1)) | ((map.size >> 16) - 1));
> > 
> > Look Ma, a kernel exploit!
> > 
> 
> So 'evil' input here could allow the host to control the bmc,
> personally I file that under 'stupid' input. Also, stupid but not
> accidental, I don't believe one could accidentally come up with such
> input, although you never know what silly things human beings sometimes
> do. For what its worth, I'm not even sure that can happen but I'll
> grant you the benifit of the doubt.

I think you didn't get the main point here, again:

> > {sigh}
> > 
> > Your assignment is to go find a whiteboard/blackboard/whatever and write
> > on it 100 times:
> > 	All input is evil.

You can NEVER trust any input values sent to the kernel, you have to
ALWAYS verify they are within certain safe ranges.


> > I want to see the picture of that before you send any more kernel patches.
> > 
> > > +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> > > +{
> > > +	atomic_dec(&lpc_ctrl_open_count);
> > 
> > Totally unneeded and unnecessary, why do you care?
> > 
> 
> My aim here was to only have one process playing with the LPC mapping
> registers at a time.

Why?  Who cares?  You don't have internal state being kept by the
driver, so it shouldn't matter.

And again, don't treat an atomic variable as a lock, use a real lock for
the task, it works better, and is the correct thing to do.

thanks,

greg k-h
