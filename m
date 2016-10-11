Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKfw0WjzzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 12:49:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=dx5uNAvW; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=McBBiO22; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CCC820387;
 Mon, 10 Oct 2016 21:49:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 10 Oct 2016 21:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=oYc82
 /ulnnJFzKUSE8+qKztM4Pg=; b=dx5uNAvWB8dGugsRO3Hw2qZuqaSoYxXP/CIDC
 xpFqmuSw9boO6OWHb+h37tCt8RJmzl0z/8s5tHduqax6M5fye4XfSy4lDe9T07ko
 ix2MNegXsE/innTe/avxkh2zyxpH1mzWOGhjUIVbi9sXBUTwXCxfkW3aBX5b0tjO
 ndUKAk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=oYc82/ulnnJFzKUSE8+qKztM4Pg=; b=McBBi
 O22Rsn1CaO3OpGQLEdEF2J6Hd6ECmM+JfXsw9ZKWwnBeI2tUsjk9Lz4rNgKJaCMU
 XqdeMg0Xt1u7E352Utg7GnMHMUMH9dYbznD+vSWhEdGaIY+5WFCvjfsQQpYEg/Vq
 yD+UlVb0aFs7THDzWGKtpRYkJ3i6x/bmCWzPdU=
X-Sasl-enc: ZdnXz0KkoSiN+btbvpvtzIjAyZGDU3VvLqV5/8QTBIWK 1476150564
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF1D8CC07B;
 Mon, 10 Oct 2016 21:49:23 -0400 (EDT)
Message-ID: <1476150559.16733.62.camel@aj.id.au>
Subject: Re: [RFC linux v1 0/2] drivers: OCC hwmon driver restructuring
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Date: Tue, 11 Oct 2016 12:19:19 +1030
In-Reply-To: <1476126390-17892-1-git-send-email-eajames.ibm@gmail.com>
References: <1476126390-17892-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-McykKd2osOgkBjGQdJp/"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 11 Oct 2016 01:49:29 -0000


--=-McykKd2osOgkBjGQdJp/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

On Mon, 2016-10-10 at 14:06 -0500, eajames.ibm@gmail.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patchset is provided to refactor the Power8 OCC hwmon driver. There =
are a
> number of issues with the existing driver. Firstly, i2c access was embedd=
ed
> throughout the driver. Secondly, there is no way to easily add different
> versions of the OCC.
>=20
> This patchset addresses the first issue by abstracting the bus transfer
> protocol into a modular structure. In this way, any low level transfer me=
thod
> may be easily implemented.
>=20
> The second issue is addressed by separating the "version specific" code f=
or the
> OCC and the common hwmon code. This task is not yet complete, but the gen=
eral
> structure is in place. Ultimately, different OCC versions could be probed=
 up
> using the device tree.

Nice description.

As a side note, the associated patches didn't appear to thread under
the cover letter. `git send-email` should sort that out for you by
default, unless you added some extra switches (--no-thread)?

>=20
> Patch 1: "drivers: move OCC hwmon driver to occ directory"
> * Move the Power8 OCC hwmon driver into it's own directory. Now we can
> =C2=A0 have multiple files and avoid cluttering up the main hwmon directo=
ry.
>=C2=A0
> Patch 2: "drivers: occ hwmon - isolate bus transfer protocol"
> * modify drivers/hwmon Makefile and Kconfig
> * create i2c layer
> * move some common code out of the Power8 OCC specific file
> * clean up Power8 OCC driver

Four bullet points for one patch concerns me.

Andrew

>=20
> Edward A. James (2):
> =C2=A0 drivers: move OCC hwmon driver to occ directory
> =C2=A0 drivers: occ hwmon - isolate bus transfer protocol
>=20
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A013 +-
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A02 +-
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A0=C2=A015 +
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0127 ++++
> =C2=A0drivers/hwmon/occ/occ.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A050 ++
> =C2=A0drivers/hwmon/occ/occ_i2c.c=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0191=
 ++++++
> =C2=A0drivers/hwmon/occ/power8_occ.c | 1048 +++++++++++++++++++++++++++++=
++++
> =C2=A0drivers/hwmon/occ/power8_occ.h |=C2=A0=C2=A0=C2=A024 +
> =C2=A0drivers/hwmon/power8_occ_i2c.c | 1254 -----------------------------=
-----------
> =C2=A010 files changed, 1458 insertions(+), 1267 deletions(-)
> =C2=A0create mode 100644 drivers/hwmon/occ/Kconfig
> =C2=A0create mode 100644 drivers/hwmon/occ/Makefile
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.h
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_i2c.c
> =C2=A0create mode 100644 drivers/hwmon/occ/power8_occ.c
> =C2=A0create mode 100644 drivers/hwmon/occ/power8_occ.h
> =C2=A0delete mode 100644 drivers/hwmon/power8_occ_i2c.c
>=20
--=-McykKd2osOgkBjGQdJp/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/EUgAAoJEJ0dnzgO5LT57JYP/ilWn6144SXheq2L4e2puODZ
TAm9xJnfWUFh6r5BSbgCeiKBUD3s2zB9ZVVXiv52AEtmFjM+/MCMcfcRquOQK3FY
TmnQhGr42cfQBAtg8/8PG32D856XYeX443+DT9/WekvReggmiWTUCxY+5DlXXb70
anYoAkf2ESQiTilkEfNcblBy4vZ0F0o5FfJ+7vcRChBhjSIhQrQE3lVp1Qrhl9KH
79qxSgG8GihZWI9b5JJhPvvXia0EfCB01X80cSqNZShbw01ehi/YuOIZ+F/JY1NT
1hB484VlWHLXJ9y5QDdazillKayBDJ6ETymP5SavDNVhtfeEJ3p4HF61MOIsCYAd
GmiKMjF7Gk6s06vOM0rpSmx4DmXAqAPkWGFHuWd810oINaq/idxogWCvMMTq1KCV
D61GbilHdxpbcoq67W4Q2x2fJhbMTr2iyDToBoAfYb1c5j39r6RZ9a+eb7NY6iSb
RGOod02xeTZg84p95fFxyC9w4RuOeX8M/DLvcTyAl7VnX0CsWxx03v8T7+R/d5VF
43bPejy2EEglf9yMFfCU7lMe0BRo5yGdrarF1lYLL1Wg3IoVv7dfVJC8pHbu+HBm
4AL8UWb2oifRdhSERBVS0WMGYpOthtwYTukTjoCeDi2fWoPJs/ctmtXjPxUhKAo9
R1VY5YrnFosUQI9loFzC
=Ag44
-----END PGP SIGNATURE-----

--=-McykKd2osOgkBjGQdJp/--
