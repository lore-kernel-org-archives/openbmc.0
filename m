Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2HJF2Y4BzDvXP
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 11:30:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gLNtfEe0; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Jp6smWue; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5850920843;
 Sun, 23 Oct 2016 20:30:51 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Sun, 23 Oct 2016 20:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ejtBF
 MNUfG87MLSLzgzLj4n2zUs=; b=gLNtfEe0c3q2q4f06o1VpASzuG8SXVt12FWQO
 hupqXsc6XRi7ICeKgKZ3KpP7AD4Bd3A+1ws44IDkmkYWgptm+cij8quIpVHxouox
 0D3WT54PjmKRV/R98+ojGRMsh4pdU+XM10yDB1Z7WkhYcUJntgEtvFPYWeadr/q7
 qZCTgs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=ejtBFMNUfG87MLSLzgzLj4n2zUs=; b=Jp6sm
 WueIUjM7zHCjv0GSdPK/cfDYss9AMXaLNOqoIftTpclFt6cWNzzZzi0fAfvSD1x8
 gNgzjfzr7EIietXnKiAcE8hGIPvCDuQOHO/hZwdkNjr+7jJXt485Er5RgfEmXAIx
 iVciPrPufFU9UpRa8wLcJ3q495xUDrpGpZcFtY=
X-Sasl-enc: NQkNN82MW5GWMPQ/gNLkRgoArJUME2TwyvCg4diV7LU7 1477269050
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 874F0F29CB;
 Sun, 23 Oct 2016 20:30:46 -0400 (EDT)
Message-ID: <1477269041.6373.41.camel@aj.id.au>
Subject: Re: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org
Date: Mon, 24 Oct 2016 11:00:41 +1030
In-Reply-To: <CACRpkdYZPcjGuRKVL6qwof1p7ZXT4EvwzAuz59oTgp9Z5Dzixw@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
 <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
 <1477010011.8917.20.camel@aj.id.au>
 <CACRpkdYZPcjGuRKVL6qwof1p7ZXT4EvwzAuz59oTgp9Z5Dzixw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-t1RqGp4nYOPvSh0eD+WI"
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
X-List-Received-Date: Mon, 24 Oct 2016 00:30:53 -0000


--=-t1RqGp4nYOPvSh0eD+WI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-24 at 00:09 +0200, Linus Walleij wrote:
> On Fri, Oct 21, 2016 at 2:33 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > >=20
> > > Patch applied for v4.10.
> > > (Tell me if I'm applying patches in wrong order or something, and
> > > I hope this doesn't clash with the fixes.)
> > Both this patch and 8/8 functionally depend on 5/8. I fetched the
> > pinctrl tree to poke around but this patch didn't appear in any of the
> > updated branches, so I'm not sure whether we have the right ordering.
> > Without it we should hit build failures from missing macro definitions.
> >=20
> > Have you had a chance to look over patch 5/8? Joel wasn't keen on its
> > current form, so I would appreciate your input.
> Oops backed this patch out.
>=20
> Will look at 5/8.
>=20
> Appreciate if you repost the remaining patches in the series based on
> v4.9-rc2 once it's out, and I'll rebase the pinctrl tree onto that.
>=20

Will do!

Andrew
--=-t1RqGp4nYOPvSh0eD+WI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYDVYyAAoJEJ0dnzgO5LT59k4P/3NGHk9ZZhq7eNziiG3ruKdm
eeYbv+jXfX+RBYdv4Gtw4Z23eCEMgIXnuf0SwZeejDkF+uFwUXMYb295/3dEAtp+
Qea0RZt0jCGhJms/kgHzOh7mtBJrcA0MirZYXBlURE8elOCnFpcOuyJ1WctJjoxw
3+ChmKGLVFpBSTEto3P4Ux5VffVVYcv1J2A/PBPWNfNQX4SjhmJPS61PxHgInTAp
VmRgLJQnqVxZY6dN2P8FQBLRvLWwpTTdWfPdokp61mWd8J14xmY33pqzMz41mB27
LCtR4IKyA4kr2kZ772Xb5N23T0sVRsmX3IGIT051HUTn5l1yQdfA6NZCXByDMYhf
+uD1X6CfnJ2Tm5vqYK2Rmfs+D3ipGFpjuEPpyfW4wrgoTbrW9GyknXu7Rx4xFRPD
RckU4EN0u82q4Fqua5rjqDZ7EMq+iZBw9yWbcnnCwP5+061IrZwKi7VqvjoijFno
wRDs/NoZxtghTg5dEzOn8oNvnCyNIyw6cOTn+AJqEmblnI/qsL/rpNDKoT2y5k7e
lagWgHH3L/qt3cvjSmicDeyepCaHCICyEZZ5lSh02n1e28ir6fACbQQbrEGTpX8t
U2TbHls/YDVv+Xknv9IOOX1t4KGh+0xNec5rgF4Grq2LJiAab1qmy35Vw4DGR62P
gtAc25Oopt1QJ87U+cOI
=Bf72
-----END PGP SIGNATURE-----

--=-t1RqGp4nYOPvSh0eD+WI--
