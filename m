Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i3vB7wOd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gT5KlkVl"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZVbq1C6FzDqZh
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 12:38:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 34AA220B53;
 Sun,  4 Feb 2018 20:38:25 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 04 Feb 2018 20:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KWWsm/d07MyEb3kioKk32oOdFn0b4/j5rPBPAiQmyY8=; b=i3vB7wOd
 tulsgOx27Rob5/Iip+jlY5V1hV70ZdbiIqwkLioaqsM2oD1FwL/LajN8IJUzFMwd
 Jebfqxy/EQ2GK6njSF3XzK+6K/VwCSGO2xtgkSLJqnQ17m/iEVykj0+3+zuXZFuE
 sB/dMQDIR/9x3US2M9kTk/3sar698tTtzZZDsTqSmH5Dey4LDUwd8pzWU716gduK
 zarmV2XPZxV43FuLGv4d7XzMPsAzT7jH3MXFyBESdiwglznogFHDNmCnfL9e4X4L
 mJCNlgOBKOaUskKIcXlKjPKKgtk8VhfR4+fdiEHrkDU0lXN8hvOTcJ26t4XZZNYB
 yEt0+AiGDI/xFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=KWWsm/d07MyEb3kioKk32oOdFn0b4
 /j5rPBPAiQmyY8=; b=gT5KlkVl74Z7b10K7pzrAqvpry7/CN1tzBTmEe3/n1rvA
 nHG6wIYA9jqV9M35bVcMDLIEQsiO9x2M3+psN1zcj/6G9qiORubP/mkPUDx+KL4z
 4F4fj5UX/CssFTCx5AsbqnEVtcp9I68IUJeO5Asb2lRQt3yNgtmFGtuyxtwo6PEP
 e5ijR0PhFFaVMPZk41cnYTv6FshRzl89QLdLiYnhYUbvh8opEALgUS72l7viToXA
 lwKC9mVF2f1DspgsuWxQrY7ELjbQNNKG37bfJfJmJE+BuU1Tei/Xm38t4tyC+Elq
 g7rc4WKXNAeSDi+jjT+OHDMZzzU1HOxFBjA8ye9dw==
X-ME-Sender: <xms:kbV3WioqPU2POALYXzEAXa7BLx_-SAvjG-ctbDzd9s9hUUCKZImsXw>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFD9424636;
 Sun,  4 Feb 2018 20:38:23 -0500 (EST)
Message-ID: <1517794697.21006.38.camel@aj.id.au>
Subject: Re: BMC redundancy
From: Andrew Jeffery <andrew@aj.id.au>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 05 Feb 2018 12:08:17 +1030
In-Reply-To: <20180202211043.GD113334@mauery>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <20180202211043.GD113334@mauery>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eAD14Q5mwGXMgSCLbUvY"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 01:38:33 -0000


--=-eAD14Q5mwGXMgSCLbUvY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-02 at 13:10 -0800, Vernon Mauery wrote:
> On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
> > Hi Deepak,
> >=20
> > > So several of the existing OpenBMC apps implement specific D-Bus
> > > services. What does it take to make remote D-Bus calls to such apps?
> > > - It doesn't look like the D-Bus spec or libdbus officially has anyth=
ing
> > > for D-Bus across computers. There are some good notes at
> > > https://www.freedesktop.org/wiki/Software/DBusRemote/.
> >=20
> > Applications can cannect to remote dbus servers; the --address
> > option to dbus-daemon allows it to listen on a TCP socket and
> > setting DBUS_SESSION_BUS_ADDRESS will point applications in the
> > right direction. So there are probably two ways we could do this:
>=20
> Putting DBus on an externally-available TCP socket is a security=20
> architect's nightmare. All command and control of the entire BMC is done=
=20
> over DBus; we cannot put that on an externally-available address.

I think what you're actually suggesting is that whatever interface is
exposed, it needs authentication/authorisation or for the system design
 to ensure that no unexpected actors can connect.

It's true that the TCP socket option doesn't provide autentication, so
yeah, the suggestion isn't secure, but the suggestion was mainly to
counter the claim that "It doesn't look like the D-Bus spec or libdbus
officially has anything for D-Bus across computers". Support for this
is built into the spec:

https://dbus.freedesktop.org/doc/dbus-specification.html#transports-tcp-soc=
kets

There are other ways to provide authentication and transport security,
so I don't think we have a huge design concern on our hands.

Cheers,

Andrew
--=-eAD14Q5mwGXMgSCLbUvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJad7WJAAoJEJ0dnzgO5LT5c2UP/jnZ2L0BQJJDS0g526lCJxAd
HDNqVLk2xKYIeEokO8IKvckq9GL5eivS3GYasitqGjybBxkj3BbiigNZ3CzuUOYR
7v5TVFB42xmnmQWoQ21CUHsYhSNOEc0ISY/3giE6GrP1BQpLApuPaWOUalZ3dD2V
IbfNsGg27mtGlKVN24Srxgmcl93mzZQWhK57c5c5UCUhGiA+rcE/2kqSIB6XSfnf
GBZvMD//hlj9LXgL7kWyT6xL8L+zSpC3Ac0fPYscaskSALilIvprexgoM0n5z0AV
u2myu0EZp9NZ55y+s9LOPUdXWiYg3sG2qYeH7hTb/DQJhS9qSYqHFKOANingIepy
YSucyFpN3BGQSWe9jePbwxdiJGRP/8bRc5QfK8yomeX+bGj4VjhGrUq1hS4QnVZI
mnXT6GBJHDB8Bup1zbE+FrXVZ4V9EZWZYFK7ZMxtQL1ysby7grG5vi9VMi2i6L8I
hEdadpe9Ncg2EEQuC76oMys8Z8uYmXmOZ0nrvQW2DkLEnNJDIdoYuIUK4vgxKF7f
KJKMkn+df9SkDRPN53bG8qRSrZb66xENfzz0seyccBRTG/7U0jr3kfUzi7l6sKsv
LPoOE/3C81WUQEnybQBQKDagbKdVzH15/Nh+PdrS4+5SQHiEooCgeOmC4U9QbHpg
5AN1v8jFBrz3h9CFTQsX
=YdE2
-----END PGP SIGNATURE-----

--=-eAD14Q5mwGXMgSCLbUvY--
