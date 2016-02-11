Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 835841A0038
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 17:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=W5zReK8M; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 0BCCB76C06B;
 Wed, 10 Feb 2016 22:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=2bq/o1lsblZJjYPg5rfFY
 RpVnys=; b=W5zReK8Mp7WqX779hL5QZd6XdvLF40/uEMFnd1VNSM5YMgav1Xzjd
 Pu1V0r9JphpWjoV+w8vsroZ2oz6/QGj2ZDCs/zAS/x9LSpDInfCOzNt/sJ6+jUuU
 70/P2QCsvyLnbF5Wjd2DzU91FkaJ7FaYlr61P4Ts401YGEaTG8niR8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id D83FC76C065;
 Wed, 10 Feb 2016 22:26:44 -0800 (PST)
Message-ID: <1455171993.2576.2.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>, stewart@linux.vnet.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Thu, 11 Feb 2016 16:56:33 +1030
In-Reply-To: <201602110544.u1B5il3T028608@d01av04.pok.ibm.com>
References: <87io1vq04t.fsf@linux.vnet.ibm.com>
 ,<1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
 <201602110544.u1B5il3T028608@d01av04.pok.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vVKAjz8ofCWtfv7cRUrL"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 06:26:48 -0000


--=-vVKAjz8ofCWtfv7cRUrL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-02-11 at 05:44 +0000, Chris Austen wrote:
> Open an issue to migrate to inet_pton.
> =20

Okay, I've opened issue 65 for this:

https://github.com/openbmc/phosphor-host-ipmid/issues/65

Andrew

> =20
>=20
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
> =20
> =20
> ----- Original message -----
> From: Stewart Smith <stewart@linux.vnet.ibm.com>
> Sent by: "openbmc" <
> openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
> To: andrew@aj.id.au, OpenBMC Patches <openbmc-patches@stwcx.xyz>,=20
> openbmc@lists.ozlabs.org
> Cc:
> Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
> Date: Wed, Feb 10, 2016 11:37 PM
> =20
> Andrew Jeffery <andrew@aj.id.au> writes:
> > I realise this has already been merged, but I feel like I should
> point
> > out some issues below for future improvements.
>=20
> Perhaps unreviewed code shouldn't be merged. Especially considering
> that
> there's been so many comments on so many patches in this project.
>=20
> --
> Stewart Smith
> OPAL Architect, IBM.
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20
--=-vVKAjz8ofCWtfv7cRUrL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWvCmZAAoJEJ0dnzgO5LT5PQoQAJhJl8bv6zMrnovjqss7l/vh
yaXil+M+xOcWPq9hXTySOSK86Us9qRwqm75EzbF9ex+8p1RpRXsfuGlwA0/WvkP+
tsmQ84TVCdWjBiEYrDHaDKKYRgqs8AUdvkJmoXPId/3vY8v6sgwaExkFUt3EivGl
CfQUd8rUq/HihiPAhcuVTusTP5hscvKyan+JdlbZbTCuI4kt8SgyvuIKz4+TlJ2h
hvz3KP3+2auPk30o1CEoy+TFn8v7es+A27fiFeMRH/MdCeW22/9IhqZMlTr6LncL
WSoB+JyjKbBZyftbdbOuwxR5bZcLdf1waHGd8JXQif2NaLzXxqvKVEtaC7q1aFB6
NUOUiruWXPu7m26UhSzHGBa8G63pHaZyW1MOqwLyFUarRBF45qwpcSNI0mNm058/
XMWieJcnFYZ5qI2KdK8LCyxgwDsHfdZDe5adL5zKUNTBEC3YMaj7Of4cXjHARe30
stqaaE6Z1IZedFKyuqSquN14KXpYSuPSZyGx6S0h4jvnKKb1MzclVK/EzGZ90a0o
ZIlMLYyM+MoU21UAhlsPvWBqKl67pS/gI73NLp0LRwW+RE/hcwh/gOlEd9nlyfGO
WDIskBSX2uWtA24WsvhHB+I47UUuJXPgMps6lj80xMjJ5M0wqovF6AJgW7NH8KTp
wllKY+8+lGXOVLIyJ83k
=1cyN
-----END PGP SIGNATURE-----

--=-vVKAjz8ofCWtfv7cRUrL--
