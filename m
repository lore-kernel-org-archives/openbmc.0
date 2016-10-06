Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqq2b0DqfzDrL1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 10:42:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=s2wjqWOJ; 
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id b186so32368335vkb.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=62VsNhZ4J/urIn7fcsSPL5cz71imW9fUJ+A5bOMAp18=;
 b=s2wjqWOJ8sH9mwN0qlcstJfN164pJWx1oemzJ0kdcpmOCQ77LPlrO/a0uxiK5YaLu7
 SlFwSf5N5RQaMbZRSzcBI2EvUu3kfKTZi+ou+p1z4W+AKPL4fH8uJoQavw2S0wdSMaHs
 f0o8gIN9Rk8a1kirqo1If6r6DtSk70F3gbapUlQyxtKWQm7hq/q/RnPS70qjVVL8ff5M
 Sx7/QR8tGeZ6uKoE9wUM1cyDEUp2PIQQc18FCW99Iw1olTFiTw6ab3Fh2fsLYoQVZmE8
 kFJMms3y5QFtnCa/nP3Z+9tP3JqdDL0e5mA06JyHl6r604qExVUMq0Ut/8TA+j093LWO
 7WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=62VsNhZ4J/urIn7fcsSPL5cz71imW9fUJ+A5bOMAp18=;
 b=WoIvg4jOIA+vJ2zftjU1xfaiC4y81ewvl3ZvxLJLbfROPPIK/oCSN9SK3KsjXHcqIj
 J5SB4mtja2hpqIU2nmrW2xegB6DfoX33YEVv26uNp4WuFs1J1Nt42evnGvDJuA0H4TVh
 wTZ4nu0rBKZ7990ocDx507N4Iem5uSZWdhSgiplMl0/xU6MQZHzigVQ1iGTXTz/61UQj
 rISFBy8FFaQX3OmV4daEhzw/a9uQXfc8DvlKPa7rmCnTfOv0C76DwlxBfJU/fnXpo/s+
 qh6cpo+0T0d48btoFxoPneibkevRHSnLR3yVdUpaYm0+em74dAHhbWXk0Cij5gl1V3XB
 of0Q==
X-Gm-Message-State: AA6/9Rk3VAB4+EfmFr+vGHIOKkM0SM0EMke9YcZz0SaZbf+IxpvMwDGok87m/SpxFgjCCCRnI45sIAcynwXeGA==
X-Received: by 10.31.102.130 with SMTP id a124mr11373069vkc.151.1475797364470; 
 Thu, 06 Oct 2016 16:42:44 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 6 Oct 2016 16:42:24 -0700 (PDT)
In-Reply-To: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Oct 2016 10:42:24 +1100
X-Google-Sender-Auth: Vs5GORe1YOoN-C5jvFbk-lmSP_o
Message-ID: <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
Subject: Re: I2C device driver names
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 06 Oct 2016 23:42:47 -0000

On Fri, Oct 7, 2016 at 7:14 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> Hi,
>
> As part of my work to generate a device tree from the machine readable
> workbook XML, I need to create I2C device entries, which have the compatible
> properties that need to be filled in.
>
> The following parts are present in the system I'm trying to build, with
> firmware requirements to access them.  I took a stab at the names.  Could
> someone doublecheck them and maybe comment on if a driver is missing, or
> maybe if some upcoming work is known that will include it?  I didn't have
> much luck finding a lot of these in the Documentation/devicetree/bindings
> directories.

If they're not in the kernel tree it could mean there is not a driver
for them, or that they are supported as part of the trivial device
bindings.

>
> PMBus Power supplies:   ?
>
> MAX31785 fan controller:  max,max31785

Doesn't appear to be an upstream driver. Please open a ticket.

>
> BMP280:  bosch,bmp280

Supported by the iio bmp280 driver.

>
> TMP4523A temp sensor:  ti,tmp423

Supported by the tmp421 hwmon driver.

>
> TMP275 temp sensor: ti,tmp275

Documentation/devicetree/bindings/i2c/trivial-devices.txt

Supported by the lm75 hwmon driver.

> pca9552 IO expander:  nxp,pca9552

This appears to be a LED driver?

There's a LED device driver called leds-pca955x.

>
> UCD90160 power sequencer: ti,ucd90160

A kernel driver called ucd9000 appears to support similar chips.
Please open a ticket.

>
> RX8900CE RTC:  epson,rx8900ce

No upstream driver. Please open a ticket.

>
> 24c64 EEPROM:  atmel,24c64

LGTM.

Cheers,

Joel

>
> There are also a handful of regulators, but so far I haven't heard of any
> requirements to access them.
>
> Thanks.
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
