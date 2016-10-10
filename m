Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stGWT4SVNzDskb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 10:27:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=XMvNb1sd; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=imwMUMHd; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E8FD12084F;
 Mon, 10 Oct 2016 19:27:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 10 Oct 2016 19:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=IVY9Z
 ESmopHUMF7UBZSzC4msVXQ=; b=XMvNb1sd88BYwqCvqivWNgaGDR6t/0nV1H6KX
 McV6s3HQhsMO5j1AdDvyl7lFE9PESyULb1XHjUIoTHKXznmfbNMQ+9m+9OAuEeRd
 MEYBsNo38dToaWe4p3bCLVAX1JtHzwEIO+TIyWp5NtJS7gpZEQoGjRjvdLVyMG/+
 DLwoLE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=IVY9ZESmopHUMF7UBZSzC4msVXQ=; b=imwMU
 MHdVmuSCe9ljDewqSlL54cJdjquS7gPe8kUq3EGMxTFg+lHq2esf2VQNEqFugePV
 CZniC09Z/VoHQiOWxO4bagVLDHU2OQdikAFwmfpMV6D6EXFEPAx7JS76ey+LkqxQ
 HD3FtYprC+8NgrJ5buDvAwIIAX6u1lleP4Wb7I=
X-Sasl-enc: KBxqCbyqjRR1qVwdbMNsgViWE/ogIhvq2Uc2rfbaY2ME 1476142061
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BCF8CC087;
 Mon, 10 Oct 2016 19:27:38 -0400 (EDT)
Message-ID: <1476142055.16733.4.camel@aj.id.au>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Fixes for core and g5, implement
 remaining pins
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org
Date: Tue, 11 Oct 2016 09:57:35 +1030
In-Reply-To: <CACRpkdZWbx1_SYJMOn40teQaEw1JAq80kDAp7N+OYaMRRO6NBg@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <CACRpkdZWbx1_SYJMOn40teQaEw1JAq80kDAp7N+OYaMRRO6NBg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hVK1QdoxUWFNXarmauyO"
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
X-List-Received-Date: Mon, 10 Oct 2016 23:27:51 -0000


--=-hVK1QdoxUWFNXarmauyO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-10 at 09:59 +0200, Linus Walleij wrote:
> On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > The initial Aspeed pinctrl patches implemented a subset of pins for eac=
h of the
> > g4 and g5 SoCs. This series provides a number of fixes to the initial p=
atches,
> > mostly for issues identified in the g5 driver. The fixes account for th=
e first
> > half of the series (up to and including "pinctrl: aspeed-g5: Fix pin
> > association of SPI1 function") and should be applied for 4.9.
> Those are applied for fixes.

Thanks!

>=20
> >=20
> > The second half, from "pinctrl: aspeed: Enable capture of off-SCU pinmu=
x
> > state", implements some additional functionality in the core engine for=
 the
> > Aspeed SoCs and follows up with patches implementing mux configuration =
tables
> > for all remaining pins. Given the significant additions in the last few
> > patches, their lateness in the cycle and the light testing they have re=
ceived
> > they are best left for 4.10, but I'm keen to get them out for review.
> I'm holding these back until v4.9-rc1 is out.

No worries; they need some discussion when you have the time.

Cheers,

Andrew
--=-hVK1QdoxUWFNXarmauyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/CPnAAoJEJ0dnzgO5LT5TsgP/jg5DRyy/3c4awC9o87ZxF4W
pjTa7TZaLrC9K6Y0yKUVkRb4VQST0ho7+XWa1sUU5BqRkYNxaU3+dgfKTLRq7rhl
CFxu/zUAWNxMhWZ6gbeJAkEmUGrvhrV0lVhKg/Ect4uYF8rIVtvDpfM7xrpQF9mM
Ty9PxvtybzI2DqtClNgcCOZYtFNe257zPzFkoYoq4fzPA4f/44SwusWbrAztHISp
CC/diW7YgNo8/8Y/6AniTy86mcSiGdZ5YWC6qGAjEGVi2SqCHZ5ZSEk8yYu6dGX7
i4FpUK7R7fUej2li1Z6qvatR/Id85DsjoTz705ywUHbxkILNfY3mALtMf4exWHug
NXS+TJKy4Gqv4C6kQ429m2ZhrZ0hGheHkQnXh9EBM9+0Cqg40ROdlQkawowSu3yU
DdlgX2HELuO3PtP50r83U+ya+v892KVj2M1wQh1+VwYTPm8fi9rA+OKgPLkAYdpk
v+QuKI/65SaxJpr7BEQeIDdI18CcTTwLBIWnPa4ZN34OX/Z2ErQGXpIX0wDcCTCV
s1dlCe7TPU3UMi7ZElQD+gYNuQ5y2Ac8R67vEY93inhlR6gwdyvA6PsAvolsnf7k
ZfXPjUQdcY6VRujxX1gZTZzkeGW7sQiwiCRT5OITD1Nq6vt/n5kuJ4jtWa597vJd
wZiR4q2ucEOj8XdzvtDb
=Yx7F
-----END PGP SIGNATURE-----

--=-hVK1QdoxUWFNXarmauyO--
