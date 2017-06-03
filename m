Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfkJd2d5gzDqGr
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 11:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UHLPkmol"; 
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id w1so44050046qtg.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 18:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Yn5MQXRsuvKbRs4tkQVwmQnZ4TtUM1e27i2/FAk6Bb0=;
 b=UHLPkmolsqs0HblkI1Jcnp+3dfaMpl2tWkpz6JhU37W0L7RqFXjWiOk6JGwPjdkZ3v
 KJpKIOrlG2mpMQTAlxeJrSMKGiiGnV62ddHaAvA9Vq5YoTzF+pqaXffEgUZ9p5gTgW86
 dWkx3/IeRmrjEP+2FTjpYTj55hIZNOdmpDzKPAH6XhyYh0Om7LfSNbS/GHmjNLKm0Psx
 sZKPdUIFqgLg/RJtGtBEuH9EYi0jW1hcFKPe+nHpKbvRd/WYeTiMBZ1llCCe1T0fE7XW
 OPqknKQzjzM/4M/Gn9ac6TRnFaopCQZMaUJkNUneQHVzOZf/onJKH0ePG/Wes+F+a0mk
 +P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Yn5MQXRsuvKbRs4tkQVwmQnZ4TtUM1e27i2/FAk6Bb0=;
 b=eY2DzNaiv7sBuMITPG8oGpVYMNuYQhzt2GbWFISASshQSiOYLNRMY4yino1sPx+mSm
 /g8gi1tjY+ffa4uGlKkxq97abkKK2zKfZMbFwMzTU0eum+N6DrlD0j47WoT0HElzZcsU
 OXvBDknw9385aYdnF0nNJUZDwlnXooT0k9K/6kfqr6xTSPpahzleLskpiZ+opeQ9dvb5
 YP45TYehVMFeghq34xStwFcEq+5l+HCjuutCGpXSs07k1v62Pu1mZp6glBMrl0yyuzGE
 /TdONDI7lt7DEglqc/vARzPfnEXThD2GyyseP5cYLlb6SC/RG3TFmtD8dtL0wtFHrz7H
 80aQ==
X-Gm-Message-State: AODbwcA8RPjakQPLiQp4LWdohy7gPteiHuH1O3YUnOJ/U2FLlT0K8WHU
 kBt7a30yXorq8BYWSevR1DbSDNj+dGPG
X-Received: by 10.237.48.105 with SMTP id 96mr11479836qte.218.1496453949791;
 Fri, 02 Jun 2017 18:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.73 with HTTP; Fri, 2 Jun 2017 18:39:09 -0700 (PDT)
In-Reply-To: <1496404942.2842.2.camel@kernel.crashing.org>
References: <20170602084603.30811-1-brendanhiggins@google.com>
 <20170602084603.30811-5-brendanhiggins@google.com>
 <1496404942.2842.2.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 2 Jun 2017 18:39:09 -0700
Message-ID: <CAFd5g46JmZZCLfvLzMbeeszNMJ_vBa3VvQSp4AGdEsNxYpTnYQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sat, 03 Jun 2017 01:39:14 -0000

On Fri, Jun 2, 2017 at 5:02 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2017-06-02 at 01:46 -0700, Brendan Higgins wrote:
>> Added initial master support for Aspeed I2C controller. Supports
>> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Reviewed-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>
> Just spotted a completely minor/tivial nit:
>
>> +static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>> +                               struct i2c_msg *msgs, int num)
>> +{
>> +     struct aspeed_i2c_bus *bus = adap->algo_data;
>> +     unsigned long time_left, flags;
>> +     int ret = 0;
>> +
>> +     spin_lock_irqsave(&bus->lock, flags);
>> +     bus->cmd_err = 0;
>         ^^^^^^^^^^^^^^^^^
>
> This is probably unnecessary now since it's initialized further down.

Nope, reset uses cmd_err as well. Maybe reset should initialize it? Not sure.

>
>> +     /* If bus is busy, attempt recovery. We assume a single master
>> +      * environment.
>> +      */
>> +     if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_BUS_BUSY_STS) {
>> +             spin_unlock_irqrestore(&bus->lock, flags);
>> +             ret = aspeed_i2c_recover_bus(bus);
>> +             if (ret)
>> +                     return ret;
>> +             spin_lock_irqsave(&bus->lock, flags);
>> +     }
>> +
>> +     bus->cmd_err = 0;
>> +     bus->msgs = msgs;
>> +     bus->msgs_index = 0;
>> +     bus->msgs_count = num;
>
> Now I'd like Andrew to give it a spin as he's currently
> testing/debugging some i2c related stuff to be 100% certain it works
> fine on our systems.

If you haven't done this yet, you should try version 10 instead.
