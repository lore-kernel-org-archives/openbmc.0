Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H8L2V6tr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aSOmicC2"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9ySZ1QNNzDr4T
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 11:20:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 07E2C20D22;
 Mon,  9 Oct 2017 20:20:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Oct 2017 20:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Navm3JJJOMVsgvGaavsBnXNHM16xbC8kQHlhWmKGa
 D0=; b=H8L2V6tr8qhZOh6JsmEUT7auDqQixG/qTz5bzLY7T6ST6TRUdnQCo46Jj
 u2P4BMwyAn8wq9HMi1HjaSRdJVwQuetXhjibCu4PrcoOopvEW2STK8U4X7B+lZE9
 Yr0r9KmZrdp00TS61DZsE1Ppstb2GCYGCLYlm6wSeKJqZiUvqW3Gm0gROHE5VDQn
 bx5lxERzkH+RWaxQrMIXuIDLEM7t3bf4JaFuRAQsQqD8fp0ewn8QRfipEnvgJCwQ
 Ky5LDntWYtVbp/vdlsn/QdN+i79dVquEK1MPSwV8WSXRvCGhJApbkXb6+IygyBpq
 XnhlVBsOzNTmQBlV6+NmSnJuroO5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Navm3JJJOMVsgvGaav
 sBnXNHM16xbC8kQHlhWmKGaD0=; b=aSOmicC2xhCxxhrYlgnWMRT7hUaSpUANl8
 kDYqeigcBX+fjtPCSH0Y8vVn6cjHshvG3IHunGjhrfQkp45jF42GwDEqkhra6vyq
 KAqDPHtW77w23c31OePZn1Mmn7nnDSmz7VLeKapwzEviR1nsI7UQIGHFrDEMVq9+
 IMj0H96ufHyiubQuKiUXIQFZ53e6Xvj2yZI4BzsnMMhOGZaA8MDZAEAfS2J7Otgh
 GElCwxAeftspWNM+mHmwwA7r9P5uuIf34/grQFq0gT0PyrPuqkwFeD01HJOxx7nA
 afGu2BeieWja0eOakYAewnAV0B9HAxnU8S5Re6l00cV/qpIAd8mw==
X-ME-Sender: <xms:WxLcWR6UvwaCCJhvXOeDt_nIpECZalUsqPpJMfaH3e767RjS4GNKhQ>
X-Sasl-enc: rswggCRAY+22QTiGZOtZnD+sJ47fwVrNQcni5t2VVtKz 1507594843
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D1857F92C;
 Mon,  9 Oct 2017 20:20:40 -0400 (EDT)
Message-ID: <1507594837.5452.158.camel@aj.id.au>
Subject: Re: Moving to kernel dev-4.13
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Eddie James <eajames.ibm@gmail.com>, Xo Wang <xow@google.com>, 
 tomer.maimon@nuvoton.com
Date: Tue, 10 Oct 2017 10:50:37 +1030
In-Reply-To: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
References: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jCCbIiwSBftXhACJOV7W"
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
X-List-Received-Date: Tue, 10 Oct 2017 00:20:46 -0000


--=-jCCbIiwSBftXhACJOV7W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-09 at 16:34 +0930, Joel Stanley wrote:
> Hello OpenBMCers,
>=20
> I've pushed a new branch to the OpenBMC kernel repository. It's called
> dev-4.13, and is based on the latest stable release from the 4.13
> branch (4.13.5).

Woo!

>=20
> There are currently 40 patches on top of the upstream release that
> include the patches sent upstream since 4.13 was released. In
> addition, there is the new Aspeed clk driver that is out on the
> upstream lists for review.

Have you looked at my reviews on v4 yet? They're not all acks :)

>=20
> If you wish to have your non-upstreamed patches added to this tree,
> please send them to the list with the [PATCH linux dev-4.13] tag.

I haven't looked at the tree yet, but do we have a list of major
features that we expose in dev-4.10 to match against dev-4.13 to know
what needs to go in?

Maybe that's a lazy question and I should generate it myself...

Andrew

--=-jCCbIiwSBftXhACJOV7W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3BJVAAoJEJ0dnzgO5LT5SJIP/jDjvUstf+ZMKaF/JL7LYemg
JdJaw505pvEfyj8/s25RdbrJnU4kYzGazhVT2py5xfeTjKjtmqj4t2Y/t9M1KGhE
7MrGHZ/02+mRefcyMaxY0zL88QuGC7WtERB47mj94AFh9l4YhOo5Z1rr3mb+1Ycg
Moe6dnglrxa8YiKAfQmaM9ZyStMYDjrTvtSEfe7ORLx42IU4PB75nyveT7ZGTU9W
eedk+AS0kq2QlRXgAoFgWuNSCkhU1GBeQRJ0ynxyi/OfN0bbDBwmNLubao3rXpf4
p6RJHd8Jn36RiPmXd42XBo1flrQQwqC9M6qRZaR74b5qQ429uH0idgkHYBwUZBkX
1MaTKKr/JVUyzEvAkR7LjW720Su6NsjFgjiJ2pi9nDAg7NC8Hq7vHxRwgl6CynYp
5zi+B/NQsd2TU3Q48qpdq9iltlqJUGGvZxpWeyCMhWRauW3Uy987Ktca7vzR0MzX
G1WpRNITxjNN3p0EWwd0/nh1yLOPv1j161+Xchv/Cud1PvYN3aFu04WpTef29L+s
U1KT+WBhyVhUnFF1uBrNDftb4yIwQV6yAAihVwshTusnvmE7AJtp3lJSOItZ16K2
6G19IEzZge7hZNxn38lrMGVuFg/6nSw8X2Sp5vfd6YWHNL/0UVUE+7bjn/XA327h
9SitxGybBk37t01fqyFw
=oIGr
-----END PGP SIGNATURE-----

--=-jCCbIiwSBftXhACJOV7W--
