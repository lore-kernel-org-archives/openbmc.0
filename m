Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZx6R6GcyzDsZJ
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 10:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=DE+WaNlo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=GZM9kBMd; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BC605207DF;
 Thu, 15 Sep 2016 20:31:25 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 20:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=CMXhF
 0S6l3NAejWjKOcCvhYRyUc=; b=DE+WaNlo+bKEZ7IpcgRqlvvTbEa9aK//6nAi2
 nnAKuTE4FHrINWBHeHq8MWCmUxPDxCyFwLetWu9DyXpDbEHjaTqCTMjb3hqxUl3W
 YTGmqeMXipO0zMbF69jw16jqgUxnD7BkGtMY8JCp8nKBzqr9SDchDKn3mcV3Ga8X
 Er28r4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=CMXhF0S6l3NAejWjKOcCvhYRyUc=; b=GZM9k
 BMdUJV70PG8jSnLOeQ16UfObIiyn8ZG3PVDxSK0RvWabSqV//+EX2CvWl/TZRMIL
 8d1usqeWjqLdG726EXQedvbHtIUH01yUNlKXoNy4oHmN6gts8mFa+7b1ZRMvqYbe
 XNEpOda51SpgrZ1ZpYIvvmmPhcOmIsb0AxV05s=
X-Sasl-enc: pA2KxREQN4CbAuwSHZw5choI+BSXesOM4CvK5IwCc/79 1473985884
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5BE02F29CE;
 Thu, 15 Sep 2016 20:31:24 -0400 (EDT)
Message-ID: <1473985874.13249.3.camel@aj.id.au>
Subject: Re: [linux dev-4.7 2/3] arm: dts: aspeed: Add spi1 pins to g5
 device tree
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 10:01:14 +0930
In-Reply-To: <20160915111308.31481-2-joel@jms.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
 <20160915111308.31481-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-f6n6GCguCQNgNaZ8mfiM"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 00:31:28 -0000


--=-f6n6GCguCQNgNaZ8mfiM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 20:43 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index f73a2b18e152..e4e43ae3616a 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -201,6 +201,17 @@
> =C2=A0						function =3D "RMII2";
> =C2=A0						groups =3D "RMII2";
> =C2=A0					};
> +
> +					pinctrl_spi1_master_default: spi1_master_default {
> +						function =3D "SPI1_MASTER";
> +						groups =3D "SPI1_MASTER";
> +					};
> +
> +					pinctrl_spi1_passthru_default: spi1_passthru_default {
> +						function =3D "SPI1_PASSTHRU";
> +						groups =3D "SPI1_PASSTHRU";
> +					};
> +

This looks fine, however I think we should add VGABIOS_ROM and SYSSPI
given you went to the effort of defining them in the driver.

Cheers,

Andrew

> =C2=A0				};
> =C2=A0			};
> =C2=A0
--=-f6n6GCguCQNgNaZ8mfiM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAABCgAGBQJX2z1SAAoJEJ0dnzgO5LT5no8P91WJz4P8MWqEgolq3S/05maz
9DEtGac5HZPKRYLRqvrivzaHwpBRHyznUFVn/7DbN2t56sClhYaQ+5bk4uov8V70
J66ApVjDJ/0MC3+R33lkV0bxiNd031RwrJUb27+oKKqxbR7HRTQcRY1JDE9ugAAU
dhuHmf8QfWG1PuYHOvwkdl4g87gUR6uE4o/RLzG6yoa5J3h4ncD0+BN/8CPwwEBe
mBetfpubFQhDG2fWEBBqm1sXHIGt19snjIb5FcZgq5mZ2y6rl+iF5RgdUopVH4HC
rT8LagO02762iqKToQkvhlwLqBjBbOdSKtf2KtoQu/TdeIuwtDpRMZ1eVAJPNaks
9SkU+DPcvi7qvQmBRSgudJDI/BVXn+5dzwYa4SAttXARcOhHo9BEo/Ary3bwuNPM
OJci0SDpiHbNzgcwLskZV0dzVs3zmGo1kNecOZ+JDYB6MHn1IfAVd+1zSgCR4dx+
MCyjyphWvvR2L/UPFJexVzJaGgV34kIlCpOzgCRx8VVq/3kZn+utjhxm0UfntylI
AyBsmoguq9cvXLuTMzHb2IrguBBc00DSWJc/LvmZ3TY6skmcxIKB/kSfv+yM2CNb
YziJXhEPBP58Ofx0yUtSg/eeOkywQcOjcG89ElOnnSzvdQZd/YVMp6evY3Waqbjl
tUevJCU+URRRio19L5k=
=FoFy
-----END PGP SIGNATURE-----

--=-f6n6GCguCQNgNaZ8mfiM--
