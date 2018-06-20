Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.127; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 575 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jun 2018 04:34:53 AEST
Received: from smtprelay.hostedemail.com (smtprelay0127.hostedemail.com
 [216.40.44.127])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419tmF3kpHzF0mQ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 04:34:52 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 3920918064A2B
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 18:25:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id DDAAD182CED34;
 Wed, 20 Jun 2018 18:25:12 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2693:2828:2904:3138:3139:3140:3141:3142:3354:3865:3866:3867:3868:3870:3871:3874:4250:4321:5007:6117:6119:6120:6742:7901:8957:9010:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12295:12296:12438:12679:12740:12760:12895:13161:13229:13439:14096:14097:14659:14721:21080:21324:21451:21627:30046:30051:30054:30055:30060:30070:30083:30091,
 0,
 RBL:47.151.150.235:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: wrist12_1008fc6f71b63
X-Filterd-Recvd-Size: 3674
Received: from XPS-9350.home (unknown [47.151.150.235])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Wed, 20 Jun 2018 18:25:10 +0000 (UTC)
Message-ID: <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
From: Joe Perches <joe@perches.com>
To: Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>, 
 Julia Lawall <julia.lawall@lip6.fr>, cocci <cocci@systeme.lip6.fr>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com, 
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com, 
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 openbmc@lists.ozlabs.org
Date: Wed, 20 Jun 2018 11:25:08 -0700
In-Reply-To: <20180620164853.GA3459@roeck-us.net>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
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
X-List-Received-Date: Wed, 20 Jun 2018 18:34:54 -0000

(adding Julia Lawall and cocci mailing list)

On Wed, 2018-06-20 at 09:48 -0700, Guenter Roeck wrote:
[]
> > +static inline void npcm7xx_fan_start_capture(struct npcm7xx_pwm_fan_data *data,
> > +						 u8 fan, u8 cmp)
> > +{
> > +	u8 fan_id = 0;
> > +	u8 reg_mode = 0;
> > +	u8 reg_int = 0;
> > +	unsigned long flags;
> > +
> > +	fan_id = NPCM7XX_FAN_INPUT(fan, cmp);
> > +
> > +	/* to check whether any fan tach is enable */
> > +	if (data->npcm7xx_fan[fan_id].FanStFlag != FAN_DISABLE) {
> > +		/* reset status */
> > +		spin_lock_irqsave(&data->npcm7xx_fan_lock[fan], flags);
> > +
> > +		data->npcm7xx_fan[fan_id].FanStFlag = FAN_INIT;
> > +		reg_int = ioread8(NPCM7XX_FAN_REG_TIEN(data->fan_base, fan));
> > +
> > +		if (cmp == NPCM7XX_FAN_CMPA) {
> > +			/* enable interrupt */
> > +			iowrite8((u8) (reg_int | (NPCM7XX_FAN_TIEN_TAIEN |
> > +						  NPCM7XX_FAN_TIEN_TEIEN)),
> 
> Is the (u8) typecast really necessary ? Seems unlikely.

The cast is not really necessary here as there would
be an implicit cast already.

Some might complain about loss of type safety and
"make W=123" would probably emit something here.

But casts to the same type are not necessary.

A possible coccinelle script to find casts to the
same type is below, but there are some false positives
for things like __force and __user casts

Also, spatch (1.0.4) seems to have a defect for this
when the type is used in operations that change a
smaller type to int or unsigned int.

i.e.: (offset is u16, but offset * 2 is int)

While running the cocci script below:

HANDLING: drivers/net/ethernet/intel/igb/e1000_nvm.c
diff = 
diff -u -p a/drivers/net/drivers/net/ethernet/intel/igb/e1000_nvm.c b/drivers/net/ethernet/intel/igb/e1000_nvm.c
--- a/drivers/net/ethernet/intel/igb/e1000_nvm.c
+++ b/drivers/net/ethernet/intel/igb/e1000_nvm.c
@@ -335,7 +335,7 @@ s32 igb_read_nvm_spi(struct e1000_hw *hw
 
 	/* Send the READ command (opcode + addr) */
 	igb_shift_out_eec_bits(hw, read_opcode, nvm->opcode_bits);
-	igb_shift_out_eec_bits(hw, (u16)(offset*2), nvm->address_bits);
+	igb_shift_out_eec_bits(hw, (offset * 2), nvm->address_bits);
 
 	/* Read the data.  SPI NVMs increment the address with each byte
 	 * read and will roll over if reading beyond the end.  This allows

---

Anyway, here's the cocci script:

$ cat same_typecast.cocci
@@
type T;
T foo;
@@

-	(T *)&foo
+	&foo

@@
type T;
T foo;
@@

-	(T)foo
+	foo
