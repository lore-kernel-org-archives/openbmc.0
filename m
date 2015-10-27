Return-Path: <patrick@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 795C81A03F8
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 08:36:11 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445971824907798.9933006931066;
 Tue, 27 Oct 2015 11:50:24 -0700 (PDT)
Date: Tue, 27 Oct 2015 13:50:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3] Add get sel time cmd
Message-ID: <20151027185022.GB13316@asimov.austin.ibm.com>
References: <1445639992-11906-1-git-send-email-patches@stwcx.xyz>
 <1445639992-11906-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lBP+FhBL9XXtPs84"
Content-Disposition: inline
In-Reply-To: <1445639992-11906-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_54
X-ZohoMail-Owner: <20151027185022.GB13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 21:36:13 -0000


--lBP+FhBL9XXtPs84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 05:39:52PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add support for IPMI function Get SEL Time
> ---
>  storagehandler.C | 75 ++++++++++++++++++++++++++++++++++++++------------=
------
>  storagehandler.h |  5 ++--
>  2 files changed, 54 insertions(+), 26 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 659fff5..cccfa56 100644
> --- a/storagehandler.C
> +++ b/storagehandler.C
> @@ -3,6 +3,8 @@
> +ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    time_t currtime;
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    // Get current time in seconds since jan 1 1970
> +    time(&currtime);
> +    uint32_t resp =3D (uint32_t)currtime;
> +    resp =3D htonl(resp);

This should be 'htole32(resp)'.  htonl puts in big-endian format, but
IPMI spec states little-endian.

--=20
Patrick Williams

--lBP+FhBL9XXtPs84
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL8duAAoJEKsDR8wtAMEZtZYP+wa8KTiZgt6XUdsG0Okt6A8d
jrCPDnxZW6RdnbW69/adnn/1WPY9hIakkUjN1TLxD259SgLM2yAkuF0F523g0ge3
FDVeJrOFZ4VlWKr3r6f/aZp2MLmKVLGlUzAGmyf0+Q5QnDos0AqcludGSuiJhuvf
6XqqZx31soaNbO5Z9Jo4t7oylKCnoSKOFXVo8woX1oar1RpZcy5+8v8akvNt0r/+
b5TXkdvEKgclXG7npy4ZcyyATX4g+ygWMsf4G5I/AEeeaa8fXWU3weB7FDSIpKYE
oRbBo5dGbbjJNUnPnjCQ4QVcy2EbzGlZE14cp516ZoZa94bscxmGsZGGog9/mEtE
RiOhlA4+K6CqVGwViMw5upMURperJZIKSfeq4udI9aIMbSRTOce+ms/nrmsa90TU
U2MUNUiDbL1pKONthCOSCWh3EK55nXZQnf6blfj6yABvqmH/NdaJS87ZUCoyBRa8
TvGzmNamUQDVf3xo//B6So+PmFkfgDvrkApiLjVHRLbk2f5L6Jcc7CYlBGNry+F8
ZTRyDhmozzzbW9lnfu2r6Pm2qB6wfQT6oevJnopK5/cdMTKsIdF77+Nd0TFo9AFL
kGf8eGlxxdcWIQjY9bt4Nb1X5cayhm5JWdQVJfPWmQMVQae9q6eLaLvc+pHffqKB
SyTAp8L6ZaurE77BSjcV
=mMKA
-----END PGP SIGNATURE-----

--lBP+FhBL9XXtPs84--
