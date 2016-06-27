Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdYmn1139zDqRd
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 02:10:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=lEQ5vadV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=okvDasCp; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ACC7CC9F;
 Mon, 27 Jun 2016 12:09:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 27 Jun 2016 12:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=AQgDm
 tHlgDag7Frjth9rQLZK4mg=; b=lEQ5vadVygBgBWDLwN0qCKpzY0nZKwd/HmeFD
 ANAw1K1GpfgA0xA8kHTNAeTGXzt6AWva5VtjjvUJTkMXnA5sOqHSMrUvomUztadU
 QBWYB1Dxsd2fHTrjfrdUMeDFwnQKpJjNxcCsWuzoS4w2e59yIuaMIFIw9MHld77p
 vtp4tk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=AQgDmtHlgDag7Frjth9rQLZK4mg=; b=okvDa
 sCpD9E2uNztcVAYqLrftkv6wwMqWHDrfsGmOIW/c+O5nwjgzBePRcBzR2HhilrJE
 RhDILfs9bZxRIdy9AFOOd9O3HIujicy/nHvZeSyd6q+sLI7lrMaC0c5pt4VY6N9P
 U8MQpaYtAwQtPgSrIbn5WT1IEAGTy5ZaVJL3EA=
X-Sasl-enc: FvHBLMVIzAPvE16oKuNjEyGDFQ91cfCmBR0nZukP5Bzz 1467043797
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB8F5F2A03;
 Mon, 27 Jun 2016 12:09:55 -0400 (EDT)
Message-ID: <1467043788.23740.187.camel@aj.id.au>
Subject: Re: [PATCH qemu 00/12] SMC and network support
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 28 Jun 2016 01:39:48 +0930
In-Reply-To: <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XDycZNrHG8NJn/IGdedv"
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
X-List-Received-Date: Mon, 27 Jun 2016 16:10:02 -0000


--=-XDycZNrHG8NJn/IGdedv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-23 at 19:00 +0200, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
>=20
> On 05/29/2016 11:19 PM, C=C3=A9dric Le Goater wrote:
> >=20
> >=20
> > The following patchset adds to the qemu palmetto-bmc platform initial
> > support for the AST2400 SMC controllers and for the FTGMAC100 network
> > adapter. The device models don't implement all the features the HW
> > proposes but they are complete enough to run OpenBMC on a qemu guest.
> >=20
> > To boot one, use the following command line :
> >=20
> > =C2=A0 $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults=
=C2=A0=C2=A0\
> > 	-mtdblock ./flash-palmetto-20160512040959=C2=A0=C2=A0\
> > 	-mtdblock ./palmetto.pnor=C2=A0
> > 	-net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostname=3Dqemu
> > =09
> > or, if you have a libvirt bridge, you can tie the nic to it :
> > =09
> > 	-net nic,macaddr=3DC0:FF:EE:00:00:02,model=3Dftgmac100 \
> > 	-net bridge,id=3Dnet0,helper=3D/usr/lib/qemu/qemu-bridge-helper,br=3Dv=
irbr0=C2=A0
> >=20
> > The first block device uses the file './flash-palmetto-20160512040959'
> > which will act as a SPI flash module for the BMC, handled by the
> > SMC/FMC controller. The second block device uses the file
> > './palmetto.pnor' which is an OpenPower firmware image for a palmetto
> > OpenPower system. This one will be handled by the SMC/SPI controller.
> >=20
> >=20
> > Code is based on Andrew's qemu and the full tree can be found here
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://github.com/legoater/qemu/commits/aspeed
> >=20
> > Flash images can be grabbed here :
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://openpower.xyz/job/openbmc-build/distro=
=3Dubuntu,target=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmetto/fl=
ash-palmetto
> > =C2=A0=C2=A0=C2=A0=C2=A0https://openpower.xyz/job/openpower-op-build/di=
stro=3Dubuntu,target=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmett=
o.pnor
> Here is a quick update as I just did a rebase of my branch on mainline qe=
mu=C2=A0
> (commit c7288767523f) :
>=20
> 	https://github.com/legoater/qemu/commits/aspeed
>=20
> A couple of patches, that have been sent and discussed on qemu-devel@ but=
=C2=A0
> not merged yet, are included :=C2=A0
>=20
> 	a828f92a1807 hw/misc: Add a model for the ASPEED System Control Unit
> 	1181e14788a9 ast2400: Integrate the SCU model and set silicon revision
> 	e17aa27fa6b8 palmetto-bmc: Configure the SCU's hardware strapping regist=
er
> 	26582428d17c ssi: change ssi_slave_init to be a realize ops
> 	7b50ed94582f m25p80: qdev-ify drive property
> 	9d058cd9dd81 ast2400: add SMC controllers (FMC and SPI)
> 	1f92166a189d ast2400: add SPI flash slave object
> 	a1fff8b8776f ast2400: create SPI flash slaves
> 	b93fe85af7b8 tests: add a m25p80 test
>=20
> plus these for booting from the rom. There are some changes due to the re=
work=C2=A0
> of the previous and "fixes" for the block layer ... Looks stable now and =
mostly
> ok.
>=20
> 	2f0dabacf3b9 m25p80: use synchronous writes to update the block backend
> 	0e7345a2d430 m25p80: add a m25p80_set_rom_storage() routine
> 	3f02fba0c02f ast2400: handle SPI flash Command mode (read only)
> 	8325fc4b1ad9 ast2400: use contents of first SPI flash as a rom
>=20
> These are devices enhancements, nothing major :
>=20
> 	85f49de1c31e m25p80: add RDCR instruction for Macronix chip
> 	c519cdde94c6 m25p80: add mx25l25635f chip
> 	a520956879b1 ast2400: use a mx25l25635f chip
> 	31871f768618 hw/misc: add a TMP42{1,2,3} device model
> 	b09b8a5088a2 ast2400: add a temp sensor device on I2C bus 3
> 	8750ab3e2400 ast2400: add a rtc device on I2C bus 0
>=20
> and to finish, the network device which has not changed but should with=
=C2=A0
> the recent findings on the ast2500 :
>=20
> 	4e57f68ccaf5 net: add FTGMAC100 support
> 	ba7a28c66ec3 ast2400: add a FTGMAC100 nic
>=20
>=20
> To give it a try, use :
>=20
> 	$ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults=C2=A0=C2=
=A0\
> 		-drive file=3Dflash-palmetto,format=3Draw,if=3Dmtd \
> 		-drive file=3Dpalmetto.pnor,format=3Draw,if=3Dmtd \=C2=A0
> 		-net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostname=3Dqemu
> 		-serial stdio
>=20
> and if you have a libvirt bridge :
>=20
> 	=C2=A0	-net nic,macaddr=3DC0:FF:EE:00:00:02,model=3Dftgmac100 \
> 		-net bridge,id=3Dnet0,helper=3D/usr/lib/qemu/qemu-bridge-helper,br=3Dvi=
rbr0=C2=A0
>=20
>=20
> I could boot the OpenBMC 1.0 image with it. Comments welcome !

I've updated openbmc/qemu master with the latest version of these
patches based on the upstream SCU code. So Joel, you can now use the
openbmc/qemu tree for CI testing on the flash blobs.

Cheers,

Andrew
--=-XDycZNrHG8NJn/IGdedv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcU/MAAoJEJ0dnzgO5LT5NHMP+wdifbN5DJ3gPwarnIxkOm5r
QPb9MAxlR0bb3ZmzFKXBXaGuQ/n4H4M1Ak6YtRBpw0WLlPnaZjJEdkfMn+EzFKBd
tWSDo6oDfrbGDOKQxcRdyVokrC+bfj1kzuH3Llq1KUZ7kim1Nupy0RxR+9xrxVD3
/8XsZZAlDjS8Hek2ugyb86L2Ft6hbNjRdrFtnH8gxVX4BoX25CjWDJtqFDkIIhQa
lBLPMODoErdkRMwlSOPaG/QpHqR9fgu38JuenKBSfdeeitydskelMNCm6Cqn441l
j9QQ2OR7qMYdbWUF1adMiw5099TGMJ4iuzcypujzF3Y5+0tbXv7c761JnbcMMnBg
RCwyNAT0l1JG6Z+RynL+1/mV3SD2XPQ2Zz0pplWYvTB/2xEvhI52AWF3Q3eiMnf1
ykhouBJA1veaU0s4N2ApuN45bo5TTSEfKTc5xhdnrUcHxkAgkvq8kj2WaX8Rh78u
43YRCJzBzARql3Wr3lVLkfZwV+0U3a8/OsHw8EBCASA1AgjL2CpdYMoKePQmb5os
3Ca7Rzy6DnGezbOkhzH3fcROipuKMyDLISDEJyUfBcEV4Roe/S6WndB77ITaFpXH
yUG+k45d/BZxBYLDS7XAyrJQvsZ70CRf0mFGDAXiw95lvwIQq8QZ9GTACgE6TRtd
VJZKGhN8/eA3fPf8NwYg
=X8pu
-----END PGP SIGNATURE-----

--=-XDycZNrHG8NJn/IGdedv--
