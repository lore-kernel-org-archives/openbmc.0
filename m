Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfT0B2BG2zDsgj
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 04:38:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=K7eqPKos; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id a62so4486497oib.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Z+Z5K8juebrp8CT+tTrTxxTi9SD0Bz1UD5SyjBDwmyM=;
 b=K7eqPKosw2QwjRd276fFPnIbP4HjlGaXwenTp0XKGlZ9iYiW24cOft0/N0xTqxuceM
 qImlMwcoA0oLvmtU8D6chW+Dx16B/QtqBcnvtqtNrermnM6Kwnhok55nLcarNihisfT3
 CpzuKihxUiqFiHSw3QGkmmAmthc4cSHnNRBgzUl4kHBUC56LSrN3a/7PYE7PqrI2fcs0
 QV7GzMiTkwZV6/G6v3zwh9AxsFTLu+fXQSYiTcFX9hnoCeEX4nTuMmRjQoOmtaa2utmn
 +p234K2DrQhhHl3vQBL9bSzGn6QFJESpOERcj0wA5CbEDAd8yBa/uqbbQ82H1Rr9TTp9
 4mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Z+Z5K8juebrp8CT+tTrTxxTi9SD0Bz1UD5SyjBDwmyM=;
 b=EkIDNImS5/2AUMQoPy7Tr2U2QzOBHPUwd+/gquEk5orqk0RVcVdjJlydYfsSRNCdO0
 ANnYce+WSOZFf7OnDTLiw8jP30joiN+ghVC4nF39+Iq5bOboyjTDiHt4mZ3J+CpSQDiZ
 taUYEsoqu1an4wfqidV3PwWqb+QaD6hgwCYOKZE4RlceaHpSX2Fw79J1ZEsaB0pcQnS9
 zKFKrrgAj0oTFs+KUwmeqJfmcgyYZktUZOM3GHyZUoYRnNkymo0e7XsDu+eP4HTASbXP
 qrhfFn8m5hbqJO6tX8RPmjYIUDS9aJftLQ4ca13AsvYaRUu8BSKM2izGpZ/1k4pmPfqp
 aPxw==
X-Gm-Message-State: AE9vXwOIq16mjLzfcxXAxdEPpxCN/5Up2add2GmaJ2uO1TaLSr5WHlxFOVdrMcU1yepcjqhDI8Ye3PLOchnxxw==
X-Received: by 10.202.95.130 with SMTP id t124mr4640221oib.159.1474483094394; 
 Wed, 21 Sep 2016 11:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 11:38:13 -0700 (PDT)
In-Reply-To: <CACPK8XcdH6qUq9A+fBCKLYAfcE-iEiA-tJV3N6nxJM=KEtqcoA@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1472068452-32048-3-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcdH6qUq9A+fBCKLYAfcE-iEiA-tJV3N6nxJM=KEtqcoA@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 13:38:13 -0500
Message-ID: <CAA0LjjVJ2vc7bsqCxoP6hi68ZUQMAv3mH+H_Oo=mi8jW9OLNVg@mail.gmail.com>
Subject: Re: [PATCH linux v5 2/7] drivers/fsi: Add FSI Master Functionality
 and Initialization
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Wed, 21 Sep 2016 18:38:19 -0000

On Wed, Sep 7, 2016 at 7:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Define the FSI master control register set and its accessors.
>> Initialize the primary FSI master.
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>> ---
>
> I recall reading this patch in the past. No changelog?

Had the changes specific to this patch in 0001, will move those to 0002.

>
>>  drivers/fsi/Makefile      |   2 +-
>>  drivers/fsi/fsi.h         |  32 +++
>>  drivers/fsi/fsi_private.h |  97 +++++++
>>  drivers/fsi/fsicfam.h     |  46 ++++
>>  drivers/fsi/fsiinit.c     |  22 ++
>>  drivers/fsi/fsiinit.h     |   2 +
>>  drivers/fsi/fsimaster.c   | 242 +++++++++++++++++
>>  drivers/fsi/fsimaster.h   | 655 ++++++++++++++++++++++++++++++++++++++++++++++
>>  8 files changed, 1097 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/fsi/fsi.h
>>  create mode 100644 drivers/fsi/fsi_private.h
>>  create mode 100644 drivers/fsi/fsicfam.h
>>  create mode 100644 drivers/fsi/fsimaster.c
>>  create mode 100644 drivers/fsi/fsimaster.h
>>
>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>> index f547c08..9800c15 100644
>> --- a/drivers/fsi/Makefile
>> +++ b/drivers/fsi/Ma



>> + * Determine the link address to send the break command to
>> + * This is master dependent
>> + */
>> +static inline int fsi_mtype_2break_id(u8 mtype)
>> +{
>> +       return FSI_MAX_CASCADE - 1;
>> +}
>> +
>> +/*
>> + * Build a mask where bit index 'x' is set (numbering from left to right.
>> + * Bit 0 is MSB and bit 31 is LSM.
>> + */
>> +static inline unsigned long mask32(int x)
>> +{
>> +       return 1 << (BITS_PER_LONG - x - 1);
>
> Is this masking in IBM bit ordering?
>
> We should pull the macros (or at least copy them) from arch/powerpc so
> we can use them here.

Will do, should be easy

>
>> +}
>> +
>> +/*
>> + * Various function prototypes
>> + */
>> +int slv_install(void);
>> +void slv_uninstall(void);
>> +
>> +void fsi_exit_fileio(dev_t);
>> +
>> +int fsibus_init(void);
>> +void fsibus_exit(void);
>> +
>> +#endif /* DRIVERS_FSI_PRIVATE_H */
>> diff --git a/drivers/fsi/fsicfam.h b/drivers/fsi/fsicfam.h
>> new file mode 100644
>> index 0000000..dde7036
>> --- /dev/null
>> +++ b/drivers/fsi/fsicfam.h
>> @@ -0,0 +1,46 @@
>> +/*
>> + * FSI CFAM structure definitions and defines
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * Christopher Bostic <cbostic@us.ibm.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +#ifndef DRIVERS_FSICFAM_H
>> +#define DRIVERS_FSICFAM_H
>> +
>> +#include "fsi.h"
>> +#include "fsi_private.h"
>> +
>> +#define FSI_MAX_ENGINES                32      /* Max # of engines per CFAM */
>> +
>> +struct fsicfam {                       /* CFAM internal structure */
>> +       struct fsidevice *engines[FSI_MAX_ENGINES];     /* CFAM engine data */
>> +       u32 cfgtab[FSI_MAX_ENGINES];    /* Configuration word */
>> +       u16 chipid;                     /* CFAM chip type (IOU, CFAM-S, etc) */
>> +       u8 id;                          /* CFAM Id */
>> +       bool has_submaster;             /* CFAM with cascaded or hub masters */
>> +       bool has_mux;                   /* CFAM with multiplexer */
>> +       u8 ec_maj;                      /* Major EC Level */
>> +       u8 ec_min;                      /* Minor EC Level or version number */
>> +       u16 pages;                      /* # Mapped pages */
>> +       u8 no_eng;                      /* Number of engines[] */
>> +       struct fsidevice fsidev;        /* LDM entry */
>> +       struct fsidevice hpdone;        /* Dummy engine to signal completion */
>> +       unsigned long eng_build;        /* True during engine activate */
>> +       struct fsimaster *master;       /* pointer to parent master */
>> +};
>> +
>> +#define to_fsicfam(x)  container_of((x), struct fsicfam, fsidev)
>
> Make this a function.

Will change.


>
>> +
>> +/*
>> + * CFAM specific function prototypes.
>> + */
>> +int fsi_cfamirq_request(int, struct fsicfam *);
>> +void fsi_cfamirq_free(struct fsicfam *);
>> +
>> +#endif /* DRIVERS_FSICFAM_H */
>> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
>> index 767c0c3..c589294 100644
>> --- a/drivers/fsi/fsiinit.c
>> +++ b/drivers/fsi/fsiinit.c
>> @@ -13,7 +13,9 @@
>>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>> +#include <linux/kdev_t.h>
>>  #include "fsiinit.h"
>> +#include "fsimaster.h"
>>
>>  MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
>>  MODULE_DESCRIPTION("FSI master device driver");
>> @@ -26,6 +28,7 @@ MODULE_DESCRIPTION("FSI master device driver");
>>  struct fsidd fsidd = {         /* FSI device driver structure definition */
>>         .magic = FSI_DD_MAGIC,
>>         .strno = FSI_DD_STRNO,
>> +       .major = MKDEV(FSIDD_MAJOR, 0),
>>  };
>>
>>  static int fsi_start(void)
>> @@ -33,6 +36,25 @@ static int fsi_start(void)
>>         int rc = 0;
>>
>>         dev_dbg(&fsidd.dev, "FSI DD v:%d installation ok\n", FSIDD_VERNO);
>> +
>> +       init_waitqueue_head(&fsidd.error_wq);
>> +       init_waitqueue_head(&fsidd.lbus_wq);
>> +       init_waitqueue_head(&fsidd.irq_wq);
>> +       init_waitqueue_head(&fsidd.link_wq);
>> +
>> +       /*
>> +        * Initialize the the master
>> +        */
>> +       if (!fsimaster_build_init(&fsidd.pri_master, FSI_PRIM, 0)) {
>> +               rc = PTR_ERR(0);
>
> ???
>
>> +               goto err;
>> +       }
>> +       fsimaster_start(&fsidd.pri_master);
>> +       dev_dbg(&fsidd.dev, "FSI DD v%d installation ok\n", FSIDD_VERNO);
>> +       return rc;
>> +
>> +err:
>> +       dev_dbg(&fsidd.dev, "FSI DD v:%d installation failed\n", FSIDD_VERNO);
>>         return rc;
>
> Your formatting is broken.

How is it broken?  Not sure what '???' means.

>
>>  }
>>
>> diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
>> index 93662533..10ddfc0 100644
>> --- a/drivers/fsi/fsiinit.h
>> +++ b/drivers/fsi/fsiinit.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/device.h>
>>  #include <linux/workqueue.h>
>>  #include <linux/hrtimer.h>
>> +#include "fsimaster.h"
>>
>>  #define FSI_DD_MAGIC   0x64644632      /* ddF2 */
>>  #define FSI_DD_STRNO   0x1             /* Structure version number */
>> @@ -34,6 +35,7 @@ struct fsidd {                                /* FSI Main structure */
>>         wait_queue_head_t link_wq;      /* Wait queue for link changes */
>>         unsigned long state;            /* State driver is in */
>>         struct device dev;              /* Anchor point in /sys/kernel */
>> +       struct fsimaster pri_master;    /* Primary FSI master */
>>  };
>>
>>  #define        to_fsidd_prim(a)        container_of(a, struct fsidd, pri_master)
>> diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
>> new file mode 100644
>> index 0000000..b5d16db
>> --- /dev/null
>> +++ b/drivers/fsi/fsimaster.c
>> @@ -0,0 +1,242 @@
>> +/*
>> + * FSI Master Control
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * Christopher Bostic <cbostic@us.ibm.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/delay.h>
>> +#include <linux/ktime.h>
>> +#include <linux/io.h>
>> +#include "fsi.h"
>> +#include "fsiinit.h"
>> +#include "fsimaster.h"
>> +#include "fsicfam.h"
>> +
>> +static int hpinfo_alloc(struct fsimaster *master)
>> +{
>> +       return 0;
>> +}
>> +
>> +static inline unsigned int fsimid(struct fsimaster *master)
>> +{
>> +       return master->myid;
>> +}
>> +
>> +static void primaster_exit(struct fsimaster *master)
>> +{
>> +       if (master->dcr_alloc) {
>> +               master->base = NULL;
>> +               master->dcr_alloc = false;
>> +       }
>> +}
>> +
>> +/*
>> + * Read/write functions to access primary FSI master registers
>> + * Note that this master is virtual as we don't yet have any
>> + * real FSI masters implemented in hardware
>
> "virtual"? What's the purpose of this code?

For implementations without a real hardware FSI master such as soft
FSI there is a 'virtual' master in memory where registers are just u32
variables in a data structure. Will add comments to make this clear.

>
>> + */
>> +static u32 virt_master_readreg(struct fsi_mreg *mbase, int regnm)
>> +{
>> +       u32 *base = (u32 *)mbase;
>> +
>> +       return *(base + regnm);
>> +}
>> +
>> +static void virt_master_readreg2(struct fsi_mreg *mbase, int regnm, u64 *dest)
>> +{
>> +       u32 *base = (u32 *)mbase;
>> +
>> +       memcpy(dest, base + regnm, sizeof(u64));
>> +}
>> +
>> +static void virt_master_readreg4(struct fsi_mreg *mbase, int regnm, u32 *dest)
>> +{
>> +       u32 *base = (u32 *)mbase;
>> +
>> +       memcpy(dest, base + regnm, 4 * sizeof(u32));
>> +}
>>
