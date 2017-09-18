Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RumF5BaO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MGRuxMTk"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwcWy6l1BzDrJH
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 17:07:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55A9720987;
 Mon, 18 Sep 2017 03:07:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 03:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hx8Ye89RCl/nn9Sg6Bov27XTe9f9jLqfj8E76Bv+h
 X4=; b=RumF5BaOfudFKDFoEj+pIlliGkd9HxRDnSBsk9DjuQevhdMfkZvls0puR
 7OFVrV0F9HDLGUOHoyansaH15GOeoGt4kckSWGJRnXgQaf+ZpCGM0mjMmnwQKgQg
 E7kCY625KQrMkKvTqs0mW5g1Oa90ryw0XUTcB3BoYcrpqPXT3PnybED5zJSV1Joq
 UdbamSpLSfPnOhBE7FU4N9PWuQGJvrLlUg8US8XWGX8VKO7RAqWZ9RB7qbPwiWeb
 hF9buZq8EO1B0+LK1zG11rPoUp+tjplDvbyYstH506yM4HeAFKuD1UhkJdaeyz/I
 2mGopEjU33SNVmcVcimRnVqVBQthw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hx8Ye89RCl/nn9Sg6B
 ov27XTe9f9jLqfj8E76Bv+hX4=; b=MGRuxMTk1NAjbkyquKsmLBVnZg4ZTzx9Cy
 dYvJxiKGde6grtG08/CkDCCm25aLul0IOiKwl1+o0C81xMyPS31gTjdrZKZ2GX6v
 VNzSKWYUT2OtkOqbhetoVsCAoBlon/cigmb2akWWwqRb/5ZCdyzJiqWW7KIzywgp
 /OmlODTqSDZilDvKYQpvMYLAHSe4ciXvoJpLnwtHrNjDQEtMes69OdBWUkK46Zvt
 wEFX7Fgx7qcokOmrPxExu7MLDKXr8Z7VX4LDoY7QWFW25hg+sysdpJUdV+KemtNX
 c1U7sVPET8rCEIpDyZuLdVV9Wk2teSbH0m5QEwWcFkGY9kjbdrdA==
X-ME-Sender: <xms:q3C_WcAnYnIDOpJryl_T3JO3J5iNLvrdP2yqHY-F3dIGcyYOOtokOw>
X-Sasl-enc: KwW6QuLxogIqulXyGX4REYfjBCSQFjMzEa9tbXfbL4gp 1505718442
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id B03AA2471C;
 Mon, 18 Sep 2017 03:07:21 -0400 (EDT)
Message-ID: <1505718435.4080.18.camel@aj.id.au>
Subject: Re: GPIO Centralized Control Daemon
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 18 Sep 2017 16:37:15 +0930
In-Reply-To: <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-75lDEfjrnAJO1z8J4hpo"
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
X-List-Received-Date: Mon, 18 Sep 2017 07:07:28 -0000


--=-75lDEfjrnAJO1z8J4hpo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-09-16 at 21:22 -0700, Patrick Venture wrote:
> > > From a high level, the daemon will implement interfaces to export
> > or
> > > unexport GPIOs.=C2=A0 Each GPIO exported will exist on the dbus:
> > >
> > > /xyz/openbmc_project/gpio/53 and implement an interface with the
> > > following properties:
> > > value, direction, active_low, etc.
> >=20
> > Just thinking out loud...are we sure a gpio is a useful
> > abstraction?
> > If applications all just use the chardev API what is the benefit of
> > having a dbus object, at the cost of API complexity.
>=20
> As an alternative, perhaps a library would suffice.=C2=A0 My goal is to
> avoid multiple in-application implementations.=C2=A0 However, I felt it
> might be helpful to have some centralized daemon serving this
> information -- a simple dbus property access may be simpler than
> either implementing the ioctl in each application.=C2=A0 However, a
> library may also provide the necessary abstraction.
> =C2=A0

If we do need a library, there's this:

    https://github.com/brgl/libgpiod

We should try to make use of that before doing something ourselves.

Cheers,

Andrew
--=-75lDEfjrnAJO1z8J4hpo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZv3CjAAoJEJ0dnzgO5LT51WMQAIDRhOG5+d3c+JVZFk4c98n1
mgBxC379a3x4x+I7VbcB7z6bmET0V7Jt03f45n5c6zBQTx26QRXsep1n8TXuK7Vp
w0FNu4g1b5tEB0lIsFp1roxag2H5kFpdNj/VtjrHg0oPjcd/wHOH9N5VUga8jswo
O4AUEI6CMfDi1+pFtszi9J9MW7UPca/Td+q/zFpf0bs30WkPGx8u3ltiWQnea+s/
Q6mTLnVvgPio3sObCcfqNsHpDUAd3w2equ0fX95TRV4SFiw94pPI+f3TkWatnEX7
gyVp8DHCBbZbgkWWY3k3nrv60hHnuNi3zeQh7n4ir3LFpRx47HiLQAZ3zPvqkIyX
BJ/ULKAus6IqiJYP/uUkvnpYehlyE5js5GPRl31V9/lrdZuObjpqHEG6naODSc3o
UNcleHR4hb13T20yfNBrh02swTtYalidKli0e9h8cx40McmcsQonM2lqg0Y4CaGw
a9f59zg3xGtojowtRwbFxM0aQnRqL97xRswR8gcLnv2LnAcAuanbdRgIMJ7giCsS
KJs7AtcnEE/fJypuBABhrbg4aPn4QOS642Kh34wTvKPMhxXfwFIBkL5H9E1If6GI
+JUkeNsndX8U2KAQkTgJIaYFmxKsVSb3M807suJlX9uwJahy3pqkTopSlwcD1+XB
52+H86YrWq/ZR0lL0awg
=yoYI
-----END PGP SIGNATURE-----

--=-75lDEfjrnAJO1z8J4hpo--
