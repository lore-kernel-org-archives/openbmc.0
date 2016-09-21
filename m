Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 424 seconds by postgrey-1.36 at bilbo;
 Thu, 22 Sep 2016 09:06:34 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=ks2Zo+Yd; dkim-atps=neutral
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfZxk1MkbzDqBG
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 09:06:34 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 571EB1E6CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1474498766;
 bh=hGtWogHrFxSWEvil+1HVvBRXXo0ih0rg5RpnjUPlPbw=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=ks2Zo+YdQiFQuKBfrwAnMb8NOVriSNpZWf5keCrhGwagpLwJ/A+A0YDOuNFRYykH7
 Dl3qws6ZqTjDArkaQsfFPWLBbYS6jOhFNXSN4Bzp0Kf27JlcrUIuJzPeyY3ngOUl8C
 ZkW+4+DurIZBXKkhFfxlkfQllwQ4vFelm+iaF27g=
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH linux v5 2/7] drivers/fsi: Add FSI Master Functionality
 and Initialization
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAA0LjjVJ2vc7bsqCxoP6hi68ZUQMAv3mH+H_Oo=mi8jW9OLNVg@mail.gmail.com>
Date: Wed, 21 Sep 2016 18:59:24 -0400
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <58455F4A-77F0-4496-BA4A-A8BAD1A37563@fuzziesquirrel.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1472068452-32048-3-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcdH6qUq9A+fBCKLYAfcE-iEiA-tJV3N6nxJM=KEtqcoA@mail.gmail.com>
 <CAA0LjjVJ2vc7bsqCxoP6hi68ZUQMAv3mH+H_Oo=mi8jW9OLNVg@mail.gmail.com>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 21 Sep 2016 23:06:35 -0000


> On Sep 21, 2016, at 2:38 PM, Christopher Bostic =
<christopher.lee.bostic@gmail.com> wrote:
>=20
> On Wed, Sep 7, 2016 at 7:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> =
wrote:
>>> From: Chris Bostic <cbostic@us.ibm.com>
>>>=20
>>> Define the FSI master control register set and its accessors.
>>> Initialize the primary FSI master.
>>>=20
>>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>>> ---
>>=20
>> I recall reading this patch in the past. No changelog?
>=20
> Had the changes specific to this patch in 0001, will move those to =
0002.
>=20
>>=20
>>> drivers/fsi/Makefile      |   2 +-
>>> drivers/fsi/fsi.h         |  32 +++
>>> drivers/fsi/fsi_private.h |  97 +++++++
>>> drivers/fsi/fsicfam.h     |  46 ++++
>>> drivers/fsi/fsiinit.c     |  22 ++
>>> drivers/fsi/fsiinit.h     |   2 +
>>> drivers/fsi/fsimaster.c   | 242 +++++++++++++++++
>>> drivers/fsi/fsimaster.h   | 655 =
++++++++++++++++++++++++++++++++++++++++++++++
>>> 8 files changed, 1097 insertions(+), 1 deletion(-)
>>> create mode 100644 drivers/fsi/fsi.h
>>> create mode 100644 drivers/fsi/fsi_private.h
>>> create mode 100644 drivers/fsi/fsicfam.h
>>> create mode 100644 drivers/fsi/fsimaster.c
>>> create mode 100644 drivers/fsi/fsimaster.h
>>>=20
>>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>>> index f547c08..9800c15 100644
>>> --- a/drivers/fsi/Makefile
>>> +++ b/drivers/fsi/Ma
>=20
>=20
>=20
>>> + * Determine the link address to send the break command to
>>> + * This is master dependent
>>> + */
>>> +static inline int fsi_mtype_2break_id(u8 mtype)
>>> +{
>>> +       return FSI_MAX_CASCADE - 1;
>>> +}
>>> +
>>> +/*
>>> + * Build a mask where bit index 'x' is set (numbering from left to =
right.
>>> + * Bit 0 is MSB and bit 31 is LSM.
>>> + */
>>> +static inline unsigned long mask32(int x)
>>> +{
>>> +       return 1 << (BITS_PER_LONG - x - 1);
>>=20
>> Is this masking in IBM bit ordering?
>>=20
>> We should pull the macros (or at least copy them) from arch/powerpc =
so
>> we can use them here.
>=20
> Will do, should be easy
>=20
>>=20
>>> +}
>>> +
>>> +/*
>>> + * Various function prototypes
>>> + */
>>> +int slv_install(void);
>>> +void slv_uninstall(void);
>>> +
>>> +void fsi_exit_fileio(dev_t);
>>> +
>>> +int fsibus_init(void);
>>> +void fsibus_exit(void);
>>> +
>>> +#endif /* DRIVERS_FSI_PRIVATE_H */
>>> diff --git a/drivers/fsi/fsicfam.h b/drivers/fsi/fsicfam.h
>>> new file mode 100644
>>> index 0000000..dde7036
>>> --- /dev/null
>>> +++ b/drivers/fsi/fsicfam.h
>>> @@ -0,0 +1,46 @@
>>> +/*
>>> + * FSI CFAM structure definitions and defines
>>> + *
>>> + * Copyright 2016 IBM Corp.
>>> + *
>>> + * Christopher Bostic <cbostic@us.ibm.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + */
>>> +#ifndef DRIVERS_FSICFAM_H
>>> +#define DRIVERS_FSICFAM_H
>>> +
>>> +#include "fsi.h"
>>> +#include "fsi_private.h"
>>> +
>>> +#define FSI_MAX_ENGINES                32      /* Max # of engines =
per CFAM */
>>> +
>>> +struct fsicfam {                       /* CFAM internal structure =
*/
>>> +       struct fsidevice *engines[FSI_MAX_ENGINES];     /* CFAM =
engine data */
>>> +       u32 cfgtab[FSI_MAX_ENGINES];    /* Configuration word */
>>> +       u16 chipid;                     /* CFAM chip type (IOU, =
CFAM-S, etc) */
>>> +       u8 id;                          /* CFAM Id */
>>> +       bool has_submaster;             /* CFAM with cascaded or hub =
masters */
>>> +       bool has_mux;                   /* CFAM with multiplexer */
>>> +       u8 ec_maj;                      /* Major EC Level */
>>> +       u8 ec_min;                      /* Minor EC Level or version =
number */
>>> +       u16 pages;                      /* # Mapped pages */
>>> +       u8 no_eng;                      /* Number of engines[] */
>>> +       struct fsidevice fsidev;        /* LDM entry */
>>> +       struct fsidevice hpdone;        /* Dummy engine to signal =
completion */
>>> +       unsigned long eng_build;        /* True during engine =
activate */
>>> +       struct fsimaster *master;       /* pointer to parent master =
*/
>>> +};
>>> +
>>> +#define to_fsicfam(x)  container_of((x), struct fsicfam, fsidev)
>>=20
>> Make this a function.
>=20
> Will change.
>=20
>=20
>>=20
>>> +
>>> +/*
>>> + * CFAM specific function prototypes.
>>> + */
>>> +int fsi_cfamirq_request(int, struct fsicfam *);
>>> +void fsi_cfamirq_free(struct fsicfam *);
>>> +
>>> +#endif /* DRIVERS_FSICFAM_H */
>>> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
>>> index 767c0c3..c589294 100644
>>> --- a/drivers/fsi/fsiinit.c
>>> +++ b/drivers/fsi/fsiinit.c
>>> @@ -13,7 +13,9 @@
>>>=20
>>> #include <linux/init.h>
>>> #include <linux/module.h>
>>> +#include <linux/kdev_t.h>
>>> #include "fsiinit.h"
>>> +#include "fsimaster.h"
>>>=20
>>> MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
>>> MODULE_DESCRIPTION("FSI master device driver");
>>> @@ -26,6 +28,7 @@ MODULE_DESCRIPTION("FSI master device driver");
>>> struct fsidd fsidd =3D {         /* FSI device driver structure =
definition */
>>>        .magic =3D FSI_DD_MAGIC,
>>>        .strno =3D FSI_DD_STRNO,
>>> +       .major =3D MKDEV(FSIDD_MAJOR, 0),
>>> };
>>>=20
>>> static int fsi_start(void)
>>> @@ -33,6 +36,25 @@ static int fsi_start(void)
>>>        int rc =3D 0;
>>>=20
>>>        dev_dbg(&fsidd.dev, "FSI DD v:%d installation ok\n", =
FSIDD_VERNO);
>>> +
>>> +       init_waitqueue_head(&fsidd.error_wq);
>>> +       init_waitqueue_head(&fsidd.lbus_wq);
>>> +       init_waitqueue_head(&fsidd.irq_wq);
>>> +       init_waitqueue_head(&fsidd.link_wq);
>>> +
>>> +       /*
>>> +        * Initialize the the master
>>> +        */
>>> +       if (!fsimaster_build_init(&fsidd.pri_master, FSI_PRIM, 0)) {
>>> +               rc =3D PTR_ERR(0);
>>=20
>> ???

I think the ??? means what is up with PTR_ERR(0) ?  Maybe just save the =
rc from the previous line?

>>=20
>>> +               goto err;
>>> +       }
>>> +       fsimaster_start(&fsidd.pri_master);
>>> +       dev_dbg(&fsidd.dev, "FSI DD v%d installation ok\n", =
FSIDD_VERNO);
>>> +       return rc;
>>> +
>>> +err:
>>> +       dev_dbg(&fsidd.dev, "FSI DD v:%d installation failed\n", =
FSIDD_VERNO);
>>>        return rc;
>>=20
>> Your formatting is broken.
>=20
> How is it broken?  Not sure what '???' means.

Agree=E2=80=A6I don=E2=80=99t see anything broken here.

>=20
>>=20
>>> }
>>>=20
>>> diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
>>> index 93662533..10ddfc0 100644
>>> --- a/drivers/fsi/fsiinit.h
>>> +++ b/drivers/fsi/fsiinit.h
>>> @@ -19,6 +19,7 @@
>>> #include <linux/device.h>
>>> #include <linux/workqueue.h>
>>> #include <linux/hrtimer.h>
>>> +#include "fsimaster.h"
>>>=20
>>> #define FSI_DD_MAGIC   0x64644632      /* ddF2 */
>>> #define FSI_DD_STRNO   0x1             /* Structure version number =
*/
>>> @@ -34,6 +35,7 @@ struct fsidd {                                /* =
FSI Main structure */
>>>        wait_queue_head_t link_wq;      /* Wait queue for link =
changes */
>>>        unsigned long state;            /* State driver is in */
>>>        struct device dev;              /* Anchor point in =
/sys/kernel */
>>> +       struct fsimaster pri_master;    /* Primary FSI master */
>>> };
>>>=20
>>> #define        to_fsidd_prim(a)        container_of(a, struct fsidd, =
pri_master)
>>> diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
>>> new file mode 100644
>>> index 0000000..b5d16db
>>> --- /dev/null
>>> +++ b/drivers/fsi/fsimaster.c
>>> @@ -0,0 +1,242 @@
>>> +/*
>>> + * FSI Master Control
>>> + *
>>> + * Copyright 2016 IBM Corp.
>>> + *
>>> + * Christopher Bostic <cbostic@us.ibm.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/ktime.h>
>>> +#include <linux/io.h>
>>> +#include "fsi.h"
>>> +#include "fsiinit.h"
>>> +#include "fsimaster.h"
>>> +#include "fsicfam.h"
>>> +
>>> +static int hpinfo_alloc(struct fsimaster *master)
>>> +{
>>> +       return 0;
>>> +}
>>> +
>>> +static inline unsigned int fsimid(struct fsimaster *master)
>>> +{
>>> +       return master->myid;
>>> +}
>>> +
>>> +static void primaster_exit(struct fsimaster *master)
>>> +{
>>> +       if (master->dcr_alloc) {
>>> +               master->base =3D NULL;
>>> +               master->dcr_alloc =3D false;
>>> +       }
>>> +}
>>> +
>>> +/*
>>> + * Read/write functions to access primary FSI master registers
>>> + * Note that this master is virtual as we don't yet have any
>>> + * real FSI masters implemented in hardware
>>=20
>> "virtual"? What's the purpose of this code?
>=20
> For implementations without a real hardware FSI master such as soft
> FSI there is a 'virtual' master in memory where registers are just u32
> variables in a data structure. Will add comments to make this clear.
>=20
>>=20
>>> + */
>>> +static u32 virt_master_readreg(struct fsi_mreg *mbase, int regnm)
>>> +{
>>> +       u32 *base =3D (u32 *)mbase;
>>> +
>>> +       return *(base + regnm);
>>> +}
>>> +
>>> +static void virt_master_readreg2(struct fsi_mreg *mbase, int regnm, =
u64 *dest)
>>> +{
>>> +       u32 *base =3D (u32 *)mbase;
>>> +
>>> +       memcpy(dest, base + regnm, sizeof(u64));
>>> +}
>>> +
>>> +static void virt_master_readreg4(struct fsi_mreg *mbase, int regnm, =
u32 *dest)
>>> +{
>>> +       u32 *base =3D (u32 *)mbase;
>>> +
>>> +       memcpy(dest, base + regnm, 4 * sizeof(u32));
>>> +}
>>>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
