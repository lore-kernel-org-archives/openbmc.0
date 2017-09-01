Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xk18q36gqzDqgk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 10:59:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r7E6DoOD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="clOOZgvE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F3EA020D54;
 Thu, 31 Aug 2017 20:59:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 31 Aug 2017 20:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=o2Jf9yo+1G3eiVreB7KitNoITKNxHifnLn19DipJc
 HE=; b=r7E6DoOD8yX+y17FnNjmugz6O0KoMhRDWRgk6vm7WBxn9fzoVP3n//qrj
 U5shEc6o6azrAfKkV/ovnVnny3HOroZKEbzcl3IrEKnnCqtCYVDKN9/JF/j1TdoA
 335iIOKS7po5h2TgR+0nl+UJRqpP/5ODDprzIy8/iiUYNm4GWecPw5Gnf1tIkRd2
 t9jsxbY538yMIG4FcUwCidZ8LVT5mS29VGn9iXGiVz1P+dRh8TG5E+PV255yH91+
 cATQKzfKCH6guxSHeCo178LlUoA/pD7o/JpOIDXD0aYhLidYf41/MoZ9UBIE87K+
 zV5EnPMQucJJy9m7IYcNx3Bm+TF6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=o2Jf9yo+1G3eiVreB7
 KitNoITKNxHifnLn19DipJcHE=; b=clOOZgvEHkGp+Am6uj++d3jZhCc/vaQd+o
 piuphj073LAQW9UHK+WO6mPj8DmhU+lPo+CzLnu6OTIucZlEYFuKMYUG0gepLbhp
 4huPdYUHZYrLFi8ELLi4b6Gsb85fqpCNKVLCIvhYI2cA79AI8WqgJUsVfrPHl33w
 OKPp8ANBfg2rUvo8WthzUsCPwLkrOKzG8UyKg1XY2GpdJHTSo7PMXaCXbzuAwM3R
 Je4RjeNSOQKaos9Fm/BRcKMln2XlVqSnT3APjzZQkEkjUtU1Z2DMNH5N7kRyq5c2
 ViN0+TMfAzYsggoHns4KBmuTYQ5WUP5EzK5RLU6LGd+ks9fisSlw==
X-ME-Sender: <xms:2LCoWQoz4ztFI5uAEeLyHO62uNK_mhm-tuVPDvFG1LLZtOvCcoTzrQ>
X-Sasl-enc: Nw+CSBfl7xU+frbYJMdbJiRMTG4cAgjZZp6T2kkiqI69 1504227544
Received: from keelia (ppp14-2-65-251.bras21.adl6.internode.on.net
 [14.2.65.251])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59A437E7AD;
 Thu, 31 Aug 2017 20:59:03 -0400 (EDT)
Message-ID: <1504227536.5933.34.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v6 0/3] Add user space accessibility for
 ucd9000 stats
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 01 Sep 2017 10:28:56 +0930
In-Reply-To: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8S/H6TPAWpXngKLKUTyz"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Fri, 01 Sep 2017 00:59:08 -0000


--=-8S/H6TPAWpXngKLKUTyz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-30 at 16:49 -0500, Christopher Bostic wrote:
> This set provides means to allow user space to access various properties =
of the
> ucd9000 type chips.
>=20
> Patch 0001 Adds a user space means of clearing logged faults.=C2=A0=C2=A0=
This ability is
> useful in cases where one wants to start with a clean slate during each s=
ystem
> power on.
>=20
> patch 0002 Adds gpio_chip interface for user to access various GPIO pin s=
tates
> via the /sys/class/gpio interface.
>=20
> Patch 0003 adds a debugfs for mfr_status information so user space can ga=
in
> visibility of gpi type faults. Note that there are limitations on type of=
 devices
> that debugfs supports.=C2=A0=C2=A0Presently only ucd90160 is supported.=
=C2=A0=C2=A0Any assumptions made
> as to formatting of data is commented inline in the code.=C2=A0=C2=A0Any =
expansion to other
> ucd9000 types will need to take this into consideration.
>=20
> Note also that no pinmux support is provided at this point.=C2=A0=C2=A0Th=
e ucd9000 devs do
> have mux capability so this should be added.
>=20
> Patch 0003 (was patch v5-0002... previously) has been reviewed by Andrew =
Jeffery,
> I did, however, add some small updates to this one:
>=20
> * Remove ida in bad and unbind paths.
> * Remove type ucd90160 check when adding debugfs. Add for all ucd9000 dev=
s.
> =C2=A0 Results in cleaner ida code in the remove path.

Thanks for the summary and for splitting out the patch introducing the
new ABI.

Unfortunately upstream NACKed what you've put as the first patch in
your series. In the future, it's best to order controversial patches
later, that way we can apply the uncontroversial patches without fuzz
or failures from context/content dependencies.

So given I can't apply the first patch as we know it won't go upstream,
I can't apply the rest either due to hunks failing or fuzzing. Can you
please respin, and given you need to do that, take into account
Guenter's feedback?

Cheers,

Andrew

>=20
> Christopher Bostic (3):
> =C2=A0 hwmon: (ucd9000) Add interface to clear logged faults.
> =C2=A0 hwmon: (ucd9000) Add gpio chip interface
> =C2=A0 hwmon: (ucd9000) Add debugfs to list mfr_status info
>=20
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 415 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 413 insertions(+), 2 deletions(-)
>=20
--=-8S/H6TPAWpXngKLKUTyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZqLDQAAoJEJ0dnzgO5LT57F4P/358SbO1Z57Wgfm+wJX4OM7Y
W7RPIE2CBfocqr76g4G/J2SoM7U6PNwB0Dsa0LPUO+qpdnY76jUpaX2n/uaqRflO
OPneQvTghGD8c0weso9IQhjRdHR2Sz3RpgQ3cqTRNGHtscGK3qHBU8/3HDEyDfHQ
7dKJFSKw9U1pavyyDRPu+SV/19zUkEJQj9mgUa7MPFi4crxQfLI8xLxBJV0BlXz/
hyFQRL+256+unS6EZAmVNUYBlTXEisTuaOBWpjEXwtBVgZxVntWKvNVCsGzAPcat
7abOB/Auio+22KuZeoXxeJ5lEn4bx5McQajdJ63dQhuTZbTR4MKO6EuRHnxnr0wx
gkjXAY+QaFt+cfBBYPc1qQ+Kct/dYu2Z/PhanwowNjdkErkJrSSqc7jySSvstSWt
Bxp33U5op7uyQgtGncjmrRHzYQVTBRRcdMqe4pCqyHwbj+aSiRfb3MmZLSx2SZmf
u/alqyiXKytmUzYrlxnmAD//tW5AYG6VEMwhggnO28t4xuTQUNqHU2S+oR1aoYrg
+iERnweLm0saR4Y3wQWB3R0bYpEmqes/RaatAczBdmmF09vsoJ+IbCaOcsWTNu09
/iMAISmqQsu4yEE96MYE7vQram6IAUocGynOP4PTFlzhFhZxkNid+4Vf6LoasTKD
kZ2hq6J+IJKIYg5baqzv
=ZMVb
-----END PGP SIGNATURE-----

--=-8S/H6TPAWpXngKLKUTyz--
