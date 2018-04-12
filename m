Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MDPx4cwRzDr3y;
 Thu, 12 Apr 2018 18:21:09 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w3C8Kn5l027318;
 Thu, 12 Apr 2018 03:20:51 -0500
Message-ID: <1523521249.11062.168.camel@kernel.crashing.org>
Subject: Re: openbmc Digest, Vol 32, Issue 32
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, openbmc@lists.ozlabs.org,
 openbmc-request@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>
Date: Thu, 12 Apr 2018 18:20:49 +1000
In-Reply-To: <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
References: <mailman.355.1523511154.2391.openbmc@lists.ozlabs.org>
 <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2018 08:21:10 -0000

On Thu, 2018-04-12 at 15:55 +0800, Wang, Haiyue wrote:
> Hi Andrew,
> 
> Facebook uses the 'devmem' utility and python script to implement the 
> soc register
> 
> read and write in a simple way. And the yocto layer is also very clear 
> like different

Using /dev/mem is really bad and very much discouraged. In fact for
security reasons, /dev/mem should be disabled in the kernel in
production. We need to do something better, hence the proposal.

> chip vendor and common parts.
> 
> 
> Kernel device tree upstream is also very slow, we needs two parts 
> (device tree + user app)

What do you mean by "very slow" ? I don't understand your statement.

> to finish the soc setting. But Facebook just uses user app, this 
> development is fast, and
> 
> simple is the best.

Sorry I don't really get what you mean. Please elaborate.

> Well, just for sharing what I found, I may misunderstood the BIG idea 
> after this kernel

The basic idea is to have a mechanism by which the SoC code in the
kernel can expose to userspace via sysfs a *small* selected set of
tunables that userspace might have to tweak for various platform
specific reasons.

To qualify, these things have to strictly be things that don't fit
within any existing Linux ABI and subsystem, and typically that affect
the *host* and not the BMC itself (or to a very limited extent).

Some examples are the tunables to control whether the host can access
the AHB bus via the backdoor on LPC or PCIe (and if yes which regions
are enabled).

> patch design. :-)
> 
> 
> soc_gpio_table = {
> 
> 	'A10': [
> 
> 	Function('SDA3', BitsEqual(0x90, [16], 0x1)),
> 
> 	Function('GPIOQ1', None)
> 
> 	],
> 
> 	'A11': [
> 
> 	Function('SCL3', BitsEqual(0x90, [16], 0x1)),
> 
> 	Function('GPIOQ0', None)
> 
> 	],
> 
> https://github.com/facebook/openbmc/blob/helium/common/recipes-utils/openbmc-gpio/files/openbmc-gpio-1/phymemory.py
> 
> https://github.com/facebook/openbmc/blob/helium/meta-aspeed/recipes-utils/ast-mdio/files/ast-mdio.py
> 
> https://github.com/facebook/openbmc/blob/helium/meta-aspeed/recipes-utils/openbmc-gpio/files/openbmc-gpio-1/ast2500_gpio_table.py

I don't undertsand what those links are supposed to be. Please
elaborate on what you mean rather than posting random links.

Cheers,
Ben.


> 
> BR,
> 
> Haiyue
> 
> 
> On 2018-04-12 13:32, openbmc-request@lists.ozlabs.org wrote:
> > Message: 1
> > Date: Thu, 12 Apr 2018 13:21:43 +0930
> > From: Andrew Jeffery<andrew@aj.id.au>
> > To:openbmc@lists.ozlabs.org
> > Cc: Andrew Jeffery<andrew@aj.id.au>,joel@jms.id.au,jk@ozlabs.org,
> > 	benh@kernel.crashing.org
> > Subject: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous
> > 	control interfaces
> > Message-ID:<20180412035145.21488-2-andrew@aj.id.au>
> > 
> > The ASPEED BMC SoCs have many knobs and switches that are sometimes
> > design-specific and often defy any approach to unify them under an
> > existing subsystem.
> > 
> > Add a driver to translate a devicetree table into sysfs entries to
> > expose bits and fields for manipulation from userspace. This encompasses
> > concepts from scratch registers to boolean conditions to enable or
> > disable host interface features.
> > 
> > Signed-off-by: Andrew Jeffery<andrew@aj.id.au>
> > ---
> >   drivers/soc/Kconfig                  |   1 +
> >   drivers/soc/Makefile                 |   1 +
> >   drivers/soc/aspeed/Kconfig           |  11 +++
> >   drivers/soc/aspeed/Makefile          |   1 +
> >   drivers/soc/aspeed/aspeed-bmc-misc.c | 187 +++++++++++++++++++++++++++++++++++
> >   5 files changed, 201 insertions(+)
> >   create mode 100644 drivers/soc/aspeed/Kconfig
> >   create mode 100644 drivers/soc/aspeed/Makefile
> >   create mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c
> > 
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> > index 07fc0ac51c52..776fd5978f70 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -1,6 +1,7 @@
> >   menu "SOC (System On Chip) specific Drivers"
> >   
> >   source "drivers/soc/actions/Kconfig"
> > +source "drivers/soc/aspeed/Kconfig"
> >   source "drivers/soc/atmel/Kconfig"
> >   source "drivers/soc/bcm/Kconfig"
> >   source "drivers/soc/fsl/Kconfig"
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > index 9241125416ba..94a5b97c4466 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -3,6 +3,7 @@
> >   #
> >   
> >   obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
> > +obj-$(CONFIG_ARCH_ASPEED)       += aspeed/
> >   obj-$(CONFIG_ARCH_AT91)		+= atmel/
> >   obj-y				+= bcm/
> >   obj-$(CONFIG_ARCH_DOVE)		+= dove/
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > new file mode 100644
> > index 000000000000..704a4efe180f
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -0,0 +1,11 @@
> > +menu "ASPEED SoC drivers"
> > +
> > +config ASPEED_BMC_MISC
> > +	bool "Miscellaneous ASPEED BMC interfaces"
> > +	depends on ARCH_ASPEED || COMPILE_TEST
> > +	default ARCH_ASPEED
> > +	help
> > +	  Say yes to expose VGA and LPC scratch registers, and other
> > +	  miscellaneous control interfaces specific to the ASPEED BMC SoCs
> > +
> > +endmenu
