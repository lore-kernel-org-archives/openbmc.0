Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A0451A03C6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:47:43 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445399260425467.18647940336916;
 Tue, 20 Oct 2015 20:47:40 -0700 (PDT)
Date: Tue, 20 Oct 2015 22:47:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 2/2] add devmem utility
Message-ID: <20151021034738.GQ13316@asimov.austin.ibm.com>
References: <1445377251-25832-1-git-send-email-patches@stwcx.xyz>
 <1445377251-25832-3-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ickEXl+ukcSQ/3E"
Content-Disposition: inline
In-Reply-To: <1445377251-25832-3-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151021034738.GQ13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Wed, 21 Oct 2015 03:47:44 -0000


--4ickEXl+ukcSQ/3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2015 at 04:40:51PM -0500, OpenBMC Patches wrote:
> From: Norman James <njames@us.ibm.com>
>=20
> ---
>  yocto-poky/meta/recipes-core/busybox/busybox/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/yocto-poky/meta/recipes-core/busybox/busybox/defconfig b/yoc=
to-poky/meta/recipes-core/busybox/busybox/defconfig

We shouldn't be changing files in the yocto-poky tree unless it is
something we think would likely be accepted by upstream.

I'm pretty sure there is another mechanism for adding configuration
snippets.  We should add this through that mechanism in the meta-aspeed
tree, unless someone else has a better idea of which layer it should go
in.

> index 4f5df9e..3deb4e5 100644
> --- a/yocto-poky/meta/recipes-core/busybox/busybox/defconfig
> +++ b/yocto-poky/meta/recipes-core/busybox/busybox/defconfig
> @@ -706,7 +706,7 @@ CONFIG_DC=3Dy
>  # CONFIG_DEVFSD_FG_NP is not set
>  # CONFIG_DEVFSD_VERBOSE is not set
>  # CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> +CONFIG_DEVMEM=3Dy
>  # CONFIG_EJECT is not set
>  # CONFIG_FEATURE_EJECT_SCSI is not set
>  # CONFIG_FBSPLASH is not set
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--4ickEXl+ukcSQ/3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJwraAAoJEKsDR8wtAMEZKNMP/iPntEW99FdxgOnUJf93uGV4
WaNWE1lRYwn4GnViI/BfVsvCBhznrLETTAud5frhMUWw5O7takcaNOg140uylGcZ
TLQ2V15Q2W3/cPsV8y56fz6mKDc2wXQF75sPCfCsle3roUFQOEHU2GXLa/FoLXUO
TTqQzM2PMcW6jorzLwOR6xYceIJh1qJ6HQ2ntlr957mJmHRMxDv09RPe/+kGBaKz
hzsYl/GLlKgqvsOrjvR4EhXS56cuclM8R8Kyxuyk0tXGEl5IC4TG1YMwfZtIo6pI
ByN/hks1lIBRTUygWVr5omxJm98uvei7DAnHWWQi0qn2U/MUcOWW0H8P7hXU43tx
MLOQa6y3DmH2ZR/k2tv0G3UIqSZpDf0YyOj7JlPHd7E9qRXkz52XRTtlni4VXMbt
nQU/kDMt1Kzg7V1w8wkxCyPn4KsSwA528jzOi0ETBdfxNC0ikxdSD0JdSUFVTkEO
yB/wn432kewDVuvTMZzYGj6U+yn7hFhdb6Rzh7WNZ7xKHF/FqQfEcwMOuu1xW1Pc
ajCLG5kJvO78+zTe7SNPEM/Npqv8m0p0gad4frw3Ru65P7loTOkiVl4+OGL03HID
bfEd/j6mtF+fFGenqOKZKUeXyGmKt+vYplRd0qNvMa+Opsk9WBCGcy8hpmz4PDaS
jezEVLanILUnd0jWwaFI
=5A6E
-----END PGP SIGNATURE-----

--4ickEXl+ukcSQ/3E--
