Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfpZQ42WVzDw3P
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 09:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h1Fo4lQ2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="S4gA4hhr"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E0975207BD;
 Thu, 15 Dec 2016 17:50:51 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Dec 2016 17:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=C9ZEWamxTVxWmlTy2JheM8zvfNg=; b=h1Fo4l
 Q2HtZk/5O+VySj4OM/IgNR8w5mH0ArdvLXcy7DI6Y7On2V4P7TAn5uJamhyctX2x
 QfXVOUdFeTHOLWNaBS9DuCa2Yx6OuGHIic/ooB+PMn9KTRgSN7ig2/RDji3AjLhA
 yFRjQbwmjrtRJk8cUdqmbGHqucRIoFuI7WqB8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=C9ZEWamxTVxWml
 Ty2JheM8zvfNg=; b=S4gA4hhrFKDeURrTMSmSL1zYD+ariEuuhrPZyigdIOQte4
 rIyUm2e8UVcOJeCs7NslIIYDlQYhfRfDTbDyTeN1JD4HiAYQiyiVidqptQw6Oeh6
 nJ4G4SjPV46d/05ZzaCxFHBqwnU1AsKEqzormVdoLZ6iTrwOxM00BUt4Eg0XY=
X-ME-Sender: <xms:Sx5TWJQIjGbqsfkqoITr74vVw4oxOf60uFEuvnHplAcpt6VqysBzJw>
X-Sasl-enc: EWD98Ehvfqoiqv7uENFXkbyGLxOVl/MEal5BPI2NxWiR 1481842249
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A5FB7EA90;
 Thu, 15 Dec 2016 17:50:46 -0500 (EST)
Message-ID: <1481842236.3112.64.camel@aj.id.au>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 16 Dec 2016 09:20:36 +1030
In-Reply-To: <1481788767.814.8.camel@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
 <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
 <1481788767.814.8.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1M4SCcFTSxRQU8TO9GtI"
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
X-List-Received-Date: Thu, 15 Dec 2016 22:50:55 -0000


--=-1M4SCcFTSxRQU8TO9GtI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-12-15 at 18:59 +1100, Cyril Bur wrote:
> > > +config MBOX_HOST
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ARCH_ASPEED
> >=C2=A0
> > or COMPILE_TEST
>=20
> Is both a good solution?

I think Joel meant "|| COMPILE_TEST"
--=-1M4SCcFTSxRQU8TO9GtI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYUx48AAoJEJ0dnzgO5LT5vK8QAJB9lge34bO6ajk1BErb5pd7
keKRv7kAlxCYG46CAFFv2t9+pOywGGtgLh7TEceX5gYQ7QOWw6Zkdc47efcopVyh
Pq3d7vFfSLll2NghF+bTeU/eGLSz4P1L3gcWrL+fOkc4ReZyzqHfUG/FTx3l6lRS
KDLJrew1Y+c/BhlhHFntEKFJAr2K1oNCU0+FLgXcAKAvu0vK2+RYIe20e+nm/rrd
w9WYvqY+WpksDHYXHeLkld4wCRdjZjpSOaODkS6J1vl46qJLf9ZDkO0o71E0heVs
qUgtJ2xRlBjWlLZtq4feO6h7lsGmkRzeAKKKssJKY+osWYcqgXvn69wC9YvxVud1
tw99HltwAIf/4d9kDylpRUvzNChVRpA6k/Ph+CCCLKQNq4DMqHxMPp+1hrEpkqTL
nsGHC1WPlRZG+0sgu+X52NjhPvDB26wZQXZZTyy79+6aUoKChNqop+YamU1Jmc/n
8ZLXAn7kfyz8QXPcdeEwfNwtMzCne6jfqIBT1JqB8Si7+p3tJHTEkK0MTdcbmxo9
qwPPJvdwUdg+waItLmUQUsIP1Kx+gLB52hQzTrY8qh794NZsGoqeuT7XC1ohyBX3
XaiqC6V38F6ZWfY0KDaVSGJRK3K8csUId7738j3u8xYmP3OKcnn3DRuT5AiOP4NI
9Dh16TCQVhtzmWKERgf0
=Asop
-----END PGP SIGNATURE-----

--=-1M4SCcFTSxRQU8TO9GtI--
