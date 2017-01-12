Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzhWX09MgzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 21:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMTLp98x"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id b22so2912554pfd.3
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbClQBdnSntXRAHsU1q3CXW8L36yBNUzPRJ0fZaq/wU=;
 b=gMTLp98xdznd7zvqMlDsf36XCcSqyjqyZIhNjtT5RtyOVrzjbiPMM+oLzDDxMSzAbL
 luhuEhnE+hbDZgkZfYFq95XCNQV2gJ6Q9J3bzA+jE5ULPqFn8RoN0cf/M9ot9dk7L4+k
 h1MgxhPR232zPttEtf8tmgaX65kDb7+OcI3VSvQh6kA25SkFOBhorPoVRowS2jHzbMUx
 1QSpzgoFUTZqbNFqIFlgQhC202JXvpy9fh7Oglae8haSr4CKUkZCW29ugf+QoS99BPpO
 iHSG04wksgGye2BzQpDXS3cSa81M6d+ymlrDAMG+HQSeMKDqlFEzxwWeyKYRhn2mJ7TC
 DKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbClQBdnSntXRAHsU1q3CXW8L36yBNUzPRJ0fZaq/wU=;
 b=gef6GYCygwrCXeScb8xWLP3JoIsI92a+6Ebie1/fHPLfc1N/1h7yW9azmRwr9H1SMD
 j38hIXQGGjdHKd466XQa6hTs5//4MDNWZgaPydyBqGKes8lOCcQFctHB2axtXOYH0wzH
 C54l4NiroO84k0Opv9yd/XF7BMQ83KVHR4XfEbUR4glMPeb7+bqtJEy/Fsm7po6Zo9qt
 0siBtKCupI/8ysyQnvL6qSMmHqg7LzoofALSPtalGPcux07iT19oMPN5ZHx4zlbe5eI/
 iP0A31ir4tYwpHtGgO7+euysQpF6BrNV6Py66St/HuxGQ3e309FClnZvrFUY1Sw0Q7P0
 1SWw==
X-Gm-Message-State: AIkVDXJjHXlCbuzoo9kUBCkMm7ABbGVqVQRLwcPUUSc0SHOjgOIJhi9/qiwk6t+seGHZfg==
X-Received: by 10.99.170.5 with SMTP id e5mr16703933pgf.46.1484216214377;
 Thu, 12 Jan 2017 02:16:54 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 134sm20382577pgh.13.2017.01.12.02.16.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Jan 2017 02:16:53 -0800 (PST)
Message-ID: <1484216163.11416.8.camel@gmail.com>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de, 
 joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org,  andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Date: Thu, 12 Jan 2017 21:16:03 +1100
In-Reply-To: <20170112074750.GB23943@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
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
X-List-Received-Date: Thu, 12 Jan 2017 10:16:56 -0000

On Thu, 2017-01-12 at 08:47 +0100, Greg KH wrote:
> On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> > +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> > +				size_t count, loff_t *ppos)
> > +{
> > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > +		return -EFAULT;
> > +
> > +	return -EPERM;
> > +}
> > +
> > +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> > +				size_t count, loff_t *ppos)
> > +{
> > +	if (!access_ok(VERIFY_READ, buf, count))
> > +		return -EFAULT;
> > +
> > +	return -EPERM;
> > +}
> 

Hello Greg,

> Those functions don't actually do anything, so why even include them?
> 

Apologies, I should be more careful with what I send.

> And don't call access_ok(), it's racy and no driver should ever do that.
> 

Oh, duly noted. I'll be sure to check out how and why. Perhaps it
would be wise that no driver actually do that, I'm quite sure I used
other drivers as examples of best practice.

> > +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > +		unsigned long param)
> > +{
> > +	long rc;
> > +	struct lpc_mapping map;
> > +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> > +	void __user *p = (void __user *)param;
> > +
> > +	switch (cmd) {
> > +	case LPC_CTRL_IOCTL_SIZE:
> > +		return copy_to_user(p, &lpc_ctrl->size,
> > +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> > +	case LPC_CTRL_IOCTL_MAP:
> > +		if (copy_from_user(&map, p, sizeof(map)))
> > +			return -EFAULT;
> > +
> > +
> > +		/*
> > +		 * The top half of HICR7 is the MSB of the BMC address of the
> > +		 * mapping.
> > +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> > +		 * firmware space address of the mapping.
> > +		 *
> > +		 * The 1 bits in the top of half of HICR8 represent the bits
> > +		 * (in the requested address) that should be ignored and
> > +		 * replaced with those from the top half of HICR7.
> > +		 * The 1 bits in the bottom half of HICR8 represent the bits
> > +		 * (in the requested address) that should be kept and pass
> > +		 * into the BMC address space.
> > +		 */
> > +
> > +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> > +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> > +		if (rc)
> > +			return rc;
> > +
> > +		rc = regmap_write(lpc_ctrl->regmap, HICR8,
> > +			(~(map.size - 1)) | ((map.size >> 16) - 1));
> 
> Look Ma, a kernel exploit!
> 

So 'evil' input here could allow the host to control the bmc,
personally I file that under 'stupid' input. Also, stupid but not
accidental, I don't believe one could accidentally come up with such
input, although you never know what silly things human beings sometimes
do. For what its worth, I'm not even sure that can happen but I'll
grant you the benifit of the doubt.

> {sigh}
> 
> Your assignment is to go find a whiteboard/blackboard/whatever and write
> on it 100 times:
> 	All input is evil.
> 
> I want to see the picture of that before you send any more kernel patches.
> 
> > +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> > +{
> > +	atomic_dec(&lpc_ctrl_open_count);
> 
> Totally unneeded and unnecessary, why do you care?
> 

My aim here was to only have one process playing with the LPC mapping
registers at a time.

> Again, use UIO, it will save you from yourself...
> 

Thank-you! This is the first I've heard of UIO and I'll investigate
furthur!



Sincerely,

Cyril

> thanks,
> 
> greg k-h
