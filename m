Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rm1F501n1zDr4l
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 14:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Nsq3aVCT; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id w59so2203797qtd.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2016 21:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JXvMDb+fZEQhDkJIrvZco54oPHZhQuDN+Z+LqpcXRVI=;
 b=Nsq3aVCT0LedtDI2t+feI5O6SSd2LMdM6pfWCrrvsTRD5vsxxf1UY8jfTV3zfqRulJ
 SMPJ8dxWj4yf7WEiv6f0u5gi81TdHyVj4jtSkX4xKwxoFpO3MEoIHp5rNQ+3YDAdl91m
 1u6VGB5qTF41PUEz7ElOUmUHNl0sBxPMmST56zIIWv/Axg3+CEnkjfcvus2v2PArotw0
 ZUIQW1wd4zCqdVzNapQUr7fVN5fEwZThiz0e/dYf9+m2UC965CuRgGsjUNjQKl9SQuGH
 CPsazHCSx8FzFup5EWzpneWnBn5eXXx7HWHY/3lN+UEYi4vk2QQCPr4or+8P+fFu7I25
 eNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JXvMDb+fZEQhDkJIrvZco54oPHZhQuDN+Z+LqpcXRVI=;
 b=gHMyYPJPH7f0wKyQPQd2caY4qGsuz9Itd0+aJaTmrZDwNbm3kBryFXS8n+y0dUpL8A
 2v05RNvnoDGFaXmhsXDzdtUuL4a46vUKrjWcdZ8ScS5h1yBwHm9HJkC/lN+ZnFlFIlJv
 RS3AjnU5kC+lw2D51dYzB7+ysMKgNkrsoP9Olmx8RIvSW8KyuuQe436qXE5vgYcc+3v4
 aRxOMqaZ2w3SPrs2xc9XFlXUeTs3wrMPqdwKVrOyNaptHMyaPPJ2UOLaMR0Je+T+GQRO
 7x1G209emTc2U6ffm1QjxdhAD1CKDV2z+ZrYShAhxDV15QOeQslJ0Hufl04XHZztSbq2
 Lpqg==
X-Gm-Message-State: ALyK8tI6rdPmbrWl4d+g51/kfwdvGVKH2d22qZbKdeoiBnc+xcCyWCeV0Zm5getyvxvUBz26iTVmOJkNINqFXg==
X-Received: by 10.237.59.227 with SMTP id s32mr5486013qte.91.1467950902750;
 Thu, 07 Jul 2016 21:08:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 7 Jul 2016 21:08:03 -0700 (PDT)
In-Reply-To: <1467925813-79135-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1467925813-79135-1-git-send-email-christopher.lee.bostic@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jul 2016 13:38:03 +0930
X-Google-Sender-Auth: ZgjG2FMoPfQyvVLnkV39nCHxmU8
Message-ID: <CACPK8Xe9mFhsbK78vQ8gJDvY5r+hoF+9uqM1o6gxj3EczSNRmg@mail.gmail.com>
Subject: Re: [PATCH linux] drivers/fsi: Initial stubs for FSI device driver.
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2016 04:08:25 -0000

On Fri, Jul 8, 2016 at 6:40 AM,  <christopher.lee.bostic@gmail.com> wrote:
> From: Christopher Bostic <cbostic@us.ibm.com>
>
> Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
> ---
>
> Changes to this patch based on reviewer feedback
>
> V2:
> - Removed enums in fsiinit.h and replaced with #defines
> - Added proper file copyright and license headers
> - Added certificate of origin
> - Removed version string
> - Replace kobject with struct device in struct fsidd
> - Suggestions to implement standard bus_type will be implemented in
>   later patches
>
> V3:
> - Removed white space
> - Suggestions to add Kconfig will be added in follow on patches
>
> V4:
> - Removed blank line at end of fsiinit.c

Nice, the patch now applies:

$ git am ~/Downloads/chris.patch
Applying: drivers/fsi: Initial stubs for FSI device driver.
$ echo $?
0

You indicate that this is patch version four, but you haven't put that
in the subject. git format-patch can do this for you with the -v
option:

       -v <n>, --reroll-count=<n>
           Mark the series as the <n>-th iteration of the topic. The output
           filenames have v<n> prepended to them, and the subject prefix
           ("PATCH" by default, but configurable via the --subject-prefix
           option) has ` v<n>` appended to it. E.g.  --reroll-count=4 may
           produce v4-0001-add-makefile.patch file that has "Subject: [PATCH
           v4 1/20] Add makefile" in it

I think you also need to set your username in your git configuration
so we see the emails as coming from you.

$ git config --global user.name "Chris Bostic"

I don't think you need to send another revision for that though.

The next step should be to include this patch as the first in a series
that adds the implementation of the bus.

Cheers,

Joel


> ---
>  drivers/Makefile      |  1 +
>  drivers/fsi/Makefile  |  5 +++++
>  drivers/fsi/fsiinit.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsiinit.h | 41 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 101 insertions(+)
>  create mode 100644 drivers/fsi/Makefile
>  create mode 100644 drivers/fsi/fsiinit.c
>  create mode 100644 drivers/fsi/fsiinit.h
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 795d0ca..63019ff 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -172,3 +172,4 @@ obj-$(CONFIG_STM)           += hwtracing/stm/
>  obj-$(CONFIG_ANDROID)          += android/
>  obj-$(CONFIG_NVMEM)            += nvmem/
>  obj-$(CONFIG_FPGA)             += fpga/
> +obj-$(CONFIG_FSI)              += fsi/
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> new file mode 100644
> index 0000000..f547c08
> --- /dev/null
> +++ b/drivers/fsi/Makefile
> @@ -0,0 +1,5 @@
> +#
> +# Makefile for the FSI bus specific drivers.
> +#
> +
> +obj-y          += fsiinit.o
> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
> new file mode 100644
> index 0000000..042e680
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.c
> @@ -0,0 +1,54 @@
> +/*
> + * FSI Master device driver
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * Christopher Bostic <cbostic@us.ibm.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "fsiinit.h"
> +
> +MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
> +MODULE_DESCRIPTION("FSI master device driver");
> +
> +#define FSIDD_MAJOR    0               /* FSI device driver major */
> +#define        FSIDD_TOSTR(x)  #x
> +#define        FSIDD_VERNO     4000
> +#define        FSIDD_VER(x)    FSIDD_TOSTR(x)
> +
> +struct fsidd fsidd = {         /* FSI device driver structure definition */
> +       .magic = FSI_DD_MAGIC,
> +       .strno = FSI_DD_STRNO,
> +};
> +
> +static int fsi_start(void)
> +{
> +       int rc = 0;
> +
> +       printk("FSI DD v:%d installation ok\n", FSIDD_VERNO);
> +       return rc;
> +}
> +
> +static void fsi_exit(void)
> +{
> +
> +}
> +
> +static int __init fsi_init(void)
> +{
> +       int rc = 0;
> +
> +       /* Set up the host controller */
> +       fsi_start();
> +       return rc;
> +}
> +
> +module_init(fsi_init);
> +module_exit(fsi_exit);
> diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
> new file mode 100644
> index 0000000..70c3e13
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.h
> @@ -0,0 +1,41 @@
> +/*
> + * FSI Master device driver structure definitions and defines
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * Christopher Bostic <cbostic@us.ibm.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef DRIVERS_FSIINIT_H
> +#define DRIVERS_FSIINIT_H
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
> +#include <linux/hrtimer.h>
> +
> +#define FSI_DD_MAGIC   0x64644632      /* ddF2 */
> +#define FSI_DD_STRNO   0x1             /* Structure version number */
> +
> +struct fsidd {                         /* FSI Main structure */
> +       unsigned long magic;            /* Magic number */
> +       unsigned long strno;            /* Structure version number */
> +       dev_t major;                    /* Major number of device */
> +       struct workqueue_struct *hotp_wq;       /* Hot plug work queue */
> +       wait_queue_head_t error_wq;     /* Wait queue for port errors */
> +       wait_queue_head_t lbus_wq;      /* Wait queue for lbus events */
> +       wait_queue_head_t irq_wq;       /* Wait queue for IRQ loops */
> +       wait_queue_head_t link_wq;      /* Wait queue for link changes */
> +       unsigned long state;            /* State driver is in */
> +       struct device dev;              /* Anchor point in /sys/kernel */
> +};
> +
> +#define        to_fsidd(a)             container_of(a, struct fsidd, kobj)
> +
> +#endif /* DRIVERS_FSIINIT_H */
> --
> 1.8.2.2
>
