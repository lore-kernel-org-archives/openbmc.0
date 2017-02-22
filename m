Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfGw6SKczDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:02:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vILwdM39"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l16so10930234ywb.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1ZhECe9BL+hAqu4tR/7g+BURBx8XOtROYm1SjBCHRdI=;
 b=vILwdM39/JxWiV8RoeqZBhPu8sy1OI0Ady6vNdGqgxLcHrhoXloHouw3JMQdhmFBRh
 fPvuaU/aN9aRighFgNd652Q2QNFh593PThERaVQ7wl2QjNV0+9mTrXI/2mK5HmGff0aZ
 LQpAPNEsxfkeWONneMDmVuSS/7Tz9PA/buaMeXhnOdokfw/ib2TRbSPNCYwyxgchbllv
 TSXGliYGplUY9S/BYBX82eEpHdM2UVIockt//TJElEDxtWRndVhaLHWFw9WkiH2uGnXw
 G/GOkJHKmSX9TUgjdXutPppTsImkfYQTScmX99lKFmlK5EMw4RbHwSo7MFST03AriqSb
 n5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1ZhECe9BL+hAqu4tR/7g+BURBx8XOtROYm1SjBCHRdI=;
 b=HuqXdqsTMW3dIteh+XX+oDcoYCfWwpAU5PuJhdG1RLjW2yiW/wj/y27r91S5MvnOKK
 Esykt4mo+zxaPRbeMXQRs994ALdN0G1SKVl04bgeb4p6NUaV01vgff7Ef4TgD3t+GHSr
 20bMQhvkvp/RjV3H55+MSIGgRHxa9q9OhQvYTeOeWqPsnEzK5oi4QRn3PwzHN1UzD3zt
 10nEw/3O0mvK9sB5cvIgBpQpgMvHxGEGb0LJ4Ff2qDUOY7NmR4xfzsa6G51ypQBovBAq
 p1F8ZtW8Y4dNxllj4y/g0rndJJbnVFBxdoj/a+tjtfntjxwh5nGBCCfI2hE+6BPdaJRF
 Em/A==
X-Gm-Message-State: AMke39kral2m59srP4EQaSVDL+Zbma8ApOWZGXJR5LZfCp2ol+nM+5l4O/4UWffovEhxV8/7zhbjWo/LK66c5Q==
X-Received: by 10.129.118.82 with SMTP id j18mr22038429ywk.10.1487725350337;
 Tue, 21 Feb 2017 17:02:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 21 Feb 2017 17:02:09 -0800 (PST)
In-Reply-To: <20170221215032.79282-5-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-5-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2017 11:32:09 +1030
X-Google-Sender-Auth: kZpLPoJ-p5QHYgUITctN-Yi-2SI
Message-ID: <CACPK8XeQwGa7Z3jeJXGiDTPDJxz5CdmCFRrGvV+AUPq8LqZwfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 4/7] drivers/fsi: Move common read write
 ops into single function
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
X-List-Received-Date: Wed, 22 Feb 2017 01:02:33 -0000

On Wed, Feb 22, 2017 at 8:20 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Move common operations between gpio reads/writes into a new
> utility send_command.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> ---
>
> v2: Separate the break out of common read/write elements into its
>     own separate patch.

Nice one.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/fsi/fsi-master-gpio.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 3ed82ea..8aec538 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -354,26 +354,34 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>         cmd->msg >>= (64 - cmd->bits);
>  }
>
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
> -
> -       return rc;
> +       return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>  }
>
>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> @@ -382,20 +390,12 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
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
> -
> -       return rc;
> +       return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>  }
>
>  /*
> --
> 1.8.2.2
>
