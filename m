Return-Path: <maxims@google.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCL5h0Qx1zDvVx
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 05:08:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HEaKHql1"; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id d59so21787770ybi.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ckW5Gn6PfGtuM9L4L76ZfT/+LZdQkcldoqFAZmzLe0E=;
 b=HEaKHql1XR1Ua1bc7hYiIrJiCFjWqjrT/uRvYXSOdAZHP/olEEKIhGtliJvYjUXCD7
 P5p9wCK9jRIFZ67mfVG7v4RzhSrFERvZl0m7cc7J/5vZdV6C1Dn+uHLUJqJdpuZgDw17
 Ka4m+nzAwnEzI2DDCK3T2PBUESWY3tS+obGAt8/KvbBrMJETmkU+WZjalfdkkxha/PKK
 A6NYM+npd9GRje/fSwAN/1bKGIcYNVgQezdb90IxHQANNQ/PolKj8Ga68abSivrYN3t6
 8NByBXCDwJUoQaNoPJE/L0LfgReTXNPjMiXOgxLZtNSk1kBc7t+VjoZ5UWZ8bd1sYbof
 tgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ckW5Gn6PfGtuM9L4L76ZfT/+LZdQkcldoqFAZmzLe0E=;
 b=bGnGDcDhQZdirERw+8wL2FJ7R4+x+Mwg1tDpJfq55hXvOVLubobDZ0CE8jIGFeVbq8
 BmX7M6PEE0UxSKwTC2RRCMNG+2pv1WiWOn+vEPncRceQqnxi0uDl/TsP3Cfbz6lDKQwX
 ytAATNQk5KWAwIl9Iji3XhZkhD6rWIueXlVViodQ25p39AjsQpqWje5w7ZNHdMYizPfq
 FD8U28NKMqEumIUWUdfvHs8l1NLKUSvwRwnFfoILbF6LJvlh5IHKFkvPe3b8SN2BnFTy
 S7IxEQRWJx+lBhV81nP+g7Ohfetlabw7OhuixqxlYFfNXKxYdX6XgJLRnz6wbUAWuPvs
 bIvg==
X-Gm-Message-State: ABUngvfILg5Q47l4wEjv6VU1nVF0skdfQi7Y2zDWOw0xD/oGuR5xkJvLCOJ1vZhpMOefwZ0fXuGh657N46zUusCO
X-Received: by 10.37.230.201 with SMTP id d192mr7456980ybh.84.1478542084885;
 Mon, 07 Nov 2016 10:08:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.192.14 with HTTP; Mon, 7 Nov 2016 10:08:03 -0800 (PST)
In-Reply-To: <410725c0-c6da-6d7c-9dc7-b5dfe044e4c7@kaod.org>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
 <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
 <CAFR_W8q+A+V3RyUGO-cNqqYLnzOA_jJaj-eMiYFbtJcN5uN=Dg@mail.gmail.com>
 <410725c0-c6da-6d7c-9dc7-b5dfe044e4c7@kaod.org>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 7 Nov 2016 10:08:03 -0800
Message-ID: <CAFR_W8r3J6oc88jujBOFWNGWt0kAb32-5N97gX=qibe+jag0sw@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 07 Nov 2016 18:08:09 -0000

On Sun, Nov 6, 2016 at 9:18 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> > OK, so I actually tried this and it works! I did it on my branch
> > so that I can just quickly give it a try and don't really have time
> > to prepare proper patch today (this being Friday and all), but this
> > is the summary of required changes: (the patch is also attached,
> >  just in case, but you won't be able to apply it)
>
> nice one :)
>
> but do we need any of this if we are to remove lowlevel_init ?


The most important part is setting up the stack, which is basically
configuration of CONFIG_SYS_INIT_RAM_* and CONFIG_SYS_INIT_SP_*
This part is needed for the code that is going to end up being called
from board_init_f function, which includes dram_init and early serial
console init.

>
>
> > --- a/include/configs/ast-common.h
> > +++ b/include/configs/ast-common.h
> > @@ -33,10 +33,10 @@
> >  #define CONFIG_SYS_DCACHE_OFF1
> >
> > // Config changes -- this is the most important part. U-Boot will use t=
hese to setup stack and heap for us.
> >
> >  #define CONFIG_SYS_SDRAM_BASEAST_DRAM_BASE
> > -#define CONFIG_SYS_INIT_RAM_ADDRCONFIG_SYS_SDRAM_BASE
> > -#define CONFIG_SYS_INIT_RAM_SIZE(32*1024)
> > +#define CONFIG_SYS_INIT_RAM_ADDR(AST_SRAM_BASE)
> > +#define CONFIG_SYS_INIT_RAM_SIZE(36*1024)
> >  #define CONFIG_SYS_INIT_RAM_END(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_=
INIT_RAM_SIZE)
> > -#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END - GENERATED_G=
BL_DATA_SIZE)
> > +#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END)


You will also need

#define CONFIG_SYS_INIT_SP_OFFSET  (GENERATED_GBL_DATA_SIZE)

or just leave CONFIG_SYS_INIT_SP_ADDR defined as it is, but I guess
that's less idiomatic.

>
>
> That is a fix I have included in my branch.
>
> Thanks,
>
> C.
>
> [ is it possible to configure gmail to wrap lines at a reasonable
>   width ? ]
>

This is just a difference between plain text mode & "Rich Text" mode.
This one should be wrapped normally (that is, if you trust the
documentation).

--=20
Maxim Sloyko
