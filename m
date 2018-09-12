Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDtM14K9"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429XfK6999zDqjV;
 Thu, 13 Sep 2018 05:58:49 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id s17-v6so1479350plp.7;
 Wed, 12 Sep 2018 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vX8n0KmAjuMJfBREk2i/rTqu87r3EuXkGrNwOO8AXZM=;
 b=dDtM14K9Ig8F8S2AKOMPjfVxEP0na1Y5FMRH0WMA5JjnoaV7zv5NDL3h7Cnn/yCiGK
 2owXVsCCJbAKAsO6ky9Q91IuAYDQgJSQOHFgeHLQa7lbWDy0fx73Wx0ftonncNqoBqNF
 4mBONAvR3E5TP7fJk3KsqlhuUnjo2t7WJW6SQajX5eZYm1YYRzuUneci5gZcbY9dxcz4
 Eq5UBczkBbwalxi0B/UumT7X5l25ZYUw0TfPDaQohuvw5PutaEyTO7JvTAqaSk9djsB6
 wXl2JGlnuXSxPsNA9IVIhfppfozyJe6NTSu9JRfClE2J1+vuA9Dt1AxDw8gwgGhN5kgB
 RtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=vX8n0KmAjuMJfBREk2i/rTqu87r3EuXkGrNwOO8AXZM=;
 b=EOdLtgu2zB38P3VxunaUCL5FE0JQ2tTXOl/wNTcEzEx03oJyzI3OJPZAacx55+obGa
 2xLPPUxxrHA9h28/g7hB++4HsuHF+lvVNjAM/tVnfaIYzWH1VanC5WkIqO/093aVXXa/
 FfWs/fdKhgh5c8eL4wB7rcYpHNK6VHaHzALXZ9tBEEzBat4PlY9fn2IiuPXiVuz/vvsT
 IjDYSV0D0rY87Yl5fOi2Nqh131aMNHeqByvvk2lYUwYcNL7k5BpUd5SS1pckxivFUdt5
 fldVhHh9wERh6+Mmx5KuGmOPvSbv82dw4Atasly/vLNtKdkaKuB7R19dwGAb7Tn5ankN
 VgjA==
X-Gm-Message-State: APzg51CM4AV3tXMvk7Kkcp2nSqVYbaiq3PqpfG8gZMTwjhwmDH9PYlle
 Q2UoOnAWVwpIlLjvO34vLC4=
X-Google-Smtp-Source: ANB0VdYAhtcAdkyc+Pbd4aYUa4MH+f7BEAk9W5xSQ2ENGHAgCvqWyIjRG9ExMGlCdKakMlhjzi418g==
X-Received: by 2002:a17:902:e85:: with SMTP id
 5-v6mr3883728plx.73.1536782327159; 
 Wed, 12 Sep 2018 12:58:47 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id b21-v6sm6175248pfm.97.2018.09.12.12.58.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Sep 2018 12:58:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Sep 2018 12:58:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Feist <james.feist@linux.intel.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined
 irq events properly
Message-ID: <20180912195844.GA6893@roeck-us.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 12 Sep 2018 19:58:50 -0000

On Wed, Sep 12, 2018 at 09:54:51AM -0700, Jae Hyun Yoo wrote:
> On 9/11/2018 6:34 PM, Guenter Roeck wrote:
> >On Tue, Sep 11, 2018 at 04:58:44PM -0700, Jae Hyun Yoo wrote:
> >>On 9/11/2018 4:33 PM, Guenter Roeck wrote:
> >>>Looking into the patch, clearing the interrupt status at the end of an
> >>>interrupt handler is always suspicious and tends to result in race
> >>>conditions (because additional interrupts may have arrived while handling
> >>>the existing interrupts, or because interrupt handling itself may trigger
> >>>another interrupt). With that in mind, the following patch fixes the
> >>>problem for me.
> >>>
> >>>Guenter
> >>>
> >>>---
> >>>
> >>>diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> >>>index c258c4d9a4c0..c488e6950b7c 100644
> >>>--- a/drivers/i2c/busses/i2c-aspeed.c
> >>>+++ b/drivers/i2c/busses/i2c-aspeed.c
> >>>@@ -552,6 +552,8 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> >>>  	spin_lock(&bus->lock);
> >>>  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> >>>+	/* Ack all interrupt bits. */
> >>>+	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
> >>>  	irq_remaining = irq_received;
> >>>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >>>@@ -584,8 +586,6 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> >>>  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
> >>>  			irq_received, irq_handled);
> >>>-	/* Ack all interrupt bits. */
> >>>-	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
> >>>  	spin_unlock(&bus->lock);
> >>>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
> >>>  }
> >>>
> >>
> >>My intention of putting the code at the end of interrupt handler was,
> >>to reduce possibility of combined irq calls which is explained in this
> >>patch. But YES, I agree with you. It could make a potential race
> >
> >Hmm, yes, but that doesn't explain why it would make sense to acknowledge
> >the interrupt late. The interrupt ack only means "I am going to handle these
> >interrupts". If additional interrupts arrive while the interrupt handler
> >is active, those will have to be acknowledged separately.
> >
> >Sure, there is a risk that an interrupt arrives while the handler is
> >running, and that it is handled but not acknowledged. That can happen
> >with pretty much all interrupt handlers, and there are mitigations to
> >limit the impact (for example, read the interrupt status register in
> >a loop until no more interrupts are pending). But acknowledging
> >an interrupt that was possibly not handled is always bad idea.
> 
> Well, that's generally right but not always. Sometimes that depends on
> hardware and Aspeed I2C is the case.
> 
> This is a description from Aspeed AST2500 datasheet:
>   I2CD10 Interrupt Status Register
>   bit 2 Receive Done Interrupt status
>         S/W needs to clear this status bit to allow next data receiving.
> 
> It means, driver should hold this bit to prevent transition of hardware
> state machine until the driver handles received data, so the bit should
> be cleared at the end of interrupt handler.
> 
That makes sense. Does that apply to the other status bits as well ?
Reason for asking is that the current code actually gets stuck
in transmit, not receive.

Thanks,
Guenter
