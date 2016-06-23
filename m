Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb37m3sMVzDqlW
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 00:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=csrq8MZB; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id j2so16028907qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wNLzgDrDtKSIDtKUn1fHszO/uvvB2/E44zjb0HcP2ns=;
 b=csrq8MZBLiznvo0d1bqfbn0vTmWPzphx4VmeV5LcLTky0x5ViAZYytbMjhKk1h2zzH
 kf6dpJQeuCCTRvGqVfvuPIzYjy0CzdpMEzylnoIPNnBeZ/weOMDW8rWUjYgqP9y9Dji+
 oILRE6J497bM8bSUm/ff3EoVDXnnDi5z+NPSqpS7FpF8ZxZgJ8Ka/Uj2VYH9gDCd/JLL
 KW2DEQkFJEL0tUGkgxrJ6mMQQKFmx/FPKjEk3HfVJnFWVHxZZ6GbxRhhbSoODR02DISy
 xIbng1z+hmacokizXBk/jHqzdt4eSqXR7NWfKon6dn3tyVV6mDg6uPgAuL4Q0RNBYZdK
 T6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wNLzgDrDtKSIDtKUn1fHszO/uvvB2/E44zjb0HcP2ns=;
 b=VnmNkKpN8TNzPFzswSgRa06Zw4ByMvoLMRYI4pSOetAsFZRomPgy2p57TIwNxqv6en
 lj3BhlsDm12knfQGVcNggxqtJB/eo5FNT/+sxy3X52A3ASseJxC52YM1z4rWdCMIMwaz
 Iyk/b9F/A1Zhul/cjk1jQBz49gRUpfXqpPRuezr1OnUMYsAql9REfV4bZ2g+ja/6olZw
 agEihysG4b/j6qiA4M6Eviw9EZ7nFqG+IRRux77WAPX7ZaTCvjaFMtlqa4DadxLOgNhP
 kEUPSy2E94Sd5yT2/nz6+pM0eA8Dyvlq1pAGMbP9hK25RNSbUQ/AArKWJlcFRN60W9Pj
 oJiA==
X-Gm-Message-State: ALyK8tIo6ZJUhY25k5acDXO/cu12kSP1nEh3XiQs5k0ruc4C+kcHwwPwBoO7QQEomSVN4NPBIlwn0BfrWA2Ljw==
X-Received: by 10.200.39.237 with SMTP id x42mr35555391qtx.75.1466690559276;
 Thu, 23 Jun 2016 07:02:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 07:02:18 -0700 (PDT)
In-Reply-To: <OF25FAD433.8D8FCEB7-ON00257FD9.005434D4-86257FD9.005463AC@notes.na.collabserv.com>
References: <OF25FAD433.8D8FCEB7-ON00257FD9.005434D4-86257FD9.005463AC@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2016 23:32:18 +0930
X-Google-Sender-Auth: vg2-amwQa_LvcxjnQvptOJOM0Rc
Message-ID: <CACPK8XdEotyHJspAERNXuU-_j7cwL0Xht9rwY7sTMbftoWxDBw@mail.gmail.com>
Subject: Re: [PATCH linux] FSI: Initial stubs for device driver
To: Christopher Bostic <cbostic@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Reed B Frandsen <rfrandse@us.ibm.com>, 
 Edward James <eajames@us.ibm.com>, Alistair Popple <alistair@popple.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 23 Jun 2016 14:02:45 -0000

Hi Chris,

Thanks for the patch, it's a good first step.

In the future you will need to use a real SMTP server with git
send-email to submit your patches. Notes doesn't quite do the trick.
I'll ping you with some suggestions.

On Wed, Jun 22, 2016 at 12:51 AM, Christopher Bostic <cbostic@us.ibm.com> wrote:
>
> From: Christopher Bostic <cbostic@us.ibm.com>
> Date: Thu, 9 Jun 2016 13:42:59 -0500
>
> Initial FSI device driver stubs

When writing commit messages it's convention to indicate the area of
the kernel that they touch. In this case you might do:

drivers/fsi: FSI device driver stubs

Then you want some description of what the patches do. Perhaps you
could describe what FSI is, what it does and why we want it in the
kernel.

Finally, the commit message must carry a developers certificate of
origin. You can read about that here:

 http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches#n409

On to the code.

>
> ---
> drivers/Makefile      |  1 +
> drivers/fsi/Makefile  |  5 +++++
> drivers/fsi/fsiinit.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
> drivers/fsi/fsiinit.h | 45 ++++++++++++++++++++++++++++++++++++++++++
> 4 files changed, 105 insertions(+)
> create mode 100644 drivers/fsi/Makefile
> create mode 100644 drivers/fsi/fsiinit.c
> create mode 100644 drivers/fsi/fsiinit.h
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 795d0ca..8ea7c58 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -172,3 +172,4 @@ obj-$(CONFIG_STM)        += hwtracing/stm/
> obj-$(CONFIG_ANDROID)        += android/
> obj-$(CONFIG_NVMEM)        += nvmem/
> obj-$(CONFIG_FPGA)        += fpga/
> +obj-$(CONFIG_FSI)        += fsi/
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
> +obj-y        += fsiinit.o
> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
> new file mode 100644
> index 0000000..d7902d8
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.c
> @@ -0,0 +1,54 @@
> +/*
> + * Copyright (c) International Business Machines Corp., 2012
> + *
> + * FSI Master device driver
> + *
> + * Thomas Richter, IBM Boeblingen, Germany, 17-Jun-2010
> + * Christopher Bostic, IBM Austin, TX  2016
> + *
> + */

Take a look at some of the modern files contributed by IMBers to the
kernel for how to strucutre the copyright and licence declerations.

eg. http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/platforms/powernv/opal.c

It's up to the developer to put their name and email address at the
top of the file. Some developers steer clear as the information can
become outdated over time, and it's contained in the git commit logs
anyway. If you do chose to keep it in I'd perhaps put names and email
addresses, instead of work locations.

> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include "fsiinit.h"
> +
> +MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
> +MODULE_DESCRIPTION("FSI master device driver");
> +
> +#define FSIDD_MAJOR    0        /* FSI device driver major */
> +#define    FSIDD_TOSTR(x)    #x
> +#define    FSIDD_VERNO    4000
> +#define    FSIDD_VER(x)    FSIDD_TOSTR(x)
> +
> +struct fsidd fsidd = {        /* FSI device driver structure definition */
> +    .magic = FSI_DD_MAGIC,
> +    .strno = FSI_DD_STRNO,
> +};
> +
> +
> +static int fsi_start(void)
> +{
> +    int rc = 0;
> +
> +
> +    printk("FSI DD %s installation ok\n", fsidd.vstr);
> +    return rc;
> +}
> +
> +static void fsi_exit(void)
> +{
> +
> +}
> +
> +static int __init fsi_init(void)
> +{
> +    int rc = 0;
> +
> +    /* Set up the host controller */
> +    fsi_start();
> +    return rc;
> +}

These stubs are very minimal. Hard to procide much feedback at this point :)

> +
> +module_init(fsi_init);
> +module_exit(fsi_exit);
> +
> diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
> new file mode 100644
> index 0000000..2383610
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.h
> @@ -0,0 +1,45 @@
> +/*
> + * Copyright (c) International Business Machines Corp., 2010
> + *
> + * FSI Master device driver
> + *
> + * Thomas Richter, IBM Boeblingen, Germany, Jun-2010
> + * Christopher Bostic, IBM Austin, TX 2013

Similar to the comments above for the copyright and licence headers.

> + *
> + *
> + * Structure definitions and defines.
> + */
> +
> +#ifndef DRIVERS_FSIINIT_H
> +#define DRIVERS_FSIINIT_H
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/kobject.h>
> +#include <linux/workqueue.h>
> +#include <linux/hrtimer.h>
> +
> +#define VSTRLEN        32        /* Version string length */
> +
> +enum {
> +    FSI_DD_MAGIC = 0x64644632,    /* ddF2 */
> +    FSI_DD_STRNO = 0x1        /* Structure version number */
> +};

These arent an enumeration of values. Make them #defines.

> +
> +struct fsidd {                /* FSI Main structure */
> +    unsigned long magic;        /* Magic number */
> +    unsigned long strno;        /* Structure version number */

What purpose does this serve?

> +    char vstr[VSTRLEN];        /* Version string */

What's the version string used for? Is it really necessary?

> +    dev_t major;            /* Major number of device */
> +    struct workqueue_struct *hotp_wq;    /* Hot plug work queue */
> +    wait_queue_head_t error_wq;    /* Wait queue for port errors */
> +    wait_queue_head_t lbus_wq;    /* Wait queue for lbus events */
> +    wait_queue_head_t irq_wq;    /* Wait queue for IRQ loops */
> +    wait_queue_head_t link_wq;    /* Wait queue for link changes */
> +    unsigned long state;        /* State driver is in */
> +    struct kobject kobj;        /* Anchor point in /sys/kernel */

I would expect the structure to contain a struct device, which itself
contains a struct kobject.

I assume this code will create a struct bus_type for fsi?

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-model/bus.txt

Cheers,

Joel
