Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNJkX1ywKzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 12:37:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=rL36FuO/; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id C91154B0063;
 Sun,  5 Jun 2016 19:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=yzHrI1e3QFGwmCwX/Rlib
 OMvlJg=; b=rL36FuO/LiNzBur0/2BEMtuRh+Adp4I6TCbTjH1J+7rRvV0XDxnHs
 PNkQ0eqk/N1WBr1xJA5g1Az5phx1/UYnZ8WUw0j/iveyu1tc0SEAct/IBTIDDhnP
 D9mr9vY9W0bpBEJWK/4mTmkJTkzCMlKElt//5DccY3JBquISB1JFcQ=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id CB6D44B006F;
 Sun,  5 Jun 2016 19:37:04 -0700 (PDT)
Message-ID: <1465180621.16048.16.camel@aj.id.au>
Subject: Re: [PATCH qemu] Add OpenCompute Yosemite BMC ARM board
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Teddy Reed <teddy.reed@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 06 Jun 2016 12:07:01 +0930
In-Reply-To: <CADUykerRi6FuovZEDOE1kg83kXSHPCZF1Jv7CekGjQVJnWbx5A@mail.gmail.com>
References: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
 <CACPK8Xc+YSYpSZifuTUoK7=zTbHYMmAhaNkwnAbr1S=E-d59-g@mail.gmail.com>
 <CADUykerRi6FuovZEDOE1kg83kXSHPCZF1Jv7CekGjQVJnWbx5A@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2s6mB1B5njs9fk2INm6y"
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
X-List-Received-Date: Mon, 06 Jun 2016 02:37:08 -0000


--=-2s6mB1B5njs9fk2INm6y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Teddy,

On Sun, 2016-06-05 at 19:11 -0700, Teddy Reed wrote:
> On Sun, Jun 5, 2016 at 4:26 PM, Joel Stanley <joel@jms.id.au> wrote:
> > Hey Teddy,
> >
> > On Sun, Jun 5, 2016 at 5:37 PM, Teddy Reed <teddy.reed@gmail.com> wrote=
:
> >> The Yosemite BMC board is very similar to the Palmetto BMC. They both =
configure
> >> an AST2400 SoC and have rather simple device sets.
> >
> > Nice!
> >
> > Are you planning on sending this upstream?
>=20
> Yeah! I'm not sure if the IBM team plans to push the QEMU changes in
> the OpenBMC fork upstream en masse, if not I can also send a similar
> patch once we work through a few revisions here.

My preference is that patch authors send their own work upstream, at
least for the moment. I'll aim to be a maintainer in upstream for the
Aspeed bits, but I'm not across what hoops I'll need to jump through
for that, and until then it's probably best that everyone submits their
own patches.

Cheers,

Andrew
--=-2s6mB1B5njs9fk2INm6y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVOHNAAoJEJ0dnzgO5LT5IpkP+wb/JNQRQrCU/TgDDH8LLUD3
R/+liXuAYa4T0PpSaasHjxQC6muE0vdifFLr6CLcmxclMDbs6+2cc8yNQLxv6h1v
CGyZK3tIEsx11/zaNccYwH06TGWAbeCXAqViMvGu903H/a9PXJC3psY6OgfgnfF+
6YQxWxssOMBvfVzwOnZs9/9NyPzcAEClktI3Kki+8BYCFvvQDWkF15E4ahzc+b3M
Pz1adABqzis05HAJ/sKca/mQw3YM9+Sf0u3lweI6PiMZ1vSfH200T6EB00oFybHT
A/P6/TO48LwykLbpl2ymoJCxiHtENyTf3F6RFwAwU3dZscXCJrmFXCF9jhWGimRM
FvswsyiQRUmqhQcB47ff5YjDDiWAE0pDuI/JO9JrJN9V7SuJ7gj74PcqA3zv/kqW
KX+uLiluxFr0ub0Pz5SqsaX1KQjaQssJh+xuST80tUmx5nDdOGbnSgHhJJVH1NKS
YJ3y+4HSe8iGzUeDH2xAhfH0amooFCNtnGmxxJs6lBX4QkfR1eY1wlH/FJQ7bhKb
gMbq5SIh/XuifioiBK9i2ep3jSq0sN0iO73D617Fzy5NgtkI+AZPLjNJQWIbynSb
zKdqOF7KxnU6lgv1r2sVsLfLrcMl/gzVbNGLtIR3kt+g4roolsdSN50t6RPH9af7
puczxBy89SXJkM6Z4que
=5yku
-----END PGP SIGNATURE-----

--=-2s6mB1B5njs9fk2INm6y--
