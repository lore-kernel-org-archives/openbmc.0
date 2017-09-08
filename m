Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VkjHmn7P"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N0DndAqh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpQXb3hNGzDqF4
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 15:16:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5265620DFF;
 Fri,  8 Sep 2017 01:16:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 08 Sep 2017 01:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=iXo7tmLRiO405hwp3TmDFazbfcY6eVex7FLmI6pbU
 m0=; b=VkjHmn7PjngjcAM1y5jUeXBKyrb73r0Pn2FHJiJmiJqw38kBh4bS72M+S
 PVLXLP7KaGJO0csKRnUcTg/Y2AE8aM0yjdvokpoJYVONwZA4hj3eA+e1+x5kHq1m
 LqKxQl4r8gBg2NDcFie7DaHMy4hYnHdjxBCI0w3B35MLYKbVeg7FsQue5wFhs9wJ
 H2lrGEQUblCDlRKgROk7D9yTW29d8SZ7VkE1qY0bdkTzGr11MjqDY6BZ0BFNAojX
 V+YymHkXlgpQyHoqtYJZmgH6xnGK5SReuseiT7QS7/5qaD/4nMW2lYdKn+WmtvzG
 BKCAMRCuJ22bYi0fDyL7wHF8hNsWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=iXo7tmLRiO405hwp3T
 mDFazbfcY6eVex7FLmI6pbUm0=; b=N0DndAqhyA5aarxVI23LRzRZWE+P0x+kpE
 dPv9Q9lZOay7qNu04mbl2jN48uinrdmmMPaklMUuivCFcDwbNK1RKjBrJ8ASMrMO
 SVoPvLLOJYzXRoCLFSedydMM6vbXC5MCjMcKiPkWPGjviEe2eF8hLimlIfatVr2F
 HzIG74+2H6L1QNux5s/imn4vRiDXxZ+GOa8i5e11SsJcDiAT4LdFgSx4ooFmorei
 bvawKU59J2LhINTpB8cId8nst6Lj4b6fsSZi1Wg2NojIF8Jc4VxmQY0ydX+IhCcp
 EI786y0ve92emIOvByvORevLOMXFiJ21EVGsYCZ2PXZRq5C/+j3w==
X-ME-Sender: <xms:rSeyWZ0zn11OU64EtaLLAgoMHFLCLmVZLIu20iMLJAPH2Tx37ADbdg>
X-Sasl-enc: F2lW/LW0i4Z8jbzgJTgvNLnggWivBZmZleA7vpSgIt2V 1504847788
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7357D24081;
 Fri,  8 Sep 2017 01:16:23 -0400 (EDT)
Message-ID: <1504847776.6124.17.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org,  openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
Date: Fri, 08 Sep 2017 15:16:16 +1000
In-Reply-To: <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
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
 <1504839076.6124.8.camel@aj.id.au> <1504842058.6124.10.camel@aj.id.au>
 <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+ucxoPjWpWJMrpdaHBPh"
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
X-List-Received-Date: Fri, 08 Sep 2017 05:16:32 -0000


--=-+ucxoPjWpWJMrpdaHBPh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 22:14 -0700, Guenter Roeck wrote:
> On 09/07/2017 08:40 PM, Andrew Jeffery wrote:
> > On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
> > > > I can't test with devicetree. x86 system.
> > > > =C2=A0=C2=A0
> > > > 2,100+ iterations with your driver, no failures.
> > >=20
> > > Great. I really appreciate your testing here, so thanks for your
> > > efforts. I owe you a few drinks if we ever happen to meet.
> >=20
> > Actually, on that, how did you chop out the devicetree parts? Did you
> > keep the configuration writes at the end of max31785_of_fan_config()
> > and max31785_of_tmp_config()? Or did you just not call them? These two
> > functions cause the bulk of the bus traffic with on probe.
> >=20
>=20
> fan config hardcoded, four fans connected. Still no failure.

Great. Thanks again for your efforts here.

Andrew
--=-+ucxoPjWpWJMrpdaHBPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsiegAAoJEJ0dnzgO5LT5uakP/j1WyE+8UvJ5LmyUn+4J5y9k
FxBXYxRYQAj8GwQ29j+Fq6OfkVos++G2TpK+G4sNV8jaapRGXJgQLAQjcbGtSf3K
8kE4kcId2ICefwpksJ79sOvXrXHrKLraKly+RoodQtcEWMpR90enQ9+mWRnbum0J
894mfhat3ZhZTeE0AelB74Z6sY6oqg4Oan4PMkRl4ruQmxrI5URRIyqytLOI2e/e
ZHJuXeFN2XWk623f1XpWkHbu/zL0DrENqRequOvMcMO7C3bMXyP9t7gq3AcMF7Wa
cGSwvvtR2tLtpJ+Gj2oZkg6Pj7DUawaAjrN4XeL5em2XHHf9yIcO1PTSkVEZtQoc
+inEcELY+80EwST+PabyGVG0Kd+R/MvtDctqzFusBwWbLZJbzFhSQovHz69EAEwH
p43AtxWMQTgdTNA9lOkmwgYadUZzXFt/C87WcmA5I4oSe59F86e5SvmJaRHn43dG
dvUqPeFAOG75J8itlYEPj7pZcCOfEByeTg12TgVJqgBeYgiu8cgEOFSF3ua9yJte
jiu+Mk3GJTLKVaNmiXUMAqm1FjlnG9kY7X3Ngz09csx77Dt/Spx8Xz3UspZRcYVx
Z3t5Vs5oTxDzobH0hwuTvzeZGuvqApPYk5V43Ch7vZI0bR5OPnndnf1kvg0/xLpM
kRjD1I2d3RgcL4mv6RA/
=9KSx
-----END PGP SIGNATURE-----

--=-+ucxoPjWpWJMrpdaHBPh--
