Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW56g3HRVzDqm8
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 16:19:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r2T3FqoU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hhf2ZbYj"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4071D20D43;
 Mon, 14 Aug 2017 02:19:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 14 Aug 2017 02:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Fq/0W+2r+lXyOLhHo922mqxgBzDOjvzWcIUGcwVP+
 O0=; b=r2T3FqoUr+DrX8QrSJ3HVhgYdm5+nCzxImCToqiB4l/9Yw5h2IgtxUD8T
 wvtxBOliXhBofzlH07veW+ABHdkBPynT8bHq2zuVQ2/MRz2NLUksD8xlY2IvzK1E
 1tZDrDRPoBz4CxUf+mL6UmhXTOd7CX9ssP5A4ewk1dzhiccfkVUd5RDL3V6Zvp/p
 Bc8dQpP5AlMzshaETLzxRr10/O0Qn8WPfj8Ou465bJYkSc3r+Nd5lXhDPFEqGVtM
 MY480uqpLGKoCvYAygsvXsBrUJHayUTt5KsOd3gOMkgM9lP1yvOyNAjsJCIYsiZe
 njujJwIhDcjYOOG40EbsHrTwU060Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Fq/0W+2r+lXyOLhHo9
 22mqxgBzDOjvzWcIUGcwVP+O0=; b=hhf2ZbYjiJt4/EKyYzanPSud/NL1JgBG5a
 /zasZC+ci7u9b//CzJYPwcWjKHWe60qM13RE8zadwwTinZavUP0jESKd+9HPSDMH
 WcchFuIIZet4zgtCopo7RSuMF3yL1gmrx6ZAZfFKkIyxHXnd0PapjUjFXYOYwQKn
 S78C4KXfEKcsY0INO7UizPYody29HblYRDNyZRahqVIOdg4w4mPRviWeQe7lVnE4
 /Hhfkzttkpsf1T8lnyB4EennWabAbv+Rbtyd5JyMafHFLiGqbXWBHqvXaFIXt4PF
 hxEMpCg+MjQ3JQqMyChq1uZ+uHUpU0wj1WZMCBuHcjnYHr4x6tqw==
X-ME-Sender: <xms:6UCRWVQK0SL7_cpCBFO543y06m51YQT6_IRc2lYcZslmSME6ed6ABQ>
X-Sasl-enc: 8gTuowyqCECYZvtC+Vj/Txjs8EMv56Ezu4b3LTb6AyUk 1502691560
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 439777E6AD;
 Mon, 14 Aug 2017 02:19:18 -0400 (EDT)
Message-ID: <1502691553.14932.9.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 3/4] hwmon: (pmbus): Add generic alarm
 bit for iin and pin
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 14 Aug 2017 15:49:13 +0930
In-Reply-To: <CACPK8XeYV+kHR0M3JAyzUTYoM7Q==ULV1mHg8phMVTRSRNNUHg@mail.gmail.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474608-2674-4-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xee32=f0pDV40NSBKffTqAJz5DXeCBgEH-Af_jyo8EYVA@mail.gmail.com>
 <CACPK8XeYV+kHR0M3JAyzUTYoM7Q==ULV1mHg8phMVTRSRNNUHg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yDr2VFqzSqOZPdKUoZRA"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Mon, 14 Aug 2017 06:19:24 -0000


--=-yDr2VFqzSqOZPdKUoZRA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-14 at 14:36 +0930, Joel Stanley wrote:
> > On Mon, Aug 14, 2017 at 2:03 PM, Joel Stanley <joel@jms.id.au> wrote:
> > On Sat, Aug 12, 2017 at 3:33 AM, Eddie James <eajames@linux.vnet.ibm.co=
m> wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > >=C2=A0
> > > Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
> > > need to redo the status register checking before setting up the boole=
an
> > > attribute, since it won't necessarily check STATUS_WORD if the device
> > > doesn't support it, which we need for this bit.
> > >=C2=A0
> > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >=C2=A0
> > I have merged the upstream commit
> > (cbcdec6202c934bd72fca4fe9db255d84f907dbe) into dev-4.10.
>=C2=A0
> That should say c159be9e902a59a117e67d466c872ecc46240ba5.

It was in the ballpark - it started with a 'c' at least.
--=-yDr2VFqzSqOZPdKUoZRA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkUDhAAoJEJ0dnzgO5LT5mecP/3dbH4vQf/f2C26havXDmtsZ
iKkN7SM10Z0HDAHjQGMPo8mlZq1pQd03KrefgFiWL/j7M4WlXtwd1djYG6nzf9/3
X/dKCPPRSRb5UdIC9KbWEuHdqbgSpgfpSYAUz0LR4jak/u2kwoTUSOxsVP2MTzd4
q+u3xFZ/XA+fOPvlbjQX1ClGbqkLwgaxIim35uE80mm65mC5i9G+bYNaEPeqmExy
MUVrlXK06xwWC4FBx4jU6j0+m6JRjunzuGoBhFty7HV2cu5nBXZ+Z2Zpvmy4ZpDj
/TQX1jU1Bp9QHeS5wMASI3Zsm3LWBG0Z331dAiOCUlYNtl4hlKDgJF5eiOaivzRy
1v994Kh/o/eJTFHo+Vg18F5/GPpNJGFQsQhtbriTXUp9qgyl9QCN/Sy4XIBV0E0w
RJGEUzc2r5U72Dj9WvDvedV0mnevOnvBpb1ULPeIWWYie9zCX/d0X9HpEtdgxsz2
ByJ1/VxJe/OYBSpvHzdcEz8O2lvvc+ToryyFMdPf2ecSc3F4PD8uEjCCXww+ustS
UJaNZtOZVtATGAaUIYHHvuRbYJAafIfXXmTKsnkCjGEpZijTRdSB8pg8yF3csSp6
ItaGyCB+HAPPEbLUIwyQV4xGEGsyYb1s8egGaCkZ8APObtATlVHMIbkYp+u5DbID
WppPeU5Kgoe4vn+looZQ
=pgpC
-----END PGP SIGNATURE-----

--=-yDr2VFqzSqOZPdKUoZRA--
