Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OaWNdHlF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jhLnVkqS"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpNQW16Y0zDrX7
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 13:41:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16E7120D84;
 Thu,  7 Sep 2017 23:41:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 07 Sep 2017 23:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=XWdDvbnvT4Upe+T2ckmIFKBsjK7sVd0pVp5uVQ63N
 C8=; b=OaWNdHlFrGkKGqUxBaYHQKrKOkvJqsjQaoqj2051dZhfs/Y+dF12rujeb
 9RXpw0W413QnLgk0wwFvRLXIjrgLnii87gOc+4JAW6IzPFShb/po9av65azYB4dl
 8lgoH7cDGUCnqtmLx6YwGWiiG1IXIi2D+BE/W2gEcir1OeQE0FOsesrkKdRP50G6
 pJQ0D3WA50yAFzZ1VHLghc3j4+7uh3jUp5ZonbMtxxsK751o3CO+p+PX29ZKas8W
 b48bolh/fjc+/NbX2K+Py4ykOoPUOHECC4gJIE7VYyFhwAp8XRU6aWu/7iIGZuwC
 qRWWGBf3z7ZvBqXJ5z+ih9lR3ZOBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XWdDvbnvT4Upe+T2ck
 mIFKBsjK7sVd0pVp5uVQ63NC8=; b=jhLnVkqSRPoKK59q9iU1RBYd07gKVB7kGF
 5cBCq807oQQv/c1Ykvcaqvz+qAGon3H9NJq7jtwiSOuzGKGl1EGxjPhCuYRF2dHc
 fFcM9YCTGa/U+I6UjtAvJYYr3l4IUsxLCaZLVqLNy/I3XMkmXF56Ko3SRMcdCKGK
 VHWI/JU0Eajn5m1XlHbhYOz/c7Tio1L1KcO40jxxcpRWNhq0dGn0wsPbntXZ3MM9
 zoUlahqc7hW2zFuLIPw0jygHXCUI7ataqy06y23Bkm9DEln8yQVhD1VX1PeGy42o
 TZfM+7Scv6bXqu/eb3jKOs7z+G6DAOzuZTtRJEUqgGM+mFJVzEug==
X-ME-Sender: <xms:UBGyWckkk3F1BkS9ENzHDgRtn6ggltoSiYkdzn2Ziti9XcqEZoRQew>
X-Sasl-enc: EEaUoAn1Cci2c8mLQPjdFHwOsYIlHkQBMK3cSKxVzzi8 1504842063
Received: from keelia (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id B78D5243C8;
 Thu,  7 Sep 2017 23:41:01 -0400 (EDT)
Message-ID: <1504842058.6124.10.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org,  openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
Date: Fri, 08 Sep 2017 13:40:58 +1000
In-Reply-To: <1504839076.6124.8.camel@aj.id.au>
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
 <1504839076.6124.8.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QG6e8yWIzdDght3qgphi"
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
X-List-Received-Date: Fri, 08 Sep 2017 03:41:09 -0000


--=-QG6e8yWIzdDght3qgphi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
> > I can't test with devicetree. x86 system.
> >=C2=A0
> > 2,100+ iterations with your driver, no failures.
>=20
> Great. I really appreciate your testing here, so thanks for your
> efforts. I owe you a few drinks if we ever happen to meet.

Actually, on that, how did you chop out the devicetree parts? Did you
keep the configuration writes at the end of max31785_of_fan_config()
and max31785_of_tmp_config()? Or did you just not call them? These two
functions cause the bulk of the bus traffic with on probe.

Andrew
--=-QG6e8yWIzdDght3qgphi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZshFKAAoJEJ0dnzgO5LT5CAsP/3Cuy/Tsrw2Ls6G3X2okSEep
OM+JHgeXk0Y5iSUk+rzS1IeNhN12b1v5K/+Vc9VolBkaDBYulaDPoTHsNcqRsbqm
ug+tDnvYoNtaXzeTBCtryHU1y520EI4c70re4akP8bk9qXO0E23ezdUmun3sL9kL
KU8hPpDfo8AXVs+MXWue+pnFHey8HoXoQeE0fn6eko6/7aHIkhtEWrRt6B8++8Yo
mV6rjEk2lT4c2rLThwhC/0kCZnhNZmJ52PexmeW+gNezrWOqYDjrWCQFXcpD0Ag0
JZwOSJKGY5v8epbjzyJNsv9rbOMRt23wVKLcCQ9IYWffU2zmEPMQTlpyuvFzbbLc
Y+gLFqSxTz0CMfELpxmF5y3iF72uZfhyEOytJSXp2XDTsamiYpdeiLV1G9mb8pl4
FjS2PX9l9dCVXSGTzq1gUDxS0WEDsdpo6/Q7mBeWK8p/+LrSrZtXryDm5cMYRvvI
AGZC60tm5c4NfXEvYObrH2Y0yYQC/DYoKx22SON+rbzc3HMN40eGJbGej6LYIHgi
YruHCgHrg/yofBYFpUHk2IL/L6UR1c7duqMa8RJXx5IKVg/8Jz4P9YdQozFPh8EK
bkxGrwPjUZhaumw2bACzInoXRlkR5O0PUUsvAYz8JVwikbXMa9FLzJWG0N6yCG4N
h5MamSNB0N3Ck/TxI9x1
=snjJ
-----END PGP SIGNATURE-----

--=-QG6e8yWIzdDght3qgphi--
