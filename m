Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqsvn6QlwzDrPL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 12:52:05 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1475805117200239.44090236868112;
 Thu, 6 Oct 2016 18:51:57 -0700 (PDT)
Date: Thu, 6 Oct 2016 20:51:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: I2C device driver names
Message-ID: <20161007015152.GA17914@heinlein.lan>
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 07 Oct 2016 01:52:06 -0000


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2016 at 10:42:24AM +1100, Joel Stanley wrote:
> > PMBus Power supplies:   ?
> >
> > MAX31785 fan controller:  max,max31785
>=20
> Doesn't appear to be an upstream driver. Please open a ticket.

Timothy @ Raptor wrote a driver for this recently, didn't he?  Joel, I
thought you were going to merge it in for the time being.  Timothy
mentioned that there was some upstream work going on in that subsystem
that was preventing it from be merged in the current state but that the
subsystem owner was likely going to take it on.

https://patchwork.ozlabs.org/patch/672045/

--=20
Patrick Williams

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9v+4AAoJEKsDR8wtAMEZXuEQAIElr3uOyK3p7ArEuKHRFOQJ
tEXGshZf2ZIrjojBC/3bQuvCW+7jQbNjm27FhAy3Y3UDvRZSRZHIZm/W+Wp8vPf0
TqoZylR2aYJWq88n1y0T7atyUnCIYiBZEmJUyuNrQt2omRkraioGfPEx2B5vhiAB
0kLfB/mBCMCj+L+u00XxsCwsDNEQHB8R2e1CgxpkNjGH7C+qRiOS3Z5bo62OHmeQ
CHmf690G2vhZ1W6LkKt2BuL8YQFsA2w+22Yyk3DqYdgcyJTw61gPUhNZ1uaZbktP
JzCnYQYdKg+EdQEXNyTEgIoK+mKKLTOFHIb9qPriXDIl+Z76tm848eoxrGG5lSp6
MT8JZtCZsxBUquEfrgkHgE/dNJoaQO50wcBjWTQaH33bokhJNCkwcP66CMBjKQL1
Difrbo3sxfQ5CGffxUP+xR1pIaGDQLqoX3invJUsQ3ihEiTO6gdWl+nopSTSQ7Op
CeJmpekN6LKGx0uqhQn8vsss+P+iA7ANpYcuOs7SuSDMsRUrMl7zvDcOcEcXbBP/
05AUe3+xcc+ivwbgAvsgudQ/y7GPOJ0UPs3s2QxZPkkaIdSRO3zBBxB3oWHRaHQT
Slb1nP1h6YKR/UzDw1Y4T5V36kn9LhR7/FQvuYWby61ok9nM49MA3uOBrkKBuq4h
J+Rxk/VS+FRz/OwCwJdn
=2GXV
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
