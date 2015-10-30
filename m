Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BC6B31A05BF
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 06:27:42 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446233257337526.3277226349904;
 Fri, 30 Oct 2015 12:27:37 -0700 (PDT)
Date: Fri, 30 Oct 2015 14:27:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] IPMI support for get and set lan
Message-ID: <20151030192734.GH31364@asimov.austin.ibm.com>
References: <1446174933-17041-1-git-send-email-patches@stwcx.xyz>
 <1446174933-17041-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Content-Disposition: inline
In-Reply-To: <1446174933-17041-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151030192734.GH31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 19:27:43 -0000


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 10:15:33PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> +struct get_lan_t {
> +    uint8_t rev_channel;
> +    uint8_t parameter;
> +    uint8_t parameter_set;
> +    uint8_t parameter_block;
> +}  __attribute__ ((packed));
> +
> +ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +    *data_len =3D 0;
> +
> +    const uint32_t current_revision =3D 0x11; // Current rev per IPMI Sp=
ec 2.0
> +    char syscmd[128];
> +    int revision =3D 0;
> +    int i =3D 0;
> +
> +    printf("IPMI GET_LAN\n");
> +
> +    get_lan_t *reqptr =3D (get_lan_t*) request;
> +
> +    revision =3D reqptr->rev_channel >> 8; // Revision is bit 7

How does this work?  reqptr->rev_channel is a uint8_t.  (x >> 8) is
always zero then.

> +    if (revision =3D=3D 1)
> +    {
> +        // Only current revision was requested
> +        *data_len =3D sizeof(current_revision);
> +        memcpy(response, &current_revision, *data_len);
> +        return IPMI_CC_OK;
> +    }
> +
--=20
Patrick Williams

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWM8SmAAoJEKsDR8wtAMEZIosP+wVso+9+/TQQBvM+QMK2aHwx
ChW5YNJ6kJ+73tCaMMdPbPOrZeoH7+LrIZqpwBO0YBPChZyygyMxjyCkkuL1uPs3
M6KDobMKs5v2PVnFLiwaJkpn/BqcvCWUdXB9c4h6eqZbt1CFeML++zT450fihTSR
ZNouSu8WKffYfIb29gDYVJYYdnayUgBYWTLGuwvCUvZ8huXHrJKbbZ7U8JN44X7c
aZIUufqEcR20iuvAPMAZLBIH/pNCMjC3AUmG8JeCpINAvnaChvDMvoGG1F8Zhyjl
WHrqCVnk83yg0dM7WTDHXRUUwJOCLfFMvrBUVRmC0ftVEW6WohnaQD5J6qhh+frp
/X7JExROsUWzGGqyn65UXKIYgrCUUsYcNwtQ3nMsDf8nOiuzOPjEblsZs+Tp2ER1
QRyahnGwTfCOtxkQimxWjzTXaMJBf1pv7ckHhfyrqbO295zssxgOFlo9LCXEX+vM
A5Ib7XRNeYymGhXQvYavjAowSJlgaxaRBIun6QNJL+dAmWV3sFGhbHXDgtSmJG47
6Me14XV30oHmVAE6cnoYGwANXDX0hYte170x1HVzT+5ShIkGzLwIdzWEbqlIvbYv
bE2iI41txLn2biw1vaP4phPFXsIzdD+jhPS4pNl5neqag52QOjElHpiep5qWhufH
ozWAuKU8l9Q2D1CxIMZy
=KArZ
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--
