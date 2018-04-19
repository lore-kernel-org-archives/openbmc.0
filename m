Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G0iiBqWd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E5O+y5Xe"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQ6s4MPQzF21J
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 13:52:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A788B21D1A;
 Wed, 18 Apr 2018 23:52:34 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 18 Apr 2018 23:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=4LMbFl3bLdmyVe/S70wxA/v+TaZG1
 UI9WyEUprJ6LQo=; b=G0iiBqWdU/k3psz7Kiw+T/aFOxWh7KC/6tlPllAsUoeGf
 kogljAElOaWd5L/F96JLVVKiIuVq7o6BfGAsGqh/0iGenJVHO74IPv0nGT140x2E
 LLkmShnwM0FR1A0cjfWob834jH/RaCiQgtJTY4lRfXNUfMHBBIFd+7xPQmV6uJ28
 9Qho1EXVA5gs9Ck/Lp/iL3z4zOOx0gVEVFE/CjjJ3howY5j/VHh0PQ0ETC73JD5n
 y7YT+K4kda981VsQ00xoQ7YXdLmiMO304eQNUIfhdP5POhI8EVwf49gedXDYe1TQ
 WRooBRXSbu3GEL7F2OnotK7bk6bwet3LqdA+Xt44Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4LMbFl
 3bLdmyVe/S70wxA/v+TaZG1UI9WyEUprJ6LQo=; b=E5O+y5XesWOtbr81/CuREK
 o+T/yN4ySDY241Fg5BYxW0QiWVxhF3DPZSgPilJRuUQM8/wQVfeEJV1O1rRengg9
 LaNq3Kx8C6E2NzgBqr3cYb9u5xg/z+wRTie5t3zwJgKEXMHtkQWXyxCP3m+WpZnY
 QzWCI474K/tqGhJWgP4KlBBscgZabEv8tbtsLO6TKX4pUMIFVK8owBrr/4jsLPI6
 ibcIzCR90P9+w5ip67vyHZziDDC4MH1TBGDJUe5BMe5Q5IOgwCndLYhxc3/gVC9f
 Zf6qn3beABfCg76vVPFXhCrninyIDMADtDgONGBpM6lVXsTLdIQOnK/vcXB+h/lQ
 ==
X-ME-Sender: <xms:ghLYWl07K_vzt3K9IDRDyxdzKRPJWpN_AZdnjsikDzvtqw4XOCoE_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6153F4256; Wed, 18 Apr 2018 23:52:34 -0400 (EDT)
Message-Id: <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Date: Thu, 19 Apr 2018 13:22:34 +0930
In-Reply-To: <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
 <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 03:52:39 -0000



On Thu, 19 Apr 2018, at 12:37, Joel Stanley wrote:
> On 12 April 2018 at 13:21, Andrew Jeffery <andrew@aj.id.au> wrote:
> > The ASPEED BMC SoCs have many knobs and switches that are sometimes
> > design-specific and often defy any approach to unify them under an
> > existing subsystem.
> >
> > Add a driver to translate a devicetree table into sysfs entries to
> > expose bits and fields for manipulation from userspace. This encompasses
> > concepts from scratch registers to boolean conditions to enable or
> > disable host interface features.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/soc/Kconfig                  |   1 +
> >  drivers/soc/Makefile                 |   1 +
> >  drivers/soc/aspeed/Kconfig           |  11 +++
> >  drivers/soc/aspeed/Makefile          |   1 +
> >  drivers/soc/aspeed/aspeed-bmc-misc.c | 187 +++++++++++++++++++++++++++++++++++
> >  5 files changed, 201 insertions(+)
> >  create mode 100644 drivers/soc/aspeed/Kconfig
> >  create mode 100644 drivers/soc/aspeed/Makefile
> >  create mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c
> >
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> > index 07fc0ac51c52..776fd5978f70 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -1,6 +1,7 @@
> >  menu "SOC (System On Chip) specific Drivers"
> >
> >  source "drivers/soc/actions/Kconfig"
> > +source "drivers/soc/aspeed/Kconfig"
> >  source "drivers/soc/atmel/Kconfig"
> >  source "drivers/soc/bcm/Kconfig"
> >  source "drivers/soc/fsl/Kconfig"
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > index 9241125416ba..94a5b97c4466 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -3,6 +3,7 @@
> >  #
> >
> >  obj-$(CONFIG_ARCH_ACTIONS)     += actions/
> > +obj-$(CONFIG_ARCH_ASPEED)       += aspeed/
> >  obj-$(CONFIG_ARCH_AT91)                += atmel/
> >  obj-y                          += bcm/
> >  obj-$(CONFIG_ARCH_DOVE)                += dove/
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > new file mode 100644
> > index 000000000000..704a4efe180f
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -0,0 +1,11 @@
> > +menu "ASPEED SoC drivers"
> > +
> > +config ASPEED_BMC_MISC
> > +       bool "Miscellaneous ASPEED BMC interfaces"
> 
> Do you mean bool or tristate? if you mean bool, drop the module-y bits below.

Should be tristate, was just slapping bits together :)

> 
> > +       depends on ARCH_ASPEED || COMPILE_TEST
> > +       default ARCH_ASPEED
> > +       help
> > +         Say yes to expose VGA and LPC scratch registers, and other
> > +         miscellaneous control interfaces specific to the ASPEED BMC SoCs
> > +
> > +endmenu
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > new file mode 100644
> > index 000000000000..d1a80f9a584f
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_ASPEED_BMC_MISC) += aspeed-bmc-misc.o
> > diff --git a/drivers/soc/aspeed/aspeed-bmc-misc.c b/drivers/soc/aspeed/aspeed-bmc-misc.c
> > new file mode 100644
> > index 000000000000..48522a736a05
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/aspeed-bmc-misc.c
> 
> copyright headahs

Good catch.

> 
> > @@ -0,0 +1,187 @@
> > +#include <linux/kobject.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#define DEVICE_NAME "aspeed-bmc-misc"
> 
> This is the name of our chardev? No, it appears to just be the driver
> name. You can probably just use it directly.

Yep

> 
> An observation: It's the only thing inside this file that is aspeed
> specific. If not for the name, it could be generic code.

I agree, hence some of the bullet points in the cover letter. But it's name and location was also partly driven by Arnd's suggestion that we stick the junk in drivers/soc, and it felt a bit weird not to use aspeed in the name given the convention there.

> 
> lgtm. I suggest writing up some bindings and putting on the asbestos pants.

Wheee...

> 
> I'll merge this into openbmc with the IBM copyright added to the top.

Sounds good.

> With this adding userspace ABI, anyone who writes code against it will
> need to make themselves available for rework as it goes through
> upstream review.

Yeah. Will try to make sure people are aware of this.

Thanks for the feedback.

Andrew
