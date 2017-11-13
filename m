Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="X0Xgq89t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dkgmcuif"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yZztr0FHDzDqfx
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 16:37:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D8B37209DA;
 Mon, 13 Nov 2017 00:37:53 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 13 Nov 2017 00:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gXPxwlDJc3HYYfjzC9S+HgsiE3YuqCgEj6F+hOu/nr0=; b=X0Xgq89t
 TkKq+avQarijh1pJf3gyuQsLswy4C1z32423qjC6L9Jo59jPAxgSkYPHfZnsYepR
 tPkRQVUHFxgxwuK5FBu4IVXDdpk3kJKxX37ByAwJJBMShS3RehyazlHxqw8T/dGr
 cbxO5KgZReDn1AkQNZqBB/L72vWsbUvLsUwQTGv+4G4IoykmGJiHjGzuM8sh82l5
 kXBFFJ0mRoI1B0f/d4DErLSEMpbpIqLwCe6dnkJG8GSotpA3PszI544hBeW1hr8A
 5lVdONSNHaClrVOgBJjAsZkpqYQ7640twN2US5VQsk26K1lHAymiB9yttSuxECc5
 xTAgdWETwDX0bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=gXPxwlDJc3HYYfjzC9S+HgsiE3Yuq
 CgEj6F+hOu/nr0=; b=dkgmcuifvKoxGkqZlyO8c4zBidzxaogU2+N5ik4VnJ7n7
 pa7hbASnzY6BuhT0W0LLN+r+BsJSD1RVje/PR2mgPC6gqVtKqw4QaBdFShsJhVkz
 E+tQwV8c08uUBMDaPvNbNy23BO8rlkXutRJ/+56jzV/Xr90G8oHFBdxS0oA7/WzV
 BADfqumU1pLWl34rsnrIfb2ULSi6EoDo7ndC0QQQDozrm3g2QBPsXLerwd5PVyav
 +Ayvm015UblIlvsgVHbUeV2QDHqhxc50rb0Lj4uVkrtaVo14dj0kDhJxm+Aq6ZRe
 k6izkgR5iWaLVfv3bG5B4LqF4s9O6RPZDAxLft17g==
X-ME-Sender: <xms:sS8JWqsg1GLg-KfCUj7ss5D0WfvqQYS64xcgfV-PwqJFF3xuCwKFeQ>
Received: from dave (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1DA56241BE;
 Mon, 13 Nov 2017 00:37:51 -0500 (EST)
Message-ID: <1510551468.4287.76.camel@aj.id.au>
Subject: Re: Yocto, Kernel and OpenBMC security maintenance
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Ed Tanous <ed.tanous@intel.com>
Date: Mon, 13 Nov 2017 16:07:48 +1030
In-Reply-To: <CACPK8Xf0mLw=fGDEGwdvQ6Bycgmf3jUU8WGJJ3+8VcTUJ_9CUA@mail.gmail.com>
References: <CACPK8Xf0mLw=fGDEGwdvQ6Bycgmf3jUU8WGJJ3+8VcTUJ_9CUA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+Z+WrDVJQWPbYd61WmYr"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Mon, 13 Nov 2017 05:37:56 -0000


--=-+Z+WrDVJQWPbYd61WmYr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-11-07 at 15:56 +1030, Joel Stanley wrote:
> On todays community call we chatted about security updates for the
> project. Nancy pointed out that there tools in the tree that are many
> versions out of date and have security fixes available, but not
> applied to our tree.
>=20
> To date there has been no focused effort on ensuring known
> vulnerabilities are patched, weather this be backporting patches or
> updating to newer releases. I suggested we focus on ensuring the
> OpenBMC tree, as the upstream for our products, is where security
> fixes are applied.

For what it's worth there's some discussion of upgrading to Yocto 2.3
and what we might do to better track master on the issue tracker:

https://github.com/openbmc/openbmc/issues/2461

I agree we need to improve how we track things such as security patches
that go into upstream.

Andrew
--=-+Z+WrDVJQWPbYd61WmYr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaCS+sAAoJEJ0dnzgO5LT5VcsP/jiWD1wGl4mQxUAYf/JTE6Gh
q4krdDfRWmUjSNeF+cJfOS+g3qINB5zwFhQqhjXF96W0YQu+nX2II/lXmHTWpS6T
HKRpV5Lq+Mdeh60LmTOoIvx8J8DvsBf+f8366U0xK6kvk2yUXApY1pgLZ3mFrA8T
Lqs9Xic4bEwYPgMV+DBRUOQpTC/JL6IUW4hf6vzn3BlmBeAkd8v5u9d+uDogqSII
hRjUPSXOnMYlJGT3T0Lefu2P2kmgNl6fNQtcuJ/ufUmRN9Mbcoa68sqreMvaws9R
t7BFJeqZIjUCJO59a/fpkUHoipa2//O2zMHRSArEL4HDxj16Foq8Eql1eMoI7liA
SuqbgL2cKvr83CbyhwZJXk5bANl1BvHMWdsJbhDCWCfwCshvTRkJ4KLJCiD2q36N
SN78s9XpmDIjiGj5+0vsFvjk6oc3wH7HHvc4/PFOB4nO5Oem1s8ixcwdDaZRCB86
2GufdQODLDX5CW6K9C37AsYJggHA8peJVbmtsjVKNjrtrzeeCcun89NVdU85wXWK
4jLyzvoAKBDSNAMDCyXVzv0Kf51q6z6LRhLyO31T7N57YwO+Fdt7L7JeOrbayE8g
2GZ4p5krW/BIv9dO08qaNLjlEzIq8H/p1ZWn85moLkkqs+i7eUFmcy9Nx33oxjrM
V9F9M/CXVXZfJqr0xal8
=TUTz
-----END PGP SIGNATURE-----

--=-+Z+WrDVJQWPbYd61WmYr--
