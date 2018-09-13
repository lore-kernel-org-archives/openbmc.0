Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.42.102; helo=4.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Sep 2018 16:05:31 AEST
Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net
 [46.105.42.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429p6M719HzF3Rf
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 16:05:31 +1000 (AEST)
Received: from player157.ha.ovh.net (unknown [10.109.160.12])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4994C280FE
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 07:47:46 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 7F378100081;
 Thu, 13 Sep 2018 07:47:34 +0200 (CEST)
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Feist <james.feist@linux.intel.com>
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
 <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
 <20180911204107.GA26017@roeck-us.net>
 <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
 <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
 <20180911233302.GA18799@roeck-us.net>
 <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
 <20180912013449.GA12612@roeck-us.net>
 <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <285ea914-5407-7fde-036d-95978f95a430@kaod.org>
Date: Thu, 13 Sep 2018 07:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18014961462414117760
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjeehgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2018 06:05:32 -0000

On 09/12/2018 06:54 PM, Jae Hyun Yoo wrote:
> On 9/11/2018 6:34 PM, Guenter Roeck wrote:
>> On Tue, Sep 11, 2018 at 04:58:44PM -0700, Jae Hyun Yoo wrote:
>>> On 9/11/2018 4:33 PM, Guenter Roeck wrote:
>>>> Looking into the patch, clearing the interrupt status at the end of an
>>>> interrupt handler is always suspicious and tends to result in race
>>>> conditions (because additional interrupts may have arrived while handling
>>>> the existing interrupts, or because interrupt handling itself may trigger
>>>> another interrupt). With that in mind, the following patch fixes the
>>>> problem for me.
>>>>
>>>> Guenter
>>>>
>>>> ---
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>> index c258c4d9a4c0..c488e6950b7c 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -552,6 +552,8 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>>>       spin_lock(&bus->lock);
>>>>       irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>> +    /* Ack all interrupt bits. */
>>>> +    writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
>>>>       irq_remaining = irq_received;
>>>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>>> @@ -584,8 +586,6 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>>>               "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>>>               irq_received, irq_handled);
>>>> -    /* Ack all interrupt bits. */
>>>> -    writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
>>>>       spin_unlock(&bus->lock);
>>>>       return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>>>>   }
>>>>
>>>
>>> My intention of putting the code at the end of interrupt handler was,
>>> to reduce possibility of combined irq calls which is explained in this
>>> patch. But YES, I agree with you. It could make a potential race
>>
>> Hmm, yes, but that doesn't explain why it would make sense to acknowledge
>> the interrupt late. The interrupt ack only means "I am going to handle these
>> interrupts". If additional interrupts arrive while the interrupt handler
>> is active, those will have to be acknowledged separately.
>>
>> Sure, there is a risk that an interrupt arrives while the handler is
>> running, and that it is handled but not acknowledged. That can happen
>> with pretty much all interrupt handlers, and there are mitigations to
>> limit the impact (for example, read the interrupt status register in
>> a loop until no more interrupts are pending). But acknowledging
>> an interrupt that was possibly not handled is always bad idea.
> 
> Well, that's generally right but not always. Sometimes that depends on
> hardware and Aspeed I2C is the case.
> 
> This is a description from Aspeed AST2500 datasheet:
>   I2CD10 Interrupt Status Register
>   bit 2 Receive Done Interrupt status
>         S/W needs to clear this status bit to allow next data receiving.
> 
> It means, driver should hold this bit to prevent transition of hardware
> state machine until the driver handles received data, so the bit should
> be cleared at the end of interrupt handler.
> 
> Let me share my test result. Your code change works on 100KHz bus speed
> but doesn't work well on 1MHz bus speed. Investigated that interrupt
> handling is fast enough in 100KHz test but in 1MHz, most of data is
> corrupted because the bit is cleared at the beginning of interrupt
> handler so it allows receiving of the next data but the interrupt
> handler isn't fast enough to read the data buffer on time. I checked
> this problem on BMC-ME channel which ME sends lots of IPMB packets to
> BMC at 1MHz speed. You could simply check the data corruption problem on
> the BMC-ME channel.

OK.
 
> My thought is, the current code is right for real Aspeed I2C hardware.
> It seems that QEMU 3.0 model for witherspoon-bmc doesn't simulate the
> actual Aspeed I2C hardware correctly.

That might be very well possible yes. it also misses support for the slave 
mode and the DMA registers.

Thanks for the info,

C.
