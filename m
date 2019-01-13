Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="doqRgzbB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hZopgrM0"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dC1k3WrnzDq6q
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 10:07:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB85228706;
 Sun, 13 Jan 2019 18:07:51 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 18:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:subject:references; s=fm1; bh=RGT
 QJj3ukE90tvtezXy7+uNvxkcohWhaAkadR8K+kiA=; b=doqRgzbBK84bs5bV5fn
 S5XfR0oZ2v1ympcpUmvCxJMHEcoScIVh8wZHukbMJRt+j0hP5HeIRrj+So1p8NdJ
 pPSO3PLpU5yvyhNmLgXviYANGSChqiVaSEZHtjLQPMuS+2nerkxUeVQZOX8D+JfA
 T5MQT2A6i0VoHB0wKCNLcw5fCBpUJkQkeYp589nPTwJv2SDu8mw0dT7DmF8yTJk9
 Ir/HXqaPRW4NIZ4Mb2de88OSphML7Bm/22qkb2Yw78CXeUNwLMxEMr7ft3fQpCfA
 z4S4P4XTTmsKEK6mYlT7yyGED4FqW5SsB/AGDpNjA7svZWK1r1icCLPjpF0w69ck
 10A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RGTQJj3ukE90tvtezXy7+uNvxkcohWhaAkadR8K+k
 iA=; b=hZopgrM076yZ0xiaZcZBs/2v1StovOCY0uO+EhCtqU1X38Fdo2kuAMJD3
 GR8MWDy1ps4b7D6IT26UL9HkB1ZE3rL29771I7c2oUMJnHMvjlOmHvqs+uqYjovl
 9IAomYdDKZI9oaiJT5TlGiRHVH0y5qzEPF237a6DU3e/Ea5iZef3iTrBEEnRLQe7
 5jb83U8mMmzBTuhL+zt1sugEqRSd7jY5Qi1L8gKWooTxasgG4AXYKjGvaz7qq7oD
 Me532jmQQWCOGHawh/A+rs/xY/UcUIhdtxEjc+5kWp/RgwJLZFKnjgHJWDXxme0x
 fUHDugHs+9XTp8e6fL30A+W9QU+nw==
X-ME-Sender: <xms:x8Q7XK7-RB5Y2Rgnz5u6AXst4YGjdAmta0KWhhgTmv-Ax08H2h5DjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefkhffvggfgtgfojgffufhfsehtqhertdertdejnecuhfhrohhmpe
 etnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:x8Q7XHuSNkaqhZiRFsbIxRGpuugHQhW_uhjUfy7zvgQadWgVaGYQAg>
 <xmx:x8Q7XOB5-f82P5BkKdXZlFbc1ui8LxF6nXcXiPU16SG4In6kf-oenQ>
 <xmx:x8Q7XOog2SIo-Hbi9lsmCx1Bw8VGiXnq5_VRxlKDCoDsitTNkpy3gA>
 <xmx:x8Q7XCDPaI2ZzsCvRluNR4gM4CjD0OjYPfLTDQKyfWuP6Dql9UrRig>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id F33009E564; Sun, 13 Jan 2019 18:07:50 -0500 (EST)
Message-Id: <1547420870.2324801.1633579320.71BA703F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
In-Reply-To: <65ac448c-d53f-c2f8-c123-69e45afd2a90@kaod.org>
Date: Mon, 14 Jan 2019 09:37:50 +1030
Subject: Re: [RFC qemu legoater/aspeed-3.1 4/4] timer: aspeed: Provide
 back-pressure information for short periods
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-5-andrew@aj.id.au>
 <65ac448c-d53f-c2f8-c123-69e45afd2a90@kaod.org>
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
X-List-Received-Date: Sun, 13 Jan 2019 23:07:55 -0000

On Fri, 11 Jan 2019, at 20:40, C=C3=A9dric Le Goater wrote:
> On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> > First up: This is not the way the hardware behaves.
>=20
> I think this is OK from the QEMU side. It would be better if Linux was=20
> not involved though.

It doesn't have to be, just it may see wonky timer behaviour because
the timer will not be doing exactly what was asked.

>=20
> > However, it helps resolve real-world problems with short periods being
> > used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
> > Fix set_next_event handler") in Linux fixed the timer driver to
> > correctly schedule the next event for the Aspeed controller, and in
> > combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random number
> > device") Linux will now set a timer with a period as low as 1us.
> >=20
> > Configuring a qemu timer with such a short period results in spending
> > time handling the interrupt in the model rather than executing guest
> > code, leading to noticeable "sticky" behaviour in the guest.
> >=20
> > The behaviour of Linux is correct with respect to the hardware, so we
> > need to improve our handling under emulation. The approach chosen is to
> > provide back-pressure information by calculating an acceptable minimum
> > number of ticks to be set on the model. Under Linux an additional read
> > is added in the timer configuration path to detect back-pressure, which
> > will never occur on hardware. However if back-pressure is observed, the
> > driver alerts the clock event subsystem, which then performs its own
> > next event dilation via a config option - d1748302f70b ("clockevents:
> > Make minimum delay adjustments configurable")
>=20
> So, this is approach is not totally unacceptable, QEMU is an hypervisor
> which has its own timing constraints.
>=20=20
> > A minimum period of 5us was experimentally determined on a Lenovo
> > T480s, which I've increased to 20us for "safety".
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/misc/aspeed_scu.c            | 6 ++++++
> >  hw/timer/aspeed_timer.c         | 6 +++++-
> >  include/hw/timer/aspeed_timer.h | 1 +
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> > index 257f9a6c6b8a..0410776b456a 100644
> > --- a/hw/misc/aspeed_scu.c
> > +++ b/hw/misc/aspeed_scu.c
> > @@ -432,6 +432,12 @@ static void aspeed_scu_realize(DeviceState *dev, E=
rror **errp)
> >                            TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
> >=20=20
> >      sysbus_init_mmio(sbd, &s->iomem);
> > +
> > +    /*
> > +     * Reset on realize to ensure the APB clock value is calculated in=
 time for
> > +     * use by the timer model, which is reset before the SCU.
> > +     */
> > +    aspeed_scu_reset(dev);
>=20
> sigh. May be we should call aspeed_scu_set_apb_freq() from the Aspeed tim=
er
> model ?

I dunno - will we run into this in other models as well? If we do, should t=
hey also call
aspeed_scu_set_apb_freq()? If they do it probably won't matter (same input,=
 same
output), but it seems a bit messy to distribute the call through the code?

>=20
> >  }
> >=20=20
> >  static const VMStateDescription vmstate_aspeed_scu =3D {
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > index 35b40a7c4010..0f3501ac5a5c 100644
> > --- a/hw/timer/aspeed_timer.c
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -254,7 +254,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlS=
tate *s, int timer, int reg,
> >      switch (reg) {
> >      case TIMER_REG_RELOAD:
> >          old_reload =3D t->reload;
> > -        t->reload =3D value;
> > +        t->reload =3D value < t->min_ticks ? t->min_ticks : value;
> >=20=20
> >          /* If the reload value was not previously set, or zero, and
> >           * the current value is valid, try to start the timer if it is
> > @@ -306,7 +306,11 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *=
t, bool enable)
> >=20=20
> >  static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enab=
le)
> >  {
> > +    AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
> > +    uint32_t rate =3D enable ? TIMER_CLOCK_EXT_HZ : s->scu->apb_freq;
> > +
> >      trace_aspeed_timer_ctrl_external_clock(t->id, enable);
> > +    t->min_ticks =3D muldiv64(20 * SCALE_US, rate, NANOSECONDS_PER_SEC=
OND);
>=20
> That '20' deserves a define I think.

Yes, good call :)

Andrew
