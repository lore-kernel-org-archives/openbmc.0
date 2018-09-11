Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DN/ZOUPF"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4291S45VywzF397;
 Wed, 12 Sep 2018 09:33:07 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id p5-v6so31093plk.3;
 Tue, 11 Sep 2018 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aPEzi/n+I+NAyw/CrtLwb3cb0Gi7zUQHMoGoDJ2O1Rc=;
 b=DN/ZOUPFIHtxm8dn3fCBPZYvIqlOP4DcWjCBpIZpPWDACd2bQdDTJ9Yi1OQ9VLmTFt
 kYOi0rV8WR5CSm+09gpcqe6hLKmbV0V1sLMzqd32w2vJHnSn2sIj5Fy6Qbmy9yFgbQvL
 ikRYz+xG6J3oghfdMUi9Uw6ZfREV0d5zgiOaYVGheTChAzqpzg7qBaeRrTysXUdImwtb
 lV+pDhV+XPkCMMUm7ThrlIlNLXJeNwzc/8FjOIpy4vZSyD/K0FdgUT5mNvjynp9+uDCz
 iaKJr8DwX65FQV2xRxVww78aaNfUEgI+I77lw+PHax1yRsE+hkTyEIY5uNSi+3hEwjLx
 r/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=aPEzi/n+I+NAyw/CrtLwb3cb0Gi7zUQHMoGoDJ2O1Rc=;
 b=SiaDT7iqxCkqmV6jDuNn3IEbgNWQc9h5EFKnwJG8kUSbtWf9XmdAyRU00641jbPh85
 QG+Wqi65sAM/iCIV0p4PcMNhISBM8ak6k+Pk+6tKwErWUsZFZZa5KoqpSjPT9QgGMPus
 rzQgyuW8J3/FLLRyLfHsz6fA+di//g8Iq6iXD5DBFX0Iq/3XqHuEWKpezNR0Ig16rTyu
 Ik+o1uobOLIIRpYqWFCCFCBeehApZNwDlumO7EfAzhgmtsrgkopdic8WrxShB6o8lkr+
 nAAfljATSlkqx5tkdf97bD008n9Ohz8huFxABhAaO1vTZlOtOTitnU7rvSokga0M/TYb
 372Q==
X-Gm-Message-State: APzg51CWSW92jft5TvCqcXFf8LrbMe4yucCBRM967fvMKL2kgPF7Ja5G
 e+fdRqiWhaL5+4NVrsZZc/o=
X-Google-Smtp-Source: ANB0VdbKNZ8awRMLn7KUxGnYocZMLedc18X3GXSk9Yyt7deRKYgdciNvLLTelP/nBSv7ophAmqJ5dw==
X-Received: by 2002:a17:902:c6b:: with SMTP id
 98-v6mr29792109pls.233.1536708785677; 
 Tue, 11 Sep 2018 16:33:05 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w5-v6sm24216064pfn.44.2018.09.11.16.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 16:33:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Sep 2018 16:33:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined
 irq events properly
Message-ID: <20180911233302.GA18799@roeck-us.net>
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
 <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
 <20180911204107.GA26017@roeck-us.net>
 <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
 <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 23:33:09 -0000

On Wed, Sep 12, 2018 at 08:23:29AM +0930, Joel Stanley wrote:
> On Wed, 12 Sep 2018 at 07:48, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >
> > On 9/11/2018 1:41 PM, Guenter Roeck wrote:
> > > On Tue, Sep 11, 2018 at 01:30:41PM -0700, Jae Hyun Yoo wrote:
> 
> > >> I checked this patch again but it doesn't have any change that could
> > >> affect to the probing flow. I'll debug the issue on qemu 3.0 environment
> > >> and will share if I find something.
> > >>
> > > The problem may be that qemu and the new code disagree how interrupts
> > > should be generated and handled, and the new code does not handle the
> > > interrupts it receives from the simulated hardware. This will result
> > > in i2c device probe failure, which in turn can cause all kinds of
> > > problems.
> > >
> >
> > Yes, that makes sense. Looks like it should be reverted until the issue
> > is fixed. Will submit a patch to revert it.
> 
> Let's not rush. The qemu model was written in order to allow us to
> test the kernel code, and was validated by the kernel driver we have.
> We've had situations in the past (with the i2c driver in fact) where a
> change in the driver required an update of the model to be more
> accurate.
> 
> I suggest we wait until Cedric has a chance to look at the issue
> before reverting the patch.
> 

Looking into the patch, clearing the interrupt status at the end of an
interrupt handler is always suspicious and tends to result in race
conditions (because additional interrupts may have arrived while handling
the existing interrupts, or because interrupt handling itself may trigger
another interrupt). With that in mind, the following patch fixes the
problem for me.

Guenter

---

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index c258c4d9a4c0..c488e6950b7c 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -552,6 +552,8 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_lock(&bus->lock);
 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	/* Ack all interrupt bits. */
+	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
 	irq_remaining = irq_received;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -584,8 +586,6 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-	/* Ack all interrupt bits. */
-	writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
 	spin_unlock(&bus->lock);
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
