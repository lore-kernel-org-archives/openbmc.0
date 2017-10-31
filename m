Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Em1iOn5g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aI9WcJB4"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQzBs3xh4zDqwZ
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 15:39:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3919120A50;
 Tue, 31 Oct 2017 00:38:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 31 Oct 2017 00:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HrjVTT8/EEYEn4M01g+8SkbKd0yYKE+l/eBhdqzabro=; b=Em1iOn5g
 /LvNWZU6q+C1ksA4506l25uIx/mAjPtSPVN5wWbcdGmN8yWzfcG64AbFNSc8aqnL
 W7uWvjWfZHxOAkuK9LTr9K0DEVHYwZTG/lD5YIXAJluQPLYs4OkuskT1JA694xTM
 Ld9cOkLxuE7MZeTnvkFOZUTtAiF2/Z+OpSCZGQRL6B3Svra5+PPpZC7BMzlGwIRW
 +Yj2o9LdfxPeT5IWswP1JSg99dNjG2L8DXpU4MVIuZ9bgOFh2uLoAVeFoflzgWX1
 un/6Zcxm0IPwKXQzSVoZotdYjZZ8FF6CFqRAub9b+3l4jCR7jUDxQIZPBlVdE2UJ
 26UvdO5u2x+7kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=HrjVTT8/EEYEn4M01g+8SkbKd0yYK
 E+l/eBhdqzabro=; b=aI9WcJB4GvxhXR0Y7h0I5fhDwJgvaCoEjJE6jKu86RNr3
 zApCOwk3t49TuQw+DvE2hk4ECGKLRlRNtkXJPWOiGaCmwUV5fMyjgn5Xpf06FQMb
 8eWwNEe6FEhP1UHamzqAsr6uuBZl7YrNY+hzm1+Mt/Vh3UBCX3i/BPr567duPDNT
 9rqOyOg2Qtxls7Te8QE0+hyfDfcvFCpswq24edt6HoFJcv4rZ8PglyJEcvUIcUdh
 1rSc5fWX5OOJ4Pd+99+HjqDEqE/sx1gkdboNA7BAIGny2cgKIw1/K53ggQoU+vGc
 A0uEYURzyJUpgYHUf8Nq1uk8Ae2AVr2v6K3cRci0A==
X-ME-Sender: <xms:Yv73WanmJr4Xs38fnCUC5WG1v3JtKsvfJw9P5LBqFgY3yeMPs36w1w>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC9FA7F9BA;
 Tue, 31 Oct 2017 00:38:56 -0400 (EDT)
Message-ID: <1509424730.2263.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: romulus: Add reset
 tolerance for power GPIOs
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Oct 2017 15:08:50 +1030
In-Reply-To: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
References: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-solGXxKWmN5FuWyll0PW"
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
X-List-Received-Date: Tue, 31 Oct 2017 04:39:04 -0000


--=-solGXxKWmN5FuWyll0PW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 17:20 +0800, Lei YU wrote:
> This is a similar change as Witherspoon, that enables the host to stay
> up across BMC reboots.
>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10.

Thanks,

Andrew
--=-solGXxKWmN5FuWyll0PW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9/5aAAoJEJ0dnzgO5LT58IQP/0ogYjSjAdiUYzF09y86GWyd
EWypSie6KOcmafuB+iF4B++rBEW4gYGtxIM7kN3mNtG77xbSa40TEq1AJ0Ogsef5
zCyMtWmE+L477++nyd090dmRWLVSxgnWnSO7gKDg5oYCnwSfDoVGnzsW5V+78fZ/
IBzwxyXevloIY3hShPyuUZh+BA5kiN2uiBAqZcBRcwp/dWa4ou3BPkddhjlGh2RQ
ZLY1+jEEVj5lgAvRubmbVaB3KMCGup3iXUYPjdO23D3JdwiBb47K6e7doOqrKZUF
NnQ7+2VOHTmv2X4ltlSqRddPEVgGs7XHw1wRnVPBAw+aflh/ZT9KMXIunImPjfe6
CGHFQYOx//EJVrLE8AVrHTStD8h/7TSSFb9UyNCKy3tVAt0Zy/IUVC6MOiiGe1SY
wmiseVzroHdzqqff2lySgDhgk2fvIutzPeo7/y2pQOLU0/ethIKM2dbJ/BeNtkOQ
kfp2IG0JxrlD3oGMd9wfMC0YK3HeQ1lXiVFn5fR5PmgsBOAzso6jS0NeuQVFjLrq
V/RiWj04HG1fysAcwtQ6+a1HvfAn/UrRokonYcGpHbKiM1Bxw54L4OuNUnKPihrF
etNoAot7GpynwJyfWc+LGXRsfHub6+867DJDFBWE0as793H3D81obGU8wjiLo3zG
ytdv61hd02MudAIChBmo
=4ELh
-----END PGP SIGNATURE-----

--=-solGXxKWmN5FuWyll0PW--
