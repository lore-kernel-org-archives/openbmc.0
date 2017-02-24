Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTsYm4N03zDqC0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 11:34:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s7B8lseW"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id a5so280667ybb.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 16:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8vzN6q85Dc5+b0iNVJDxITbAQ3yUkfrF5pQcvT59S2s=;
 b=s7B8lseWiucAiQKD6pboGbyJ6HT/HMGHTcH+PfQv4We6sWFf19JBih+Wkwnn4viI4q
 LeKjuiZ1NhV8eXkwdGvTvUVV0jmimVOfRzy2VyqJ8+a41bfIkEbb7Z4sryb+9YjWyehj
 15/OcdGY9a9Rvzax6Z1FFyU/e6l4dz+3XfsZSbM8E6EIIlGWqMds6yb21x/neYFBA6So
 mHZ+S+NC3iEoqVI+LikeIUN9I6/8MIc7RcAxEJ+8QadUHZWTqvRvXqZGZsmuk2Da4al7
 CmBnDGvbUYFt9PQytEFw6rBsjdlapMnOLdRgerPz4zt4nSOp7MyGcrhWsmLmK64v2drT
 kTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8vzN6q85Dc5+b0iNVJDxITbAQ3yUkfrF5pQcvT59S2s=;
 b=jkfzdK3U19x5AyAwq2AbK4K2ycN4UtGW+R+Ma9lQAsAntUGqxlGms1fKlpZAsP+qH4
 knFYWNYsP3AjkUmiv4bSME01S7kaLFKU/gt6oRxZaENfrLcjlgsnXLINE2wMskrSBQI8
 Ez9WJXudhkKu7vJOVNuuZ8uZW5/YhXx1jTt09Kj1nGKGrF+krwOOXLr+Ovld7zH45co0
 +zp6MRDVTAxmK5kVSvtPtSQliIHGeGvLyvMMqckjSM1VbhtQi990ZEEJ/T5EmYdN+SCj
 7tSzYYu0WGZTzuH5yLvJdnOj/tg7vGzlf3rsT8aPoBsWs1eWV0Wqw77NfQE3IiDRNpUT
 lUqQ==
X-Gm-Message-State: AMke39kzK0rQSyG0qktsDIYrCusRnvy0ku4Umqmwk0otb/e0S53oC/86iedWYOYKjNQvQcYxub0u/eAOeU/ftg==
X-Received: by 10.37.194.5 with SMTP id s5mr27645605ybf.136.1487896474164;
 Thu, 23 Feb 2017 16:34:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 16:34:13 -0800 (PST)
In-Reply-To: <20170223195837.82098-2-cbostic@linux.vnet.ibm.com>
References: <20170223195837.82098-1-cbostic@linux.vnet.ibm.com>
 <20170223195837.82098-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 11:04:13 +1030
X-Google-Sender-Auth: tOvqIIuLBPBwIpiNzxgltdhBRMk
Message-ID: <CACPK8Xc3D9C10kr861etrCSsdTci7MD7oiLZM7FMz9D5QDwHvw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3 1/2] drivers/fsi: Move common read/write
 code into shared utility
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
X-List-Received-Date: Fri, 24 Feb 2017 00:34:37 -0000

Hi Chris,

On Fri, Feb 24, 2017 at 6:28 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Move common code shared between fsi_master_gpio_read/write into
> send utility.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> ---
>
> v2 - Separate this patch from a collection of other changes in the
>      v1 related patch.

This patch is unchanged from when I acked the previous revision. You
should include the tags from your reviewers when you re-send.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/fsi/fsi-master-gpio.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 8c8a8f4..b6feec1 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -354,26 +354,33 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
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
> -       int rc;
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
> @@ -381,21 +388,12 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>  {
>         struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>         struct fsi_gpio_msg cmd;
> -       int rc;
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
