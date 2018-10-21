Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="dd7x9Pd0"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dZ264G5czF0wf
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:24:14 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id d15-v6so1402018qtp.12
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XcKgBDBJl7oIVDE2dODwgYMFwlNuR3zIwOza28kiYGE=;
 b=dd7x9Pd0Bz+131Qiz4KTRgssVkHbnRh6epxwk6nyVxTpia76ZdWL5GntZu44GsFgvN
 LBjPjMH6K42alW4u/mMKTBCnz6JF+H727UOYYtVenSA3dwCgawscXpVGDBvP7SjlCGaY
 VsSZLrmun+tQt3XhhM87eY75e4mBEtMWsa5cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XcKgBDBJl7oIVDE2dODwgYMFwlNuR3zIwOza28kiYGE=;
 b=hVNo0VzswN1Xgbq+DeyzydCLzHLmQfUWtvq3hCxeAzbaonKBDJFvyyGVWonmjo3rYh
 TMSMTdAki70xE9rLHZRX6kq0g3aqAq2yqbS0NzSG1CpNB0rYrTLkEHbGaDA1wX4kpSMl
 Z3qaFojYDkVe6tPuHDkb2vNQPLzl7NacFLbKTwuY0VZ5yQyK4IYcQLwqrDShfXLABiSV
 bJ/J0EvI/dtwCB3A8Pd0oJtoWc5GQdgx5UV5tTxxrz7y4OOAECv1fpXakp6/dOIYVVrA
 uopmtUvmk7zzr+z5fyCgFonqbyvH2fkwA5qVEsP5taoUyT3+KAXJUEiCDeaRjSfJ2Tt2
 GrxQ==
X-Gm-Message-State: AGRZ1gI9wwfPxgVSfRHSW3dpVwBbHtl2V/iijoeMX9o1mcmaLuMQ3QRJ
 BIW8QsPbyi97qEOIYFtD0CYpznCFMsykc5J42spTMhHi
X-Google-Smtp-Source: ACcGV616RAoiLMsiedCup/3oJ7Zwiq3q1Xft4/DX/NMIXPsUepqlY7voq3RD6wEKpebc616zfd0r+K5yP8c74ZpuCmU=
X-Received: by 2002:ac8:6055:: with SMTP id
 k21-v6mr10964777qtm.235.1540160652460; 
 Sun, 21 Oct 2018 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181012080723.15825-1-clg@kaod.org>
In-Reply-To: <20181012080723.15825-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Oct 2018 08:54:01 +1030
Message-ID: <CACPK8XfTK7SVkq25YXjRKK94YZp8HRJreHKh20Zq6VW=qYF1fA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] /dev/mem: add a devmem kernel parameter to
 activate the device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Oct 2018 22:24:15 -0000

On Fri, 12 Oct 2018 at 18:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> For security reasons, some configuration needs to run without /dev/mem
> but on some occasions, to debug HW for instance, it's still useful to
> be able to reboot the system with access to physical memory.
>
> Add a kernel parameter which activates the /dev/mem device only when
> 'mem.devmem' is enabled.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks C=C3=A9dric. I've put this in the 4.18 tree.

Can you submit this upstream too please?

Cheers,

Joel

> ---
>  drivers/char/mem.c                              | 12 ++++++++++++
>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>  drivers/char/Kconfig                            |  9 +++++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index df66a9dd0aae..8c021a559e6c 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include <linux/mm.h>
> +#include <linux/moduleparam.h>
>  #include <linux/miscdevice.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> @@ -36,6 +37,7 @@
>  # include <linux/efi.h>
>  #endif
>
> +#define DEVMEM_MINOR   1
>  #define DEVPORT_MINOR  4
>
>  static inline unsigned long size_inside_page(unsigned long start,
> @@ -912,6 +914,12 @@ static char *mem_devnode(struct device *dev, umode_t=
 *mode)
>         return NULL;
>  }
>
> +#ifdef CONFIG_DEVMEM_BOOTPARAM
> +static bool devmem;
> +module_param(devmem, bool, 0444);
> +MODULE_PARM_DESC(devmem, "kernel parameter to activate /dev/mem");
> +#endif
> +
>  static struct class *mem_class;
>
>  static int __init chr_dev_init(void)
> @@ -930,6 +938,10 @@ static int __init chr_dev_init(void)
>                 if (!devlist[minor].name)
>                         continue;
>
> +#ifdef CONFIG_DEVMEM_BOOTPARAM
> +               if (minor =3D=3D DEVMEM_MINOR && !devmem)
> +                       continue;
> +#endif
>                 /*
>                  * Create /dev/port?
>                  */
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 1370b424a453..a8ed12d0d678 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2402,6 +2402,9 @@
>                         deep    - Suspend-To-RAM or equivalent (if suppor=
ted)
>                         See Documentation/admin-guide/pm/sleep-states.rst=
.
>
> +       mem.devmem=3D     Activate the /dev/mem device
> +                       Format: <bool>  (1/Y/y=3Denable, 0/N/n=3Ddisable)
> +
>         meye.*=3D         [HW] Set MotionEye Camera parameters
>                         See Documentation/media/v4l-drivers/meye.rst.
>
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 212f447938ae..08c56148190b 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -16,6 +16,15 @@ config DEVMEM
>           memory.
>           When in doubt, say "Y".
>
> +config DEVMEM_BOOTPARAM
> +       bool "mem.devmem boot parameter"
> +       depends on DEVMEM
> +       default n
> +       help
> +         This option adds a 'mem.devmem' kernel parameter which activate=
s
> +         the /dev/mem device when enabled.
> +         When in doubt, say "N".
> +
>  config DEVKMEM
>         bool "/dev/kmem virtual device support"
>         # On arm64, VMALLOC_START < PAGE_OFFSET, which confuses kmem read=
/write
> --
> 2.17.1
>
