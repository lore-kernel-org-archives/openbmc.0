Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmrw95Gs5zDq62
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 07:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=NEMwGlMn; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id ECEF845807B;
 Fri, 15 Apr 2016 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=6qyIsSBmg/1Id07m+Kvqk
 cl46aI=; b=NEMwGlMn8TJWSDL82H+BZ50DBYZQwXP9/Tpmp7HYlVshJYOk1kusR
 m4ih8VaMkXtw19Pcn/bY+5T8qhpha1+eojz+oaYKj3hmw3pAm+FE+l2+AA40FP9K
 P31M0BaHTwcwTS1n0UHW1HURo++QPN3/235Z1w/y87Ih2sx2XPrTXM=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id B2D7F458071;
 Fri, 15 Apr 2016 14:56:21 -0700 (PDT)
Message-ID: <1460757373.3978.125.camel@aj.id.au>
Subject: Re: Resolving the lonely pull request
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Sat, 16 Apr 2016 07:26:13 +0930
In-Reply-To: <201604151853.u3FIrYF0024455@d03av03.boulder.ibm.com>
References: <201604151853.u3FIrYF0024455@d03av03.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XKKSG5Ebx2kdkkWAvnkc"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 21:56:26 -0000


--=-XKKSG5Ebx2kdkkWAvnkc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-04-15 at 18:53 +0000, Chris Austen wrote:
> qemu - Andrew J

Yep, I'll review any qemu work. I want to get around to reviewing code
for other repos as well, just I need the time to work up the context to
provide something more than spelling and whitespace suggestions ;)

Andrew
--=-XKKSG5Ebx2kdkkWAvnkc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJXEWN9AAoJEJ0dnzgO5LT5V68QAJBgboovECHhAUc/6ime+pyC
KhMBsXrG7Ak1gGgH6T6M1SXCopb8qhY2IDJ01FVkdJ+v8X+DpeWTFST54wYp1TW1
2P0elKujai0QlIOdbSoM2/Stq7RAZ20fqM6f9oclrHAYWvrPgOLQMnNT8DsvJ9fk
QrgE37AnVPrGLAPRmcxyM4dH7ZMKL9VtQMOvmcm7GXZiTHlzMr7cm0gscFCJIBLL
PgfjMcvW29oU61FVPMj1KeckerirdSuS3oCQtqYxTjCallKgIraHlMs4mALbHU8g
OzWmpNaBpRS3w4wnyjbo/GrxzBpXZsSwq7DEyhRGW0xqWG+7PUaluz92Tx5z9IoV
tKsDjZi0J6cds7kPsf0SG1kF6UBaU8dSglPVM04ut6rnHQK4bMM/D8oghTDdwABR
mHTReoMbuhgGktDk9MfrF3hEsHxo0nmT0N3ahjQKAuqNuEL4bbxMgX2snhBQBsBW
iVTwIZ5tXnLBWe0E5Ob4Va4lFcoH6NNsYaPgMAx59BcUXZB4/p/McccjOOzmmDpj
2AQtfDP7q/RpyT70FMIJdRldgajgfiKpeZx5wC2/nRnjYgcISBwhO++7i0EgPapA
XDIDCgdaPqM4NYzVLLrfsy8BqTHp7d+P2vVwsxDkEonIxZ+pbBgasut/wGv+w3ER
fBlNM7/Fg93aA8Xb8RZT
=OLCN
-----END PGP SIGNATURE-----

--=-XKKSG5Ebx2kdkkWAvnkc--
