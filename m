Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYZ5J6hbZzDr3g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 14:10:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=p9lgrdEP; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 1553D6E075;
 Mon, 20 Jun 2016 21:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=93c5USQZnKhyxH6pmo0I6
 QXzrTM=; b=p9lgrdEPyCngmyASxZ/7g97ESWqMsaGj2HteSA42dgl0EBKjH9cIO
 qDh1Exjq9rhTs/kV6XRogveCvLZfj1yiTPkUn+j3vufYhQ91AF+El0nhD/7hfa1J
 AVPffoxc0rY65dSoqlx44jkJJcWAMvy/ojqHzGjNEIX5KIsQUC3IyY=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id D85286E06C;
 Mon, 20 Jun 2016 21:10:25 -0700 (PDT)
Message-ID: <1466482218.4344.57.camel@aj.id.au>
Subject: Re: [PATCH docs] Add Gerrit server info to contributing doc
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org, 
 Adriana Kobylak <anoo@us.ibm.com>
Date: Tue, 21 Jun 2016 13:40:18 +0930
In-Reply-To: <20160621020824.GK19968@asimov.austin.ibm.com>
References: <20160620135013.21797-1-openbmc-patches@stwcx.xyz>
 <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
 <1466473917.4344.28.camel@aj.id.au>
 <20160621020824.GK19968@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rVO7XwQjOrqguKsXPNma"
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
X-List-Received-Date: Tue, 21 Jun 2016 04:10:29 -0000


--=-rVO7XwQjOrqguKsXPNma
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-20 at 21:08 -0500, Patrick Williams wrote:
> On Tue, Jun 21, 2016 at 11:21:57AM +0930, Andrew Jeffery wrote:
> >=20
> > On Mon, 2016-06-20 at 08:50 -0500, OpenBMC Patches wrote:
> > Are we planning to list the projects that are using Gerrit here as
> > well? I understand there's only a test project at the moment, but just
> > wanted to clarify.
> >=20
> I don't believe so.=C2=A0=C2=A0The intention is that the majority are the=
re and I
> don't think we should maintain a list of them.=C2=A0=C2=A0It would be mor=
e
> straight-forward to maintain a list of ones NOT there.
>=20

Sure. Either way I think we should do something to document that we
have different workflows for different repos (this change is fine as is
though). This gives us something to point at when people ask. I'm just
trying to keep in mind the points raised in LWN's drive-through-
contributions article[1].

Cheers,

Andrew

[1]=C2=A0https://lwn.net/SubscriberLink/688560/9fa49b203bb0997d/
--=-rVO7XwQjOrqguKsXPNma
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXaL4qAAoJEJ0dnzgO5LT5Iq0P/3fayAonbpr8yEkPe2DBMKvn
mZ6xm3353LRMfo5tRXDCgoH82/nK+lVW1BgSNBmCQ0UVN/OVQ1pUJmmldfUmKzP1
CLnI0ejN8DEPZkGSMWa7+SBitwxXbOy5Cl95MsIzuLX92d0KxoicymgcENecf4E0
PwzWiQS4ZKcvDxm2wnfRPzkh7wJ5qks2E1tOKzcOtgoto0WNVrwQJCRoyGiRGQH1
/rbDKg0pDwL1Gki2cBvcQJPEwFhBOMBhsEYMeZPF4TEdTsX8JgXNspL133ogJgim
Ug1gZTwy8PMZE6pRoOZNUbyz/QnqEP6d0L4zxS7Hjng9WOw7B/ic0Zu/YKnbz9vD
x7xYRat1pCezgpqpiJXPkSXsK+Y11DpL5upOifLrn6pw88HgTi7JCnnGg1wVvzSE
UdQOqLooaWcR4UyRgNfVob6DsuI81ca4znbiJ3bm8XZNn7Q+X4IDNdAYu7wdZuBO
VanUYXwG5dUu7/QoWcajpnfqMUJvdRkQicEY5OEefgMcY2G5H6CrCPUaLNimdvSH
lzGr84fPuKcU0NXnY9hnFjA2ddPhBhe6Xurm0ULpFqMAvMjmwgKNeCAP6EnD5kV0
fgXe98FySnvbKqUnQMkW2NFnJ/XTMs/5XgHjNoMSWmM4qJjWK5ogpMMUHFZzO/VF
L7lDj+qnQYt2h1lICqpZ
=I/l3
-----END PGP SIGNATURE-----

--=-rVO7XwQjOrqguKsXPNma--
