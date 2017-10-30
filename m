Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ElUyr4mY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nfrV63yq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQLV06gSRzDqmt
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 15:04:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA46A20AF8;
 Mon, 30 Oct 2017 00:04:53 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 00:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=6Cs1VT14xbHSP+XBCnEb+CeOBtEhAOEq/IjDY6OPVeA=; b=ElUyr4mY
 Q7vymINvN25h4MBaewd619dkZrSnKssFdVOMpwYhjAFDvX0UXMbENNUi0UaLX3oP
 Hi2R/0bFKOUuUdOvchQUYhTjpNzQ1tlyw0i2cDhUI739TmM3XAhKjYTOQ8aTgw5v
 nLLo6nIvdncwCXlq3B0KMRSLCIEpXnZP6EvTcoSUAv8xd43jZyimHX/kLZAEYVZw
 /TJY6BZnkzSwlrwaUeLG1o34sFLvzEJfMQeILHv5cMaiEfpe5L3XQWxTrEnRhNql
 Ok68xCE+N5ZM0S2jFoWyR4Ej4PKpp4Sw+wXK+spz/B7Pb5ymzy8xtyL6pJAhID7/
 uJqpUc/7z3L+4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=6Cs1VT14xbHSP+XBCnEb+CeOBtEhA
 OEq/IjDY6OPVeA=; b=nfrV63yqUUP5MoJXbRBTcLpQVmLPmQUOpXdTqxl28raB8
 U7ySyGOdloOt6OokNm6z4jzRjxrQ6nKCqbE3sdMweWpOLSdjKJRtXQHnjvcd40Z6
 0aRAaY47UiPyPd1S1q7I6GFpXIaMqKR9+ggGhcZ0S5FW8hwFazxjV0+2bs+kBiZ/
 YIZP4IVP676nhcd6OQykHTywf6WJxD4ZhTvHF/7ZKUYXKt1h0VJfKdMFPDn1uyk9
 9fqH0/v5bHHoslYAWIO1IyDDSQzbMfEQbOtsrbEdKXDG7Ac/qwbHVrSesvyLlTxz
 JThZ5p00T2YuKj+jakkFS98cPYLDCwzM5MDupABRg==
X-ME-Sender: <xms:5aT2WS72Kd_jpoUIDSLk-WCwPTxN1BxwE48aPLheAuMTpj9Y3_AgqA>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D4ED240A4;
 Mon, 30 Oct 2017 00:04:51 -0400 (EDT)
Message-ID: <1509336286.13477.21.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] fsi: core: Allow more BREAKs to recover
 a failing link
From: Andrew Jeffery <andrew@aj.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 30 Oct 2017 14:34:46 +1030
In-Reply-To: <34b84ff0-4f65-5537-d6c7-272cf2e3c6b8@ozlabs.org>
References: <20171020173237.76535-1-cbostic@linux.vnet.ibm.com>
 <34b84ff0-4f65-5537-d6c7-272cf2e3c6b8@ozlabs.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ug51zqzGftYs/nd9cq7H"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 04:04:57 -0000


--=-ug51zqzGftYs/nd9cq7H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-23 at 10:57 +0800, Jeremy Kerr wrote:
> Hi Chris,
>=20
> > Recovering a failing FSI link can require more than a single
> > BREAK command to reset the FSI slave. Test results indicate
> > that communications can be restored when a second or third
> > BREAK is sent when the previous attempts fail.
>=20
> This seems somewhat suspicious to me. Do we have any indication from the
> CFAM documentation, or the folks responsible for the CFAM implentation,
> that multiple breaks will actually cause any difference in behaviour
> that a single one? Or is this based only on experimentation?
>=20
> I'm worried that we'd be papering-over the underlying issue here.
>=20

Chris, my understanding is we're abandoning the approach in this patch.
Is that correct?

Andrew
--=-ug51zqzGftYs/nd9cq7H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9qTeAAoJEJ0dnzgO5LT5Gw8QAKeGyc5hlio9RcD0FDZCDCmM
Q63qezgDuGDXSGLda5gNAcOvyk0M7AQFGrbHpNwQhMUsG+U8CW4yRSa6aJy5qyKN
PVZ5sG3hulL+Ya1vCT2ugO+Ku2Z7bQMfFO83anz4RXX66HhDPOnmeDysOXdLgBth
m31yVENlq9AYxDYbYM2ihTXzdlYf9EYoHkaEVATvEkYCi7M3aVPp1czRb9ZsCkA3
Z78/7hbIxkCToSW1KlB2Gcq/3kMNOpFESfx/s4BYk21RfFLvtULk3roAQm9jJduL
j+QTqRLF6VlkcZT+wYtUXYI8gaXS9x7/TIaM2frLm+coqrS89zqqjMNssJdWuaWF
Rll2JuEaej80L1ogHF3jwipzyRA8ZhOVDbMpMJjCzo+7jOJvpaxhLo3vaPruvdr6
betwTS67aAEgPuFwBjqGBfjR/UCxWYxlte7nrn9KVxeNV49EqJQrfO2K2Dq/N07H
bp1ibeZsR1LB8TyM9tGKGA5esBcnVnHjk9V2rn5uzpv29OpESDmuWhJrh+CDcFeP
eSrbY/78BrNB1ZAAq8JJ/JQBBKwL94oP0t5pED3kzuIKYR3F6EPVcJMtxwxeOWwn
gkjPn0kz6P/W6jO/dA8IKKRnBUd6gh5z9QuQ2v0QX24tb+ZIzi1mjP64Euk3WbeC
8JCZg+6wJt2GHifY51PP
=otSj
-----END PGP SIGNATURE-----

--=-ug51zqzGftYs/nd9cq7H--
