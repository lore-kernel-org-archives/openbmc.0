Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::236; helo=mail-ot0-x236.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sN4EpDkA"; 
 dkim-atps=neutral
Received: from mail-ot0-x236.google.com (mail-ot0-x236.google.com
 [IPv6:2607:f8b0:4003:c0f::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMCK0240PzF0TZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 03:31:31 +1100 (AEDT)
Received: by mail-ot0-x236.google.com with SMTP id v5so6998266oth.5
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 08:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bQ7VWhIQ5jJGf5w/c5O7F68q2gK/of+jntoAJRQt4Cs=;
 b=sN4EpDkAbaNfRwHU7NimuiX9Pq1WrQiLpbD4PDoOclN28kjBNRF794THS7P8KuDzrq
 RZaZUwB+9mPPUy1oqwmdEKQJSLs4/0Ptl52WMzAy/cDj11XpJUmnNKELlOkP73Z9AXaK
 SSPESXJmrk0Nu71FwqV2bUjsbOav3Vg1eiGFjIFq/hjZ1abDlo46Ti6AVmAEO2ElzHa6
 QPy9FVWvXO0gkmng+wWIpqxckIsFmdn4nAeBYKpdi36EzjFnzLc7q3Z10WZ638B9WVW+
 LWU3PyL82jTkyr5eJS+wIlmc+vZjEjKOJ+mWAU9+tm+VLCN+JgIQ7CR1odDZ0plSZgUN
 uL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bQ7VWhIQ5jJGf5w/c5O7F68q2gK/of+jntoAJRQt4Cs=;
 b=JeIbigHbAGO7WIWDQ3PqZFLlbNRINiTjd+owWXbjWjphXUc5KN2En7ZS7RM25Ftha3
 vh9aGhCci9OWDTAAYoVVpZBiMHFcNT9TzYTqLsWJcN4VsrYF71VXLmRxfkf7y9YO9QVh
 kSg+kVlHyXvgMkULN7rDH+mYqesMjFgYIxFQoWr+zgklTAs4E1fJugBXZXz+ZsHTJHfb
 gnlBAlG5kpY+u5lZJlgIs1qNTqENIyde8oNkS+7xPzlsSE9kHs09jCKceSC2NCxnwHDR
 QiiOiroSkIie6hqf5LWjZmnI2pLL+BQmcjxp8fTAb/bWKguYXWs8S6By2diwYpECN+gP
 h31g==
X-Gm-Message-State: AKwxytfc2GPlvBlL2XHB0ObRp7zscP0Yg4ZFTC92TkWm7lQoNmvroP47
 Ed5+M5LomIfZzlnKaEM3OA==
X-Google-Smtp-Source: ACJfBosn+F66nHo1BgZU+S8kkcmX7JfIyVMAsHKOjnVuVT33t/INeUZyxYB9uCKUr0sm9m3brXrBsg==
X-Received: by 10.157.44.154 with SMTP id p26mr1624605otb.8.1516206689135;
 Wed, 17 Jan 2018 08:31:29 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id d134sm2073208oih.5.2018.01.17.08.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jan 2018 08:31:28 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id C7C712BE;
 Wed, 17 Jan 2018 10:31:26 -0600 (CST)
Reply-To: minyard@acm.org
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <54c6562b-f35a-c616-b6c2-a2eadf6937da@acm.org>
 <e462c75e-8d93-cddf-06f9-f40643e5b703@linux.intel.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <b22f5462-6518-9558-0fcd-5bb9cbd395b9@acm.org>
Date: Wed, 17 Jan 2018 10:31:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <e462c75e-8d93-cddf-06f9-f40643e5b703@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 16:31:33 -0000

On 01/17/2018 08:31 AM, Wang, Haiyue wrote:
>
>

Snip...

>>>> +/* mapped to lpc-host@80 IO space */
>>>> +#define LPC_HICRB            0x080
>>>> +#define     LPC_HICRB_IBFIF4         BIT(1)
>>>> +#define     LPC_HICRB_LPC4E          BIT(0)
>>>> +#define LPC_LADR4            0x090
>>>> +#define LPC_IDR4             0x094
>>>> +#define LPC_ODR4             0x098
>>>> +#define LPC_STR4             0x09C
>>>> +
>>>> +
>>>> +/* IPMI 2.0 - 9.5, KCS Interface Registers */
>>>> +struct kcs_ioreg {
>>>> +    u32 idr; /* Input Data Register */
>>>> +    u32 odr; /* Output Data Register */
>>>> +    u32 str; /* Status Register */
>>>> +};
>>>> +
>>>> +static const struct kcs_ioreg kcs_ioreg_map[KCS_CHANNEL_MAX] = {
>>>> +    { .idr = LPC_IDR1, .odr = LPC_ODR1, .str = LPC_STR1 },
>>>> +    { .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
>>>> +    { .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
>>>> +    { .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
>>>> +};
>>
>> One more thing...  Why aren't the above values being set in the 
>> device tree?
>> Passing in a channel (and address) seems inflexible.  Kind of goes 
>> against the
>> philosophy of device trees.
>>
>> -corey
>>
> Change it by referring to Joel's suggestion, and defining IDR/ODR/STR 
> registers together with other
> registers for LPC KCS, looks like this made code be more easily 
> maintained.
>
> https://lists.ozlabs.org/pipermail/openbmc/2017-December/010095.html
>

Hmm, the code that you had there seemed ok to me (though you didn't 
check that you got three
registers).

I'm ok either way.  The idea of the device tree is that if someone has 
this same device,
they just add a device tree and it works without modifying the driver.  
If Joel doesn't
think it's worth it, then I guess it's ok.

>>>>
>>>> +
>>>> +struct kcs_bmc {
>>>> +    struct regmap *map;
>>>> +    spinlock_t     lock;
>>>
>>> This lock is only used in threads, as far as I can tell. Couldn't it 
>>> just be a normal mutex?
>>> But more on this later.
>>>
> I missed this lock using in KCS ISR function, for AST2500 is single 
> core CPU. The critical data such as
> data_in_avail is shared between ISR and user thread, spinlock_t 
> related API should be the right one ?
> especially for SMP ?
>

Sort of.  In the case below, you need to use spin_lock_irqsave(), you 
don't necessarily get
here with interrupts disabled.

In the ones called from user context, you should really use 
spin_lock_irq().  Interrupts
should always be on at that point, so it's better.

> static irqreturn_t kcs_bmc_irq(int irq, void *arg)
> {
>     ....
>     spin_lock(&kcs_bmc->lock);  // <-- MISSED
>
>     switch (sts) {
>     case KCS_STR_IBF | KCS_STR_CMD_DAT:
>         kcs_rx_cmd(kcs_bmc);
>         break;
>
>     case KCS_STR_IBF:
>         kcs_rx_data(kcs_bmc);
>         break;
>
>     default:
>         ret = IRQ_NONE;
>         break;
>     }
>
>     spin_unlock(&kcs_bmc->lock); // <-- MISSED
>
>     return ret;
> }
>
>
>>>> +
>>>> +    u32 chan;
>>>> +    int running;
>>>> +
>>>> +    u32 idr;
>>>> +    u32 odr;
>>>> +    u32 str;
>>>> +
>>>> +    int kcs_phase;
>>>> +    u8  abort_phase;
>>>> +    u8  kcs_error;
>>>> +
>>>> +    wait_queue_head_t queue;
>>>> +    int  data_in_avail;
>>>
>>> data_in_avail should be a bool.
>>>
>>> You set data_in_avail after the data is ready, but you don't have a 
>>> barrier.  You
>>> have similar problems with kcs_phase.
>>>
>>> In fact, the locking in the driver doesn't seem quite correct. If 
>>> this ever ran on
>>> an SMP system, it is likely to not work correctly.  You can assume 
>>> that the interrupt
>>> runs exclusively, but you cannot assume that the data operations are 
>>> available in
>>> order on another processor that handles a subsequent interrupt.
>>>
>>> The easiest way to fix this would be to add the spin lock around the 
>>> case statement
>>> in the irq handler and add them in the poll and read functions (you 
>>> would need to
>>> leave it as a spinlock in that case).  That would provide the proper 
>>> barriers assuming
>>> you put them in the right place (checking data_in_avail again inside 
>>> the spinlock
>>> in the read case, for instance).
>>>
> Got it!
>>>> +    int  data_in_idx;
>>>> +    u8  *data_in;
>>>> +
>>>> +    int  data_out_idx;
>>>> +    int  data_out_len;
>>>> +    u8  *data_out;
>>>> +
>>>> +    struct miscdevice miscdev;
>>>> +};
>>>> +
>>>> +static u8 kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>>>> +{
>>>> +    u32 val = 0;
>>>> +    int rc;
>>>> +
>>>> +    rc = regmap_read(kcs_bmc->map, reg, &val);
>>>> +    WARN(rc != 0, "regmap_read() failed: %d\n", rc);
>>>> +
>>>> +    return rc == 0 ? (u8) val : 0;
>>>> +}
>>>> +
>>>> +static void kcs_outb(struct kcs_bmc *kcs_bmc, u8 data, u32 reg)
>>>> +{
>>>> +    int rc;
>>>> +
>>>> +    rc = regmap_write(kcs_bmc->map, reg, data);
>>>> +    WARN(rc != 0, "regmap_write() failed: %d\n", rc);
>>>> +}
>>>> +
>>>> +static inline void kcs_set_state(struct kcs_bmc *kcs_bmc, u8 state)
>>>> +{
>>>> +    regmap_update_bits(kcs_bmc->map, kcs_bmc->str, 
>>>> KCS_STR_STATE_MASK,
>>>> +            KCS_STR_STATE(state));
>>>> +}
>>>> +
>>>> +static inline void kcs_set_atn(struct kcs_bmc *kcs_bmc)
>>>> +{
>>>> +    regmap_update_bits(kcs_bmc->map, kcs_bmc->str, KCS_STR_SMS_ATN,
>>>> +            KCS_STR_SMS_ATN);
>>>> +}
>>>> +
>>>> +static inline void kcs_clear_atn(struct kcs_bmc *kcs_bmc)
>>>> +{
>>>> +    regmap_update_bits(kcs_bmc->map, kcs_bmc->str, KCS_STR_SMS_ATN,
>>>> +            0);
>>>> +}
>>>> +
>>>> +/*
>>>> + * AST_usrGuide_KCS.pdf
>>>> + * 2. Background:
>>>> + *   we note D for Data, and C for Cmd/Status, default rules are
>>>> + *     A. KCS1 / KCS2 ( D / C:X / X+4 )
>>>> + *        D / C : CA0h / CA4h
>>>> + *        D / C : CA8h / CACh
>>>> + *     B. KCS3 ( D / C:XX2h / XX3h )
>>>> + *        D / C : CA2h / CA3h
>>>> + *        D / C : CB2h / CB3h
>>>> + *     C. KCS4
>>>> + *        D / C : CA4h / CA5h
>>>> + */
>>>> +static void kcs_set_addr(struct kcs_bmc *kcs_bmc, u16 addr)
>>>> +{
>>>> +    switch (kcs_bmc->chan) {
>>>> +    case 1:
>>>> +        regmap_update_bits(kcs_bmc->map, LPC_HICR4,
>>>> +                LPC_HICR4_LADR12AS, 0);
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR12H, addr >> 8);
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR12L, addr & 0xFF);
>>>> +        break;
>>>> +
>>>> +    case 2:
>>>> +        regmap_update_bits(kcs_bmc->map, LPC_HICR4,
>>>> +                LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR12H, addr >> 8);
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR12L, addr & 0xFF);
>>>> +        break;
>>>> +
>>>> +    case 3:
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR3H, addr >> 8);
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR3L, addr & 0xFF);
>>>> +        break;
>>>> +
>>>> +    case 4:
>>>> +        regmap_write(kcs_bmc->map, LPC_LADR4, ((addr + 1) << 16) |
>>>> +            addr);
>>>> +        break;
>>>> +
>>>> +    default:
>>>
>>> Shouldn't you return an error here?
>>>
> For I checked the channel number on kcs_bmc_probe, still need this 
> kind of error handling ?
>
>     rc = of_property_read_u32(dev->of_node, "kcs_chan", &chan);
>     if ((rc != 0) || (chan == 0 || chan > KCS_CHANNEL_MAX)) {
>         dev_err(dev, "no valid 'kcs_chan' configured\n");
>         return -ENODEV;
>     }
>

That's fine.

>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static void kcs_enable_channel(struct kcs_bmc *kcs_bmc, int enable)
>>>> +{
>>>> +    switch (kcs_bmc->chan) {
>>>> +    case 1:
>>>> +        if (enable) {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
>>>> +        } else {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC1E, 0);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF1, 0);
>>>> +        }
>>>> +        break;
>>>> +
>>>> +    case 2:
>>>> +        if (enable) {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
>>>> +        } else {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC2E, 0);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF2, 0);
>>>> +        }
>>>> +        break;
>>>> +
>>>> +    case 3:
>>>> +        if (enable) {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR4,
>>>> +                    LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
>>>> +        } else {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR0,
>>>> +                    LPC_HICR0_LPC3E, 0);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR4,
>>>> +                    LPC_HICR4_KCSENBL, 0);
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICR2,
>>>> +                    LPC_HICR2_IBFIF3, 0);
>>>> +        }
>>>> +        break;
>>>> +
>>>> +    case 4:
>>>> +        if (enable) {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICRB,
>>>> +                    LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
>>>> +                    LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
>>>> +        } else {
>>>> +            regmap_update_bits(kcs_bmc->map, LPC_HICRB,
>>>> +                    LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
>>>> +                    0);
>>>> +        }
>>>
>>> The above shouldn't have {}, did you run this through checkpatch?
> Yes, I run the checkpatch, no this warning. ;-) But well, I will 
> remove the '{}'.
>>>
>>>> +        break;
>>>> +
>>>> +    default:
>>>
>>> Error here, too?
>>>
> For I checked the channel number on kcs_bmc_probe, still need this 
> kind of error handling ?

Just checking one place is fine :).

>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static void kcs_rx_data(struct kcs_bmc *kcs_bmc)
>>>> +{
>>>> +    u8 data;
>>>> +
>>>> +    switch (kcs_bmc->kcs_phase) {
>>>> +    case KCS_PHASE_WRITE:
>>>> +        kcs_set_state(kcs_bmc, KCS_WRITE_STATE);
>>>> +
>>>> +        /* set OBF before reading data */
>>>> +        kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +
>>>> +        if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
>>>> +            kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
>>>> +                    kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +        break;
>>>> +
>>>> +    case KCS_PHASE_WRITE_END:
>>>> +        kcs_set_state(kcs_bmc, KCS_READ_STATE);
>>>> +
>>>> +        if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
>>>> +            kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
>>>> +                    kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +        kcs_bmc->kcs_phase = KCS_PHASE_READ;
>>>> +        if (kcs_bmc->running) {
>>>> +            kcs_bmc->data_in_avail = 1;
>>>> +            wake_up_interruptible(&kcs_bmc->queue);
>>>> +        }
>>>> +        break;
>>>> +
>>>> +    case KCS_PHASE_READ:
>>>> +        if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
>>>> +            kcs_set_state(kcs_bmc, KCS_IDLE_STATE);
>>>> +
>>>> +        data = kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +        if (data != KCS_READ_BYTE) {
>>>> +            kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
>>>> +            kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
>>>> +            kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +            kcs_bmc->kcs_phase = KCS_PHASE_IDLE;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        kcs_outb(kcs_bmc, kcs_bmc->data_out[kcs_bmc->data_out_idx++],
>>>> +                 kcs_bmc->odr);
>>>> +        break;
>>>> +
>>>> +    case KCS_PHASE_ABORT:
>>>> +        switch (kcs_bmc->abort_phase) {
>>>> +        case ABORT_PHASE_ERROR1:
>>>> +            kcs_set_state(kcs_bmc, KCS_READ_STATE);
>>>> +
>>>> +            /* Read the Dummy byte */
>>>> +            kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +            kcs_outb(kcs_bmc, kcs_bmc->kcs_error, kcs_bmc->odr);
>>>> +            kcs_bmc->abort_phase = ABORT_PHASE_ERROR2;
>>>> +            break;
>>>> +
>>>> +        case ABORT_PHASE_ERROR2:
>>>> +            kcs_set_state(kcs_bmc, KCS_IDLE_STATE);
>>>> +
>>>> +            /* Read the Dummy byte */
>>>> +            kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +            kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +            kcs_bmc->kcs_phase = KCS_PHASE_IDLE;
>>>> +            kcs_bmc->abort_phase = 0;
>>>> +            break;
>>>> +
>>>> +        default:
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        break;
>>>> +
>>>> +    case KCS_PHASE_ERROR:
>>>
>>> This is identical to the default.  And the default should never 
>>> happen, anyway.
>>> If the default happens you have a software bug and need to report it.
>>>
> For making code clean, I removed the KCS_PHASE_ERROR, just keep the 
> 'default' handling.
>>>> +        kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
>>>> +
>>>> +        /* Read the Dummy byte */
>>>> +        kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +        kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
>>>> +
>>>> +        /* Read the Dummy byte */
>>>> +        kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +        kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static void kcs_rx_cmd(struct kcs_bmc *kcs_bmc)
>>>> +{
>>>> +    u8 cmd;
>>>> +
>>>> +    kcs_set_state(kcs_bmc, KCS_WRITE_STATE);
>>>> +
>>>> +    /* Dummy data to generate OBF */
>>>> +    kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +
>>>> +    cmd = kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>
>>> Wouldn't you want to read the command before you write the OBF?
>>>
> The host SMS KCS state is : 'wait for IBF=0' --> 'wait for OBF=1' /  
> 'clear OBF', for racing
> condition, BMC needs prepare OBF=1, then clear IBF. ;-)
>>>> +    switch (cmd) {
>>>> +    case KCS_WRITE_START:
>>>> +        kcs_bmc->data_in_avail = 0;
>>>> +        kcs_bmc->data_in_idx   = 0;
>>>> +        kcs_bmc->kcs_phase     = KCS_PHASE_WRITE;
>>>> +        kcs_bmc->kcs_error     = KCS_NO_ERROR;
>>>> +        break;
>>>> +
>>>> +    case KCS_WRITE_END:
>>>> +        kcs_bmc->kcs_phase = KCS_PHASE_WRITE_END;
>>>> +        break;
>>>> +
>>>> +    case KCS_ABORT:
>>>> +        if (kcs_bmc->kcs_error == KCS_NO_ERROR)
>>>> +            kcs_bmc->kcs_error = KCS_ABORTED_BY_COMMAND;
>>>> +
>>>> +        kcs_bmc->kcs_phase   = KCS_PHASE_ABORT;
>>>> +        kcs_bmc->abort_phase = ABORT_PHASE_ERROR1;
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        kcs_bmc->kcs_error = KCS_ILLEGAL_CONTROL_CODE;
>>>> +        kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
>>>> +        kcs_outb(kcs_bmc, kcs_bmc->kcs_error, kcs_bmc->odr);
>>>> +        kcs_bmc->kcs_phase = KCS_PHASE_ERROR;
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +/*
>>>> + * Whenever the BMC is reset (from power-on or a hard reset), the 
>>>> State Bits
>>>> + * are initialized to "11 - Error State". Doing so allows SMS to 
>>>> detect that
>>>> + * the BMC has been reset and that any message in process has been 
>>>> terminated
>>>> + * by the BMC.
>>>> + */
>>>> +static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    spin_lock_irqsave(&kcs_bmc->lock, flags);
>>>> +    kcs_set_state(kcs_bmc, KCS_ERROR_STATE);
>>>> +
>>>> +    /* Read the Dummy byte */
>>>> +    kcs_inb(kcs_bmc, kcs_bmc->idr);
>>>> +
>>>> +    kcs_outb(kcs_bmc, KCS_ZERO_DATA, kcs_bmc->odr);
>>>> +    kcs_bmc->kcs_phase = KCS_PHASE_ERROR;
>>>> +    spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>>>
>>> You don't set data_in_avail() to zero here?
>>>
> Done, added it.
>>>> +}
>>>> +
>>>> +static irqreturn_t kcs_bmc_irq(int irq, void *arg)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = arg;
>>>> +    u32 sts;
>>>> +
>>>> +    if (regmap_read(kcs_bmc->map, kcs_bmc->str, &sts) != 0)
>>>> +        return IRQ_NONE;
>>>> +
>>>> +    sts &= (KCS_STR_IBF | KCS_STR_CMD_DAT);
>>>> +
>>>> +    switch (sts) {
>>>> +    case KCS_STR_IBF | KCS_STR_CMD_DAT:
>>>> +        kcs_rx_cmd(kcs_bmc);
>>>> +        break;
>>>> +
>>>> +    case KCS_STR_IBF:
>>>> +        kcs_rx_data(kcs_bmc);
>>>> +
>>>> +    default:
>>>> +        return IRQ_NONE;
>>>> +    }
>>>> +
>>>> +    return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static int kcs_bmc_config_irq(struct kcs_bmc *kcs_bmc,
>>>> +            struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    int irq;
>>>> +
>>>> +    irq = platform_get_irq(pdev, 0);
>>>> +    if (irq < 0)
>>>> +        return irq;
>>>> +
>>>> +    return devm_request_irq(dev, irq, kcs_bmc_irq, IRQF_SHARED,
>>>> +            dev_name(dev), kcs_bmc);
>>>> +}
>>>> +
>>>> +
>>>> +static inline struct kcs_bmc *file_kcs_bmc(struct file *filp)
>>>> +{
>>>> +    return container_of(filp->private_data, struct kcs_bmc, miscdev);
>>>> +}
>>>> +
>>>> +static int kcs_bmc_open(struct inode *inode, struct file *filp)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    unsigned long flags;
>>>> +
>>>> +    if (kcs_bmc->running)
>>>> +        return -EBUSY;
>>>> +
>>>
>>> The above is a race, it needs to be done inside the lock.
>>>
> Fixed!
>>>> + spin_lock_irqsave(&kcs_bmc->lock, flags);
>>>> +    kcs_bmc->kcs_phase     = KCS_PHASE_IDLE;
>>>> +    kcs_bmc->running       = 1;
>>>> +    kcs_bmc->data_in_avail = 0;
>>>> +    spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>>>
>>> What happens if the interface is not in a state where it can send a 
>>> message?
>>> The release code doesn't block until anything is done, so the 
>>> interface might
>>> not be in a place where you can use it.  I think the init code 
>>> handles it from
>>> that side, but the release side is not handled.
>>>
>>> Also, if release gets called, wouldn't you want to call 
>>> kcs_force_abort() here
>>> or in release()? That would be the equivalent of the BMC getting reset.
>>>
> Yes, you are right. We meet this kind of bug that host is waiting BMC 
> after it resets. So normally,
> after the user ipmi stack is ready, it will call 
> KCS_BMC_IOCTL_FORCE_ABORT, then the SMS can
> get a right response.
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static unsigned int kcs_bmc_poll(struct file *filp, poll_table *wait)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    unsigned int mask = 0;
>>>> +
>>>> +    poll_wait(filp, &kcs_bmc->queue, wait);
>>>> +
>>>> +    if (kcs_bmc->data_in_avail)
>>>> +        mask |= POLLIN;
>>>> +
>>>> +    if (kcs_bmc->kcs_phase == KCS_PHASE_READ)
>>>> +        mask |= POLLOUT;
>>>> +
>>>> +    return mask;
>>>> +}
>>>> +
>>>> +static ssize_t kcs_bmc_read(struct file *filp, char *buf,
>>>> +                size_t count, loff_t *offset)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    int rv;
>>>> +
>>>
>>> You probably ought to handle O_NONBLOCK here.  (Same problem on BT, 
>>> too.)
>>>
> Got it, will add this.
>>>> +    rv = wait_event_interruptible(kcs_bmc->queue,
>>>> +                kcs_bmc->data_in_avail != 0);
>>>> +    if (rv < 0)
>>>> +        return -ERESTARTSYS;
>>>> +
>>>
>>> This is a race condition for multiple users.
>>>
> Got it, will fix this.
>>>> +    kcs_bmc->data_in_avail = 0;
>>>> +
>>>> +    if (count > kcs_bmc->data_in_idx)
>>>> +        count = kcs_bmc->data_in_idx;
>>>> +
>>>> +    if (copy_to_user(buf, kcs_bmc->data_in, count))
>>>> +        return -EFAULT;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static ssize_t kcs_bmc_write(struct file *filp, const char *buf,
>>>> +                 size_t count, loff_t *offset)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    unsigned long flags;
>>>> +
>>>> +    if (count < 1 || count > KCS_MSG_BUFSIZ)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (copy_from_user(kcs_bmc->data_out, buf, count))
>>>> +        return -EFAULT;
>>>> +
>>>> +    spin_lock_irqsave(&kcs_bmc->lock, flags);
>>>> +    if (kcs_bmc->kcs_phase == KCS_PHASE_READ) {
>>>
>>> If you don't modify kcs_phase here, you have a race condition. You 
>>> probably
>>> need a KCS_WAIT_READ condition.  Also, the nomenclature of "read" 
>>> and "write"
>>> here is a little confusing, since your phases are from the host's 
>>> point of view,
>>> not this driver's point of view.  You might want to document that 
>>> explicitly.
>>>
> The race condition means that the user MAY write the duplicated 
> response ?

Not exactly.  Two threads can call this, and if it hasn't transitions 
from the read phase,
the data out will be overwritten.

> Will write some comments for these phase definition.
>>>> +        kcs_bmc->data_out_idx = 1;
>>>> +        kcs_bmc->data_out_len = count;
>>>> +        kcs_outb(kcs_bmc, kcs_bmc->data_out[0], kcs_bmc->odr);
>>>> +    }
>>>
>>> So if you write and the data isn't ready, you just drop the data on 
>>> the floor silently?
>>> Probably not the best design.  You should probably return an error, 
>>> as write can
>>> only be called after read.
>>>
> Yes, you are right, will return the right error code instead. ;-)
>>>> + spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
>>>> +              unsigned long arg)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    long ret = 0;
>>>> +
>>>> +    switch (cmd) {
>>>> +    case KCS_BMC_IOCTL_SET_ATN:
>>>> +        kcs_set_atn(kcs_bmc);
>>>> +        break;
>>>> +
>>>> +    case KCS_BMC_IOCTL_CLR_ATN:
>>>> +        kcs_clear_atn(kcs_bmc);
>>>> +        break;
>>>> +
>>>> +    case KCS_BMC_IOCTL_FORCE_ABORT:
>>>> +        kcs_force_abort(kcs_bmc);
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        ret = -EINVAL;
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int kcs_bmc_release(struct inode *inode, struct file *filp)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
>>>> +    unsigned long flags;
>>>> +
>>>> +    spin_lock_irqsave(&kcs_bmc->lock, flags);
>>>> +    kcs_bmc->running = 0;
>>>> +    spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct file_operations kcs_bmc_fops = {
>>>> +    .owner          = THIS_MODULE,
>>>> +    .open           = kcs_bmc_open,
>>>> +    .read           = kcs_bmc_read,
>>>> +    .write          = kcs_bmc_write,
>>>> +    .release        = kcs_bmc_release,
>>>> +    .poll           = kcs_bmc_poll,
>>>> +    .unlocked_ioctl = kcs_bmc_ioctl,
>>>> +};
>>>> +
>>>> +static int kcs_bmc_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    const struct kcs_ioreg *ioreg;
>>>> +    struct kcs_bmc *kcs_bmc;
>>>> +    u32 chan, addr;
>>>> +    int rc;
>>>> +
>>>> +    kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc), GFP_KERNEL);
>>>> +    if (!kcs_bmc)
>>>> +        return -ENOMEM;
>>>
>>> Every error after this point will leak kcs_bmc.  I'd recommend a 
>>> "goto out_err"
>>> to handle this.
>>>
> It is 'devm_xxx' API, it will be released automatically by the dev 
> framework. It also can auto-release
> the irq, so that probe function can be designed clearly. This is the 
> first time I know about this. ;-)

Oh, you are right, yes.  Sorry about that.

>>>> +
>>>> +    rc = of_property_read_u32(dev->of_node, "kcs_chan", &chan);
>>>> +    if ((rc != 0) || (chan == 0 || chan > KCS_CHANNEL_MAX)) {
>>>> +        dev_err(dev, "no valid 'kcs_chan' configured\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    rc = of_property_read_u32(dev->of_node, "kcs_addr", &addr);
>>>> +    if (rc) {
>>>> +        dev_err(dev, "no valid 'kcs_addr' configured\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    kcs_bmc->map = syscon_node_to_regmap(dev->parent->of_node);
>>>> +    if (IS_ERR(kcs_bmc->map)) {
>>>> +        dev_err(dev, "Couldn't get regmap\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    dev_set_name(dev, "ipmi-kcs%u", chan);
>>>> +
>>>> +    spin_lock_init(&kcs_bmc->lock);
>>>> +    kcs_bmc->chan = chan;
>>>
>>> You need error checking on chan.
>>>
> Has been checked above : if ((rc != 0) || (chan == 0 || chan > 
> KCS_CHANNEL_MAX)) {

Yeah, sorry I missed that.

-corey

>>>> +
>>>> +    ioreg = &kcs_ioreg_map[chan - 1];
>>>> +    kcs_bmc->idr  = ioreg->idr;
>>>> +    kcs_bmc->odr  = ioreg->odr;
>>>> +    kcs_bmc->str  = ioreg->str;
>>>> +
>>>> +    init_waitqueue_head(&kcs_bmc->queue);
>>>> +    kcs_bmc->data_in  = devm_kmalloc(dev, KCS_MSG_BUFSIZ, 
>>>> GFP_KERNEL);
>>>> +    kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, 
>>>> GFP_KERNEL);
>>>> +    if (kcs_bmc->data_in == NULL || kcs_bmc->data_out == NULL) {
>>>> +        dev_err(dev, "Failed to allocate data buffers\n");
>>>
>>> You will leak memory if you fail to allocate data_out but do 
>>> allocate data_in.
>>>
> It is 'devm_xxx' API, it will be released automatically by the dev 
> framework.;-)
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
>>>> +    kcs_bmc->miscdev.name = dev_name(dev);
>>>> +    kcs_bmc->miscdev.fops = &kcs_bmc_fops;
>>>> +    rc = misc_register(&kcs_bmc->miscdev);
>>>> +    if (rc) {
>>>> +        dev_err(dev, "Unable to register device\n");
>>>> +        return rc;
>>>> +    }
>>>
>>> After you call misc_register something can open the device and use it.
>>> You need to do that after everything is enabled.
>>>
> Got it, will change the code order.
>>>> +
>>>> +    kcs_set_addr(kcs_bmc, addr);
>>>> +    kcs_enable_channel(kcs_bmc, 1);
>>>> +
>>>> +    rc = kcs_bmc_config_irq(kcs_bmc, pdev);
>>>> +    if (rc) {
>>>> +        misc_deregister(&kcs_bmc->miscdev);
>>>> +        return rc;
>>>> +    }
>>>> +
>>>> +    dev_set_drvdata(&pdev->dev, kcs_bmc);
>>>
>>> This  should definitely be before you enable or register.  The drvdata
>>> needs to be available in case an irq comes in, for instance.
>>>
> Got it, will change the code order.
>>>> +
>>>> +    dev_info(dev, "addr=0x%x, idr=0x%x, odr=0x%x, str=0x%x\n",
>>>> +        addr, kcs_bmc->idr, kcs_bmc->odr, kcs_bmc->str);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int kcs_bmc_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
>>>> +
>>>> +    misc_deregister(&kcs_bmc->miscdev);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct of_device_id kcs_bmc_match[] = {
>>>> +    { .compatible = "aspeed,ast2400-kcs-bmc" },
>>>> +    { .compatible = "aspeed,ast2500-kcs-bmc" },
>>>> +    { }
>>>> +};
>>>> +
>>>> +static struct platform_driver kcs_bmc_driver = {
>>>> +    .driver = {
>>>> +        .name           = DEVICE_NAME,
>>>> +        .of_match_table = kcs_bmc_match,
>>>> +    },
>>>> +    .probe = kcs_bmc_probe,
>>>> +    .remove = kcs_bmc_remove,
>>>> +};
>>>> +
>>>> +module_platform_driver(kcs_bmc_driver);
>>>> +
>>>> +MODULE_DEVICE_TABLE(of, kcs_bmc_match);
>>>> +MODULE_LICENSE("GPL v2");
>>>> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>>>> +MODULE_DESCRIPTION("Linux device interface to the IPMI KCS 
>>>> interface");
>>>> diff --git a/include/uapi/linux/kcs-bmc.h 
>>>> b/include/uapi/linux/kcs-bmc.h
>>>> new file mode 100644
>>>> index 0000000..d1550d3
>>>> --- /dev/null
>>>> +++ b/include/uapi/linux/kcs-bmc.h
>>>> @@ -0,0 +1,14 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// Copyright (c) 2015-2018, Intel Corporation.
>>>> +
>>>> +#ifndef _UAPI_LINUX_KCS_BMC_H
>>>> +#define _UAPI_LINUX_KCS_BMC_H
>>>> +
>>>> +#include <linux/ioctl.h>
>>>> +
>>>> +#define __KCS_BMC_IOCTL_MAGIC        'K'
>>>> +#define KCS_BMC_IOCTL_SET_ATN _IO(__KCS_BMC_IOCTL_MAGIC, 1)
>>>> +#define KCS_BMC_IOCTL_CLR_ATN _IO(__KCS_BMC_IOCTL_MAGIC, 2)
>>>> +#define KCS_BMC_IOCTL_FORCE_ABORT _IO(__KCS_BMC_IOCTL_MAGIC, 3)
>>>> +
>>>> +#endif /* _UAPI_LINUX_KCS_BMC_H */
>>>
>>>
>>
>
