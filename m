Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsDhV3J9BzDqh2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:02:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vu7m3wSe"; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id d14so48610900qkb.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lxSyy8x5PIES1kha7C0SAKIH+PttqFo7BXSe+qxa8kU=;
 b=vu7m3wSeOPfviDY2yz1F1icGlfYSJIyZbOXQMz3tuvsGqZjcFFlgAQzecZFY4S0GIO
 6WKItzitQ9TzwQLtsQ7/ho5LZaXJYHK0+jwroog2Ai9zbh+DH5fCQmle/CXl26PKyPYE
 VeJi+0OrSGsnqA5S8xLzJJ1+LDKOYM/h4e9Q95gOBTezKWKc4mk0EB6OfRYVAxUkejic
 8jDG430d03AnEifYluCw6f1ihdBUW1Q0L/QbtnlajLMsmOgBZWzUQ5UEqCeCRX9xAHq1
 YaFId9XL2uKGa74LIIE1DV0MT81kAiajABGjvJAfe9nTOVmWWBIanbpJjb9utMGtClaR
 6jQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lxSyy8x5PIES1kha7C0SAKIH+PttqFo7BXSe+qxa8kU=;
 b=GaFUMFzQkH8SDuN4RvLfi5FbiNZsTqDNxXGQmw1nR/qSfi6mNtk5h6tP0AZfMUMapA
 cGLifaA28Tt31/GnZfD9UJmqfSUMuEANCpYaGD1AxE+77OExLxJ6/wmd+RbMUCs9hh1v
 Afu5yxYTpXDVhAjpdwm0CTKEF6v5VO/0hWKreORhkwhppKPscAIag8QpnoeDvyNIYunp
 EjBhbcMwcRv3kGg2OykJwy5NTk6BsyQziQbCDN5Fn8S6c9VESpVtsQf+5Oi/tlwcCOOB
 kJv5edIYPmV5/n1DSBSRRZvsxde/UuBr4CX3R5ce69bUXZ3NhL9aTKarEyyCZOMzkzLx
 aiKg==
X-Gm-Message-State: AKS2vOzk74LTWr2VZxcNUAvmnliWJXeHnDzAc/fxwsvSTaUdEjCN7deU
 wF1PBeoHHqAp999FqmjWIiOBxG/XCqzp
X-Received: by 10.55.158.208 with SMTP id h199mr30133566qke.254.1497931367247; 
 Mon, 19 Jun 2017 21:02:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.73 with HTTP; Mon, 19 Jun 2017 21:02:46 -0700 (PDT)
In-Reply-To: <20170619141322.devvmcbjaeq4jnv5@ninjato>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-5-brendanhiggins@google.com>
 <20170619141322.devvmcbjaeq4jnv5@ninjato>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 19 Jun 2017 21:02:46 -0700
Message-ID: <CAFd5g471kpgskO1MkBPZgFLbwAqncT_NZy=igVRkYJpxDNRVyg@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
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
X-List-Received-Date: Tue, 20 Jun 2017 04:02:51 -0000

I thought all of the comments made sense and will be addressed in my
next revision,
except the following:

>> +static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>> +{
>> +     unsigned long time_left, flags;
>> +     int ret = 0;
>> +     u32 command;
>> +
>> +     spin_lock_irqsave(&bus->lock, flags);
>> +     command = readl(bus->base + ASPEED_I2C_CMD_REG);
>> +
>> +     if (command & ASPEED_I2CD_SDA_LINE_STS) {
>> +             /* Bus is idle: no recovery needed. */
>> +             if (command & ASPEED_I2CD_SCL_LINE_STS)
>> +                     goto out;
>> +             dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
>> +                     command);
>> +
>> +             reinit_completion(&bus->cmd_complete);
>> +             writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
>> +             spin_unlock_irqrestore(&bus->lock, flags);
>> +
>> +             time_left = wait_for_completion_timeout(
>> +                             &bus->cmd_complete, bus->adap.timeout);
>> +
>> +             spin_lock_irqsave(&bus->lock, flags);
>> +             if (time_left == 0)
>> +                     goto reset_out;
>> +             else if (bus->cmd_err)
>> +                     goto reset_out;
>> +             /* Recovery failed. */
>> +             else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
>> +                        ASPEED_I2CD_SCL_LINE_STS))
>> +                     goto reset_out;
>> +     /* Bus error. */
>> +     } else {
>> +             dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
>> +                     command);
>
> Same dbg message as in the condition? Move it out of the 'if'?

Message is the same; that's true; however, I only want to print this
if I am actually doing
the recovery. There is a case in the first condition where we actually
don't attempt recovery.
(See both SDA and SCL high). Nevertheless, now that I am looking at
this. I think it might
make sense to make the dbg statements different since I can explain
what type of recovery
I am attempting.

>
>> +
>> +             reinit_completion(&bus->cmd_complete);
>> +             writel(ASPEED_I2CD_BUS_RECOVER_CMD,
>> +                    bus->base + ASPEED_I2C_CMD_REG);
>
> Out of interest: What does the RECOVER_CMD do?

According to the documentation, it attempts to create 1 to 8 SCL
cycles to force any stuck
device to let go of the SDA line. It then puts the hardware in a sane
state once it detects
that the bus has been recovered. I will put a comment to this effect.

>
>> +             spin_unlock_irqrestore(&bus->lock, flags);
>> +
>> +             time_left = wait_for_completion_timeout(
>> +                             &bus->cmd_complete, bus->adap.timeout);
>> +
>> +             spin_lock_irqsave(&bus->lock, flags);
>> +             if (time_left == 0)
>> +                     goto reset_out;
>> +             else if (bus->cmd_err)
>> +                     goto reset_out;
>> +             /* Recovery failed. */
>> +             else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
>> +                        ASPEED_I2CD_SDA_LINE_STS))
>> +                     goto reset_out;
>> +     }
>> +
>> +out:
>> +     spin_unlock_irqrestore(&bus->lock, flags);
>> +
>> +     return ret;
>> +
>> +reset_out:
>> +     spin_unlock_irqrestore(&bus->lock, flags);
>> +
>> +     return aspeed_i2c_reset(bus);
>> +}

Cheers!
