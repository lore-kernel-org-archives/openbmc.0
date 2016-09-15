Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZZwk3Ng2zDsGT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 20:51:50 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14739367011841016.7013121335818;
 Thu, 15 Sep 2016 03:51:41 -0700 (PDT)
Date: Thu, 15 Sep 2016 05:51:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
Message-ID: <20160915105129.GC25351@heinlein.lan>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
 <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
 <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 15 Sep 2016 10:51:51 -0000


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:36:46AM +0200, C=E9dric Le Goater wrote:
> >> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
> >> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
> >> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
> >> device?
> >=20
> > Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc mak=
es=20
>=20
> I meant /dev/ipmi-bt-host ! :)

Does it make sense to have these numbered?  I thought Brenden proposed
an emulated bt-over-i2c.  We could also conceive of an SOC that had
multiple LPC (+bt) engines to facilitate multiple nodes, or an off-board
FPGA to do it.

--=20
Patrick Williams

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2n0xAAoJEKsDR8wtAMEZhaYP/j/B41zTRo3e52lzvU43+HOn
ELhXU0GMsse83GdwnsV3YAm9jq9pFxvmO0idLoSNEmZ3Wau19r2RkVXBdpeYrqxF
VDeLbMKAHAWxQsTFavWWuzmg5uDJ9+RkbjAJnrYKmAOTpfTg2Z0XD7in6GRLWdti
cl4DfTMBxhx7Rb+cWi3mNrn4debw+bmE/qwXnTHptUq5fl8Ds8WC01f0FBZZdG0H
do9PIgTFX50LFsMa2p0B1bsaU9dMSVzbZ/yQEAjt7h7cRwr9T3VjahAHAmoCLYSJ
53Y5R0QnbyEbv9Bch8nbzHwm3ut9fvTNBdEfbe2s0GLThYH7FaepvFKfUfSZNDTm
g7Cxa0b7rfcPlzFVgpwboff7UtDGqGY+HgwOzPiZsK7xFFLKVAn6ajMuvDwCIrzi
5GHaPbI6PsplyBq3fpSk8ahbiWjvkgivTx4yFNBLAMaEKtbpfkHU5Msy2EnT3ZTq
P1LXH7K0DZ8qv+Ao2Exds5ND3wJ4OVfqOBrbcwuIASPeOecGck/36Wsifp8sx074
6rRPc4uPUAQs/BtiHUDUbw34KJ+GU24JyB7QgdhbEl2htNzvBzAbfsv9wqgqKruM
hC1TaeC9S2YBsOZwYAuxwIr0uwhtURsKnJxhWeSnRhqkLEcKI1BHwMoCngTSwc6M
Nap5jhtz2XzTjW0TIlJX
=/OGn
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
