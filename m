Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPtLr24MzzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 23:56:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGr/oHUA"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id q71so3197051ywg.3
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 04:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jSxe4LTTI85h5kpc/YpL0FZdwsOTkQUC3skaPjF/d0k=;
 b=GGr/oHUAFEU3TDX6gpjSvPYbFZPdHsFSkazZW0vwZTFxTkPhLCfvccw9qABEn+Ot8r
 m1Y/tQdpNT/ntfaooPWvG8tVQX8R2p1Q+5dFO6mgspoJ4dEtWQY6+fuzqTne0ls4ZCJO
 cA4rp/BHg9o1XJHhr92JUBCX6Rtn6Yx07aYAZ7FGSXF7x5/xiUIkQJS3QUxl5HdZ5u1L
 1WzkdRQFym3bqYSzOdDwbM2jOSfUcxMlYWMe1arFbwKUJ574Mt+m6umnTZEjaAhvpir6
 jF/V4wr++4FTJZIxrEFZnkFDicD8p1Cjj3dWLdGx3ulx6E5g7PDjWrVYSr5aapvV+J4o
 DVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jSxe4LTTI85h5kpc/YpL0FZdwsOTkQUC3skaPjF/d0k=;
 b=Qhjq2rMSqa33VJzVFAHzr7hpEhYuh/cye1aEgNGgiMN48tKblrJOuXgBvfBbg6Ngf5
 na2zvIY2PtIVFK4bgQiS0KLmBoCjyqvMYw7ZBnuO9Fz10vQwguV8+zZhWqx4V3MGaHJF
 C+ztSPiosLZDeZLZ0bH1xCoZlKrNkfOdwUPGD1lNFT53V8oBcf18l4HZkqdhy3DuqmyG
 IWhOiEVyMeTFMsTylk0pwombeDis2TVfV2sabSknw8IsHjf++pjcbFHZXGHh403z2qZP
 a6ethKiIEVS94Pb0IcOTDfp4giRY8192Xci+jR8JAAme9hhNxxKn3xBiaNKq1UgrTMUG
 9BLQ==
X-Gm-Message-State: AMke39kupR7DujgaZmy5VDz0gKavhakGfNcLgLqNcE0QLFkHhuD4g7v8AAGw/6LbrvNP+Z/FuPJ5YPav5XjCVg==
X-Received: by 10.129.116.4 with SMTP id p4mr6361153ywc.268.1487336177847;
 Fri, 17 Feb 2017 04:56:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Fri, 17 Feb 2017 04:55:57 -0800 (PST)
In-Reply-To: <20170216220434.79474-5-cbostic@linux.vnet.ibm.com>
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-5-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 23:25:57 +1030
X-Google-Sender-Auth: yLLdjxLtC6t-TGTZ__PlLojLbqg
Message-ID: <CACPK8Xf39MwbGQeHNQAGnqZn-tdroOhvMtuSkuE7yPxi9XXabQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 4/5] drivers/fsi: Add FSI bus error cleanup
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Edward James <eajames@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 12:56:20 -0000

On Fri, Feb 17, 2017 at 8:34 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> On detect of bus fails attempt to clean them up and try the
> command again.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 100 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 85 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 92af53d..bb3983c 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -67,8 +67,16 @@
>
>  #define        FSI_MASTER_GPIO_LINK_SIZE       0x00800000
>
> +static int fsi_master_gpio_read(struct fsi_master *_master, int link,
> +               uint8_t slave, uint32_t addr, void *val, size_t size);
> +static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> +               uint8_t slave, uint32_t addr, const void *val, size_t size);
> +static int fsi_master_gpio_break(struct fsi_master *_master, int link);
> +
>  static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);     /* lock around fsi commands */
>
> +uint8_t in_err_cleanup;
> +
>  struct fsi_master_gpio {
>         struct fsi_master       master;
>         struct gpio_desc        *gpio_clk;
> @@ -358,24 +366,85 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>         cmd->msg >>= (64 - cmd->bits);
>  }
>
> +/*
> + * Clean up the FSI bus path on detection of error.
> + * todo: get rid of magic numbers
> + */
> +static void fsi_master_gpio_handle_error(struct fsi_master_gpio *master,
> +                                       uint32_t addr)
> +{
> +       uint32_t smode = 0xa0ff0100;

I was wondering what a smode is?

> +
> +       /* Avoid nested error handling */
> +       if (in_err_cleanup)
> +               return;
> +
> +       in_err_cleanup = 1;

This locking is racy. Instead use a atomic type for in_err_cleanup,
declared in the scope of fsi_master_gpio_handle_error.

> +       fsi_master_gpio_break(&master->master, 0);
> +       udelay(200);
> +
> +       /* Set slave ID in smode */
> +       fsi_master_gpio_write(&master->master, 0, 0, 0x800, &smode,
> +                               sizeof(smode));
> +
> +       /* Reset the MFSI bridge */
> +       smode = 0xc0000000;
> +       fsi_master_gpio_write(&master->master, 0, 0, 0x35D0, &smode,
> +                               sizeof(smode));
> +
> +       if (addr >= 0x80000) {
> +
> +               /*
> +                * Break to hub link 1
> +                * todo: make this handle more arbitrary link topologies
> +                */
> +               smode = 0xc0de0000;
> +               fsi_master_gpio_write(&master->master, 0, 0, 0x100004, &smode,
> +                                       sizeof(smode));
> +
> +               smode = 0xa0ff0100;
> +               fsi_master_gpio_write(&master->master, 0, 0, 0x100800, &smode,
> +                                       sizeof(smode));
> +       }
> +       in_err_cleanup = 0;
> +}
> +
> +static int send_command(struct fsi_master_gpio *master,
> +                       struct fsi_gpio_msg *cmd, uint8_t expected,
> +                       size_t size, void *val)
> +{
> +       unsigned long flags;
> +       int rc;
> +
> +       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> +       serial_out(master, cmd);
> +       echo_delay(master);
> +       rc = poll_for_response(master, expected, size, val);
> +       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> +
> +       return rc;
> +}
> +
>  static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>                 uint8_t slave, uint32_t addr, void *val, size_t size)
>  {
>         struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>         struct fsi_gpio_msg cmd;
>         int rc;
> -       unsigned long flags;
>
>         if (link != 0)
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> -
> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> -       serial_out(master, &cmd);
> -       echo_delay(master);
> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);

I see you've pulled the guts of this function out into send_command.
It would have made it easier to follow if that refactoring was in it's
own patch, and the error handling was introduced afterwards.

> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +       if (rc) {
> +               fsi_master_gpio_handle_error(master, addr);
> +
> +               /* Try again */
> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +               if (rc)
> +                       fsi_master_gpio_handle_error(master, addr);
> +       }
>
>         return rc;
>  }
> @@ -386,18 +455,20 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>         struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>         struct fsi_gpio_msg cmd;
>         int rc;
> -       unsigned long flags;
>
>         if (link != 0)
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> -
> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> -       serial_out(master, &cmd);
> -       echo_delay(master);
> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +       if (rc) {
> +               fsi_master_gpio_handle_error(master, addr);
> +
> +               /* Try again */
> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +               if (rc)
> +                       fsi_master_gpio_handle_error(master, addr);
> +       }
>
>         return rc;
>  }
> @@ -480,7 +551,6 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>         master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>         if (!master)
>                 return -ENOMEM;
> -       master->master.dev = &pdev->dev;

I'm not sure why you're making this change?

>
>         gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
>         if (IS_ERR(gpio)) {
> --
> 1.8.2.2
>
