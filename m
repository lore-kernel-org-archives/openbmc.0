Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YFHb/cLm"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B03K739bzF3SF;
 Thu, 13 Sep 2018 23:33:33 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id y4-v6so2758043pgp.9;
 Thu, 13 Sep 2018 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g4eoSrsy5upUlsJV4SyYexINV3PdT/n9DepTlpNTUjY=;
 b=YFHb/cLmlyG7i6W+8EKzijM5SsKJaGVnnbkJ+y5of+8fid7I832jF8fYqI58s0O7u/
 fmFaPVs6tWYBxOlwt2HLv7HL+ZwUftbt6Lz1SlYUP2yxX4+v8B7ejFXedLMn/Fc/eGPa
 jC8s1Jq2XvKNrkGCWHK19WjPPWjL6zmuQem7du3+I4anjrWLJHhNeUa+64PXyv9d8PZs
 2tErmpeD/1WnKp+DMDh531gkdxcT0zbveJl6EyCZ5nyHWcpdHzww3Zw6fiDqZxcQapOr
 34j7ex12L59gPEMMkwySUNGBM4EpTaxVr+VzaVoe9xA3sptsj0IBkq//a05TXauwfot1
 5m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g4eoSrsy5upUlsJV4SyYexINV3PdT/n9DepTlpNTUjY=;
 b=feqzM/A+SZmq+l9BLFFWymX3BuTK6hKytGkav56diT9zPGkF+XYlCjXwuKByxd3gVH
 h5r3l/dKuZlNl94bbrWoc+1Ugxp7BsY8iu/eiww010dWXfcJoV67Kg85yOKmRBaorrNk
 REIe8JNQ97zGQNpjLT9uyMtrY3XQpJxE4tyOIcAWoauFkf/Oci0eynzO9IRcK660hgCQ
 ik3BqoVtEb/zDo0sTlCy73QUlnaewo9/0i/Ke+bOO7HqiMMC9Tn4/kSickX2/qUnw2fv
 BzjML0B0tiEFgs3WTIcanUnd4nmwHDOHZYR6nVXX9c6p2witJCaxpca9QAcZWrDcupg2
 v6VA==
X-Gm-Message-State: APzg51DD29BKvRFw9BzHOTdk0F0y/yIo//HfRVmmJV9G8UN705l+vn8S
 7LlnqMfTK2Q9xpmZ5xzCLRA=
X-Google-Smtp-Source: ANB0VdbiWg52ZC2c8Nu5J8P1LmEsxKqwsIRs6CvGv6EbwBaI93rVmiNorfO425/VjXbvaTFJUNjVZg==
X-Received: by 2002:a62:9bc9:: with SMTP id
 e70-v6mr7395770pfk.95.1536845611555; 
 Thu, 13 Sep 2018 06:33:31 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id k69-v6sm4957590pgd.9.2018.09.13.06.33.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Sep 2018 06:33:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Feist <james.feist@linux.intel.com>
References: <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
 <20180911204107.GA26017@roeck-us.net>
 <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
 <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
 <20180911233302.GA18799@roeck-us.net>
 <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
 <20180912013449.GA12612@roeck-us.net>
 <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
 <20180912195844.GA6893@roeck-us.net>
 <da7f4691-7428-3114-32bb-e0171f6c7228@linux.intel.com>
 <20180912203059.GA18201@roeck-us.net>
 <fb185839-3ae0-01dc-09e8-f22db55ecb04@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f86e75f-1502-eae8-0633-d087937111c8@roeck-us.net>
Date: Thu, 13 Sep 2018 06:33:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fb185839-3ae0-01dc-09e8-f22db55ecb04@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 13 Sep 2018 13:33:36 -0000

On 09/12/2018 10:45 PM, Cédric Le Goater wrote

[ ... ]

>> ---
>> qemu:
>>
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> index c762c73..0d4aa08 100644
>> --- a/hw/i2c/aspeed_i2c.c
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -180,6 +180,33 @@ static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
>>       return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
>>   }
>>   
>> +static void aspeed_i2c_handle_rx_cmd(AspeedI2CBus *bus)
>> +{
>> +    int ret;
>> +
>> +    if (!(bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST))) {
>> +        return;
>> +    }
> 
> it deserves a comment to understand which scenario we are trying to handle.
> 
>> +    if (bus->intr_status & I2CD_INTR_RX_DONE) {
>> +        return;
>> +    }
> 
> should be handled in aspeed_i2c_bus_handle_cmd() I think
> 

I moved those two checks into the calling code.


>> +    aspeed_i2c_set_state(bus, I2CD_MRXD);
>> +    ret = i2c_recv(bus->bus);
>> +    if (ret < 0) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__);
>> +        ret = 0xff;
>> +    } else {
>> +        bus->intr_status |= I2CD_INTR_RX_DONE;
>> +    }
>> +    bus->buf = (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
>> +    if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
>> +        i2c_nack(bus->bus);
>> +    }
>> +    bus->cmd &= ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
>> +    aspeed_i2c_set_state(bus, I2CD_MACTIVE);
>> +}
>> +
>>   /*
>>    * The state machine needs some refinement. It is only used to track
>>    * invalid STOP commands for the moment.
>> @@ -188,7 +215,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>   {
>>       bus->cmd &= ~0xFFFF;
>>       bus->cmd |= value & 0xFFFF;
>> -    bus->intr_status = 0;> +    bus->intr_status &= I2CD_INTR_RX_DONE;
> 
> it deserves a comment to understand which scenario we are trying to handle.
>    

Ok. FWIW, I wonder if intr_status should be touched here in the first place,
but I neither have the hardware nor a datasheet, so I don't know if any bits
are auto-cleared.

>>       if (bus->cmd & I2CD_M_START_CMD) {
>>           uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
>> @@ -227,22 +254,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>       }
>>   
>>       if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
>> -        int ret;
>> -
>> -        aspeed_i2c_set_state(bus, I2CD_MRXD);
>> -        ret = i2c_recv(bus->bus);
>> -        if (ret < 0) {
>> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__);
>> -            ret = 0xff;
>> -        } else {
>> -            bus->intr_status |= I2CD_INTR_RX_DONE;
>> -        }
>> -        bus->buf = (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
>> -        if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
>> -            i2c_nack(bus->bus);
>> -        }
>> -        bus->cmd &= ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
>> -        aspeed_i2c_set_state(bus, I2CD_MACTIVE);
>> +        aspeed_i2c_handle_rx_cmd(bus);
>>       }
>>   
>>       if (bus->cmd & I2CD_M_STOP_CMD) {
>> @@ -263,6 +275,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>>                                    uint64_t value, unsigned size)
>>   {
>>       AspeedI2CBus *bus = opaque;
>> +    int status;
>>   
>>       switch (offset) {
>>       case I2CD_FUN_CTRL_REG:
>> @@ -283,9 +296,16 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>>           bus->intr_ctrl = value & 0x7FFF;
>>           break;
>>       case I2CD_INTR_STS_REG:
>> +        status = bus->intr_status;
>>           bus->intr_status &= ~(value & 0x7FFF);
>> -        bus->controller->intr_status &= ~(1 << bus->id);
>> -        qemu_irq_lower(bus->controller->irq);
>> +        if (!bus->intr_status) {
>> +            bus->controller->intr_status &= ~(1 << bus->id);
>> +            qemu_irq_lower(bus->controller->irq);
>> +        }
> 
> That part below is indeed something to fix. I had a similar patch.
> 

Should I split it out as separate patch ? Alternatively, if you submitted
your patch already, I'll be happy to use it as base for mine.

Thanks,
Guenter

> 
>> +        if ((status & I2CD_INTR_RX_DONE) && !(bus->intr_status & I2CD_INTR_RX_DONE)) {
>> +            aspeed_i2c_handle_rx_cmd(bus);
>> +            aspeed_i2c_bus_raise_interrupt(bus);
>> +        }
> 
> ok.
> 
> Thanks for looking into this.
> 
> C.
> 
>>           break;
>>       case I2CD_DEV_ADDR_REG:
>>           qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>>
> 
> 
