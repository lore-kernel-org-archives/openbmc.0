Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDT5C13YYzDqGr
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 16:26:54 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1486013204144579.3327052834127;
 Wed, 1 Feb 2017 21:26:44 -0800 (PST)
Date: Wed, 1 Feb 2017 23:26:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alistair Popple <alistair@popple.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: Users of SBE FIFO kernel driver
Message-ID: <20170202052642.GD5504@heinlein.lan>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <4820133.vKp7aKPARx@new-mexico>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline
In-Reply-To: <4820133.vKp7aKPARx@new-mexico>
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
X-List-Received-Date: Thu, 02 Feb 2017 05:26:56 -0000


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 03:48:02PM +1100, Alistair Popple wrote:
> On Thu, 2 Feb 2017 01:59:08 PM Joel Stanley wrote:
> > On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
> > <cbostic@linux.vnet.ibm.com> wrote:
> > In addition to Eddie's driver, in userspace we will have the code that
> > performs the power on sequence.
>=20
> Yep. For example as Ben mentioned the chip-ops also use the SBE FIFO. How=
ever=20
> we certainly don't want to put chip-ops directly in the kernel. It makes =
more=20
> sense to use a userspace SBE FIFO API to do the chips-ops, power on seque=
nce=20
> etc. from userspace.

What is being referred to here as the "power on sequence" that goes over
the SBE FIFO?  We do putcfams to start the power on sequence and there
is no interaction with the FIFO to the best of my knowledge.

On another topic, when we are under secureboot, get/putscom operations
need to go through the SBE FIFO.  Should there be a kernel driver for
SCOM with the same userspace API no matter which path we should go?
This certainly makes an application like pdbg easier.  One hang-up I can
think of is I am not sure how we are suppose to know and inform the
kernel if we can do direct SCOM or SBE-FIFO SCOM.  Maybe we always do
SBE-FIFO SCOM.

--=20
Patrick Williams

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYksMPAAoJEKsDR8wtAMEZ9+8QAJgc3TDpEar5O4UVaL5gDCzG
gfdj1Xps9SJIEUcuC/WT+TFTygckYvRXICzVHklBpg8zBA6UPrHIJnNaakxSK/q+
GU3yitfw4aF7zbFAl+j86J7aNR/bGBSNyU74WzrQLHvnWJWo1BrPu7JFA/vvKIy0
hZP69NqDZV9zsfkl7aeJ9wIvm9UOWUdBzn47nkC43ZzN8e1AYvMonCSz78Bo1LzH
66dH88sLV7lt8FX8CaiP1MwilPS/tla0C+cwHr7/pASZ9y/5O+P77n6u05SPW9nG
6b8EXV83+QAeSuTJVpAYuToiCvXiyeiQ3FDF3G9EGCWqYonUhZySy2X88mFVrGWs
niRNUTTg8sHs7hB33J7IplGu9dIabsj/fIqCIetFPljlGRFi4LA+fSLJGQQqWN1t
r9U6IrGPjpeMKQqV4Ogrv5nPlL7zBSW1nAKF7UupZXwpjx7QNvwdEBZD0N64iS5w
uunH1BIeER+t14hgfNOWlByD5B9NomsoHF0TSvGXh2fouHljZ4u9n3y6FpPSWTnN
WRQUC6Slc1pURyUQJ2NwajB1Y1s7aALd3YNL/p/2vfs/sLxDvRXMrmOLRulnTnL6
HtCDjhaZLK7GmGpwYDgYyk7O8aRnX1Ggt08/cr21uDjL7GZabTahfnDwpQ8NrhJt
B8qMZrwrCO6m27/K7JJ5
=W5Uo
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
