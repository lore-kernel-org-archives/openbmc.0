Return-Path: <linux+openbmc=lists.ozlabs.org@armlinux.org.uk>
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdwvj0cj1zDvk5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 23:32:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="MMokG99O"; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2014; 
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=yDWlC3DlWN84ou+7RNlVmaXD9dXlU9VNNg5r1RvQuXQ=; 
 b=MMokG99O9no6K3/xo2b3PnDcRhxtmOZV3qHjkasZKv+kG6iBOf2k52Hyvh9VU3h1nHe9VvJtn4TQVeaVYtQJ+dz6xU5yt9p6qx5iG1ppnjrzTgF5/e8doVyeMX3ETboXmKi0iq+Q6eXq7kRB73EVP58o8ERZ/TlEUzp56Ezn9vA=;
Received: from n2100.armlinux.org.uk
 ([2002:4e20:1eda:1:214:fdff:fe10:4f86]:38064)
 by pandora.armlinux.org.uk with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <linux@armlinux.org.uk>)
 id 1cH8jc-0004wY-MP; Wed, 14 Dec 2016 12:32:36 +0000
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.76)
 (envelope-from <linux@n2100.armlinux.org.uk>)
 id 1cH8jZ-000691-Hz; Wed, 14 Dec 2016 12:32:33 +0000
Date: Wed, 14 Dec 2016 12:32:33 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: Re: [PATCH linux v1 2/4] drivers: misc: Character device driver for
 seven segment display
Message-ID: <20161214123233.GF14217@n2100.armlinux.org.uk>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-3-git-send-email-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481702104-8617-3-git-send-email-jaghu@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
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
X-List-Received-Date: Wed, 14 Dec 2016 12:32:50 -0000

On Tue, Dec 13, 2016 at 11:55:02PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
> +int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
> +	void (*update_disp_data)(struct device *, u16 data))
> +{
> +	struct device *dev;
> +	int err;
> +
> +	dev = device_create(seven_seg_disp_class, &disp_dev->parent,
> +			seven_seg_devno,
> +			NULL, "seven_seg_disp_val");
> +	if (dev == NULL)
> +		return -1;

Do not use return -1 in kernel code.

> +	disp_dev->dev = dev;
> +	disp_dev->update_seven_seg_data = update_disp_data;
> +	disp_dev->disp_data_valid = false;
> +
> +	cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
> +	err = cdev_add(&disp_dev->cdev, seven_seg_devno, 1);
> +	if (err)
> +		device_destroy(seven_seg_disp_class, seven_seg_devno);
> +	return err;
> +}
> +
> +static int __init seven_seg_disp_init(void)
> +{
> +	if (alloc_chrdev_region(&seven_seg_devno, 0, 1, "disp_state") < 0)
> +		return -1;

Do not use return -1 in kernel code.

> +
> +	seven_seg_disp_class = class_create(THIS_MODULE, "disp_state");
> +	if (seven_seg_disp_class == NULL)
> +		goto unreg_chrdev;
> +
> +unreg_chrdev:
> +	unregister_chrdev_region(seven_seg_devno, 1);
> +	return -1;

Do not use return -1 in kernel code.

(Look up what an errno value of '1' means.  Negative values returned from
functions are interpreted as negated errno values.)

Always propagate error codes, or select an appropriate errno value to
return.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
