Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJnNy6SCvzDqGn
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 16:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fxc6zJhT"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id t8so13664958vke.0
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 21:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Leqmah1qroMqGB7NcVUuxjoqcN8+Y9wMZzV3QUOSA9Y=;
 b=Fxc6zJhTsytgOgiCDvX2TtnvTqNk3rxxaESLbct37zEMuT8OPD83c20/bvuvGXF7ax
 af3GG+CJvSNChXiAsLC2pUz1NDPvVNVn7MoTdfptYLOROyRy/Aajeg5KcK5SFEUXYFdW
 lI5o36ktdJe0ZU8qRNjN/wtVmRn0ceFdm8uwpQ1GKfxFhVQvDLb62mgS0j+93umhcxYr
 aZ9eoJg5dSBYrTkj+Q68Kov7tpodhQa787OBteNIaTw7+LNGcUkmsmXn734Hlhea9pQ5
 9e2oQOcArhqHEc4cs2vm4M8XUmuT6Xgu/+aHp2tAljIpjp+KQiTXxS88SRskMG7Fc/FL
 DvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Leqmah1qroMqGB7NcVUuxjoqcN8+Y9wMZzV3QUOSA9Y=;
 b=lBfYodY0E//R3iEvptY8qumB13ZheFImDLdNpTr7W/FIgxJQlz0WH8rYYn20E2YM4i
 6ORH2liqLXXYOPVHnRzRwnbSQ7f9SgxYoIb8wRGHD0fEj3hf3dqL/+i3jACMbA+VYlNW
 3YMQJmZS0aXcZ0kbWin8P0dDyAnDIV5MsH6WLwoRW5IENNT5yFncoFQUATddvxvngeyx
 og0brY/9zPd0Sv5CoNsTGp/GwTUWCzbXVz6mMHFJ1DbUDKONdqkVnXgEkUHhqRzclSVb
 dRql16XO94E0WGS11o2umrIPnD6oZcmjv1yNkT7ghILLCL0FuWnBSpnZzjAVD+6SkAep
 RNxA==
X-Gm-Message-State: AMke39l/tbAKJByJPvABiGYpRUMlkB8N6K7ExhJBYzxDYw63DLIkliGrqK0EW9FhB+QKgEu5A2E1qXdxrWsFng==
X-Received: by 10.31.49.81 with SMTP id x78mr724941vkx.82.1486619728475; Wed,
 08 Feb 2017 21:55:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 21:55:08 -0800 (PST)
In-Reply-To: <20170203193800.90838-1-cbostic@linux.vnet.ibm.com>
References: <20170203193800.90838-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 16:25:08 +1030
X-Google-Sender-Auth: 59dp9gjee2UB24N0FQNKj1W8duE
Message-ID: <CACPK8Xfp5_qF3D64rcJz3X2pLx9TPrM_YREmS-dsUmPUrt2JpQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Clock slave prior to master
 command
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Edward James <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 05:55:31 -0000

On Sat, Feb 4, 2017 at 6:08 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> If the FSI bus has been idle for some period it is necessary to
> wake up the slave so its ready for a new master initiated
> commands. This is done by clocking out a series of 0's on the
> SDA line immediately before any command.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

In my testing I did not need this patch even after a long idle period.

This patch did help when I tried to read or write to an invalid FSI
address. I suspect we want to fix the root cause of those invalid
read/writes - perhaps by catching them before they turn into
transactions on the bus, or only doing the reset when the bus got into
a bad state.

Doing it on every read/write seems excessive and will slow down access
to the bus.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-master-gpio.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 73d9985..49598c33 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -59,6 +59,7 @@
>  #define        FSI_GPIO_MSG_ID_SIZE            2
>  #define        FSI_GPIO_MSG_RESPID_SIZE        2
>  #define        FSI_GPIO_PRIME_SLAVE_CLOCKS     100
> +#define        FSI_GPIO_WAKE_CLOCKS            32      /* >= 32 ok, 16 fails */
>
>  static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);     /* lock around fsi commands */
>
> @@ -178,6 +179,16 @@ static void echo_delay(struct fsi_master_gpio *master)
>  }
>
>  /*
> + * Wake up the slave by clocking it a number of times prior to sending the next
> + * master command.  Needed when the bus has been idle for a while.
> + */
> +static void wake_slave(struct fsi_master_gpio *master)
> +{
> +       set_sda_output(master, 1);
> +       clock_toggle(master, FSI_GPIO_WAKE_CLOCKS);
> +}
> +
> +/*
>   * Used in bus error cases only.  Clears out any remaining data the slave
>   * is attempting to send
>   */
> @@ -364,6 +375,7 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
>
>         spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> +       wake_slave(master);
>         serial_out(master, &cmd);
>         echo_delay(master);
>         rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
> @@ -386,6 +398,7 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
>
>         spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> +       wake_slave(master);
>         serial_out(master, &cmd);
>         echo_delay(master);
>         rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
> --
> 1.8.2.2
>
