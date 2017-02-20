Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRZ9T29Z0zDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:54:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vRZ9S6W6pz9s84;
 Mon, 20 Feb 2017 17:54:04 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality
 and sysfs interface
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <4b59fa39-65c2-cb33-07aa-3fe7a1c7fe21@ozlabs.org>
Date: Mon, 20 Feb 2017 14:54:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 06:54:05 -0000

Hi Eddie,

The changelog doesn't have much context, so a bit of a question:

> +static ssize_t store_reset_register(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int rc;
> +	struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +
> +	rc = scom_full_reset(fsi_dev);
> +
> +	return rc ? rc : count;
> +}
> +DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
> +

How does this interact with the scom read/write operations? Having
different interfaces access methods (file for one, sysfs interface for
another)for both seems like an invitation for trouble - would this make
more sense as an ioctl on the existing fd?

Cheers,


Jeremy
