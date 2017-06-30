Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzQ9p2DlmzDr5t
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 15:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FVfY4/o3"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id i80so4715435yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 22:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8pfaEEB9pfB3Yia0DB17/cNNegl0t9ng4+xMExdNJhY=;
 b=FVfY4/o33FiD4iLpSno10CkL8pVPvMKefObSn/ZNac3dO+GA8cBGxUNBN++zDnr/HP
 ENGmLZFEsu9jDGdqQaLWOx+De8K3LcSOQjgR8EW0MfmxiNt/jiWw28cluIp8IGa6lC8g
 WukAJLo/XwR0pCPHQcesYUKSQy6cIhgYW/8LG/8kiBQLijZo4d4V5Azo6OBHvNUz0UV8
 qROQUEwjSfhU8huYi3B7bqKnwl7tD66KU7ZHl4LQkpEK74MNCChR696G/v6ch32QdDX0
 eAraUT54tptDrMXQ+UH5YIAE20rf0QIXXVKCK2w19Xff9xc010lXj2ykWJHFBuRnFgnC
 ewpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8pfaEEB9pfB3Yia0DB17/cNNegl0t9ng4+xMExdNJhY=;
 b=chpfGE2FMXgmz/dOG0/Hkd1Wl8eyyleGVnUH5yiJzdkGNQ6xRXRxIRnYc3zOU8auhU
 Y7MAENPiL6V0gWOWqFjmFZpOh2CVdFbyTYyKhNSrrraNa0xKLu4pE+CGx+vYo/SPUJZi
 0C3yci8ji8K6YogVDKV30Tui3NX8ZZ7+GSYW8B2IX+XCO9y8+GOaERzapZeQaC4DlMiU
 L93RKiXzWMsAjD3+N3WuF7dVypA5VPdI1QwvsdS6NCYuxo8OzRXIYGoydSIEcDuyU+dl
 g/f8SEG8VbRMJBIgh0LMaxHkCZJF2LCSdjxzMzOehHTTFuF8weK3c/CXiCkkzOb64cYK
 MmzA==
X-Gm-Message-State: AKS2vOxd2HTmfjSlkh1ZfENcqufKOPQlMgoS5U59/ckNmV0ZGEelZH/F
 wWWbhmVPr35vIT61lJdJj9BGZgFh+Q==
X-Received: by 10.37.15.67 with SMTP id 64mr9188874ybp.94.1498800667833; Thu,
 29 Jun 2017 22:31:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Thu, 29 Jun 2017 22:30:47 -0700 (PDT)
In-Reply-To: <AM4PR05MB3330BD0A11C99EF1DD029BCBA2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170629133008.13045-1-c_mykolak@mellanox.com>
 <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
 <1498786277.5203.14.camel@aj.id.au>
 <AM4PR05MB3330BD0A11C99EF1DD029BCBA2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Jun 2017 15:00:47 +0930
X-Google-Sender-Auth: UguoVBjXQxqi730QHE3pLOr9-3o
Message-ID: <CACPK8XdGd72RYrS-YP6kV2ewvU5tYf0SqjzPEtRE-Nbeh3bP0w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Milton Miller II <miltonm@us.ibm.com>, 
 Mykola Kostenok <c_mykolak@mellanox.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 30 Jun 2017 05:31:11 -0000

On Fri, Jun 30, 2017 at 2:21 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> Hi Andrew,
>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+yanivab=mellanox.com@lists.ozlabs.org] On Behalf Of Andrew
>> Jeffery
>> Sent: Friday, June 30, 2017 4:31 AM
>> To: Milton Miller II <miltonm@us.ibm.com>; Mykola Kostenok
>> <c_mykolak@mellanox.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
>>
>> On Fri, 2017-06-30 at 00:34 +0000, Milton Miller II wrote:
>> > On June 29 2017 at 8:31 in some time zone, Mykola Kostenok wrote:
>> > >
>> > > Set maximum number of gpio for ARCH_ASPEED.
>> > >
>> > > > > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>> > > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig index
>> > > 186c4c214e0a..9d373685c628 100644
>> > > --- a/arch/arm/Kconfig
>> > > +++ b/arch/arm/Kconfig
>> > > @@ -1492,6 +1492,7 @@ config ARCH_NR_GPIO
>> > >   default 352 if ARCH_VT8500
>> > >   default 288 if ARCH_ROCKCHIP
>> > >   default 264 if MACH_H4700
>> > > > > +     default 232 if ARCH_ASPEED
>> > >   default 0
>> > >   help
>> > >     Maximum number of GPIOs in the system.
>> >
>> >
>> > This is a bad idea.
>>
>> I agree.
>>
>> >  This sets the maximum total number
>> > of gpios supported by the kernel, and setting it to this value would
>> > not allow any space for the various pca expanders to define additional
>> > gpios.
>> >
>> > The logic in asm-generic/gpio.h says if the CONFIG number is 0 use 512
>> > else use the supplied value.
>> >
>> > I'm guessing this was motivated to make the gpio numbers match with
>> > the controller.
>>
>> Right; what's missing is any mention of the motivation.
>>
>> Mykola: What problem are you trying to solve with this patch? As Milton
>> mentions it might be making the GPIO numbers align with the controller, but
>> why do you need that? It should already be possible to describe the system
>> without this patch.
>>
>> >   Unfortunately the gpios from
>> > the device tree are assigned numbers from the end of the number space.
>> >
>> > If we need to assign a specific range, we should try to define an
>> > optional property in the gpio chip binding and assign the value to
>> > gpio-chip.base in gpio-aspeed.c, but I am doubtful that such a patch
>> > would be accepted upstream.
>>
>> I tend to doubt it as well. Describing GPIOs in the devicetree always uses the
>> GPIO controller phandle for a base reference and the pin numbers are
>> mapped at runtime as required.
>>
>> If it's a userspace problem, then there are means via sysfs and the chardev
>> API to discover which controller you're talking to (e.g. chip labels, named
>> gpios). Either of those approaches should suffice.
>
> The motivation to control GPIOs though SYSFS.
> We have a couple of reasons for that:
>
> Need it to support production - they used to verify all the connected GPIOs.
>
> Some GPIOs used to allow access to remote  components like  NC-SI SPI flash, BIOS SPI flash, JTAG interface to CPLDs or some others devices.
>
> And we are doing it through /sys/class/gpio.

You should be able to achieve this without any further kernel changes.
OpenBMC on Aspeed uses the sysfs API to do this.

Can you show is the code that is using the GPIOs?

Cheers,

Joel
