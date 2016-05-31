Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJjhk1DPNzDqNj
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 16:08:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=uJ/V9IHf; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 058E87EC064;
 Mon, 30 May 2016 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=36QNH0wzPQmjNvixpK+GS
 QvnLXc=; b=uJ/V9IHfRhTSJ7mNg7moMA6GtHcj0ZmwvwaBdZ74dlo5F/B0QLhZm
 6ovEeXWQtp8Q4JwO/T7PPE6azn3APpi+kEQkU//re6pJPDrE+SxPObqXVefdi0gq
 N/FUphebHY/WKT+LacpPZ+DOMStPq0ECsWQk/YK2U42pRqKjMwKMmo=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 6B8607EC061;
 Mon, 30 May 2016 23:08:02 -0700 (PDT)
Message-ID: <1464674870.3250.9.camel@aj.id.au>
Subject: Re: Aims for BMC emulation in qemu
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Teddy Reed <teddy.reed@gmail.com>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Chris Austen
 <austenc@us.ibm.com>, Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, patrick@stwcx.xyz
Date: Tue, 31 May 2016 15:37:50 +0930
In-Reply-To: <CADUykeqC1BzLXmCzySK+oLQ3euPGm=PJ3cpb_74LbuybaMG35w@mail.gmail.com>
References: <1463638966.2703.209.camel@aj.id.au>
 <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
 <1463981199.2703.286.camel@aj.id.au> <57431FE2.3000506@kaod.org>
 <1464135594.20948.16.camel@aj.id.au>
 <CADUykeqC1BzLXmCzySK+oLQ3euPGm=PJ3cpb_74LbuybaMG35w@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yazIMp1ZIi1Z6Fwje8IF"
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
X-List-Received-Date: Tue, 31 May 2016 06:08:07 -0000


--=-yazIMp1ZIi1Z6Fwje8IF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Teddy,

On Sun, 2016-05-29 at 14:17 -0700, Teddy Reed wrote:
> Wow, sorry for lagging behind in the discussion! But I love all the sugge=
stions!
>=20
> This 'hybrid' approach definitely fits my need for boot testing and
> enabling rapid development for the more-dynamic userland and
> non-driver tweaks of U-Boot/Linux.
>=20
> If possible, and I think this is the current MO, can we use the
> openbmc/qemu as staging for changes to be up-streamed?

Yeah, that's the plan.

>=20
> On Tue, May 24, 2016 at 5:19 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Mon, 2016-05-23 at 17:21 +0200, C=C3=A9dric Le Goater wrote:
> > >=20
> > > >=20
> > > > Any work-arounds included in the fork should have an obvious immedi=
ate
> > > > benefit and a plan to phase them out, and if that's not the case th=
en
> > > > they should be rejected. If it's more work to maintain the hack tha=
n to
> > > > implement an accurate model, then we should do the latter.
> To fit the hybrid-approach, the development board models for the SoCs
> can be the machine targets for the non-accurate models. Then you have
> an ast2400 target that may include some work-arounds or devices that
> allow for more-rapid prototyping, as is common with devboards. This
> fits with several other qemu ARM development boards too-- like the
> vexpress suite.
>=20
> The board-specific models, like palmetto-bmc, can be held to as
> absolute of model representation as possible. For these boards, no
> work-arounds should be managed/merged, IMO. This makes for healthier
> and more-manageable up-streaming.

This sounds good - I think we discussed this briefly on IRC in the
past. I was a bit hesitant on the former as upstream told me to pull
the machine definition out from the SoC file (fair enough), but as you
point out the vexpress machines do what you're suggesting.

A lot of the discussion was motivated by the lack of an ftgmac100 model
and whether we should integrate something like the Cadence GEM. This
has largely been resolved thanks to=C2=A0C=C3=A9dric's latest efforts, but =
at
least we now have some approaches to handling approximations that we
can use in the future.

Cheers,

Andrew
--=-yazIMp1ZIi1Z6Fwje8IF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXTSo2AAoJEJ0dnzgO5LT58dgQAKGYbHB0CeCbiqU3c3pikfTX
xgmEf98VvZ1SVeQd3fW/Bs57NWb32/mwfJH7bNkY4RjoycYZubwL84xV/zfl7aa9
2LhMVa54b8nG2agGc6koOjVJbcMGvIbQBGziPunmRznru741MFwgAsQG060DqeI/
bjEz+rcVyR2W7LiFCbvvytTfF8uBcen0iEVvWoq3f2GUIwz+I0yvY31jA/t2+GaV
F+gY8JrsXTJuIehWUVZD5RexGMuNsnO2Vq9KCh9IX9b4fBh28W8IWQxzNWNeoggw
9s/Z53Y9yDnCzixTfi4kYDpemQMI/Di/P1raemHM1HN/Cel/eY9KUg7zneG09kDK
0BcoxUEDuFARbmkaF4w/X8+RfWdQ3BBapMXttpyLcad+BwLgZwQQbu0FCZ3bnTXP
ausQPB8yMtITPzMYHMyvdzjpRHWcsD8Hqfs2fWiKSDv/A7y4VwWjS5nIMT4Pja99
LsaWzVUqRKy0cvNtBwCuJ5ZbL39RCQAtq4kvwcdUdjw+mPlV+kAX9cwsNevXglYE
eqW8hh3QJoqWz2/QsOaMYqpqr1oNV1Fg5oK1m6dF/WNot300uevA2ZlpseCNpgLr
bV+iNws8Uas8T98ewZKQFREH249jrcDZtRDEv62f/nP1oXtdQVWFmIdn9q7l8sGy
wZ0Zj4iJJBs46w412c1B
=NBU4
-----END PGP SIGNATURE-----

--=-yazIMp1ZIi1Z6Fwje8IF--
