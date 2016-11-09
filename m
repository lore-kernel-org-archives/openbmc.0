Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD7z32b84zDvMb
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 12:35:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d4ek2Wdk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="elFi2Wj9"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B586420571;
 Tue,  8 Nov 2016 20:35:08 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 08 Nov 2016 20:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=cco509WlvT2BIflGMkD3As7qhkg=; b=d4ek2W
 dkyPYt5L9O5CA1nknWi1rYcRM02qW0Rl8TQlpx2BrLMMi+upgNs1ALfb1MuBwgxV
 ns4RlMj/2tv4M6jyhaW7CA8Aaia3xnv00sazwAyWGPNJabUWMn0F0owkgrRvYgdR
 loOB56LMcSzMqwceJEfZ3ZllPxerDdv5P8pu0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=cco509WlvT2BIf
 lGMkD3As7qhkg=; b=elFi2Wj9oaA5PBUDNl4BoJbzefmoLREgzvM5xym61nSD5+
 AN0KOTwedgAG/ZndkLYvipblhl7J/LUesBWkmYoZo98T+2485fAuxCFcAI4G32aq
 mypo92vCpFDvbzXIOuwJ/oK5d37cTh4ibv1XsjyxjQnnX1DOcOZ2sUExBx3Q0=
X-ME-Sender: <xms:TH0iWCHDeugWYdKx_dHVQb5TasmH3wUB0lT7hh2em6FzTQ16MVTnYQ>
X-Sasl-enc: F3XxXIHjIwWQOE82dkss9PaQVXXFDIgxkpa5L7N8njGZ 1478655307
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E7BE3F29D0;
 Tue,  8 Nov 2016 20:35:06 -0500 (EST)
Message-ID: <1478655298.6206.8.camel@aj.id.au>
Subject: Re: How to handle GPIO differences between P8 and P9
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 09 Nov 2016 12:04:58 +1030
In-Reply-To: <CAPH-5w7+to8ch2w8LDYeh97D8wTKdNKdFvtXCYJ=KhbaL7nh-Q@mail.gmail.com>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
 <20161107161903.7gbgafvj6vb6w4k4@asimov>
 <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
 <CAPH-5w6jxPPBYPSh1NQF-vg2w2HJ7ZU_r50ttSsUsXDMPS3_5A@mail.gmail.com>
 <CAARXrt=FA=kTrjJ3KAyB03cuiBP=ka6BHf6YuNYh8x-DtyCcHw@mail.gmail.com>
 <CAPH-5w7+to8ch2w8LDYeh97D8wTKdNKdFvtXCYJ=KhbaL7nh-Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DfyQ/E0TaukKrtaljWWW"
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
X-List-Received-Date: Wed, 09 Nov 2016 01:35:12 -0000


--=-DfyQ/E0TaukKrtaljWWW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-08 at 15:38 -0800, Xo Wang wrote:
> FYI something that I didn't implement was adding GPIO polarity
> support into=C2=A0libopenbmc_intf/gpio. So, all the polarity (active
> high/low) logic needs to be handled by the application, which is less
> than ideal.

Ultimately this should be handled by the kernel via devicetree and
pinconf. I'd hold off on fixing the application because of that, but
there's also no timeline for implementing pinconf support in pinctrl.

Andrew

>=20
> cheers
> xo
--=-DfyQ/E0TaukKrtaljWWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYIn1CAAoJEJ0dnzgO5LT5UhUP/1AFwhX2RsJXuuGaMmx9XMCt
Gjd293AoUeaKGmh24H7cY7OazrR2JngATRy8XUoHDhPP8z0FzUq12ZKZglRGigK2
fr+Jwny+vxhjCJuVnPw2+kB/IAF8rudTIV4KXjq6XoOdVMN9VVQo1FwO11rW52HT
XcWsE9K4rLh2EzSCHpx6NkVOTOYBhYUkS1fUrsI6uCMrxALnB++hCpr2lMwyCrCm
/11xhb6Cbbgfa0LBUF82QzERPnkRxYR1dNZpybYK4D8++zcFUh1VOdhoq4v/Odyc
d7RkBhbo0J2T+rFX6/FBv5BNP2hDnGyISrdfW9rty4EpI0VCpQJnxI1PXsbKlFk1
s6N4HA0pCiWK/frBDGlSmPHZcT7KFtlkKGRG/nEmNKkHdDB32cuQ8Gk8wZ2mH+Nv
Td84RD9Auw6BllVp8Z0h7yxT97ZOiuciYL+fUSDvg8fNWehLxUCod+A58JAHCK7R
IQrk6X6qeAYEcGVftSSpHbVBJ6B7ca7oJ7awbdXvanGiUGCnnv4BWWL6A1rrOEO+
JxCliPw8ix7ShPBIARsppAH+SO6g29f0UbOzEYlmKXPS2hDLlDiqlqjy32N/EGsD
W6oiQDdKQK7w8JPmu8JsrE0WzUHS/QbsbnaM9UuS6kjaZ8MDl62QtRa6UAmGNgPn
hs/xW6LXEVH4n1pbEsfr
=X/qa
-----END PGP SIGNATURE-----

--=-DfyQ/E0TaukKrtaljWWW--
