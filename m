Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vBX4s6kMPzDq93
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 12:34:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="k8aj5zap"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KJ4c5HCg"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A6F420761;
 Sun, 29 Jan 2017 20:34:49 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 29 Jan 2017 20:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=LXs
 ZND9K8ir7eT1v1oiiS24vmp0=; b=k8aj5zapSMQE7+52gWBnA3KkPjlzeva3K8e
 O1/j+06tqzo1GcltodLK1ywwfrPy4zOBEP1V+m69E35TnKcQrqFM/PMeT3Zjjxod
 Y8PDtXLPu4uhCt103/jCZZsZZDupITIT42BgJ/Ho9tym8sTtwyKUZgjHJH7TvL5e
 ++mfuOQU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=LXsZND9K8ir7eT1v1oiiS24vmp0=; b=KJ4c5
 HCgoUVAeAT0gUL1I0rc87saYfMa4c/Pp21BAA/s35dE/UB+4YjDZIwnBJN/brvf4
 YKiOuwbv8HHRT+34EP4NupWDZAulVynSTAkcprlyv4bst1gjuPCoO3ETeo+crdkL
 Do57sVgIAJr1l9xtag+kJhP06gP4ode1X4SbXU=
X-ME-Sender: <xms:OZiOWDqU7Qlbk7uCGt5a-AiLtCOVEaHNCpD6zp_TVtTsVouS0uHVWA>
X-Sasl-enc: 7y7dkHUSocpvzLu427MjCXhnwrNd8nIkP8kvPX+pT84s 1485740088
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DB927E0E7;
 Sun, 29 Jan 2017 20:34:47 -0500 (EST)
Message-ID: <1485740080.4137.21.camel@aj.id.au>
Subject: GPIO offsets used by userspace
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Mon, 30 Jan 2017 12:04:40 +1030
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/2PFEbqEzTKdMyszUUkN"
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
X-List-Received-Date: Mon, 30 Jan 2017 01:34:55 -0000


--=-/2PFEbqEzTKdMyszUUkN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Just a heads up that when the linked patch is pulled into the OpenBMC
kernel it will break our userspace. We will need to synchronise the
kernel bump with the fixes for the machine configs to update the magic
GPIO offset number.

https://lkml.org/lkml/2017/1/26/786

The magic offset is essentially 512-(ngpios) (I don't know why, but
that's the behaviour), and this now varies between AST2400 and AST2500
systems due to the AST2500 having an extra bank, and also because the
AST2400 has a "hole" at the end of its GPIO number space.

Cheers,

Andrew
--=-/2PFEbqEzTKdMyszUUkN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYjpgwAAoJEJ0dnzgO5LT56QIP+gPYTOWTitYs9jWQODC4wVOi
yNdGVH1H52qhqJ6Vs55TA+Me206hvjigLMYCP4KKvf+/Z2d+QeYhTH1OAU+LKfia
Q9CpeEHlMCgNIOwBJfJAlSh4PXUSAJrChWZa+8ejAMQ4kUU4gM/dMj0+SEFHS1Lb
Q2Uujfo21P/Vkt+9yknJNazN0vYunqNzuCDtdBZOHtGzJk/JTgVbK6O6h7DErDo7
uow4AafPmmROnEUNK0RRFK84mdk9y5PNqjJbgM0sY5hk+waH9VkrP18XDdBMkpQR
14QquGZWMkd5cLkscvq47yTorHLmSJiQTAeVHY4+ZBZ0zE1HNiAwMGOCk12Wz34K
WtMR37+bpCUH/BNHofKAPy1DmxrZ4XlmKirQpUw4dd5XuEkvIbE8XNHFQ8XleWmm
1RuANxEfM4LI+FGuBYmLdTYU9e2E64KY4caKmEGsh/clYb/GJeaw3bxaye0n9i72
r2BWYF88G/d+QX8LiiXi+YvIq+2Vq79oVMcPxHm4WP7Hi8pyjuT8AVjNugN+Bxp7
HmMeXrceP2La8tffzbrCPRAix7BV5Ntv4pf/tow6Cni+AMgUrAw69Nr+HdgAdZZd
ntUX/SXJRAiMXyHenLbP59n567SSKo36+2con7DtSY4zWj8ejRNbfqwXpEyoiENW
DBcrt5GDECE9ZWGDuGdz
=MfIx
-----END PGP SIGNATURE-----

--=-/2PFEbqEzTKdMyszUUkN--
