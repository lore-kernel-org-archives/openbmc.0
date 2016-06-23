Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 340 seconds by postgrey-1.35 at bilbo;
 Thu, 23 Jun 2016 13:43:01 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=DXj34MAw; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=cqjH5PRB; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZnNj3VH4zDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 13:43:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3813BB7B;
 Wed, 22 Jun 2016 23:37:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 22 Jun 2016 23:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=cS/I5
 QqMPoVC0crkuxY9yluE27I=; b=DXj34MAwIscrufJoFXBfNC99OS44+YkBnLCH/
 CZMwvCBWQxy5bjYR1oQMoyRFEoiKciaT7O2X2oukfxsXqQdYgSRKLkecyLwGZKGY
 TSbAIxKfui8beP47AHkwRtYvrJgWzr4rKFho1ZXTI5uZs7G17z1YsGU4XIXwiQGD
 QXvMRA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=cS/I5QqMPoVC0crkuxY9yluE27I=; b=cqjH5
 PRBzMZLfzeFfm5xE7JWclMGiKiL+CPaP+AiuLlOG+s3BoW6nTeUBGbf+vzt4ZSby
 xYdvcZLRyCwjchpGzYA7XnmJn0F9cOZfF2lPpIdO37ZngW3SAbWWjBgCwlpd6201
 7l059n6a9uzB6RmqPji50SObJjlxIcEfI+2Lu4=
X-Sasl-enc: /uRA+t2KTKCKtjqhyPmaqXdEk1zCRb46sc2YfTp3PXbH 1466653035
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36974CCDA6;
 Wed, 22 Jun 2016 23:37:14 -0400 (EDT)
Message-ID: <1466653030.23740.28.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 00/18] Update flash update to be useable at
 runtime.
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 13:07:10 +0930
In-Reply-To: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/nhToWvhVCAnEH29+7wM"
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
X-List-Received-Date: Thu, 23 Jun 2016 03:43:03 -0000


--=-/nhToWvhVCAnEH29+7wM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Milton,

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> The underlying storage for a file system can not be updated when it is in=
 use.=C2=A0=C2=A0The initial solution was to update the flash as the system=
 was being shutdown, with output to the console.
>=20
> Updates were made to the init script that allows the flash to not be used=
 for a given boot but the update script was not enhanced to make this user =
friendly, and no documentation was provided to prepare the system for this =
mode.
>=20
> This series partially addresses #293 by enhancing the update script to
> 1. provide more fine grained checks on update conflicts allowing use at r=
untime
> 2. provide additional checks that would cause failure to flash
> 3. provide user help and consistent tagging of error output
> 4. provide an error return code if the checks fail
>=20
> In addition the series provides
> * A fix to properly assemble the flash image, filling with `0xff` charact=
ers as intended.
> * A cleanup to the build recipe and naming.
> * A diagnostic message to shutdown if the update did not remove a file in=
dicating it was successful.
> * A method to build `init-options-base` into the initramfs providing opti=
ons to `init` while allowing additional sources of options like the kernel =
command line.=C2=A0
> * A self containted image `initramfs-netboot.cpio.u-boot` for loading ove=
r the network.
>=20
> These last two are intended to ease creating images for alternate network=
 based deployment and testing, easing the use of the features and options a=
lready in the `init` script.
>=20
>=20
> ---
> This change is [https://reviewable.io/review_button.svg" height=3D"35" al=
ign=3D"absmiddle" alt=3D"Reviewable"/>](https://reviewable.io/reviews/openb=
mc/openbmc/297)
>=20
>=20
>=20
> https://github.com/openbmc/openbmc/pull/297
>=20
> Brad Bishop (3):
> =C2=A0 Add pflash parallel build fix patch
> =C2=A0 Remove unnecessary skeleton dependencies
> =C2=A0 Removed unused host-ipmid-bt application
>=20
> Milton D. Miller II (9):
...
> Milton Miller (6):

Nit pick: Probably worth reconfiguring git to use a consistent user.name.

Cheers,

Andrew
--=-/nhToWvhVCAnEH29+7wM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa1lmAAoJEJ0dnzgO5LT5HWQQAIA/Kp47aLbp/C1dsswRtzrC
RPnHUnKtaVdiUn+vAcVhtDjv3yKAJfH4s+kNtlM879GQQsSqehdjR6lsbSxxLZ9R
HoS0yowM2mKBjHEG+jMAlDaPobBy77LraeIlyd8UcBgYv7RSTglo2RlYlFGx/J6Y
x7N0kPbD9aNAfVN7mSV3rJxjf64CxRYE+L+fQzyUL9aThHRYMGVKUwZgz7YYC8Qq
uMf7XcTQ6dsU9aKbFYyJ9xZFFHJl3t6NoVKDQWn0xekb3rFMJUq7ywGDetiJ9dyQ
NJ7CJYr3tpX4IYCXaUIufJwPN3CTVXqMi+vPRk45tqGBqI6m/cdvfmUkzdZunlji
w6AbLIbSoZM8b7WQWYNFG+1ui+B+75xhL1x65Fo1pUxT/bjMAmf53s3N8rSKxpdR
Z05NqUpG9OSRfvEByK17pavQFTX3emkx5CpmcMgnozTFa6yIMNso68PuU2cd3Ydg
hZq8vlnXv1Rdlqn/88t/7K4zVIZPiBgcVt1eg4Ilvt3VDyWvgzuqLQuWMU8WvPrQ
3cHx9Wnk6fqyl9r0kUJzCa/LWP0zMbx4tRV1TROr3LFmBycOIVMl+ybj9cHexe9F
OHRmyjFLTd/GE13c1jQJwf5Xaoe7t/6+GxT/7Gvtl3SUYvAdrjq6WS5+ETOjcbjd
QokNNs8eJ1zys0kfUg6K
=YuNi
-----END PGP SIGNATURE-----

--=-/nhToWvhVCAnEH29+7wM--
