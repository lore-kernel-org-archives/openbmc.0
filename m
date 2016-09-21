Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfXV01v23zDshZ
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 07:15:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BIelSapd; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i193so4775682oib.3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5vLXv/gljH2Sc2bRwk4cQhVMw2+c7R4dBCV5Y7eKcDc=;
 b=BIelSapdiIC4LYvkzAzTQH9T5ctFS8eIz7Ph9n/Ds0IbzpcMTYll6WueAqhmpGQrIy
 quspi1Xpm1T9AgHsdXyz1RAp554sx7s9Yottq0W3OhQlTiUQnSA9xTXM4Sy49FiN5TaQ
 2WM7Ms602VviS1eUrwEOzxjZS365Ipk/5zh9WR0rUsLXvcqD4qKvKEvQm/7qMxBOsVfW
 q6m0VsTjWnoJ81k4faRvLUIU3eDNh+5ACuwKn+ZaXHT7Kbhkx+WrYoXnWnYeAfIJnDgK
 Uzvxj60tKN72XC5BAsA6CVfvW2DFjRYzZx03bGAlKiA7fbqiSXCKwgAmuI5rZq81FxRt
 NIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5vLXv/gljH2Sc2bRwk4cQhVMw2+c7R4dBCV5Y7eKcDc=;
 b=P7eOlMSZjE4Fzy/9MSZNYY1PBpXwEklNU48P8whv5lBRdHJP0KCu3b7Zs/Bp+zUs/Q
 DtvfHR1G+OUF65GLjEfH5G09QcbbvJTbCSDTu4sGecklHhUDwI7zI7uHjqJH2k+Y0E0C
 DCfz9UxPVxFa6rLAv0L4qtf9HnqHLsquwTIPIYNWAy3eJebJoIxgw2/q1EUWnG/Ukduy
 g8hEAMUGhStoAR7aVZxioiZ06stX3aL7D34C2Y2W5sF4A8DKpcz6WwEW2uF0t4As3G3D
 F1xd7aSKoZ8zKaonkQlCEAKrsvagZxLPBniCispHqKAQcMNoGpJN1tawEycMhDxBvoCz
 d1jA==
X-Gm-Message-State: AE9vXwNLaF7av2fRdJ05wmRz9xNAYGSEbseH/DnLuXxnS+3ky+DDV4EWz+KTLKRPTjVJeg+13SF3+CeuriRbog==
X-Received: by 10.202.75.151 with SMTP id y145mr47031665oia.74.1474492550425; 
 Wed, 21 Sep 2016 14:15:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 14:15:49 -0700 (PDT)
In-Reply-To: <CACPK8XcdH6qUq9A+fBCKLYAfcE-iEiA-tJV3N6nxJM=KEtqcoA@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1472068452-32048-3-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcdH6qUq9A+fBCKLYAfcE-iEiA-tJV3N6nxJM=KEtqcoA@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 16:15:49 -0500
Message-ID: <CAA0LjjU=yP74_8CeHDw5t1uvp5+WjCLAT3CM8H4ffqQSDvebNg@mail.gmail.com>
Subject: Re: [PATCH linux v5 2/7] drivers/fsi: Add FSI Master Functionality
 and Initialization
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>, zahrens@us.ibm.com
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
X-List-Received-Date: Wed, 21 Sep 2016 21:15:53 -0000

>> +++ b/drivers/fsi/fsi.h
>> @@ -0,0 +1,32 @@
>> +/*
>> + * FSI device driver structure definitions and defines
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
>> +#ifndef DRIVERS_FSI_H
>> +#define DRIVERS_FSI_H
>> +
>> +#include <linux/device.h>
>> +
>> +struct fsimap {
>> +       u8 link;                        /* Master link # */
>> +       u8 cfam;                        /* CFAM # on link */
>> +       u32 offset;                     /* Address offset into CFAM */
>> +       u32 va;                         /* Virtual address */
>> +};
>> +
>> +struct fsidevice {
>> +       u32 irq_start;                  /* IRQ Number */
>> +       struct fsidevice *parent;       /* Parent of this device */
>> +       struct device dev;              /* LDM entry for bus */
>> +       struct fsimap map;              /* Address & location info */
>> +};
>> +
>> +#endif /* DRIVERS_FSI_H */
>> diff --git a/drivers/fsi/fsi_private.h b/drivers/fsi/fsi_private.h
>> new file mode 100644
>> index 0000000..be327ef
>> --- /dev/null
>> +++ b/drivers/fsi/fsi_private.h
>> @@ -0,0 +1,97 @@
>> +/*
>> + * FSI device driver structure definitions and defines
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
>> +#ifndef DRIVERS_FSI_PRIVATE_H
>> +#define DRIVERS_FSI_PRIVATE_H
>> +
>> +#include "fsi.h"
>> +
>> +#define FSIDD_NAME             "fsi"           /* FSI device driver name */
>> +
>> +/*
>> + * Universal FSI constants - Applicable for any FSI device
>> + */
>> +#define        FSI_MAX_LINKS           64              /* FSI Master # of links */
>> +#define        FSI_MAX_CASCADE         4               /* # of CFAMS in cascade */
>> +#define        FSI_MAX_MASTERS         1               /* # of masters in system */
>> +#define        FSI_LINK_ENG_MASK       0xE0007FFF      /* Used for minor num calcs */
>> +#define        FSI_MAX_DEPTH           3               /* Max # of links in path */
>> +#define        FSI_LINK_SHIFT          23                      /* Bits to shift */
>> +#define        FSI_LINK_SIZE           (1 << FSI_LINK_SHIFT)   /* 8 MB */
>> +#define        FSI_CFAM_SHIFT          21                      /* Bits to shift */
>> +#define        FSI_CFAM_SIZE           (1 << FSI_CFAM_SHIFT)   /* 2 MB */
>> +#define        FSI_ENGINE_SHIFT        10                      /* Bits to shift */
>> +#define        FSI_ENGINE_SIZE         (1 << FSI_ENGINE_SHIFT) /* 1 KB */
>> +#define        FSI_LINK_MASK           0x1f800000              /* Bits for link */
>> +#define        FSI_CFAM_MASK           0x00600000              /* Bits for cfam */
>> +#define        FSI_ENGINE_MASK         0x000ffc00              /* Bits for engine */
>> +#define        FSI_PEEK_OFFSET         FSI_ENGINE_SIZE
>> +#define        FSI_SLAVE0_OFFSET       (2 * FSI_ENGINE_SIZE)
>> +#define        FSI_SLV_NO_ERROR        100             /* Slave has no error data */
>> +#define        FSI_BREAK               0xc0de0000      /* BREAK command */
>> +#define        FSI_TERM                0xecc00000      /* TERM command */
>> +#define        FSI_BREAK_TIME          180             /* # Seconds to allow BREAKs */
>> +#define        FSI_BREAK_CNT           3               /* limit for BREAK attempts */
>> +#define        FSI_PRIM                0               /* Generic Primary FSI master */
>> +#define        FSI_MBIT_MASK           0x3             /* FSI master  bits in pa */
>> +#define        FSI_ENG_MASK            0x00007FFF      /* The engine mask in MATRB */
>> +/* FSI Events */
>> +#define FSI_EVT_PLUG           6               /* Device plugged */
>> +#define FSI_LINK_BUILD         10              /* In build up phase */
>> +#define FSI_LINK_PROBE         11              /* In probing phase */
>> +
>> +/*
>> + * Return the link number where this device is attached
>> + */
>> +static inline int fsi_my_link(struct fsidevice *fdev)
>> +{
>> +       return fdev->map.link;
>> +}
>> +
>> +/*
>> + * Return CFAM number on link where this device is attached
>> + */
>> +static inline int fsi_my_cfam(struct fsidevice *fdev)
>> +{
>> +       return fdev->map.cfam;
>> +}
>> +
>> +/*
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
>

Creating a macro for container_of( ) ops seems to be common practice
for include/linux/ headers.   I do plan on moving this to
include/linux in the next patch set in any case.
