Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tY4Rx00v3zDvk0
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 01:55:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dfYUxToT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ryTMMCIE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88375207D4;
 Tue,  6 Dec 2016 09:55:21 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 06 Dec 2016 09:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=QYr3GzzAb2tgKenMkVRoQYJZQCY=; b=dfYUxT
 oTt0IrXJ3coJP67N/Ex6EXHe92tG9Ly8oWCCgiu+GdfU+YvZXwPe9WsybyxSE3i9
 nlWmgSCHEfiR28RtxAad4rlMkWcCFhHUw94dnGnAmAJthThOu6HqyisiOtiBWEOR
 YcAFvdT/PfJSLPLJFjCHX2rUtgLdPtBirLyGY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=QYr3GzzAb2tgKe
 nMkVRoQYJZQCY=; b=ryTMMCIEDSSCV2UgYXitTKFVeVAQGPhAzYwZKBch98M5H2
 yQcTY9iUAhiLYySAN1OM/4DMd0wtGW09yaZr8dkD4GWSTMwZvEu6Tho8lgPHGNYg
 tPJOzvBlanYznHqeEMM9RvlRo3d7fCAfhh/rmcH8U5RxOuDQ/4yHjwxP56Xf0=
X-ME-Sender: <xms:WdFGWMD8AnP9lG4Xeux6RUzLU7Mvb-3csxFqbYNYaQ8rdX91cN_gTw>
X-Sasl-enc: cwtK8vpgjhS6hm0tyQj0rbWrd3CPhySfBXNFQ4VNqRd+ 1481036120
Received: from [10.2.1.29] (unknown [119.17.37.46])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8F9D7E808;
 Tue,  6 Dec 2016 09:55:19 -0500 (EST)
Message-ID: <1481036112.7840.1.camel@aj.id.au>
Subject: Re: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 07 Dec 2016 01:55:12 +1100
In-Reply-To: <CALpMbdmjvqdmNQ6D96=2X0LmdCN0mf_=bEvWhjbdR+PWxKwqbw@mail.gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <CALpMbd=ORWLG-D69YBr-xZ_E1zm=JtWKjeWWuMjw+sLFX1NbQQ@mail.gmail.com>
 <1480468149.2503.100.camel@aj.id.au>
 <CALpMbdmjvqdmNQ6D96=2X0LmdCN0mf_=bEvWhjbdR+PWxKwqbw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-c8CkQ3YTXCjnP/oGJbBB"
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
X-List-Received-Date: Tue, 06 Dec 2016 14:55:26 -0000


--=-c8CkQ3YTXCjnP/oGJbBB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-12-06 at 08:53 -0600, Eddie James wrote:
> Hi Andrew,
>=20
> What's the status on this? I last sent out a tested patch set that I'm
> pretty happy with. I'm not sure what the next step for me is, any
> ideas?
>=20

Sorry, I've been busy on other things but will now have some time to
look at the series. I'll take a look in the morning.

Andrew
--=-c8CkQ3YTXCjnP/oGJbBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYRtFQAAoJEJ0dnzgO5LT5U5EQAJZ75pmtcxbJDvTkdytNw0Gs
eywsWu/6Fr+FGaezbWL4P6vkVSCDTxcPPNYa3ba/fEBmrnYZsXngUbNoa5cFq5O6
Njseh6QFR1nwYUgqu1NDo+7AvAJbzWxUoB79hMEj1Y2QGpY8x8J1qb6Q6o6e3n8d
bVq0WGmLbdLRj3AnzArv3LmYFexz6vywKGOwViwe3D86eMOS7o/HfxyuzzcEOaoM
cyWMf308JLbSaeNLUGHNllMpD77Mas7qYDR+apoJg3NCC9hnOFJyNALoHuXcr5zS
6t5RDWBCiZXGil63FEMEBcw4UutBEY+NI0zdqfjOaLeTdUwpAomIJwZn20prXlXq
ZE5SMtKRHkRtzhi9JVn74aKzRnP9rnsG6fpny9THZPVJx6f3gxyTqG0MXRupvd7c
kxBjxg9VQVcOIxBJ4xJt/K6O5hC37zztOQASB7G5k2jToQzNVSx9fSJDdFM/8lAV
IXP+ZYn5RAy9WoTKx9A5kpjpJM9QYOERM2gPs1C7TkvJ5EwmBqivHZMUvoF8l20N
7m+JLipVS3jWI8IgWaAEQCg06W4WkPwWxsR4qxbi57FQEYpBDXsaTExy0ZfrJ+Ia
uzdlKFfGml43lGKVXLqaF7bHbr5XpKE77wIoTkCQZyF4kIwsedLu+OldcR2DqJk8
AfpbXmhnbXZb1b9jnR4I
=RTzw
-----END PGP SIGNATURE-----

--=-c8CkQ3YTXCjnP/oGJbBB--
