Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fUi5eh+l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fs77TpZr"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQzG83CsVzDqMY
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 15:41:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E23120D6B;
 Tue, 31 Oct 2017 00:41:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 31 Oct 2017 00:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cQ6Z4AuqRtNDGLplXXuDJbWb0i7mzWyuyc7uC9423JE=; b=fUi5eh+l
 u/r5ilIUBvCt6gO3qS4l1AjoC/9YEzbOpUAgZ/KI4a5BwSnvdm0IzbnTsRM9pm3F
 jw35UwQ4tsYQBoEN7pU7xfN8P9MRJxIYdlkXNrLsoZ11p8vyKcGjth2luPitCba8
 fW29xKSsNr0szd+6hglSjRbti8lm5RFmmmwr5vp2VoLbWb7kZYrtNUHDuYpD1xXn
 yiQ0qLb7Lvc70LCCuZXw6XvOuIbAUFh/7UqKXPOJ1EkKS1MqVIIUOlS50O7MIgxh
 fT9xEqg6UBmKDDo9yMLjIZxycGgTAdHhGDTlBYFWwvolP+gfcZWEb0m6jyqja8z5
 rEQeJe/TS8Fv6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=cQ6Z4AuqRtNDGLplXXuDJbWb0i7mz
 Wyuyc7uC9423JE=; b=fs77TpZrL+2mXukC+gKZoGs3uBRcCbrloTLS8jGjPxghd
 y5B9Mx8OrLEc5g2Ozckt5WGslGNDC4P9lyGY5KfUDbX/28U9W5+O8834QJQ+4UFQ
 yGOOyDk7WmwgzSAGFUlHNQeGlNw58qPgf8hc6H0pZD+4RcKfRKFdnnuAdih/Wpyu
 rJfSPOAbZw/vQmpv82frhM1SQ1ETWciiyEMBfKybWExMpprvUh7YcL7HDWg9P2Gs
 CBBbleW9JTO3fX/0DVlMk2cATwkpnEI7xQDwJ3evXTh9X5mjaX4LCmoJJkugY7eO
 7Q1ZnrbztcZmqDTvGGSD/OTKQocmWRCpNiMzGmPtw==
X-ME-Sender: <xms:Dv_3WQfZCV9k-lh7dT2g5MZ4ClOUz-k9DZWDKTvrUuPGvqpLxdFmXg>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47BAB7FA90;
 Tue, 31 Oct 2017 00:41:47 -0400 (EDT)
Message-ID: <1509424905.2263.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4] drivers: i2c: fsi: Add proper abort
 method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 31 Oct 2017 15:11:45 +1030
In-Reply-To: <1509389005-14205-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509389005-14205-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LxxxO/V9o5/V9u8hzrgC"
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
X-List-Received-Date: Tue, 31 Oct 2017 04:41:52 -0000


--=-LxxxO/V9o5/V9u8hzrgC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 13:43 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Driver wasn't cleaning up on timeout or in an error situation properly.
> Need to do a full reset if we fail in order to re-stablish a good state
> of the engine.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

Thanks,

Andrew
--=-LxxxO/V9o5/V9u8hzrgC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9/8JAAoJEJ0dnzgO5LT5CIIQAITKNp15U46Lax0pxcwNgCpN
whnKxtrHxPQeGW43f52lZVX9ePxo48m0KeY9hexAszP/RHSFibLjzi4RxOgpEqeq
aSmcP4iocY5BC6yBvrTkNlU8Ib7JSAyp9r0tZBZoj8QRRMYjhnHAMPdyemuXgkY7
rMwZ0oW5+BL87jKSxQ8bWNpGzUNaV+dcAbgwSVH1DyP92ZXw6GHFykNmA17QSE+f
zdcRxMTKWCLugnncEfETn1S05K3sX0YKUcMV6hOPZRxI5Lg2MqbOX1uhYMFNSPpN
s5X03AU5AC0PmxAbY4FtZGRTAxZ1iJVNlw9j6qNE/D4CbNwgFWQGwKD6epH9UtwP
pel4J1NnK1aKi23EpZvdufbp5jEdJEU+oUVFQJ05UoG8Add+/FV708jK35QDmmJZ
WLFKo961CMUCdVQ5I8m+OpQMyHXI06vUd04waokdpmoIifGNHL6p5sdgpqONaCuy
LM9yyers+pPPMCKNAjKRjaWVq+vLrrkj4RbytBrFn8XppdWMUeseuBPhDksHjXyQ
wJKW3cbAUYx7NOHq0w7Icy36lVo/1ZUUPAavEhl3fsoJ14fofkOVn1ViSJZlVgjO
gOWCG13JjgJOlyAkPmBXMI3/DSiyUW6YDsxXIuM257g4toKBxgr9azD3Ht2dSknf
flbkrlJFA29QxzMgTBDC
=Pg7W
-----END PGP SIGNATURE-----

--=-LxxxO/V9o5/V9u8hzrgC--
