Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDtFw63bRzDqPX
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:20:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=qn0vNUJ1; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id B814B31A075;
 Tue, 24 May 2016 17:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=i6GExuMEDGZw8Y3/e1V2f
 FUJ+hs=; b=qn0vNUJ1fW5OD0M/hNvA+ZkiI2f+HAss12B9OFfNbkmZ8WjfVQM48
 7sbB7w5TASUtQTIcZgivgkjGsfE0AKaOQ2ifqOtvGuW+JQFn3j0cnGEG0pQd93s4
 UgYzVYGPOhEXtYBcqI86ezXmT007fCsZQrm1oC8YbyfKLjI4kXyEW8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id DE48E31A073;
 Tue, 24 May 2016 17:19:58 -0700 (PDT)
Message-ID: <1464135594.20948.16.camel@aj.id.au>
Subject: Re: Aims for BMC emulation in qemu
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Chris Austen
 <austenc@us.ibm.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, patrick@stwcx.xyz, 
 teddy.reed@gmail.com
Date: Wed, 25 May 2016 09:49:54 +0930
In-Reply-To: <57431FE2.3000506@kaod.org>
References: <1463638966.2703.209.camel@aj.id.au>
 <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
 <1463981199.2703.286.camel@aj.id.au> <57431FE2.3000506@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1C0mOIoZRalsQuTQVyj8"
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
X-List-Received-Date: Wed, 25 May 2016 00:20:06 -0000


--=-1C0mOIoZRalsQuTQVyj8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-23 at 17:21 +0200, C=C3=A9dric Le Goater wrote:
> > Any work-arounds included in the fork should have an obvious immediate
> > benefit and a plan to phase them out, and if that's not the case then
> > they should be rejected. If it's more work to maintain the hack than to
> > implement an accurate model, then we should do the latter.
>=20
> Are we planning to use travis to boot the generated flash image with qemu=
 ?
> and eventually run some tests in the guest ?

That's certainly something we should be aiming for, in addition to
something we can use to smoke test u-boot/linux as part of the hack-
compile-test cycle. With a view of using qemu as part of CI I had a
pull-request open against openbmc/openbmc that patched the runqemu
scripts to integrate the palmetto-bmc machine, but Patrick had concerns
about my approach there so the pull-request has been closed for the
moment.

I plan on taking a quick look at integration again shortly as some
relevant patches turned up on the openembedded-core mailing list.

Andrew
--=-1C0mOIoZRalsQuTQVyj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRO+qAAoJEJ0dnzgO5LT5wEMP/2x+QIVm/6twSGFeWoBPCDnE
2cB5G9i6BOJ2M0FTD+wAhAGiaes67ZY5Quu2LehOrkl2rX1yqj5lEX4TrXYhKGt4
pC8x/Mq3AOBSsCP7gBvZRIf8Wf3nzPVX+AanPO6QZo+mvqmR3RFIgm9tW32t8sGE
w19aBDatahyAhkheYUlfLd20rEx9FRU6ssdd2I9WBY8DEcexcL0RZDAI4nUi143Y
Ip8WoCupw9xy27RqzBolE0Tp1rXrZdJ4n/iPhd21Derfh9aKtZsM70oVEVM1xEr7
3a1bJm7Gu1EfB1rlNMCNdX9CBvd2pBLRt6y30hrW0PawjY3PYoJoXHgENY0FWO4Y
7U1FtV6orktk7pL9E09X1zPxyCQ3VcBlWza/6ZB7aboThBJaFsKxF65EIanrRW7z
oaKqmQFZG8TW7NjUPrIZTBw3WY7DvaEjZAHKBiWEeooCQIFRBLnfzo+ihi2y97Ay
IxN35azHCkpb4iIGvPmdbgMVZQUr/5LiEG6FYT0/IulBgJ3dH/GbVcRfWdlISZnF
WwaW85gQxfSKXL2ZWT0v1abegXfOS0JMa37sxz1W583HQNcEdogzXIDzUMtVOyyu
LWT/Z0hQ6L96FEvtMn7AIG4qMoyh3hA8Ubp4vPrf+tPiMgrQ9kMwe/Ws4NR9r7oc
H3tRDgRpMIi47m0deAJX
=wP8H
-----END PGP SIGNATURE-----

--=-1C0mOIoZRalsQuTQVyj8--
