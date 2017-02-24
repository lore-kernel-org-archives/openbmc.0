Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzrL1g8fzDqGn
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:17:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ud50ccQ8"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id n76so469090ybg.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yD8vTh3lV1wqDBRJmMfRrn5QQqdl+UnMNC+8eRXMXLQ=;
 b=Ud50ccQ8IpCAe3xW/LAwiib09OqAarPoPvOFfmOtpR/dnPEqzXUJl6Xsgbh4x0mt+L
 tWbY4jg7ZQplvdGiv3L4g+edyv2svuuV8QD36LA/sX/MPeHiGWZGY/y3DTj/xATz4Gnp
 GxrjEkBinPN3VEMQtDuvO9ZcjtdCc11PXIMoBlGlzEdfkX+3UaWpdA2pT+ErOl/8lKyE
 qqWQ8dbNmzEGH9BSdJ+oTx++YJHmH/kL5IqPVsRMWhzKM+u3en+gXf86apWoPrP1Gq2v
 S1UcAnwXQpKwORFVC+Nl/IvWp+CoEEOjs4KA+TYxwC+ig+U6YhFx3BHGZ200/nu8CXOp
 AQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yD8vTh3lV1wqDBRJmMfRrn5QQqdl+UnMNC+8eRXMXLQ=;
 b=rnPaRCDxb/4olr/a62aC3THxy8UbYLgcKdUcQ6ZRcWvLoHM9WLSB+MzkIEEW4PdoN4
 9jv2ilq/S5Jom52ats/QHkIBKjioyO75jKbAWspwXguANd6Z0ViqPAvvnD8oXR6TxWY+
 S85kaXQGGRwLo5LSUCT9joJW+edNjREOXwkxtQM3y0055eZHvLLSxLAI6FQtCX5/Be+N
 jEga5JHl9Hdf3U0oTkmpcG/WKP5XMFe5o1v/VbdwMm5/jcA2BOSb8nw40kdBI5VpodW6
 6MkwF4ZuOTJ3jSC5QtJdjiUVUfi4dbaMJuvD94P2TTX4anIXn/e+cCon7oit7F+Z/fBB
 Rjhw==
X-Gm-Message-State: AMke39mzqdb+mjnvODOBajtcJ2WS7bQ6oFMAepu55fOa3QswWBBCIGpxObeZq/RHuc/UOtcdDqdA+4Gcffp4jA==
X-Received: by 10.37.16.214 with SMTP id 205mr502164ybq.17.1487913455865; Thu,
 23 Feb 2017 21:17:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 21:17:15 -0800 (PST)
In-Reply-To: <20170224051556.16432-1-joel@jms.id.au>
References: <20170224051556.16432-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 15:47:15 +1030
X-Google-Sender-Auth: qN6tehKIDQlTReWbHLiNyMmu_9s
Message-ID: <CACPK8XfKE5wb+iMosjKe2wuU_THV5nEEJ8X3ZwP8DqWx9cqFgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] i2c: aspeed: drop the locks
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 24 Feb 2017 05:17:38 -0000

On Fri, Feb 24, 2017 at 3:45 PM, Joel Stanley <joel@jms.id.au> wrote:
> The i2c core code provides i2c_lock_bus. This gives all i2c buses a
> per-adapter lock, so the locking we perform in the driver is redundant.
>
> Tested on Zaius by using the UDC and EEPROM which are on the same i2c bus.
>
> Suggested-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ece5aa3ecfd1..61da89407895 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -252,9 +252,6 @@ struct ast_i2c_bus {
>         struct clk      *pclk;
>         int             irq;
>
> -       /* i2c transfer state. this is accessed from both process and IRQ
> -        * context, so is protected by cmd_lock */
> -       spinlock_t      cmd_lock;
>         bool            send_start;
>         bool            send_stop;      /* last message of an xfer? */
>         bool            query_len;
> @@ -358,10 +355,8 @@ static void ast_i2c_issue_cmd(struct ast_i2c_bus *bus, u32 cmd)
>
>  static int ast_i2c_issue_oob_command(struct ast_i2c_bus *bus, u32 cmd)
>  {
> -       spin_lock_irq(&bus->cmd_lock);
>         init_completion(&bus->cmd_complete);
>         ast_i2c_issue_cmd(bus, cmd);
> -       spin_unlock_irq(&bus->cmd_lock);
>         return wait_for_completion_interruptible_timeout(&bus->cmd_complete,
>                                               bus->adap.timeout*HZ);
>  }
> @@ -539,8 +534,9 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
>         /* queue the next message. If there's none left, we notify the
>          * waiter */
>         next_msg_queued = ast_i2c_do_byte_xfer(bus);
> -       if (!next_msg_queued)
> +       if (!next_msg_queued) {
>                 complete(&bus->cmd_complete);
> +       }

This is obviously unrelated and unnecessary.

>  }
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -554,7 +550,6 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
>         enum i2c_slave_event event;
>         struct i2c_client *slave = bus->slave;
>
> -       spin_lock(&bus->cmd_lock);
>         if (!slave) {
>                 irq_handled = false;
>                 goto out;
> @@ -635,7 +630,6 @@ static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
>         ast_i2c_write(bus, status_ack, I2C_INTR_STS_REG);
>
>  out:
> -       spin_unlock(&bus->cmd_lock);
>         return irq_handled;
>  }
>  #endif
> @@ -649,7 +643,6 @@ static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
>                 AST_I2CD_INTR_TX_NAK;
>         u32 sts, cmd;
>
> -       spin_lock(&bus->cmd_lock);
>
>         cmd = ast_i2c_read(bus, I2C_CMD_REG);
>         sts = ast_i2c_read(bus, I2C_INTR_STS_REG);
> @@ -708,8 +701,6 @@ static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
>                                 bus->msg, bus->cmd_pending);
>         }
>
> -       spin_unlock(&bus->cmd_lock);
> -
>         return true;
>  }
>
> @@ -734,13 +725,11 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
>  static int ast_i2c_do_msgs_xfer(struct ast_i2c_bus *bus,
>                                 struct i2c_msg *msgs, int num)
>  {
> -       unsigned long flags;
>         int i, ret = 0;
>         u32 err, cmd;
>
>         for (i = 0; i < num; i++) {
>
> -               spin_lock_irqsave(&bus->cmd_lock, flags);
>                 bus->msg = &msgs[i];
>                 bus->msg_pos = 0;
>                 bus->query_len = bus->msg->flags & I2C_M_RECV_LEN;
> @@ -749,18 +738,15 @@ static int ast_i2c_do_msgs_xfer(struct ast_i2c_bus *bus,
>                 init_completion(&bus->cmd_complete);
>
>                 ast_i2c_do_byte_xfer(bus);
> -               spin_unlock_irqrestore(&bus->cmd_lock, flags);
>
>                 ret = wait_for_completion_interruptible_timeout(
>                                         &bus->cmd_complete,
>                                         bus->adap.timeout * HZ);
>
> -               spin_lock_irqsave(&bus->cmd_lock, flags);
>                 err = bus->cmd_err;
>                 cmd = bus->cmd_sent;
>                 bus->cmd_sent = 0;
>                 bus->msg = NULL;
> -               spin_unlock_irqrestore(&bus->cmd_lock, flags);
>
>                 if (!ret) {
>                         dev_dbg(bus->dev, "controller timed out\n");
> @@ -831,14 +817,11 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
>  static int ast_i2c_reg_slave(struct i2c_client *client)
>  {
>         struct ast_i2c_bus *bus;
> -       unsigned long flags;
>         u32 addr_reg_val;
>         u32 func_ctrl_reg_val;
>
>         bus = client->adapter->algo_data;
> -       spin_lock_irqsave(&bus->cmd_lock, flags);
>         if (bus->slave) {
> -               spin_unlock_irqrestore(&bus->cmd_lock, flags);
>                 return -EINVAL;
>         }
>
> @@ -856,20 +839,16 @@ static int ast_i2c_reg_slave(struct i2c_client *client)
>
>         bus->slave = client;
>         bus->slave_state = AST_I2C_SLAVE_STOP;
> -       spin_unlock_irqrestore(&bus->cmd_lock, flags);
>         return 0;
>  }
>
>  static int ast_i2c_unreg_slave(struct i2c_client *client)
>  {
>         struct ast_i2c_bus *bus = client->adapter->algo_data;
> -       unsigned long flags;
>         u32 addr_reg_val;
>         u32 func_ctrl_reg_val;
>
> -       spin_lock_irqsave(&bus->cmd_lock, flags);
>         if (!bus->slave) {
> -               spin_unlock_irqrestore(&bus->cmd_lock, flags);
>                 return -EINVAL;
>         }
>
> @@ -880,7 +859,6 @@ static int ast_i2c_unreg_slave(struct i2c_client *client)
>         ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
>
>         bus->slave = NULL;
> -       spin_unlock_irqrestore(&bus->cmd_lock, flags);
>         return 0;
>  }
>  #endif
> @@ -933,7 +911,6 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
>         }
>
>         /* Initialize the I2C adapter */
> -       spin_lock_init(&bus->cmd_lock);
>         bus->adap.nr = bus_num;
>         bus->adap.owner = THIS_MODULE;
>         bus->adap.retries = 0;
> --
> 2.11.0
>
