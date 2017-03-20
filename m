Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn2yR1TxLzDqZY
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 04:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="n0zapNWG";
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id i34so112820142qtc.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nBbkff5EkaWSfdYa9B/lJvxT+/bhvu+4N9J65LFJlIs=;
 b=n0zapNWGRi19GWdHzy4jCf6DOEAPPpLwPxwT8IRlbiO6N++SHQ4r+6t0e5B6dFCvNk
 1TadAp1t5yEpra/p12A/vjdqvrkyyxd/Lq0sDPRlJnqMMXSTVYe/ezGHp0C0+xkGg1AW
 F7PhDQLmeUGsTVrjvWvffbF9PhD9AVfVpiE4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nBbkff5EkaWSfdYa9B/lJvxT+/bhvu+4N9J65LFJlIs=;
 b=muMiFAM9jZafgQ+tFcbrSoFeC4gwGPB+1eV2oaLnBhIp8UycnB4DYIxUAuHGrKUq1L
 boA7VeGWmsnh9jClkccZGTLhX8Zk5pNOTrYzi14XOdwFWYS8tcGcYBNomSDq6Waxp4cY
 C6utZEGHU1wh7mCZiTQ6k7icCDueKQlGAbzZQqaegLVxYwaqEeVomyXySAZeV2iS78T0
 JKWK+frTI2qoAIYjggPerIcfelCc4JrdwB/vFG/Epn94tLKMlX0vo68SefliV0b6QOWe
 TZ2rU67KyLSXYCm+NcnPxNLFvqZnJ0unHbmbrZqAJiV6WZ3UQC62LZzWBiWbLSSCZf/F
 D+uA==
X-Gm-Message-State: AFeK/H0TKRTH+AWysV2BH+xT4MZ4TxjRgqrueFjCZ8hW5XYQjBpw4pm4BXkWWELuT8Nhkg==
X-Received: by 10.200.44.71 with SMTP id e7mr26373782qta.210.1490031003084;
 Mon, 20 Mar 2017 10:30:03 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id c144sm12836408qkg.8.2017.03.20.10.30.02
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 20 Mar 2017 10:30:02 -0700 (PDT)
Date: Mon, 20 Mar 2017 13:30:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
Message-ID: <20170320173034.GX19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ShmrOXdeI8fJEEvs"
Content-Disposition: inline
In-Reply-To: <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 20 Mar 2017 17:30:08 -0000


--ShmrOXdeI8fJEEvs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote:
> On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> > > Add support for clocks needed by MACs to ast2500 clock driver.
> > > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> > > PCLK_MAC2 for MAC1 and MAC2 respectively.
> > >
> > > The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> > > SDK. It is not entirely clear from the datasheet how this clock is us=
ed
> > > by MACs, so not clear if the rate would ever need to be different. So,
> > > for now, hardcoding it is probably safer.
> > >
> > > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected throu=
gh
> > > hardware strapping.
> > >
> > > So, the network driver would only need to enable these clocks, no need
> > > to configure the rate.
> > >
> > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > ---
> > >
> > >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
> > >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
> > >  drivers/clk/aspeed/clk_ast2500.c               | 265
> > ++++++++++++++++++++++---
> > >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
> > >  4 files changed, 304 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
> > b/arch/arm/dts/ast2500-u-boot.dtsi
> > > index faeeec1be4..f826646095 100644
> > > --- a/arch/arm/dts/ast2500-u-boot.dtsi
> > > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> > > @@ -61,3 +61,11 @@
> > >               };
> > >       };
> > >  };
> > > +
> > > +&mac0 {
> > > +     clocks =3D <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> > > +};
> > > +
> > > +&mac1 {
> > > +     clocks =3D <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> > > +};
> >
> > Why is this here and not in the main dts file?  The -u-boot.dtsi is for
> > stuff that's not appropriate in the upstream dts file.  Thanks!
>=20
> There is no clock driver for this part in mainline Linux Kernel yet and I
> don't know how it will end up being configured. I suspect that they might
> not use the same bindings though.
>=20
> Should I put this into board specific dts?

So this applies to a lot of parts of the series here.  What we don't
want to do is have places where the DTS here diverges from the Linux
kernel DTS and we don't reconcile them.  If the relevant Linux drivers
are not in mainline, are they at least in linux-next or otherwise
submitted to the relevant subtrees?

--=20
Tom

--ShmrOXdeI8fJEEvs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJY0BG6AAoJEIf59jXTHXZSpyoP/isSMtECjQLYFYFkoYatxHLR
7HFD2rEKNGF0Dhh4RPG2tLNHhSmng+c4n82iGi11j4GlKmGfVUcAuIhxGYAvoVAY
IhMoVJKGDG3ZlY78bqRqiuNe99/UQHe5mZ50VwQnv5zG76SgEXYDL432litegAur
cP8KVXLX9xxlpzUtp23GUzCeBMTmD4YljMtlBg0kFWC6tfnTP7rocfuCB0f69dd5
Ydalm2rWiZW9DL1i1fv9ervCGbYYUHq3xm2T1U/QZFTRdqHrCWOTzVVC6J4K0MYH
iIMEbeuhobdcYpnz45nQ8EpTzIHMT1DRHaO96G7nYh5E6YlGavZ8re4rbQDQNy9E
gwToMURxlf94kPe8vHuuLxaH3WqmZBIH+agS2KeJncihUVYPmK1woKn392AhJ/+w
c2aVd76Wa32J1sVuws1X3n6DLK8WeJRihsxi29x+K37l6344wyv3DaIVLkEc1RvC
9FLu5KyX8KOHyVIxKRa6YmKzvRz0DODm0kdYOp5+cfKjXucD97wz0ElmddRd7BeJ
HPkLPaSNfxEjH/j7Z05xfYSb9uMPYVFRsw6d7CE+3HqLg/NK1uLzTfs5kltDd7aS
GzB5qvslJoa0o1vIaEmktWxZLsqlDnmGVscOUAFjD0aLqXBWEEdq9DKJwRgf84X1
/dpAbwYGKETeSv5+Qrbm
=L4Sl
-----END PGP SIGNATURE-----

--ShmrOXdeI8fJEEvs--
