Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b61vVplK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="awukyUwc"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCyGX687NzDrFD
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 17:19:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ABC8D209BF;
 Fri, 13 Oct 2017 02:18:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 02:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=68utpkfV7LTzOIkMxZsEicDaZhUQm8pdUgkNQNBxf5A=; b=b61vVplK
 MGo78BkPkOSHjzR92f7OOY03rIcGpuBTwpfiyZp+jXHK/rAxQp6VrjZjvVI3iJFD
 mYKjG+5flg4/GPJmvZXGQwZa5jv8OSaijnn8kzyA0tr8a5ec+BAysAtVcXMXPzVZ
 bnJ5wTvbvwZf7ad7SPvh3merUDJuiVS+wmQvfjGU5meGY1xqpE0hsXP26kbDJRde
 Xlymm5OklGFf7CqyJHkM7OHb5lyzkeBu9Lf2JAp1mfFkR4UJTYFQdUaEcSYh/1be
 FrZcQprXm9wx1Y037j7K8kDztXO0Fu7jc8WnZrWQGcg6b6snYlqLJKGr2x1s6e3b
 G8kuqQba/jpohQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=68utpkfV7LTzOIkMxZsEicDaZhUQm
 8pdUgkNQNBxf5A=; b=awukyUwcNRXzmKwYFjaCYtqAKuqECjfe659upfKJbWyGd
 fQBrLrm8v4p8jzUrOY91iWv4ucbO6MFwIRhF8wwPH3iEk8+bPLti6KnJVVIOWjln
 BbpamAy9IypC3/jTAn/a/XkMDGAEloM6QKDmd1bZQduZsxxShmjYTpD7ZBJwHTEL
 60gipn++0+12AfghxRbeUCU1ld4MZ0vJ8aZPW/NuImYDX3dxPIlQm5OYu2mqwv4Z
 1+MaxP1xWDX5+n93wOQrcYfqUFuhQJ6CYipoRW32wEllSnpkuTgdyNVqmXxNRSRO
 QB7+mlm6C+6E7PXV9fRlNqrkE9ejwJjc4cDXv4AnA==
X-ME-Sender: <xms:0lrgWRlVxNiU-o6iDe7E8FqspR0h6PYZ0kpNx45kYCg48B_k-9NPmA>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id B470D7F961;
 Fri, 13 Oct 2017 02:18:56 -0400 (EDT)
Message-ID: <1507875532.5452.205.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 13 Oct 2017 16:48:52 +1030
In-Reply-To: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-y/QIfzIuEVy4B0ftGTo6"
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
X-List-Received-Date: Fri, 13 Oct 2017 06:19:01 -0000


--=-y/QIfzIuEVy4B0ftGTo6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Driver wasn't cleaning up on timeout or in an error situation properly.
> Need to do a full reset if we fail in order to re-stablish a good state
> of the engine.

Was there a particular use-case that triggered this behaviour or was this j=
ust
found in general use? I feel a bit more context would be helpful here. It's=
 a
fairly sizeable patch and I'm surprised recovery was overlooked initially.

Cheers,

Andrew
--=-y/QIfzIuEVy4B0ftGTo6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4FrMAAoJEJ0dnzgO5LT5K6AP/jgPAokRjhOUun9uxTOjgiya
IJ1DxIbJ4mrfcXM9xqMrDb5k6RdobVEFeb5yb/l31ixaF3gIw9HlT+SOsZUCPS3z
GpztiXqBRxbZ6kNmlWpf/KbE4NG+8p70+dlPKHwImJ8emZflhJ/D4cDdeG2nbf2X
lISMNtQ9x1bsDwz0giBfPy9BzJGLNSAqG5B+rLmOUhGXEAD6lAL06zxqOH/pk9np
HBEmSlL6x+Xm1vDLqgc+Mz+yWQfwMr3ExY20sYfARVp+rFdkNl2/s/bQOe64bRlh
1ypwyXvFShoXDDEi7kRLA6Zcba9vO1l81vcOMhdJBVJwSEzpjl25yAoc5IDxiCH+
3feDAx/2JfSSgY1/TCbsUWoT0FEHgj1QYDeaeU/7tYM/y0zRteMCzL1Sis0fI9Tv
yfHC5PU3nhduxgAm+YA1BkO/NBZU42DZsVimXMHdryJm++p/LtI5pUhL38UVGRV9
rV8999FyHi1PIuLfcXYgRRJQhCCC8rgEPTIZ/wgrN/5CEbPiiJY5hZPqLyV7T0yC
kB6dBZrCGXTjzhXd/4wVQWL0Y0U3MRp6dKj9pRoyAuaUHXHW8KQGbsDE6nkqFif2
+EAPPwQE5hVneoMzQWg8p1VUVyzdbxjbLw/zN1kiEiqEuLYLl88EyW8k0/PwtDoB
qgtRw8vNhmmVgPwqLu1g
=uIES
-----END PGP SIGNATURE-----

--=-y/QIfzIuEVy4B0ftGTo6--
