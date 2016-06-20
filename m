Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYQ4j4xXzzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:09:25 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 146646055531821.80744978435939;
 Mon, 20 Jun 2016 15:09:15 -0700 (PDT)
Date: Mon, 20 Jun 2016 17:09:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Milton Miller II <miltonm@us.ibm.com>
Subject: Re: [PATCH openbmc 0/7] Phosphor changes needed for Yocto 2.1
Message-ID: <20160620220913.GF19968@asimov.austin.ibm.com>
References: <20160620215737.13107-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xkJEvbTYpfqRozZ0"
Content-Disposition: inline
In-Reply-To: <20160620215737.13107-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 22:09:26 -0000


--xkJEvbTYpfqRozZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Due to an interesting tidbit in RFC2821 [1], git-send-email cannot send
patches with lines longer than 998 characters.  Somehow the upstream
yocto-2.1 tree has a change which would violate this.  Yes, you read
that right; there is a line longer than 998 characters in the Yocto
tree.

In order to get some email sent, I broke my pull-request into two.
#397[2] and #396[3].  I would appreciate reviews on both of them, but
#397 should be safe to apply as is and #396 raises a problem with u-boot
that we need to get to the bottom of first.

Brad / Milton,
I had to do some changes to the image generation recipes to make them work
with Yocto-2.1.  Yocto-2.1 seems stricter on a number of things.

Joel,
Can you try to build #396 and see if you can figure out what is
going on with u-boot-fw-utils?  It fails on compile to find 'uint8_t'
and I can't see any obvious change between Yocto-2.0.1 and Yocto-2.1.

I also considered upgrading to the u-boot 2016.05 tree but we do not
have the 'palmetto_defconfig' there yet, which is needed for Barreleye /
Palmetto.

[1] http://www.ietf.org/rfc/rfc2821.txt
[2] https://github.com/openbmc/openbmc/pull/397
[3] https://github.com/openbmc/openbmc/pull/396

On Mon, Jun 20, 2016 at 04:57:30PM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/openbmc/pull/397
>=20
> Patrick Williams (7):
>   meta-phosphor: Use obmc-phosphor-event for qemu systems
>   meta-phosphor: use obmc-phosphor-user for qemu systems
>   meta-phosphor: Remove unused systemd patch
>   openssl: run 'make depend'
>   u-boot-fw-utils: Update to latest version.
>   meta-phosphor: Make image-overlay a machine feature.
>   meta-phosphor: Ensure INITRAMFS_CTYPE defined
>=20
>  meta-phosphor/classes/obmc-phosphor-image.bbclass  |    4 +
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  |    2 +-
>  .../openssl/openssl/Configure.patch                |   15 +
>  .../openssl/openssl_%.bbappend                     |    8 +
>  .../images/core-image-minimal-initramfs.bbappend   |    1 +
>  .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 --------------=
------
>  .../common/recipes-core/systemd/systemd_%.bbappend |    1 -
>  .../conf/machine/include/obmc-bsp-common.inc       |    2 +-
>  meta-phosphor/conf/machine/include/sample.inc      |    4 +-
>  9 files changed, 32 insertions(+), 1214 deletions(-)
>  create mode 100644 meta-phosphor/common/recipes-connectivity/openssl/ope=
nssl/Configure.patch
>  delete mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/010=
0-systemd_networkd_dbus_setaddress.patch
>=20
> --=20
> 2.9.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--xkJEvbTYpfqRozZ0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaGmJAAoJEKsDR8wtAMEZob4P/jlIihN77YFpPouahIfQV6wa
j1GrKhXeefiHqemdhXSUjZMQoCMOBedhuyezOYOFDn5ID60ehQKr3MWACevZ1KjB
Y7HqQssKcLSpZNE0a6n90ues6m1Wng80EmG/J1zwccLjd5yyM1bmZrJPT/RfZKkx
lnd4zykbAhXIt7f5y7FLlq96jYH75WxbtptsPfR9H/hZd13+zNsyZVz7FEREsta7
+TDfzwCUtu1LaSYe0rN5jSTzqDkTJTzp+24ueHPAO770i/PxvS/Bx239W29wePhh
Yuiwq6H8YXq04+FeZF6+aEFcWC/HHVyrab83lsvxURbz5rYLspdlO2y6k6ZSEPB4
jjy7gQedbHdcweFffP4hdgvPcea0hCpWQx70KkrB2devPhAIlJKrU8NgL+LL7+Qd
OkYxhgM19g7lLz38Dn0OeE+ov2WeuLH6VE3GYgo5FQpgs23oaJ3yPSaPsfVnVOuy
D0kThGjF1NzEhHcyM86A22BAC9U5h4R7oxog4/WUMdp6TodGmmEnTrSNI7am/v8w
TXFuk+922Vnuwan2aAQHSKNTJMP3Zadcypc13DCyJ7ag5Jpr3egbqWzBMi4Gpp/Q
XC86W7RulZ5B+Jv+YcoBT1RtVs9lDpKAFwm4bHL6+JcNfg5pql3NRkNRQrEUAWln
g4qRNK+NQmPfifNOVeCo
=RKgp
-----END PGP SIGNATURE-----

--xkJEvbTYpfqRozZ0--
