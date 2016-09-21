Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfT7W3HB4zDsgj
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 04:44:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WFs+lOty; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id n202so4492695oig.2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=lvx1l67qnhv01darWqjMvvMDvBuzATluK6GZkJmM198=;
 b=WFs+lOtyM12okH0z5OoCRslrOX5xRL4IoIpD19TonFjz9Nh5crDKW8JI3kZdbILhxs
 ZvCcpzCCiIQIFgQkmVIe5I1+ly1S4a4scPiQni4w4316ZhzL7kxgHiMCbLnpAqRH0zRQ
 w/kFFB3Rnf5vhydtBuhSzqIuIrdgzF6X3/BKDnbhjqcAulA6Oe8tHbI+P/UKsLBBqauc
 pxkeoGEka1+0AgoYEa73OjffN3Jo8Nmd1F26fSY9zl9FBJSua0mInxBXJTFF5stmp+7s
 fA9eLmLQg6mNroOPxsIADc1wPrb1XJGTJ8bw5FeZIdANrbMGdXEapHD3GmRWFQ6kepsF
 Q1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=lvx1l67qnhv01darWqjMvvMDvBuzATluK6GZkJmM198=;
 b=G21ACeFEJ4/gmcAE7++3hNjTyN+3Ir86Vd0hYXqp64FleDAlU+ub2rIQ26bUn6Pxlh
 Cplm0iZczfZXSw0uk2Jn+sXGlvFce+txX8+c3/DXXW61ekj8peBFpEX01baYOId01PiW
 zs6Gd2Wks1V68in7bShnXxKp/Clw95oKi3AE4HSlbJIVOzD2d1zQ/Uy8IHoZOa9h4U2s
 oLSQVzR30a4v7Bsf6RmEWOlVLHIBv1tkC3kHEVKlyyP1BZ9k9u9IMmyvO2M2i+18hua8
 1tmctEKfhk4zn41kZrzpaD5snk6r6eQcN4g+2VMToHDPm0H1a4wYFnco7g711EidmEOu
 4I6w==
X-Gm-Message-State: AE9vXwMkf9TrTZvAJlDK7r85hOxpuKj4SWhjI/ZU3W10yA3fiTV9nv5t1vRB6AABVnVgLLkYuOAsdbr3wd7tMQ==
X-Received: by 10.202.231.4 with SMTP id e4mr4971417oih.28.1474483476432; Wed,
 21 Sep 2016 11:44:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 11:44:35 -0700 (PDT)
In-Reply-To: <CACPK8XfE0LpLnU64bw-8JA70wvAwbfO7L-fb6foyOLv-nMfNeg@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1472068452-32048-5-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XfE0LpLnU64bw-8JA70wvAwbfO7L-fb6foyOLv-nMfNeg@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 13:44:35 -0500
Message-ID: <CAA0LjjUU6nnZwoFMbnodrVYqM=xGDX3c8P97HPRehOXjYBwapg@mail.gmail.com>
Subject: Re: [PATCH linux v5 4/7] drivers/fsi: Add initial FSI link buildup
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 21 Sep 2016 18:44:40 -0000

On Wed, Sep 7, 2016 at 7:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Add function to allow the primary FSI master to begin a buildup of a link
>> when a target device is found.  Buildup is the process of creating an
>> internal device tree representing the physical target device connections
>> on a given master.  First a master must create a link structure and
>> initialize it when there is a target device present on the other end of the
>> link.
>>
>> Begin process of 'pinging' target device called a 'CFAM'.  CFAM (Common
>> Field replaceable unit Access Macro) contains an FSI slave that is the
>> target of any FSI master communications.  First the master pings by sending
>> a BREAK command to determine if anyone is listening.  If CFAM is accessible
>> by reading its configuration space then the link buildup process begins.
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>> ---
>>  drivers/fsi/Makefile      |   2 +-
>>  drivers/fsi/build.c       | 114 +++++++++++++
>>  drivers/fsi/fsi.h         |  20 +++
>>  drivers/fsi/fsi_private.h |  21 +++
>>  drivers/fsi/fsiinit.c     |   3 +
>>  drivers/fsi/fsilink.h     |  99 ++++++++++++
>>  drivers/fsi/fsimaster.c   | 218 +++++++++++++++++++++++++
>>  drivers/fsi/fsimaster.h   |   5 +
>>  drivers/fsi/fsislave.h    | 404 ++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/fsi/ldm.c         |  29 ++++
>>  drivers/fsi/readwrite.c   |  34 ++++
>>  11 files changed, 948 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/fsi/build.c
>>  create mode 100644 drivers/fsi/fsilink.h
>>  create mode 100644 drivers/fsi/fsislave.h
>>  create mode 100644 drivers/fsi/ldm.c
>>  create mode 100644 drivers/fsi/readwrite.c
>>
>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>> index 9800c15..2445cee 100644
>> --- a/drivers/fsi/Makefile
>> +++ b/drivers/fsi/Makefile
>> @@ -2,4 +2,4 @@
>>  # Makefile for the FSI bus specific drivers.
>>  #
>>
>> -obj-y          += fsiinit.o fsimaster.o
>> +obj-y          += fsiinit.o fsimaster.o build.o readwrite.o ldm.o
>> diff --git a/drivers/fsi/build.c b/drivers/fsi/build.c
>> new file mode 100644
>> index 0000000..c9a31c0
>> --- /dev/null
>> +++ b/drivers/fsi/build.c
>> @@ -0,0 +1,114 @@
>> +/*
>> + * FSI Link Build up
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
>> +#include <linux/err.h>
>> +#include <linux/delay.h>
>> +#include <linux/slab.h>
>> +#include <linux/io.h>
>> +#include "fsi.h"
>> +#include "fsi_private.h"
>> +#include "fsimaster.h"
>> +#include "fsicfam.h"
>> +#include "fsilink.h"
>> +
>> +static void link_release(struct device *devp)
>> +{
>> +}
>> +
>> +/*
>> + * Create a FSI link struct and assign it to the FSI tree
>> + */
>> +static struct fsilink *link_add(struct fsimaster *master, int no)
>> +{
>> +       int rc = 0;
>> +       struct fsilink *link = NULL;
>> +       int id = 0;
>> +
>> +       id = fsi_mtype_2break_id(master->type);
>> +
>> +       link = kmalloc(sizeof(struct fsilink), GFP_KERNEL);
>> +       if (!link)
>> +               return link;
>> +
>> +       dev_set_name(&link->fsidev.dev, "link-%d", no);
>> +       link->id3_addr = (FSI_MAX_CASCADE - 1) * FSI_CFAM_SIZE;
>> +       link->master = master;
>> +       link->linkno = no;
>> +       link->fsidev.map.va = link->id3_addr;
>> +       link->fsidev.map.cmtype = master->type;
>> +       link->fsidev.id.engine_type = FSI_ENGID_LINK;
>> +       link->fsidev.map.kb = fsimaster_linksz(master) / FSI_ENGINE_SIZE;
>> +       link->fsidev.irq_start = no * (FSI_MAX_CASCADE * FSI_MAX_ENGINES);
>> +       link->fsidev.irq_range = FSI_MAX_CASCADE * FSI_MAX_ENGINES;
>> +       if (!master->fsidev)
>> +               link->fsidev.dev.parent = 0;
>> +       else
>> +               link->fsidev.dev.parent = &master->fsidev->dev;
>> +       link->fsidev.dev.release = link_release;
>> +
>> +       /* stub */
>> +
>> +       return link ? : ERR_PTR(rc);
>> +}
>> +
>> +static void linkbuild2(struct fsimaster *master, struct fsilink *link)
>> +{
>> +}
>> +
>> +/*
>> + * Return number of CFAMs discovered. If something fails during the build up
>> + * process return error reason
>> + */
>> +static int linkbuild1(struct fsimaster *master, int no)
>
> The naming needs to be fixed.

Will fix.

>
>> +{
>> +       int i, rc = 0;
>> +       struct fsilink *link = link_add(master, no);
>> +
>> +       if (IS_ERR(link))
>> +               return PTR_ERR(link);
>> +
>> +       /* stub */
>> +
>> +       linkbuild2(master, link);
>> +       i = link->cascade;
>> +       if (i == 0) {
>> +
>> +               /* stub */
>> +
>> +               rc = -EIO;
>> +       } else {
>> +
>> +               /* stub */
>> +       }
>> +
>> +       return rc;
>> +}
>> +
>> +/*
>> + * Build up a link.  Returns number of CFAMs discovered.
>> + */
>> +int fsi_linkbuild(struct fsimaster *master, int no)
>> +{
>> +       int rc;
>> +       u64 menp;
>> +
>> +       menp = fsimaster_read_menp(master);
>> +       if (menp & mask64(no))
>> +               return -EEXIST;  /* Already running */
>> +
>> +       fsimaster_enable_link(master, no);
>> +       rc = linkbuild1(master, no);
>> +       if (rc < 0)
>> +               fsimaster_disable_link(master, no);
>> +
>> +       return rc;
>> +}
>> diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
>> index f146396..b723208 100644
>> --- a/drivers/fsi/fsi.h
>> +++ b/drivers/fsi/fsi.h
>> @@ -15,15 +15,35 @@
>>
>>  #include <linux/device.h>
>>
>> +/*
>> + * Engine ID's
>> + */
>> +#define FSI_ENGID_LINK         0xff    /* Link Identifier */
>> +
>> +/* Engine ID as it appears in the CFAM configuration table */
>> +struct fsi_engine_id {
>> +       u8 match_flags;
>> +       u8 engine_type;
>> +       u8 engine_version;
>> +       u8 engine_vendor;
>> +};
>> +
>> +/* Location information for a FSI device */
>>  struct fsimap {
>>         u8 link;                        /* Master link # */
>>         u8 cfam;                        /* CFAM # on link */
>> +       u8 eng;                         /* Engine # on CFAM */
>> +       u8 cmtype;                      /* Type of master upstream */
>>         u32 offset;                     /* Address offset into CFAM */
>>         u32 va;                         /* Virtual address */
>> +       u16 kb;                         /* Size of dev engine space */
>> +       u16 kb_off;                     /* CFAM config table offset data */
>>  };
>>
>>  struct fsidevice {
>> +       struct fsi_engine_id id;        /* Engine type/version */
>>         u32 irq_start;                  /* IRQ Number */
>> +       u16 irq_range;                  /* Number of IRQs */
>>         struct fsidevice *parent;       /* Parent of this device */
>>         struct device dev;              /* LDM entry for bus */
>>         struct fsimap map;              /* Address & location info */
>> diff --git a/drivers/fsi/fsi_private.h b/drivers/fsi/fsi_private.h
>> index be327ef..afa2553 100644
>> --- a/drivers/fsi/fsi_private.h
>> +++ b/drivers/fsi/fsi_private.h
>> @@ -44,10 +44,22 @@
>>  #define        FSI_PRIM                0               /* Generic Primary FSI master */
>>  #define        FSI_MBIT_MASK           0x3             /* FSI master  bits in pa */
>>  #define        FSI_ENG_MASK            0x00007FFF      /* The engine mask in MATRB */
>> +
>>  /* FSI Events */
>> +#define FSI_EVT_LBUSLOST       1               /* Local bus loss */
>> +#define FSI_EVT_LBUSRECV       2               /* Local bus gained */
>> +#define FSI_EVT_IRQLOOP                3               /* IRQ loop detected */
>> +#define FSI_EVT_LINKCHG                4               /* Link state change */
>> +#define FSI_EVT_UNPLUG         5               /* Device unplugged */
>>  #define FSI_EVT_PLUG           6               /* Device plugged */
>> +#define FSI_EVT_CFAMADD                7               /* New CFAM found */
>> +#define FSI_EVT_CFAMDELETE     8               /* Removing a CFAM */
>> +#define FSI_EVT_CFAMDEAD       9               /* CFAM no longer functions */
>>  #define FSI_LINK_BUILD         10              /* In build up phase */
>>  #define FSI_LINK_PROBE         11              /* In probing phase */
>> +#define FSI_LINK_RUNNING       12              /* Link up and running */
>> +#define FSI_LINK_DEAD          13              /* Link defective */
>> +#define FSI_LINK_WAITFOR       14              /* Wait for buildup */
>>
>>  /*
>>   * Return the link number where this device is attached
>> @@ -76,6 +88,15 @@ static inline int fsi_mtype_2break_id(u8 mtype)
>>
>>  /*
>>   * Build a mask where bit index 'x' is set (numbering from left to right.
>> + * Bit 0 is MSB and bit 63 is LSM.
>> + */
>> +static inline u64 mask64(int x)
>> +{
>> +       return 1 << (BITS_PER_LONG_LONG - x - 1);
>> +}
>> +
>
> I've seen this function before. Can we share it?
>

As per previous comments in patch v5 0002 you suggested pulling in the
arch/powerpc functions.
Will remove the local definitions of mask64 and mask32


>> +/*
>> + * Build a mask where bit index 'x' is set (numbering from left to right.
>>   * Bit 0 is MSB and bit 31 is LSM.
>>   */
>>  static inline unsigned long mask32(int x)
>> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
>> index c589294..eaa3582 100644
>> --- a/drivers/fsi/fsiinit.c
>> +++ b/drivers/fsi/fsiinit.c
>> @@ -14,8 +14,11 @@
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/kdev_t.h>
>> +#include <linux/io.h>
>> +#include <linux/slab.h>
>>  #include "fsiinit.h"
>>  #include "fsimaster.h"
>> +#include "fsi_private.h"
>>
>>  MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
>>  MODULE_DESCRIPTION("FSI master device driver");
>> diff --git a/drivers/fsi/fsilink.h b/drivers/fsi/fsilink.h
>> new file mode 100644
>> index 0000000..f923650
>> --- /dev/null
>> +++ b/drivers/fsi/fsilink.h
>> @@ -0,0 +1,99 @@
>> +/*
>> + * FSI link structure definitions and defines
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
>> +#ifndef DRIVERS_FSILINK_H
>> +#define DRIVERS_FSILINK_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/kobject.h>
>> +#include <linux/device.h>
>> +#include "fsi.h"
>> +#include "fsi_private.h"
>> +
>> +/*
>> + * Extended FSI error counting and thresholding. Count the FSI errors with
>> + * time they occurred.
>> + */
>> +#define        FSI_MAX_PE      6               /* Max # of FSI port errors */
>> +#define        FSI_MAX_ME      11              /* Max # of FSI master errors */
>> +#define        FSI_MAX_SE      10              /* Max # of FSI slave V3 errors */
>> +#define        FSI_MAX_SEV2    6               /* Max # of FSI slave V2 errors */
>> +
>> +struct fsi_ecnt {                      /* Structure for counting errors */
>> +       unsigned short cnt;             /* Counter */
>> +       struct timeval seen_1st;        /* First occurrence */
> first

Changing

>
>> +       struct timeval seen_last;       /* Last occurrence */
>> +};
>> +
>> +struct fsi_eport {                     /* Port error statistics */
>> +       unsigned short pec[FSI_MAX_PE]; /* Port errors counter per type */
>> +       unsigned short pcrc_cnt;        /* Recovered CRC counter port */
>> +};
>> +
>> +struct fsi_eslv {                      /* Slave error statistics */
>> +       unsigned short sec[FSI_MAX_SE]; /* Slave errors counter per type  */
>> +       unsigned short scrc_cnt;        /* Recovered CRC counter slave */
>> +};
>> +
>> +struct fsi_emaster {                   /* Master error statistics */
>> +       unsigned short mec[FSI_MAX_ME]; /* Master errors counter per type */
>> +       unsigned short mcrc_cnt;        /* Recovered CRC counter master */
>> +};
>
> Could all of these statistics go in the one struct?
>

Do you suggest a new stats struct that contains all of these?

>> +
>> +struct fsi_elink {                     /* Link error statistics */
>> +       struct fsi_emaster master;      /* Master errors */
>> +       struct fsi_eport port;          /* Port errors */
>> +       struct fsi_eslv slv[FSI_MAX_CASCADE];   /* Slave errors */
>> +       struct fsi_ecnt breaked;        /* BREAK command sent */
>> +};
>> +
>> +enum fsilink_state {                   /* Bit mask for error states */
>> +       fsilink_lost = 1,               /* Link already schedule for removal */
>> +       fsilink_up = 2,                 /* Link up & running */
>> +       fsilink_going = 3               /* Link removal in progress */
>> +};
>> +
>> +struct fsilink {                       /* Information per link */
>> +       u8 speedset;                    /* Link speed set (0 or 1) */
>> +       u8 cascade;                     /* Length of cascade */
>> +       u8 top_cfam;                    /* # CFAM found on initial scan */
>> +       u8 linkno;                      /* Number of this link */
>> +       unsigned long state;            /* Bit mask for error states */
>> +       struct fsicfam *cfams[FSI_MAX_CASCADE]; /* CFAMs per link */
>> +       struct fsidevice fsidev;
>> +       u32 id3_addr;                   /* CFAM id3 page */
>> +       struct fsimaster *master;       /* Ptr to controlling fsi master */
>> +       struct fsi_elink error;         /* Errors on this link */
>> +};
>> +
>> +#define FSILINK_ATTR(_name, _mode, _show, _store)      \
>> +struct device_attribute fsilink_attr_##_name = {       \
>> +       .attr = {                                       \
>> +               .name = __stringify(_name),             \
>> +               .mode = _mode,                          \
>> +       },                                              \
>> +       .show   = _show,                                \
>> +       .store  = _store                                \
>> +}
>> +
>> +/*
>> + * Pointer conversion from fsidevice member to fsilink.
>> + */
>> +#define        to_fsilink(x)   container_of((x), struct fsilink, fsidev)
>> +
>> +unsigned char fsilink_get_top_cfam(struct fsilink *);
>> +unsigned char fsilink_get_linkno(struct fsilink *);
>> +unsigned long fsilink_get_state(struct fsilink *);
>> +struct fsicfam *fsilink_get_cfam(struct fsilink *, int);
>> +struct device *fsilink_get_device(struct fsilink *);
>> +
>> +#endif /* DRIVERS_FSILINK_H */
>> diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
>> index 8054051..427231f 100644
>> --- a/drivers/fsi/fsimaster.c
>> +++ b/drivers/fsi/fsimaster.c
>> @@ -17,9 +17,11 @@
>>  #include <linux/io.h>
>>  #include <linux/bitops.h>
>>  #include "fsi.h"
>> +#include "fsi_private.h"
>>  #include "fsiinit.h"
>>  #include "fsimaster.h"
>>  #include "fsicfam.h"
>> +#include "fsislave.h"
>>
>>  static int hpinfo_alloc(struct fsimaster *master)
>>  {
>> @@ -150,6 +152,9 @@ static int fsimaster_init(struct fsimaster *master)
>>         return rc;
>>  }
>>
>> +/*
>> + * Retrieve the first master in the chain
>> + */
>
> The comment should be added when you add the function.
>

Will fix.

>>  struct fsimaster *fsimaster_get_top_master(struct fsimaster *master)
>>  {
>>         struct fsimaster *parent = NULL;
>> @@ -163,10 +168,195 @@ struct fsimaster *fsimaster_get_top_master(struct fsimaster *master)
>>  }
>>
>>  /*
>> + * Get the address space size of a link/CFAM
>> + */
>> +
>> +u32 fsimaster_cfamsz(struct fsimaster *master)
>> +{
>> +       return master->cfam_size;
>> +}
>> +
>> +u32 fsimaster_linksz(struct fsimaster *master)
>> +{
>> +       return FSI_MAX_CASCADE * fsimaster_cfamsz(master);
>> +}
>> +
>> +/*
>> + * Find physical address given master and link #
>> + */
>> +u32 fsimaster_link2pa(struct fsimaster *master, int link)
>> +{
>> +       u32 offset = link * fsimaster_linksz(master);
>> +
>> +       return master->membase + offset;
>> +}
>> +
>> +/*
>> + * Find physical address given master, link # and CFAM #
>> + */
>> +u32 fsimaster_cfam2pa(struct fsimaster *master, int link, int cfam)
>> +{
>> +       u32 offset = link * fsimaster_linksz(master) +
>> +                    cfam * fsimaster_cfamsz(master);
>> +
>> +       return master->membase + offset;
>> +}
>> +
>> +int fsim_pa2irq(struct fsimaster *master, u32 pa)
>> +{
>> +       return 0;
>> +}
>> +
>> +int fsi_pa2irq(u32 pa)
>> +{
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Master control register accessors
>> + */
>> +
>> +/*
>> + * Read/write  mode register: MMODE
>> + */
>> +u32 fsimaster_read_mmode_nl(struct fsimaster *master)
>> +{
>> +       return master->read_reg(master->base, FSI_N_MMODE);
>> +}
>> +
>> +u32 fsimaster_read_mmode(struct fsimaster *master)
>> +{
>> +       return 0;
>> +}
>> +
>> +void fsimaster_write_mmode(struct fsimaster *master, u32 value)
>> +{
>> +}
>> +
>> +/*
>> + * Read/write enable port register: MENP
>> + */
>> +u64 fsimaster_read_menp_nl(struct fsimaster *master)
>> +{
>> +       return 0;
>> +}
>> +
>> +u64 fsimaster_read_menp(struct fsimaster *master)
>> +{
>> +       return 0;
>> +}
>> +
>> +void fsimaster_write_menp(struct fsimaster *master, u64 *menp, int on_off)
>> +{
>> +}
>> +
>> +void fsimaster_disable_link(struct fsimaster *master, int link)
>> +{
>> +}
>> +
>> +void fsimaster_enable_link(struct fsimaster *master, int link)
>> +{
>> +}
>> +
>> +/*
>> + * Send out a BREAK command and see if anything response.  Part of the scan
>> + * process
>> + */
>> +static int ping_cfam(struct fsimaster *master, struct fsi_hotplug *hp,
>> +                    const int count)
>> +{
>> +       int i = 0, rc = -EIO;
>> +       u32 value, pa;
>> +       int id = fsi_mtype_2break_id(master->type);
>> +
>> +       pa = fsimaster_cfam2pa(master, hp->linkno, id);
>> +
>> +       fsimaster_enable_link(master, hp->linkno);
>> +       if (fsi_sendbreak(master, pa, hp->linkno))
>> +               goto out;
>> +
>> +       while (i++ < count) {
>> +               rc = fsi_readw_int(master, pa + FSI_SLAVE0_OFFSET + FSI_SMODE,
>> +                                  &value);
>> +               if (rc == 0)
>> +                       break;
>> +
>> +               udelay(FSI_CFAM_PING_DELAY);
>> +       }
>> +out:
>> +       fsimaster_disable_link(master, hp->linkno);
>> +
>> +       return rc;
>> +}
>> +
>> +/*
>> + * Probe for CFAMs
>> + */
>> +static int probe_link(struct fsimaster *master, struct fsi_hotplug *hp)
>> +{
>> +       int rc = 0;
>> +       struct fsidd *dd = to_fsidd_prim(fsimaster_get_top_master(master));
>> +
>> +       hp->tries++;
>> +       rc = ping_cfam(master, hp, FSI_MAX_CASCADE - 1);
>> +       if (rc == 0) {
>> +               atomic_set(&hp->state, FSI_LINK_BUILD);
>> +               set_bit(FSI_LINK_BUILD, &dd->state);
>> +               set_bit(hp->linkno, &master->hotp.building);
>> +               clear_bit(hp->linkno, &master->hotp.probing);
>> +               rc = 1;
>> +       } else if (hp->tries > FSI_MAX_PING_ATTEMPTS) {
>> +               atomic_set(&hp->state, FSI_EVT_CFAMDEAD);
>> +               clear_bit(hp->linkno, &master->hotp.probing);
>> +       }
>> +
>> +       return rc;
>> +}
>> +
>> +/*
>>   * Work queue function to probe links
>>   */
>>  static void probe_wq(struct work_struct *work)
>>  {
>> +       struct fsimaster *master = to_fsimaster_probe(work);
>> +       struct fsidd *dd = to_fsidd_prim(fsimaster_get_top_master(master));
>> +       int i, cnt = 0;
>> +
>> +       for (i = 0; i < master->maxlinks; ++i) {
>> +               if (test_bit(i, &master->hotp.probing))
>> +                       cnt += probe_link(master, master->hotp.plug[i]);
>> +       }
>> +       if (cnt)
>> +               queue_work(dd->hotp_wq, &master->hotp.buildwork);
>> +}
>> +
>> +/*
>> + * Called from worker in process/task context
>> + */
>> +static int build(struct fsimaster *master, struct fsi_hotplug *hp)
>> +{
>> +       int rc;
>> +
>> +       rc = fsi_linkbuild(master, hp->linkno);
>> +       atomic_set(&hp->state, rc ? FSI_LINK_RUNNING : FSI_LINK_DEAD);
>> +       if (test_and_clear_bit(FSI_LINK_WAITFOR, &hp->wait_state))
>> +               complete_all(&hp->done);
>> +
>> +       return rc;
>> +}
>> +
>> +static int remove(struct fsimaster *master, struct fsi_hotplug *hp)
>> +{
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Actual link build function.  Called in process context.
>> + */
>> +static void build_link(struct fsimaster *master, struct fsi_hotplug *hp)
>> +{
>> +       hp->error_code = (hp->cmd == FSI_EVT_CFAMADD) ? build(master, hp)
>> +                                                    : remove(master, hp);
>>  }
>>
>>  /*
>> @@ -174,6 +364,34 @@ static void probe_wq(struct work_struct *work)
>>   */
>>  static void build_wq(struct work_struct *work)
>>  {
>> +       struct fsimaster *master = to_fsimaster_build(work);
>> +       struct fsidd *dd = to_fsidd_prim(fsimaster_get_top_master(master));
>> +       int i;
>> +
>> +       set_bit(FSI_LINK_BUILD, &dd->state);
>> +again:
>> +       for (i = 0; i < master->maxlinks; ++i) {
>> +               if (test_and_clear_bit(i, &master->hotp.building))
>> +                       build_link(master, master->hotp.plug[i]);
>> +       }
>> +
>> +       /* stub */
>> +
>> +       /*
>> +        * Make sure all bits were cleared before leaving.
>> +        * This worker runs in process context.  While running, an FSI error
>> +        * interrupt can occur and schedule a link for removal.
>> +        * If we are past this new bit in our loop above, the link is not
>> +        * removed.  Iterate on non zero.
>> +        */
>> +       if (master->hotp.building)
>> +               goto again;
>> +
>> +       /*
>> +        * If the same described above happens here, we are toast again.
>> +        * Another perodic check is done on plugmgr()
>> +        */
>> +       clear_bit(FSI_LINK_BUILD, &dd->state);
>>  }
>>
>>  static int fsimaster_reset(struct fsimaster *master)
>> diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
>> index 61e8c8a..0d47dc6 100644
>> --- a/drivers/fsi/fsimaster.h
>> +++ b/drivers/fsi/fsimaster.h
>> @@ -20,6 +20,7 @@
>>  #define FSI_MAX_PING_ATTEMPTS  12
>>  #define        FSI_PLUG_CHECK_TIME     100
>>  #define FSI_DFLT_IPOLL_CHECK   800
>> +#define FSI_CFAM_PING_DELAY    20      /* in microseconds */
>>
>>  /* FSI master register numbers */
>>  #define        FSI_N_MMODE     0       /* 0x0   R/W: mode register */
>> @@ -524,6 +525,7 @@ struct fsi_hotplug {                        /* Hot plug information */
>>         struct completion done;         /* Link build done */
>>         u16 tries;                      /* # of tries before probing */
>>         u8 linkno;                      /* Link # */
>> +       u8 cmd;                         /* State add/delete */
>>         atomic_t state;                 /* State of this entry */
>>         int error_code;                 /* Error code */
>>         unsigned long wait_state;       /* Wait state */
>> @@ -673,4 +675,7 @@ void fsimaster_engput(struct fsidevice *);
>>  void fsi_rst_error2(struct fsimaster *, struct fsidevice *, int, int, int, int);
>>  int port_reset(struct fsimaster *, int);
>>
>> +int fsi_writew_int(struct fsimaster *, u32, u32);
>> +int fsi_readw_int(struct fsimaster *, u32, u32*);
>> +
>>  #endif /* DRIVERS_FSIMASTER_H */
>> diff --git a/drivers/fsi/fsislave.h b/drivers/fsi/fsislave.h
>> new file mode 100644
>> index 0000000..f2095d3
>> --- /dev/null
>> +++ b/drivers/fsi/fsislave.h
>> @@ -0,0 +1,404 @@
>> +/*
>> + * FSI slave structure definitions and defines
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
>> +#ifndef        DRIVERS_FSISLAVE_H
>> +#define        DRIVERS_FSISLAVE_H
>> +
>> +/*
>> + * Define read address for peek engine referring to
>> + * side/series/node-id/frame-id
>> + */
>> +#define FSI_PEEK_IDADDR        0xc
>> +
>> +#define FSI_SLV_CFAM_OFFSET 0x800
>> +
>> +/*
>> + * Defines for address locations of certain register in FSI Slave. All register
>> + * names start with FSI_S for slave register. Some registers have the
>> + * same address but different meanings for read and write access.
>> + */
>> +#define        FSI_SMODE       0x0     /* R/W: Slave mode register */
>> +#define        FSI_SDMA        0x4     /* R/W: DMA control register */
>> +#define        FSI_SISC        0x8     /* Read: read Interrupt condition register */
>> +#define        FSI_SCISC       0x8     /* Write: Clear Interrupt condition register */
>> +#define        FSI_SISM        0xC     /* R/W: Interrupt mask register */
>> +#define        FSI_SISS        0x10    /* Read: Interrupt status register */
>> +#define        FSI_SSISM       0x10    /* Write: Set interrupt mask */
>> +#define        FSI_SSTAT       0x14    /* Read: Read slave status register */
>> +#define        FSI_SCISM       0x14    /* Write: Clear interrupt mask */
>> +#define        FSI_SI1M        0x18    /* R/W: Interrupt 1 mask register */
>> +#define        FSI_SI1S        0x1C    /* Read: Read Interrupt 1 status register */
>> +#define        FSI_SSI1M       0x1C    /* Write: Set Interrupt 1 mask register */
>> +#define        FSI_SIC         0x20    /* Read: Read engine interrupt condition reg */
>> +#define        FSI_SCI1M       0x20    /* Write: Clear Interrupt 1 mask register */
>> +#define        FSI_SI2M        0x24    /* R/W: Interrupt 2 mask register */
>> +#define        FSI_SI2S        0x28    /* Read: Read Interrupt 2 status register */
>> +#define        FSI_SSI2M       0x28    /* Write: Set Interrupt 2 mask register */
>> +#define        FSI_SCMDT       0x2C    /* Read: Command trace register */
>> +#define        FSI_SCI2M       0x2C    /* Write: Clear Interrupt 2 mask register */
>> +#define        FSI_SDATAT      0x30    /* Read: Data trace register */
>> +#define        FSI_SLBUS       0x30    /* Write: local bus address commands */
>> +#define        FSI_SLASTD      0x34    /* Read: Last data send register */
>> +#define        FSI_SRES        0x34    /* Write: Reset command register */
>> +#define        FSI_SMBL        0x38    /* R/W: Mailbox register left port */
>> +#define        FSI_SOML        0x3C    /* Read: Mailbox old data register left port */
>> +#define        FSI_SSMBL       0x3C    /* Write: Set Mailbox bits register left port */
>> +#define        FSI_SNML        0x40    /* Read: Mailbox new data register left port */
>> +#define        FSI_SCMBL       0x40    /* Write: Clear mailbox bits left port */
>> +#define FSI_SMBR       0x44    /* R/W: Mailbox register right port */
>> +#define FSI_SOMR       0x48    /* Read: Mailbox old data register right port */
>> +#define FSI_SSMBR      0x48    /* Write: Set Mailbox bits register right port*/
>> +#define FSI_SNMR       0x4c    /* Read: Mailbox new data register right port */
>> +#define FSI_SCMBR      0x4c    /* Write: Clear mailbox bits right port */
>> +
>> +/* Same as above except Word offsets into the FSI slave engine */
>> +#define FSI_N_SISC     0x2     /* Read: read Interrupt condition register */
>> +#define FSI_N_SSTAT    0x5     /* Read: Slave Status register */
>> +#define FSI_N_SCMDT    0xB     /* Read: Command trace register */
>> +#define FSI_N_SDATAT   0xC     /* Read: Data trace register */
>> +#define FSI_N_SLASTD   0xD     /* Read: Last data send register */
>> +
>> +/* Next registers are only valid for FSI slave version 3 */
>> +#define FSI_SRSIC      0x50    /* Read slave remote slave IRQ condition */
>> +#define FSI_SCRSIC     0x50    /* Write: Clear Slave remote slave IRQ cond */
>> +#define FSI_SRSIM      0x54    /* R/W: Slave remote slave IRQ mask */
>> +#define FSI_SRSIS      0x58    /* Read: Slave remote slave IRQ status */
>> +
>> +/* Next registers are only valid for FSI slave version 4 */
>> +/* cmFSI */
>> +#define FSI_ScRSIC0    0x50    /* Read / Write: to clear cmFSI remote */
>> +/* slave IRQ condition ports 0-3 */
>> +#define FSI_ScRSIC4    0x54    /* Read / Write: to clear cmFSI remote */
>> +/* slave IRQ condition ports 4-7 */
>> +#define FSI_ScRSIM0    0x58    /* R/W: cmFSI remote slave IRQ mask */
>> +/* ports 0-3 */
>> +#define FSI_ScRSIM4    0x5C    /* R/W: cmFSI remote slave IRQ mask */
>> +/* ports 4-7 */
>> +#define FSI_ScRSIS0    0x60    /* Read: cmFSI remote slave IRQ status */
>> +/* ports 0-3 */
>> +#define FSI_ScRSIS4    0x64    /* Read: cMFSI remote slave IRQ status */
>> +/* ports 4-7 */
>> +/* hFSI */
>> +#define FSI_SRSIC0     0x68    /* Read / Write: to clear hFSI remote */
>> +/* slave IRQ condition ports 0-3 */
>> +#define FSI_SRSIC4     0x6C    /* Read / Write: to clear hFSI remote */
>> +/* slave IRQ condition ports 4-7 */
>> +#define FSI_SRSIM0     0x70    /* R/W: hFSI remote slave IRQ mask */
>> +/* ports 0-3 */
>> +#define FSI_SRSIM4     0x74    /* R/W: hFSI remote slave IRQ mask */
>> +/* ports 4-7 */
>> +#define FSI_SRSIS0     0x78    /* Read: hFSI remote slave IRQ status */
>> +/* ports 0-3 */
>> +#define FSI_SRSIS4     0x7C    /* Read: hFSI remote slave IRQ status */
>> +/* ports 4-7 */
>> +
>> +#define FSI_SRSIM_SID3_SHIFT   6
>> +
>> +/* Slave ID 3 on interrupt level 1 for all sub/hub links */
>> +#define SRSIM_ID3_IRPT1_MASK   0x02020202
>> +#define SRSIM_MAGIC            SRSIM_ID3_IRPT1_MASK
>> +
>> +struct fsi_sreg {              /* FSI slave register definition */
>> +       u32 smode;              /* 0x0: Mode register */
>> +       u32 sdma;               /* 0x4: DMA control register */
>> +       u32 sisc;               /* 0x8: Slave interrupt condition register */
>> +       u32 sism;               /* 0xc: Slave interrupt mask register */
>> +       u32 siss;               /* 0x10: Slave interrupt status register */
>> +       u32 sstat;              /* 0x14: Slave status register */
>> +       u32 si1m;               /* 0x18: interrupt 1 mask register */
>> +       u32 si1s;               /* 0x1c: interrupt 1 status register */
>> +       u32 sic;                /* 0x20: engine interrupt condition register */
>> +       u32 si2m;               /* 0x24: interrupt 2 mask register */
>> +       u32 si2s;               /* 0x28: interrupt 2 status register */
>> +       u32 scmdt;              /* 0x2c: read command trace register */
>> +       u32 sdatat;             /* 0x30: read data trace register */
>> +       u32 slastd;             /* 0x34: read last FSI data register */
>> +       u32 smbl;               /* 0x38: mail box to left port register */
>> +       u32 soml;               /* 0x3c: old mail left port register */
>> +       u32 snml;               /* 0x40: new mail left port register */
>> +       u32 smbr;               /* 0x44: mail box to right port register */
>> +       u32 somr;               /* 0x48: old mail right port register */
>> +       u32 snmr;               /* 0x4c: new mail right port register */
>> +       u32 srsic0;             /* 0x50: slave remote slave IRQ cond. 0-3 */
>> +       u32 srsic4;             /* 0x54: slave remote slave IRQ cond. 4-7 */
>> +       u32 srsim0;             /* 0x58: slave remote slave IRQ mask 0-3 */
>> +       u32 srsim4;             /* 0x5C: slave remote slave IRQ mask 4-7 */
>> +       u32 srsis0;             /* 0x60: slave remote slave IRQ stat 0-3 */
>> +       u32 srsis4;             /* 0x64: slave remote slave IRQ stat 4-7 */
>> +};
>> +
>> +/*
>> + * FSI slave mode register
>> + */
>> +#define        FSI_SMODE_WSC           0x80000000      /* Warm start completed */
>> +#define        FSI_SMODE_EAP           0x40000000      /* Enable auxiliary port */
>> +#define        FSI_SMODE_ECRC          0x20000000      /* Enable CRC checking by hw */
>> +#define        FSI_SMODE_SID_SHIFT     24              /* Slave identifier shift */
>> +#define        FSI_SMODE_SID_MASK      3               /* Slave identifier mask */
>> +#define        FSI_SMODE_ED_SHIFT      20              /* Echo delay cycles shift */
>> +#define        FSI_SMODE_ED_MASK       0xf             /* Echo delay cycles mask */
>> +#define        FSI_SMODE_SD_SHIFT      16              /* Send delay cycles shift */
>> +#define        FSI_SMODE_SD_MASK       0xf             /* Send delay cycles mask */
>> +#define        FSI_SMODE_LBCRR_SHIFT   8               /* Local bus clk rate shift */
>> +#define        FSI_SMODE_LBCRR_MASK    0xf             /* Local bus clk rate mask */
>> +#define        FSI_SMODE_BDL_SHIFT     4               /* Briefing data left shift */
>> +#define        FSI_SMODE_BDL_MASK      0xf             /* Briefing data mask */
>> +#define        FSI_SMODE_BDR_SHIFT     0               /* Briefing data right shift */
>> +#define        FSI_SMODE_BDR_MASK      0xf             /* Briefing data mask */
>> +#define        FSI_SMODE_RSV_MASK      0xe3ff0fff      /* Mask for used bit clr rsvd */
>> +
>> +/* FSI slave local bus echo delay */
>> +static inline u32 fsi_smode_echodly(int x)
>> +{
>> +       return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
>> +}
>> +
>> +/* FSI slave local bus send delay */
>> +static inline u32 fsi_smode_senddly(int x)
>> +{
>> +       return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
>> +}
>> +
>> +/* FSI slave local bus clock rate ratio */
>> +static inline int fsi_smode_extlbcrr(u32 x)
>> +{
>> +       return (x >> FSI_SMODE_LBCRR_SHIFT) & FSI_SMODE_LBCRR_MASK;
>> +}
>> +
>> +/* FSI slave local bus clock rate ratio */
>> +static inline u32 fsi_smode_lbcrr(int x)
>> +{
>> +       return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
>> +}
>> +
>> +/* FSI slave identifier setting */
>> +static inline u32 fsi_smode_sid(int x)
>> +{
>> +       return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
>> +}
>> +
>> +/* FSI slave briefing data right port */
>> +static inline u32 fsi_smode_bdr(int x)
>> +{
>> +       return (x & FSI_SMODE_BDR_MASK) << FSI_SMODE_BDR_SHIFT;
>> +}
>> +
>> +static inline int fsi_smode_extbdr(u32 x)
>> +{
>> +       return (x >> FSI_SMODE_BDR_SHIFT) & FSI_SMODE_BDR_MASK;
>> +}
>> +
>> +/* FSI slave briefing data left port */
>> +static inline u32 fsi_smode_bdl(int x)
>> +{
>> +       return (x & FSI_SMODE_BDL_MASK) << FSI_SMODE_BDL_SHIFT;
>> +}
>> +
>> +static inline int fsi_smode_extbdl(u32 x)
>> +{
>> +       return (x >> FSI_SMODE_BDL_SHIFT) & FSI_SMODE_BDL_MASK;
>> +}
>> +
>> +/* FSI slave echo delay */
>> +static inline u32 fsi_smode_ed(int x)
>> +{
>> +       return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
>> +}
>> +
>> +static inline int fsi_smode_exted(u32 x)
>> +{
>> +       return (x >> FSI_SMODE_ED_SHIFT) & FSI_SMODE_ED_MASK;
>> +}
>> +
>> +/* FSI slave send delay */
>> +static inline u32 fsi_smode_sd(int x)
>> +{
>> +       return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
>> +}
>> +
>> +static inline int fsi_smode_extsd(u32 x)
>> +{
>> +       return (x >> FSI_SMODE_SD_SHIFT) & FSI_SMODE_SD_MASK;
>> +}
>> +
>> +/*
>> + * FSI slave interrupt register: interrupt conditions, status and mask
>> + */
>> +#define        FSI_SSI_CRCE            0x80000000      /* FSI CRC error */
>> +#define        FSI_SSI_PROTE           0x40000000      /* FSI protocol error */
>> +#define        FSI_SSI_LBPE            0x20000000      /* FSI local bus parity error */
>> +#define        FSI_SSI_LBPROTE         0x10000000      /* FSI local bus protocol err */
>> +#define        FSI_SSI_LBAE            0x08000000      /* FSI local bus access error */
>> +#define        FSI_SSI_LBOE            0x04000000      /* FSI local bus owner error */
>> +#define        FSI_SSI_LBOC            0x02000000      /* FSI local bus owner change */
>> +#define        FSI_SSI_HPE             0x01000000      /* Hot plug event */
>> +#define        FSI_SSI_MRL             0x00800000      /* Mail received left port */
>> +#define        FSI_SSI_MDL             0x00400000      /* Mail send left port */
>> +#define        FSI_SSI_WSL             0x00200000      /* Warm start flag left port */
>> +#define        FSI_SSI_LBRL            0x00100000      /* Local bus requ left port */
>> +#define        FSI_SSI_MRR             0x00080000      /* Mail received right port */
>> +#define        FSI_SSI_MDR             0x00040000      /* Mail delivered right port */
>> +#define        FSI_SSI_WSR             0x00020000      /* Warm start flag right port */
>> +#define        FSI_SSI_LBRR            0x00010000      /* Local bus req right port */
>> +#define        FSI_SSI_CMEL            0x00008000      /* Clocks monitor event left */
>> +#define        FSI_SSI_CMER            0x00004000      /* Clocks monitor event right */
>> +#define        FSI_SSI_OPB_FNC         0x00001000      /* OPB Fenced (cMFSI & hMFSI) */
>> +#define        FSI_SSI_OBP_PA          0x00000800      /* OPB Parity (cMFSI) */
>> +#define        FSI_SSI_OBP_PR          0x00000400      /* OPB Protocol (cMFSI) */
>> +#define        FSI_SSI_OBP_TO          0x00000200      /* OPB Timeout (cMFSI) */
>> +#define        FSI_SSI_OBP_EA          0x00000100      /* OPB ErrorAck (cMFSI) */
>> +#define        FSI_SSI_OBP_IA          0x00002000      /* OPB Invalid Address (cMFSI)*/
>> +#define        FSI_SSI_CMFSI_AME       0x00000080      /* CMFSI any-master-error */
>> +#define        FSI_SSI_CMFSI_APE       0x00000040      /* CMFSI any-port-error */
>> +#define        FSI_SSI_CMFSI_HPE       0x00000020      /* CMFSI Hot plug event */
>> +#define        FSI_SSI_CMFSI_CRPA      0x00000010      /* CMFSI Contr reg parity err */
>> +#define        FSI_SSI_ANY_IRQ         0xffffc000      /* Valid bits */
>> +#define        FSI_SSI_ANY_IRQ3        (FSI_SSI_CMFSI_AME | FSI_SSI_CMFSI_APE \
>> +                               | FSI_SSI_CMFSI_HPE | FSI_SSI_CMFSI_CRPA)
>> +                                               /* Valid bits (cMFSI) */
>> +#define        FSI_SSI_ANY_ERROR       0xfc000000      /* Valid error bits */
>> +#define        FSI_SSI_ANY_ERROR3      (FSI_SSI_OBP_PA \
>> +                               | FSI_SSI_OBP_PR | FSI_SSI_OBP_TO \
>> +                               | FSI_SSI_OBP_EA | FSI_SSI_OBP_IA)
>> +                                               /* Valid error bits (cMFSI) */
>> +#define        FSI_SSI_ERR_MASK        0x3f            /* Any error bits mask */
>> +#define        FSI_SSI_ERR_SHFT        26              /* Any error bits shift */
>> +#define        FSI_SISC_CRCE           0               /* Slave CRC error bit */
>> +#define        FSI_SISC_PE             1               /* Slave protocol error bit */
>> +#define        FSI_SISC_LBPE           2               /* Slave lcl bus parity err */
>> +#define        FSI_SISC_LBPROTOE       3               /* Slave lcl bus prot err */
>> +#define        FSI_SISC_LBAE           4               /* Slave access error bit */
>> +#define        FSI_SISC_LBOE           5               /* Slave lcl bus owner err */
>> +#define        FSI_SISC_OPBPA          20              /* Slave OPB parity error */
>> +#define        FSI_SISC_OPBPR          21              /* Slave OPB protocol error */
>> +#define        FSI_SISC_OPBTO          22              /* Slave OPB timeout error */
>> +#define        FSI_SISC_OPBEA          23              /* Slave OPB ack error */
>> +#define        FSI_SISC_CM_ERRS        0x000000f0      /* CMP8 sourced errors */
>> +#define        FSI_SISC_HM_ERRS        0x0000000f      /* HMP8 sourced errors */
>> +
>> +/* FSI slave error interrupt */
>> +static inline int fsi_sisc_iserror(u32 x)
>> +{
>> +       return x & (FSI_SSI_ANY_ERROR3 | FSI_SSI_ANY_ERROR);
>> +}
>> +
>> +/*
>> + * FSI slave interrupt mask register: interrupt conditions, status and mask
>> + */
>> +#define        FSI_SSI_ENG0            0x80000000      /* FSI slave */
>> +#define        FSI_SSI_ENG_MBX         0x400           /* FSI IOU Mailbox */
>> +#define        FSI_SSI_ENG_ANY         0x7fffffff      /* FSI engine 1..31 */
>> +#define        FSI_SSI_ENG_NOLBUS      (FSI_SSI_ENG0 | FSI_SSI_ENG_MBX)
>> +                                               /* Engines without local bus */
>> +/*
>> + * FSI slave status register SSTAT
>> + */
>> +#define        FSI_SSTAT_AE            0x80000000      /* Any error bit */
>> +#define        FSI_SSTAT_IDD           0x40000000      /* CFAM ID dirty at PON lvl) */
>> +#define        FSI_SSTAT_LSW           0x40000000      /* Left side warm start flag */
>> +#define        FSI_SSTAT_RSW           0x10000000      /* Rt side warm start flag */
>> +#define        FSI_SSTAT_MDL           0x08000000      /* Mail delivered left side */
>> +#define        FSI_SSTAT_MDR           0x04000000      /* Mail delivered right side */
>> +#define        FSI_SSTAT_MRL           0x02000000      /* Mail received left side */
>> +#define        FSI_SSTAT_MRR           0x01000000      /* Mail received right side */
>> +#define        FSI_SSTAT_BDL_SHIFT     20              /* Brief data left side shft */
>> +#define        FSI_SSTAT_BDL_MASK      0xf             /* Brief data left side mask */
>> +#define        FSI_SSTAT_BDR_SHIFT     16              /* Brief data rt side shift */
>> +#define        FSI_SSTAT_BDR_MASK      0xf             /* Brief data rt side mask */
>> +#define        FSI_SSTAT_LSLBR         0x8000          /* Left side local bus req */
>> +#define        FSI_SSTAT_RSLBR         0x4000          /* Right side local bus req */
>> +#define        FSI_SSTAT_TSLBR         0x2000          /* This side local bus req */
>> +#define        FSI_SSTAT_BLBA          0x1000          /* Block C-side lcl bus acc */
>> +#define        FSI_SSTAT_LBO_SHIFT     10              /* Local bus owner shift */
>> +#define        FSI_SSTAT_LBO_MASK      3               /* Local bus owner mask */
>> +#define        FSI_SSTAT_TSF_SHIFT     8               /* This side A=01 B=10 C=11 */
>> +#define        FSI_SSTAT_TSF_MASK      3               /* This side flag mask */
>> +#define        FSI_SSTAT_CAL           0x00000080      /* Clocks active left port */
>> +#define        FSI_SSTAT_CAR           0x00000040      /* Clocks active right port */
>> +#define        FSI_SSTAT_APIL          0x00000020      /* Aux port input level */
>> +#define        FSI_SSTAT_APRL          0x00000010      /* Aux port reference level */
>> +#define        FSI_SSTAT_CRC_SHIFT     0               /* CRC error counter */
>> +#define        FSI_SSTAT_CRC_MASK      0xf             /* CRC mask */
>> +#define        FSI_SSTAT_SIDE_NONE     0               /* Unknown Side */
>> +#define        FSI_SSTAT_SIDE_A        1               /* A-Side */
>> +#define        FSI_SSTAT_SIDE_B        2               /* B-Side */
>> +#define        FSI_SSTAT_SIDE_C        3               /* C-Side */
>> +
>> +/* FSI status local bus request */
>> +static inline int fsi_sstat_tsf(u32 x)
>> +{
>> +       return (x >> FSI_SSTAT_TSF_SHIFT) & FSI_SSTAT_TSF_MASK;
>> +}
>> +
>> +/* FSI status get local bus owner */
>> +static inline int fsi_sstat_lbo(u32 x)
>> +{
>> +       return (x >> FSI_SSTAT_LBO_SHIFT) & FSI_SSTAT_LBO_MASK;
>> +}
>> +
>> +/* FSI status get right side briefing data */
>> +static inline int fsi_sstat_bdr(u32 x)
>> +{
>> +       return (x >> FSI_SSTAT_BDR_SHIFT) & FSI_SSTAT_BDR_MASK;
>> +}
>> +
>> +/* FSI status get left side briefing data */
>> +static inline int fsi_sstat_bdl(u32 x)
>> +{
>> +       return (x >> FSI_SSTAT_BDL_SHIFT) & FSI_SSTAT_BDL_MASK;
>> +}
>> +
>> +/* FSI status get CRC counter */
>> +static inline int fsi_sstat_crc(u32 x)
>> +{
>> +       return (x >> FSI_SSTAT_CRC_SHIFT) & FSI_SSTAT_CRC_MASK;
>> +}
>> +
>> +/*
>> + * FSI slave local bus access register SLBUS
>> + */
>> +#define        FSI_SLBUS_FLBO          0x80000000      /* Force local bus ownership */
>> +#define        FSI_SLBUS_RLBA          0x40000000      /* Request local bus access */
>> +#define        FSI_SLBUS_RLBO_SHIFT    28              /* Release local bus shift */
>> +#define        FSI_SLBUS_RLBO_MASK     3               /* Release local bus mask */
>> +#define        FSI_SLBUS_RLBR          0x08000000      /* Reset local bus req */
>> +#define        FSI_SLBUS_BLBA_SHIFT    16              /* Block local bus acc shift */
>> +#define        FSI_SLBUS_BLBA_MASK     0xff            /* Block local bus acc mask */
>> +#define        FSI_SLBUS_BLBA          0xff            /* Block local bus acc */
>> +#define        FSI_SLBUS_UBLBA         0xec            /* Unblock local bus access */
>> +#define        FSI_SLBUS_RESERVE_MASK  0xf8ff0000      /* Mask off reserved bits */
>> +
>> +/* Release local bus */
>> +static inline u32 fsi_slbus_rlbo(int side)
>> +{
>> +       return (side & FSI_SLBUS_RLBO_MASK) << FSI_SLBUS_RLBO_SHIFT;
>> +}
>> +
>> +/* Block local bus access */
>> +static inline u32 fsi_slbus_blba(int side)
>> +{
>> +       return (side & FSI_SLBUS_BLBA_MASK) << FSI_SLBUS_BLBA_SHIFT;
>> +}
>> +
>> +/* FSI Slave Error Reset Register SRES */
>> +#define        FSI_SRES_RFS            0x80000000      /* Reset FSI slave */
>> +#define        FSI_SRES_REFS           0x40000000      /* Reset Errors FSI slave */
>> +#define        FSI_SRES_RLBE           0x20000000      /* Reset Local bus engs slave */
>> +#define        FSI_SRES_RESERVE_MASK   0x1fffffff      /* Mask off reserved bits */
>> +
>> +int slave_readreg(struct fsimaster *, void *, u32 *, u32);
>> +int slave_writereg(struct fsimaster *, void *, u32, u32);
>> +int slave_irqclear(struct fsimaster *, void *, u32, u32);
>> +int p8_cfam_fixup(struct fsicfam *, int);
>> +u32 xmp8_srsim_mask(int);
>> +
>> +#endif /* DRIVERS_FSISLAVE_H */
>> diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
>> new file mode 100644
>> index 0000000..4a2f90b
>> --- /dev/null
>> +++ b/drivers/fsi/ldm.c
>> @@ -0,0 +1,29 @@
>> +/*
>> + * FSI interface to the LDM
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
>> +#include "fsi.h"
>> +#include "fsi_private.h"
>> +
>> +/*
>> + * Register a FSI device with the Linux device model
>> + */
>> +int fsidev_register_nolock(struct fsidevice *fsidev,
>> +                          struct device_attribute **ap)
>> +{
>> +       return 0;
>> +}
>> +
>> +int fsidev_register(struct fsidevice *fsidev, struct device_attribute **ap)
>> +{
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(fsidev_register);
>> diff --git a/drivers/fsi/readwrite.c b/drivers/fsi/readwrite.c
>> new file mode 100644
>> index 0000000..33d972c
>> --- /dev/null
>> +++ b/drivers/fsi/readwrite.c
>> @@ -0,0 +1,34 @@
>> +/*
>> + * FSI I/O accesses
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
>> +#include "fsi.h"
>> +#include "fsi_private.h"
>> +#include "fsimaster.h"
>> +
>> +int fsi_readw_int(struct fsimaster *master, u32 pa, u32 *value)
>> +{
>> +       return 0;
>> +}
>> +
>> +int fsi_writew_int(struct fsimaster *master, u32 pa, u32 value)
>> +{
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Send out a BREAK command on a given link - Resets the logic of any slaves
>> + * present
>> + */
>> +int fsi_sendbreak(struct fsimaster *master, u32 cfam_base, int linkno)
>> +{
>> +       return 0;
>> +}
>> --
>> 1.8.2.2
>>
