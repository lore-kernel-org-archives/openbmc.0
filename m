Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hTxpgrZz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SMCS+wE3"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHl818FRzDqBc;
 Fri, 20 Oct 2017 18:40:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DDBF20EDD;
 Fri, 20 Oct 2017 03:40:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 03:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yhXtevl2jz+Zbu1BWAjwnIJBBipBzOE1khAby4b99tA=; b=hTxpgrZz
 612xQM+zdqnkv7fNkvvaZW/EH2BNZsZbxg7v6nN5MKqzsPzh8VMuGp1aQl9oQHK1
 6W+0GmdXRyxIHfQc7Bzt09fMt0IhNFwjsIBTLYuaWzSMU4ll9X8ASPVanst2rgc4
 apZRq4Rg7rYskcFN4jHHMwAHEnUAS/3NdtzO5ATWHQOZg66clKWNirAMQfsHD5aw
 r/0YQ+bmPzNlYm7dyAlwauPByjdCgqq27/1LC7q5pkXxFMY5IwvzKfYjnvRj5Ykx
 SwP2dUvYGcp6xZeKZ3WO/IhanApzgw3BXth9JJbVHQa5UEsZgjFcCIfmUA4xZ55t
 xRziw8B4RrToHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=yhXtevl2jz+Zbu1BWAjwnIJBBipBz
 OE1khAby4b99tA=; b=SMCS+wE3auwGWfqUjsC99dTeIRs12oz9O6BMCRObIvJFS
 A2v08WhsYuvKuo3WaczxDk0IGF5nZc9+iAIZ39ESkyoGWODrWiGBLHl0WJPORHdU
 H+ZOdOHXiEvGEiV6j4P1yDSwkw+MiOieHyu2SozkNawImBZ2YWQUZRmwsfyFAt92
 wGpJDwJYVQ2yUMJVz5GZc9CAhpKraygMG89f63oprJMnUjqaD3SyOd8jUNCw5lpa
 ddhzCNT3i/8zqpFKpgtS6HP0YjqVlc6BKL5HDcSbFY5UNEjXUrorgWSpcwb77m+E
 7jR/yxCZvu+oe+52dgW2+nafZAMBif4ixoiCYY3vA==
X-ME-Sender: <xms:YajpWTNE6zUKMUfKHLGmRBe5ziAEHR3Ozxd8B1HJjWXpgOJ-9iz6Jw>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1444B247DD;
 Fri, 20 Oct 2017 03:40:12 -0400 (EDT)
Message-ID: <1508485208.24322.46.camel@aj.id.au>
Subject: Re: [RFC PATCH 4/5] gpio: gpiolib: Add sysfs support for
 maintaining GPIO values on reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Charles Keepax
 <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan
 <ldewangan@nvidia.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  linux-aspeed@lists.ozlabs.org
Date: Fri, 20 Oct 2017 18:10:08 +1030
In-Reply-To: <CACRpkdZ9HpXXuauRtVjA9n1dwF3sUQ4gJL-FOUMcMBDCL9oxYw@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-5-andrew@aj.id.au>
 <CACRpkdZ9HpXXuauRtVjA9n1dwF3sUQ4gJL-FOUMcMBDCL9oxYw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nXOZj63Mu4q9oJeJSRLo"
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
X-List-Received-Date: Fri, 20 Oct 2017 07:40:20 -0000


--=-nXOZj63Mu4q9oJeJSRLo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:29 +0200, Linus Walleij wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
>=20
> > Expose a new 'maintain' sysfs attribute to control both suspend and
> > reset tolerance.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> NAK. You will find the actual ABI documentation in
> Documentation/ABI/obsolete/sysfs-gpio

Right, I did a quick grep to find an attribute description in order to
judge what documentation to change. Unfortunately my grep didn't pick
up this file.

> that's why. This is being phased out and should not be extended.
> Everyone should use the character device, especially for new
> functionality.

Yeah, I expected this (and the NAK) would be the response but figured I
should ask the question.

Thanks,

Andrew
--=-nXOZj63Mu4q9oJeJSRLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6ahYAAoJEJ0dnzgO5LT5P5AQAJrlMhDzuNBwIw7eJYSWCeNo
lkn/TYioF3Akxcwd6Y99FRDwc/GhirezWLgIJBKdSOCHSmPB8c1Vmb3QN/QMxCLT
Fe1qqDmDJ/V0QKxit6IboAO+/SanmN07EyPfmY3+2jlgtDYBJZESbD6ePU03wgGz
JwXnGcSnWyV1wfHHz4LeHhJj3TXQYCqiihELLyBis/9jF3wKUGQr2OE0eRM5Dq4D
xx4MlTZneasu8qLBBMP/ZC50lBLzDBS7VQ10NApT5W+msohvnLzGM+vKjF/3j5X4
zLe/6RHerMV/gfqI4ZnzTd7Iyhal2+4gbuZCiWPz0hi7LrhqZ6YcI8XPnLVtE8rG
vjvy7ErtQ6nz8paaSLZ4uFi5dlw4TMHCMKvIuYUWHkN/BeAy06F6oyJMq6W1C+vm
YIdzXY/Xdnudg4Af2PXcO4AbIxQ9UAgDLAwR/7oPN67Fs9SP1dewdQXApwj6+upY
1za15ZmwivdXylOSquk9q4s/sgsyfnrzMe+h3PUn66ZCA7sDX1XH0vffh8awOz3I
oqyyhsOth86z3e39uQeItHoxe99thMKcsXImeL8Tf42CdOcCOysBqu2np9263gOl
LNAQg0qYH1pXYP2ztmX+uQiAFxvqL3rQMLmckwrptvhJbGZ7NF0aI46eti7myfaL
NswkUQ6AtK/lJ0wQ/+Te
=7t2h
-----END PGP SIGNATURE-----

--=-nXOZj63Mu4q9oJeJSRLo--
