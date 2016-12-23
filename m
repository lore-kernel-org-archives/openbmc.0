Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tlCQC4b6CzDwKf
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 13:44:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZdxHe4wH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jdhH8KxL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D3F0204AB;
 Thu, 22 Dec 2016 21:44:01 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 22 Dec 2016 21:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=THpoILheyQQqyv/oAet112W2Mp8=; b=ZdxHe4
 wHwuo+BpCTJb3bRQ6nE2z2K2pGOO43mLbOfY3nYdCHzluJQgM+SISXwcwr2dLgow
 bPcSTS/P5011TTvkOwzWsJQCCMM2n/jgkdK8XmbB6PduInUc87IoUlpyYN91e6HN
 4FN1htTUP+wiA/fB5UDHXt7rV67K2GMAoks9w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=THpoILheyQQqyv
 /oAet112W2Mp8=; b=jdhH8KxLDtKKtpuuacJtTnj+5HOzGQXkV3l46CPcjwHTiS
 o2HYXzF9fcpiQ9aCedOBMHfRWmQfxFXPHrZPj9ngz3/q7NXfMalQbCaU2Uxf/Gcd
 UsEFmo7pmqLG6SCaPqLMxDqB9dRkTwTk3j3QWj7sYJySYoS5pZ9aCLgTFTO9Y=
X-ME-Sender: <xms:cY9cWG4OSngjOzYeM51FfZfkXzZ8UyDjazc7AiEjQQ7vEwar_hQ1iA>
X-Sasl-enc: HdOqcCx2qjySkzJUJVbXPwU3PrKfNSQobphR7r6yOgfR 1482461040
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id AD3017E2B0;
 Thu, 22 Dec 2016 21:43:59 -0500 (EST)
Message-ID: <1482461036.3419.27.camel@aj.id.au>
Subject: Re: [PATCH v2 5/5] drivers/misc: Add aspeed ast2400/ast2500 lpc
 controlling driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 13:13:56 +1030
In-Reply-To: <1482450861.2578.1.camel@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-6-cyrilbur@gmail.com>
 <1482450861.2578.1.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kDoW2L71ls5SrBa2HMhw"
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
X-List-Received-Date: Fri, 23 Dec 2016 02:44:03 -0000


--=-kDoW2L71ls5SrBa2HMhw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-23 at 10:54 +1100, Cyril Bur wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtd =3D get_mtd_device_nm("1e630000.sp=
i:pnor@0");
>=20
> I rebased right before sending and admitedly pressed send before it
> finished booting, turns out we've changed it back to simply "pnor". Was
> this intentional?

Can we just derive it from the devicetree? That way we wouldn't care
what it was.

Andrew
--=-kDoW2L71ls5SrBa2HMhw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYXI9sAAoJEJ0dnzgO5LT5uvsP/iNwPRrWJl+yEbHGScNZxIbe
o20jdLoE3DVVeIeMw9WqODLv6iLNo0Q3Of0zNUJAMWj/KjF/fpt2GPcvnxSxk0+8
cy7b8AzKk9t/IPAtFeOlrR9Fd2o+kGho6ulLvL0RRqQNE3d1UMwOsyVzDBphwgZ5
JJTBw0ChqaTEfBW5GiG8adbUXu6UEY5xIgBkZ8a8+pJ86nM1/nw3Gy9k4xMQH6cr
WIMW4yJzBE3Z4EYvhCV6J5y/I3z99vrcitHiFibJDiPNq4zCumYscmsB+oe5qx8j
9AHB/019GNr9/jpQo4dtrzm41KfM2nlSQeOfg81uo9HI8c5a8zal0pnuKVFD+Gta
wJ4dQ+pEJo7XCA+B+as4Q/smbPrGYSox29DjNGaQgEJcPjS061cNQqhirOalAC8P
itB6IpdBnIoicb9JvTv+l8NT92wCa9Yo1/IB8i5RmeBbKhZcaDqDQEWVaPQLIN1P
gpd5VFcuxdFhuoc2KHZ2wo/tTqHtwZSVZZOwMd6Zlx5ySRHalsbBxyNULsRtEILV
e00gsP7R7648hT0gTh9hl/ypSfhFBs/en84Ehkvyg2oPP/16/H+dVuUqzpTPteJf
5fvFx2kZBHA8QiD/mroILgneqQCSLt+AmEyevPhNw/VXmqLcth8mMeZIDuf+FhIV
tEOoEtFRldEjFzPzKUlD
=66rc
-----END PGP SIGNATURE-----

--=-kDoW2L71ls5SrBa2HMhw--
