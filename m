Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTscT3T1HzDqGG
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 11:36:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pnk7UDu3"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id l16so537193ywb.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 16:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=t9uHfhBVY5fHi347E+2aprv29y9463mqO6d+ZRHRscc=;
 b=Pnk7UDu3s+p+qXZQtP2uwuOd8FXj7jJ7xwTGWvKXOFP9bmoHSu5SaZKiy8XfnttOXC
 1ED5qHdxpK6Pqqo1+4Zd1tFV1FCP1wMEmKlehufAg0pdFzSVvlAc5ljjsPUboLO6s+JC
 E14D/xDJjaHA7s0fqKrBmpz5Sdk3HQ3Mz+2MNFonuoDBbsLH9Y2I2Edw6UbcK9jgGnSu
 ZONLvXTmwgA562tCgG5IK/I+lE5vBiQ1zx/F0Idw4iA1RNLBY4cth9vYh6AxMN9jHVWA
 Rb+29v6pCfhGbcQ+cjYGzTI8G6ZWS+v/fdEmaFCnFlSc/iHMBR5RvA5c5Rakd9JHdEeR
 dc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=t9uHfhBVY5fHi347E+2aprv29y9463mqO6d+ZRHRscc=;
 b=AvAQaXu8HBjB/Negw8qTwhy4UtLV2XvZGrm+HUJ1xaf8t0kbCYSGvNfUFp5WrAlsOh
 TYh2jz4e9hq/xucqd/jZ9st4+7dpi+g33Z2UiSbiGZOorYvVNqmmcpLjhevt+Pt4cGFJ
 g2cmWrOP74MoVkjxADOUOGmAWJHYb2szicP2J6rkhnaLWL+Bp5si4+lrHeZHgY9MdKXd
 J3TjaXoo1swryUNxFWfK2WWfT6nnpu7dehBkH6zBDjMBCHrOpf7gQpLZ1kMWXWQXuk3w
 QO+YQDRqNTs2mDMWlN97emwlEmPECXxS6gQ/Ggik0Eh7jsWBB/T9bCFkg5ANeuhTrga0
 Sspw==
X-Gm-Message-State: AMke39mo13BfZ2mQWD/JW64rKTMmlckDasQxe0ad7O1CBsAPAR476tfEdGH5ZrodxWMDwwI5gy9RAClZg7tCZA==
X-Received: by 10.129.116.4 with SMTP id p4mr34361081ywc.268.1487896615003;
 Thu, 23 Feb 2017 16:36:55 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 16:36:34 -0800 (PST)
In-Reply-To: <20170223195837.82098-3-cbostic@linux.vnet.ibm.com>
References: <20170223195837.82098-1-cbostic@linux.vnet.ibm.com>
 <20170223195837.82098-3-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 11:06:34 +1030
X-Google-Sender-Auth: QNeZcGfg5ozofb2z7mn7H9HXfI0
Message-ID: <CACPK8XdPKSDM+3WOMYW1+xCQvwvor+fhwb2oFZm05+guz0cErA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3 2/2] drivers/fsi: Cleanup and retry op on
 error
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
X-List-Received-Date: Fri, 24 Feb 2017 00:36:58 -0000

On Fri, Feb 24, 2017 at 6:28 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> On detect of FSI bus error clean up the bus and then retry
> the original operation.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> v3 - Move comon read/write code into a retry utility
>
>    - Add comment on why trying again
>
>    - Change nested error check from atomic bit type to atomic_t
>
>    - loop on retry instead of duplicating the same code

Thanks for including the changelog. As I mentioned on the list to
Eddie yesterday, the convention is to place the review comments below
the --- on the next line:


> ---
>  drivers/fsi/fsi-core.c        | 30 ++++++++++++++++++++++++++++++
>  drivers/fsi/fsi-master-gpio.c | 28 ++++++++++++++++++++++++++--
>  drivers/fsi/fsi-master.h      |  1 +
>  3 files changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 02ca3c0..a7b705d 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -42,6 +42,9 @@
>
>  #define FSI_PEEK_BASE                  0x410
>  #define        FSI_SLAVE_BASE                  0x800
> +#define        FSI_HUB_CONTROL                 0x3400
> +
> +#define        FSI_SLAVE_SMODE_DFLT            0xa0ff0100
>
>  #define FSI_IPOLL_PERIOD               msecs_to_jiffies(fsi_ipoll_period_ms)
>
> @@ -55,6 +58,7 @@ static const int engine_page_size = 0x400;
>  static struct task_struct *master_ipoll;
>  static unsigned int fsi_ipoll_period_ms = 100;
>  struct class *hub_master_class;
> +static atomic_t in_err_cleanup = ATOMIC_INIT(-1);

As I said in my initial review:

"Instead use a atomic type for in_err_cleanup, declared in the scope
of fsi_master_gpio_handle_error."

The variable should be declared inside fsi_master_handle_error.

>
>  static DEFINE_IDA(master_ida);
>
> @@ -653,6 +657,32 @@ static int fsi_master_break(struct fsi_master *master, int link)
>         return 0;
>  }
>
> +void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
> +{
> +       uint32_t smode = FSI_SLAVE_SMODE_DFLT;
> +
> +       if (!atomic_inc_and_test(&in_err_cleanup))
> +               return;
> +
> +       fsi_master_break(master, 0);
> +       udelay(200);
> +       master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SMODE, &smode,
> +                       sizeof(smode));
> +       smode = FSI_MRESB_RST_GEN | FSI_MRESB_RST_ERR;
> +       master->write(master, 0, 0, FSI_HUB_CONTROL + FSI_MRESB0, &smode,
> +               sizeof(smode));
> +
> +       if (addr > FSI_HUB_LINK_OFFSET) {
> +               smode = FSI_BREAK;
> +               master->write(master, 0, 0, 0x100004, &smode, sizeof(smode));
> +               smode = FSI_SLAVE_SMODE_DFLT;
> +               master->write(master, 0, 0, 0x100800, &smode, sizeof(smode));
> +       }
> +
> +       atomic_set(&in_err_cleanup, -1);
> +}
> +EXPORT_SYMBOL(fsi_master_handle_error);
> +
>  static int fsi_master_scan(struct fsi_master *master)
>  {
>         int link, slave_id, rc;
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index b6feec1..c5f4f9c 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -370,6 +370,28 @@ static int send_command(struct fsi_master_gpio *master,
>         return rc;
>  }
>
> +static int fsi_master_gpio_send(struct fsi_master_gpio *master,
> +                               struct fsi_gpio_msg *cmd, uint8_t expected,
> +                               uint32_t addr, size_t size, void *val)
> +{
> +       static const int master_retries = 2;
> +       uint8_t retries;
> +       int rc;
> +
> +       /*
> +        * In case the FSI bus is in a bad state a retry may help
> +        * the operation to complete successfully
> +        */
> +       for (retries = 0; retries < master_retries; retries++) {
> +               rc = send_command(master, cmd, expected, size, val);
> +               if (!rc)
> +                       break;
> +               fsi_master_handle_error(&master->master, addr);
> +       }
> +
> +       return rc;
> +}
> +
>  static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>                 uint8_t slave, uint32_t addr, void *val, size_t size)
>  {
> @@ -380,7 +402,8 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +       return fsi_master_gpio_send(master, &cmd, FSI_GPIO_RESP_ACKD, addr,
> +                               size, val);
>  }
>
>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> @@ -393,7 +416,8 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>                 return -ENODEV;
>
>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +       return fsi_master_gpio_send(master, &cmd, FSI_GPIO_RESP_ACK, addr,
> +                               size, NULL);
>  }
>
>  /*
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 4a3176b..54723a7 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -85,6 +85,7 @@ struct fsi_master {
>  extern int fsi_master_register(struct fsi_master *master);
>  extern void fsi_master_unregister(struct fsi_master *master);
>  extern int fsi_master_start_ipoll(struct fsi_master *master);
> +extern void fsi_master_handle_error(struct fsi_master *master, uint32_t addr);
>
>  /**
>   * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
> --
> 1.8.2.2
>
