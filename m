Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN8362sGYzDwDG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 13:06:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KjqgpO5V"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IKC6MnbL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D9892085F;
 Mon, 21 Nov 2016 21:06:24 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 21:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=rzkVWvsJM8/lEgyHfUzkMZE8nps=; b=KjqgpO
 5VxDwdyszyRq9yonMQD75aK+Ux1DGWtbrKka4wHFH/rQNwfXrpCxTOM4UOJ1JNK8
 mDLO4WMIsBmqH+vTN0TNgWbuny1X+pY2fS0bhgtpSXL39+lGrVfzHhQdPITDpO9p
 UXQPshVZdYFLetIYfwO/qBk6zBc1SmVaQh8do=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=rzkVWvsJM8/lEg
 yHfUzkMZE8nps=; b=IKC6MnbLQaQjfcVA/DQJ5q0UPJ5zgbx+UcOc6SEye6BvLB
 rY+TiLeRYpRX+1aoWj8Ntv/6FiFPZ8NhkASLotgQF1alpNjhvrwkH1d4Wn/FxkUS
 EC9FkRtI6k5Emy30rNp0f7Vo3+ub6ZAzQpxTohK8D4ijNtoxCJJNpmDmyYNag=
X-ME-Sender: <xms:IKgzWKIluPl-63yTidUIKpEnm0yq7Z-8EZP8p3f2pYZ8gHaG9vdqJQ>
X-Sasl-enc: zxFkh5qjyD/x7+b2TJyZ4pX1nU8hjA9v47MbWO6HQSpd 1479780383
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBBEF7E2DF;
 Mon, 21 Nov 2016 21:06:21 -0500 (EST)
Message-ID: <1479780367.2503.13.camel@aj.id.au>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Christopher Bostic
 <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr
 <jk@ozlabs.org>,  xxpetri@de.ibm.com, zahrens@us.ibm.com
Date: Tue, 22 Nov 2016 12:36:07 +1030
In-Reply-To: <CACPK8XcmXQWrpxPK-=qhAxKFB++TgBPGWrLtiLJ1m4_y-fhcbw@mail.gmail.com>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
 <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
 <1479707274.5215.19.camel@aj.id.au>
 <CAA0LjjVH3BEtu7et_2VtpLXgbrHOfRTNvpQFL8c0Eh-kdDLH_Q@mail.gmail.com>
 <CACPK8XcmXQWrpxPK-=qhAxKFB++TgBPGWrLtiLJ1m4_y-fhcbw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jesYq9FnpTZnyKHIGUrj"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 22 Nov 2016 02:06:27 -0000


--=-jesYq9FnpTZnyKHIGUrj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 10:48 +1030, Joel Stanley wrote:
> On Tue, Nov 22, 2016 at 5:25 AM, Christopher Bostic
> > <christopher.lee.bostic@gmail.com> wrote:
> > > Have you been testing on a Palmetto using an OpenBMC build? If so the
> > > request should still fail as the patch is applied in the OpenBMC kern=
el
> > > build. All I'm proposing here is we move it from OpenBMC into the
> > > Aspeed kernel tree.
> >=20
> > Yes I have been testing on Palmetto using OpenBMC builds.=C2=A0=C2=A0Th=
e H6
> > pin reports as busy when I request it so for now I have a workaround
> > to bypass the gpio interface.=C2=A0

Ah, you should've piped up! We could have saved you the annoyance of
the work-around.

> > =C2=A0All the other pins I grab via the normal
> > dts gpio devm_gpio_get interfaces.=C2=A0=C2=A0=C2=A0Once the H6 hog can=
 be removed,
> > assuming no other code needs it,

No code explicitly needs the hogs, they're purely a kernel solution to
configure the GPIOs to boot the host.

> >  I can remove my workaround in
> > the OpenFSI code.
>=20
> I suggest you add a patch to your tree that removes the hog from the
> palmetto dts file. Now that we have a driver that owns the hardware
> the hog can be removed.

Yes, definitely. Chris: I can push a revised version of that patch into
gerrit if you're interested, though I don't think that we should apply
it until we have OpenFSI in the kernel and integrated into OpenBMC.

Andrew
--=-jesYq9FnpTZnyKHIGUrj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM6gPAAoJEJ0dnzgO5LT5/ToQAIa3ptW9Pmxbl8tLhfvDiyJx
nrZ2zD3NRnMw/JNcBVEzVMUFqe3iaFScW5ubD58YDnuWL4a0FtamLYtuaW6LfrhG
2OAQX6h/mzViwvmUfqoDhZhiyBNQVEhFfFHu1uz8lSHj5JbfAr+XGVXogZ8EQCSz
V2AaaiJn8J5i8jDXFz9/QFIcwAGH13KQmlY28W1EA+zwjtd5TMnHqG7yI3hjy2OI
bN3e9aOPNFGuDQEwOkKOdKqF9QFssaVT/EbIDR+PJnCKGhKc6ds3IPx6vi0PzQ1M
NOn+dQBGs2d/JtDMhC+HF34arwnwCikjM7+Mz2wFZnBs2UlSB9sNjpL15PPcs5Am
8Q3ca2OoD2b4VDddsvyuJ/wq0nFOHWXwYbJrQWBaqL0FZC8InGv2pR+pB3aOu+sX
43+uyv2RqppnY/qSOoUFCqvxievFo87Mjl/1mka94bqo4rMRXQDmWcuXoVSrvciH
lR3l/K/khGjQFPCZh8fU7gQtI3RKXWfNp7akkOJoQRSsFLO5x5fTdhmdT1AkyUAp
VMD3cFyvfeCTpsfahEoxi/JVzaaiWKvVy2lkCm3gyCwFmL6IhFJ90ONDFmhpOAba
IUcasuBs/vbW+4QHfjm6bO+7qxUqEcu0rka/DR8Bx644VlpwupO36U5dK1iY/aql
oQ7Rmzu1VI6uYbIFkcWe
=XSIr
-----END PGP SIGNATURE-----

--=-jesYq9FnpTZnyKHIGUrj--
