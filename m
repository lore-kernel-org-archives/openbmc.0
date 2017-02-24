Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTsxV5yC0zDqC0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 11:51:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vTsxV3rFnz9s7N;
 Fri, 24 Feb 2017 11:51:42 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v3] drivers/fsi: Add hub master support
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170223195417.81894-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <1ffb7ce4-0322-1ce2-b53a-382c34ca963a@ozlabs.org>
Date: Fri, 24 Feb 2017 08:51:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170223195417.81894-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 24 Feb 2017 00:51:42 -0000

Hi Chris,

> Scan for links off of the mFSI master on CFAM. Add any devices
> detected to the existing list of FSI devices and notify any
> clients.

Looking pretty good now, but there are still some changes required in
the new code:

> @@ -242,12 +404,50 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
>  			>> FSI_SLAVE_CONF_TYPE_SHIFT;
>  
> -		/*
> -		 * Unused address areas are marked by a zero type value; this
> -		 * skips the defined address areas
> -		 */
> -		if (type != 0 && slots != 0) {
> +		switch (type) {
> +		case 0:
> +			/*
> +			 * Unused address areas are marked by a zero type
> +			 * value; this skips the defined address areas
> +			 */
> +			break;
> +
> +		case FSI_ENGID_HUB_MASTER:
> +			hub_master_class = class_create(THIS_MODULE,
> +								"hub-master");

Why are you creating a hub-specific class, and why are you doing that
here?

If we want to use classes (which we may want to at some point), we
should have a fsi-master class, rather than one only for hub masters.
And then one for the slave engines too.

However, this is not the place to do this. This will cause a WARN_ON on
the second hub we find.

I assume this is simply so that you can use device_create(). However,
since we're not using classes at present, just create the struct device
in the same way we have in other places in this file:

			hub->master.dev = kzalloc(sizeof(*hub->master.dev),
						GFP_KERNEL);
			if (!hub->master.dev)
				return -ENODEV;

			device_initialize(hub->master.dev);

Then, you want to use an appropriate name (just using a number is a bit
obscure), and set the parent too:

			dev_set_name(hub->master.dev, "hub@%02x",
						hub->master.idx);
			hub->master.dev->parent = &slave->dev;

... and we probably want a dev->release function too, to free the
device.

> +		case FSI_ENGID_HUB_LINK:
> +			conf_link_count++;
> +
> +			break;
> +
> +		default:
>  			/* create device */

We've lost the (slots != 0) check from this condition.

Regards,


Jeremy
