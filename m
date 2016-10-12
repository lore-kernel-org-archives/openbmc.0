Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stw6V3XmjzDsrM
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 11:41:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3stw6V10fTz9sxS;
 Wed, 12 Oct 2016 11:41:54 +1100 (AEDT)
Subject: Re: [PATCH linux v3 18/18] drivers/fsi: Add SCOM FSI client device
 driver
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-19-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <8e79817e-b68b-9f28-1f5b-90d778e7834c@ozlabs.org>
Date: Wed, 12 Oct 2016 08:41:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476222003-99697-19-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 00:41:54 -0000

Hi Chris,

> Create a bare bones FSI client device driver that registers
> with the FSI core.

Cool!

> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 2021ce5..3e31d9a 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_FSI) += fsi-core.o
>  obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
> +obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index c5e7441..15d8635 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -391,6 +391,27 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
>  	return 0;
>  }
>  
> +int fsidrv_register(struct fsi_driver *fsi_drv)
> +{
> +	int rc = 0;
> +
> +	if (!fsi_drv)
> +		return -EINVAL;
> +	if (!fsi_drv->id_table)
> +		return -EINVAL;
> +
> +	rc = driver_register(&fsi_drv->drv);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(fsidrv_register);
> +
> +void fsidrv_unregister(struct fsi_driver *fsi_drv)
> +{
> +	driver_unregister(&fsi_drv->drv);
> +}
> +EXPORT_SYMBOL_GPL(fsidrv_unregister);
> +

These aren't part of the SCOM engine device driver, they're changes to
the core. Can you do them as a separate patch?


>  	.name		= "fsi",
>  	.match		= fsi_bus_match,
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> new file mode 100644
> index 0000000..1600f3b
> --- /dev/null
> +++ b/drivers/fsi/fsi-scom.c
> @@ -0,0 +1,62 @@
> +/*
> + * SCOM FSI Client device driver
> + *
> + * Copyright (C) IBM Corporation 2016
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/fsi.h>
> +#include <linux/module.h>
> +
> +#define FSI_ENGID_SCOM		5
> +
> +static int scom_probe(struct device *);
> +
> +struct fsi_device_id scom_ids[] = {
> +	{
> +		.engine_type = FSI_ENGID_SCOM,
> +		.version = FSI_VERSION_ANY,
> +	},
> +	{
> +		.engine_type = 0,
> +	}

You can just use { 0 } for the end sentinel:

  struct fsi_device_id scom_ids[] = {
  	{
  		.engine_type = FSI_ENGID_SCOM,
  		.version = FSI_VERSION_ANY,
  	},
  	{ 0 }
  }

- which makes it a *tiny* bit more obvious that you're only matching one
fsi_device_id.

> +static int scom_init(void)
> +{
> +	int rc;
> +
> +	rc = fsidrv_register(&scom_drv);
> +
> +	return rc;
> +}

You have this pattern a few times in your series. It's pretty minor, but
a little neater if you just return the value directly in cases like
that.  For example:

  static int scom_init(void)
  {
  	return fsidrv_register(&scom_drv);
  }

Cheers,


Jeremy
