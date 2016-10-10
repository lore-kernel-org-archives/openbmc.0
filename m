Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stGtf41HpzDskb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 10:44:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=GlwG7DG6; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=VBR3u/Qi; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4567820B04;
 Mon, 10 Oct 2016 19:44:24 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 10 Oct 2016 19:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=86b0j
 H+0LBYeEj7uDcu/KjY1U5k=; b=GlwG7DG62gA+yhUD52hL2JBD2SYsznvNw6kxu
 C6QytPdPIAIJj9gL8xLACy9lyM2NylPdPduHC8G1uVq6CPL9bSDhuJuuI/NtP87u
 hrwHVNO8Tub+alyhC3eIcRc8cL5D4ysbvvJi0NlGmZN37vDgEIJwGWxIu547ciN5
 C0+l0E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=86b0jH+0LBYeEj7uDcu/KjY1U5k=; b=VBR3u
 /QihNbOK3NY61zA6j3oIOGiCLx6XfbJADC8JWTt/4iuDgOME8JV2GGqiHowu7O5z
 Ge/gUSOsp6E+Ya26b1Lei/LcwuW78KC93+YsaLHC/CgGubtKTjb5ygBLon5qeirh
 e3w4d1jq9CVx/9nLrZ0FPtMckVPOQi0pCUoufQ=
X-Sasl-enc: Kr+h8Jb5jAEjO2yLp/wd3TrWll01zZJE++8aUDhdn8PZ 1476143063
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D18EBF29CE;
 Mon, 10 Oct 2016 19:44:21 -0400 (EDT)
Message-ID: <1476143058.16733.10.camel@aj.id.au>
Subject: Re: openpower.xyz updates
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Patrick Williams
 <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>,  Chris Smart <chris@distroguy.com>
Date: Tue, 11 Oct 2016 10:14:18 +1030
In-Reply-To: <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-k+edqj3XvnrhiBsf1RnW"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 10 Oct 2016 23:44:27 -0000


--=-k+edqj3XvnrhiBsf1RnW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-10 at 11:09 -0500, Andrew Geissler wrote:
> I noticed our gerrit trigger job to verify userid's was broken again
> this morning.=C2=A0=C2=A0Looks like the trouble plugin (Git Client Plugin=
) was
> upgraded again to the latest version.=C2=A0=C2=A0Anyone out there know wh=
y/who
> did it?=C2=A0=C2=A0I'm going to put us back to 1.19.7 per my earlier comm=
ents.

Joel and Chris Smart were looking at this yesterday. A job broke:

https://openpower.xyz/job/openpower-op-build/184/console

According to Chris it broke because of:

https://bugs.eclipse.org/bugs/show_bug.cgi?id=3D428039

    15:58 < csmart> joel, basically release() was replaced with close()
    and so any plugin that uses git needs to be updated

Looks like we're stuck between a rock and a hard place.

Cheers,

Andrew

>=20
> There's no fix per-se for this, jenkins is always a bit hit or miss
> with it's latest LTS version working with the latest plugins.=C2=A0=C2=A0=
Best
> thing we can do is when we schedule our next jenkins LTS upgrade, to
> try all the latest plugins again.
>=20
> Andrew
>=20
> On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >=20
> > On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
> > >=20
> > > Okay. Do we plan to test the individual projects as part of an
> > > openbmc/openbmc build in the future?
> > >=20
> > Yes.=C2=A0=C2=A0https://github.com/openbmc/openbmc/issues/382
> >=20
> > --
> > Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-k+edqj3XvnrhiBsf1RnW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/CfSAAoJEJ0dnzgO5LT5KHoP/3qnYPwLSe7Lka7jr0urc7kr
fIVKq2dzCyMe5+y7Suvpe/AUkh7iYA2/Y1RmZkH9wcN5eHpjBlh8mjqCjGuTZ3wn
wxUds6qWAZG2+xvD7ZYVZZLPz1/uykBuy+zD2pvbLie8kkWxA6NtmPqHu7n9aHDc
Menk1c4TPg5hGjILkfy6Iza0Z41AP2rKI5IyDCFx7l8RGGPYRE0/z6D2/Cjl3lNA
+dYYjmbBI206gU/uAPL+Exld0PH8k+VXJaWe0QyKnEPxIFHSPl3o4N9GOTpxDkye
YWE7soofxlWdDSBh6YQbSb5nBo8dI7NNKCoQCdn61rwvrLI7Idm0vG5zYjeGI3/P
CF+SzhFXlYpkUztzxgwM55FihmDsR3n+MFVXmQvW/bcF/6JsTteEZoHQo7EPi5fF
uY7pjOnXubj55q5qZr7m2kmZ++IAAYTArh9Jn7ezidNQO5jGOH4r0er16Og4AIWY
VHnb+ZCzy/wZkDYJ0MLYkI60dvIKqSrnGiwYPMO5GJIWC3x1HsL5KKIpyjnFuz0D
cETEEBPbSQw0YFsRRUqMdR8QSNda+vWMf6AQqYogkoFqeewAN7nNVKURrdLTB8PD
Oz5lIjyw3AsbvGIhoqjaILfuqWp1ZP2TUucZWSwNicYlNTinerrLW22Sz/z+hgIk
PInj8QcbqGoJl8jIPg4E
=7Oxz
-----END PGP SIGNATURE-----

--=-k+edqj3XvnrhiBsf1RnW--
