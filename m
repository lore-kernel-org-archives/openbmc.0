Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syMyJ2yRtzDt3H
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 02:46:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=II5BTh//; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so12644033oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2Pfh7pDORYrshY6L68xWEQskfAUcXfMBFkdkHSekR5w=;
 b=II5BTh//SP2z77IhTofoK2rXbtv3sEP8QXLqdlWQ43TrYv64DAKGzQrQe9jKo+GCUf
 36jJvkC20wuPQ5mVCL6EGn142znDgX9WlLpnbd/Jp80IBWb4hSidRF4dO9V7dn4fFkhl
 yVvSlgOQQtWcirX1fVsq3zBar4za7viE5oUpXLF1vnBxj1gZHtpI3pM0BvRW4Zggc7hs
 lTV6lRSHUQYLePCRYuPFTaDnxCjKcIEyLUWaVu7pSGxh3tcMOQIf6ESWyl5hCtSdiyWi
 tywZvZHktKp67WrJ4KoURAsIW/VuzHDYT3wYTe/SAeScrIKct3lp0MOldkr2TdPSYaw9
 IxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2Pfh7pDORYrshY6L68xWEQskfAUcXfMBFkdkHSekR5w=;
 b=JW6f+UPvqNt04ihqRtlxeYITx2sHIsRed5dagfp+PW5PpCRvcWmZAdI2fC/3X9JKx5
 ENjI7ViiizrDXTVMiDmjbjxjkHXkULwFxBNGNaZKO+6JJ6TRiecFMOHa97LsRhTkk4yh
 Gy3vyhhrBsPqK+47KPL1mgG2sx0lU/VeqTJSr2qu1C2Yl0d4N2XGiR+Q4V3zbjX6Oc6Z
 c93ZHC3deaCj9vWEBeAvatFwzm4rYnYgrClxRiqs888A+kG9Rhzk8RzvK+aPzEPgUnjt
 vUDjZVkqpa1tX3uGkI/iRax8NEgJ23wU3/h9rFZv91Ld70H9Qn1pZRYv1+ncZbivPTnL
 pIxw==
X-Gm-Message-State: AA6/9RkyyTqrG4CuYvHAj8rPjy4QG0FT3LnmezyRe31Tbtnv7n0yG2V5lKiS168hKgI7DteQ8gRgW3ILSPdjbg==
X-Received: by 10.157.0.38 with SMTP id 35mr13254128ota.24.1476719205528; Mon,
 17 Oct 2016 08:46:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 08:46:44 -0700 (PDT)
In-Reply-To: <9b23c5de-57bb-d7ed-172b-2b647fb23429@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-19-git-send-email-christopher.lee.bostic@gmail.com>
 <9b23c5de-57bb-d7ed-172b-2b647fb23429@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 10:46:44 -0500
Message-ID: <CAA0LjjXpoYCenycEFt2NxcWd=Msv-dOqdAHRVXyPbg145v-HYg@mail.gmail.com>
Subject: Re: [PATCH linux v4 18/20] drivers/fsi: Add GPIO FSI master
 functionality
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
X-List-Received-Date: Mon, 17 Oct 2016 15:46:49 -0000

On Mon, Oct 17, 2016 at 2:28 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +
>> +     pin_clk {
>> +             gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
>> +             output-low;
>> +             line-name = "clk";
>
> The names "clk", "data", "trans", "enable" and "mux" are super generic,
> and could apply to any of the other bajillion functions on an AST chip.
> Should we use fsi-clk, fsi-data, etc?
>

Hi Jeremy,

Will rename as suggested.

>> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd,
>> +                     uint8_t num_bits)
>> +{
>> +     uint8_t bit;
>> +     uint64_t msg = 0;
>> +     uint8_t in_bit = 0;
>> +
>> +     set_sda_input(master);
>> +     cmd->bits = 0;
>> +
>> +     for (bit = 0; bit < num_bits; bit++) {
>> +             clock_toggle(master, 1);
>> +             in_bit = sda_in(master);
>> +             cmd->bits++;
>> +             msg <<= 1;
>> +             msg |= in_bit;
>> +     }
>> +     cmd->msg = ~msg;                /*  Data is negative active */
>
> Really minor: I'd do that logic inversion when you or-in the bit:
>
>                 msg |= ~in_bit & 0x1;
>
> (or even alter sda_in to suit).
>
> This means that that the unused bits (for messages less than 64 bits
> long) are left at zero, which will be slightly more readable when
> debugging.
>

OK, will change.

>> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>> +                     uint8_t size, void *data)
>> +{
>
> I haven't reviewed this for protocol correctness, as you're the FSI
> expert. I assume all is good :)
>

This works on prototype hardware per previous implementation.

>> +     int busy_count = 0, i;
>> +     struct fsi_gpio_msg response, cmd;
>> +     int bits_remaining = 0;
>> +     uint64_t resp = 0;
>> +     uint8_t bits_received = 1 + FSI_GPIO_MSG_ID_SIZE +s
>> +                             FSI_GPIO_MSG_RESPID_SIZE;
>> +     uint8_t crc_in;
>> +
>> +     do {
>> +             response.msg = 0;
>> +             for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
>> +                     serial_in(master, &response, 1);
>> +                     resp = response.msg;
>> +                     if (response.msg)
>> +                             break;
>> +             }
>> +             if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {
>
> No need for unlikely() here.
>

Will remove.

>> +                     dev_info(master->master.dev,
>> +                     "Master time out waiting for response\n");
>
> If you can (ie., without breaking the string), can you indent this
> continuation line?
>

OK, will indent.

>> +                     drain_response(master);
>> +                     fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>> +                     return FSI_GPIO_MTOE;
>
> What does the return value for this function represent? What's a 'busy
> count' and how does it relate to MTOE?
>

Busy in this case means the slave replied with 'BUSY' too many times and
never responded with anything else.  MTOE means the slave never responded
at all to any requests for information.

The idea is to have poll_for_response( ) return non-zero when some form
of response failure occurs.   The types of failures reported are:

Master timeout error (MTOE) - No response at all from slave after x attempts
Any Error (ERRA) - Slave returns an ERRA as response meaning you need to
   query the slave engine registers to find out what went wrong
CRC Error (ERRC) - Slave indicates that it didn't like the crc field the master
   sent.
CRC invalid - Master receives slave's crc and thinks its a garbled message
BUSY -  Slave responds with busy on d-poll and never responds with
   anything else.

One thing I can make clearer and will fix is that instead of returning
'busy_count'
I'll just return the literal FSI_GPIO_MAX_BUSY


>> +             }
>> +
>> +             /* Response received */
>> +             response.msg = 0;
>> +             serial_in(master, &response, FSI_GPIO_MSG_ID_SIZE);
>> +             dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
>> +             resp <<= FSI_GPIO_MSG_ID_SIZE;
>> +             resp |= response.msg;
>> +
>> +             response.msg = 0;
>> +             serial_in(master, &response, FSI_GPIO_MSG_RESPID_SIZE);
>> +             dev_info(master->master.dev, "response id:%d\n",
>> +                             (int)response.msg);
>> +             resp <<= FSI_GPIO_MSG_RESPID_SIZE;
>> +             resp |= response.msg;
>> +
>> +             switch (response.msg) {
>> +             case FSI_GPIO_RESP_ACK:
>> +                     if (expected == FSI_GPIO_RESP_ACKD)
>> +                             bits_remaining = 8 * size;
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
>
> Now I'm really confused about the return value :/

response.msg is going to be either ERRA or ERRC,  I just return the variable
so I don't have to do a check for what type of error.

>
>> +             }
>> +
>> +             /* Read in the data field if applicable */
>> +             if (bits_remaining) {
>> +                     response.msg = 0;
>> +                     serial_in(master, &response, bits_remaining);
>> +                     resp <<= bits_remaining;
>> +                     resp |= response.msg;
>> +                     bits_received += bits_remaining;
>> +             }
>> +
>> +             /* Read in the crc and check it */
>> +             response.msg = 0;
>> +             serial_in(master, &response, FSI_GPIO_CRC_SIZE);
>
> serial_in() should always set response.msg, right? Do we need to set this
> before every call?
>

True, will remove those.

>> +
>> +             crc_in = fsi_crc4(0, resp, bits_received);
>> +             if (crc_in != response.msg) {
>> +                     /* CRC's don't match */
>> +                     dev_info(master->master.dev, "ERR response CRC\n");
>> +                     fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
>> +                     return FSI_GPIO_CRC_INVAL;
>> +             }
>> +             return 0;
>> +
>> +     } while (busy_count++ < FSI_GPIO_MAX_BUSY);
>> +
>> +     return busy_count;
>> +}
>> +
>> +static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>> +             uint8_t slave, uint32_t addr, size_t size,
>> +             const void *data)
>
> Can we indicate that we're building an ABS_AR command here?
>

OK, will change the name to build_abs_ar_command().

> [A future optimisation for this driver would be to cache the last address
> used, and perform relative reads & writes if suitable...]
>


>> @@ -60,12 +368,31 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
>>       if (link != 0)
>>               return -ENODEV;
>>
>> -     /* todo: send the break pattern over gpio */
>> -     (void)master;
>> +     set_sda_output(master, 0);
>> +     clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
>> +     sda_out(master, 1);
>> +     clock_toggle(master, FSI_BREAK_CLOCKS);
>> +     echo_delay(master);
>> +     sda_out(master, 0);
>> +     clock_toggle(master, FSI_POST_BREAK_CLOCKS);
>> +     udelay(200);            /* Wait for logic reset to take effect */
>
> Minor: Better to put comments like this above their code:
>
>         /* Wait for logic reset to take effect */
>         udelay(200);
>

OK, will change.

Thanks,
-Chris


> Cheers,
>
>
> Jeremy
