Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfFb1KvDzDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DtBDBwyE"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 2so5295823ywn.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=H7lCoX57abQ4hVGOeMsqnprJa2uJ6Fjfm9g9jP4CVZQ=;
 b=DtBDBwyEy6pu/O9/M9JHCvZ0TwiVDjo0qlyQOmaIlTY6qA6dXaC/YVtXpOz8gcK4uM
 YuLxe0HW4fQyU0WV/AQPJnSKp6T7pBMiBGx3d/pX8qjNw9x5xQZKdPg0lFNzqlLN0uRu
 y/ggH3Hg4ZL2HsW/ob9lVkesUM1TjrwDy+VCZT9KZRJtaXy4G995sEY7ccIm1N2AcbgC
 77xIHwnu77Sy2eY/UkE6gsFkIkGjHmPl1y1iEp5z6llJzFv6um4C0d9+ElPnI2tgPnJo
 IZp+EEnRmGavkD7VS7V8HEJZU+SO+RtvciwL40FlPFLIFzEeaFW+xYdWiRv8PVF8vhEC
 pzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=H7lCoX57abQ4hVGOeMsqnprJa2uJ6Fjfm9g9jP4CVZQ=;
 b=HlfcAvriXN7nxX5xzf4M168Es3GRFWRPFGk/cbIDgN0TF+N+CBedgnITENZW4uQgc/
 VYCn9A9Mv7TTmqmyfcr6TbHjaOj7bR1zXOHFc05OSYns098tMxaBMN0kjF+4ckUDASJ3
 UVPOANv7OrYZYUD6a+6+KsfX/NIM82+p4WUoiC1LzzEQ1nUX1pgQwUrpesyfTfVWQ2Is
 B2nkTX8I+lUBvLUkYOusV+vtw2+c5hY5klvhF4u4R2WWROTIIMMgqTg6AasFFM+ux4Kg
 XdeXp5q3uhPOPEcRLdj0EmK9KuOznfhF2a1ed1Oi6QqGcHvI+87vW/Oj0Mkrvp7KLIw4
 F5Bw==
X-Gm-Message-State: AMke39lVTfzEk3iRSwRQQ48lbcZAopYtCMc4ypmAYkB2WTHG5ec+XnEuAWHCSjwnPJVCGYyDf6vWOXaHRJYagQ==
X-Received: by 10.13.247.134 with SMTP id h128mr25560351ywf.56.1487725280342; 
 Tue, 21 Feb 2017 17:01:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 21 Feb 2017 17:00:59 -0800 (PST)
In-Reply-To: <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2017 11:30:59 +1030
X-Google-Sender-Auth: 04EUk7TyUBNfyjtNA2z9slE-pZQ
Message-ID: <CACPK8Xfn=VJJ9POR3oAo5ShggAaD0Xg0jRGZu-YmiJZkZMjn9w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 5/7] drivers/fsi: Add retry on bus error
 detect
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Feb 2017 01:01:23 -0000

On Wed, Feb 22, 2017 at 8:20 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> After each gpio master read/write check for bus errors.  If
> errors detected then clean it up and retry the original operation
> again.  If second attempt succeeds then don't report original
> error to caller.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-core.c        |  4 ++++
>  drivers/fsi/fsi-master-gpio.c | 24 ++++++++++++++++++++++--
>  drivers/fsi/fsi-master.h      |  3 +++
>  3 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 360c02a..428675f 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -639,6 +639,10 @@ static int fsi_master_break(struct fsi_master *master, int link)
>         return 0;
>  }
>
> +void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
> +{
> +}
> +
>  static int fsi_master_scan(struct fsi_master *master)
>  {
>         int link, slave_id, rc;
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 8aec538..5b502eb 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -381,7 +381,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +       if (rc) {
> +               fsi_master_handle_error(&master->master, addr);
> +
> +               /* Try again */
> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +               if (rc)
> +                       fsi_master_handle_error(&master->master, addr);
> +       }
> +
> +       return rc;
>  }
>
>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> @@ -395,7 +405,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +       if (rc) {
> +               fsi_master_handle_error(&master->master, addr);
> +
> +               /* Try again */

It's obvious from the code that we're trying again. You could change
the comment to indicate why we are trying again.

> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +               if (rc)
> +                       fsi_master_handle_error(&master->master, addr);
> +       }

You're repeating yourself here. Perhaps a loop?

You have the same sequence in fsi_master_gpio_read. It would be nice
to not repeat the sequence.

> +
> +       return rc;
>  }
>
>  /*
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 4a3176b..4ed416c 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -19,6 +19,8 @@
>
>  #include <linux/device.h>
>
> +#include "fsi-master.h"

This looks wrong.

> +
>  /* Control Registers */
>  #define FSI_MMODE              0x0             /* R/W: mode */
>  #define FSI_MDLYR              0x4             /* R/W: delay */
> @@ -85,6 +87,7 @@ struct fsi_master {
>  extern int fsi_master_register(struct fsi_master *master);
>  extern void fsi_master_unregister(struct fsi_master *master);
>  extern int fsi_master_start_ipoll(struct fsi_master *master);
> +extern void fsi_master_handle_error(struct fsi_master *master, uint32_t addr);

Does this need to be added to the header?

>
>  /**
>   * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
> --
> 1.8.2.2
>
