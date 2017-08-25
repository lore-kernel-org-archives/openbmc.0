Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdhWt2yd4zDrK3
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 10:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cWiOEAvQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QGF5f92f"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0006120EEF;
 Thu, 24 Aug 2017 20:15:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 24 Aug 2017 20:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Fb9jDGsqNxp8Ic92cpcdslq2Z/c3JcsgAm1zY1pwp
 II=; b=cWiOEAvQignTUi9K0/8eZHElhw9FlF1ic5+qBfMYUCUtinvapyvEsY/E/
 O7OjGRLITW5seOC577n4ZdFEDhbqbd+5YVHFEq82207KCv7Amz/IIh1KTnTfzEDm
 ifwDSmUcBVzJmdiudnJdxDVyNJqTrPIVYyyYlH49ywTIXWNhqkiTXYxXcHXM425R
 0u+VDL9pGQRsSJmyFiM+Mg+0bkiHEA0qBs5bDLsiBXfSAXsfCDDbLm6frhvQlbcC
 uOgS89WTZhwQAJmkqYoLnU1/YWqD0EZibhBQzQkfmzhP5gXsADzmPlsVPe2o+bNe
 upHvZVNkVyzVDGoqTVmpiE6YQLzgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Fb9jDGsqNxp8Ic92cp
 cdslq2Z/c3JcsgAm1zY1pwpII=; b=QGF5f92fflL+37S4xnzrnPyyYy7bUQOMC2
 +mgFr4B9kYYbsMMBfrDtoGKKFumzSvSF5j42M5HX5yv7VFA3SlFArlVJDs66hvtE
 QVSTAgF26+bKJvboOBiEuJGOaU+7UxioaudUDhoCMbYW8bawTkdI2jFNDDEtx6zV
 MY0Zj4MnbV29E+4GaAVPFvi9fFAbR9WDnm7ISelgrMhmge0WyK5z1/gElGTgLoRn
 jLaRpinZzDAS8JmSKu6JDw2yrvebLSmZMEBq4CDn2bUcyQoUl9Q6UzuS69p6/rbs
 k3UlrydJ9+BrBTWGZioYof9+r0jZ7NCSXg8Ce8J4RcmkK1mVXw4w==
X-ME-Sender: <xms:J2yfWZvgR7O8pJHY-CixTcmUZPYZCw2-whj1QJZPcVqYXvFF-PUCsg>
X-Sasl-enc: ayiDGqs667Tojn23kcSRHziZ5/zzcgMT9LXhW8+syB5C 1503620135
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89E0F240C8;
 Thu, 24 Aug 2017 20:15:34 -0400 (EDT)
Message-ID: <1503620128.32695.1.camel@aj.id.au>
Subject: Re: Issue #2149 - BMC patching - service file changes
From: Andrew Jeffery <andrew@aj.id.au>
To: Michael Tritz <mtritz@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Fri, 25 Aug 2017 09:45:28 +0930
In-Reply-To: <OF4E02A31F.E0F17469-ON00258185.0073368B-00258185.007400A6@notes.na.collabserv.com>
References: <OF4E02A31F.E0F17469-ON00258185.0073368B-00258185.007400A6@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PdrnAPSfPAffXeZO1F8Q"
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
X-List-Received-Date: Fri, 25 Aug 2017 00:15:40 -0000


--=-PdrnAPSfPAffXeZO1F8Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 21:07 +0000, Michael Tritz wrote:
> All,
> =C2=A0
> Per commit https://gerrit.openbmc-project.xyz/#/c/6009/=C2=A0(related to
> issue=C2=A0https://github.com/openbmc/openbmc/issues/2149), service file
> references to {sbindir} and {bindir} are changing to "/usr/bin/env ".
> Additionally, we're using the SyslogIdentifier parameter to ensure
> that all executables have their output recorded in an identifiable
> format in the logs.=C2=A0Please follow this example for new service files=
.
> =C2=A0
> The purpose of this change is=C2=A0to enable patching from the
> /usr/local/bin and /usr/local/sbin paths - these directories are
> higher priority in the PATH than the typical executable directories
> /usr/bin and /usr/sbin, so developers will be able to patch specific
> executables without overwriting the files in those locations.
> =C2=A0
> Please let me know if you have any further questions.

Thanks for highlighting the change.

Andrew

> =C2=A0
> Thanks,
> Michael Tritz
>=C2=A0
--=-PdrnAPSfPAffXeZO1F8Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZn2wgAAoJEJ0dnzgO5LT5VPAP/2C8Sh3ZgTaBTOxVwzcv2XPT
jysQp7ZJXbOn5Dq83vaVOpqcYnFMT6XNnZ0OyKuNYjG1AIHsh87Xp+z7h8OZWFE+
+i7qI0h0r12NQTdJpmiCILGhzvLPQmTVxYEbyOYRAa4bNqoVAr3WlCwLZhxHYVUB
hOrRI5JXYZdNKv2wn/tfrLMvyPfQ8aGUM4nnHJWh5NQz1JeMan0rmJ8yHrH1yL7M
qF77QTVJivhK2r8PxB9Gng74bRyqzPIR3Q2RULo4oME8SIkHNarz6NbAT8rR4YJD
t4uT854BJX5Dg632A9OW5pT3jbvdTd8FYa06icTFC5vHNeGX8uxn1GVITLrkaOUi
wVM8mVhZqSXHV6ZWbBW5iqEOZ+yQVEsGxP/eIK3HoCIO0urhIAxw45Qj1xmcBWDx
PnPUMm9itLhfh7hlKSSqmjsdM93qTO9WBKg+uIxAX77NlPnkDc9RBIcar7cmL4x9
KtfGDXpFwz66qMT1Oy+Zq7mbPGad2EVczraxovFyWpi5UFDTUzDHW+k9XbD1SfZV
by/JCdMu2jcyjPZoDHcuO72i2nYsIrzrhHVits28pHMB6ZSrx7e8dLslWTywRhHK
hRCYzH6OziGwn99YX4+vMYfLrZwJwZ3UKU7r4e1f3pMy/wE3ehzeH898VUoNHeql
GmYQPEIe57AWbVCTcN+/
=I4XZ
-----END PGP SIGNATURE-----

--=-PdrnAPSfPAffXeZO1F8Q--
