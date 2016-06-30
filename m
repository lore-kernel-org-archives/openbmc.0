Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgNJw3zxfzDr0K
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 01:10:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kCMNhkpP; 
 dkim-atps=neutral
Received: by mail-qt0-x242.google.com with SMTP id m2so5192640qtd.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rOGOFkkdS4DEHvYFdYpwsF+En1WBP2ngmaEQ1u2V5lE=;
 b=kCMNhkpPvQMz9myiKWYtkMWsIO+o3cMxv5WH4D8xqwQdrVceVWzPlpsYRqiO9nJ9bM
 FP2Z0QvjjeMLLvNI/h6kfu4fCnlF3FJr5JTgsOHdUIYutS2Onta/EBEatwsUQVyhlfit
 /ZWbkbFN3n+AdSC+GS8pZpVyt++KOUUG65iC8JFsWqE2XL9Sag3PosnUvkkWmnKSHfIX
 dEbjDhiK9b79E0YFi9szcmCmjzsXlwcFCnq9diFRdFGcSnPr2/z7gUKwG548sra3mJHY
 IMZec6noJ1eLtnbR/YYR/iokOqoHJlLuVDLkVw1J8DBc2dAIMnG2v3/K30vWANdTumP4
 DmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rOGOFkkdS4DEHvYFdYpwsF+En1WBP2ngmaEQ1u2V5lE=;
 b=TSRUNRTNu52O/ZLRLamiwdmZ7yzqyuj+x3R7qZ/7N2LQefYZETpGqAcYEG3NEJj1JH
 Mi+ekxOW/kZZAVjmVKwE18CngeB7GXO1+zkiEC3FivOBtMh0VppmEDAcM7tYqt3yFtDf
 e6FwHwuFdNTPwEQ99GbXky2mBEwXe/xXeMFtDsk92XBGRb8s13YjUW2EjO/9lvQS5qxX
 YCpRbYg5KqxYV4m2MKAxJ7I4r+BNjN5WUt0Kf0LAae8GbM7D/gMZhqCZpCrxhvWKgf9d
 QCt3oAKvzTyUHg+lRDCjWG2nez55kDoBwbGMguHX2yz5RjimhCuO+0KR1nxiJW67Bo9c
 zOwA==
X-Gm-Message-State: ALyK8tLFuFyE4ZcEHwA552MOpZzMAPo2ivOMglVY6tMd4kJ3kDQWc7a1A2vN+PZON3iF++fbS0skH1yq/R36Mw==
X-Received: by 10.200.39.237 with SMTP id x42mr24161090qtx.75.1467299437741;
 Thu, 30 Jun 2016 08:10:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 08:10:18 -0700 (PDT)
In-Reply-To: <CAA0LjjVo9krV7-7iuh4EBuuX-fN4+exjCocD4ZUqVJRmO6t7iA@mail.gmail.com>
References: <CAA0LjjVo9krV7-7iuh4EBuuX-fN4+exjCocD4ZUqVJRmO6t7iA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Jul 2016 00:40:18 +0930
X-Google-Sender-Auth: 936Qpwvs8OG410Nmid5Xkfhol74
Message-ID: <CACPK8Xfgt2a2EazKg0SdCfJKQJoqFaPm8_ehNKkHMnRYUSh+hA@mail.gmail.com>
Subject: Re: [PATCH linux] drivers/fsi: Initial stubs for FSI device driver
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 30 Jun 2016 15:10:41 -0000

Hey Chris,

Looking better.

It looks like you did not use git send-email to send the patch. When I
try to apply it this happens:

$ git am ~/tmp/\[PATCH_linux\]_drivers_fsi\:_Initial_stubs_for_FSI_device_driver.mbox
Applying: drivers/fsi: Initial stubs for FSI device driver
error: patch failed: drivers/Makefile:172
error: drivers/Makefile: patch does not apply
.git/rebase-apply/patch:93: new blank line at EOF.
+
Patch failed at 0001 drivers/fsi: Initial stubs for FSI device driver

We use git format-patch to create the patch, and git send-email to
send it, as other workflows mess up the patch on the way.

Have a read of Documentation/SubmittingPatches and
Documentation/email-clients.txt for more background.

On Fri, Jul 1, 2016 at 12:15 AM, Christopher Bostic
<christopher.lee.bostic@gmail.com> wrote:
>  Initial stubs for FSI device driver.
>
> Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
> ---

It's common to put a changelog in here below the --, so reviewers know
what you've modified with respect to earlier versions. This part of
the patch is not part of the code, nor is it part of the commit
message that will end up in the git history, so it is free form and
informal. Check out
https://lists.ozlabs.org/pipermail/linuxppc-dev/2016-June/143899.html
for an example.

Something like:

Changes in V2:
  - Did foo
  - Fixed bar in header
  - Reworked baz following feedback from Daz

>  drivers/Makefile      |  1 +
>  drivers/fsi/Makefile  |  5 +++++
>  drivers/fsi/fsiinit.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsiinit.h | 41 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 drivers/fsi/Makefile
>  create mode 100644 drivers/fsi/fsiinit.c
>  create mode 100644 drivers/fsi/fsiinit.h
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 795d0ca..8ea7c58 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -172,3 +172,4 @@ obj-$(CONFIG_STM)           += hwtracing/stm/
>  obj-$(CONFIG_ANDROID)          += android/
>  obj-$(CONFIG_NVMEM)            += nvmem/
>  obj-$(CONFIG_FPGA)             += fpga/
> +obj-$(CONFIG_FSI)                          += fsi/
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

You could take the opportunity to add the Kconfig bits for the bus as well.

> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
> new file mode 100644
> index 0000000..d692ea3
> --- /dev/null
> +++ b/drivers/fsi/fsiinit.c
> @@ -0,0 +1,57 @@
> +/*
> + * FSI Master device driver
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * Christopher Bostic <cbostic@us.ibm.com>

Looks good.

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
> +

Nit: you've got extra white space here. One line will do.

> +static int fsi_start(void)
> +{
> +       int rc = 0;
> +
> +

Nit: you've got extra white space here. One line will do.

> +       printk("FSI DD v:%d installation ok\n", FSIDD_VERNO);
> +       return rc;
> +}
> +
> +static void fsi_exit(void)
> +{
> +
> +}
> +

Now that you've had a few goes at the process, perhaps add a bit more
functionality in the next set of patches you send.

Cheers,

Joel
