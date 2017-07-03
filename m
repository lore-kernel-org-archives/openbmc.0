Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1Q425kbczDr42
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 21:33:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JFsBmm4v"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pva8g4Kx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E302920AE7;
 Mon,  3 Jul 2017 07:32:59 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Mon, 03 Jul 2017 07:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=z3WMFixvOEC7cg47wbt5AY0sbkNCZ
 CFMWA6eBQ0rcg0=; b=JFsBmm4vDQ0w8FNH2TgA1UnWoPmC5k2ABjuP8GbB16+nE
 vX7XeNqoAr4esVTh8ljqFgwHbtC8lPI/WS8ljpdWK6yLRW2AgzQDZsjzfG7knpMQ
 oUjHTYALqJzxc4MOfBMuhXy8nz9Asui6ls++CslruLMK2KeZUxeS9pi/pHIbajZ4
 +LS+vxhC8L/97O3sVAe/TlapusCd0e9wrBQX4L2N5afJBaNqQMmrLn2ydIPVgloF
 iTaGq6lmBSbcOww1nR6f+R4yg/sP/L+DmHWhw+ysI2AjdyJkeQ+2fl4GJp/Z1K6M
 3gfWMsY5CtN54EtZ/oQ/kBTB2nd0c0lS/byqORyKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z3WMFi
 xvOEC7cg47wbt5AY0sbkNCZCFMWA6eBQ0rcg0=; b=pva8g4KxMulPyFJwvBMVCg
 kP7rLbrVBaNsFbuEe6Vs1J/b4vnRChV+rugvOYkqg2UOrdCC0DWmrMX6cZFQb+rq
 HmDki5Eo7f2UxYCU2y8rBJNtrtF7hZ0cHxzRZMleVO4m3lJnE84lK2sxSSICRAec
 vZjII6iA6bc78zoF5qhVclhv8LAKw3EhjQBtnKwVd+e8vA7BVuIRJttOF/XGVkkR
 I4RAbfVsr8Abr+CBCncu6C7LWRqNgOACNY/AkxnzNpY6MN0koJ0M93ihvnh7yEB7
 8iUjEIj8dmM545MGgsMxZRUUz9M/Ctf2sWbJ/I6jW8Q4gmP/vXB/6YWsKYMW82Ew
 ==
X-ME-Sender: <xms:aytaWXY0CdnKReiwjY0mEkQ1krjO9S0UkQcZJcq0mkxbOc5VF5hb5g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id BA552627BD; Mon,  3 Jul 2017 07:32:59 -0400 (EDT)
Message-Id: <1499081579.166788.1028828168.46976734@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Vadim Pasternak <vadimp@mellanox.com>, Joel Stanley <joel@jms.id.au>
Cc: Milton Miller II <miltonm@us.ibm.com>,
 Mykola Kostenok <c_mykolak@mellanox.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-6c54a332
Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
In-Reply-To: <AM4PR05MB3330F620C64B16F26B120F3DA2D60@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170629133008.13045-1-c_mykolak@mellanox.com>
 <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
 <1498786277.5203.14.camel@aj.id.au>
 <AM4PR05MB3330BD0A11C99EF1DD029BCBA2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <CACPK8XdGd72RYrS-YP6kV2ewvU5tYf0SqjzPEtRE-Nbeh3bP0w@mail.gmail.com>
 <AM4PR05MB3330F620C64B16F26B120F3DA2D60@AM4PR05MB3330.eurprd05.prod.outlook.com>
Date: Mon, 03 Jul 2017 21:02:59 +0930
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
X-List-Received-Date: Mon, 03 Jul 2017 11:33:10 -0000

Hi Vadim,

On Mon, Jul 3, 2017, at 20:22, Vadim Pasternak wrote:
> Hi Joel,
> 
> > -----Original Message-----
> > From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel
> > Stanley
> > Sent: Friday, June 30, 2017 8:31 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Andrew Jeffery <andrew@aj.id.au>; Milton Miller II
> > <miltonm@us.ibm.com>; Mykola Kostenok <c_mykolak@mellanox.com>;
> > openbmc@lists.ozlabs.org
> > Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
> > 
> > On Fri, Jun 30, 2017 at 2:21 PM, Vadim Pasternak <vadimp@mellanox.com>
> > wrote:
> > > Hi Andrew,
> > >
> > >> -----Original Message-----
> > >> From: openbmc [mailto:openbmc-
> > >> bounces+yanivab=mellanox.com@lists.ozlabs.org] On Behalf Of Andrew
> > >> Jeffery
> > >> Sent: Friday, June 30, 2017 4:31 AM
> > >> To: Milton Miller II <miltonm@us.ibm.com>; Mykola Kostenok
> > >> <c_mykolak@mellanox.com>
> > >> Cc: openbmc@lists.ozlabs.org
> > >> Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
> > >>
> > >> On Fri, 2017-06-30 at 00:34 +0000, Milton Miller II wrote:
> > >> > On June 29 2017 at 8:31 in some time zone, Mykola Kostenok wrote:
> > >> > >
> > >> > > Set maximum number of gpio for ARCH_ASPEED.
> > >> > >
> > >> > > > > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > >> > > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig index
> > >> > > 186c4c214e0a..9d373685c628 100644
> > >> > > --- a/arch/arm/Kconfig
> > >> > > +++ b/arch/arm/Kconfig
> > >> > > @@ -1492,6 +1492,7 @@ config ARCH_NR_GPIO
> > >> > >   default 352 if ARCH_VT8500
> > >> > >   default 288 if ARCH_ROCKCHIP
> > >> > >   default 264 if MACH_H4700
> > >> > > > > +     default 232 if ARCH_ASPEED
> > >> > >   default 0
> > >> > >   help
> > >> > >     Maximum number of GPIOs in the system.
> > >> >
> > >> >
> > >> > This is a bad idea.
> > >>
> > >> I agree.
> > >>
> > >> >  This sets the maximum total number of gpios supported by the
> > >> > kernel, and setting it to this value would not allow any space for
> > >> > the various pca expanders to define additional gpios.
> > >> >
> > >> > The logic in asm-generic/gpio.h says if the CONFIG number is 0 use
> > >> > 512 else use the supplied value.
> > >> >
> > >> > I'm guessing this was motivated to make the gpio numbers match with
> > >> > the controller.
> > >>
> > >> Right; what's missing is any mention of the motivation.
> > >>
> > >> Mykola: What problem are you trying to solve with this patch? As
> > >> Milton mentions it might be making the GPIO numbers align with the
> > >> controller, but why do you need that? It should already be possible
> > >> to describe the system without this patch.
> > >>
> > >> >   Unfortunately the gpios from
> > >> > the device tree are assigned numbers from the end of the number
> > space.
> > >> >
> > >> > If we need to assign a specific range, we should try to define an
> > >> > optional property in the gpio chip binding and assign the value to
> > >> > gpio-chip.base in gpio-aspeed.c, but I am doubtful that such a
> > >> > patch would be accepted upstream.
> > >>
> > >> I tend to doubt it as well. Describing GPIOs in the devicetree always
> > >> uses the GPIO controller phandle for a base reference and the pin
> > >> numbers are mapped at runtime as required.
> > >>
> > >> If it's a userspace problem, then there are means via sysfs and the
> > >> chardev API to discover which controller you're talking to (e.g. chip
> > >> labels, named gpios). Either of those approaches should suffice.
> > >
> > > The motivation to control GPIOs though SYSFS.
> > > We have a couple of reasons for that:
> > >
> > > Need it to support production - they used to verify all the connected
> > GPIOs.
> > >
> > > Some GPIOs used to allow access to remote  components like  NC-SI SPI
> > flash, BIOS SPI flash, JTAG interface to CPLDs or some others devices.
> > >
> > > And we are doing it through /sys/class/gpio.
> > 
> > You should be able to achieve this without any further kernel changes.
> > OpenBMC on Aspeed uses the sysfs API to do this.
> > 
> > Can you show is the code that is using the GPIOs?
> 
> We just getting in /sys/class/gpio all with offset 280, like:
> gpio281      gpio511      gpiochip280

This looks like what I'd expect.

> 
> It means we have to consider this offset in our user space applications,
> in case we can't have gpiochip0 here. Right?

Yes. For example, the openbmc userspace probes the GPIO chips here:

https://github.com/openbmc/skeleton/blob/master/pysystemmgr/obmc/system/__init__.py#L4

Hope that helps.

Andrew

> 
> 
> > 
> > Cheers,
> > 
> > Joel
