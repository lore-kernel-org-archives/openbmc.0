Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9LbN0q92zDqTT
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vFThoyU+; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 5552A103005E;
 Wed, 18 May 2016 23:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:content-type:mime-version; s=
 aj.id.au; bh=C5ktLqGbuxmDIqAYnnN30Z2vefk=; b=vFThoyU+bxxq8qpo9Cj
 soIWpmHg0weUGOd+1Q4eM8xabe6X1HaNVefI4joxwCjGztonReDnt1JLmkNChFI2
 XhnKpgGQw/TpbzfANzrEFnOAQJnEikBl+WTGPxvOw45hnLHqW8MWeK7fjk/PQa2v
 +lCW6pMAf86mundQNvmRMkQk=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id C1B951030063;
 Wed, 18 May 2016 23:22:51 -0700 (PDT)
Message-ID: <1463638966.2703.209.camel@aj.id.au>
Subject: Aims for BMC emulation in qemu
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Patrick Williams <patrick@stwcx.xyz>, Teddy Reed <teddy.reed@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Chris Austen <austenc@us.ibm.com>
Date: Thu, 19 May 2016 15:52:46 +0930
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tzD61UPGnzGraq14+EpT"
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
X-List-Received-Date: Thu, 19 May 2016 06:22:56 -0000


--=-tzD61UPGnzGraq14+EpT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,

There's some divide as to whether our qemu machine types should
accurately describe the hardware, or whether compromises can be made.
We've been at one extreme with the poky vexpress-based qemuarm system,
but are progressing towards machine types that are a better reflection
of the Aspeed SoCs.

C=C3=A9dric, Teddy, Joel and myself have been working on modelling the SoCs=
'
devices but some are more complex than others. For example getting
network up and running is desirable, but the the ftgmac100 code that
exists[1] has critical bugs and isn't upstream (though we've started
fixing it[2][3]). We could use a different NIC (e.g. the Cadence GEM),
but this doesn't reflect the hardware.

So, do we compromise or not, or can we avoid the problem altogether?

Accuracy of the models is useful for kernel and u-boot development,
where you can iterate quickly on your own machine to gain confidence
before deploying to hardware (but obviously requires the models to
exist).

Alternatively, compromising on the models can allow us to accelerate
userspace development, where some of the hardware details are
abstracted. For example, it would be useful to add a network device so
the robotframework=C2=A0tests[4] can be run. Depending on what you are
testing, you might not care for any hardware details.

At the moment we have a palmetto-bmc machine type in upstream qemu
(2.6.0) which describes the core devices. Maybe the solution is to keep
such machine types as an accurate reflection of the hardware, and
define others that have relaxed accuracy constraints for different
circumstances. I expect we'd be maintaining a fork if we did so, but it
would evaporate over time as more models were developed.

What are your thoughts?

Andrew


[1]=C2=A0https://lists.gnu.org/archive/html/qemu-devel/2013-03/msg02601.htm=
l
[2]=C2=A0https://github.com/shenki/qemu/tree/ftgmac100
[3]=C2=A0https://github.com/amboar/qemu/tree/ast2400-net-ftgmac100
[4]=C2=A0https://github.com/mkumatag/openbmc-automation
--=-tzD61UPGnzGraq14+EpT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPVu3AAoJEJ0dnzgO5LT5SAIP/1XEKycIjJv6dsPVJ0PAxA6Y
2sS5ZKn5kY75lOpU5FAqfpeeeLBr7YxgntQaWaQZeHscHWmkUH4/DqrBzChzsi1E
hd4Ez7eEDqPfJNgkmuzrLUegh3tqepkflpWCcGU1Sx5MXwPYCc1wD9lII3/UjFLC
Z4Aij4p4AaZfJv38548OnMRuDIglMkE25qwwYgfmycrsBYmyzhr4N7E1Fij/6z0A
apFAV2BpMqU/oVX6wNvirWAtnU89RymS5gBYQLF3Q9hRIDHTfiePnYVEQ0342LZL
A8EEly/c32WYJ/dU0QWVNXEMtHAoSIKAMhiVekTxFbWy9CbleIocCkj2f+Mj6QSA
Rr0u1RRzjqFZkf3FgnxmHBg4UyYA0VNaL7HWx6k0hhs3KmcqESi6Fw7GEHcVmzY6
eCkZstwPOsJN11bSxY8A/ufLdcJ7oNAvNaEaGmIRA9x+xgBmAN4Rbj9WS14GB3hz
P0DAW57KGiQcGTBBRRJiFIP/MR9G4lLcSiILY0m4LkhUY6xcMWsoBOPIwHIV2/bX
qSfo/EZCLzneXj9RTybV1gQlWjtjyRfSBzYtoSzouipL8A+LokmI6DPe1EykMxHi
tk9VDWzRodUk28QKs29Wv0O3rg79wTB7FdRsxGcsCHnC3XS2wod0nal21aiAieGg
MwhgA8KaeBzWMNMeuZjG
=ux1y
-----END PGP SIGNATURE-----

--=-tzD61UPGnzGraq14+EpT--
