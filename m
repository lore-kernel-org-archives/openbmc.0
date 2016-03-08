Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 615361A00BC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 13:53:32 +1100 (AEDT)
Received: from localhost (mobile-166-176-121-55.mycingular.net
 [166.176.121.55]) by mx.zohomail.com
 with SMTPS id 1457405608578990.8728067672216;
 Mon, 7 Mar 2016 18:53:28 -0800 (PST)
Date: Mon, 7 Mar 2016 20:53:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH ipmi-fru-parser] RFC: use cmake.
Message-ID: <20160308025325.GK6601@asimov.pw-on-the.net>
References: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XeHoDVNgd7WrdX=RuoFcjQJvK4YSh8SLArRJpBuZjbWAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Content-Disposition: inline
In-Reply-To: <CACPK8XeHoDVNgd7WrdX=RuoFcjQJvK4YSh8SLArRJpBuZjbWAQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_02036_2
X-ZohoMail-Owner: <20160308025325.GK6601@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 166.176.121.55
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2016 02:53:34 -0000


--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Joel,

On Mon, Mar 07, 2016 at 02:30:51PM +1030, Joel Stanley wrote:
> On Fri, Mar 4, 2016 at 9:00 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Patrick Williams <patrick@stwcx.xyz>
> >
> > There was a previous proposal to consider autotools (see
> > openbmc/ipmi-fru-parser#7).  This is an alternative implementation
> > using cmake.
>=20
> I'm not a fan of autotools; I have not chosen to use it on small
> projects in the past.
>=20
> That said, I have stopped working on projects due to cmake's
> downsides. It's overly complex, and no clear way to implement rules,
> making it hard for newbies and experienced developers alike.

Can you elaborate on this?  I honestly don't have much experience with
CMake but from the little I have played with it it seems 5x easier than
makefiles (which autotools still use via Makefile.am).

Compare the gigantic m4 script required to test C++14 support in
autotools vs two lines in CMake:
    set(CMAKE_CXX_STANDARD 14)
    set(CMAKE_CXX_STANDARD_REQUIRED on)

> I would prefer to see autotools implemented by one of our team members
> that has experience with it, and they can help the rest of us maintain
> it.

It isn't just a one-repository thing though.  What is going to happen is
that even a well-written autotools is going to get copied and modified
and copied and modified into all the various openbmc repositories.
We're going to need a few autotools experts to keep watch over
everything and avoid hit-by-bus situations.

>=20
> I noticed in my feeds a new project created by some of the Xorg
> developers that is a nice example of a clean, well structured project
> that uses systemd, dbus, and autotools can be found here:
>=20
>  https://github.com/libratbag/ratbagd
>=20

That example has a 290 line m4 script, 160 line configure script, and a
100 line makefile just to build an executable out of 6 .c files.  Even
if it is "clean" there is way too much to consume here.
   =20
The "meat" of the dependency description is in these lines:
    PKG_CHECK_MODULES([LIBUDEV], [libudev])
    PKG_CHECK_MODULES([LIBSYSTEMD], [libsystemd >=3D 227])
    PKG_CHECK_MODULES([LIBRATBAG], [libratbag >=3D 0.2])

CMake has a similar macro via 'find_package'.

> Cheers,
>=20
> Joel
>=20
--=20
Patrick Williams

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW3j6lAAoJEKsDR8wtAMEZZksP/AgkTxdxpy7guL+JH9c+HyAt
7Gqbd0PQdSfUitPQ/AsFz31XRT+uTOO0Q++Af+aAaQt1V11IlegJOAU3FUI6aCUo
Jmfz/17ggoolG6pkI/xDAkGM4hkacpLEjtX/UXchIdK8hfYhd5gAWNzjOK5kDRNf
+QvBCJYzYwwxAD+nbuAJj+aaz9k274k6lTKzGTyRpt1xLsgcVRwijrTVwkRi9zOT
ZYpeLi3VmSz3xN57g3raGENoPfGi5/w+vSlhc0Jbl73o9oAYL44JA/a5kqZ/ovm3
wxgHl1PZmC/mEIww9RXLO+jNNn/JyZDtkFXIu6Qi5UED/hdq7clu6ab52HzTfA90
xNYD9R1Q61AVmZ/0svnI04j2YgnXVRdoKDDBsci1DbGVtVoP/BFPgvai4fhf2mzl
Ts/E75kjMpps0YKfxBh9X5y/DnwYuQ65iupzLpgaDI/dpDrnoaSrMlQrDB6LIhDb
H7fytvv4bhfJIdrMYFxNsBk4nMzhglpAbjmkc/N381RKSA31GkSIRGBok+U8YDCa
MRaMrNIH9EyaPAaODdOMeOfboUMmiXPTQPE4JggLC0tW+iGsVlslOd2syvTxBK7i
ikNbYG8EMhLpGxKwJmzmJJxhRy2MawmC1KdbTfSjU7rHLqJJx5HkOp74riTe0PfS
AZ3J56ExZa79/ghSLV+G
=EB6C
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
