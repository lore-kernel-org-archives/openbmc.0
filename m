Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdF8W3MRRzDqRd
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 13:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=MnQDPg4L; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=LMPEVaeS; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1FAB724B;
 Sun, 26 Jun 2016 23:40:57 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Sun, 26 Jun 2016 23:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=RPQv9
 +X9V44HVv0UJZLcq8nhKNk=; b=MnQDPg4L/wFPcA1Ht5+2i/ZQTrhPzRV6nvTAU
 EtOFCIEvsmO5PFPdxMNGneaGG7C3RBes+pp0d2MqZp0lF6PTZtwJJTHJeVdQm/mk
 hCGv8JfR0p3NcUgETPNLtzC40tJhFUWT5mhJCfrdDwgWU+DOAS4zUDd1LnP2hy9h
 n2DV5U=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=RPQv9+X9V44HVv0UJZLcq8nhKNk=; b=LMPEV
 aeSS0E4Llp9r08x+ywTluK/qbIh9O7YNcEBXQEjOHj80tbflEkr0p0ymQm+OVgSJ
 AYsy/WrkUEn+Iu8VwcUnXYeq/xhJxgLLruWgbSnmBLSSMLZIa0tUcl3whnlikAJv
 1PhZH3319wkVd5aMzSI+CwfXTmj9CkftrD89r8=
X-Sasl-enc: m33EXlwmb4Xyi91nsuBR3CTkzvTddgT5Lj/K1t089y0c 1466998855
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7315F29EE;
 Sun, 26 Jun 2016 23:40:54 -0400 (EDT)
Message-ID: <1466998850.23740.154.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 11/18] initfs: update: check individual mtd
 partitions for mounts
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 13:10:50 +0930
In-Reply-To: <OF288BB6FD.08E26A12-ON00257FDC.007EE12A-00257FDE.000119E0@notes.na.collabserv.com>
References: <1466660106.23740.59.camel@aj.id.au>
 ,<20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-12-openbmc-patches@stwcx.xyz>
 <OF288BB6FD.08E26A12-ON00257FDC.007EE12A-00257FDE.000119E0@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Khljs9jGqqhL/ZIBPOmF"
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
X-List-Received-Date: Mon, 27 Jun 2016 03:41:00 -0000


--=-Khljs9jGqqhL/ZIBPOmF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-06-26 at 00:12 +0000, Milton Miller II wrote:
>=20
> On 06/23/2016 around 12:35AM in some timezone, Andrew Jeffery wrote:
> >On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> >> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> >>=C2=A0
> >> Instead of checking for any mtd device, only check mtd devices
> >> that are to be updated.
> >
> >What do you mean by "instead of"? We're not removing any code here,
> >and
> >from a quick look we loop over the update images in existing checks.
> >
>=20
> The grep for mtd anywhere in proc at the top of the script (that you
> had me move ERROR up to handle) is replaced with ...
>=20
> >> =C2=A0=C2=A0Include child mtd devices when looking
> >> for mounted filesystems.
> >>=C2=A0
> >> If this check is suppressed flash updates are suppressed.
> >> Suppressing the check may be useful to verify a update could
> >> succeed at shutdown.
> >>=C2=A0
> >> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> >> ---
> >> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 47
> >+++++++++++++++++++---
> >> =C2=A01 file changed, 41 insertions(+), 6 deletions(-)
> >>=C2=A0
> >> diff --git
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> index 4442e5b..22c9dcc 100755
> >> ---
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> +++
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> @@ -19,11 +19,34 @@ then
> >> =C2=A0 mount -t devtmpfs dev dev
> >> =C2=A0fi
> >> =C2=A0
> >> -if grep mtd /proc/mounts
> >> -then
> >> - echo 1>&2 "ERROR: A mtd device is mounted."
> >> - exit 1
> >> -fi
>=20
> Right here is the "instead of" code that is being removed.

Ah, thanks, that was an oversight.

>=20
>=20
> >> +# mtd number N with mtd name Name can be mounted via mtdN, or
> >mtd:Name
> >> +# (with a mtd aware fs) or by /dev/mtdblockN (with a mtd or block
> >fs).
> >> +mtdismounted() {
> >
> >I keep reading this as mt-dismounted rather than mtd-is-mounted. Can
> >we
> >add some underscores?
>=20
> If I do that then I have to add them to all the functions and then=C2=A0
> my lines go over 80 characters and then ...
>=20
> I considered ismtdmounted but that gets back to which is true like
> checkmtdmounted would, so I decided to go with mountedmtd.
>=20
> >> =C2=A0 shift ;;
> >> @@ -135,6 +162,14 @@ do
> >> =C2=A0 echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
> >> =C2=A0 exit 1
> >> =C2=A0 fi
> >> + for s in $m $(childmtds $m)
> >> + do
> >> + if test -n "$checkmount" && mtdismounted $s
> >
> >$checkmount is invariant with respect to $s, so is it worth hoisting
> >the check out of the loop? Though it would mean another indent...
> >
>=20
> Since this also suppresses the call to childmtds I decided to=C2=A0
> implement this, changing the error to be Device $s for ${f} is in use.
>=20
>=20
> Unfortunately the file system can be unmounted to where it=C2=A0
> no longer appears in /proc/mounts but is stlil mounted and in=C2=A0
> use by the overlay.=C2=A0 I don't know how to fix this.=C2=A0

Right, that's pretty ugly. Though, what context are we running in? I
thought we were executing in initrd, and if so, shouldn't it be
possible to avoid the overlay? That query is based on my hazy
recollection from the initial patches for the update support, so take
it with a grain of salt.

Cheers,

Andrew

>  Some long=C2=A0
> ideas are add sysfs status to mtd and add a process holding=C2=A0
> the directory open with the systemd "don't kill leave to shutdown=C2=A0
> script" process name (if that can be done from shell).=C2=A0 Or copying=
=C2=A0
> the .proc/mounts to /run when mounting overlay and checking=C2=A0
> that too.=C2=A0=C2=A0 This is to avoid root writing a new image while the=
=C2=A0
> file system writes to the flash based on the old image, and
> several of these options would not be detect mounting a device=C2=A0
> node with a nonstandard name.
>=20
> milton
>=20
--=-Khljs9jGqqhL/ZIBPOmF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcKBCAAoJEJ0dnzgO5LT56fwP/24W3//y0+7hBtvRK2dlpnHJ
2rIBTsA6nPMdh1cURs3fjeRLEZICH0CBJk/Uho83EHz9L9pj0m7pK7beJW73Vxak
TRhTFQRY2HpZpVNnwsn+ZCW3APBqA8ZbdqSes+AZR1DOoHenhdJDFK/GWJgEmxwK
lJiOappaJehBVPs6uDo3zCHOiQgr/H3Jbc6f9LAe5CcGu7NFphxxV98R68rD8mvf
xdW7quKB0H5yD5M+UD/muJ+11+Pu8OPj8ja/hMCf7/vr7qrp2tQTIgkWG91iIFpH
dw16485SmmxQ7ftU5wRkwhxYiJfsRa/JWj1to5DDGwB+PzdfMHElYfTCjlqv/LMN
UGKuvclWYD//2NMcnqDsEbnDN9D9v6djXP163RJl13n1u//LHOqWCx0t6gVthLO0
CgAA4iyI395nSBJS9uWwXw5lvbL4ibxvB1ZsOrmInSzfWeYBb4BQayZ4gZxMghkR
HzDwlUbZEicJwa8Ft6PEWAWQ/GeO1V9SrsLyfxRbm7k11f2gq7EhhcoZCOCTSi6R
UjKyIBGo4w0CJ4SMhJl5IEgezi2rXwNXk6dC1dC0nbncWEABQAyNZXSRO9Jqg3g2
ZWDxOWQYoXnqjH1EVVGvGVLwA2bwgnkniQIfciipM1NM7x4jyIZgg3SphLlWD5Ky
qt8wdALAHXm1ZJUznnbW
=8mDs
-----END PGP SIGNATURE-----

--=-Khljs9jGqqhL/ZIBPOmF--
