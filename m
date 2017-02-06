Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vGnvz6wWDzDqBV
 for <openbmc@lists.ozlabs.org>; Mon,  6 Feb 2017 11:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HKsFcc9a"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QZRWCEeS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C1C7208D9;
 Sun,  5 Feb 2017 19:11:53 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 05 Feb 2017 19:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=KG5TQGsTWSRFCreaEqzK5zE1TG4=; b=HKsFcc
 9atcDR6aYg2zCAekNRffwKIUXZWNfNUxSS4JaEBF0YbA4Mp3czDeRUcVJiQSnILz
 AhXVXx3+SURzNgS8HGNj/5rO6koNlXtBHgWZa4Fwt1Eq/TWE4wetpO7p5MqdcxcG
 YROPxrNTPHhVMb7zpA1afoPmLJmUQWkeyXyzM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=KG5TQGsTWSRFCr
 eaEqzK5zE1TG4=; b=QZRWCEeS8MtP/f4v/7f/s4yVrrQe20gl+x5L7+p0Q+NQHq
 4uRi5U0wGx74EPpNmBcJeouMQB9oU3dR9KPGHhcUpHrx2IG/28hxmM64JerAw4Mp
 EP7k+k7n/xjuNqictHa2qseiKLi5oNYSxYUMlDlK9jlquc3Rr6A+5b6Lb2py0=
X-ME-Sender: <xms:Sb-XWLSQJn5a_TEOo7cDEppD-V5r1IVxMpDkdBxVuKpCjknaPPrLHw>
X-Sasl-enc: Lk2D0780XPWLu1EiKqMM9a4U3PXur3NjBs8gleCc/Mkk 1486339912
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BBD57E2B0;
 Sun,  5 Feb 2017 19:11:50 -0500 (EST)
Message-ID: <1486339904.7271.12.camel@aj.id.au>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 06 Feb 2017 10:41:44 +1030
In-Reply-To: <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
References: <20170202042817.8033-1-andrew@aj.id.au>
 <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-y74TOyCYvVaDU8eZr9oq"
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
X-List-Received-Date: Mon, 06 Feb 2017 00:12:01 -0000


--=-y74TOyCYvVaDU8eZr9oq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-02-04 at 21:35 +0100, Linus Walleij wrote:
> > On Thu, Feb 2, 2017 at 5:28 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> > 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> > unresolved review comments[1]. Address the comments by removing the use
> > of macros from the consumer header (this patch represents the diff
> > between v2 and v3[2]).
> >=20
> > [1] https://lkml.org/lkml/2017/1/26/337
> > [2] https://lkml.org/lkml/2017/1/26/786
> >=20
> > Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Patch applied with Joel's ACK.
>=20
> Thank you for just tirelessly fixing my mistakes, I owe you one.

No worries!

Andrew
--=-y74TOyCYvVaDU8eZr9oq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYl79AAAoJEJ0dnzgO5LT5yxMQALJz2t0aMuoxyF6imtr6d9Qf
/T97921HvfOGfsjt5eLfIK2BYhXvclglzImFQJMt7sTfqSRJay4t0J6mC/fH+8Ki
mm4yqiGPPE9PXXV2D3+3XPjPrqsBYj/kWnk9pD4TnqOsTZg0OlgLrqb8CzglqJ3A
69kgTFUnhkb6aCPi8cosKkGALqVDlXzYloStiRmZxBvKvIpx76Er5bycxTE+8/1B
Cuiu5sWOlZKRto3d4KtNodOz8859gjGs2u+0Qf78hMLpGfCp2y9Ltz6HaNPWPRVV
kxIDm/500K4eJn3RJwFRyPLP7n/uU/FbnyhVjTzzWvMkINJriZREu2fwc65wyyhq
BRr5qv7C1XuEl9T3BDyj5tKz2zRP1i2kyWfpcYaEP1lZekgTz6K9Lx3Es63n7tJS
KYkbvauJlY7vVKZ17bfGyZiujbd6agk/lD3FDK7DFBNvdRgOaSw33+O/xE6Ycha4
dipPX9eEghTOevwhx+lC/CF4YM/qG+EpRL3cRZLwb1xptrxOe6WdDPDZyyQGt84i
obq6IWhUyIgyJN36CuoEvWnZJ1449ULoMyr9GO90zssMnudJwZfbdB8gbzDmptrR
ITlRczpTSLK/S2LRZEAWdFEdyG5xyk7QiECd0QHETo8e7KT0IE5wdpxzDZmrAtd8
HEgXFker/4YWMTX3EQ7B
=gM69
-----END PGP SIGNATURE-----

--=-y74TOyCYvVaDU8eZr9oq--
