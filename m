Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F02551A09E4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 04:57:33 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445018249966497.32625199318215;
 Fri, 16 Oct 2015 10:57:29 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:57:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v3 4/4] Format string change in
 sd_bus_message_append.
Message-ID: <20151016175728.GH13316@asimov.austin.ibm.com>
References: <1444999069-20975-1-git-send-email-patches@stwcx.xyz>
 <1444999069-20975-5-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <1444999069-20975-5-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_3
X-ZohoMail-Owner: <20151016175728.GH13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
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
X-List-Received-Date: Fri, 16 Oct 2015 17:57:34 -0000


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 07:37:49AM -0500, OpenBMC Patches wrote:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
>=20
> ---
>  frup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/frup.c b/frup.c
> index 9711645..ab58426 100644
> --- a/frup.c
> +++ b/frup.c
> @@ -803,13 +803,13 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdt=
bl)
>    {
>      if (i=3D=3DOPENBMC_VPD_KEY_CHASSIS_TYPE)
>      {
> -        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], chassis_t=
ype);
> +        sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_t=
ype);
>          continue;
>      }
> =20
>      if (i=3D=3DOPENBMC_VPD_KEY_BOARD_MFG_DATE)
>      {
> -        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], mfg_date_=
time);
> +        sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_da=
te_time);
>          continue;
>      }
>     =20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Here are some of the changes from my previous review, it looks like.  Go
ahead and merge these together:

    'git rebase --interactive HEAD~2'
    Change last 'pick' to a 'fixup'.

I don't think "date" should be a set of bytes.  We should parse dates into
ASCII ISO8601 strings.
--=20
Patrick Williams

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWITqIAAoJEKsDR8wtAMEZKr8P+gLhgwdPJEgTXPMdM7SJO/Ow
y0CjVOc5PHnvrM6xf1PYPfOzUWInEztkI9mgZ8kj2Qf6+CcEYTeHq13rlXXnsFzA
YwShol8pbm9eJ9eC4a8k+uzyA+ldzx5QLULNqqoosaC17rp2yDLUaRvY5IoZOV7I
Vump0pLV9eeszG/7j11ohCp8w9mcYj9nvI562bqa8CPvsePrDwRbI7xCQbn7RebB
4a1P6rB4bhSCh9wPYfftWBdvuPWcpiIGrm2irWJ9INxDxDteyAfeANWZPOP7n2dn
vfzfjyIiUVCxon5yUuZ6TUMFauqR6mf2SHxizuDIdDfJ3NIffqT7mU+dkw841eUB
K4oww5PZqLtyDzHRkiTTS5kWUKweBDiO3gg8dGqYT38FSsko5hREl6P1QbEuERG5
5o8an3vuIbmhQO3wXZmOdsqBOisEOYRTUOBgVn49DzlyNxhOgVmLnTQgpBcrAo/8
CX+lXVx9Eup8tWpgTBeXlXyXEgrpp14gOfvJ1Z+LqkYg1xplP9ZlUwAwgbbEh0Hb
2VO9cwMdBx9WgVbnJmfrS905SlGHyJIy4sjuQ1Oy/lKVjwGogzjPnQRosC0QdbUa
S96J7TxRrLj4+qZbeXj2BqMYJHPbw+RyPYRS6vGoc4ob6cVP8huvsG731gW43qsG
aMXZyFAck9r4VISRMbxv
=noCB
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
