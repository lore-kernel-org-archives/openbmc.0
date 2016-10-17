Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy9tV4ywpzDvJY
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 19:12:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sy9tV2TMZz9s3s;
 Mon, 17 Oct 2016 19:12:50 +1100 (AEDT)
Subject: Re: [PATCH linux v4 19/20] drivers/fsi: Add client driver register
 utilities
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-20-git-send-email-christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
Message-ID: <c4ea6133-9286-b650-3375-f899121f2ce3@ozlabs.org>
Date: Mon, 17 Oct 2016 16:12:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476483282-85971-20-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Mon, 17 Oct 2016 08:12:50 -0000

Hi Chris,

> +int fsidrv_register(struct fsi_driver *fsi_drv)
> +{
> +	if (!fsi_drv)
> +		return -EINVAL;
> +	if (!fsi_drv->id_table)
> +		return -EINVAL;
> +
> +	return driver_register(&fsi_drv->drv);
> +}
> +EXPORT_SYMBOL_GPL(fsidrv_register);
> +
> +void fsidrv_unregister(struct fsi_driver *fsi_drv)
> +{
> +	driver_unregister(&fsi_drv->drv);
> +}
> +EXPORT_SYMBOL_GPL(fsidrv_unregister);
> +

Minor, but I think fsi_driver_register / fsi_driver_unregister
would be better names; we don't use 'fsidrv' elsewhere.

Do we want a module_fsi_driver macro (similar to module_platform_driver)
to reduce boilerplate code?

Cheers,


Jeremy
