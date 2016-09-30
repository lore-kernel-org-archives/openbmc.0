Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 537 seconds by postgrey-1.36 at bilbo;
 Fri, 30 Sep 2016 11:58:15 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=WydxHWmO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=isX5oiDz; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slZN73KtJzDvJl
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 11:58:15 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 94ACB20A43;
 Thu, 29 Sep 2016 21:49:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 29 Sep 2016 21:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=w9cLQ
 1zOIYgxh8RDvl6yuw31/CE=; b=WydxHWmOu2Zt8yGZprcK5XCPeWOIKdMrIyI+g
 KqviT0uuofGr1LrQN4ldAWk9wvUfsAswuGoczZE3uWZo/p2kvReUW1z/WkY1jqhn
 0DHMVTLsVrATH1JOgPaxYWrEY08E26xXTQqW6YsN9rgbzufMvWCwhKYkqFpS5iVk
 ySDVz0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=w9cLQ1zOIYgxh8RDvl6yuw31/CE=; b=isX5o
 iDzcZil/90UC1KF08UtCnN4weQMKEwmhh9MG6TmoKz91MpNr30xAd4RW/OadOYkT
 B1d9Gbv8hbv49azMlGeL45kkzr5lC2B5g3JSIjUhDN9MkTPu98swB6z4zgzT+c89
 lbsvG/o/mHzNtn1xwxSrR++LZz/RleH2rbPN1k=
X-Sasl-enc: lg9qKlXDuNHU+VBpZJNbWTRGHVzER/IbwwaPeDLmuPGY 1475200155
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC2D5CC07E;
 Thu, 29 Sep 2016 21:49:14 -0400 (EDT)
Message-ID: <1475200147.24463.36.camel@aj.id.au>
Subject: Re: [PATCH 2/3] aspeed/g5: helper SCU functions for configuring
 aspeed I2C
From: Andrew Jeffery <andrew@aj.id.au>
To: Maxim Sloyko <maxims@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 30 Sep 2016 11:19:07 +0930
In-Reply-To: <CAFR_W8rc=2XkpUwPokx2_00wMnZfxq9VTHTOVrXgJ8r7DkJ=0w@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-2-git-send-email-maxims@google.com>
 <CACPK8XfgUCEfcgmZ8P2wpMCRHn-jaVup_X5cpq93bYMkZy-jTw@mail.gmail.com>
 <CAFR_W8rc=2XkpUwPokx2_00wMnZfxq9VTHTOVrXgJ8r7DkJ=0w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4DyN7wZaSPHHTHXkER36"
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
X-List-Received-Date: Fri, 30 Sep 2016 01:58:16 -0000


--=-4DyN7wZaSPHHTHXkER36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-29 at 11:23 -0700, Maxim Sloyko wrote:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable I2C Controllers */
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0clrbits_le32(AST_SCU_BASE + AST_SCU_RESET=
, SCU_RESET_I2C);
> > > +
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num < 3) {
> >=20
> > How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?
> I don't know. My guess is we don't, as in, the pins are always
> assigned these functions. In datasheet these bits in PIN CTRL8
> register are marked as "new in ast2500" and there is no mention of
> sda{1,2},scl{1,2} in ast2500 datasheet.
> Also, this part is basically taken from aspeed's sdk, this is why I
> assume they are always on.

So to clarify, the AST2400 has (SCL1, SDA1) and (SCL2, SDA2) on fixed
function pins: (K21, K22) and (J19, J18) respectively. I don't have the
datasheets for earlier releases of the AST SoCs, so can't speak for
them. The AST2500 has (SCL1, SDA1) and (SCL2, SDA2) on multi-function
pins: (M18, M19) and (M20, P20) respectively.

As an aside: In AST2500 case I2Cs 1 and 2 are only multiplexed with
GPIO and are at a higher priority, so we don't need to flip any other
bits to enable I2C.

Maybe there should be some comments along these given the code looks
odd at first glance?

Cheers,

Andrew

Separately: This code makes me glad I took a data-driven approach for
the Linux pinmux driver (not to say that result is beautiful either,
but I don't want even begin to imagine the maze of conditionals
protecting corner cases).
--=-4DyN7wZaSPHHTHXkER36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX7cSTAAoJEJ0dnzgO5LT5xTIP+we/C5tnSUPqlAm9wGv2KAC8
mW5gytUJbloRdDVJ2aGnJgsCTj9VFgJk8lvnez0QRiOOHAm8CtEOYHhIrR6SpJvm
uZWIyv1OPkVqB6pyDTuX0ddwXGxsmchJhYSV2Y6sxCAyLG712SJz5hhFaHbq+1VD
orfLbJFyCe24Nj9decdDciEV9OfODxeKaHKEdV8xyhtxTee06jwUKXC1GNwafNeP
wjJqPd4d2kanJTk6tkKL01Z858sBoRvXorXoMLQ8oTZy0TSwmkRbW56ebLeXjOV3
GSqL+kxApEq1q1k2bt3JjBuaW+sIeiC+3Vuj8dGneeis9IQXE7gWqCCykyOvLiM4
btjM9sQOjH3iiFJzURzXul/tiFU2k8EsbO1ZDR9yypfsFzFasVHoCxp7UiK07u5A
gelzqjcTY7a+kwyPEF39PfBq+zO1/NEgrPqXZbZDMZAzVQQ0qy/Y+X11QzoAIgpr
HmCpgPoQC8mm0N+fW0gHScolOKtkh5eKsFTeUcBrRCCfWqOuELR9F1JyajZTRPm6
h3OX+IeurB345ppcuAZtSdCfhVtvjgi32o8UNoD78YK/9UL/wEu/EccfAO3hHs+d
1h/hkjDCVJtdP6oeZDKvOeUREemV4OzH9Fz9lkNJ+KDZSYNh9X/Nb5Ogs8Me34W9
bchrPczSS2hoGz3sijLE
=IfoI
-----END PGP SIGNATURE-----

--=-4DyN7wZaSPHHTHXkER36--
