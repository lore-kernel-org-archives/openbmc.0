Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i8lHXT96"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JilVuVdN"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBfBV71hdzDr5T;
 Wed, 11 Oct 2017 14:10:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C5D0D20C6B;
 Tue, 10 Oct 2017 23:10:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 10 Oct 2017 23:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=FSccesq8NaQL0z6BrvB9tobSOvQo+gbw5Mvq22tK1
 YI=; b=i8lHXT96pU7K/Pi08YM6uOcgUtsRPEzW3b4IUH/NoCW9V8fCZzijaDsqb
 3iNUHPap1c+ZwmEBqugfBnQrWAlKqKoVKwQCK/o+7tCZDcvJhMh074Aplk6+mqvX
 PM/UUEt+06g5QBgec/A5lspa3I6TKWQ/TIp8qt93OdLUwN6Fm2dShlWpuUoOLH8l
 qJWvqRK/zUhzXD8/A/YX2BPXoDS7bSH8OkSFsOjHIWCRX4qGT5D8C35sGG6Gn6m4
 Nkh0IKIq1XvVRhECXcmcjhC2VAMuEoUQRMAvoN8X+g8faLyai7O+o6jkgbSJRJQU
 LTiqFL/11B+VW2pyHRYXdQ2cgp62w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=FSccesq8NaQL0z6Brv
 B9tobSOvQo+gbw5Mvq22tK1YI=; b=JilVuVdN5RCRtToMbhgLsxzK9FFQdSVEBq
 LdEmsAqE3NyeN0TW+Gd+uarStPThCU8JRHMAOihsjVO8WT3w8RcTV/bViI1OfmXM
 98GQt0rjzG9BtSTnOBUSjnUHondlWCETIeyBoieHg2R4t5eiANJm7mW203Wm6QIU
 NxeixXx1KwrcCU7HwIhX+iarKo7lWcJX5nia/sDYNlD8MSZoL3WqKqrazGNTJ2Mx
 Xzn/gEoCsXw83cvtJUwFtHQ5bL22vULXnV5l16Hc+8db6LZNo95hu6U1Oa4ywHKg
 npJKB3E+wLOvb2O/wA+fsW8661fj0R8AvMR4shgn8fImglhTAu3Q==
X-ME-Sender: <xms:wIvdWTx-re18NBvDyBpDA7dlhsBLdxFiD0e-Oi1oFnLgXECIcVrjOw>
X-Sasl-enc: vTfp/mY3HSXi+oVbfePDby3ok9ZQCNFoQ4LFZEiru6uX 1507691455
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C5D897E3DF;
 Tue, 10 Oct 2017 23:10:54 -0400 (EDT)
Message-ID: <1507691451.5452.170.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Chris Austen <austenc@us.ibm.com>
Cc: openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Wed, 11 Oct 2017 13:40:51 +1030
In-Reply-To: <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tOle2JG9nvfjDo5PiPsm"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 03:10:59 -0000


--=-tOle2JG9nvfjDo5PiPsm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-09 at 13:00 -0500, Andrew Geissler wrote:
> Brad, Patrick, and I were also tossing around a misc tools repo under
> the openbmc umbrella a few weeks back.

Interesting, glad to hear it's already got some attention.

>=20
> I definitely vote for one!=C2=A0=C2=A0I think the main concern was suppor=
t, it
> would def be a "use at your own risk" and "patches preferred over bug
> reports" type repo.

Yeah, absolutely. This is what I was looking for as well, as a means to
merge code as quickly as possible to minimise the fragmentation. This
means things will probably be broken, but maybe we can look at
hardening the process against breakage after we've got something in
place (and are sick of it breaking).

>=20
> I know George also has a collection of tools he uses for REST
> operations as well.

Right, these would be good to include.

>=20
> > With https://github.com/geissonator/openbmc-events, I was looking to
> build a bunch of small tools, that had similar command line interfaces
> to interact with the different REST api's in openbmc.

Consistency is good (especially with respect to the REST API) if it's
easy to achieve, but I think we shouldn't get too hung up about it in
general (i.e. for tools operating outside the REST context).

What if we git-subtree the existing repos into mine? I'm happy to
maintain it.

Thanks for your thoughts!

Andrew
--=-tOle2JG9nvfjDo5PiPsm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3Yu7AAoJEJ0dnzgO5LT5lXwP/A89EvoTzyzbbsEewCpFApA4
xozxtUwPItgzyii/WiqzBeoOp4sokEmHI9Q3Aoa84x0sF35cTr6A88MIk6PNQTjD
7kzOHzvMzEz2imNkdQkU5YDW6oQgeh66d3lTkiuXtKlJCfOZpH/XRkZsldrIrlMF
EYs+0lPyGksEHF51VzOw4eEktyc3H5/Mttv6VJnYP/AbR4JMcRO+/CnW6DK/8kYE
ZsPsCneRCvrkFjIw2D2cwESbjvDlGqPalaeJy6lr9cNupJ1V4KOrnytfWGJCEgra
XoT4XBhW14Dqry2EkzpLKxXmW9wYiccjaXy2+WYrNajH3YTZryrb7JuYfpl+v5Rb
+eO7G9Z3Jxw5/7u0Gh/YnbcDTkbJO0ard5sy2EK/R3sIhJ6psk70XBhfjosUFSlk
UHOo8tX3kRZtPD8C45JBa1cpCS3W3UP2Qp3oc5Okuq5KIK5trhMmI6fCx/eWF+zS
BQ5cVnyerEgTu3cISuTeYC6wwt1Go66beEBs9+PqawYuWBSPyE+W/AWJyxKvIe7d
eqtiRh9bJQ/69ugmXb94iGWNVD5xCGzgIqHRY+/feY3diaa7h2ZWVI/ZZ64WJ3m5
czX/ghwgJZ+PbLFenHElholNNHwDUNC5Ad44WDb3Txe/078FA0EjVCo4ZfhoFL8S
24hNzZwc58kRp8H6NbhD
=MIZs
-----END PGP SIGNATURE-----

--=-tOle2JG9nvfjDo5PiPsm--
