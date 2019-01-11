Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="c7kL2WFQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HBZA/Nf+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bc7c2S0fzDr09
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 19:52:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 90EB821105;
 Fri, 11 Jan 2019 03:52:22 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Fri, 11 Jan 2019 03:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:references:subject; s=fm1; bh=06Q
 cTlOaLoaS2SXkkCHoHNI93ZkVPpeXPPtmrhI1ksg=; b=c7kL2WFQ4Kh7gR3wklY
 ABZPs4xo9TEvr0hnjy93iUBz/sGVBQYd67dB5pnKnZ0WSpA/Zach7UL3MKKlk7Bj
 OTop56YwaD6q+avG407ZhMgapLiUudzwbqQcLAb7SkofNoeWHabk4BCymmmPLaoX
 xk1oZgVjy6s/88CRojPKNecd5hYQZUFh4/BN0Wlp3kpeYlFO1IjiChGTtKfstbaP
 IkLjG6iv+0J7sP4cz6i9osyl7OwJDD3FasWdSyAHJfovtBgFXCau+tLIhjjqgBCH
 Dp8bmjsg3njeEIxmiqT2Y84/jo7qq7gNyPpEclNFjwJCcCd2mrY1IIvftt5Ka72s
 1cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=06QcTlOaLoaS2SXkkCHoHNI93ZkVPpeXPPtmrhI1k
 sg=; b=HBZA/Nf+l1tNCZMEGg7bL9rrWXps5mRuko4YeO/IYSNcPqFmXGUWIzDq1
 otenb7QqkRRsT9Uri+Eo98ZClHrStGLehuYAJzQSXYkvmKj8GVPQgeY87NjTjxxe
 3ZljSI2ImtUOqJtVD7ki2GnPYxAOmnaksVNMXybHBPyvTye9jl6fq5lvgCk4DDPT
 CK5CsF/d0LinPV3+SF8CrV/nbiIu7FDdye8iu7EKp07DvGF3+nB8qrBW6VLiUrLo
 3UqO1hWcZeATE5e9G/zmSyeRCa+tDfQZeZ/5GZJglWXDAJO/YxBH4gjAziwCo3kU
 UvMUJoVNOojJi/wYA/o/hyp9UKQUw==
X-ME-Sender: <xms:RVk4XJBAsmVrwzkzVOJHInmhfFICFnFW5JYLg_7EaFm6yI2a2h2nOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecunecujfgurhepkffhvfgggfgtofffjghfufesthhqredtredtjeenucfhrhhomh
 eptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RVk4XJBGeCENSYYmpn-0i7HWPuYcPBM0RrzogC7xLytU6oJZyfX6Gw>
 <xmx:RVk4XJLKaoBPG4nPa5yj5WYYMD3TRibnLtFfUUNnJ44rI6JfmZcgtQ>
 <xmx:RVk4XDQWAZ7Nln89Ariy9C-kwLAUs5VRrbXEvf48vQwpKHQdE-cB_A>
 <xmx:Rlk4XI9liDFOV7Nn0QsKSipsm-NW7LeR6lT3H1zqzaIKx8ltL-heDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 46C0F940E5; Fri, 11 Jan 2019 03:52:21 -0500 (EST)
Message-Id: <1547196741.1037049.1631690648.76A9C45D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Date: Fri, 11 Jan 2019 19:22:21 +1030
In-Reply-To: <6944bb11-c1ae-3599-eeca-1fcc16728ea1@kaod.org>
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-2-andrew@aj.id.au>
 <6944bb11-c1ae-3599-eeca-1fcc16728ea1@kaod.org>
Subject: Re: [RFC qemu legoater/aspeed-3.1 1/4] timer: aspeed: Fire interrupt
 on failure to meet deadline
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
X-List-Received-Date: Fri, 11 Jan 2019 08:52:32 -0000



On Fri, 11 Jan 2019, at 19:14, C=C3=A9dric Le Goater wrote:
> On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/timer/aspeed_timer.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > index 1a54d85e9d49..54c75bf4f322 100644
> > --- a/hw/timer/aspeed_timer.c
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -128,10 +128,16 @@ static uint64_t calculate_next(struct AspeedTimer=
 *t)
> >      if (now < next)
> >          return next;
> >=20=20
> > -    /* We've missed all of the deadlines. Set a timer in the future to=
 let
> > -     * execution catch up */
> > -    t->start =3D now;
> > -    return next + 10000;
> > +    /* We've missed all deadlines, fire interrupt and try again */
> > +    timer_del(&t->timer);
> > +
> > +    if (timer_overflow_interrupt(t)) {
> > +        t->level =3D !t->level;
> > +        qemu_set_irq(t->irq, t->level);
> > +    }
> > +
> > +    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>=20
> MAX(MAX()) ?=20
>=20
> Is that necessary ?

No, just my wip internal reasoning getting exposed externally :)

>=20
> C.
