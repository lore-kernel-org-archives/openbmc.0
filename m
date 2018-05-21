Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lKSRnluw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RRrYaT6l"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q6QV0MKCzF0jD
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 15:14:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E506C21D25;
 Mon, 21 May 2018 01:14:22 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 01:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=cIJ2MxNlWuvDyo6x/PuPFpHYorUPm
 b6evua6TmxDLuE=; b=lKSRnluw8QU8N9v1rYE+wu4d1wyakpUmtSH7eqgtJwRnl
 Fa7lF5a5WKOcM91+GzzIRxSEQThNmrIp9Wv1luL3bSlkj5pLUgVOEaqSBni+NwGL
 O9Cl54V4dDJv+JkRxqSl8fmlwZMqrJ+Hpws27vtQw9jCai3ve8PEcHN2aYfAn5ZG
 jNdW0JFjxc+lSczwJWreNnuYlt72F+xiLJp9R4d8vnLr8FwL1+BNDRC3c8FB9a4N
 Ows5Zh+tSbOSh0AVez3ID3Y+7O4ZVcaB+F0BhagWMafKkEuQ427zPlPh6L5mG+JB
 og4XZvWJysdR7t2MFLPyBX/wxNOdU0/4u9mviKZFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cIJ2Mx
 NlWuvDyo6x/PuPFpHYorUPmb6evua6TmxDLuE=; b=RRrYaT6livPKt3BbDxTBdv
 17ZhMErOdoXWTxXyEIeP19UYn+QbWfnHsBlyiNkxIWkA0IPw6bGRPIbHBZ9WO8c4
 moLWApFT+UnALm2H7CMvf/ljLPSutFXNiGpLPOoBZ6fSNNMuQhvXpnjv+RKjUSvv
 FlJG5cEwT0+X3gJAq5CO7r51DPa8OKzkKpYwDy/F1mbpdFhWaBFFcechVIxehUpt
 Z8mMWRuuckDOXJBJibXJ1qbpflCJkZaMeDRogdmAxZNS50cIDSJqRZ4NkQwy+AAp
 aBWuQZGJrBffIuHCiCF0zOWfkXpL9oxdiUE1znDU6jM6dBBW7mPt9oPS+0ylIqNQ
 ==
X-ME-Proxy: <xmx:rlUCW5IdvPsITKAqVB-X-G6AJa302XRMui4HJlDCTu2bDIW5BQQEZA>
X-ME-Proxy: <xmx:rlUCWw9jCL2MEvT6IMXrvx_YiGpR8_tzpnIVitx2dJMIGvniaPUj_A>
X-ME-Proxy: <xmx:rlUCW4LLzHTXAgAojfz7mH0P_4CeXXc7RvVEmLWLEWNqc4BqEb4I0w>
X-ME-Proxy: <xmx:rlUCW3F3DKbtkGmKk9O_TSRakuiZcvb6bEgfHt4YMK3cBo4fArjbFQ>
X-ME-Proxy: <xmx:rlUCW0zUdDT9lP0Nj4tvChTzGXB-C82SfSnTnzaKuhfxSGw-YAuLEg>
X-ME-Proxy: <xmx:rlUCW3FaPshsCvMtk1D1L0jo4UPTFZlJq1IeCrrkWvsAxsVsvvSvGg>
X-ME-Sender: <xms:rlUCW2_eSRVAEw3RJhMC3zdVf8f92H7KM30GHZ8Gc8EdUtwVFK8ONg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6F33340DC; Mon, 21 May 2018 01:14:22 -0400 (EDT)
Message-Id: <1526879662.2642052.1378929336.646BF02C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Date: Mon, 21 May 2018 14:44:22 +0930
Subject: Re: [PATCH linux dev-4.13 1/4] fsi/occ: Add retries on SBE errors
In-Reply-To: <20180518013500.18005-1-benh@kernel.crashing.org>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2018 05:14:28 -0000

On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
> This has proven useful in case of problems with the FSI
> communication. We retry up to 3 times.

As a note, there's a separate, OCC-specific error-handling sequence as well=
, but this is currently done in drivers/hwmon/occ/common.c.

From the OCC documentation[1]:

3.3.1 BMC-OCC Communication Failure Handling

On failures communicating with an OCC the BMC should first verify that the =
=E2=80=9COCC Active=E2=80=9D sensor is TRUE.  If the OCCs are not active th=
e error should be ignored and communication with the OCC should not be reti=
red until the =E2=80=9COCC Active=E2=80=9D sensor is TRUE.  If the =E2=80=
=9COCC Active=E2=80=9D sensor is TRUE the command should be retried twice. =
 If the command still fails after two retries and the =E2=80=9COCC Active=
=E2=80=9D sensor is still =E2=80=9CTRUE=E2=80=9D and there is no checkstop =
the error is valid and a request to reset the OCCs should be sent.

[1] https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Inter=
faces.pdf

>=20
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  drivers/fsi/fsi-occ.c | 179 ++++++++++++++++++++++++------------------
>  1 file changed, 104 insertions(+), 75 deletions(-)
>=20
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index bdee26096688..f4b2df7a3084 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -35,6 +35,7 @@
>  #define OCC_SRAM_BYTES		4096
>  #define OCC_CMD_DATA_BYTES	4090
>  #define OCC_RESP_DATA_BYTES	4089
> +#define OCC_COMMAND_RETRIES	3
>=20=20
>  /*
>   * Assume we don't have FFDC, if we do we'll overflow and
> @@ -458,9 +459,9 @@ static int occ_getsram(struct device *sbefifo, u32=20
> address, u8 *data,
>  		       ssize_t len)
>  {
>  	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> -	size_t resp_len, resp_data_len;
> +	size_t saved_resp_len, resp_len, resp_data_len;
>  	__be32 *resp, cmd[5];
> -	int rc;
> +	int rc, retries =3D OCC_COMMAND_RETRIES;
>=20=20
>  	/*
>  	 * Magic sequence to do SBE getsram command. SBE will fetch data from
> @@ -472,28 +473,37 @@ static int occ_getsram(struct device *sbefifo, u32=
=20
> address, u8 *data,
>  	cmd[3] =3D cpu_to_be32(address);
>  	cmd[4] =3D cpu_to_be32(data_len);
>=20=20
> -	resp_len =3D (data_len >> 2) + OCC_SBE_STATUS_WORDS;
> +	resp_len =3D saved_resp_len =3D (data_len >> 2) + OCC_SBE_STATUS_WORDS;
>  	resp =3D kzalloc(resp_len << 2 , GFP_KERNEL);
>  	if (!resp)
> -		return -ENOMEM;
> -
> -	rc =3D sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
> -	if (rc)
> -		goto free;
> -	rc =3D sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
> -	if (rc)
> -		goto free;
> +		rc =3D -ENOMEM;
> +
> +	rc =3D -1;
> +	while (rc && retries--) {
> +		resp_len =3D saved_resp_len;
> +		rc =3D sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
> +		if (rc =3D=3D 0)
> +			rc =3D sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
> +		if (rc) {
> +			if (rc < 0)
> +				pr_err("occ: FSI error %d, retrying sram read\n", rc);
> +			else
> +				pr_err("occ: SBE error 0x%08x, retrying sram read\n", rc);
> +		}
> +	}
>=20=20
> -	resp_data_len =3D be32_to_cpu(resp[resp_len - 1]);
> -	if (resp_data_len !=3D data_len) {
> -		pr_err("occ: SRAM read expected %d bytes got %d\n",
> -		       data_len, resp_data_len);
> -		rc =3D -EBADMSG;
> -	} else {
> -		memcpy(data, resp, len);
> +	/* Check response lenght and copy data */
> +	if (rc =3D=3D 0) {
> +		resp_data_len =3D be32_to_cpu(resp[resp_len - 1]);
> +		if (resp_data_len !=3D data_len) {
> +			pr_err("occ: SRAM read expected %d bytes got %d\n",
> +			       data_len, resp_data_len);
> +			rc =3D -EBADMSG;
> +		} else {
> +			memcpy(data, resp, len);
> +		}
>  	}
>=20=20
> -free:
>  	/* Convert positive SBEI status */
>  	if (rc > 0) {
>  		pr_err("occ: SRAM read returned failure status: %08x\n", rc);
> @@ -508,8 +518,8 @@ static int occ_putsram(struct device *sbefifo, u32=20
> address, u8 *data,
>  {
>  	size_t cmd_len, buf_len, resp_len, resp_data_len;
>  	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> +	int rc, retries =3D OCC_COMMAND_RETRIES;
>  	__be32 *buf;
> -	int rc;
>=20=20
>  	/*
>  	 * We use the same buffer for command and response, make
> @@ -522,38 +532,48 @@ static int occ_putsram(struct device *sbefifo, u32=
=20
> address, u8 *data,
>  	if (!buf)
>  		return -ENOMEM;
>=20=20
> -	/*
> -	 * Magic sequence to do SBE putsram command. SBE will transfer
> -	 * data to specified SRAM address.
> -	 */
> -	buf[0] =3D cpu_to_be32(cmd_len);
> -	buf[1] =3D cpu_to_be32(0xa404);
> -	buf[2] =3D cpu_to_be32(1);
> -	buf[3] =3D cpu_to_be32(address);
> -	buf[4] =3D cpu_to_be32(data_len);
> -
> -	memcpy(&buf[5], data, len);
> -
> -	rc =3D sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
> -	if (rc)
> -		goto free;
> -	rc =3D sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
> -	if (rc)
> -		goto free;
> +	rc =3D -1;
> +	while (rc && retries--) {
> +		/*
> +		 * Magic sequence to do SBE putsram command. SBE will transfer
> +		 * data to specified SRAM address.
> +		 */
> +		buf[0] =3D cpu_to_be32(cmd_len);
> +		buf[1] =3D cpu_to_be32(0xa404);
> +		buf[2] =3D cpu_to_be32(1);
> +		buf[3] =3D cpu_to_be32(address);
> +		buf[4] =3D cpu_to_be32(data_len);

Maybe it's worth a comment that we're doing this work inside the loop becau=
se we're reusing the buffer for the response, and we're doing that to minim=
ise the memory consumption, and it motivated by the SBEFIFO protocol crazy.

> +
> +		memcpy(&buf[5], data, len);
> +
> +		resp_len =3D OCC_SBE_STATUS_WORDS;
> +		rc =3D sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
> +		if (rc =3D=3D 0)
> +			rc =3D sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
> +		if (rc) {
> +			if (rc < 0)
> +				pr_err("occ: FSI error %d, retrying sram write\n", rc);
> +			else
> +				pr_err("occ: SBE error 0x%08x, retrying sram write\n", rc);
> +		}
> +	}
>=20=20
> -	if (resp_len !=3D 1) {
> -		pr_err("occ: SRAM write response lenght invalid: %d\n",
> -		       resp_len);
> -		rc =3D -EBADMSG;
> -	} else {
> -		resp_data_len =3D be32_to_cpu(buf[0]);
> -		if (resp_data_len !=3D data_len) {
> -			pr_err("occ: SRAM write expected %d bytes got %d\n",
> -			       data_len, resp_data_len);
> +	/* Check response lenght */
> +	if (rc =3D=3D 0) {
> +		if (resp_len !=3D 1) {
> +			pr_err("occ: SRAM write response lenght invalid: %d\n",

Hmm, not your fault but I just noticed 'length' is misspelled here.

> +			       resp_len);
>  			rc =3D -EBADMSG;
> +		} else {
> +			resp_data_len =3D be32_to_cpu(buf[0]);
> +			if (resp_data_len !=3D data_len) {
> +				pr_err("occ: SRAM write expected %d bytes got %d\n",
> +				       data_len, resp_data_len);
> +				rc =3D -EBADMSG;
> +			}
>  		}
>  	}
> -free:
> +
>  	/* Convert positive SBEI status */
>  	if (rc > 0) {
>  		pr_err("occ: SRAM write returned failure status: %08x\n", rc);
> @@ -567,46 +587,55 @@ static int occ_trigger_attn(struct device *sbefifo)
>  {
>  	__be32 buf[OCC_SBE_STATUS_WORDS];
>  	size_t resp_len, resp_data_len;
> -	int rc;
> +	int rc, retries =3D OCC_COMMAND_RETRIES;
>=20=20
>  	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 7);
> -	resp_len =3D OCC_SBE_STATUS_WORDS;
>=20=20
> -	buf[0] =3D cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
> -	buf[1] =3D cpu_to_be32(0xa404);           /* PutOCCSRAM */
> -	buf[2] =3D cpu_to_be32(0x3);              /* Mode: Circular */
> -	buf[3] =3D cpu_to_be32(0x0);              /* Address: ignored in mode 3=
 */
> -	buf[4] =3D cpu_to_be32(0x8);              /* Data length in bytes */
> -	buf[5] =3D cpu_to_be32(0x20010000);       /* Trigger OCC attention */
> -	buf[6] =3D 0;
> -
> -	rc =3D sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
> -	if (rc)
> -		goto error;
> -	rc =3D sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
> -	if (rc)
> -		goto error;
> +	rc =3D -1;
> +	while (rc && retries--) {
> +		resp_len =3D OCC_SBE_STATUS_WORDS;
> +
> +		buf[0] =3D cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
> +		buf[1] =3D cpu_to_be32(0xa404);           /* PutOCCSRAM */
> +		buf[2] =3D cpu_to_be32(0x3);              /* Mode: Circular */
> +		buf[3] =3D cpu_to_be32(0x0);              /* Address: ignored in mode =
3 */
> +		buf[4] =3D cpu_to_be32(0x8);              /* Data length in bytes */
> +		buf[5] =3D cpu_to_be32(0x20010000);       /* Trigger OCC attention */
> +		buf[6] =3D 0;
> +
> +		rc =3D sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
> +		if (rc =3D=3D 0)
> +			rc =3D sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
> +		if (rc) {
> +			if (rc < 0)
> +				pr_err("occ: FSI error %d, retrying attn\n", rc);
> +			else
> +				pr_err("occ: SBE error 0x%08x, retrying attn\n", rc);
> +		}
> +	}
>=20=20
> -	if (resp_len !=3D 1) {
> -		pr_err("occ: SRAM attn response lenght invalid: %d\n",
> -		       resp_len);
> -		rc =3D -EBADMSG;
> -	} else {
> -		resp_data_len =3D be32_to_cpu(buf[0]);
> -		if (resp_data_len !=3D 8) {
> -			pr_err("occ: SRAM attn expected 8 bytes got %d\n",
> -			       resp_data_len);
> +	/* Check response lenght */

'length'

> +	if (rc =3D=3D 0) {
> +		if (resp_len !=3D 1) {
> +			pr_err("occ: SRAM attn response lenght invalid: %d\n",

'length'

> +			       resp_len);
>  			rc =3D -EBADMSG;
> +		} else {
> +			resp_data_len =3D be32_to_cpu(buf[0]);
> +			if (resp_data_len !=3D 8) {
> +				pr_err("occ: SRAM attn expected 8 bytes got %d\n",
> +				       resp_data_len);
> +				rc =3D -EBADMSG;
> +			}
>  		}
>  	}
> - error:
> +
>  	/* Convert positive SBEI status */
>  	if (rc > 0) {
>  		pr_err("occ: SRAM attn returned failure status: %08x\n", rc);
>  		rc =3D -EBADMSG;
>  	}
>=20=20
> -
>  	return rc;
>  }
>=20=20
> --=20
> 2.17.0
>=20
