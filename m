Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EZ/xNLeM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XFFfnaCM"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hHlJ5fqRzF2RV
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 12:50:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B6C9122659;
 Wed,  9 May 2018 22:50:17 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 22:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=y9Sc3DQ4DwxKuavpiXFSRXMVvsMDb
 8R3ZAANnxdoG/w=; b=EZ/xNLeM6FQ7K0DpZ3Blm6UnvdCcpFWr5UQa5YEM5HV8x
 VfRYixTLFi/LN+To8eWn1SOzFeaj8RZs/UTLuRmR2fIsmmUV+S988sBLVtXucLLx
 uEXqVxACD9WeHzZ4j+S4yATL/b08W/qCCtptfJuNIeSJVkUPjywwMHsoLR9BYEru
 IzyMaFTLEIlXVclOwJul2ra+R+Dz1qHXcJU5Lfo+njM3GIITPlTUc0tbzeim7pQP
 c294+twpz9P/BLoFr0z0f5oFeaPVobX5B7z8K8HEfGRnjYBFfwJ71691SfR8RIJO
 GuAEdWk5kDjJV6p9EBZ1XUM7CKTTVM7JEPVYlBOaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y9Sc3D
 Q4DwxKuavpiXFSRXMVvsMDb8R3ZAANnxdoG/w=; b=XFFfnaCML43kwYCh4AlPC+
 BLffiI3UC0ic4uISn71l6WYcT2p+mah/6gBOoPS09PSfTdxKLx6KW+bQbobgdFFd
 /zxaq9bdzZDPP1hf5dWJXNSoB5DX/SU1FFiDDGPMFHWVPEIXZqpoz6Ods6+y5k7G
 YFTZd7MJr/+dz9LLIOhEc5qFlzbLGRsqHPe1/6DOHI1b3g9MJ8JM0atL3eOed0br
 1agj/CSlqs6SvvHVUZq8jfoLitvHycaEpn0fMLcxYDT9Vtp0/G3OF6mU7qTJi8tF
 6pZ6nejJk6HUi//RtOfcn7as2hnb0Y7ctVOG7Id4jn3qCuWcoMl7jyfevgiV5JjQ
 ==
X-ME-Sender: <xms:abPzWojArZbrkDPajCVsdODa9yBNQ66sQ71iS5-XJaJeNAjy98Nm1A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 156F341AF; Wed,  9 May 2018 22:50:17 -0400 (EDT)
Message-Id: <1525920616.2432221.1366964432.1752B0F8@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <b81ceb27-73b3-3060-54fa-7a703c422136@linux.vnet.ibm.com>
In-Reply-To: <b81ceb27-73b3-3060-54fa-7a703c422136@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13 1/6] gpio/aspeed: Set output latch before
 changing direction
Date: Thu, 10 May 2018 12:20:16 +0930
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
X-List-Received-Date: Thu, 10 May 2018 02:50:21 -0000

On Wed, 9 May 2018, at 01:43, Christopher Bostic wrote:
> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> 
> 
> On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> > In aspeed_gpio_dir_out(), we need to establish the new output
> > value in the output latch *before* we change the direction
> > to output in order to avoid a glitch on the output line if
> > the previous value of the latch was different.
> >

I think Milton mentioned this in a review way back when I was upstreaming the driver, but looks like I forgot to address it.

> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> > ---
> >   drivers/gpio/gpio-aspeed.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index 67f3eae3b550..ac54b9b25f74 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -287,11 +287,10 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
> >
> >   	spin_lock_irqsave(&gpio->lock, flags);
> >
> > +	__aspeed_gpio_set(gc, offset, val);
> >   	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
> >   	iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
> >
> > -	__aspeed_gpio_set(gc, offset, val);
> > -
> >   	spin_unlock_irqrestore(&gpio->lock, flags);
> >
> >   	return 0;
> 
