Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svLKh49ZvzDsrd
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 04:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fTQI6q9N; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id e12so3922085oib.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=T6rZHU9JxnNoDbHPIvGu23l60Y+Nn1W4l1MZDyNoLKM=;
 b=fTQI6q9NBN+zBXgo25VS77UWJzueIeRZznql3eqRTNFGS5M6FLDcWn60TpscxsU0Um
 FyHu7esvfy9GH4mlqqYN43AVWIUAmybjPUhY/B/vSvH6BrtqxghvHS2VISjE6jY2ktyv
 D+tYiH1PIHTSDiisIwP/23GH478CFWUxl7FMMmSTg7QFOx4zPDRF63q+ZSo/MBIbey1Q
 SsrgS/GCmNILf+HCfuqut1fSaoYLeV++r/l+wDe7unvH3a7yQ5xHdvH/paS/dJNKeDR6
 uLesc5Kzp83Kyf6sFo2kwI5JkUTj4NMN3JXWH2TFu2ogL5/mOSugpLs3SJzHb4t3hVfo
 1AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=T6rZHU9JxnNoDbHPIvGu23l60Y+Nn1W4l1MZDyNoLKM=;
 b=ML9i3gnmEaU4LCk0QpzGeEfbEJZLSlmC6ep48RdFGuK639QSMAudw1tX6xK3xGUczA
 tSEKFC5XeWjb7wMsydQuTeyc4t5EiqUIqQS8y8KnH144Npbj83r7dK8rYV4OCui3ic5C
 cEYLJ5DOTKO9J7OoP4tnyXpzwvATI2DYpyU2dv840935lQfgm4gAVWm3bOnEgV1Ezxdu
 wiuPs/i+7GrLG4mrydx6EZKgxWZlFV1KM5NUGwX4wVFoUWepb7M3TU2wVVpH+jG0qPsi
 EALULkXtPoUG3IDrgTSZTeq+300WWGBEeZGfwjCEU0G8YrQvHofo8V3hnNL2emGm3276
 Bgyg==
X-Gm-Message-State: AA6/9Rl0uIukW4/7Lwc+esDPy35QN0+rEhUzkbF5z8m2MZKRCnT4nCoTqaLobmAHFp//0O+rA9/ZoDg4xKQIoQ==
X-Received: by 10.202.117.66 with SMTP id q63mr1344332oic.185.1476292982541;
 Wed, 12 Oct 2016 10:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Wed, 12 Oct 2016 10:23:01 -0700 (PDT)
In-Reply-To: <337bc0ed-9f0c-afb3-d35d-3962ab7a17b7@ozlabs.org>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
 <337bc0ed-9f0c-afb3-d35d-3962ab7a17b7@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 12 Oct 2016 12:23:01 -0500
Message-ID: <CAA0LjjV8OJFNesgcebxwhWBJkT_i2ZLnG-8HFzp8nE7WqP+3qQ@mail.gmail.com>
Subject: Re: [PATCH linux v3 17/18] drivers/fsi: Add GPIO master functionality
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Wed, 12 Oct 2016 17:23:05 -0000

On Tue, Oct 11, 2016 at 7:34 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +static void add_crc(struct fsi_gpio_msg *cmd)
>> +{
>> +
>> +}
>
> I'll send you some code to help with implementing this...
>
>> +
>> +static void set_clock(struct fsi_master_gpio *master)
>> +{
>> +     /* This delay is required - do not remove */
>
> We probably don't need these comments, as 'do not remove' applies to
> most of the code here :)
>

OK, will remove those comments.

>> +static void set_sda_input(struct fsi_master_gpio *master)
>> +{
>> +     gpiod_direction_input(master->gpio_data);
>> +     gpiod_direction_output(master->gpio_trans, 0);
>> +}
>> +
>> +static void set_sda_output(struct fsi_master_gpio *master,
>> +                        int value)
>> +{
>> +     gpiod_direction_output(master->gpio_data, value);
>> +     gpiod_direction_output(master->gpio_trans, 1);
>> +}
>
> These should be conditional on gpio_trans != NULL.
>

Will fix.

>> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
>
> Can we have the number of bits to receive a separate parameter? This
> means we don't need a dual-use *cmd argument, and won't have subtle bugs
> arise where a caller has not initialised it.
>

Would you suggest having a separate buffer passed in as well to store the
serialized in data or use the struct fsi_gpio_msg  msg field?

>> +{
>> +     uint8_t bit;
>> +     uint64_t msg = 0;
>> +     uint8_t in_bit = 0;
>> +
>> +     set_sda_input(master);
>> +
>> +     for (bit = 0; bit < cmd->bits; bit++) {
>> +             clock_toggle(master, 1);
>> +             in_bit = sda_in(master);
>> +             msg |= in_bit;
>> +             msg <<= 1;
>> +     }
>
> I think you want the shift before the |=, otherwise your last bit won't
> be at the end of msg. More on that below though...
>

Ah right, ok will fix.

>> +     cmd->msg = ~msg;                /*  Data is negative active */
>> +}
>> +
>> +static void serial_out(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
>
> Really minor: make *cmd a `const struct fsi_gpio_msg *`.
>

Will fix.

>> +{
>> +     uint8_t bit;
>> +     uint64_t msg = ~cmd->msg;       /* Data is negative active */
>> +     uint64_t sda_mask = 1;
>> +     uint64_t last_bit = ~0;
>> +
>> +     set_sda_output(master, 0);
>> +
>> +     /* Send the start bit */
>> +     sda_out(master, 1);
>> +     clock_toggle(master, 1);
>> +
>> +     /* Send the message */
>> +     for (bit = 0; bit < cmd->bits; bit++) {
>> +             if (last_bit ^ (msg & sda_mask)) {
>> +                     sda_out(master, msg & sda_mask);
>> +                     last_bit = msg & sda_mask;
>> +             }
>> +             clock_toggle(master, 1);
>> +             msg >>= 1;
>> +     }
>> +}
>
> These functions seem incompatible.
>
> serial_in clocks the least-significant-bit last, while serial_out clocks
> the least-significant-bit first.
>
> The comment on struct fsi_message is:
>
>   /* Our structure for bit-wise message sending. We left-align this, so the
>    * last bit sent is at the 0x1 mask position.
>    */
>   struct fsi_gpio_msg {
>         uint64_t        msg;
>         uint8_t         bits;
>   };
>
> - which (I think) matches the message layout described by the docs. If
> we use that format, we'll need to clock the LSb *last*. We'll also need
> to start sending from the appropriate bit in the uint64_t, as the bits
> in msg are left-aligned (ie, messages shorter than 64 bits do not use
> the least-significant-bits).
>
> I'm happy if you'd prefer to change that to right-aligned if that makes
> message construction easier, but we need to be consistent (and update
> the comment to suit).
>

Right, my serial out was mirror imaged.  Will fix.  I modified my existing
prototype serial_out code for this patch and introduced this bug in the
process.  No, I agree we should keep it all left aligned.  I'll keep in mind
we need to start on the appropriate bit in the uint64_t.

> Also, you do `msg & sda_mask` three times in three lines there.
>

Will fix.

>> +/*
>> + * Store information on master errors so handler can detect and clean
>> + * up the bus
>> + */
>> +static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
>> +{
>> +
>> +}
>
> I know this is a todo, but where are you planning to 'store' this
> information? Shouldn't errors just be returned immediately?

This is intended to be the entry point for the bus error handling code.
I could return the failing rc to the caller right there but ultimately the
error handler needs to be invoked somewhere in the call chain
anyway.  As it is here the error condition is cleaned up as early as
possible.

Even if the error is of a master type - such as master
time out errors (MTOE) there is still a possibility that the connected
slave is in some latched failed state which requires recovery to
resume normal bus communications (issue a terminate command
to slave, etc...)

>
>> +
>> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>> +                     uint8_t size, void *data)
>> +{
>> +     int busy_count = 0, i;
>> +     struct fsi_gpio_msg response, cmd;
>> +     int bits_remaining = 0;
>> +
>> +     do {
>> +             response.msg = 0;
>> +             response.bits = 1;
>> +             for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
>> +                     serial_in(master, &response);
>> +                     if (response.msg)
>> +                             break;
>> +             }
>> +             if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {
>> +                     dev_info(master->master.dev,
>> +                             "Master time out waiting for response\n");
>> +                     drain_response(master);
>> +                     fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>> +                     return FSI_GPIO_MTOE;
>> +             }
>> +
>> +             /* Response received */
>> +             response.msg = 0;
>> +             response.bits = 2;
>> +             serial_in(master, &response);
>> +             dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
>> +
>> +             response.msg = 0;
>> +             response.bits = 2;
>> +             serial_in(master, &response);
>> +             dev_info(master->master.dev, "response id:%d\n",
>> +                                                     (int)response.msg);
>> +
>> +             switch (response.msg) {
>> +             case FSI_GPIO_RESP_ACK:
>> +                     if (expected == FSI_GPIO_RESP_ACKD)
>> +                             bits_remaining = 8 * sizeof(size);
>> +                     break;
>> +
>> +             case FSI_GPIO_RESP_BUSY:
>> +                     /*
>> +                      * Its necessary to clock slave before issuing
>> +                      * d-poll, not indicated in the hardware protocol
>> +                      * spec. < 20 clocks causes slave to hang, 21 ok.
>> +                      */
>> +                     set_sda_output(master, 0);
>> +                     clock_toggle(master, FSI_GPIO_DPOLL_CLOCKS);
>> +                     cmd.msg = FSI_GPIO_CMD_DPOLL;
>> +                     cmd.bits = FSI_GPIO_CMD_DPOLL_SIZE;
>> +                     serial_out(master, &cmd);
>> +                     continue;
>> +
>> +             case FSI_GPIO_RESP_ERRA:
>> +             case FSI_GPIO_RESP_ERRC:
>> +                     dev_info(master->master.dev, "ERR received: %d\n",
>> +                             (int)response.msg);
>> +                     drain_response(master);
>> +                     fsi_master_gpio_error(master, response.msg);
>> +                     return response.msg;
>> +             }
>> +
>> +             /* Read in the data field if applicable */
>> +             if (bits_remaining) {
>> +                     response.msg = 0;
>> +                     response.bits = bits_remaining;
>> +                     serial_in(master, &response);
>> +             }
>> +
>> +             /* Read in the crc and check it */
>> +             response.msg = 0;
>> +             response.bits = FSI_GPIO_CRC_SIZE;
>> +             serial_in(master, &response);
>> +
>> +             /* todo: verify crc is correct, flag error if not */
>> +
>> +             return 0;
>> +
>> +     } while (busy_count++ < FSI_GPIO_MAX_BUSY);
>> +
>> +     return busy_count;
>> +}
>> +
>> +static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>> +                     uint8_t slave, uint32_t addr, size_t size,
>> +                     const void *data)
>> +{
>> +     cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
>> +     cmd->msg = FSI_GPIO_CMD_DEFAULT;
>> +     cmd->msg |= mode;
>> +
>> +     /* todo: handle more than just slave id 0 */
>> +     cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
>> +
>> +     cmd->msg |= (addr << FSI_GPIO_CMD_ADDR_SHIFT);
>> +     if (size == sizeof(uint8_t)) {
>> +             if (data)
>> +                     cmd->msg |=
>> +                             *((uint8_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
>> +     } else if (size == sizeof(uint16_t)) {
>> +             cmd->msg |= FSI_GPIO_CMD_SIZE_16;
>> +             if (data)
>> +                     cmd->msg |=
>> +                             *((uint16_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
>> +     } else {
>> +             cmd->msg |= FSI_GPIO_CMD_SIZE_32;
>> +             if (data)
>> +                     cmd->msg |=
>> +                             *((uint32_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
>> +     }
>> +     if (mode == FSI_GPIO_CMD_WRITE)
>> +             cmd->bits += (8 * size);
>> +
>> +     add_crc(cmd);
>> +}
>> +
>
> The message construction will be dependent on the format of struct
> fsi_msg, so this may need to be updated if that changes from the above
> comments.
>

OK will keep that in mind.  Would like to hear your thoughts on my above
questions before I make any changes here.

>>  static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>>               uint8_t slave, uint32_t addr, void *val, size_t size)
>>  {
>>       struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>> +     struct fsi_gpio_msg cmd;
>> +     int rc;
>>
>>       if (link != 0)
>>               return -ENODEV;
>>
>> -     /* todo: format read into a message, send, poll for response */
>> -     (void)master;
>> +     /* Send the command */
>> +     build_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
>> +     serial_out(master, &cmd);
>> +     echo_delay(master);
>>
>> +     rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
>>
>> -     return 0;
>> +     return rc;
>>  }
>>
>>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>>               uint8_t slave, uint32_t addr, const void *val, size_t size)
>>  {
>> +     int rc;
>>       struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>> +     struct fsi_gpio_msg cmd;
>>
>>       if (link != 0)
>>               return -ENODEV;
>>
>> -     /* todo: format write into a message, send, poll for response */
>> -     (void)master;
>> +     /* Send the command */
>> +     build_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
>> +     serial_out(master, &cmd);
>> +     echo_delay(master);
>>
>> -     return 0;
>> +     rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
>> +
>> +     return rc;
>>  }
>>
>>  /*
>> @@ -58,14 +349,40 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>>  static int fsi_master_gpio_break(struct fsi_master *_master, int link)
>>  {
>>       struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>> +     uint32_t smode;
>> +     int rc;
>>
>>       if (link != 0)
>>               return -ENODEV;
>>
>> -     /* todo: send the break pattern over gpio */
>> -     (void)master;
>> +     set_sda_output(master, 0);
>> +     clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
>>
>> -     return 0;
>> +     sda_out(master, 1);
>> +     clock_toggle(master, FSI_BREAK_CLOCKS);
>> +
>> +     echo_delay(master);
>> +
>> +     sda_out(master, 0);
>> +     clock_toggle(master, FSI_POST_BREAK_CLOCKS);
>> +
>> +     udelay(200);            /* wait for logic reset to take effect */
>> +     rc = _master->read(_master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
>> +                     &smode, sizeof(smode));
>
> No need to use the callback, we know that this is a GPIO master.
>

OK will fix.

>> +     dev_info(_master->dev, "smode after break:%08x rc:%d\n", smode, rc);
>
> Use dev_dbg() here. We don't want printk output for normal operations
> for non-debug.
>

Will change.

>> +
>> +     return rc;
>> +}
>> +
>> +static void fsi_master_gpio_init(struct fsi_master_gpio *master)
>> +{
>> +     gpiod_direction_output(master->gpio_mux, 1);
>> +     gpiod_direction_output(master->gpio_clk, 1);
>> +     set_sda_output(master, 1);
>> +     gpiod_direction_output(master->gpio_enable, 0);
>> +
>> +     /* todo: evaluate if clocks can be reduced */
>> +     clock_toggle(master, FSI_INIT_CLOCKS);
>>  }
>>
>>  static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
>> @@ -75,8 +392,7 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
>>       if (link != 0)
>>               return -ENODEV;
>>
>> -     /* todo: set the enable pin */
>> -     (void)master;
>> +     gpiod_set_value(master->gpio_enable, 1);
>>
>>       return 0;
>>  }
>> @@ -100,11 +416,28 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>>               return PTR_ERR(gpio);
>>       master->gpio_data = gpio;
>>
>> +     gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
>> +     if (IS_ERR(gpio))
>> +             return PTR_ERR(gpio);
>> +     master->gpio_trans = gpio;
>> +
>> +     gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
>> +     if (IS_ERR(gpio))
>> +             return PTR_ERR(gpio);
>> +     master->gpio_enable = gpio;
>> +
>> +     gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
>> +     if (IS_ERR(gpio))
>> +             return PTR_ERR(gpio);
>> +     master->gpio_mux = gpio;
>> +
>
> trans, enable and mux should be optional, right?
>

Right, I had sent a question via slack to you regarding how to code this up.
Should the mandatory and optional specifics be placed in the dev tree code
in arch/arm/boot/*dts  ?  Also any basic examples you could point me to
would be appreciated.  Which of the platforms would you recommend I
adjust this for?  I suppose just Witherspoon for now.

Thanks for your feedback.
Chris

> Cheers,
>
>
> Jeremy
