Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UKAgiR96"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lc0GYj2g"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hHth4C86zF2Rf
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 12:56:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 650E721AE7;
 Wed,  9 May 2018 22:56:41 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 22:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=k9+TumJwmDxvg4rtgv9Po1RzFrVgJ
 50EwlMU8K9vgMw=; b=UKAgiR96rpD9BK84Atov623AZlqlrx1n54yOb2ivqNAUl
 9qsLhkOFYRg6jH0UZ0vA2R+pGnAGFMvli/ByMsP//5n6zWlOotstrKbjRTB7qvkN
 LmSekwntylE02Gl4yvEjAW1OuofSGo/RBg7H/rWz72wn994APidZDTgcrhc4ezyB
 kFUy7MBBAQ0h/HJCSFzY7iKj/PK3VyL5+d4ahGkfNqQZQhclrDxXZHtrpO6rqp7l
 zpb2jQ1w1Nnas8Dl/5oALS0Ljmi20WrTeYdaZAVum96ojKQAagxFcJp4hfZyA+Rg
 X1Dhv27qqTRLIYwgfqaAl0B6JYbRy96dZ1k7xjKEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k9+Tum
 JwmDxvg4rtgv9Po1RzFrVgJ50EwlMU8K9vgMw=; b=lc0GYj2gRA4eJeEhOC8HVW
 9l0CEqEPYYEYx1xk4zWObbnJhP7FnCuEiUrkaKCQ39sGrvSEFU+oo5nkjl0qlHN3
 pMu/u8IUiJhmkFBNQ9/7jx66wF6Uz6pScsF1r+OgwqA3zD10uiQy/QAxon+OPKfB
 P3Rhrwz83mot/QzV64ZEZ6OGtT/GSJfCXhS0GHEX4usO/ba4EzDjUQb8AsdBaOt/
 geFF8C1eXuJ+7Evey58LR+fJxH5+ruR7sm3V1c6nVE/g+9WvRL/E68jtColcIBqA
 kQXe+1tfmy4QKPO1Di2LVolCMXBJcd6FuupCKIFfb3IWefs0r2Wvkl5fsHqrTW1Q
 ==
X-ME-Sender: <xms:6bTzWlsLMPKGZQFXFfeZVx-UCgft_xhDljvQooltE2vkPhu5N4ZNgg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 338AA412B; Wed,  9 May 2018 22:56:41 -0400 (EDT)
Message-Id: <1525921001.2434772.1366967304.56D4920B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
In-Reply-To: <12eed627-c789-c118-4b28-88f70eea3777@linux.vnet.ibm.com>
Date: Thu, 10 May 2018 12:26:41 +0930
Subject: Re: [PATCH linux dev-4.13 2/6] gpio/aspeed: Use a cache of output data
 registers
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-2-benh@kernel.crashing.org>
 <12eed627-c789-c118-4b28-88f70eea3777@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 10 May 2018 02:56:46 -0000

On Wed, 9 May 2018, at 01:47, Christopher Bostic wrote:
> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> 
> 
> On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> > The current driver does a read/modify/write of the output
> > registers when changing a bit in __aspeed_gpio_set().
> >
> > This is sub-optimal for a couple of reasons:
> >
> >    - If any of the neighbouring GPIOs (sharing the shared
> > register) isn't (yet) configured as an output, it will
> > read the current input value, and then apply it to the
> > output latch, which may not be what the user expects. There
> > should be no bug in practice as aspeed_gpio_dir_out() will
> > establish a new value but it's not great either.
> >
> >    - The GPIO block in the aspeed chip is clocked rather
> > slowly (typically 25Mhz). That extra MMIO read halves the maximum
> > speed at which we can toggle the GPIO.
> >
> > This provides a significant performance improvement to the GPIO
> > based FSI master.
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> > ---
> >   drivers/gpio/gpio-aspeed.c | 21 +++++++++++++++++++--
> >   1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index ac54b9b25f74..a62cbf3ed4a8 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -54,6 +54,8 @@ struct aspeed_gpio {
> >   	u8 *offset_timer;
> >   	unsigned int timer_users[4];
> >   	struct clk *clk;
> > +
> > +	u32 *dcache;
> >   };
> >
> >   struct aspeed_gpio_bank {
> > @@ -231,12 +233,13 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> >   	u32 reg;
> >
> >   	addr = bank_val_reg(gpio, bank, GPIO_DATA);
> > -	reg = ioread32(addr);
> > +	reg = gpio->dcache[GPIO_BANK(offset)];
> >
> >   	if (val)
> >   		reg |= GPIO_BIT(offset);
> >   	else
> >   		reg &= ~GPIO_BIT(offset);
> > +	gpio->dcache[GPIO_BANK(offset)] = reg;
> >
> >   	iowrite32(reg, addr);
> >   }
> > @@ -848,7 +851,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
> >   	const struct of_device_id *gpio_id;
> >   	struct aspeed_gpio *gpio;
> >   	struct resource *res;
> > -	int rc;
> > +	int rc, i, banks;
> >
> >   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> >   	if (!gpio)
> > @@ -889,6 +892,20 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
> >   	gpio->chip.base = -1;
> >   	gpio->chip.irq_need_valid_mask = true;
> >
> > +	/* Allocate a cache of the output registers */
> > +	banks = gpio->config->nr_gpios >> 5;
> > +	gpio->dcache = devm_kzalloc(&pdev->dev,
> > +				    sizeof(u32) * banks, GFP_KERNEL);
> > +	if (!gpio->dcache)
> > +		return -ENOMEM;
> > +
> > +	/* Populate it with initial values read from the HW */
> > +	for (i = 0; i < banks; i++) {
> > +		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
> > +		gpio->dcache[i] = ioread32(gpio->base + bank->val_regs +
> > +					   GPIO_DATA);
> > +	}
> > +
> >   	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> >   	if (rc < 0)
> >   		return rc;
> 
