Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP1tj5SNYzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="X+bQBlxk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sag0subF"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A1DD20780;
 Wed, 15 Feb 2017 22:32:27 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 15 Feb 2017 22:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=tqfFc464GfSLNkel+w+LDwHU9cU=; b=X+bQBl
 xkv7JqNF+jgpTXALOBYD4+v3+A9ZilX8bod8x0Il47lgCkgjMg4aETtCNfV2a+PO
 MgIBaFi2Vyvfn6LVTS9RRDV3oAzyGJoWziO89pAbkY4R+k1WMDBb+kl4WSnDqkjF
 4c4fCTBFfFZu+KefuHV8AWl52ncpthwsjU5n0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=tqfFc464GfSLNk
 el+w+LDwHU9cU=; b=sag0subFHPI09TRhEpqxR7XHEISo3vDFvzfeZC0eZf6Hw6
 afVbh/TsdaJly1PBcTk8PG1iNwuyP447Y7qdO5yM9vcjM1ZVYB28WdNQb9qIywY9
 pcKKeZdLIlUMZuvRlvTWPNjlZ9cavwgsNb7Z5GKVYOpW9eCZzlvW586vXyptk=
X-ME-Sender: <xms:Sx2lWKbqp8vB1j2XMoFOllYYu5PjAtuVN0XR61tvt9LzO-O-ogGzfA>
X-Sasl-enc: FtgVmsi6DgHNxb0Fujut5qp+5xCX/WbOj9pgAbfHMXcs 1487215946
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E257F7E16E;
 Wed, 15 Feb 2017 22:32:25 -0500 (EST)
Message-ID: <1487215937.3661.36.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 16 Feb 2017 14:02:17 +1030
In-Reply-To: <CAARXrtmEEajwOp4p6bNE4Qummj_M9nxP7R-UOmNXSQKA2UCv_w@mail.gmail.com>
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
 <1487208079.3661.32.camel@aj.id.au>
 <CAARXrtmEEajwOp4p6bNE4Qummj_M9nxP7R-UOmNXSQKA2UCv_w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-JoTuV8HvesbBcwE8FZWK"
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
X-List-Received-Date: Thu, 16 Feb 2017 03:32:31 -0000


--=-JoTuV8HvesbBcwE8FZWK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-02-16 at 11:28 +0800, Mine wrote:
> > According to my Romulus datasheet, FSI_SOFT_DAT is GPIOE0 and GPIOAA2
> > doesn't appear to be connected. Am I looking at an out-of-date
> > datasheet? Did something change here?
>=20

s/datasheet/schematic/, pre caffeine.

> Romulus FSI_SOFT_DAT is always GPIOAA2 (from GPIO Romulus 20161102.xls
> to GPIO Romulus 20170112.xls,=20

The schematic I have has 20160811 in the title, so it's probably a long
way out of date.

> and I confirm that FSI is working with
> this config.

I'll trust you :)

Acked-by: Andrew Jeffery <andrew@aj.id.au>
--=-JoTuV8HvesbBcwE8FZWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpR1BAAoJEJ0dnzgO5LT5N/AP/0lmvzU8t4yn23V0eaywfhsm
wUq+ZHoFSNN2JuP0ofEWtp4myU0+x1y/mWicA1SOdHinU8jGNd16p4ADX43ycqDE
HHhcsRi3qFEEJThZ5IBhWyL7sYMs5iR19q0WdELZkDXLLa+wIXFhILpnYFWgRy22
+W07BU/Evs/JNGTFWyUaal5uOLqB+ZuiFxP97kjOpQM1yKyDWFL71UrWFgjJ8TYx
i+mRWDug9pdhvVegRd8gzL+LIOxHp8wJ3O6LONoIcC8zZ7g567+nE6KyLcldAyjp
/SA9RdzwD4sFzXxHK+0ZqBWv9x14ySH+Vu9akhqJnJE7j+eQM0Z79QWTXNxEMoov
/K5A/G2EEIrmJN/VwPPkrg9c+IewmfBwcqYi35tIDdtuaMKNB0ZuG6fuGmdZ6JKs
a2VjhWE8HaWswDFGvYbCr9MbIEmybUDHiBHHFjwHO7bnmIDZCCYc6L84Q9N9gJII
2DP5XCXon3DZen5mnTqjTqNm0yWaecQxSbCD02VeJ+/wFG5w1jCr9IjggELX92zq
bj6r8R3J6MDvzZr3SRXuEXcRjO7NnAVbh0eRwKW1scpGeSaDJupLyv2fz/0p4KFl
cM4LbV7wrzk4Ir7Z/IGX8dAxzYHoqqlLTmzjRXdntRo4Upds3qGVUo7v9gZJC+AH
/0uv8MhzPcX24WSHJPcE
=2ae8
-----END PGP SIGNATURE-----

--=-JoTuV8HvesbBcwE8FZWK--
