Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhqxv3G9rzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 13:00:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lBzCAO00"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Kr3bOJe0"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A977C21629;
 Tue, 29 Aug 2017 23:00:29 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 23:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=M2wUhlWLaVgrVy4GuLKnMDKPMBdivtmRQkYOug2CZ
 YI=; b=lBzCAO00DTJOGZzKTr6t3cz4lbiYpU6gry42y+o6wEPfDUESAaszLm04o
 vRh/zzzuQb1Nk8jhNAG/0LrtAbomnxTTTPATmKui7hQeFDFcvfbvjFuxALUnfv9z
 LFWkC8kO93jhsR+KPIx+cQu4XFrd3JAIavRSseevPv5irCrBqY8Ss4wpj2bgmfIV
 00fqbQ8Vgpoj6Vd/V8M3nCqkwaW90jhxXSHfPW7eWg7Pm3qYsPuNCMlTYKMdAYGl
 auU5vgLApM8faOmr+Hhk/sg8DA9rHKU6MaQ1B7gY3MWlIFy/Fmowu/hgZ7XM90GQ
 pUG7r0iXReAfuCvC5oIPHxpvoaxhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=M2wUhlWLaVgrVy4GuL
 KnMDKPMBdivtmRQkYOug2CZYI=; b=Kr3bOJe0E5D5ADtHk1P7mNixnh3MHQEL4F
 VxBwT9Ihg41OGt4b7hLYG3NILH1B9XbTtSdoAjRLeQwnbxNClMJ6qCiSiV8wTiCq
 D0f7RlPuF0kqL7HdT4fDM/kbJOM5MqEDdVMQGXL5TIQHx0WCHUoBGPsvGiktKITH
 7y5apo9G9BcM0SWRDs9+nTI3Hbkn+/XvBcl/JRMX0uJS4J9tOMRKCCOvHvAuFsSv
 MLDsfPVkJxtoJ7XveUfluvCeL29DGBO7XhmKSbbIL0iN6ySA7fJGMlqGRsx1NvDF
 f/PF0OVIMvjeAd57UmVx1lDekbL1EncD+w3Xey9sF6qOGRzgnF2Q==
X-ME-Sender: <xms:TSqmWavbEFs9vBWBmi5YA1yV8yLRuBRpfYdhBKCktkmIDEu2YUPQDw>
X-Sasl-enc: UauNDp9Z2uKiyuRsYg99P4lsxLGAdPD943UzRr7xMXsZ 1504062029
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 400ED7E1B4;
 Tue, 29 Aug 2017 23:00:28 -0400 (EDT)
Message-ID: <1504062022.5933.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 0/2] Add user space accessibility for
 ucd9000 stats
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 30 Aug 2017 12:30:22 +0930
In-Reply-To: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
References: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+rlDXMWHY9tAGNSDAzI8"
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
X-List-Received-Date: Wed, 30 Aug 2017 03:00:38 -0000


--=-+rlDXMWHY9tAGNSDAzI8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-29 at 15:08 -0500, Christopher Bostic wrote:
> This set provides means to allow user space to access various properties =
of the
> ucd9000 type chips.
>=C2=A0
> patch 0001 Adds gpio_chip interface for user to access various GPIO pin s=
tates
> via the /sys/class/gpio interface.
>=C2=A0
> Patch 0002 adds a debugfs for mfr_status information so user space can ga=
in
> visibility of gpi type faults. Note that there are limitations on type of=
 devices
> that debugfs supports.=C2=A0=C2=A0Presently only ucd90160 is supported.=
=C2=A0=C2=A0Any assumptions made
> as to formatting of data is commented inline in the code.=C2=A0=C2=A0Any =
expansion to other
> ucd9000 types will need to take this into consideration.

Thanks for improving the cover letter!

>=C2=A0
> Christopher Bostic (2):
> =C2=A0 hwmon: (ucd9000) Add gpio chip interface and clear logged faults
> =C2=A0 hwmon: (ucd9000) Add debugfs for mfr_status info
>=C2=A0
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 404 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 402 insertions(+), 2 deletions(-)
>=C2=A0
--=-+rlDXMWHY9tAGNSDAzI8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpipGAAoJEJ0dnzgO5LT5/LUP+wYtlbRS/tmNxc+vYCzbMALB
njYSIGVD6GQwbIQLQCvWZbA7k5ET5F+TCmjSRjmDrueEBU556y4PQ29LYuccwdyD
pycVWKx9NKSzHcKKI/0IA67QliCWbUmPWwrVTuMbrP2bkk3pjPFwktdwEOaFDcNf
kR4kjj2r96ZYyyqU69JvAEPjvpmzEzI8Jhr6X3tCx3h5Fts1aNYocnkn26SN1GSg
VuwZzHHkKyNBwaVfgw8/RZa8PKlOQ+E6zQBcA8gyozzJWJtv57PHHOfdyPGEa6rb
FGN7LfUGsRzF0HTYS61K8f43947m09PXhMKsFHUMRr59hR972rfOfZJfzXce7jjH
ZpC9AH0Z1yIiSpTWjWxxNuc2AvLMo+Lw7wkAsmouQgPaNbWmygd8tJ/Ls98k+Ubh
XFVUQQfTbNEY6pOqjKFHhvYksunNsTUWVV9zxhW7DpBQG7SICwKI+eaLBWkt1dH3
zIneEUyQN0hCtBCUaH/qtfQ0yNCRRSJdWs0XE22ioZgLb474EsCrekm/8mSLBYwx
LIrP5HmUXNptoH8N9nD5+UCQ+JTA6sb4KALN6k/Qn94UyKB9VSXG4i1x+EZct7VM
MprpcIKuaPhnfxX3EOJ39xzXo1MqKhPtQqp38CkLkHhRsueck9e7IkmhnPc1/mTv
6eG87CRjKI+wZzXkmB8c
=1Md4
-----END PGP SIGNATURE-----

--=-+rlDXMWHY9tAGNSDAzI8--
