Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzdC62SJnzDqHm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 18:47:29 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 486CE6C;
 Thu, 12 Jan 2017 07:47:27 +0000 (UTC)
Date: Thu, 12 Jan 2017 08:47:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170112074750.GB23943@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170112002910.3650-4-cyrilbur@gmail.com>
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
X-List-Received-Date: Thu, 12 Jan 2017 07:47:30 -0000

On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	if (!access_ok(VERIFY_WRITE, buf, count))
> +		return -EFAULT;
> +
> +	return -EPERM;
> +}
> +
> +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	if (!access_ok(VERIFY_READ, buf, count))
> +		return -EFAULT;
> +
> +	return -EPERM;
> +}

Those functions don't actually do anything, so why even include them?

And don't call access_ok(), it's racy and no driver should ever do that.

> +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +		unsigned long param)
> +{
> +	long rc;
> +	struct lpc_mapping map;
> +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> +	void __user *p = (void __user *)param;
> +
> +	switch (cmd) {
> +	case LPC_CTRL_IOCTL_SIZE:
> +		return copy_to_user(p, &lpc_ctrl->size,
> +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> +	case LPC_CTRL_IOCTL_MAP:
> +		if (copy_from_user(&map, p, sizeof(map)))
> +			return -EFAULT;
> +
> +
> +		/*
> +		 * The top half of HICR7 is the MSB of the BMC address of the
> +		 * mapping.
> +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> +		 * firmware space address of the mapping.
> +		 *
> +		 * The 1 bits in the top of half of HICR8 represent the bits
> +		 * (in the requested address) that should be ignored and
> +		 * replaced with those from the top half of HICR7.
> +		 * The 1 bits in the bottom half of HICR8 represent the bits
> +		 * (in the requested address) that should be kept and pass
> +		 * into the BMC address space.
> +		 */
> +
> +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> +		if (rc)
> +			return rc;
> +
> +		rc = regmap_write(lpc_ctrl->regmap, HICR8,
> +			(~(map.size - 1)) | ((map.size >> 16) - 1));

Look Ma, a kernel exploit!

{sigh}

Your assignment is to go find a whiteboard/blackboard/whatever and write
on it 100 times:
	All input is evil.

I want to see the picture of that before you send any more kernel patches.

> +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> +{
> +	atomic_dec(&lpc_ctrl_open_count);

Totally unneeded and unnecessary, why do you care?

Again, use UIO, it will save you from yourself...

thanks,

greg k-h
