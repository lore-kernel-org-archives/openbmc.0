Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41S2jv6FlDzF35T;
 Sat, 14 Jul 2018 05:21:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jul 2018 12:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,348,1526367600"; d="scan'208";a="245527673"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2018 12:21:35 -0700
Subject: Re: [PATCH] i2c: aspeed: Adjust spinlock scope in the irq handler
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, james.feist@linux.intel.com,
 vernon.mauery@linux.intel.com
References: <20180702214011.16071-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g47nBCbF0mcYqEnQkDpz0Dhh0F0S1-wEL_yBHgs1b3yE5w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <59538d26-f025-28da-63df-f675e80fd68b@linux.intel.com>
Date: Fri, 13 Jul 2018 12:21:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47nBCbF0mcYqEnQkDpz0Dhh0F0S1-wEL_yBHgs1b3yE5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 19:21:56 -0000

On 7/12/2018 1:41 AM, Brendan Higgins wrote:
> On Mon, Jul 2, 2018 at 2:40 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This patch adjusts spinlock scope to make it wrap the whole irq
>> handler using a single lock/unlock which covers both master and
>> slave handlers.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 60e4d0e939a3..9f02aa959a3e 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -234,7 +234,6 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>>          bool irq_handled = true;
>>          u8 value;
>>
>> -       spin_lock(&bus->lock);
>>          if (!slave) {
>>                  irq_handled = false;
>>                  goto out;
>> @@ -325,7 +324,6 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>>          writel(status_ack, bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>>   out:
>> -       spin_unlock(&bus->lock);
>>          return irq_handled;
>>   }
>>   #endif /* CONFIG_I2C_SLAVE */
>> @@ -389,7 +387,6 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>>          u8 recv_byte;
>>          int ret;
>>
>> -       spin_lock(&bus->lock);
>>          irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>          /* Ack all interrupt bits. */
>>          writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
>> @@ -547,22 +544,29 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>>                  dev_err(bus->dev,
>>                          "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>                          irq_status, status_ack);
>> -       spin_unlock(&bus->lock);
>>          return !!irq_status;
>>   }
>>
>>   static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>   {
>>          struct aspeed_i2c_bus *bus = dev_id;
>> +       bool ret;
>> +
>> +       spin_lock(&bus->lock);
>>
>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>          if (aspeed_i2c_slave_irq(bus)) {
>>                  dev_dbg(bus->dev, "irq handled by slave.\n");
>> -               return IRQ_HANDLED;
>> +               ret = true;
>> +               goto out;
>>          }
>>   #endif /* CONFIG_I2C_SLAVE */
>>
>> -       return aspeed_i2c_master_irq(bus) ? IRQ_HANDLED : IRQ_NONE;
>> +       ret = aspeed_i2c_master_irq(bus);
>> +
>> +out:
>> +       spin_unlock(&bus->lock);
>> +       return ret ? IRQ_HANDLED : IRQ_NONE;
>>   }
>>
>>   static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>> --
>> 2.17.1
>>
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 
> Thanks!
> 

Thanks Brendan!

BTW, to whom should I ask applying this patch? Should I send v2 after
adding your reviewed-by tag?

Thanks,

Jae
