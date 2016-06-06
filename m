Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNJBw4p6SzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 12:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=a8PBrXOj; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 8D47D4B006D;
 Sun,  5 Jun 2016 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=esp8+Y1SBYDe53SIEcAgL
 3zWxBY=; b=a8PBrXOjI7Ljp+XtVS+YihgYyRoKERX/3mclgnw5CgDI6GNxnOwgR
 ONSKf5I1EgMPEbLvaaVoGyVWAtzhh8fhQcozKLvoaKyWONFhKUH3CqXJo+/wlqYK
 Hkfhzewyl7Uih1//FPX9QlpB7VHhohpx/sR5uHftS+Y3dDuTN6P1CU=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 652084B0063;
 Sun,  5 Jun 2016 19:13:08 -0700 (PDT)
Message-ID: <1465179176.16048.1.camel@aj.id.au>
Subject: Re: [PATCH openbmc 10/10] AST2500: Add AST2500 evaluation board layer
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Date: Mon, 06 Jun 2016 11:42:56 +0930
In-Reply-To: <CACPK8XfXJjhjfDTNYBeR9J+ZfSD0k=ySpJ=MMnBGrpr4W+CpiQ@mail.gmail.com>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-11-openbmc-patches@stwcx.xyz>
 <CACPK8XfXJjhjfDTNYBeR9J+ZfSD0k=ySpJ=MMnBGrpr4W+CpiQ@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-T5tDDUXpV+t+cXaTopX6"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 06 Jun 2016 02:13:13 -0000


--=-T5tDDUXpV+t+cXaTopX6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-06-05 at 12:01 -0500, Joel Stanley wrote:
> > +# Qemu configuration
> > +#
> > +# By default qemu will build with a builtin VNC server where graphical=
 output can be
> > +# seen. The two lines below enable the SDL backend too. This assumes t=
here is a
> > +# libsdl library available on your build system.
> > +PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
> > +PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
> > +ASSUME_PROVIDED +=3D "libsdl-native"
>=20
> I don't think we need this. I believe we all enable the serial console
> output to the console or a pty, so building in sdl is unnecessary.
>=20
> Unrelated to this patch; are we building from our qemu tree?

No we're not. Doing so was part of my abandoned pull request with the
rest of the qemu support. When I've got time I'll have another go at
integration.

Andrew
--=-T5tDDUXpV+t+cXaTopX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVNwoAAoJEJ0dnzgO5LT5w78QALdryCxmoEbmicDobbb9ggs1
ErWKk3GGNFte9Y/pvwiLaLdNC0pFXbr/xOR5EaTW4M9w4vNYLFdXZTU2AsmtGLG6
F1duYLeN0n5D+eQnZYXsPddhUO5hZLfLaJDQupNG7wjbhRFoG7OGLVxw3OJe0uRT
d05YkjeKFVLWp6pgrTqqDJgUlefB+ezNDHk6Ea/4MtpzW0UnKITRhvgNRBazH7Ud
O6eU57Uvg5HPoe8XqAX3Md/FM373nnW2eQOI86uY6VQtfUpLQvKZDdUZu2+9Qp9a
1Awa5bMChxbz3k3ed7M/NcTHign97IIw9kAQK2Il2mVq8EctEQTIocDnZtNeyqnU
X3pPVHib8dssa9oqFXoJQpG3+mY01vBgtNVDOj4/u+iRAHFdG4SP0yTFBavLh4DF
f2wt5InfTAQPwQY5iIkEHdYksd2ysYKJSjq2tucydMZK57lWlkUg5cMmV7JJad2T
G9BDWMl4pzGj0PgksYp7mPBlXxgcb6Pke9Vxot9goSSp5qeLFJfbbFbnwrPYE7F7
Hej2W8sRDH73Ww5fkjuMR4Gp8Cg7Qd6SIxiM8/vUm6QM0gzr+FutctcPR7SAAFtO
ly7HEBVNCVxSGcyceJV1GLo+TveRkmreAxW1NcXM8V6hzcVS8YHOvO/2LODS/QlP
vvwIT375m0/zXbArRX97
=vso4
-----END PGP SIGNATURE-----

--=-T5tDDUXpV+t+cXaTopX6--
