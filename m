Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8ED711A0410
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:45:56 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446342352970117.0626657983961;
 Sat, 31 Oct 2015 18:45:52 -0700 (PDT)
Date: Sat, 31 Oct 2015 20:45:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] remove False from fault property
 when nothing wrong
Message-ID: <20151101014551.GN31364@asimov.austin.ibm.com>
References: <1446340487-9066-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UExESr5xZTMxdOWv"
Content-Disposition: inline
In-Reply-To: <1446340487-9066-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151101014551.GN31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:45:57 -0000


--UExESr5xZTMxdOWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Could use a better description of what is going on here.  Isn't a sensor
like this either in "true" or "false" state?  Why is "" a valid state?

On Sat, Oct 31, 2015 at 08:14:46PM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/phosphor-host-ipmid/pull/29
>=20
> Chris Austen (1):
>   remove False from fault property when nothing wrong
>=20
>  ipmisensor.C | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
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

--UExESr5xZTMxdOWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWNW7PAAoJEKsDR8wtAMEZwp8P/RmzQ/Ab5UkMPUO3aU5Y8xxD
auLSpK8/3twaTLxzJuogsIXDcHxfLynTxGGLiVb6rmPJ62CB4MD9DlJDNXuhFwPr
KESFZFq09mfOBzfeBlK9KAvaRdVshxtVGm99ctKnkKP/3FxpvVhHjzs8hr32jrVu
knu2hzKrQ5COzUf5+Ao2s/kWk5EjRbVrR4VCiNeeNJ6H0FAsM17LRplUiO0dn2e+
UcuXyiE4ySzx2AU/XWsS0lBJ7ZSTXOYt0RZZAWcOp6abngi3Imio3zsybQzAZwn7
KAzQqU8EjG54ExGiV5wnUcrtgA6CGzyFqEvEAd7/e7OBkADEcAmADVrl1lOL/yPy
U5gRaS4s9M2M6bq8d/aMnp5s/DxLWL3br3stGQm4KJ2BNTaB56QnchehjOjzDnl/
Vk+Jti1dWsBfuJQV0oeazSKDR+zPoiBNegKfQ6AXUkn7cECWrK8hkfc9dWMrE9D5
Q8RH6G7jLnSkc4EV+tUwqDJ+7AVt/UP2rGvfAF7jdAulBFR8Bb2vmFCgIqIgTLPp
yRIp9VJutoymULnmqBW1rRPDJuoGA72eIqL9a0F7FIEyqqygmUz0m1SSgzzcRd8K
92suXOWnX6IJTEYGh+gPNvywj+mMUB9ThfurNvotv3wNONGDvG9Aq0r0KbnT6o3i
d/qrJGgZRxXl50pcWIOy
=D6if
-----END PGP SIGNATURE-----

--UExESr5xZTMxdOWv--
