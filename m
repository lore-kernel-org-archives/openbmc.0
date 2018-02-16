Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FAZfuo4I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C7uWcoA8"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjF5d4CcvzF1LW
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 11:54:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B941920ACE;
 Thu, 15 Feb 2018 19:54:09 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 19:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0FciLq0kbR7ccMu8oaZqu0V7esBjrPlz7U15wIOT1Hc=; b=FAZfuo4I
 vyUU8/B762T64MxIFrUH/SvcOoh0b03RrffJNjIEAr095N+asLvDK5sbO+WPedO6
 vQs9u1XKLUCR0EDhjXiSNxjrqhraNRZEPk0E77l0EGmH/vGQNyXeOWps2i9pVOF4
 a7Ht26zWVTd5nSV6PkOBvX1roNjPuFuJvySX3GGEWp+dNotOTvpMpt3CA97JliPC
 cAs54NHGAoFR5F9DVzsXjfOO0vTW4D+TyHWVbhzED/p6lD7pBQ3eOt/2edA7pJMd
 AErmADe4PJTH+KfI2Up4/9sbvN+qcaNSfRMkJWkSK3HvXno8O5HUpI+h5XiEKE5j
 6kI7gslJTtAJvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=0FciLq0kbR7ccMu8oaZqu0V7esBjr
 Plz7U15wIOT1Hc=; b=C7uWcoA8HnavmYCR92ZCoAmZMUAEPM29dAZC2dbCKXsbU
 v3aB8dKzzRVqlajiBGGjpQhBMAGC47rlRqvXK7A2N7S1KHCJlSRxziOlBW2a+yh/
 t7QoKMoLDLVbcSLJrR8DLLuR18NAsHCcG1RdYJQVUuTatqzKAQHPz8pRoVWINGaK
 66t+ELXb6Vcic9LREA1L7tnwVTZSyaZA9YlWowipK2a3DWE3ztE6emuhqmTaf5fN
 K2Aq00VoruzT5PO37qYFJG1i0zJtJvCt7AcVEJJzgHelb0gVWMz5LWl2cYThvavK
 fGJ1oF4vh83YMoqf4R6lRlSm9rUgSFyHgu35G29mg==
X-ME-Sender: <xms:sSuGWvrKm2F3YR97jeN7u0nxEkSwlwLhRP2G__urL15aK9qtGDmaNg>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17E237E34D;
 Thu, 15 Feb 2018 19:54:06 -0500 (EST)
Message-ID: <1518742441.10440.16.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 13/16] Revert "drivers/fsi: GPIO
 stability changes for Cronus/Hostboot"
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au, 
 jk@ozlabs.org, eajames@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
Date: Fri, 16 Feb 2018 11:24:01 +1030
In-Reply-To: <4e06220a-98ae-fb62-405f-75c138e2d178@linux.vnet.ibm.com>
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-14-andrew@aj.id.au>
 <4e06220a-98ae-fb62-405f-75c138e2d178@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-taLCGpmNU6LwwTUl8bEQ"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 00:54:15 -0000


--=-taLCGpmNU6LwwTUl8bEQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-15 at 11:46 -0600, Christopher Bostic wrote:
>=20
> On 2/15/18 6:36 AM, Andrew Jeffery wrote:
> > This reverts commit cecf390c294cd6cf1080ed45cf0966691879750d.
> >=20
> > The cost of reading OCC hwmon attributes is reduced by roughly 50%[0] w=
hen we
> > do not incur large delays between cycles in the FSI GPIO master. No imp=
act was
> > observed on the stability of Hostboot by reverting the delays, though
> > admittedly it was not tested with Cronus.
>=20
> Hi Andrew,
>=20
> The delay values you are reverting were chosen because they fixed highly=
=20
> intermittent FSI ECC bus failures flagged during heavy bus traffic=20
> generated via Cronus.   I'd not feel comfortable with this update unless=
=20
> it can be verified this is no longer an issue.
>=20

Yes. I anticipated this would be the response. I put the patch in the
series to demonstrate the potential performance gain of verifying that
we no longer hit the issue. Maybe we can chat offline about how we
might do that.

Cheers,

Andrew
--=-taLCGpmNU6LwwTUl8bEQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJahiupAAoJEJ0dnzgO5LT5h8wQALMBZ3Dltym82NevalnhosmB
xPGfoMk8FgU9a+99peC9d8F/MPd6tRm/7ed3t+9hCFyjUV39LJxLXtD4mtBv21Qx
Cw73svjm6JbZJu2diMd3e0iUGODJlnb/FbgZ9eTxcCwrCsEL6TjqLmp5GIJbmraB
LlqN6Yy/KseeC0HNpoLG7HE5r14Tr4wGnNzTOX23HybifnT+jmVKpQf22gxLmRqa
3PffYKPIC7twX5Jvzhb8fk+nBHv/l10aga8la+gEQ1X90VGH62JIlMilqVS/PqX/
0N5GQoYwsuk9o8Mou+CK5kWAk7EzQn2D5OBJkqsqWKcCadp7OXz+ua4hbtf0xxUa
blBErzHnjNDsfa7LJP6NkXg+hlZR3vH9V4PYu63enhsqiJ9vNvKe8s+EmwamP4hl
8ernc+tql9ReP8hwySx0ZSDVxRyrpTlyJvWfEr6q2NEeDAUbqxgVeReAAktoLmwO
L0hQaz8igrFcW1gPiMUAnJTZU5u8PVzDJgMlQDj4cJfl+JbMJGewawIVYY3CgSrz
i45wr2WxdY+QUraAVvPcTuQCGy+Vq9yWYZM4hPYVGdMsC9wxZdjlgjikGFvPiidN
qguZOHqX1HaoBC0Jl1+YgaqymuITAxE5nvpaf8F8SArlSEqVcQQE1drTbEk1SYuN
TPDiXM3GGXeKkQrDKD8r
=Q//X
-----END PGP SIGNATURE-----

--=-taLCGpmNU6LwwTUl8bEQ--
