Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4KTd6ZN9zDqQn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 03:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=qF6jtdVm; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id a135so2819262oii.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ecjDc9BNEbaqi5nojHxw+gCPKgySUwY+wbDDIX0xrTs=;
 b=qF6jtdVmF7JsvKngyZ5E4rTrBWN2awAmrgPB9zR5QYqYAhMWok/l6neK30gAJ8Bwej
 59gcZ+eWXLSgtM5zOJf287sl/NmXAEZlpaAQlA8pAlRSIE0thCgXQGwNHdlF5JLmUAEM
 dNHn24dNaB0YgGOW0FFg9gnZh5eVWgC3gilgY5Ru/e3F1O+y2RT6+pMDedZq9L3bUska
 UovtxVjSxemE5RECSoQnDybksEWCwBACPTI8YaA++X+P2koTzpPnh70Tu33DllgJ4b1K
 +zg+psptz0xHStJMaRPnfkOedFedomP8wHDrjSmUubmJz6nSzktfecTDukyctcSTYqXE
 MlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ecjDc9BNEbaqi5nojHxw+gCPKgySUwY+wbDDIX0xrTs=;
 b=gm9XMzD6NI+O2qyVUEpSwKXvRjRYX+OlhIIJXtEUgCkNn/sGMe2WrOZ0MFjZy9+VTB
 UyAlVRl/r2sTrXNdubDU3nkVqd6DvAYEP3BKZOGAFvXLZIGUhGSJoutTdH8+N814qiuO
 colCBNEkT5WaAuOTbunNWvIYl6qYcSuY5Nsh0ASNCtqX5tWLhAkW1vQIGv7K6tfkm8B3
 8DZQ5ejbXksg3VOheg88vuyeH6nmrx5f5U1j3ITSXM7QNEoYbrzXWncGfJEb0/1sIcTv
 0Qnwdg5eKEFNpk0+Jk2RH+GVr0SPP6vqhZG8R4MTkon/MdE9KUIsAEEqDnmnFVHiulv3
 3/qg==
X-Gm-Message-State: AEkoouuuGVYjPMpnWJcvXjI0W4tyB0GL/h9WN7EZ19GJw92Zm77WoqfHwcG4iggiwOW73qcVji0vkKibYrHp8Q==
X-Received: by 10.157.1.163 with SMTP id e32mr15253308ote.167.1470244547250;
 Wed, 03 Aug 2016 10:15:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.196.198 with HTTP; Wed, 3 Aug 2016 10:15:46 -0700 (PDT)
In-Reply-To: <CACPK8XcejiEOpOyS4sxsYZwsLf=9XKm3sS6nf0g6=hj7A=WMzg@mail.gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-2-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcejiEOpOyS4sxsYZwsLf=9XKm3sS6nf0g6=hj7A=WMzg@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 3 Aug 2016 12:15:46 -0500
Message-ID: <CAA0LjjVPCaG4x_=HvSaK-t7+iaN==0M+7DUnAEjxmj5eUg+Qew@mail.gmail.com>
Subject: Re: [PATCH linux 2/4] drivers/fsi: FSI master initialization
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 17:15:50 -0000

Hi Joel,

Thanks for your comments.   To answer some of your questions:


>>  MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
>>  MODULE_DESCRIPTION("FSI master device driver");
>> @@ -23,9 +25,13 @@ MODULE_DESCRIPTION("FSI master device driver");
>>  #define        FSIDD_VERNO     4000
>>  #define        FSIDD_VER(x)    FSIDD_TOSTR(x)
>>
>> +struct primaster prim;
>
> Why are we statically allocating this? What happens if my system has
> two fsi masters in it?
>

FSI hardware, as it exists presently, does not allow for more than one
master on a given bus.   There must be a first master in the chain to
initiate communications, here its called 'primary' master.   There can
be other masters downstream but that function is not planned for
addition to the core function.  That's an extended capability.

>> +EXPORT_SYMBOL(prim);
>
> Why are you exporting this?
>

The primary master is a useful entry point to the FSI device tree and
will be referenced by various source files within drivers/fsi.  Its
not intended to be accessed by any client drivers outside of
drivers/fsi

>> +/*
>> + * Read/write functions to access primary FSI master registers
>> + */
>> +static int local_readreg(volatile u32 *base, int regnm, u32 *value)
>
>
> Finally, why does this function exist? I suggest you use a generic
> function such as readl/writel.
>

For OpenFSI at the start there is no master hardware logic - we won't
have that until ast2600 is released.  This is intended for access to a
virtual FSI master which is just a data structure that represents all
the registers in the hardware.   Any code accessing it then doesn't
need to know if its running on real or virtual hardware.   Various
registers within the FSI master have rules on how you can write to
them:  Full write, write under mask (IS_SU_REG below)  , clear under
mask (IS_CU_REG) below.


>> +}
>> +
>> +static int local_writereg(volatile u32 *base, int regnm, u32 value)
>> +{
>> +       u32 new_value = value, r_value;
>> +
>> +       if (regnm == FSI_N_MRESB0)
>> +               new_value = 0;
>> +       else if (FSI_N_IS_CU_REG(regnm)) {
>> +               local_readreg(base, regnm, &r_value);
>> +               new_value = r_value &= ~value;
>> +       } else if (FSI_N_IS_SU_REG(regnm)) {
>> +               local_readreg(base, regnm, &r_value);
>> +               new_value = r_value |= value;
>> +       }
>> +       *(base + regnm) = new_value;
>> +       wmb();
>
>> +/* FSI master register numbers */
>> +#define        FSI_N_MMODE     0       /* 0x0   R/W: mode register */
>> +#define        FSI_N_MDLYR     1       /* 0x4   R/W: delay register */
>> +#define        FSI_N_MCRSP0    2       /* 0x8   R/W: clock rate selector register 0 */
>> +#define        FSI_N_MCRSP32   3       /* 0xC   R/W: clock rate selector register 1 */
>> +#define        FSI_N_MENP0     4       /* 0x10  R/W: enable clock register 0 */
>> +#define        FSI_N_MENP32    5       /* 0x14  R/W: enable clock register 1 */
>> +#define        FSI_N_MLEVP0    6       /* 0x18  R: static level register 0 */
>> +#define        FSI_N_MLEVP32   7       /* 0x1C  R: static level register 1 */
>> +#define        FSI_N_MSENP0    6       /* 0x18  S: set enable clock register 0 */
>> +#define        FSI_N_MREFP0    8       /* 0x20  R: link reference register 0 */
>> +#define        FSI_N_MCENP0    8       /* 0x20  W: clear enable port register 0 */
>
> These duplicated names are confusing. Could we use the one definition
> for the register?
>

Not sure I understand what you mean by duplicated names.  Each offset
can have a different
register name and function depending on if  you're reading it or
writing it.  For example,
the FSI bridge register MESRB allows you to read the bridge state but
when you write this
performs a bridge reset function (MRESB) These mnemonics are taken
verbatim from the
hardware spec.

>> +#define        FSI_N_MHPMP0    10      /* 0x28  R: hot plug reference register 0 */
>> +#define        FSI_N_MCHPMP0   10      /* 0x28  W: clear hot plug reference reg 0 */
>> +#define        FSI_N_MSIEP0    12      /* 0x30  R/W: Ipoll register 0 */
>> +#define        FSI_N_MSIEP32   16      /* 0x40  R/W: Ipoll register 4 */
>> +#define        FSI_N_MAESP0    20      /* 0x50  R: any error port register 0 */
>> +#define        FSI_N_MAESP32   24      /* 0x60  R: any error port register 4 */
>> +#define        FSI_N_MSSIEP0   20      /* 0x50  W: set Ipoll register 0 */
>
>
> At this point hte registers stop going up by 4. I assume those above
> are memory mapped, and those below are something different?
>

Everything defined with FSI_N_... is memory mapped.  Just turned out
that hardware placed these
registers at odd memory offsets.


>> +#define        FSI_N_MAEB      28      /* 0x70  R: any error bridge */
>> +#define        FSI_N_MVER      29      /* 0x74  R: version register */
>> +#define        FSI_N_MBSYP0    30      /* 0x78  R: port busy register 0 */
>> +#define        FSI_N_MCSIEP0   28      /* 0x70  W: clear Ipoll register 0 */
>> +#define        FSI_N_MDRSB1    36      /* 0x90  R/W: DMA select register master 1 */
>> +#define        FSI_N_MSTAP0    52      /* 0xd0  R: port status reg 0-63 (0xd0-0x1cc) */
>> +#define        FSI_N_MRESP0    52      /* 0xd0  W: port reset regr 0-63 (0xd0-0x1cc) */
>> +#define        FSI_N_MESRB0    116     /* 0x1d0 R: error syndrome register 0-16 */
>> +#define        FSI_N_MRESB0    116     /* 0x1d0 W: reset reg master 0-16 (x1d0-x210) */
>> +#define        FSI_N_MSCSB0    117     /* 0x1d4 R: master sub cmd stack register 0 */
>> +#define        FSI_N_MATRB0    118     /* 0x1d8 R: master address trace register 0 */
>> +#define        FSI_N_MDTRB0    119     /* 0x1dc R: master data trace register 0 */
>> +#define        FSI_N_MECTRL    184     /* 0x2e0 R/W: error control register master 0 */
>> +#define        FSI_N_MAESP_SZ  8       /* # of error port register 0-7 */
>> +
>> +#define FSI_MSIEP_REG_COUNT    8
>> +#define PRI_MAX_LINKS          FSI_MAX_LINKS
>
> What is PRI?
>

PRI stands for primary master, the first master in the chain.

>
>> +       unsigned char myid;             /* FSI master identifier for traces */
>> +       unsigned char type;             /* Type FSI master */
>> +       unsigned char hw_version;       /* FSI master hardware version */
>> +       unsigned char maxlinks;         /* FSI master links */
>> +       struct fsilink *link[FSI_MAX_LINKS];
>> +       int (*write_f)(volatile u32 *, int, u32);       /* Write function */
>> +       int (*read_f)(volatile u32 *, int, u32 *);      /* Read function */
>> +       int (*write_f2)(volatile u32 *, int, u32 *);    /* Write function */
>> +       int (*read_f2)(volatile u32 *, int, u32 *);     /* Read function */
>> +       int (*read_f4)(volatile u32 *, int, u32 *);     /* Read function */
>> +       int (*write_f8)(volatile u32 *, int, u32 *);    /* Write function */
>
> Will these be used outside of drivers/fsi/fsimaster.c? If not, I think
> we could call the functions directly instead of through pointers.
>

These are function pointers because depending on master type each of
these functions
will have different behavior.   Right how with core function there is
only the primary FSI
master but later on there will be different types such as hub masters.
  The construct is
to identify master type on discovery and then initialize these
pointers with the appropriate
function.  This type of initialization with function pointers is done
for various devices
throughout the driver.
