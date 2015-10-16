Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B2ADE1A09E4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 04:51:49 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445017906443418.8422920312686;
 Fri, 16 Oct 2015 10:51:46 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:51:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v3 3/4] Added interface function to parse
 wirte fru data message into a dictionary.
Message-ID: <20151016175144.GG13316@asimov.austin.ibm.com>
References: <1444999069-20975-1-git-send-email-patches@stwcx.xyz>
 <1444999069-20975-4-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline
In-Reply-To: <1444999069-20975-4-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151016175144.GG13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 17:51:50 -0000


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 07:37:48AM -0500, OpenBMC Patches wrote:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
> +const char* vpd_key_names [] =3D=20
> +{
> +  "Key Names Table Start",=20
> +  "Chassis Type", /*OPENBMC_VPD_KEY_CHASSIS_TYPE*/
> +  "Chassis Part Number", /*OPENBMC_VPD_KEY_CHASSIS_PART_NUM,*/
> +  "Chassis Serial Number", /*OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,*/
> +
> +  /* TODO: chassis_custom_fields */
> +
> +  "Board Mfg Date", /* OPENBMC_VPD_KEY_BOARD_MFG_DATE, */ /* not a type/=
len */
> +  "Board Manufacturer", /* OPENBMC_VPD_KEY_BOARD_MFR, */
> +  "Board Name", /* OPENBMC_VPD_KEY_BOARD_NAME, */
> +  "Board Serial Number", /* OPENBMC_VPD_KEY_BOARD_SERIAL_NUM, */
> +  "Board Part Number", /* OPENBMC_VPD_KEY_BOARD_PART_NUM, */
> +  "Board FRU File ID", /* OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID, */
> +  /* TODO: board_custom_fields */
> +
> +  "Product Manufacturer", /* OPENBMC_VPD_KEY_PRODUCT_MFR, */
> +  "Product Name", /* OPENBMC_VPD_KEY_PRODUCT_NAME, */
> +  "Product Model Number", /* OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM, */
> +  "Product Version", /* OPENBMC_VPD_KEY_PRODUCT_VER, */
> +  "Product Serial Number", /* OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM, */
> +  "Product Asset Tag", /* OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG, */
> +  "Product FRU File ID", /* OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID, */
> +  /* TODO: product_custom_fields */
> +
> +  "Key Names Table End" /*OPENBMC_VPD_KEY_MAX,*/
> +};

These should be lower-case single-word strings like 'chassis-type',
'chassis-part-number'.

Based on these names, it seems like we almost need to have a dictionary
of dictionaries:
{ 'chassis' :
    { 'part-number' : 1234,
      'serial-number' : 5678=20
    },
  'board' : { ...}
}

How do we plan to split this into two different DBus objects?  One for
the chassis and one for the board.

> =20
> +
> +/*
> + * --------------------------------------------------------------------
> + *
> + * --------------------------------------------------------------------
> + */
> +
> +/* private method to parse type/length */
>  static int
>  _parse_type_length (const void *areabuf,
>                      unsigned int areabuflen,
> @@ -84,14 +194,14 @@ _parse_type_length (const void *areabuf,
>   =20
>    type_length =3D areabufptr[current_area_offset];
> =20
> -  /* IPMI Workaround=20
> +  /* ipmi workaround=20
>     *
> -   * Dell P weredge R610
> +   * dell p weredge r610

Why did you make so many case changes in the comments?  I think we
should revert this.  This is through the whole file.

> +  /* Populate VPD Table */
> +  for (i=3D1; i<OPENBMC_VPD_KEY_MAX; i++)
> +  {
> +    if (i=3D=3DOPENBMC_VPD_KEY_CHASSIS_TYPE)
> +    {
> +        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], chassis_t=
ype);

'd' is double.  This does not seem correct.

> +        continue;
> +    }
> +
> +    if (i=3D=3DOPENBMC_VPD_KEY_BOARD_MFG_DATE)
> +    {
> +        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], mfg_date_=
time);

'd' is double.  Didn't you intend 'date'?

> +        continue;
> +    }
> +   =20
> +    sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].=
type_length_field);=20

How do you know that all these fields were actually obtained from the VPD?
Don't you need something to look for unpopulated entries?

How does this create entries in the dictionary?  I don't think this is
correct.

Aren't these all suppose to be "sv"?  String to variant.
--=20
Patrick Williams

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWITkwAAoJEKsDR8wtAMEZP5EP/j2cAOPjYuQDMyllOf2q3NN7
0YBkxMEXqaJuMmFJTYPIAMvadIPhLCQC1b4kWni4TSk9UBEIE3IYR1OrBE6CBZ8q
I2lN6J6IHbP8PTYkCDkKa+o3Z1ZL57zR9Q8PROHL6EY3rpWqLpMvSasDwKZgt5/3
hZr/tpQJp0y/8L1dXqWKahkrk9EU0Mw31e3THDb6b6aROPZUZu8678pFfJCG9RqX
/BYyNE0Cusid8VktIbYDSmLEtscRNQKNaSOmUlifxHTIyXUEjU0Hnt3eh/VEL9Ti
7pmjRd7xf4WQQiEuQ9s3NWTBaGfvfTFoXsKAkJUoN4rj7jztK9Wvnf4ibWV7o2Mb
ZUQ+LrHRuJ1YW3XRUq4CSVpq6FtiyPtvTQxXJB08A/fGhRtp18SqRnpAfTapLe6i
4kez4y1o5YKDy8ye/AOVNcD1N23vS2TpU+c0D1jHsWg0+AmGAa64VACqRmdCRUJ2
IfSpWx/dbTywVvUU06uUkRJ5SIv4EEzca3l/w2rlvMggXoZ5/b+nNdNgOBCUI3al
5yl2mbpupbdpakKc2fhJXhYOvYPJjyed5D2UBcoi8VKw8nZdEECjqCxEY/HjDwA6
eBUb1MBb47x3rZsJTDm2c5+wTDOSwQL5B8Vk+/UDCtBWF/WxrcjRFxCUcH1/+Gmk
8atVz+3LAbmP9W9Mwp8a
=u0Cv
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
