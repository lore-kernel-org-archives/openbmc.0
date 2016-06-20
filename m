Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYQyZ31tyzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:49:10 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466462942163140.64565487726406;
 Mon, 20 Jun 2016 15:49:02 -0700 (PDT)
Date: Mon, 20 Jun 2016 17:49:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH openbmc] Package whitelist.conf in obmc-phosphor-image
Message-ID: <20160620224900.GJ19968@asimov.austin.ibm.com>
References: <20160620141042.22721-1-openbmc-patches@stwcx.xyz>
 <20160620141042.22721-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dOjmQabedpZXoTR3"
Content-Disposition: inline
In-Reply-To: <20160620141042.22721-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Mon, 20 Jun 2016 22:49:11 -0000


--dOjmQabedpZXoTR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 09:10:42AM -0500, OpenBMC Patches wrote:
> From: tomjose <tomjoseph@in.ibm.com>
>=20
> IPMI whitelisted commands are added in whitelist.conf
> which would be consumed by ipmid daemon. Only whitelisted
> IPMI commands are executed in restricted mode.
> ---
>  .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  5 ++++-
>  .../host-ipmid/host-ipmid.bbappend                 |  1 +
>  .../host-ipmid/host-ipmid/files/whitelist.conf     | 26 ++++++++++++++++=
++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host=
-ipmid.bbappend
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host=
-ipmid/files/whitelist.conf
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.=
bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> index 23728cb..b3dba1a 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> @@ -17,7 +17,8 @@ TARGET_CFLAGS   +=3D "-fpic"
>  RDEPENDS_${PN} +=3D "clear-once"
>  RDEPENDS_${PN} +=3D "settings"
>  RDEPENDS_${PN} +=3D "network"
> -SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid"
> +SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid \
> +            file://whitelist.conf"

We need a mechanism to have different files per package that we then
combine together at build time.  'host-ipmid',
'openpower-host-ipmi-oem', and 'ipmi-fru-parser' all of a different
subset of the providers.  If we remove 'openpower-host-ipmi-oem' and
replace it with 'anotherarch-host-ipmi-oem' we likely need a different
set of white-listed commands.

> =20
>  do_install() {
>          install -m 0755 -d ${D}${libdir}/host-ipmid
> +        install -m 0755 -d ${D}${datadir}/host-ipmid

If we continue to make this runtime parsing, the directory needs to be
passed into the makefile as part of 'do_compile'.  We should not be
forced to use the directory that is defaulted in the package's makefile.

> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.=
bbappend b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbap=
pend
> new file mode 100644
> index 0000000..b2051b6
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
> @@ -0,0 +1 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}/files:"

We have not taken this approach for other packages.  ${PN} is already
supported as a default SRC_URI location.  Why put the 'files'
subdirectory in this case?  And why have a .bbappend file when the
original package recipe is in the same directory?

> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/=
files/whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/hos=
t-ipmid/files/whitelist.conf
> new file mode 100644
> index 0000000..20dd429
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/w=
hitelist.conf
> @@ -0,0 +1,26 @@
> +<NetFn><Command>

So a non-parsed line becomes a "comment"?

> +0x00:0x02
> +0x00:0x08
> +0x00:0x09
> +0x04:0x2D
> +0x04:0x2F

Would be very useful to have comments on all of these lines.
    0x00:0x02 # Function-Foo : Command-Bar
is much more consumable to humans.

--=20
Patrick Williams

--dOjmQabedpZXoTR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaHLcAAoJEKsDR8wtAMEZt3oP/02ljQMotyAx1CFTnRc3Ebo+
qApFrvq2mx6HosgFRm3ivBCMP4EQtB9nZb0oZLKkQFjLIRVVoD7Mi7GsFEzYbxhu
N8I1o/7uU8vTrxca6XGRuhnLTpUzQnVhXAT4pMDpOyZpa/z/KqWcMl2hMAWY6INy
o+4mEHrr9TnQdvcQJkaCL/zyQL0DhHCxTKvb1DFptkbNdT260TnyJXxfF/E85uU0
zGt1W5jK3Hhy2/YnpOvpHkLebU9aHDypEyWEiwmtgki8UEP7XucLYpOk3Xxf37mo
9erDrvxJZrQhiPl/KN25JP+D4c1CeHT+2xb4nGPkUFcaqS91kovNFtjgZ5KXRJxt
szH+DbUZMITxnkRBCMjezkfutnZBGy6sCtpPYHuIPMACmB/WEilqr2k9GH2bmNKD
RW1KK3XX5GqTKYghyVyPlmKxzc7kE8u/e5617BhQdzmlJvitA5VswXzUR1tN1Q07
W1hZvrAFHSizXH2zsJr3FhqizuycYfYkP2mQpRhNqKCyYsRouJzXKqBRyVwAoPVJ
NXExqKLdFBnl3sldf/aNT+qabFxMyORJXUMl83zQnVBUGUJxwgG0TI6hoaFMabXe
4ysiHrH1yrgnaAS7dLt6salDU0n3BEOizCH+MCNmcvEItPztq89pj+/p7u069wTx
9bXtrO3z8/alt0hnSCXJ
=tI4O
-----END PGP SIGNATURE-----

--dOjmQabedpZXoTR3--
