Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6pTH5zNJzDqNM
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jan 2017 11:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jkjSIPe3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HKTWNXYA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 48BD020AE5;
 Mon, 23 Jan 2017 19:09:34 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 23 Jan 2017 19:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Ln5QwKK9kcz5lwcbQVOokESs8pI=; b=jkjSIP
 e3SdNgRtno7UtPw+RQomORECj7qek4W+a7tLp7dSyLYZ21qBWpwWPiHtekwGxH7M
 lafiF2LAUFT4AhpeO2LGDVax403IR5xA9Lg8CsX5QDdSsG7CtnlzfoBLQy6cpTcP
 PIu3d2D/3OpPMN5RDQqav79E2eMYxZLzLsdyU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Ln5QwKK9kcz5lw
 cbQVOokESs8pI=; b=HKTWNXYA/pPfBbhnTyYBCF98RBL46w78AoAuSYVY5vByUq
 86OJD5mlPA5b0ru7feM/bIuB1BEdWHoPr0VdNBOWYRCCgGniuwzIEiotRl+GvEFh
 8FqnX1UUF320rs9gdWT64Nfsafd/Uje+RnjFNwoPxxvc80kUio+/ZELh88dE8=
X-ME-Sender: <xms:PpuGWA8o3EWE7EBZ3HYqbxK7x2UlLGC5YrCxs7nOnw5paZngGpfrfg>
X-Sasl-enc: rt8mZxsrghfLLRa0M4fDJOk0F47yBHkYuqsPSE6/cUzz 1485216573
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45B717E2DE;
 Mon, 23 Jan 2017 19:09:31 -0500 (EST)
Message-ID: <1485216565.4137.9.camel@aj.id.au>
Subject: Re: GPIO expander user space access(ie. pca9552)
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Barth <msbarth@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Date: Tue, 24 Jan 2017 10:39:25 +1030
In-Reply-To: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
References: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-elKI2HsaYHmiDmjtG6VK"
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
X-List-Received-Date: Tue, 24 Jan 2017 00:09:40 -0000


--=-elKI2HsaYHmiDmjtG6VK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-01-23 at 09:58 -0600, Matt Barth wrote:
> Is there a defined process/interface to access GPIO expanders from user=
=C2=A0
> space to be able to determine when the state changes? Possibly polling a=
=C2=A0
> fd or getting notified on the state change?
>=20
> Previously this was an i2c device that was accessed over i2c and the set=
=C2=A0
> of interested bits were simply read into the application. An example is=
=C2=A0
> the use of a pca9552 for presence detection on chassis fans.

I expect it should be implemented as a gpiochip driver in the kernel
and exposed via the usual methods to userspace (GPIO chardev and sysfs,
though sysfs is considered deprecated).

Andrew
--=-elKI2HsaYHmiDmjtG6VK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYhps1AAoJEJ0dnzgO5LT5JLYP/A6LcdgE2zEn7JO5sDekegAb
gmdKl+s+cw+iEv3dBfM9hwTC9gLv7+/uyzBjBUWwHZG/gEWiRnLCsGsQ/OBbwYHo
ssOHl5IHuJSD91jGdXH3kj2TTB1oIYh9Y8w5uT9Nzja4AVjpa6dw1xJYtMj+Zqx/
3TE77PPxSTw7ziLdTTau9IUpk5BwLkxLQ3Db5fJS5Vnd/FyB9RePdZuvHUoGMI9q
5oURqfjzFfHqpXEnQxNxsRRWCbV1ydV1BVZvFEOdGE+G9owDlundJXEMRNb349Y9
sq5eZukMv6WBKB3MlcGlAW/O7eOy8Gihc+z4vkcEYpaKtgwBGGO7iWOtpneb3jR8
9TkXh3UOV7xrG114YS7N93qhZHCtv2EZIgOsfyAYyZAL59uS1PyrB+9N3JBTOzbQ
lBdfj42SQFeXTW6Pdv6hb0LTJOoRIGuhpL9X6IRco9XXTvCvncUS5rhCYt18Yfii
fyMwjGg6RBskf4ybkMGS/NNd5gd0AS4pOLCjsqQvqsL7hLLFyjxKCA6S48CSQx4v
5YK55MM0oHAT9VXKdG4Lk6dHGTbQvRM8yIm2Mj/3bT1lL+CS15DxNTH49CCQ5bCq
fJFL8rxOzIIpyWmIoUwJXdKfCWAp4FT9eWpYLZ6i5Ok4NyNwlaPT1E6Og3DKoJnt
8pLBAj5yLTpimyyJuYea
=wnja
-----END PGP SIGNATURE-----

--=-elKI2HsaYHmiDmjtG6VK--
