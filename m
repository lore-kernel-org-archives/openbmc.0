Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EA39C1A03E9
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:41:49 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446342105954161.269550127211;
 Sat, 31 Oct 2015 18:41:45 -0700 (PDT)
Date: Sat, 31 Oct 2015 20:41:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem] Fixed byte swapped esel log name
Message-ID: <20151101014142.GM31364@asimov.austin.ibm.com>
References: <1446340465-8828-1-git-send-email-patches@stwcx.xyz>
 <1446340465-8828-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cGfB/trNgB3WtPHu"
Content-Disposition: inline
In-Reply-To: <1446340465-8828-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151101014142.GM31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:41:50 -0000


--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2015 at 08:14:25PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> so logs are saved moved to tabs.. sorry that really messes up the changes
> ---
>  oemhandler.C | 118 +++++++++++++++++++++++++++++------------------------=
------
>  1 file changed, 57 insertions(+), 61 deletions(-)
>=20
> diff --git a/oemhandler.C b/oemhandler.C
> index c19d9ce..8d4ac62 100644
> --- a/oemhandler.C
> +++ b/oemhandler.C
> @@ -6,80 +6,76 @@
>  void register_netfn_oem_partial_esel() __attribute__((constructor));
> =20
>  const char *g_esel_path =3D "/tmp/";
> -uint16_t g_record_id =3D 0x0100;
> -
> -
> -#define LSMSSWAP(x,y) ((y)<<8|(x))
> +uint16_t g_record_id =3D 0x0001;
> =20
> =20
>  ////////////////////////////////////////////////////////////////////////=
///////
> -// For the First partial add eSEL the SEL Record ID and offset
> -// value should be 0x0000. The extended data needs to be in
> -// the form of an IPMI SEL Event Record, with Event sensor type
> -// of 0xDF and Event Message format of 0x04. The returned
> +// For the First partial add eSEL the SEL Record ID and offset=20
> +// value should be 0x0000. The extended data needs to be in=20
> +// the form of an IPMI SEL Event Record, with Event sensor type=20
> +// of 0xDF and Event Message format of 0x04. The returned=20
>  // Record ID should be used for all partial eSEL adds.
>  //
> -// This function creates a /tmp/esel# file to store the
> +// This function creates a /tmp/esel# file to store the=20
>  // incoming partial esel.  It is the role of some other
> -// function to commit the error log in to long term
> -// storage.  Likely via the ipmi add_sel command.
> +// function to commit the error log in to long term=20
> +// storage.  Likely via the ipmi add_sel command. =20
>  ////////////////////////////////////////////////////////////////////////=
///////
> -ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,=
=20
>                                       ipmi_request_t request, ipmi_respon=
se_t response,
>                                       ipmi_data_len_t data_len, ipmi_cont=
ext_t context)
>  {
> -    esel_request_t *reqptr =3D (esel_request_t*) request;
> -    FILE *fp;
> -    short recid, offset =3D 0;
> -    uint8_t rlen;
> -    ipmi_ret_t rc =3D IPMI_CC_OK;
> -    char string[64];
> -    const char *pio;
> -
> -    recid  =3D LSMSSWAP(reqptr->selrecordls, reqptr->selrecordms);
> -    offset =3D LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
> -
> -    if (!recid && !offset) {
> -        // OpenPOWER Host Interface spec says if RecordID and Offset are
> -        // 0 then then this is a new request
> -        pio =3D "wb";
> -        snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "e=
sel", (g_record_id&0xFF00>>8), (g_record_id&0xFF));
> -    } else {
> -        pio =3D "rb+";
> -        snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "e=
sel", reqptr->selrecordms, reqptr->selrecordls);
> -    }
> -
> -    // Length is the number of request bytes minus the header itself.
> -    // The header contains an extra byte to indicate the start of
> -    // the data (so didn't need to worry about word/byte boundaries)
> -    // hence the -1...
> -    rlen =3D (*data_len) - (uint8_t) (sizeof(esel_request_t));
> -
> -
> -    printf("IPMI PARTIAL ESEL for %s  Offset =3D %d Length =3D %d\n",
> -        string, offset, rlen);
> -
> -
> -    if ((fp =3D fopen(string, pio)) !=3D NULL) {
> -        fseek(fp, offset, SEEK_SET);
> -        fwrite(reqptr+1,rlen,1,fp);
> -        fclose(fp);
> -
> -        *data_len =3D sizeof(g_record_id);
> -        memcpy(response, &g_record_id, *data_len);
> -    } else {
> -        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, s=
tring);
> -        rc =3D IPMI_CC_INVALID;
> -        *data_len     =3D 0;
> -    }
> -
> -    return rc;
> +	esel_request_t *reqptr =3D (esel_request_t*) request;
> +	FILE *fp;
> +	short *recid  =3D  (short*) &reqptr->selrecordls;
> +	short *offset =3D  (short*) &reqptr->offsetls;

This code is not endian-safe.  Opened issue #5 to address.

> +	uint8_t rlen;
> +	ipmi_ret_t rc =3D IPMI_CC_OK;
> +	char string[64];
> +	const char *pio;
> +
> +
> +	if (!*recid && !*offset) {
> +		// OpenPOWER Host Interface spec says if RecordID and Offset are
> +		// 0 then then this is a new request
> +		pio =3D "wb";
> +		snprintf(string, sizeof(string), "%s%s%04x", g_esel_path, "esel", g_re=
cord_id);
> +	} else {
> +		pio =3D "rb+";
> +		snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", =
reqptr->selrecordms, reqptr->selrecordls);
> +	}
> +
> +	// Length is the number of request bytes minus the header itself.
> +	// The header contains an extra byte to indicate the start of
> +	// the data (so didn't need to worry about word/byte boundaries)
> +	// hence the -1...
> +	rlen =3D (*data_len) - (uint8_t) (sizeof(esel_request_t));
> +
> +
> +	printf("IPMI PARTIAL ESEL for %s  Offset =3D %d Length =3D %d\n",
> +		string, *offset, rlen);
> +
> +
> +	if ((fp =3D fopen(string, pio)) !=3D NULL) {
> +		fseek(fp, *offset, SEEK_SET);
> +		fwrite(reqptr+1,rlen,1,fp);
> +		fclose(fp);
> +
> +		*data_len =3D sizeof(g_record_id);
> +		memcpy(response, &g_record_id, *data_len);
> +	} else {
> +		fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
> +		rc =3D IPMI_CC_INVALID;
> +		*data_len     =3D 0;
> +	}
> +
> +	return rc;
>  }
> =20
> =20
>  void register_netfn_oem_partial_esel()
>  {
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD=
_PESEL);
> -    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oe=
m_partial_esel);
> -    return;
> +	printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PE=
SEL);
> +	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_p=
artial_esel);
> +	return;
>  }
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

--cGfB/trNgB3WtPHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWNW3WAAoJEKsDR8wtAMEZukUP/jK/zBGu97W4x3bAYKEaaAcf
+rdhlUZ+jUHJbfrrCkvVF2sMebeZ7YL9Of1aCqEDLqdBz8J3wHihnGsU0hylNINI
oCqqF7lB5Nmgsuv3JnA/PMp1W8qb3BP0eBOWg3RtXVHpjFmD2nVkl2PktseSbg75
3sij4t6EdjMq3FGmxpZ1FsnmE0QQPIBO5vHOmn0VawlfrBwIodR4u1TAQYbBup2C
SsI6wC4oitjBRBRlxkbsF/3ik2QJAVD7GQjdYQnuMmiFJught24ADS02hjvQ2zLQ
Fmkuw/bxs+ASN1rtfeCiXuyzgJBG+Dn4v+G8x9A8bq/6CgCUXzAmcYsW5d5pDok4
eQ6U6vU36BdzxohXhHvRBSgO1CxQUw5cf0nviC8jV9znHx7ijr5He0aBnLqBGwQ7
dnQIyMialyoEku2r79gOgr1OLGowy4fP3GTx3KUSWTXl0f1+PMowwhUY8E1QPmvj
NJ7GD+TAHM+6jok5WOWerxgezCTc/ymoU8cCwdzjyGXJXafW7VhiQMnvXZCD9g2x
JPezAJshOX+uKkLtTqXI8E4XX2I93Fv15p9Hlo/RwCTxv8jF6wtzy8yYrm8pfyud
qSXEYmtgFc3hCTBUESMI4kxrT74GtmYaeDbBMNg5SIcGYheaeNlaz516BboRbU9J
bqsIvF4hnuskIswTIgYF
=2NZN
-----END PGP SIGNATURE-----

--cGfB/trNgB3WtPHu--
