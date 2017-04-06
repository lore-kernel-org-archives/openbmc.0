Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzfMc1jv0zDqHg
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 09:40:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JBLp5j1j"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oPVlOi0Z"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1886A20C1B;
 Thu,  6 Apr 2017 19:40:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 06 Apr 2017 19:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ubCowkjncQisXoc5+Ag9umVKc2pIxlpvQX/qf0npt
 1o=; b=JBLp5j1j0hEKtAiahRmlSJhr8DLCsrf1KKZgmqY1g5B9uVXNVwPrSYnDt
 9Ctwz1NcxinRk2aUWXLaOq6tn7dJHScoBY3d4wzLagRY48uu3plR9BEm82VqcfdY
 P2YGEoCwrVMNqRjmnXbMNn8nkY0Gx/KMwxqkHf95v5hqFZuA5beatv7OLSX2f+Ce
 vUK9lA+gN2KvAtqe6ET4oM6EooRc77tWJ+LCQODb/9s9zJ5e8pfA80+0GefNRkVh
 kZXGt4rDeUe7gTOao6Q8Ny5pf04BHPq9fy26NCcLiuBRjxl2oRNkTSpE31H02xTW
 ExlBdzADmFp9dmqWVcFEG2Ais5IVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ubCowkjncQisXoc5+A
 g9umVKc2pIxlpvQX/qf0npt1o=; b=oPVlOi0ZtXaG+Gv8PtAvjIaH/8c86h7aL5
 +eSSjJvgviKARV5Dlh0b8C4BWWbL+gB8vaZ43NfMVw/GHf6V749DyJMD9fzsifNI
 MvCTWK0Y7V7Rr6KLqNXE3HEDy+NqiSsetlFympHV944EYlSHpGyOt3C8QwFzwpwR
 5bqGZ6KwqkO0NPdK5KYbSLSqEIedpY11xqSvwDpeAyzyCpzz8z4SLvPy8LJDZuWW
 y/u3fX7UWaRNF0pzVv7BrGasqvcHfRSOTmyQavW0R69Tt1YYysh1S/9IvZ3M5J6w
 azrVnvWFxUAWWGrMq/IYE1UOP2RRnJeDN6ckVnu8/WUh3XbI29KQ==
X-ME-Sender: <xms:2tHmWCHPaxKeMmP-Oa2iDUzOQczCCL9gmnrg5TpYefB3cEqRssuawg>
X-Sasl-enc: PEPlS2moTKIqBnp/O3KZmBqiiOc/u4xRnR4R7pE0qbSV 1491522009
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 602BC2436B;
 Thu,  6 Apr 2017 19:40:08 -0400 (EDT)
Message-ID: <1491522001.5817.6.camel@aj.id.au>
Subject: Re: Release v1.99.4
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 07 Apr 2017 09:10:01 +0930
In-Reply-To: <20170406203333.y44jjya7zmb4hg4h@asimov>
References: <20170406203333.y44jjya7zmb4hg4h@asimov>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PJbdsU7irGeFqIiamVSb"
X-Mailer: Evolution 3.22.3-0ubuntu0.1 
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
X-List-Received-Date: Thu, 06 Apr 2017 23:40:14 -0000


--=-PJbdsU7irGeFqIiamVSb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A few points and queries:

On Thu, 2017-04-06 at 15:33 -0500, Patrick Williams wrote:
> I released a tag v1.99.4 as our next development milestone towards
> v2.0.=C2=A0=C2=A0There are 209 commits between v1.99.4 and v1.99.3, plus =
the
> usual many more commits in sub-repositories we manage.
>=20
> Big changes in this tag:
> =C2=A0=C2=A0=C2=A0=C2=A0* Upgrade from Yocto 2.2 to Yocto 2.1.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- This was a major change=
 in Yocto/Bitbake.=C2=A0=C2=A0They upgraded
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0all bitbake s=
cripts from python2 to python3.

Building OpenBMC on "small" systems (e.g. systems with less than 8GiB
of RAM) may fail, as we hit a libstdc++ bug as a result of the upgrade:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D80290

> =C2=A0=C2=A0=C2=A0=C2=A0* Power9 systems use OpenFSI and compiled applica=
tion for processor
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0control instead of shell scripts.

As a note, pdbg has been "moved" to the debug tarball and is no-longer
available on the system out-of-the-box.

> =C2=A0=C2=A0=C2=A0=C2=A0* Elimination of "debug mode" in favor of systemd=
 targets:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- External FSI control fo=
r Cronus is done by systemd targets.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Automatic reboot of the=
 host can be disabled independently
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0by systemd ta=
rgets.=C2=A0=C2=A0This leaves the system in quiesce state
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0when the host=
-watchdog fail or checkstop detection occurs.

Patrick: Do you have a link to documentation of these targets? Ideally
these announcements would also provide these pointers.

> =C2=A0=C2=A0=C2=A0=C2=A0* LED management is refactored out of 'skeleton' =
and old
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/org/openbmc interfaces are removed.
> =C2=A0=C2=A0=C2=A0=C2=A0* Soft power-off should be supported.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- This allows the host OS=
 to gracefully shutdown on a power-off
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0request.

Again, is there documentation?

Cheers,

Andrew
--=-PJbdsU7irGeFqIiamVSb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY5tHRAAoJEJ0dnzgO5LT5qCUQAJleFVYS565xMZ8EE2t4Lbdm
+mTDtFQBoQym0T8JQ3u88oUEGnmqufQssYVAW+P2IC9WxbP/nF6wdKVDgQqHEEAT
v2vtQgD3mvhcG+vW5lpMEDaqotMJj2b9qvzAAn01Jh4MuvYa3lWxz6/s9nP94t3k
9Pazr13o5oPXXfRwZhG8fx6XXunqige5J3DSyqm+wtphbbunJNowUHIs3M7k6duj
4oNCwKlfhv9d8+pqwMBrIZs+vxrXjFkMbae7V8WwEUMWh4d28055ZrJRrZveDGCf
9smD8G82u1jdacoiXR/DysxZpLG1waoXmktCmH3Lw2gSLMjVExb6vX7lODeQu37V
mnBZlBW3K5qnjTHZRaIGiBIngFlNg4SnwhNYS1rEdcFmzDYu92TnCHaoDXrvcl6r
IeomIk8aP5MXWPDyQjoklHOPkq0/5hBorN7GAZTvGwWqg88aZfJ6FmOw1BLW/l/5
vij/Kh31NrTwQ101EGN5ndsc8eccZNkjaXqOBHNdjBomOgmrRSw36Mh4YHN1wTsn
b3a28PkrvB32kF/4Vi1uRS8EkTYMM2bmRE048caEl/Hgy+1q9KB/QfkSVT1YPkYA
s3X2Fo0kGGIgek/3Nrlo/QWBNvWjOfae6FveiJJWp5mVa2/CpAF0pg/a4q2vGBZ1
clc0XpvFfJGRLjtmmzmD
=Afms
-----END PGP SIGNATURE-----

--=-PJbdsU7irGeFqIiamVSb--
