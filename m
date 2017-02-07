Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHRsY6vDPzDqBN
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 12:42:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dHrJkYCO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tH21r0NK"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 433F5209B1;
 Mon,  6 Feb 2017 20:42:06 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 06 Feb 2017 20:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=LnyyqSz2QuyQTUJNtv8ZTAuYNWk=; b=dHrJkY
 COAT4p+33/o8PmA1VqEbpaBBk2QsJ5ItxTkhJgHVTrESYtJRwTU/5n4hB2uVCRbS
 E6WVje+iIT5NCKhDFcUy91ASUwHvfjB+BqRjWS+3AjqQdbZm8gvvFW3mX2ge1g1r
 up9+rBSz4skPuCbdQzXVDUkkGEHSFU1xTOmE8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=LnyyqSz2QuyQTU
 JNtv8ZTAuYNWk=; b=tH21r0NKiJOT2lrjar+SyZKC1zyjt0McOpOS8ij+qNOpOc
 oQqvmslJCPPT6Lp4iwlyv6YRQCm1/nLUhhaAWVa5J4i8RrMXgQg1o1NifLTHceeU
 O2ZGzMswjY8nLRZS8QcdR1XqsIsjQ54k95lrBKYXnaMNhsFDEF2d1I9S9Ve84=
X-ME-Sender: <xms:7iWZWMxgIureF5i6lucqYpt19kG8KiiDUH-tbygjyqC1a5nHSOfRAA>
X-Sasl-enc: 9AD0Clg4J0zfvPCkTQn+Ih+vxJgQBsr9qhvgf+iQ2m2W 1486431725
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 781647E187;
 Mon,  6 Feb 2017 20:42:04 -0500 (EST)
Message-ID: <1486431717.7271.19.camel@aj.id.au>
Subject: Re: GPIO offsets used by userspace
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 07 Feb 2017 12:11:57 +1030
In-Reply-To: <1485740080.4137.21.camel@aj.id.au>
References: <1485740080.4137.21.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-dqQr6HWllT/0Ttyi10nR"
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
X-List-Received-Date: Tue, 07 Feb 2017 01:42:11 -0000


--=-dqQr6HWllT/0Ttyi10nR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-01-30 at 12:04 +1030, Andrew Jeffery wrote:
> Hi all,
>=20
> Just a heads up that when the linked patch is pulled into the OpenBMC
> kernel it will break our userspace. We will need to synchronise the
> kernel bump with the fixes for the machine configs to update the magic
> GPIO offset number.
>=20
> https://lkml.org/lkml/2017/1/26/786
>=20
> The magic offset is essentially 512-(ngpios) (I don't know why, but
> that's the behaviour), and this now varies between AST2400 and AST2500
> systems due to the AST2500 having an extra bank, and also because the
> AST2400 has a "hole" at the end of its GPIO number space.
>=20

For those interested I've pushed a patch to skeleton that generalises
assignment of the GPIO_BASE value (i.e. it now dynamically detects the
chip base and so is also backwards compatible):

https://gerrit.openbmc-project.xyz/#/c/2261/

If you have any better ideas for an interim solution please speak up.

The rough plan is to apply that and then pull in the new kernel. Joel
has a testing commit here:

https://gerrit.openbmc-project.xyz/#/c/2257/

Andrew
--=-dqQr6HWllT/0Ttyi10nR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYmSXmAAoJEJ0dnzgO5LT5pjEP/1Yh8XHcDWGbUxkXvOabAgla
ItSl/PZXGhCV5KVs6o2SmR4SuIRtlTuxFC8jMr4zMGIiD0BUdzk28tvLuNso7NOk
iB8dpYfPTMBIi2ppd9+acSkMT1Ncx6f0CfBzBeaTK+oJilmJ0yN+KlUj3CKyPyLa
4xUE5T8QHuKYkQA96sBla7hlzVwhfvI8on191E9PoppmYDwTMMQsYOH+xSbaRiT3
CEr5WSFJw8tBrHX+m8/lcr7B/33osPLojcCmG2XRv6A7TIejbIRO0V9NbyUrrCoU
Zm8N8El6GL6w5jCJZuTLE36ThMuMul0qAIWzQd5GLiuacYumYiib0R2/CJo2R9HI
c2CSwqpDRt1i5GlegCQWTG8aak2klsSSlZndWyjrMnQOIBQp23HRJzSYRfF8/HMS
kdCtGYiATrKwh5UoBiEanADR2T4LBxgr7znUchfFPMozcZqZXABF1n6uZVQNxR+c
dyzWOXSJGnFCTlwoOLNel2GX49AnahmvEB7PRvps0mpS0RWIsZUi+VRwAQQB+k9v
ZG2NASF8StN/yqHgallP3jtjSQvsHB9v6O3ajbwo7KYShmuLl/eFxwk1MQATC8Xh
E0jM5TZHhnOrZL62QmFBI0K1KXhdrYe4KtXyt6VWwWvMc3+3eYlNPxXkTaAXY6eY
fj1AyzKxpWkppS0NbfSX
=82s+
-----END PGP SIGNATURE-----

--=-dqQr6HWllT/0Ttyi10nR--
