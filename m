Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDfd360rkzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 13:36:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iPXiyT96"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CofO63gc"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B22372095B;
 Thu, 27 Apr 2017 23:36:53 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 23:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=UQap80CU/Mv0Zn/7m5aVv6bgORxnAjJ5r0dFPQDnN
 3c=; b=iPXiyT96fi1yryixMc5Q5GV4i1F791KsQzFrAAKEtsZkKecI/svFC1A+7
 SDLvy5zsBj8JNzwRc2Ns8DbQgozRBwIGupfowGpFoVcv+N7cT8lJOxgikNu4hblM
 xJGNYj2k/q2SrrzQxd7ATFdsFD1a+I7PlSdNfL3p4aF3TGrhRpkzUUEyPNqCI5B7
 yg8IJrgRAzCnrzea0bJnQF44ONT7Te7FJ6DJzzLGM7iLa1u4W7UENBmG6FxiZE9X
 5OU018SWdXvD61znxU27lvQth2KZXn4Sp5gaBzG0OrUov3vxXAuHPurDu3T32SBc
 m6qbFYIx1lDWZfG0WvXf+NuOKjbpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=UQap80CU/Mv0Zn/7m5
 aVv6bgORxnAjJ5r0dFPQDnN3c=; b=CofO63gcdb5N2jRc24aS1PIN9dlthZApYg
 qr5kYJpmEJMK/efzVzuByZgyPbcefio/r+7qrXG/o/XKoINuLGjF6c622xmNqq3j
 1uTfXmjaDKHGmiA6W/azL3tneinYgkXJL8TLOTAJ9j5tyQReparSKzFJPCVuVzHp
 3mrdNEVG7DE9xAfCEd+bt52AGglUixCszsdK4zp8vJjfTtnQtRANmr5ngqXp/BAu
 /VChanIfet7MmdCewb86UVDIsoDLCntjHlYK/cILgq2oU8zuUOpY0+7rXuguJqUQ
 PKGpl4BqV4JbAIL/MJFBbpD/If+j+MrkWY6aULpA6IkSqBKfBv0A==
X-ME-Sender: <xms:1bgCWRu87YMd6b8SrhtaJAWTMbCmVaiBcV68dzM95hN6kEIBGjtQSQ>
X-Sasl-enc: 3QQDe1csLZRMktgdgF4S+j4r8MDRTPcmx3rc+bRQJaZa 1493350612
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04D8324873;
 Thu, 27 Apr 2017 23:36:50 -0400 (EDT)
Message-ID: <1493350607.4433.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 05/10] aspeed: zaius: Disable GPIO bias
 via devicetree pinconf requests
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>, Mine <mine260309@gmail.com>, Rick Altherr
 <raltherr@google.com>
Date: Fri, 28 Apr 2017 13:06:47 +0930
In-Reply-To: <CACPK8XccB5je8fSDWvgVyVKKPJBbhEu5xE_KvU=dDsUUauiNBQ@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-6-andrew@aj.id.au>
 <CAPH-5w46rey_4d=enxOPwvjbZp2aL8smNZ6DMGPQraQtaFt3OQ@mail.gmail.com>
 <CACPK8XccB5je8fSDWvgVyVKKPJBbhEu5xE_KvU=dDsUUauiNBQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PWOKr4duEnxOGSxx+HZN"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 28 Apr 2017 03:36:56 -0000


--=-PWOKr4duEnxOGSxx+HZN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-28 at 10:08 +0930, Joel Stanley wrote:
> > On Fri, Apr 28, 2017 at 2:46 AM, Xo Wang <xow@google.com> wrote:
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > @@ -359,4 +359,14 @@
> > >=20
> > > =C2=A0&pinctrl {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed,external-nodes=
 =3D <&gfx &lhc>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl_gpioh_unbiased: gp=
ioi_unbiased {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pins =3D "A8", "C7", "B7", "A7", "D7", "B6", "A6", =
"E7";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bias-disable;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +};
> > > +
> > > +&gpio {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D "default=
";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&pinctrl_gp=
ioh_unbiased>;
> > > =C2=A0};
> >=20
> > Looks good.
>=20
> Andrew, There's a gpio section just above here. Should we put merge
> this in to that?
>=20

Yes, I think we should. I'll address this in v2.

Andrew
--=-PWOKr4duEnxOGSxx+HZN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZArjPAAoJEJ0dnzgO5LT5e74QALAc0Uix1ZS9bTtOybIrYoCe
5A8JKVcULDTEzZOkeJNczbW8b6GIGYNZYewoqQFo5peHzklZCFn209FtoUPqD3fM
PAMSZeQGv8XPSYWVAcwld4w7rCE/WjYfZidyTyR5EAO4XhSkqwuAXeARNLcJKqXc
a2fV+WKeOtbzytF0VrtlD5k6aOweZrJcP3FZcA5kVagBaqWAnCI8pvNhDCdpv8XO
KmV630aVV9aOOcFCa0lta8KV+MBwa01gftPahRk+AiRNnsYnfrTO8gf9UtZRJzSE
hi0S1DwRudLCbURBuKji5KZa9jdgao3dOehgj6zWa7bXUP/NknIpK3Xp9uW7x1ss
9x0bphhALefi9Tdq+wohfI8bwSNu9VK6RBo6H4IFv0oDg01m7yZk9nsbeGwI7kNd
ZdEk67FkG9h+4cUrmwCVgGbY2CgoJ5kENU2uW6Drfz7T5Pa/V26yf0wM55BnNqKz
AbnZbhRzPrVNgW9zg4hkoiiSX2iHFsoNMWlOrDHc8Mu4rbwHVdWpJoYzrevNRxD/
34pFSH2f2x2nNkigZAPNZwAFp7Gw+x3rakeq5qaRUAjZzHD0YGmflA+86gnfPjsY
mL4idt+Arfzgtex4CwbVi0kw0LzCdu2TQwyObecj7T7nD7QqIB0zQOMdRZJV0ntI
rncu4TJUuYOgAHpyVP/e
=A3CA
-----END PGP SIGNATURE-----

--=-PWOKr4duEnxOGSxx+HZN--
