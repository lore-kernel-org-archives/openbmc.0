Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n7Ofwo1u"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KwTzT68Q"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Z8R31NJzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:58:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EEE820A72;
 Thu,  5 Oct 2017 22:58:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/tG4Z9xZgkRE+5DbvDJ8pdCOtzJIa6sm/PTJvYELu
 0c=; b=n7Ofwo1u+X3uK1fL0ZOWqCaaD0jARe+LMLYr4MDmR5sH45Hzx7n//UpjL
 R9U+Lm0lcVuUBbvl2rnBC2djf39YVwrtpDqf1Qkq8bVW89kY9QcljjBW56h4fb5D
 EEX1QhcNcOUO7QSnjw8D1LGzX7auQ0PU6jeWc72iOI8Li0d+qLty80vd9a2oUj8a
 gD2G2TxExhDOhv2IXeuuTVNufcSbuFpnPlfsdLzG+NBl5B3MMzAX1JNM39M73Ot8
 zSLfTvxzW+D2FQFBM/Wu9dcyWU0FH/sEYmfNTFwddkkw037M+5nigwK/ZB/WLRW4
 w+qzjf8pTTGcOOw60fhknyhA2u4qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/tG4Z9xZgkRE+5DbvD
 J8pdCOtzJIa6sm/PTJvYELu0c=; b=KwTzT68QJEF11Xq13oz+/mc8dcvMdOBQYb
 F063SB+1n/OJlrgxNgLg9FRAY1KUVF8/cLpu+v0bZhKaL1JpRoO4CU2rcAPfo0Af
 HuZU0AllGTgdJFnDRXQBsE5jBeVdpOYl6Z80V17O9i3v4VvlAwqWbYDSiNobkWE0
 fFd1B27V5invycp3WFZtoFSsiSja17m7KH5t8AKz1GQlsYDnNchQeIcnT/WwQw0P
 tPmnT3g8l2MnKchWQWUfib9TW/j3cmSsP8lFOn9/F5cD2i9XC+H5td4JUIyzTbgU
 hAUHbCZAn+zBfW5qZA7lotYXn9L4Q+loLDwIx/M7BBRu5keUcE1Q==
X-ME-Sender: <xms:VPHWWaM-h5Z_ArUdq5XT-re6SPuYwjRr14NN8USEcutRxxJYqe4erg>
X-Sasl-enc: jpSRTzlajfVwfQ/aGqeW4E+JnIqRjmKGw5I92RrvU1lG 1507258707
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CB387F97C;
 Thu,  5 Oct 2017 22:58:26 -0400 (EDT)
Message-ID: <1507258701.5452.140.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Fri, 06 Oct 2017 13:28:21 +1030
In-Reply-To: <OF05A3099D.D8B3AB82-ON862581B1.000FC8B5-862581B1.000FD016@notes.na.collabserv.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OF05A3099D.D8B3AB82-ON862581B1.000FC8B5-862581B1.000FD016@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qNaIAfiHjxAm5efdDpkl"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:58:33 -0000


--=-qNaIAfiHjxAm5efdDpkl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:52 -0500, Chris Austen wrote:
> Mine too... https://github.com/causten/openbmc-tutorials
>=20

That's some handy content! Probably not quite what I'd expect for a
random utils repository, but we should work out what to do with this as
well. Certainly could feature on a website when we get one...
--=-qNaIAfiHjxAm5efdDpkl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1vFNAAoJEJ0dnzgO5LT58WwP/31MZkDD+Lbnv8+FGWhHJvWL
pjv6chib1BD5jCoy7pYl10ep5aOSzA7uQmnGqDjFG1LWZIkuINinx1Lvw+/uMrSH
l8bZURNcYSn0aalxhHdCW5zTPQi8Bo1cxJP58MUK0Kz6QXAmznsBlArQ+AzVNPqu
3aKQpQ7uhMUOUIZRwaOVBi6UWMOnTVaUV0qHlR6nObASXEWmkG/XQLZcZnMJ2erS
ccWpQrp9aXzrw7zofJFYO0Vd7jWIPMg8Ka79Gc3X9Pf3ZzmLytfgfPDrTmvfVrTG
jMMcUXje34JXk+pZjW1hrBAg6gCgT+PQYbwu/8U0CRJeUVDhdHh1/kl4H363U7vI
eUwUcAP+FuXh3u/EPNY7LpAXatG25bMIGjwNtBo56EA/n3oBCncZXzkfdTGkouDu
CiwPGJP09AmzFjzAmH5vrUd28jZcEJNeHJdgkVvxVNSYHMWxOBzVnfSW0g2N5uyl
pZntEI1FQ5ftYf5mPkxSGy2IBCic6u8O8YzrvL+ZAPfI8qxhHcjVzP2KnXZ6wicJ
W5YqCGoI9NGQZq8KkPK1JWlMsNVELN49kA3myUU4CKTY2ibrGQqwowbufaLF4fHw
aaf2hTqLZC+HCUVRoQLYEpfkeMx5w5pDRERIlS1759dAkf3XGR3QoNaSytdE0/p/
IownpCvl1qMZq21IGUVq
=i15s
-----END PGP SIGNATURE-----

--=-qNaIAfiHjxAm5efdDpkl--
