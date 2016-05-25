Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDtJP6wrlzDqHh
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:22:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=g1dc4gwu; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 12EDF45807B;
 Tue, 24 May 2016 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=tkAEiQrfTVLoFCO49qu6y
 GIndjI=; b=g1dc4gwucLk7yKZ85adJ66noAqyXZT4Wb3auIIUnevGcAZeOq/e1q
 H7ZxkkvbsEu3DH9O2y0olTdqApkF1CkPxlyNcerFR9VTsSyDQSehWn0WQKfm8Bfu
 FjGGSa5r0FDfepU5UsetFMmwcRZWKLn13+qxFGxxOdImTzGJ0GqfxY=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id E278C458079;
 Tue, 24 May 2016 17:22:10 -0700 (PDT)
Message-ID: <1464135726.20948.18.camel@aj.id.au>
Subject: Re: [PATCH] aspeed_defconfig: Enable SHMEM and TMPFS
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 25 May 2016 09:52:06 +0930
In-Reply-To: <573ECA04.5050509@kaod.org>
References: <1463729360-4883-1-git-send-email-andrew@aj.id.au>
 <573ECA04.5050509@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FhgHlvNzpZowj6pi3MrW"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
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
X-List-Received-Date: Wed, 25 May 2016 00:22:14 -0000


--=-FhgHlvNzpZowj6pi3MrW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-05-20 at 10:25 +0200, C=C3=A9dric Le Goater wrote:
> Joel,=C2=A0
>=20
> We do need these for OpenBMC. Don't we ?=C2=A0
>=20

Just for completeness, Joel's opened up an issue against openbmc/linux
to track down what's going on here:

https://github.com/openbmc/linux/issues/85

Andrew
--=-FhgHlvNzpZowj6pi3MrW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRPAuAAoJEJ0dnzgO5LT5a9kP/jMXCNx4oLvvYeHJ/5bg4/w4
91AtuIfQ71BHk41k1Hzf7gIgM0/rnyOI6aI7Cio3lmFk9TgyNEdYxONVzaQJsjuu
FOUcj7iO+RjpjzWZolF1LdRsYvh91cjZQo3VUJDA0JeEVkDkFbXY8RKFvsG5ykmP
B9gvbdhv7xuJ2isSt6cVyIICtRHikI6WWaQydWl/g4ukZGCC8j4cFHLr5wLnS34D
ko8B1o4rqbMnfbSqlauQIuU66yFGHxM08J8PQw9gEfJy79ZJ4uDv4bzS0XUlL5oW
53CpIEo2gWYgq6pPO69JvBtr1oPRSMQvBRU4R/hvBfBrxSyPizgtVdMu4ey4MrjB
ilsPgKgt+O3KQ8WMQbQX6X9WVVVaUzbhwGgqN/o0UiJEzt44u4s3isBzTFHFLUY4
phlx1KPWRw2VJtVzTqn7Y3r5LZSZ6S/6TDMY57U9ZmMtnUhwug5HsvPsvzD/WsKy
R9YaDQM7bC9gPtW7ZrF0a4OYNtQBx++Wf5fMEKFQ4wP2WN10zXJg6mH1iYjZMX1g
TUbO2as5GTN0hDNfBShMsCjpcC+dmx9eo4ma42UG1xxDK5LIOExfz468hC7V5Iiw
zzKS4NN64ZVS9ArsA4Z+xAGcrQuwwGb0H8mH2lZ7LKvU4G78cuc/AGfExQay1JuZ
2TsviyODjuUyKE6DV46o
=uXyR
-----END PGP SIGNATURE-----

--=-FhgHlvNzpZowj6pi3MrW--
