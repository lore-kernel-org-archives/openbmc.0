Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E14611A073D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 06:32:14 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444937531136271.6188424416397;
 Thu, 15 Oct 2015 12:32:11 -0700 (PDT)
Date: Thu, 15 Oct 2015 14:32:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] FRU validator CLI
Message-ID: <20151015193209.GE21126@asimov.austin.ibm.com>
References: <1444832615-18343-1-git-send-email-patches@stwcx.xyz>
 <1444832615-18343-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <1444832615-18343-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_7
X-ZohoMail-Owner: <20151015193209.GE21126@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 19:32:15 -0000


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 09:23:35AM -0500, OpenBMC Patches wrote:
> From: vishwabmc <vishwanath@in.ibm.com>
>=20
> ---
>  fruvalidator.C | 252 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 fruvalidator.C
>=20
> diff --git a/fruvalidator.C b/fruvalidator.C
> new file mode 100644
> index 0000000..5e2ffaf
> --- /dev/null
> +++ b/fruvalidator.C

> +unsigned char calculate_checksum(unsigned char *ptr, int len)
> +{
> +    // REFER :: http://coreipm.googlecode.com/svn-history/r40/trunk/core=
ipm/ipmi_pkt.c
> +    char checksum =3D 0;
> +    int byte =3D 0;
> +
> +    for(byte =3D 0; byte < len; byte++)
> +    {
> +        checksum +=3D *ptr++;
> +    }
> +   =20
> +    return( -checksum );
> +}

With the 'refer' statement, you pointed us to code that is GPL licensed
but your file is not GPL license.  I know this is a simple algorithm.
Best to point to either the IPMI spec itself or a non-GPL licensed
example.  Hostboot has one and I bet skiboot has one as well.

> +    //common_header_t com_hdr;
> +    memset(common_hdr, 0x0, sizeof(common_hdr));

Is this a global?  Please do not reference globals.

Wait... this is an undefined variable.  Did you ask us to review code
that doesn't even compile?

> +
> +    // For now, this is user supplied in CLI. But this will be a paramet=
er from
> +    // fru handler
> +    FILE *fru_file =3D fopen(fru_file_name,"rb");
> +    if(fru_file =3D=3D NULL)
> +    {
> +        fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);

Want to print out the perror too?  This is a general comment anytime a
syscall fails.

> +    // 1: Validate for first byte to always have a value of [1]
> +    if(common_hdr[0] !=3D HDR_BYTE_ZERO)
> +    {
> +        fprintf(stderr, "ERROR: Common Header entry_1:[0x%X] Invalid.\n"=
,common_hdr[0]);
> +        return false;
> +    }
> +    else
> +    {
> +        printf("SUCCESS: Validated [0x%X] in common header\n",common_hdr=
[0]);
> +    }
> +
> +    // 2: Validate the header checskum that is at last byte ( Offset: 7 )
> +    checksum =3D calculate_checksum(common_hdr, sizeof(common_hdr)-1);
> +    if(checksum !=3D common_hdr[HDR_CRC_OFFSET])
> +    {
> +        fprintf(stderr, "ERROR: Common Header checksum mismatch."
> +                " Calculated:[0x%X], Embedded:[0x%X]\n",=20
> +                checksum, common_hdr[HDR_CRC_OFFSET]);
> +   =20
> +        return false;
> +    }

We probably don't want to print errors for these validation failures
because we expect to get them regularly as part of the "good path".

> +            // 1: Goto beginning of the FILE
> +            rewind(fru_file);
> +
> +            // 2: Move the file pointer to record_offset
> +            fseek(fru_file, record_offset, SEEK_SET);

Why do you need 'rewind' if the next operation is an fseek(...SET)?

> +            uint8_t fru_record_data[fru_record_len];
> +            memset(fru_record_data, 0x0, sizeof(fru_record_data));

Memset is redundant if we're going to fread below.

> +            // Since the data is from record data[0], move the file poin=
ter again to
> +            // beginning of record.
> +            fseek(fru_file, -2, SEEK_CUR);
> +            fread(fru_record_data, sizeof(fru_record_data), 1, fru_file);

Need to check return codes on all of these fseek, freed calls.
--=20
Patrick Williams

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWH/85AAoJEKsDR8wtAMEZ9rAQAIPtzg/GySYpsz5JutklOjto
QnorTnM6hTaNjSfExc7700mT6heBAauructbLUeuc4wD4xbIaNwWEhFmWd4RJ+dk
upsx1iLlQ+5zXPhdOqjPs+BqQqjraXh4W0RUKVFRwFp4sZVBa9fkTM00W/30L9jH
tVQEKPHoQvv2ApLqxQTdEXiSMzRwHUrKvvW09ftbfF15T78elMIyMMpdHN572HlD
M52FCG0RwW/UlGDo2MbPZ1qxLDGvZKCfNURDNXL4agfdC9ghLxK4bfed2GdcwhiG
+DKurHQElVWcF2rFsU5T04NgsIu+Y1Ffi5m9NVW39zTW6/bJe9RweOnDhE6P2Swp
7yCGxiKgLPOmfNj3X3NDoDBWN/yke++b/ssRsRdT521dfWc9h7wUb0y0YvyuooVV
EK/Zuz4WbqbSFsscegKPmqVQj/RlfRrSB9L9+H4SEYNlsV8Gn5omfWYUHdr8IXf1
25+tPmNGwN8CfmEZMZ4iYEkuRKD+SGnFWYFHOhP5FItCZgMUCmyOYKW+eNamwt3z
QoFdDbxZ4x5y37RM4OptdkMJDFlYvyg8fWUaoNinERGQ9b9HF0wNlLwRLAVrGLIP
ZdZ4ECI/IkLiXvZt9NPNdHC07VtKGKcEpenp9orM5qJd7nHUCSlzVmn/PXd2FiYG
XD1RtLavK3DjOIevYSYM
=2rqj
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
