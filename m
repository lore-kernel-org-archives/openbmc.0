Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2LkP4PkVzDt2K
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 14:05:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ZyeghNA4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=iZnR8VRc; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D20A20846;
 Sun, 23 Oct 2016 23:05:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 23 Oct 2016 23:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-sasl-enc:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-type:mime-version; s=mesmtp; bh=nir40oc4j4M4
 CigpFhMuD+i5AYQ=; b=ZyeghNA47g6KnX/KhqxZbs51cGuaAE5qi0OQpzckru2q
 nqTu/zYwCvZuHPbyTEy2QJ3qAXHcSSXiL3lb9go4LSLMslGwzFZg4Ievo8lMXZnn
 xGC8cUgUbEZOo0x8BcYpZkFbrf3Md7af1MVtycyndVyeKnBMIo+bf71xFBcNwHI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-sasl-enc:message-id:subject:from:to:cc
 :date:in-reply-to:references:content-type:mime-version; s=
 smtpout; bh=nir40oc4j4M4CigpFhMuD+i5AYQ=; b=iZnR8VRcOvYt5OxzZ8Dk
 KlG5UXexJQR3SZxIajco0MlnQqYmj7Enu9DFLh2bT/MGC99ZkYCgdvYKnjh+IBWR
 HQVFKUUf0Qe3KvEF27BECU4XCuaIO2pV+3obrRWtWFULPibeXPPSueBgClvfkiEl
 WdqSLDVsdOfaMD5z4pPu3mA=
X-Sasl-enc: NrQ85h+1DJzoZbpaQNPYwEzmph8hmoZ+/rZhtMZz1Z68 1477278314
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66B71F29D0;
 Sun, 23 Oct 2016 23:05:13 -0400 (EDT)
Message-ID: <1477278307.6373.52.camel@aj.id.au>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org
Cc: brendanhiggins@google.com, Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Oct 2016 13:35:07 +1030
In-Reply-To: <1477097158-139095-1-git-send-email-kunyi@google.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-w13wisnV4IGrjMbRZhvc"
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
X-List-Received-Date: Mon, 24 Oct 2016 03:05:18 -0000


--=-w13wisnV4IGrjMbRZhvc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kun,

On Fri, 2016-10-21 at 17:45 -0700, Kun Yi wrote:
> Hello,
>=20
> I'm looking for feedback on a simple Aspeed SPI1 mode control driver that=
 does two things mainly:
> 1. Expose a sysfs interface for userland control of SPI1 interface.
> 2. Optionally override the SPI1 mode at probe if "start_mode" is configur=
ed in=C2=A0
> =C2=A0=C2=A0=C2=A0device tree.
>=20
> Aspeed 24XX/25XX support three interface modes for their SPI1 interface,
> which can be configured via HW strap register. In the typical case of con=
necting
> a host flash chip SPI1 interface:
> - SPI master mode makes BMC the master to the host SPI flash
> - SPI pass-through mode make whichever external SPI interface connected t=
o SYSSPI=C2=A0
> =C2=A0 be the master
> - There are also "disable" and "debug" modes. Aspeed 25XX specified the d=
ebug
> =C2=A0 mode is reserved though.
>=20
> In particular, SPI pass-through mode would enable an external SPI master =
to
> directly program host SPI chip and possibly serve as an alternative way t=
o LPC
> for host CPU accessing SPI flash. I think by providing a sysfs handle, us=
erspace
> applications can have a flexible way to mux host SPI flash ownership betw=
een=C2=A0
> BMC/external on the fly.
>=20
> Overriding the SPI mode at probe time can be useful to make sure 2500-smc=
 flash
> controller always identifies the flash chip and create /dev/mtd files cor=
rectly.
>=20
> I wrote the driver as a standalone misc driver for the ease of initial im=
plementation.
> There are other options such as merging the functionality into the SMC dr=
iver
> itself, possibly enabled by optional device tree arguments/nodes, but I j=
ust want to
> send the patches out first to gather comments on perceived usefulness of
> the feature and how you think the driver should be constructed.

At least one issue I have with the implementation is that the strap
register is currently "owned" by the pinctrl driver, but the patch as
it stands has no interaction with this subsystem. Arguably the pinctrl
driver is where this should be implemented, as it encapsulates pinmux
whose aim is to manage the functionality made available on the SoC's
pins.

Currently the pinctrl driver treats the strapping register as read-
only. That should probably change in light of what you're trying to do
here, though only to the extent of allowing the SPI mode switch.

Cheers,

Andrew
--=-w13wisnV4IGrjMbRZhvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYDXpjAAoJEJ0dnzgO5LT5/RsQAIAKDv1O4asmBNhIHsUBbg2F
Yu5SFHvRuqZREpHiMH3wj8UBeZExOS+48Ye9ye6ctf0UhNytBy43AJVr8kS4Ei9j
lR8HF2RF6XfnT4CluCAJWU9kRVGlBnIvv2izHrsdxPAy5c+WxYgZMsd02cGnng8H
qiUO9ZaWrQDzQGQz72Vj9kujJzeaVLCoIdEYTK/3ohfrEOWdhyFo65Vnexe5HtP5
aCy9g74+rp9h8Mal+F97PF4tBrFSbmdtHPpZYctiUstwetrXTx35KEFG9/22TX1H
g9EwZEY5dY3slRPWk/+VMReJgDiWR9CWy7FVDgKAIiqT01dH52ei/PVTll9emZ5Y
zOB/uN7TF+QktY7S2SqE/3dpacntqJrLWrJ7rXf7mwJ8KGFyzSnFxWXf5+XsoSLo
kPafx/TJV5WWcXMg4wiF/2b4pRm8k9U9a/YISMNc58RL8mvwaIX/alJZvFP+Ve0L
fUYTaT5oNpjOM1hyzXKVvw7AyFWK2WRhSV9k5Ga9eDLqozrmEpREboiXyDiJIf+p
7cIffeX/RfsshtP+EDxK51i1hZI5FAEK8kYs+bGheUzHxs946JT1v1L6UqBslams
BCH6EX5viWMAwT14u+WVVeA6FXkYP33S6ArqrccZ78hw05PhnC11qm0WeX7m1yyE
EUHBVEwbNf3E/4auyNJH
=WipJ
-----END PGP SIGNATURE-----

--=-w13wisnV4IGrjMbRZhvc--
