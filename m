Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHnMG5JbWzDqpL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 06:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CPs8ZUxK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="F7uqzl6n"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9238120A75;
 Wed, 26 Jul 2017 16:51:04 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 16:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=LxzATqG4139aD/quVCnBOYl39RaTG
 4AI8M8qF0y0O9w=; b=CPs8ZUxKO2ERP/O+Nm10YQYRJKXDp+yCpnBWWleOFsfGW
 gfp3JJK++jc+ohafDOFlRCVfH0OgvTwW24az9M7SA9/azNJCmn8wqj8wcuCD2CY5
 UEGR0jgK4MGFYLY2pCp9931rU59spl1mAfU7FgyTNAN3L+Y5fi+gppTx/jzE2mK8
 X1UzoZG78K+dcOl6psSWUlfQ2/1+IrxuyFaiZjUMc2fLNeRjhDE13w+fEuSGUszZ
 1EVzqkVFgIxynnFYwd+AdLxgBQFKvtI5Drwxff8jsksg/3Rg3c2IEd/Bhtst31tQ
 YiUdL1Cd7RAAyssbFbxM93O4r834a5zvRlwslOxBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LxzATq
 G4139aD/quVCnBOYl39RaTG4AI8M8qF0y0O9w=; b=F7uqzl6n9wkvcxX8ZAri2V
 dMGpADsCCm6t3Mm3A1Z0w8bhoRUpTc7NtsSJOnoeYK9gjJEMBd/T86oNgiRDkPwt
 aG6kxsvq5yUqCli5HQOMR+0RrwtYLl/wZd+n1KPvnFlBMuTAtIVQw5M+/aO59xds
 Trux5MtwsQ16npxs2kffQcKokw1sqTMJRZ9W1wkpHbY22voY3pPZQnEvAYfKfxMU
 TEPiWXPISykVJlE+w1Wwmh3innfqiWaByA6heGsUVF0oDvu4oS7x2c3c6fydCt0Z
 IAPlbxRXNFuqJXGMmUPpDlzBGX7k7Od0h8b33/BQ3ntnrGshKqu+Wyi4g9EfcupQ
 ==
X-ME-Sender: <xms:uAB5WYCjgIeRqa53gmuVwQNNcEgsly3Z9IKg0jt9A0ifw6HBpUIt5Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 73FF294766; Wed, 26 Jul 2017 16:51:04 -0400 (EDT)
Message-Id: <1501102264.2312454.1053697312.2876BEDC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, joel@jms.id.au
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-c8af44bc
Subject: Re: [PATCH linux dev-4.10 v2 3/4] watchdog: aspeed: Support external
 signal drive and polarity bindings
In-Reply-To: <c525e702-a7e2-2470-fca2-26dee7826fb4@linux.vnet.ibm.com>
Date: Thu, 27 Jul 2017 06:21:04 +0930
References: <20170726160831.17867-1-andrew@aj.id.au>
 <20170726160831.17867-4-andrew@aj.id.au>
 <c525e702-a7e2-2470-fca2-26dee7826fb4@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jul 2017 20:51:09 -0000



On Thu, Jul 27, 2017, at 03:22, Matt Spinler wrote:
>=20
>=20
> On 7/26/2017 11:08 AM, Andrew Jeffery wrote:
> > These bindings are optional, and only relevant on the AST2500 and
> > compatible watchdog controllers.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >   drivers/watchdog/aspeed_wdt.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index d29f75e90bb6..9a07ef176054 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -42,6 +42,9 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> >   #define   WDT_CTRL_WDT_INTR		BIT(2)
> >   #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
> >   #define   WDT_CTRL_ENABLE		BIT(0)
> > +#define WDT_RESET_WIDTH		0x18
> > +#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
> > +#define   WDT_RESET_WIDTH_PUSHPULL	BIT(30)
> >
> >   #define WDT_RESTART_MAGIC	0x4755
> >
> > @@ -204,6 +207,24 @@ static int aspeed_wdt_probe(struct platform_device=
 *pdev)
> >   		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> >   	}
> >
> > +	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> > +		u32 from =3D readl(wdt->base + WDT_RESET_WIDTH);
> > +		u32 to =3D from;
> > +
> > +		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> > +			to |=3D WDT_RESET_WIDTH_PUSHPULL;
> > +		else
> > +			to &=3D ~WDT_RESET_WIDTH_PUSHPULL;
>  From the spec:
>=20
> To set this bit to value =E2=80=991=E2=80=99, write bit[31:24] =3D 0xA8.
> To set this bit to value =E2=80=990=E2=80=99, write bit[31:24] =3D 0x8A.

Oof. Yeah, clearly I should have gone to bed earlier. I tested the patch
under qemu but forgot to model that behaviour.

>=20
> > +
> > +		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> > +			to |=3D WDT_RESET_WIDTH_ACTIVE_HIGH;
> > +		else
> > +			to &=3D ~WDT_RESET_WIDTH_ACTIVE_HIGH;
> > +
> And again here:
> To set this bit to value =E2=80=991=E2=80=99, write bit[31:24] =3D 0xA5.
> To set this bit to value =E2=80=990=E2=80=99, write bit[31:24] =3D 0x5A.
> For others value, this bit will keep old value without change.

As above.

Sorry about that.

Andrew

> > +		if (from !=3D to)
> > +			writel(to, wdt->base + WDT_RESET_WIDTH);
> > +	}
> > +
> >   	ret =3D watchdog_register_device(&wdt->wdd);
> >   	if (ret) {
> >   		dev_err(&pdev->dev, "failed to register\n");
>=20
