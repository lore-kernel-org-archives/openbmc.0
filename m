Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pqYfVsuQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jl09Wx22"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpMK92VRTzDrYD
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 12:51:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 90BB220C5F;
 Thu,  7 Sep 2017 22:51:22 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 07 Sep 2017 22:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=uiejYW7AxeBaoCMmdbAsC6tjBAD72CL8/E1ttn4+s
 PI=; b=pqYfVsuQWsZ0W6J4PV1reUeopI9wJs1R2SabB5oB6JY7WV8eGPojX5Zwi
 m+z0ZnQ1A130ACAGxQYzP/DUBkdN6DCVcQouDRBxx20/6iZ67gRcJNsxxqPp0rjd
 5HIHXVsuQDfPYbX1PGT9zt8MGj+mZVh+YB9RtfE2CBCGOaD1sunB1JYGwkSNqA9A
 NhIx5hy3oQ/XnMbCi8i6eGdGz4nAEU9WSc3bz+SOHhvV7A1FxmIVrWUl9UURvJ+o
 BwfqLOwzt6fhWfmrCWsgV1e/FrVa5EpbVqBkHZp1mHPBqUWAJVjzm81d8VDJQq/t
 84jQL0/UEJ6+98difvfkrmEWWwd/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uiejYW7AxeBaoCMmdb
 AsC6tjBAD72CL8/E1ttn4+sPI=; b=jl09Wx22lmGATghwVRJLyRiuPco0FVKse2
 2lNFET+KXBqL5+1XKJalZI76+PEME/mKteGtgytKOZZsHZLINnJAe/RLavIKqW7h
 F63YwBotD6FiZt1a7w1WcI409JAJzZgzZYeRg9WV4S0DXdy9mEQaDVtRLNE9CoWU
 qMIaOdEeVopj8t0XLfWBDF5mpGOTtyKm9VFmvVTNHO0rLJNzisrjfJmTgWpENs3H
 ZixJ4hrYSJ5MRN/xuFHo0+qdhGFgDyAlglsCzxvTcKTGxDiSK/oAe9ZQbgj29YSx
 SktQTzjhfEUyOW0URULGI9ki8zWWx32zSlVawlI3vJXFyqwpVAIA==
X-ME-Sender: <xms:qgWyWdRcL3-4aidqQyq3_hGQ--X_hFop1addwO7IXZFSdMBrLCNA0g>
X-Sasl-enc: 2ixyeF8gAWQY4o+a6wUXlExNUws2ZsViVXotpY+f6NND 1504839081
Received: from keelia (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03406241D9;
 Thu,  7 Sep 2017 22:51:19 -0400 (EDT)
Message-ID: <1504839076.6124.8.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 08 Sep 2017 12:51:16 +1000
In-Reply-To: <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
 <1504836369.6124.2.camel@aj.id.au>
 <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gckEVYEcGvBcIqUFY6km"
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
X-List-Received-Date: Fri, 08 Sep 2017 02:51:26 -0000


--=-gckEVYEcGvBcIqUFY6km
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 19:17 -0700, Guenter Roeck wrote:
> On 09/07/2017 07:06 PM, Andrew Jeffery wrote:
> > On Thu, 2017-09-07 at 18:26 -0700, Guenter Roeck wrote:
> > > On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
> > > > On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
> > > > > On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
> > > > > > On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
> > > > > > > On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
> > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > > > Guess I need to dig up my eval board and see if I can rep=
roduce the problem.
> > > > > > > > > Seems you are saying that the problem is always seen when=
 issuing a sequence
> > > > > > > > > of "clear faults" commands on multiple pages ?
> > > > > > > >=20
> > > > > > > > Yeah. We're also seeing bad behaviour under other command s=
equences as well,
> > > > > > > > which lead to this hack of a work-around patch[1].
> > > > > > > >=20
> > > > > > > > I'd be very interested in the results of testing against th=
e eval board. I
> > > > > > > > don't have access to one and it seems Maxim have discontinu=
ed them.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Do you have a somewhat reliable means to reproduce the proble=
m ?
> > > > > >=20
> > > > > > It seems we hit a bunch of problems by just continually
> > > > > > binding/unbinding the driver, if you don't apply that hacky one=
shot
> > > > > > retry patch. We can hit problems (in our design?) with somethin=
g like:
> > > > > >=20
> > > > > > # cd /sys/bus/i2c/drivers/max31785; \
> > > > > > 	echo $addr > unbind; \
> > > > > > 	while echo $addr > bind; \
> > > > > > 	do echo $addr > unbind; echo -n .; done;
> > > > > >=20
> > > > > > It should hit issues covered by this patch, as the register che=
cks are
> > > > > > used in the operations used by probe.
> > > > > >=20
> > > > >=20
> > > > > Hmm ... I didn't use your driver but my prototype driver which al=
so supports
> > > > > temperature and voltage attributes, so if anything it should crea=
te more
> > > > > stress on the chip.
> > > >=20
> > > > I did add the temp and voltage attributes...
> > > >=20
> > > > Any chance you can give mine a try? I don't know what I would have =
done
> > > > to invoke this kind of behaviour, so it would be useful to know whe=
ther
> > > > or not it happens with one driver but not the other.
> > > >=20
> > >=20
> > > Will do.
> >=20
> > Thanks. For reference, here's a devicetree description:
> >=20
> > https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed=
-bmc-opp-witherspoon.dts#L283
> >=20
>=20
> I can't test with devicetree. x86 system.
>=20
> 2,100+ iterations with your driver, no failures.

Great. I really appreciate your testing here, so thanks for your
efforts. I owe you a few drinks if we ever happen to meet.

>=20
> Either it is because my chip is a MAX31785 (not A), or the configuration =
makes a difference,
> or it is your hardware.

Yep. My understanding is the A variant is just a difference of
microcode, but who knows what affect that could have.=20

>=20
> I'll try to connect a couple of fans next (so far I did without) and try =
again.

Keep me posted if you do.

Thanks again.

Andrew

>=20
> Guenter
--=-gckEVYEcGvBcIqUFY6km
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsgWkAAoJEJ0dnzgO5LT5DloP+QGAbPLVdUu7CTEuh8HheMfi
KheBvGwZRSVAA3u4wOBs4tNPf9FnwZceffhqOzX84fE9llAMekZW19aWtgKp79ah
OB7EGoNMwbahxZRMQW3DRdPqb6Nq1vcnlFw7fGZNyyMhIkHn5M1IwbJlqOOrr+gi
p3A19sADMXW9uoRtlDtrMSEvQO/w5aSycfeE/WNyOW741aC2eMHuNz3fK6lqfDXj
Vcjpm8B7tLkjQH4Em99iI7mB1bcIdYRoujVq/8NlyG5wPBP3mwYVn7r6S++WkHOl
ZP/4LztbzajeF1jdVDOJsuD6ZB4ZYEKvUfUR1DwYODOF07xMvb9XKv8ccHToQHyG
Ocu+jCQhDJ0AjUr0hKyp+A+277AHQBv6bfl8ZIaiF+fNeed6Nw4dS03Pflpyey/F
9cu6uELcb0BGprdSUKpCjWolqlK2jhaOmUJaz97ICr6cfNb1LX6t2IcUqRkbTbzz
RmQUkPwCYDFkY5jgB7FUHHI4RDnNPffE2P4j5W2V9fhuLarokzc/tknbMz2cAfUs
YQ/b8airiEmURAaNfKErYs7hHD3f7mITotbR002ueSPZpxDi0Bsz1Mp1c8o1BfuC
Z7pNRiWzYYF1+YGC6iymHqXNfbOBtVlQctXJX6hWnw/VF2+hu5gZkWagAAh7dNWf
tvILEmfhtgEGP2Znlcou
=f5Wg
-----END PGP SIGNATURE-----

--=-gckEVYEcGvBcIqUFY6km--
