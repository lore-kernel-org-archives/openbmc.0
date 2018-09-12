Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dwd5qKD6"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42948Z6f57zF3HP;
 Wed, 12 Sep 2018 11:34:54 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g2-v6so152883plo.2;
 Tue, 11 Sep 2018 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1+iGQQaC2LkrZ1xdmEQSqnSrhnZyuykv1+AdPUMbPYo=;
 b=Dwd5qKD6SyE4y1va8wixKGqNMVYdV2dzutsGnAmZpa5Km4H7nodmizUF+ho9rKw6qC
 OSKxvojxKvip4eqYScvG1oPeskHkljhIlW+wnKjJaBGhl84DXRkfzEoNYeJUFRlLta28
 EMZxM07EE4+Kp0ApT0aibedavdIUbc8D0L5wSULXrVa8v2jbCOaBFakPOWvKMcSYqeKp
 busxFq+D/qmWDsWSyi9sNc0EVKTjYDwGerKuyyZsgn6QRcKjSj2q8nwEyNo9GeuoxMdN
 WLNdxQ2oojWoN3ZS71gxOZ+RfecF5km/pfb0UUO9djE4QEuhC+62kH8KrhnO8n26MnNC
 AvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1+iGQQaC2LkrZ1xdmEQSqnSrhnZyuykv1+AdPUMbPYo=;
 b=MkA+KZChnMafDi4cjVnoDS4biQwA80Xd5yRE50NeDC8T/hqGe0t5I8PmwDR8lzjVkV
 39F7GJBuEVkd/2iHRC4bS3CRa3ceH4CZbBwSmMHm7K3fasIJhIdaFvxSxfSYDgk76oXe
 30tjFdKdkXp4DU5jQWcZ/BURsCrJNQ1ARLUGM7dD83VpzHrq/OEN5d1NI6DP5oZCAf5Z
 sNpeo2gysUmQWAaEsuNtcxqx6GVbrRhot2vUirFFwbuek9v22YpxGrJbNe1n4JtCddXX
 Q8zJA6lT1QG5iRZFVwGuWoRguXzrINJejsl11lEZwK4ZK3vEZ/2IHQCXg62rFO+VFYDZ
 2iCw==
X-Gm-Message-State: APzg51Dt9ySckYL4+GAc9G98iHtKYNdGrN0O8GAPGqPQMaEXynMbQXF3
 a/sIWTORetJ5+a5zSPQgruc=
X-Google-Smtp-Source: ANB0VdYrRpJuGrfk2lfjdEOGj0IeE5/ptIRvM0rfbgGaQbOXRhR1ekHRShive8c4Cq7bcS4wmIJwBg==
X-Received: by 2002:a17:902:7e09:: with SMTP id
 b9-v6mr29796214plm.221.1536716092430; 
 Tue, 11 Sep 2018 18:34:52 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w12-v6sm30860976pfd.110.2018.09.11.18.34.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 18:34:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Sep 2018 18:34:49 -0700
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
Message-ID: <20180912013449.GA12612@roeck-us.net>
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
 <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
 <20180911204107.GA26017@roeck-us.net>
 <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
 <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
 <20180911233302.GA18799@roeck-us.net>
 <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 12 Sep 2018 01:34:55 -0000

On Tue, Sep 11, 2018 at 04:58:44PM -0700, Jae Hyun Yoo wrote:
> On 9/11/2018 4:33 PM, Guenter Roeck wrote:
> >Looking into the patch, clearing the interrupt status at the end of an
> >interrupt handler is always suspicious and tends to result in race
> >conditions (because additional interrupts may have arrived while handling
> >the existing interrupts, or because interrupt handling itself may trigger
> >another interrupt). With that in mind, the following patch fixes the
> >problem for me.
> >
> >Guenter
> >
> >---
> >
> >diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> >index c258c4d9a4c0..c488e6950b7c 100644
> >--- a/drivers/i2c/busses/i2c-aspeed.c
> >+++ b/drivers/i2c/busses/i2c-aspeed.c
> >@@ -552,6 +552,8 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> >  	spin_lock(&bus->lock);
> >  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> >+	/* Ack all interrupt bits. */
> >+	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
> >  	irq_remaining = irq_received;
> >  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >@@ -584,8 +586,6 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> >  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
> >  			irq_received, irq_handled);
> >-	/* Ack all interrupt bits. */
> >-	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
> >  	spin_unlock(&bus->lock);
> >  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
> >  }
> >
> 
> My intention of putting the code at the end of interrupt handler was,
> to reduce possibility of combined irq calls which is explained in this
> patch. But YES, I agree with you. It could make a potential race

Hmm, yes, but that doesn't explain why it would make sense to acknowledge
the interrupt late. The interrupt ack only means "I am going to handle these
interrupts". If additional interrupts arrive while the interrupt handler
is active, those will have to be acknowledged separately.

Sure, there is a risk that an interrupt arrives while the handler is
running, and that it is handled but not acknowledged. That can happen
with pretty much all interrupt handlers, and there are mitigations to
limit the impact (for example, read the interrupt status register in
a loop until no more interrupts are pending). But acknowledging
an interrupt that was possibly not handled is always bad idea.

Thanks,
Guenter
