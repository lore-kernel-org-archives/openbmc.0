Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B29CB1A0297
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 01:43:39 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446475415099718.9843377207611;
 Mon, 2 Nov 2015 06:43:35 -0800 (PST)
Date: Mon, 2 Nov 2015 08:43:33 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] stop the build break for btbridge on qemu
Message-ID: <20151102144330.GQ31364@asimov.austin.ibm.com>
References: <1446469915-23163-1-git-send-email-patches@stwcx.xyz>
 <1446469915-23163-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vsi50HYs5tPfr+1I"
Content-Disposition: inline
In-Reply-To: <1446469915-23163-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151102144330.GQ31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 14:43:41 -0000


--Vsi50HYs5tPfr+1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 07:11:55AM -0600, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> btbridge is not even part of the qemu image
> ---
>  meta-phosphor/conf/machine/include/sample.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phospho=
r/conf/machine/include/sample.inc
> index 2b8f986..e71b85f 100644
> --- a/meta-phosphor/conf/machine/include/sample.inc
> +++ b/meta-phosphor/conf/machine/include/sample.inc
> @@ -20,8 +20,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl =3D " \
>  VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers =3D " \
>          host-ipmid-oem \
>         "
> -
> -PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?=3D "host-ipmi-hw=
-example"
> +PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw =3D "host-ipmi-hw-=
example"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt =3D "obmc-phosphor=
-chassisd"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt =3D "obmc-phosphor-e=
ventd"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt =3D "obmc-phosphor-fan=
d"
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Brad,

Can you confirm this?  It doesn't look correct to me.

The qemu system doesn't have the BT hardware, so we shouldn't be
installing the 'btbridge' application.  I think we were going to use the
test application (host-ipmi-hw-example?).

This change is implying to me that we should use host-ipmi-hw-example
everywhere which is certainly not correct.

--=20
Patrick Williams

--Vsi50HYs5tPfr+1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWN3aSAAoJEKsDR8wtAMEZeOMP/35KhvhUuvXNZsgPxgMsJQYv
/g6bqad2K6x2l7I7elhdwEuiUyD+F70K4OrnaHsJ3ToiTzz5JCs4x/0uUpw7tJtH
7XEHlBAxtB8O8s7IKnZmbgwF2bjTyWgtyQMV+QRM7GptEPAPCMpImGaqYD1wpdVy
pWLr8AXbOioNC4CdEtYLi3PTogu/8EXl+IY7PsfLAWrTEGR6Xkgdf4Tkh/5pfoO1
1nZKYik3jiOy4SypC/Z8/24k0eVCWNWODhZscVpv+ib43l9GVt4UIMSYy1c+4My/
3iA+A2DA4Zf5FQX/vZ16iL61abkKXUIJMDCkrJYpwPPHmgqhYBb++O4AcZCSW04R
ZJjtcXDV69mBrzN7CKkJ+iD0rwll9S/Rdu0s0PEI8eHp9hkUQ/EJggKt0f3F2MGF
ec8rzG9HgdS08xtrkCGIesGAcE8lUMG57/Qp4kMqBDy7kizFfBSMUfzYEJBH9PA7
pC09NkVtJEWbZqVNh5kZlXn/ckvNMfDUP8TovZ1ISHm3T+7mNKMbCY2TCmIrzm9Y
Juc+cFnoRbuAVEv+WpOlc4hVwXWaX/PYRp38ssmTJ8sAEDOaYbIb8tBgHgvzG+ud
0ZZKGbaUtoJwqoUUVx07HeidYS81TqMXuzqbAfHgr4dbG1AU/JKVLRR5QSh6uvCt
bNoONbGnNC96FlJNe/i6
=xSDL
-----END PGP SIGNATURE-----

--Vsi50HYs5tPfr+1I--
