Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2q8H6NVYzDqPn
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 16:25:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=1AIA0tDm; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id w127so5374185vkh.1
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jul 2016 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5DVjDWlFsSKYnLphsc9QTYv8/17Yh8T5j1BNzH9qRbo=;
 b=1AIA0tDmh3LFM8bZjjisqGLmtxrlFIMJdC9kGl4jnroRZIO2l02jxwDZ2JRL2gDJWH
 ST5Rn20t9yh5dqgZzIsdJ0AtvPmFSetEJ3yHp5k869lwDBHEoOJYop+/sfjmh3yi38+5
 fXauejUYAYEI6rmBR3AWtYJQZh663zXPVgVtxJyGU+9bke5C9FSvhVR+cgUIVtBhgklw
 gUyowz6+y4umbFecm6rs01ZFW7r44LMyPDxNm1N4Ie4WAvg671GCrmdpyxV9Bmr5Itcq
 Ss5SSXV5Y3GXoiOXy//pgMS50aKx5jbhbxy00gQGhs/vm++y5lbVy20+rhj19WyaPHhS
 +DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5DVjDWlFsSKYnLphsc9QTYv8/17Yh8T5j1BNzH9qRbo=;
 b=RSqsGXqn7/a59NsvNZBEJRcQFWROkG3ZXeXWTnBlE3QTlkwfLWK+KOhE7cPiEd9Xvm
 3hQTCk6qhHpgcL/TVfoZzoHwnZ1VFpb7t45SFEFdmf5fMhSnD07p/hgkuTBBI752sfnD
 bOEXKPLYYLv0UFLK9Y9b5qhJlgm3CrkyB7ZEvr87WDKvaeNa3ZY1CmGsVWuYpswUNqM5
 6T5QQG+d59QeVeaAdnZIFXfc1RubHV1C0vfp9JU0DIRR1RRE9D0tcCOK/wfY+YcKHsHY
 Kf5iR72NX64U36KI/CqZvGZ4DTPYrN8fq7V5qn8vfJAgjjf2P1KYK6i1dU9WW2t80BjK
 5Bmw==
X-Gm-Message-State: AEkooutqLylarsM6W9lmkoyKL6nfkWgGe0JqLpKq4ufqMM6dmXw20vg0o6xhi9V4x5txWEXrCPellZDxAzkWHQ==
X-Received: by 10.31.92.78 with SMTP id q75mr21788423vkb.112.1470032733366;
 Sun, 31 Jul 2016 23:25:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.5.230 with HTTP; Sun, 31 Jul 2016 23:25:13 -0700 (PDT)
In-Reply-To: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Aug 2016 15:55:13 +0930
X-Google-Sender-Auth: c26N73JctJsnkgyxbWeHsrI-O5k
Message-ID: <CACPK8XePtn6qFTo-G=bap9w_+LvwUFJaLMPh_A21GhptTx-+=w@mail.gmail.com>
Subject: Re: [PATCH linux v4 1/4] drivers/fsi: Initial stubs for FSI device
 driver.
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
X-List-Received-Date: Mon, 01 Aug 2016 06:25:36 -0000

On Fri, Jul 29, 2016 at 3:44 AM,  <christopher.lee.bostic@gmail.com> wrote:
> From: Christopher Bostic <cbostic@us.ibm.com>

Needs a description of the patch.

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
> ---
>  drivers/Makefile      |  1 +
>  drivers/fsi/Makefile  |  5 +++++
>  drivers/fsi/fsiinit.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsiinit.h | 41 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 100 insertions(+)
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

This needs to depend on enabling FSI support in the kernel. You forgot
to add the Kconfig patch in order to allow me to enable CONFIG_FSI:

--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -202,4 +202,6 @@ source "drivers/hwtracing/intel_th/Kconfig"

 source "drivers/fpga/Kconfig"

+source "drivers/fsi/Kconfig"
+
 endmenu

--- /dev/null
+++ b/drivers/fsi/Kconfig
@@ -0,0 +1,6 @@
+menu "FSI Support"
+
+config FSI
+ tristate "FSI bus support"
+    help Help text goes here
+
+endmenu
-- 

Use -v to set the revision in all your patches, not just the first one
in the series.

As others said; you need a cover letter with your series.

Your git line should be this:

git format-patch --cover-letter -v 3 --to=openbmc@lists.ozlabs.org -o
fsi-paches-v3

That will generate you a cover letter, set the revision to '3', and
output them to a directory called fsi-patches-v3.

> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
> new file mode 100644
> index 0000000..a9e3381
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.c
> @@ -0,0 +1,53 @@
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
