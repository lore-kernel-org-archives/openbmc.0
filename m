Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 02C831A03CA
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 09:11:18 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445551875369652.8440785312415;
 Thu, 22 Oct 2015 15:11:15 -0700 (PDT)
Date: Thu, 22 Oct 2015 17:11:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Reduce prints to journald from ipmi
 but keep ability to trace
Message-ID: <20151022221113.GY13316@asimov.austin.ibm.com>
References: <1445539273-23571-1-git-send-email-patches@stwcx.xyz>
 <1445539273-23571-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9I0HVnGRacHebCDW"
Content-Disposition: inline
In-Reply-To: <1445539273-23571-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_2
X-ZohoMail-Owner: <20151022221113.GY13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Thu, 22 Oct 2015 22:11:19 -0000


--9I0HVnGRacHebCDW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 01:41:13PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> ---
>  ipmid.C | 91 ++++++++++++++++++++++++++++++++++++++---------------------=
------
>  ipmid.H |  3 +++
>  2 files changed, 56 insertions(+), 38 deletions(-)
>=20
> diff --git a/ipmid.C b/ipmid.C
> index 4f0831e..34d29aa 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -15,6 +15,16 @@
> =20
>  sd_bus *bus =3D NULL;
> =20
> +void print_usage(void) {
> +  fprintf(stderr, "Options:  [-c mask]\n");
> +  fprintf(stderr, "    mask : 0x01 - Print ipmi packets\n");
> +  fprintf(stderr, "    mask : 0x02 - Print DBUS operations\n");
> +  fprintf(stderr, "    mask : 0x04 - Print ipmi command details\n");
> +  fprintf(stderr, "    mask : 0xFF - Print all trace\n");
> +}
> +
> +
> +

Why -c?  This looks like it should be -d as in "debug".

--=20
Patrick Williams

--9I0HVnGRacHebCDW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKV8BAAoJEKsDR8wtAMEZxWMP/0R2lA1xYx7uwlwWhWFZ10pa
nqYeERV1IM9jpA6Ucd4rzLPSvFwj30HnSiWDUyTiTAPS/juULpfXh98Lcjj3ZcPx
tchDv//1Dnru/Y6rg4WrX1++o0FjCmRl8UjhJTRDUZc+2pTmg8UB5MGkESH9/BbV
dPywDNYtJwzvW60mSw+R5FV8Npo5a8lRlG/KOpw9drSdEwHd7dnrzWpNT/2pXqBM
ZmeDId4o4P4fZ3ERw/r15xq+jcgx/3/NgaJ1JHbH+DTAfxsAqzR5Kq0pK4/fM74P
RZN16ukCz366s6Jak9f27CkSF3PdETbaS7ny1TYUFt8/Yo+bwWx7w+7z7y4ltBiS
RPdLt6Bj98JKBeK+KeBZicGbfdQcFhFZbvDIHTnNR7zJwJQzRsVmC6K6MzQX1e/v
1Yv+yb6AsiYS1ixJd4WaQXAegCcvDiU8GcIwxILlwI8uu1Cmw2+70XW3R/hZycpg
5uGqJdAPr7+wURAKwoC6lOjwWyHfhS7I2ciuLkpVtIGvQqFiAVebrstgLt0ApuHy
7Nyp0D/2yLRw+7kuemdD61Nq9mNMdOlRkTUPbIi5MWkhnU57O5xlmbCkOjj72raA
ogjmTQ8Vk4/jZM2Lb/zRCkleJTjqFSasYR2w1Uis4/OnZCrgOZbDmMP4XvwZGv4V
GN0AdAZpQyX4lj1iGGZA
=aLF9
-----END PGP SIGNATURE-----

--9I0HVnGRacHebCDW--
