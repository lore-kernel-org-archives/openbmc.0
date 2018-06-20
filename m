Return-Path: <linux@roeck-us.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=roeck-us.net
 (client-ip=208.91.199.152; helo=bh-25.webhostbox.net;
 envelope-from=linux@roeck-us.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="HrubzEDC";
 dkim-atps=neutral
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419w9K5kq9zF0vb
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 05:38:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/F5xqzvXYUEvHdSufLvvlWjihh/F/D8QvOf3gpqB3k=; b=HrubzEDCwf2Tv9zwItosI4EiU+
 DMcrDJrtcdijjxd8RNcnSVDFrqaXQTVMeoazF9Hxm3k5JaXitl2i8S3/6HtulJFpzpTB88YvBJHjb
 NithF0QO/n4GpJqRmnv560+LvUNEKhNj48MuAnfvlfV+V85upj0OO87dnpsTQsKFbVZ8LMkt7uI7f
 DXOmAsMFxMzOsiq5jXmM2kwsO+BxCv3HeeBpVPM+9wt4EMJV/qpOcK9Vdsk6XviP7twAuJYRtutE3
 11hStToDd0z90o0jakeZXgFedo6lQokWcDS54EZNLo7edCl2p+JQhquXKqLYmQwn7fdHIfYjMhbaK
 R42xZj7g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:56050 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.89)
 (envelope-from <linux@roeck-us.net>)
 id 1fVivf-00HCCS-75; Wed, 20 Jun 2018 19:38:07 +0000
Date: Wed, 20 Jun 2018 12:38:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joe Perches <joe@perches.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>,
 cocci <cocci@systeme.lip6.fr>, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, avifishman70@gmail.com,
 yuenn@google.com, brendanhiggins@google.com, venture@google.com,
 joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
Message-ID: <20180620193806.GA2054@roeck-us.net>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
 <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 20 Jun 2018 19:38:14 -0000

On Wed, Jun 20, 2018 at 11:25:08AM -0700, Joe Perches wrote:
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
I spent (wasted) some time browsing through the kernel.
Similar typecasts are only used if there is a real type change.
A warning here would not make sense unless NPCM7XX_FAN_TIEN_TAIEN
or NPCM7XX_FAN_TIEN_TEIEN would be outside the u8 range, and then
there would be one anyway.

So, no, I am not going to accept those typecasts. They just make the code
more difficult to read. For example, the code here could have been
simplified to something like

	reg_int = ioread8(NPCM7XX_FAN_REG_TIEN(data->fan_base, fan));
	reg_mode = ioread8(NPCM7XX_FAN_REG_TCKC(data->fan_base, fan));
	if (cmp == NPCM7XX_FAN_CMPA) {
		reg_int |= NPCM7XX_FAN_TIEN_TAIEN | NPCM7XX_FAN_TIEN_TEIEN;
		reg_mode |= NPCM7XX_FAN_TCKC_CLK1_APB;
	} else {
		reg_int |= NPCM7XX_FAN_TIEN_TBIEN | NPCM7XX_FAN_TIEN_TFIEN;
		reg_mode |= NPCM7XX_FAN_TCKC_CLK2_APB;
	}
	iowrite8(reg_int, NPCM7XX_FAN_REG_TIEN(data->fan_base, fan);
	iowrite8(reg_mode, NPCM7XX_FAN_REG_TCKC(data->fan_base, fan);

This, in turn, leads to the question if it is really not necessary
to _clear_ those mask bits in the same context.

Guenter

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
