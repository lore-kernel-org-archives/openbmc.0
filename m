Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SiyIXK1l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ro8nGmBD"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dBxd0yyPzDqQL
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 10:04:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3980128C99;
 Sun, 13 Jan 2019 18:04:18 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 18:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:references:subject; s=fm1; bh=kly
 9o8mIA4ehIqpNCVZzLosVx7f7m7sHkijjoMMMqFg=; b=SiyIXK1lubagSjfZ364
 4i4MUDp7Un0owqqpcNbjSxKXQoAw0irtVQZVPjByQilEswJWDVpmk7VYIfPUQK+g
 6tms9eD85X/pm9bZuO6Uw2X7glxn974My/MZE+es660p8HlKghDpGGhntlOJFqjF
 FVOjGBswNyTASIfnJdkdKByldOl5DGT/R96bfNkbU0M9UbmF0YE4kigaLzVu8aQe
 AgXr6O5Q/wi1apljYVWnfb9UYlBDb3DKNFD54Ub2RXmrHl+uthxM1I+ybg7CcYfF
 gRG5f6otuHUOR9XfpuPcK16+6O5y1FWQXrtzjIF36ZIEKY5jXDdndstf/AxztpES
 YIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=kly9o8mIA4ehIqpNCVZzLosVx7f7m7sHkijjoMMMq
 Fg=; b=ro8nGmBD1zsq5c/knAZ2SCr0zkC8Kglwm/KimqmaTTm8uI/20uxdn6VIk
 USghq4kNpOVxau39AoGcQq1paZ8f/5YGs3sGVXndI4iKIzC15uH1fu+j9qkbw4fj
 uNfSqUo8yzeYAt31BpZG5g1GNUO9k3mK47BZGP1smL9R+tjWBDqkne0Ky1PJuWxY
 e5l+kNo6UjuShNI8aXohwoggvUdDbQTqoJ2niAy2K0KogBl74U6jpnhGWThOVgPm
 T09Tj9W04RWXD5xwnk5ieNC8tojTFX9dc+uuBY4QhzjUdRjOgJ18dmIZv8Q7dd9U
 wBP6BheqA51fF6CYpzVMhr1ooqgxg==
X-ME-Sender: <xms:8MM7XMTb8DnQRGo7UyOTxAmz7mZZUpGh24axUfo8vTp1eCPFv50FGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefkhffvggfgtgfoffgjfhfusehtqhertdertdejnecuhfhrohhmpe
 etnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:8MM7XOCf1EK9pGh9Tvgy_67llADg_RqwSqIi5TLg418rzfRA5ACg7Q>
 <xmx:8MM7XE0_VuCy-qBZX-D6cHs5DzCx3EwfPR6cE6DFeTidfC00iNOiWQ>
 <xmx:8MM7XEUrkzG7Mggn90ZZsCU9N3O8pqQSNd5h-61wnL1luYaBRX-vxQ>
 <xmx:8sM7XKgtOP2LAooT-ssY1nlXsV4v3Als_3sWh02a_P04wAHMt67JEw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C60F59E564; Sun, 13 Jan 2019 18:04:16 -0500 (EST)
Message-Id: <1547420656.2323823.1633576352.6CDBEC51@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Date: Mon, 14 Jan 2019 09:34:16 +1030
In-Reply-To: <d0220a96-aff0-38b3-e8e2-b2c93811cc53@kaod.org>
References: <20190111033628.18677-1-andrew@aj.id.au>
 <d0220a96-aff0-38b3-e8e2-b2c93811cc53@kaod.org>
Subject: Re: [RFC linux dev-4.19] clocksource: fttmr010: Detect back-pressure
 for Aspeed controllers
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Jan 2019 23:04:21 -0000

On Fri, 11 Jan 2019, at 19:36, C=C3=A9dric Le Goater wrote:
> On 1/11/19 4:36 AM, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> This patch should not have any impact on a real system where l =3D=3D cyc=
les.
> It might be difficult to merge though.

I agree.

Note however that the qemu patches resolve the issue regardless of whether =
this
patch to Linux is applied, just if it's not Linux will not be aware that th=
e timer isn't
behaving how Linux requested.

Maybe we live with that?

Andrew

>=20
> C.=20
>=20
> > ---
> >=20
> > See the cover letter on the corresponding qemu RFC series, to be sent a=
fter
> > this patch.
> >=20
> >  arch/arm/mach-aspeed/Kconfig         | 1 +
> >  drivers/clocksource/timer-fttmr010.c | 7 +++++++
> >  2 files changed, 8 insertions(+)
> >=20
> > diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> > index 2d5570e6e186..6b82d5416cf0 100644
> > --- a/arch/arm/mach-aspeed/Kconfig
> > +++ b/arch/arm/mach-aspeed/Kconfig
> > @@ -7,6 +7,7 @@ menuconfig ARCH_ASPEED
> >  	select FTTMR010_TIMER
> >  	select MFD_SYSCON
> >  	select PINCTRL
> > +	select GENERIC_CLOCKEVENTS_MIN_ADJUST
> >  	help
> >  	  Say Y here if you want to run your kernel on an ASpeed BMC SoC.
> >=20=20
> > diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource=
/timer-fttmr010.c
> > index cf93f6419b51..f15386b98289 100644
> > --- a/drivers/clocksource/timer-fttmr010.c
> > +++ b/drivers/clocksource/timer-fttmr010.c
> > @@ -124,6 +124,7 @@ static int fttmr010_timer_set_next_event(unsigned l=
ong cycles,
> >  {
> >  	struct fttmr010 *fttmr010 =3D to_fttmr010(evt);
> >  	u32 cr;
> > +	u32 l;
> >=20=20
> >  	/* Stop */
> >  	cr =3D readl(fttmr010->base + TIMER_CR);
> > @@ -136,6 +137,12 @@ static int fttmr010_timer_set_next_event(unsigned =
long cycles,
> >  		 * into TIMER1_COUNT register when the timer is re-enabled.
> >  		 */
> >  		writel(cycles, fttmr010->base + TIMER1_LOAD);
> > +#if CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST> +		/* QEMU model may provid=
e back-pressure on requested period */
> > +		l =3D readl(fttmr010->base + TIMER1_LOAD);
> > +		if (l > cycles)
> > +			return -EINVAL;
> > +#endif
> >  	} else {
> >  		/* Setup the match register forward in time */
> >  		cr =3D readl(fttmr010->base + TIMER1_COUNT);
> >=20
>=20
