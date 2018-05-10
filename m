Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SD0z/AAM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AvEj9p1W"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hJ355tB0zF2Mg
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 13:04:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 825BA21ACA;
 Wed,  9 May 2018 23:03:59 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 23:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=OQuEEz5DEr5knsflrHfsCWvZBDPjc
 0vk2I54r2+1HzU=; b=SD0z/AAM3W2eNCKe5RYBj42S5ejN+Wy9kimfVJyt6USTc
 2Sn8L2ua38lFE1Ir1uutLYUu5ETVeI1EtWD6n1eSw0mmTwgUY7Rx/mK6t6PIkU4C
 guYJw89djTIhPWCB867xh9Do4Wppj30RPKVzD71yBGZmMXWYyrxwsJpG6W3SRG1X
 k9Sm2XU2wKiOMm9SvA4UVwmtPFWYOYY4SUrorUcaIZQbYPErFeWHYwf6b8e0uEKl
 nsmcm+Hsu62d2wwSZOmkuK+AiZ69AKE9+vp3wZ3MEF2anJTX325teCxqS5+zDBuf
 PV1MYnIuc7R/1JvjgxvhiVJMv+eS85VUXrHgIdVvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OQuEEz
 5DEr5knsflrHfsCWvZBDPjc0vk2I54r2+1HzU=; b=AvEj9p1WTIRpwbPZvGhYAl
 FPq7CkurJwib/NgYNFv2wySyeHQ5MMqXabxWvJqWKavq4KFkJGfS2vJOS/BMvbKt
 LGGSiowLZBll8JFDjiYMwdN/CdJinAtmIkiPky73N2Nlva5km1qurEbkLDVOZhTf
 htcga4AohiDoseaSDgXb0RpBwj8K9JIPittlW7W2IjhBfdJelH3MHWCaVHlqe2c8
 k4eh0C28v2BnoVwGFnYpBpYlLmUe1iVyIxcxGWUPmFSd3MBMjGzS5yeZ84X7LD6w
 /6tjntopuFXHd2ej84rZVvZhtLdLl4oBU8QMRNVf+e+PAzAMW+8wtKTJ0K6lW+4w
 ==
X-ME-Sender: <xms:n7bzWuQy6QuKvxUc0sZwbKgYcrrCdjAY3sd63uMGfOmAJu9wrvLDSw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4BF2C412B; Wed,  9 May 2018 23:03:59 -0400 (EDT)
Message-Id: <1525921439.2436671.1366969152.5C41D3BD@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
In-Reply-To: <c3c12f08-afc1-7937-68a1-dabd559382ad@linux.vnet.ibm.com>
Date: Thu, 10 May 2018 12:33:59 +0930
Subject: Re: [PATCH linux dev-4.13 4/6] fsi/fsi-master-gpio: Add
 "no-gpio-delays" option
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-4-benh@kernel.crashing.org>
 <c3c12f08-afc1-7937-68a1-dabd559382ad@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 10 May 2018 03:04:02 -0000



On Wed, 9 May 2018, at 05:24, Christopher Bostic wrote:
> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> 
> 
> On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> > This adds support for an optional device-tree property that
> > makes the driver skip all the delays around clocking the
> > GPIOs and set it in the device-tree of common POWER9 based
> > OpenPower platforms.
> >
> > This useful on chips like the AST2500 where the GPIO block is
> > running at a fairly low clock frequency (25Mhz typically). In
> > this case, the delays are unnecessary and due to the low
> > precision of the timers, actually quite harmful in terms of
> > performance.
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  1 +
> >   .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  1 +
> >   arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  1 +
> >   drivers/fsi/fsi-master-gpio.c                 | 20 +++++++++++++++----
> >   4 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > index d746e562e8fd..0fdf08077ed3 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> > @@ -59,6 +59,7 @@
> >   		compatible = "fsi-master-gpio", "fsi-master";
> >   		#address-cells = <2>;
> >   		#size-cells = <0>;
> > +		no-gpio-delays;
> >
> >   		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> >   		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index 596608f4b936..214718b7784d 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -160,6 +160,7 @@
> >   		compatible = "fsi-master-gpio", "fsi-master";
> >   		#address-cells = <2>;
> >   		#size-cells = <0>;
> > +		no-gpio-delays;
> >
> >   		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> >   		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index 7f5a29566801..085926935574 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -91,6 +91,7 @@
> >   		compatible = "fsi-master-gpio", "fsi-master";
> >   		#address-cells = <2>;
> >   		#size-cells = <0>;
> > +		no-gpio-delays;
> >
> >   		trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
> >   		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> > diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> > index d6508bbad1fb..c82bbd35276e 100644
> > --- a/drivers/fsi/fsi-master-gpio.c
> > +++ b/drivers/fsi/fsi-master-gpio.c
> > @@ -62,6 +62,7 @@ struct fsi_master_gpio {
> >   	struct gpio_desc	*gpio_enable;	/* FSI enable */
> >   	struct gpio_desc	*gpio_mux;	/* Mux control */
> >   	bool			external_mode;
> > +	bool			no_delays;
> >   };
> >
> >   #define CREATE_TRACE_POINTS
> > @@ -79,9 +80,11 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
> >   	int i;
> >
> >   	for (i = 0; i < count; i++) {
> > -		ndelay(FSI_GPIO_STD_DLY);
> > +		if (!master->no_delays)

This is a bit of a nit, but we don't have to have the member name reflect the devicetree property. I reckon the code would be mildly easier to read (avoiding the double-negative) if we inverted it:

                        if (master->do_delays)
 
> > +			ndelay(FSI_GPIO_STD_DLY);
> >   		gpiod_set_value(master->gpio_clk, 0);
> > -		ndelay(FSI_GPIO_STD_DLY);
> > +		if (!master->no_delays)
> > +			ndelay(FSI_GPIO_STD_DLY);
> >   		gpiod_set_value(master->gpio_clk, 1);
> >   	}
> >   }
> > @@ -90,10 +93,12 @@ static int sda_clock_in(struct fsi_master_gpio *master)
> >   {
> >   	int in;
> >
> > -	ndelay(FSI_GPIO_STD_DLY);
> > +	if (!master->no_delays)
> > +		ndelay(FSI_GPIO_STD_DLY);
> >   	gpiod_set_value(master->gpio_clk, 0);
> >   	in = gpiod_get_value(master->gpio_data);
> > -	ndelay(FSI_GPIO_STD_DLY);
> > +	if (!master->no_delays)
> > +		ndelay(FSI_GPIO_STD_DLY);
> >   	gpiod_set_value(master->gpio_clk, 1);
> >   	return in ? 1 : 0;
> >   }
> > @@ -677,6 +682,13 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
> >   	}
> >   	master->gpio_mux = gpio;
> >
> > +	/*
> > +	 * Check if GPIO block is slow enought that no extra delays
> > +	 * are necessary. This improves performance on ast2500 by
> > +	 * an order of magnitude.
> > +	 */
> > +	master->no_delays = device_property_present(&pdev->dev, "no-gpio-delays");

Obviously negate the expression here as well if you agree with the comment above.

Cheers,

Andrew

> > +
> >   	master->master.n_links = 1;
> >   	master->master.flags = FSI_MASTER_FLAG_SWCLOCK;
> >   	master->master.read = fsi_master_gpio_read;
> 
