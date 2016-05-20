Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9z150ZjkzDqLj
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 16:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=KqBGvBdY; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 568717EC064;
 Thu, 19 May 2016 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=VIsCO3Pwvhz6gqNz0fM2D
 LiwTxQ=; b=KqBGvBdYEaYMG4xe+ebM/TdkekRbrx7qFIN33KZB4S6748YtxQvij
 3HNVlCGcS+LWKIdRTICJRYQ5CCG47SrqPXBFOGVgxMT1cNczirV8bjfCpnMvwHPn
 H6bCuLhvozW7g3emaGjbBiw6J8a+i54BKncrzfs5rOlhDAP0t9g3C0=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 598607EC060;
 Thu, 19 May 2016 23:43:50 -0700 (PDT)
Message-ID: <1463726617.2703.229.camel@aj.id.au>
Subject: Re: [PATCH qemu 1/3] i2c: add aspeed i2c crontroller
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Fri, 20 May 2016 16:13:37 +0930
In-Reply-To: <573DEFD0.7070403@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-2-git-send-email-clg@kaod.org>
 <1463622062.2703.132.camel@aj.id.au> <573DEFD0.7070403@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-GH7hqrYiHLDbgmJXVCxB"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 06:43:54 -0000


--=-GH7hqrYiHLDbgmJXVCxB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-05-19 at 18:54 +0200, C=C3=A9dric Le Goater wrote:
> I should have addressed your comments on :=C2=A0
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://github.com/legoat=
er/qemu/commits/aspeed
>=20
> in which I also added a device model for the TMP42{1,2,3} temperature=C2=
=A0
> sensors to fit the palmetto dts.=C2=A0
>=20
> Tell me when you want a resend.

I've fetched down the aspeed branch from github and had a play. Looks
good to me, so I'll push the patches to openbmc qemu/master shortly.

Cheers,

Andrew
--=-GH7hqrYiHLDbgmJXVCxB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPrIZAAoJEJ0dnzgO5LT54k0QAK+O7CCCVE5zWQp6/iA+g2Lw
xyC45bsG4Wui/Qa5oCiYkfEBUoAAwwA9x0CR1ikhA9pwj9iRM2lJAQq3t4+uuBU2
Lg6q3LkSjXlMt6IyXU6lmlml94x0a1tCg6kMvwbwRez739yaI7CXg79//b4K/aYR
p1/tmbkSvuMpgqQEuLvmYedRmlW3+sNsS/b2MzHUU4k7wXm6lgcrhNq1KUCCbHOk
U4O+f9rF/dCpMIrqUJnzAe6JlVEqG0KDE70Klo6wlm3uJhueB52jHo6IQz/jaBkv
IBcmqqZNw3B8ULr0SXzHfodxIAoCm9K8u2brRZXL+QOhzSSW0CqoF1fEsR/7rM2Y
wm8RqnixmGHxfmk+ZztE4JcNjPRV/TTb0bisATJywTypf5IMZ8KMRr1PWUYe0EW4
5vZ1q5tsmPXNqa1yuhtrc7yxzFVXVV2s4SLoAzLbqkCNRKjgHlJ+PGpMUNo8C5Uu
dFPU/4sRpsMRB0P9OsorW6wXrRX7FagqdX4uOf3Kez11kQwGqR6OQEn2PS52lfBT
c9Lc7nf391HoAu9pMlOE/PsuS1qyCnZJz1swS4IhwlL9nVPKSONoI7ZsbpWnJVUP
G0NDC8kAvTG0w0Ct5wsnaP+LIM0vTuDqMJJf0j82Y9Wl2cNwGAiqDoV537bl++CB
SN/G9z09USp7qdVH88ax
=VkD7
-----END PGP SIGNATURE-----

--=-GH7hqrYiHLDbgmJXVCxB--
