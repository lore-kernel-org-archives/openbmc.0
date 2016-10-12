Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svMBF26x9zDsxJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 05:01:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YzxJ2KQ9; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id i127so3998856oia.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XSSQ8bGx+00CeIh0r5aV8EUwoNOQfA9K0b8LrOtsl38=;
 b=YzxJ2KQ93ZOrE9Ll4TI7lyfiG0tKNrJNS5x5vFcbNRF6Vv8T+TIviar6VAudTu6geS
 95QKQMSawq8+0BzB4Xzqlstq4FQvYSbN2RM/+OlbL1nsLFGDWRa7GZcXLWZq3F9cLoWX
 gbbyfPQ8DXEkjqB9DdJRHUxmBj/BHqE1J+GgvH6uTdjo9GN8afQ3mGsyboBbH4MK151T
 IFIm8YbaK2wjgoXHcT0BDmlSBwNuZRBwCOGCPnTF22pjDb4dA1mkMm1YcAZZRDyFS2bb
 u1G70How5M8ED8lUwe63lhThrtcFPOOVg/AYFc0HOIXpYN8Qa8eVnQdjiBN5oqMLrx5R
 4yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XSSQ8bGx+00CeIh0r5aV8EUwoNOQfA9K0b8LrOtsl38=;
 b=QwglkbERWy7Sv4hcvB5gfkUe9n1efBYf0a6Z+BcZD2a0uHzkUlryLVSlweuy/OQZL+
 cnqY2nVNgHomPib1qvSjNkiSPJ2FbMDe38RPqJyXzn2n2bTLfhJjiwYUcN3AX8jRMwiW
 sl9XKJX7jKCuOh3brYeKlTz2b6Z24CkfB1mP0GVdMdJcaDNHI2eJke8otx4R0rcnF7ta
 BJze8oWoq4USZYIqKb0Ls48FrvljBB09//sF62rVNbxMjrg7LAvHPLfOtEI6JpGvLHSQ
 HkMmDkc6wMFTr4PASgN7etCYlPo1+R3KRxqC9dNYskNhOQtXxs1JglLVRv9v1jXZgLMj
 E0IA==
X-Gm-Message-State: AA6/9RnZgvJQRp6HlQNjXJdv5kkzir5oJDN/8vxFD5/fdYOLdbExJncpWA0dSeRqsb0kxNX/PiOz7eKKmoN5fw==
X-Received: by 10.157.20.173 with SMTP id d42mr1295232ote.100.1476295299574;
 Wed, 12 Oct 2016 11:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Wed, 12 Oct 2016 11:01:39 -0700 (PDT)
In-Reply-To: <8e79817e-b68b-9f28-1f5b-90d778e7834c@ozlabs.org>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-19-git-send-email-christopher.lee.bostic@gmail.com>
 <8e79817e-b68b-9f28-1f5b-90d778e7834c@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 12 Oct 2016 13:01:39 -0500
Message-ID: <CAA0LjjVuhrjdjbkPr9EdQkPuFRWRRZv7+ETZAVOyzdT8r7_XRg@mail.gmail.com>
Subject: Re: [PATCH linux v3 18/18] drivers/fsi: Add SCOM FSI client device
 driver
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 12 Oct 2016 18:01:41 -0000

On Tue, Oct 11, 2016 at 7:41 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Create a bare bones FSI client device driver that registers
>> with the FSI core.
>
> Cool!
>
>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>> index 2021ce5..3e31d9a 100644
>> --- a/drivers/fsi/Makefile
>> +++ b/drivers/fsi/Makefile
>> @@ -2,3 +2,4 @@
>>  obj-$(CONFIG_FSI) += fsi-core.o
>>  obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
>>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
>> +obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index c5e7441..15d8635 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -391,6 +391,27 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
>>       return 0;
>>  }
>>
>> +int fsidrv_register(struct fsi_driver *fsi_drv)
>> +{
>> +     int rc = 0;
>> +
>> +     if (!fsi_drv)
>> +             return -EINVAL;
>> +     if (!fsi_drv->id_table)
>> +             return -EINVAL;
>> +
>> +     rc = driver_register(&fsi_drv->drv);
>> +
>> +     return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(fsidrv_register);
>> +
>> +void fsidrv_unregister(struct fsi_driver *fsi_drv)
>> +{
>> +     driver_unregister(&fsi_drv->drv);
>> +}
>> +EXPORT_SYMBOL_GPL(fsidrv_unregister);
>> +
>
> These aren't part of the SCOM engine device driver, they're changes to
> the core. Can you do them as a separate patch?
>

OK, will break these up into separate patches.

>
>>       .name           = "fsi",
>>       .match          = fsi_bus_match,
>>
>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>> new file mode 100644
>> index 0000000..1600f3b
>> --- /dev/null
>> +++ b/drivers/fsi/fsi-scom.c
>> @@ -0,0 +1,62 @@
>> +/*
>> + * SCOM FSI Client device driver
>> + *
>> + * Copyright (C) IBM Corporation 2016
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/fsi.h>
>> +#include <linux/module.h>
>> +
>> +#define FSI_ENGID_SCOM               5
>> +
>> +static int scom_probe(struct device *);
>> +
>> +struct fsi_device_id scom_ids[] = {
>> +     {
>> +             .engine_type = FSI_ENGID_SCOM,
>> +             .version = FSI_VERSION_ANY,
>> +     },
>> +     {
>> +             .engine_type = 0,
>> +     }
>
> You can just use { 0 } for the end sentinel:
>
>   struct fsi_device_id scom_ids[] = {
>         {
>                 .engine_type = FSI_ENGID_SCOM,
>                 .version = FSI_VERSION_ANY,
>         },
>         { 0 }
>   }
>
> - which makes it a *tiny* bit more obvious that you're only matching one
> fsi_device_id.
>

Will change.

>> +static int scom_init(void)
>> +{
>> +     int rc;
>> +
>> +     rc = fsidrv_register(&scom_drv);
>> +
>> +     return rc;
>> +}
>
> You have this pattern a few times in your series. It's pretty minor, but
> a little neater if you just return the value directly in cases like
> that.  For example:
>
>   static int scom_init(void)
>   {
>         return fsidrv_register(&scom_drv);
>   }

Ok will revise that.

Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
