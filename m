Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBxKS4nSJzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 18:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UqOYOfUP"; 
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id c45so133680912qtb.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=G/7JDs+wR7kJOyXRSgSlWPEM3Z8LlDQfnSrU/wkm9hQ=;
 b=UqOYOfUP80NGi+c8jGxpBOT/6SyOC1TuuWwCuS8vWgWQ8c7VoV+nIxSJWLIq4nCpig
 hSmVlHiYsu5wvwv5I5vUycExbKloFAHztdPkgzfiTlIs+0J2SHfoEiO43B9wmCb5hPXL
 jdw4SOqdgyweSqhT89tEabYYRmOPiGexq1RSiZhY64Y6nBJHufKkC1bCG/pOuJPR9LL6
 u+u4iozFPGVyOnoeD4y92MH/WfJhNBNCLPioHmJaVmJSWz7DO5zt1PvtPzWFh/39axV0
 D639DSRJCia9K7viV7Vo20A1fByswp6P7yA9qJb8LF7gKN6NnhcFH6orqw+NR5Ry9uot
 g7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=G/7JDs+wR7kJOyXRSgSlWPEM3Z8LlDQfnSrU/wkm9hQ=;
 b=CsfOwDm3mcCVqfV2+SUNAvtN3t5OfSvICMneQq7UzKcnBeXYiHuFFq5/741b9eyydJ
 HosdUAaH/fwfwtCJtYIgA9iSeA2RvzNHEfmIA/2UQ7xly93SXkDTw+6QmVeIYoLBphP0
 xUnp+hODwXvWjvlpZMZLhG5jQfiPgqQV7Af7e4dFH6K7qhlnRoHawF3wbZO9uppdqfHs
 QZP2VyZ0RGQEK4LVeQ5DDucG3PuMAhB+8y5De2+bZxaYh+SfKqG/R6cuuoDur2Uvfk2w
 scGIAmeOUX2pNw+wX4lEhf+anchRMsV1XBNcp9tBNwajzUc/iRkXevo0gTjJDyKte/JU
 Vlpw==
X-Gm-Message-State: AN3rC/4HjyImi873ua05kdPDGiN7cNgIL4q8mah+vBRENrg0do8SziSv
 JBKWiWRc4PNeCmqlE+7pyaEy4dxQClUO
X-Received: by 10.200.57.18 with SMTP id s18mr28701776qtb.1.1493109145050;
 Tue, 25 Apr 2017 01:32:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Tue, 25 Apr 2017 01:32:24 -0700 (PDT)
In-Reply-To: <1493086747.25766.264.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-5-brendanhiggins@google.com>
 <1490945610.3177.229.camel@kernel.crashing.org>
 <CAFd5g45DQZz99y59AY-4465qnM+tRv6+bDdGQqS6VYHEfRfjDg@mail.gmail.com>
 <1493086747.25766.264.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Apr 2017 01:32:24 -0700
Message-ID: <CAFd5g44ioW0PdFVOhY-ep8TXBNg6qC7E5yjOVf3MEdY9bPgEDA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Tue, 25 Apr 2017 08:32:29 -0000

Adding Ryan.

On Mon, Apr 24, 2017 at 7:19 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Mon, 2017-04-24 at 11:56 -0700, Brendan Higgins wrote:
>> > > +struct aspeed_i2c_bus {
>> > > +     struct i2c_adapter              adap;
>> > > +     struct device                   *dev;
>> > > +     void __iomem                    *base;
>> > > +     /* Synchronizes I/O mem access to base. */
>> > > +     spinlock_t                      lock;
>> >
>> > I am not entirely convinced we need that lock. The i2c core will
>> > take a mutex protecting all operations on the bus. So we only need
>> > to synchronize between our "xfer" code and our interrupt handler.
>>
>> You are right if both having slave and master active at the same time
>> was not possible; however, it is.
>
> Right, I somewhat forgot about the slave case.
>
>   ...
>
>> > Some of those error states probably also warrant a reset of the
>> > controller,
>> > I think aspeed does that in the SDK.
>>
>> For timeout and cmd_err, I do not see any argument against it; it
>> sounds like we are in a very messed up, very unknown state, so full
>> reset is probably the best last resort.
>
> Yup.
>
>> For SDA staying pulled down, I
>> think we can say with reasonable confidence that some device on our
>> bus is behaving very badly and I am not convinced that resetting the
>> controller is likely to do anything to help;
>
> Right. Hammering with STOPs and pray ...

I think sending recovery mode sends stops as a part of the recovery
algorithm it executes.

>
>>  that being said, I really
>> do not have any good ideas to address that. So maybe praying and
>> resetting the controller is *the most reasonable thing to do.* I
>> would like to know what you think we should do in that case.
>
> Well, there's a (small ?) chance that it's a controller bug asserting
> the line so ... but there's little we can do if not.

True.

>
>> While I was thinking about this I also realized that the SDA line
>> check after recovery happens in the else branch, but SCL line check
>> does not happen after we attempt to STOP if SCL is hung. If we decide
>> to make special note SDA being hung by a device that won't let go, we
>> might want to make a special note that SCL is hung by a device that
>> won't let go. Just a thought.
>
> Maybe. Or just "unrecoverable error"... hopefully these don't happen
> too often ... We had cases of a TPM misbehaving like that.

Yeah, definitely should print something out.

>
>> > > +out:
>>
>> ...
>> > What about I2C_M_NOSTART ?
>> >
>> > Not that I've ever seen it used... ;-)
>>
>> Right now I am not doing any of the protocol mangling options, but I
>> can add them in if you think it is important for initial support.
>
> No, not important, we can add that later if it ever becomes useful.
>
>  ...
>
>> > In general, you always ACK all interrupts first. Then you handle
>> > the bits you have harvested.
>> >
>>
>> The documentation says to ACK the interrupt after handling in the RX
>> case:
>>
>> <<<
>> S/W needs to clear this status bit to allow next data receiving.
>> > > >
>>
>> I will double check with Ryan to make sure TX works the same way.
>>
>> > > +     if (irq_status & ASPEED_I2CD_INTR_ERROR ||
>> > > +         (!bus->msgs && bus->master_state !=
>> > > ASPEED_I2C_MASTER_STOP)) {
>>
>> ...
>> >
>> > I would set master_state to "RECOVERY" (new state ?) and ensure
>> > those things are caught if they happen outside of a recovery.
>
> I replied privately ... as long as we ack before we start a new command
> we should be ok but we shouldn't ack after.
>
> Your latest patch still does that. It will do things like start a STOP
> command *then* ack the status bits. I'm pretty sure that's bogus.
>
> That way it's a lot simpler to simply move the
>
>         writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
>
> To either right after the readl of the status reg at the beginning of
> aspeed_i2c_master_irq().
>
> I would be very surprised if that didn't work properly and wasn't much
> safer than what you are currently doing.

I think I tried your way and it worked. In anycase, Ryan will be able
to clarify for us.

>
>> Let me know if you still think we need a "RECOVERY" state.
>
> The way you just switch to stop state and store the error for later
> should work I think.
>
>> >
>> > > +     if (bus->master_state == ASPEED_I2C_MASTER_START) {
>>
>> ...
>> >
>> > > +                     dev_dbg(bus->dev,
>> > > +                             "no slave present at %02x", msg-
>> > > >addr);
>> > > +                     status_ack |= ASPEED_I2CD_INTR_TX_NAK;
>> > > +                     bus->cmd_err = -EIO;
>> > > +                     do_stop(bus);
>> > > +                     goto out_no_complete;
>> > > +             } else {
>> > > +                     status_ack |= ASPEED_I2CD_INTR_TX_ACK;
>> > > +                     if (msg->flags & I2C_M_RD)
>> > > +                             bus->master_state =
>> > > ASPEED_I2C_MASTER_RX;
>> > > +                     else
>> > > +                             bus->master_state =
>> > > ASPEED_I2C_MASTER_TX_FIRST;
>> >
>> > What about the SMBUS_QUICK case ? (0-len transfer). Do we need
>> > to handle this here ? A quick look at the TX_FIRST case makes
>> > me think we are ok there but I'm not sure about the RX case.
>>
>> I did not think that there is an SMBUS_QUICK RX. Could you point me
>> to an example?
>
> Not so much an RX, it's more like you are sending a 1-bit data in
> the place of the Rd/Wr bit. So you have a read with a lenght of 0,
> I don't think in that case you should set ASPEED_I2CD_M_RX_CMD in
> __aspeed_i2c_do_start

Forget what I said, I was just not thinking about the fact that SMBus
emulation causes the data bit to be encoded as the R/W flag. I see
what you are saying; you are correct.

>
>> > I'm not sure the RX case is tight also. What completion does the
>> > HW give you for the address cycle ? Won't you get that before it
>> > has received the first character ? IE. You fall through to
>> > the read case of the state machine with the read potentially
>> > not complete yet no ?
>>
>> ...
>> > > +     case ASPEED_I2C_MASTER_RX:
>> > > +             if (!(irq_status & ASPEED_I2CD_INTR_RX_DONE)) {
>> > > +                     dev_err(bus->dev, "master failed to RX");
>> > > +                     goto out_complete;
>> > > +             }
>> >
>> > See my comment above for a bog standard i2c_read. Aren't you
>> > getting
>> > the completion for the address before the read is even started ?
>>
>> In practice no, but it is probably best to be safe :-)
>
> Yup :)
>> >
>> > > +             status_ack |= ASPEED_I2CD_INTR_RX_DONE;
>> > > +
>> > > +             recv_byte = aspeed_i2c_read(bus,
>> > > ASPEED_I2C_BYTE_BUF_REG) >> 8;
>> > > +             msg->buf[bus->buf_index++] = recv_byte;
>> > > +
>> > > +             if (msg->flags & I2C_M_RECV_LEN &&
>> > > +                 recv_byte <= I2C_SMBUS_BLOCK_MAX) {
>> > > +                     msg->len = recv_byte +
>> > > +                                     ((msg->flags &
>> > > I2C_CLIENT_PEC) ? 2 : 1);
>>
>> ...
>> > > +     return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
>> > > +             & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
>> > > +                     | ((clk_low <<
>> > > ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
>> > > +                        & ASPEED_I2CD_TIME_SCL_LOW_MASK)
>> > > +                     | (base_clk &
>> > > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
>> > > +}
>> >
>> > As I think I mentioned earlier, the AST2500 has a slightly
>> > different
>> > register layout which support larger values for high and low, thus
>> > allowing a finer granularity.
>>
>> I am developing against the 2500.
>
> Yes but we'd like the driver to work with both :-)

Right, I thought you were making an assertion about the 2500, if you
are making an assertion about the 2400, I do not know and do not have
one handy.

>
>> > BTW. In case you haven't, I would suggest you copy/paste the above
>> > in
>> > a userspace app and run it for all frequency divisors and see if
>> > your
>> > results match the aspeed table :)
>>
>> Good call.
>
> If you end up doing that, can you shoot it my way ? I can take care
> of making sure it's all good for the 2400.

Will do.

>
>> > > +static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
>> > > +                            struct platform_device *pdev)
>> > > +{
>> > > +     u32 clk_freq, divisor;
>> > > +     struct clk *pclk;
>> > > +     int ret;
>> > > +
>> > > +     pclk = devm_clk_get(&pdev->dev, NULL);
>> > > +     if (IS_ERR(pclk)) {
>> > > +             dev_err(&pdev->dev, "clk_get failed\n");
>> > > +             return PTR_ERR(pclk);
>> > > +     }
>> > > +     ret = of_property_read_u32(pdev->dev.of_node,
>> > > +                                "clock-frequency", &clk_freq);
>> >
>> > See my previous comment about calling that 'bus-frequency' rather
>> > than 'clock-frequency'.
>> >
>> > > +     if (ret < 0) {
>> > > +             dev_err(&pdev->dev,
>> > > +                     "Could not read clock-frequency
>> > > property\n");
>> > > +             clk_freq = 100000;
>> > > +     }
>> > > +     divisor = clk_get_rate(pclk) / clk_freq;
>> > > +     /* We just need the clock rate, we don't actually use the
>> > > clk object. */
>> > > +     devm_clk_put(&pdev->dev, pclk);
>> > > +
>> > > +     /* Set AC Timing */
>> > > +     if (clk_freq / 1000 > 1000) {
>> > > +             aspeed_i2c_write(bus, aspeed_i2c_read(bus,
>> > > +                                                   ASPEED_I2C_FU
>> > > N_CTRL_REG) |
>> > > +                             ASPEED_I2CD_M_HIGH_SPEED_EN |
>> > > +                             ASPEED_I2CD_M_SDA_DRIVE_1T_EN |
>> > > +                             ASPEED_I2CD_SDA_DRIVE_1T_EN,
>> > > +                             ASPEED_I2C_FUN_CTRL_REG);
>> > > +
>> > > +             aspeed_i2c_write(bus, 0x3,
>> > > ASPEED_I2C_AC_TIMING_REG2);
>> > > +             aspeed_i2c_write(bus,
>> > > aspeed_i2c_get_clk_reg_val(divisor),
>> > > +                              ASPEED_I2C_AC_TIMING_REG1);
>> >
>> > I already discussed by doubts about the above. I can try to scope
>> > it with the EVB if you don't get to it. For now I'd rather take the
>> > code out.
>> >
>> > We should ask aspeed from what frequency the "1T" stuff is useful.
>>
>> Will do, I will try to rope Ryan in on the next review; it will be
>> good for him to get used to working with upstream anyway.
>
> Yup. However, for the sake of getting something upstream (and in
> OpenBMC 4.10 kernel) asap, I would suggest just dropping support
> for those fast speeds for now, we can add them back later.

Alright, that's fine. Still, Ryan, could you provide some context on this?

>
>> >
>> > > +     } else {
>> > > +             aspeed_i2c_write(bus,
>> > > aspeed_i2c_get_clk_reg_val(divisor),
>> > > +                              ASPEED_I2C_AC_TIMING_REG1);
>> > > +             aspeed_i2c_write(bus, ASPEED_NO_TIMEOUT_CTRL,
>> > > +                              ASPEED_I2C_AC_TIMING_REG2);
>> > > +     }
>>
>> ...
>> > > +     spin_lock_init(&bus->lock);
>> > > +     init_completion(&bus->cmd_complete);
>> > > +     bus->adap.owner = THIS_MODULE;
>> > > +     bus->adap.retries = 0;
>> > > +     bus->adap.timeout = 5 * HZ;
>> > > +     bus->adap.algo = &aspeed_i2c_algo;
>> > > +     bus->adap.algo_data = bus;
>> > > +     bus->adap.dev.parent = &pdev->dev;
>> > > +     bus->adap.dev.of_node = pdev->dev.of_node;
>> > > +     snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed
>> > > i2c");
>> >
>> > Another trivial one, should we put some kind of bus number
>> > in that string ?
>>
>> Whoops, looks like I missed this one; I will get to it in the next
>> revision.
>
> Ok. I noticed you missed that in v7, so I assume you mean v8 :-)

Yep, I will get it in v8.

>
>> >
>> > > +     bus->dev = &pdev->dev;
>> > > +
>> > > +     /* reset device: disable master & slave functions */
>> > > +     aspeed_i2c_write(bus, 0, ASPEED_I2C_FUN_CTRL_REG);
>>
>> ...
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
