Return-Path: <andrew@lunn.ch>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="dmycADH4"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmrmy2NDZzF0wm
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 08:52:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=r8TPYTs1rOkRZu+orI+C1rCg5uvWYtr1dh90MUMj8z0=; 
 b=dmycADH4gIxQPcnggeboAjP4nqeOvl5hZtRpA/UIaHIdDihbKaNrNtnOf4oiphWgHX4pEQ0TEttZEZxWsNr18rHEdv5Inv/Rzj3cAH4X9JrC0GFpuf5iyPnyF/cgPPRaZDJXQ68JqCWeK2P/6Dkyf3vyCzQ/amKjEwGDBmvSuq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1eocIX-0002xG-Fm; Wed, 21 Feb 2018 22:51:33 +0100
Date: Wed, 21 Feb 2018 22:51:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI
 bus driver core
Message-ID: <20180221215133.GA9056@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180221170434.GF29204@lunn.ch>
 <650488e8-8516-1329-b35b-88d628d21cc2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <650488e8-8516-1329-b35b-88d628d21cc2@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 21 Feb 2018 21:52:19 -0000

> >Is there a real need to do transfers in atomic context, or with
> >interrupts disabled?
> >
> 
> Actually, no. Generally, this function will be called in sleep-able context
> so this code is for an exceptional case handling.
> 
> I'll rewrite this code like below:
> 	if (in_atomic() || irqs_disabled()) {
> 		dev_dbg(&adapter->dev,
> 			"xfer in non-sleepable context is not supported\n");
> 		return -EWOULDBLOCK;
> 	}

I would not even do that. Just add a call to
might_sleep(). CONFIG_DEBUG_ATOMIC_SLEEP will then find bad calls.

> >>+static int peci_ioctl_get_temp(struct peci_adapter *adapter, void *vmsg)
> >>+{
> >>+	struct peci_get_temp_msg *umsg = vmsg;
> >>+	struct peci_xfer_msg msg;
> >>+	int rc;
> >>+
> >
> >Is this getting the temperature?
> >
> 
> Yes, this is getting the 'die' temperature of a processor package.
 
So the hwmon driver provides this. No need to have both.

> >>+static long peci_ioctl(struct file *file, unsigned int iocmd, unsigned long arg)
> >>+{
> >>+	struct peci_adapter *adapter = file->private_data;
> >>+	void __user *argp = (void __user *)arg;
> >>+	unsigned int msg_len;
> >>+	enum peci_cmd cmd;
> >>+	u8 *msg;
> >>+	int rc = 0;
> >>+
> >>+	dev_dbg(&adapter->dev, "ioctl, cmd=0x%x, arg=0x%lx\n", iocmd, arg);
> >>+
> >>+	switch (iocmd) {
> >>+	case PECI_IOC_PING:
> >>+	case PECI_IOC_GET_DIB:
> >>+	case PECI_IOC_GET_TEMP:
> >>+	case PECI_IOC_RD_PKG_CFG:
> >>+	case PECI_IOC_WR_PKG_CFG:
> >>+	case PECI_IOC_RD_IA_MSR:
> >>+	case PECI_IOC_RD_PCI_CFG:
> >>+	case PECI_IOC_RD_PCI_CFG_LOCAL:
> >>+	case PECI_IOC_WR_PCI_CFG_LOCAL:
> >>+		cmd = _IOC_TYPE(iocmd) - PECI_IOC_BASE;
> >>+		msg_len = _IOC_SIZE(iocmd);
> >>+		break;
> >
> >Adding new ioctl calls is pretty frowned up. Can you export this info
> >via /sysfs?
> >
> 
> Most of these are not simple IOs so ioctl is better suited, I think.

Lets see what other reviewers say, but i think ioctls are
wrong.

     Andrew
