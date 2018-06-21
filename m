Return-Path: <julia.lawall@lip6.fr>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=lip6.fr
 (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr;
 envelope-from=julia.lawall@lip6.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lip6.fr
X-Greylist: delayed 673 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jun 2018 23:28:48 AEST
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BMwc43wRzF0mR
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 23:28:48 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.51,252,1526335200"; d="scan'208";a="332746881"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 15:17:26 +0200
Date: Thu, 21 Jun 2018 15:17:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
cc: Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>, 
 cocci <cocci@systeme.lip6.fr>, robh+dt@kernel.org, mark.rutland@arm.com, 
 jdelvare@suse.com, avifishman70@gmail.com, yuenn@google.com, 
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
In-Reply-To: <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
Message-ID: <alpine.DEB.2.20.1806211515060.3774@hadrien>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
 <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Thu, 21 Jun 2018 13:28:49 -0000



On Wed, 20 Jun 2018, Joe Perches wrote:

> (adding Julia Lawall and cocci mailing list)
>
> On Wed, 2018-06-20 at 09:48 -0700, Guenter Roeck wrote:
> []
> > > +static inline void npcm7xx_fan_start_capture(struct npcm7xx_pwm_fan_data *data,
> > > +						 u8 fan, u8 cmp)
> > > +{
> > > +	u8 fan_id = 0;
> > > +	u8 reg_mode = 0;
> > > +	u8 reg_int = 0;
> > > +	unsigned long flags;
> > > +
> > > +	fan_id = NPCM7XX_FAN_INPUT(fan, cmp);
> > > +
> > > +	/* to check whether any fan tach is enable */
> > > +	if (data->npcm7xx_fan[fan_id].FanStFlag != FAN_DISABLE) {
> > > +		/* reset status */
> > > +		spin_lock_irqsave(&data->npcm7xx_fan_lock[fan], flags);
> > > +
> > > +		data->npcm7xx_fan[fan_id].FanStFlag = FAN_INIT;
> > > +		reg_int = ioread8(NPCM7XX_FAN_REG_TIEN(data->fan_base, fan));
> > > +
> > > +		if (cmp == NPCM7XX_FAN_CMPA) {
> > > +			/* enable interrupt */
> > > +			iowrite8((u8) (reg_int | (NPCM7XX_FAN_TIEN_TAIEN |
> > > +						  NPCM7XX_FAN_TIEN_TEIEN)),
> >
> > Is the (u8) typecast really necessary ? Seems unlikely.
>
> The cast is not really necessary here as there would
> be an implicit cast already.
>
> Some might complain about loss of type safety and
> "make W=123" would probably emit something here.
>
> But casts to the same type are not necessary.
>
> A possible coccinelle script to find casts to the
> same type is below, but there are some false positives
> for things like __force and __user casts
>
> Also, spatch (1.0.4) seems to have a defect for this
> when the type is used in operations that change a
> smaller type to int or unsigned int.
>
> i.e.: (offset is u16, but offset * 2 is int)

Ah.  The rule is that the result type is always the larger one?
Unfortunately, Coccinelle doesn't know the size of any type.  I could add
some special cases, but that may be more confusing than helpful.

julia

>
> While running the cocci script below:
>
> HANDLING: drivers/net/ethernet/intel/igb/e1000_nvm.c
> diff =
> diff -u -p a/drivers/net/drivers/net/ethernet/intel/igb/e1000_nvm.c b/drivers/net/ethernet/intel/igb/e1000_nvm.c
> --- a/drivers/net/ethernet/intel/igb/e1000_nvm.c
> +++ b/drivers/net/ethernet/intel/igb/e1000_nvm.c
> @@ -335,7 +335,7 @@ s32 igb_read_nvm_spi(struct e1000_hw *hw
>
>  	/* Send the READ command (opcode + addr) */
>  	igb_shift_out_eec_bits(hw, read_opcode, nvm->opcode_bits);
> -	igb_shift_out_eec_bits(hw, (u16)(offset*2), nvm->address_bits);
> +	igb_shift_out_eec_bits(hw, (offset * 2), nvm->address_bits);
>
>  	/* Read the data.  SPI NVMs increment the address with each byte
>  	 * read and will roll over if reading beyond the end.  This allows
>
> ---
>
> Anyway, here's the cocci script:
>
> $ cat same_typecast.cocci
> @@
> type T;
> T foo;
> @@
>
> -	(T *)&foo
> +	&foo
>
> @@
> type T;
> T foo;
> @@
>
> -	(T)foo
> +	foo
>
>
