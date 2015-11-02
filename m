Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 23C8E1A02BA
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 01:46:14 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446475569996301.8945580324212;
 Mon, 2 Nov 2015 06:46:09 -0800 (PST)
Date: Mon, 2 Nov 2015 08:46:08 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Add ipmi fru write to dbus
Message-ID: <20151102144607.GR31364@asimov.austin.ibm.com>
References: <1446469909-23102-1-git-send-email-patches@stwcx.xyz>
 <1446469909-23102-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0ZpWocbG2H/Vq+uQ"
Content-Disposition: inline
In-Reply-To: <1446469909-23102-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151102144607.GR31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 14:46:15 -0000


--0ZpWocbG2H/Vq+uQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 07:11:49AM -0600, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-=
fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> new file mode 100644
> index 0000000..a4dcfab
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Phosphor OpenBMC WriteFRU for OpenPOWER systems"
> +DESCRIPTION =3D "Phosphor OpenBMC WriteFRU for  OpenPOWER based systems"
> +HOMEPAGE =3D "https://github.com/openbmc/ipmi-fru-parser"
> +PR =3D "r1"
> +
> +RRECOMMENDS_${PN} =3D "virtual/obmc-phosphor-host-ipmi-hw"
> +
> +inherit obmc-phosphor-license
> +
> +DEPENDS +=3D "systemd    \
> +		 	host-ipmid \
> +		 	"
> +
> +
> +RDEPENDS_${PN} +=3D "libsystemd"
> +
> +TARGET_CFLAGS +=3D "-std=3Dgnu++14"

Does the makefile fail to compile without this?  It shouldn't.  We need
to get that figured out if it does.

> +FILES_${PN} +=3D "${libdir}/host-ipmid/*.so"
> +FILES_${PN}-dbg +=3D "${libdir}/host-ipmid/.debug"

Are these required?

> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install() { =20
> +        install -m 0755 -d ${D}${libdir}/host-ipmid
> +        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
> +}

We should use 'make install' for this.

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--0ZpWocbG2H/Vq+uQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWN3cvAAoJEKsDR8wtAMEZ0cIQAJhyceVMPoL8X3mmXpxduiTp
zwQ49yItTn8Ks7u5+Oxo0nQp1MA07rWppGipsc1WuJ1pzn6QrasIyI+zn6/7s+tW
b9vTsyz6CRDQpe2i4Chwxx/TAyoRTw/OIHl0DCD2BnrtYrBc2C88gtHthjkwt+Jd
kfi5DWkbYY/Q+S9oaYIMPnnGF0nAM6psjdtTBDaDSRmNcEX/wxQ6DfMMrgMTnSUQ
it1hMwOk8WdP1kYvdHYbQRxTRT1RUnbBHHCx6UAGN1FDjMHOUkg3H3orryh0LxVU
UwmshmjAhGZrgGZicoTw3i6Cjo1gdO44LV9GcU+LjiM6zaWZGmEk4b+0cp/N3YyO
tJDkGzcXJL3h1/ZWLB92SVzRAX0WjUU7sz+qDbkNLOjdXl0AMdAJo3PrN70EZIou
ONDF2O+y/vKhJf/0yk9/AZSM4S0it9NqZR2R/V9rRSojZwoFuOfyebTBZfO6yP/Y
vMaPBqesY+PsiMPJl1UPyNniyz9q65Hfq40t5vR6VHu5ThrPtktRFG3KrlYQ5/KP
3suR4GJfVoXQMlkdTNg5y5Hb899syRFkevimJF/3yCYUvbKqflgf8SFFoWyRDeUs
HIT23/MwZm0uJDBd0FhfoDfiS9J+fXfTII809wfqEutMvZvhgAZ0APHgjTrhxXVa
U+81bwz5SxJuAiLGE7vT
=scD4
-----END PGP SIGNATURE-----

--0ZpWocbG2H/Vq+uQ--
