Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPThh090rzDq5m
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 10:24:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=FrXFaMZP; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 35D28150074;
 Tue,  7 Jun 2016 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=j8EjDaWrN2sT9hKDwnZff
 ltAow0=; b=FrXFaMZPnezTX6HXsmUtZMd+K3c6KmiYQVDc1oNYsZ/0Xw+unAc2D
 jP1O9SVy52BweoWzBziRauSEgsrVT7HD1bdIE+eafyKnACaaGVAFZY9lWBNvSRJg
 h0nsDvTk3PNLJgAV3kfI7mmV9YuO2VGCzOaNSQBdfPjFDWsMT2yhbs=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id 05D83150069;
 Tue,  7 Jun 2016 17:24:31 -0700 (PDT)
Message-ID: <1465345456.16048.86.camel@aj.id.au>
Subject: Re: [PATCH qemu v2] Add OpenCompute Yosemite BMC ARM board
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Teddy Reed <teddy.reed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 08 Jun 2016 09:54:16 +0930
In-Reply-To: <CADUykepfNmVTjXt-PnMVVpX7B4Qad1w-BFW8SSakvZksnfirog@mail.gmail.com>
References: <20160605212520.17a03a18e4b6deffc6fd8005@gmail.com>
 <1465199534.16048.41.camel@aj.id.au>
 <CADUykepfNmVTjXt-PnMVVpX7B4Qad1w-BFW8SSakvZksnfirog@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XC6JSOBaQTP1kram5Akd"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 00:24:36 -0000


--=-XC6JSOBaQTP1kram5Akd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-06-07 at 09:32 -0700, Teddy Reed wrote:
> On Mon, Jun 6, 2016 at 12:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Hey Teddy,
> >=20
> > On Sun, 2016-06-05 at 21:25 -0700, Teddy Reed wrote:
> > >=20
> > > The Yosemite BMC board is very similar to the Palmetto BMC. They both=
 configure
> > > an AST2400 SoC and have rather simple device sets.
> > >=20
> > > The Yosemite uses dual SPI flashes but the AST2400's memory controlle=
r, via
> > > hardware strapping, makes either a NAND, NOR, or SPI available at boo=
t at
> > > 0x0 and 0x2000:0000. For the board emulation included here the SPIs a=
re replaced
> > > with CFI flash to allow simple pflash configuration via the caller.
> > Have you had a look at C=C3=A9dric's recent series which adds FMC/SPI f=
lash
> > support[1]? The caller can pass two -mtdblock args, the first
> > specifying the BMC flash and the second the host. It would be handy if
> > you could cast your eyes over it in any case, and it may make sense to
> > integrate with that work rather than just get by with the pflash
> > infrastructure.
> >=20
> > [1] https://lists.ozlabs.org/pipermail/openbmc/2016-May/003316.html
> I've followed them loosely, but I'll take a look and see if they work
> for my tests. If so then we don't need this new model. ;)

Well, that'll tidy things up nicely!

> +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0/* Map flash0 to FBYOSEMITE_TEXT_BASE */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0pflash0mem =3D sysbus_mmio_get_region(SYS_BU=
S_DEVICE(pflash0), 0);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_set_readonly(pflash0mem, true)=
;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_alias(&bmc->flash0_alias,=
 NULL,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"flash0.alias", pflash0mem, FBYOSEMITE_TEX=
T_BASE,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FBYOSEMITE_FLASH0_SIZE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_add_subregion(get_system_memor=
y(), FBYOSEMITE_TEXT_BASE,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&bmc->flash0_alias);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_set_readonly(&bmc->flash0_alia=
s, true);
> > So having tinkered with memory aliasing in the openbmc/qemu repo and
> > likely done the wrong thing: From memory the sdk u-boot re-maps RAM to
> > 0 during boot, so is it right to fix the mapping this way? I'm not
> > across what the side-effects are if we have the wrong data here after
> > remap, but we should probably do the right thing. As an aside C=C3=A9dr=
ic's
> > series is using rom_add_blob_fixed() to copy the entire mtdblock device
> > content down to zero, but to my knowledge isn't dealing with remapping
> > either. How much does it matter?
> Having the alias does matter for my tests. But I have not been testing
> the remap via the SCU. I don't mind either way, but if it's possible
> to model the remap request within the QEMU AST2400 SCU that's awesome
> and absolutely preferred.

I'll look into this shortly to see if we can dynamically remap within
the SCU. Looks like I'll need to send the patch upstream in the near
future to make it into the next release.

Andrew
--=-XC6JSOBaQTP1kram5Akd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXV2WwAAoJEJ0dnzgO5LT5+awP+gIOZapiW0ovQugwAMzwfKf4
AtDsOD5Gy6lV2FiS1e+eO7io2iFpj0Rk4OhOWj1JBANpTOJkMoWWztJi5vKNddID
C2EHqV/Yr1l2XvTeCur9Zq3nqhi9ebBrYNIEVoPQ1glLprH8w1zOefSiIwTs33/W
gUbNjkmeWpZ1pR1s8aEmjoJdK4R0Om+1M4tRCl+ju9rbotgX/ziMcwUo6wgWpe5t
GT8ZSHzJmIx4WM0+Ur6A0xYlviqoQiu9Jcon7B5vaGswxXCR9f4yLMTaUYjzsx8b
9hha4ZCBg5Rsz9VAAysv36dVDvlevdtO7VGew7maipForKvPIZG9rggRNgiRFrio
hbOhjl3GF98oNW+sGhavnUdMWLVnzmSjX6+j3aW4B85zBL2xTJXjdSxZRThPxPFn
syamXRV6yKdGiGrV5lsxpN6XUGRjn59lzmRuiTTJQwbs7t2hMSwpMPIQXBm1H0S1
8ZoKxr+VL/UnQ5CbMumDSitGmx+evlcsiNT33QG63rK7jHyEwCzFxA+Zd9WAdkRE
Uy8v20ccH+/5kC+qWpyX2ymZ3Iw+5FrojX4zWjleauNYDW5JwcZkrld2woFUH1lk
qHrA9awy00W/Devg+Hn1CxKEkF3jjOxT0ya/TOPkQb+Mn1t77mzcKkFEcjifC4ZV
LNhuo5H0buidc1X0Xsuw
=KtMs
-----END PGP SIGNATURE-----

--=-XC6JSOBaQTP1kram5Akd--
