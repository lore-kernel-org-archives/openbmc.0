Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4LZ86FQnzDqQn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 04:04:48 +1000 (AEST)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1470247480683544.8222619773511;
 Wed, 3 Aug 2016 11:04:40 -0700 (PDT)
Date: Wed, 3 Aug 2016 13:04:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux 3/4] drivers/fsi: Add link presence detect
 functionality
Message-ID: <20160803180438.3zrne7e4pg4wumsd@asimov>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-3-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8Xeztb_0QiE8dv45pKzmynGKukmZp7xY=Jn8TW_=hMrvWA@mail.gmail.com>
 <CAA0LjjU_b2QEzuqPhew-R9ZC3XeqoPkom1GxjMQL-zYAMjStdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q3ecwikb2f523ljd"
Content-Disposition: inline
In-Reply-To: <CAA0LjjU_b2QEzuqPhew-R9ZC3XeqoPkom1GxjMQL-zYAMjStdA@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 03 Aug 2016 18:04:50 -0000


--q3ecwikb2f523ljd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2016 at 12:26:08PM -0500, Christopher Bostic wrote:
> > Is there a reason this is an array of longs, and not a u64?
> >
>=20
> This was written when the only host CPU was 32 bit.   Question going
> forward is what platforms will we
> support.   Is compiler smart enough to allow use of u64 in any case?

Yes, you can use an u64 on a 32bit platform and GCC will emit "the
right" code.  If you are doing 64 bit arithmetic it may emit more than
one instruction, but for bit-masking like this it will probably do it as
if it were 32bit words anyhow.  Using u64 yourself saves you trouble of
having to express it.

--=20
Patrick Williams

--q3ecwikb2f523ljd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXojI2AAoJEKsDR8wtAMEZ0HcQAJbm77TU5SMHEY+DnahB+nM3
0bMBPMnyk9Elkhso+L+yc2/MkkXTnjK/5yNm6VT7jb0V9zs72DYeUPXeg2PBdv0W
MxRkwNS5sfOOeZMlnOwA+x9X4eeBNoPp91R2VY2HoToOUvVug6ZOuiMhiCf4qfPA
BY8jJCUNZ2dp6MNTKiFficW+ov9AV7dBz2TYv25A6VGBfATM/I8F0uw/jGzSwfUT
0RYAlDIT/wlaORqSmrd3Ln2G8oE80bmHmUGFgCPMZVMeK8MI7NBX4t04EjNKjSlL
QaXcYh4E0rO/7LvYu7e1i/4T6AO+m7C5Qxp1s/z3oQS85BqHaC7uE+AB6ZP5zvq6
HQRhlkELrpfCMG8KzvXOP6WpNvCqX4839mMOuamesCl56hkCFAbbdejWwnSqQRXC
+b4IsaQ6/LTjJCRD7RDNoRz47aYg9NnFZj5TcMKZYGQZEKwCLMHE+SUXbaUVAlW2
TLIkPd8TVOpSmm2aqkCGmpynEOI9HL1DnzpO+Yv7afP+JmqadJ87UIa/M9BgGtE9
cegGtW1tlhO7N151LSHcbgVfj8MJnZ4fJKT6WfCIs+BQ/lyYiEQjmqXAc0LazyFS
koMTG4ebG6+f7vQGNGXgRsb7o9R+VDXecHsfkpdpd7sGC1d16wBtiUt9GmIEJDV1
HHHxDWl/UFxsr/8tqbhT
=xbya
-----END PGP SIGNATURE-----

--q3ecwikb2f523ljd--
