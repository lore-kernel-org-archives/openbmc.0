Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Blf/xsdx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NX2c04f5"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q4Z2676KzF0Tj
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 13:50:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FC8220DF6;
 Sun, 20 May 2018 23:50:48 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Sun, 20 May 2018 23:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=6KgNpxxRiYqS3yizp2gzhIg+wXRBi
 pRAPnWhXgDldtU=; b=Blf/xsdxAtAKkqVKn5IZRAupGUaAeO78i7j4JwGNUO3Jr
 CI0bi7EVddv1yElm73Z17ApFLVQI8RDDreSB415pB6vh7eg8LDKaqCik427w+B/O
 edC19SmvI4xgqX65bu+b8fnk+Vl4X9CJOJJzdjY3iLIuoFGqmOf7D0aJ2F7071uN
 ohUKBKaazoq8mm6ytI1Aoe6lWesW0hl3Jy9/IAn0LkO62R+ez6x0XlsRWhuSjjQl
 iloQvucGqPzw1SFjaEyIwLCSIouO6OL1JAJANTS7bX48WB022VKekSAtdiMWLOnt
 5zzAdst8qW+TZGfnLjGmt3LCt+u1iezbgN3r4apLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6KgNpx
 xRiYqS3yizp2gzhIg+wXRBipRAPnWhXgDldtU=; b=NX2c04f5VkDwKJhUHVU85S
 L3X/PiKoCdAmObLE7Ua7IUbgNB+6NZh9OR4wBz8HcDSNE5LfW+yysihWqvweD1Ym
 TQrPmWmg+a+ARO8L3NMp08VZei/YhHy5DrSrLxmE4m1vR+mMiPTKYwTalf1J3xTe
 W0qB1c94R+9OjPgCpdZqIhjANmyHGC93pB1YGr5cN78dlAyQ3rZpffcZhYpVPAwl
 qsxPgXqFnr6xkNUryKjXfq4zuiaMQ0XtZQt4CUzaM0iFNcJQ1RTb5k8sZnwtYzY6
 H8iNHpo8lEA+LsLV8OgtMBRw8ND8Na1QRZjKSSG7+wrodihjur3gENVZzOzPS9Ow
 ==
X-ME-Proxy: <xmx:GEICW7-KgtQaiZuitXIMQJCtoDzrOH2uqzvbkKPSX6qBgVLimwWCfA>
X-ME-Proxy: <xmx:GEICW5zwJJ6aKyUM0jNZPOu69T-9qfdoRejyzG8GAi-tADcRitXaZw>
X-ME-Proxy: <xmx:GEICW3KgixbKM-CgjpwKRziRExQtYs5znSGFGeL9QRywtLhN-7VO3g>
X-ME-Proxy: <xmx:GEICW8Ywh3znSVojahvzckciB28fgNZPMHSTPCo5adK8o8qfAucBLA>
X-ME-Proxy: <xmx:GEICW8wF_MAPsvjhNev4QPJaslfn-4UrIj3QbXoHVZ9udBYCjfe6jg>
X-ME-Proxy: <xmx:GEICW_EE7giyXehp8NOdqIDPt0Rwmn3R7bQLqFzugYteHD9f5QjyZQ>
X-ME-Sender: <xms:GEICW2wLNZJ54vgCcMmldCiHGtjaFMkKek19ZlGN8mOOerrfzDXwIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 3B21F40DC; Sun, 20 May 2018 23:50:48 -0400 (EDT)
Message-Id: <1526874648.2621524.1378896264.0EFBC6AE@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Subject: Re: [PATCH v3 linux dev-4.13 3/3] fsi/fsi-occ: Simple conversion to
 new sbefifo driver
In-Reply-To: <20180518013429.17732-3-benh@kernel.crashing.org>
References: <20180518013429.17732-1-benh@kernel.crashing.org>
 <20180518013429.17732-3-benh@kernel.crashing.org>
Date: Mon, 21 May 2018 13:20:48 +0930
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
X-List-Received-Date: Mon, 21 May 2018 03:50:51 -0000



On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
> Replace open/close/write/read API with the simple submit()
> API and the helper to parse status.
> 
> This doesn't yet extract FFDC
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Looks sane enough wrt the SBEFIFO API changes.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/Makefile       |   2 +-
>  drivers/fsi/fsi-occ.c      | 202 +++++++++++++++++--------------------
>  drivers/hwmon/occ/Makefile |   2 +-
>  3 files changed, 94 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index f331e929423c..75fdc6d8cfc4 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -4,4 +4,4 @@ obj-$(CONFIG_FSI_MASTER_HUB) += fsi-master-hub.o
>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
>  obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>  obj-$(CONFIG_FSI_SBEFIFO) += fsi-sbefifo.o
> -#obj-$(CONFIG_FSI_OCC) += fsi-occ.o
> +obj-$(CONFIG_FSI_OCC) += fsi-occ.o
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index d368b62e5471..bdee26096688 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -36,6 +36,13 @@
>  #define OCC_CMD_DATA_BYTES	4090
>  #define OCC_RESP_DATA_BYTES	4089
>  
> +/*
> + * Assume we don't have FFDC, if we do we'll overflow and
> + * fail the command. This needs to be big enough for simple
> + * commands as well.
> + */
> +#define OCC_SBE_STATUS_WORDS	16
> +
>  #define OCC_TIMEOUT_MS		1000
>  #define OCC_CMD_IN_PRG_WAIT_MS	50
>  
> @@ -447,110 +454,71 @@ static int occ_verify_checksum(struct 
> occ_response *resp, u16 data_length)
>  	return 0;
>  }
>  
> -static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
> -			     ssize_t len)
> -{
> -	int rc;
> -	ssize_t total = 0;
> -
> -	do {
> -		rc = sbefifo_drv_write(client, &buf[total], len - total);
> -		if (rc < 0)
> -			return rc;
> -		else if (!rc)
> -			break;
> -
> -		total += rc;
> -	} while (total < len);
> -
> -	return (total == len) ? 0 : -ENOSPC;
> -}
> -
> -static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
> -			    ssize_t len)
> -{
> -	int rc;
> -	ssize_t total = 0;
> -
> -	do {
> -		rc = sbefifo_drv_read(client, &buf[total], len - total);
> -		if (rc < 0)
> -			return rc;
> -		else if (!rc)
> -			break;
> -
> -		total += rc;
> -	} while (total < len);
> -
> -	return (total == len) ? 0 : -ENODATA;
> -}
> -
>  static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>  		       ssize_t len)
>  {
> -	int rc;
> -	u8 *resp;
> -	__be32 buf[5];
>  	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> -	struct sbefifo_client *client;
> +	size_t resp_len, resp_data_len;
> +	__be32 *resp, cmd[5];
> +	int rc;
>  
>  	/*
>  	 * Magic sequence to do SBE getsram command. SBE will fetch data from
>  	 * specified SRAM address.
>  	 */
> -	buf[0] = cpu_to_be32(0x5);
> -	buf[1] = cpu_to_be32(0xa403);
> -	buf[2] = cpu_to_be32(1);
> -	buf[3] = cpu_to_be32(address);
> -	buf[4] = cpu_to_be32(data_len);
> -
> -	client = sbefifo_drv_open(sbefifo, 0);
> -	if (!client)
> -		return -ENODEV;
> -
> -	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> -	if (rc)
> -		goto done;
> -
> -	resp = kzalloc(data_len, GFP_KERNEL);
> -	if (!resp) {
> -		rc = -ENOMEM;
> -		goto done;
> -	}
> +	cmd[0] = cpu_to_be32(0x5);
> +	cmd[1] = cpu_to_be32(0xa403);
> +	cmd[2] = cpu_to_be32(1);
> +	cmd[3] = cpu_to_be32(address);
> +	cmd[4] = cpu_to_be32(data_len);
> +
> +	resp_len = (data_len >> 2) + OCC_SBE_STATUS_WORDS;
> +	resp = kzalloc(resp_len << 2 , GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;
>  
> -	rc = occ_read_sbefifo(client, (char *)resp, data_len);
> +	rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
>  	if (rc)
>  		goto free;
> -
> -	/* check for good response */
> -	rc = occ_read_sbefifo(client, (char *)buf, 8);
> +	rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
>  	if (rc)
>  		goto free;
>  
> -	if ((be32_to_cpu(buf[0]) == data_len) &&
> -	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
> -		memcpy(data, resp, len);
> -	else
> +	resp_data_len = be32_to_cpu(resp[resp_len - 1]);
> +	if (resp_data_len != data_len) {
> +		pr_err("occ: SRAM read expected %d bytes got %d\n",
> +		       data_len, resp_data_len);
>  		rc = -EBADMSG;
> +	} else {
> +		memcpy(data, resp, len);
> +	}
>  
>  free:
> +	/* Convert positive SBEI status */
> +	if (rc > 0) {
> +		pr_err("occ: SRAM read returned failure status: %08x\n", rc);
> +		rc = -EBADMSG;
> +	}
>  	kfree(resp);
> -
> -done:
> -	sbefifo_drv_release(client);
>  	return rc;
>  }
>  
>  static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>  		       ssize_t len)
>  {
> -	int rc;
> -	__be32 *buf;
> +	size_t cmd_len, buf_len, resp_len, resp_data_len;
>  	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> -	size_t cmd_len = data_len + 20;
> -	struct sbefifo_client *client;
> +	__be32 *buf;
> +	int rc;
>  
> -	buf = kzalloc(cmd_len, GFP_KERNEL);
> +	/*
> +	 * We use the same buffer for command and response, make
> +	 * sure it's big enough
> +	 */
> +	resp_len = OCC_SBE_STATUS_WORDS;
> +	cmd_len = (data_len >> 2) + 5;
> +	buf_len = max(cmd_len, resp_len);
> +	buf = kzalloc(buf_len << 2, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  
> @@ -558,7 +526,7 @@ static int occ_putsram(struct device *sbefifo, u32 
> address, u8 *data,
>  	 * Magic sequence to do SBE putsram command. SBE will transfer
>  	 * data to specified SRAM address.
>  	 */
> -	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
> +	buf[0] = cpu_to_be32(cmd_len);
>  	buf[1] = cpu_to_be32(0xa404);
>  	buf[2] = cpu_to_be32(1);
>  	buf[3] = cpu_to_be32(address);
> @@ -566,37 +534,43 @@ static int occ_putsram(struct device *sbefifo, u32 
> address, u8 *data,
>  
>  	memcpy(&buf[5], data, len);
>  
> -	client = sbefifo_drv_open(sbefifo, 0);
> -	if (!client) {
> -		rc = -ENODEV;
> -		goto free;
> -	}
> -
> -	rc = occ_write_sbefifo(client, (const char *)buf, cmd_len);
> +	rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
>  	if (rc)
> -		goto done;
> -
> -	rc = occ_read_sbefifo(client, (char *)buf, 8);
> +		goto free;
> +	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>  	if (rc)
> -		goto done;
> +		goto free;
>  
> -	/* check for good response */
> -	if ((be32_to_cpu(buf[0]) != data_len) ||
> -	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
> +	if (resp_len != 1) {
> +		pr_err("occ: SRAM write response lenght invalid: %d\n",
> +		       resp_len);
>  		rc = -EBADMSG;
> -
> -done:
> -	sbefifo_drv_release(client);
> +	} else {
> +		resp_data_len = be32_to_cpu(buf[0]);
> +		if (resp_data_len != data_len) {
> +			pr_err("occ: SRAM write expected %d bytes got %d\n",
> +			       data_len, resp_data_len);
> +			rc = -EBADMSG;
> +		}
> +	}
>  free:
> +	/* Convert positive SBEI status */
> +	if (rc > 0) {
> +		pr_err("occ: SRAM write returned failure status: %08x\n", rc);
> +		rc = -EBADMSG;
> +	}
>  	kfree(buf);
>  	return rc;
>  }
>  
>  static int occ_trigger_attn(struct device *sbefifo)
>  {
> +	__be32 buf[OCC_SBE_STATUS_WORDS];
> +	size_t resp_len, resp_data_len;
>  	int rc;
> -	__be32 buf[7];
> -	struct sbefifo_client *client;
> +
> +	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 7);
> +	resp_len = OCC_SBE_STATUS_WORDS;
>  
>  	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
>  	buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
> @@ -606,24 +580,32 @@ static int occ_trigger_attn(struct device *sbefifo)
>  	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
>  	buf[6] = 0;
>  
> -	client = sbefifo_drv_open(sbefifo, 0);
> -	if (!client)
> -		return -ENODEV;
> -
> -	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> +	rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
>  	if (rc)
> -		goto done;
> -
> -	rc = occ_read_sbefifo(client, (char *)buf, 8);
> +		goto error;
> +	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>  	if (rc)
> -		goto done;
> +		goto error;
>  
> -	/* check for good response */
> -	if ((be32_to_cpu(buf[0]) != 8) || (be32_to_cpu(buf[1]) != 0xC0DEA404))
> +	if (resp_len != 1) {
> +		pr_err("occ: SRAM attn response lenght invalid: %d\n",
> +		       resp_len);
>  		rc = -EBADMSG;
> +	} else {
> +		resp_data_len = be32_to_cpu(buf[0]);
> +		if (resp_data_len != 8) {
> +			pr_err("occ: SRAM attn expected 8 bytes got %d\n",
> +			       resp_data_len);
> +			rc = -EBADMSG;
> +		}
> +	}
> + error:
> +	/* Convert positive SBEI status */
> +	if (rc > 0) {
> +		pr_err("occ: SRAM attn returned failure status: %08x\n", rc);
> +		rc = -EBADMSG;
> +	}
>  
> -done:
> -	sbefifo_drv_release(client);
>  
>  	return rc;
>  }
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index ca6d25ae9da8..ab5c3e965ccb 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1,7 +1,7 @@
>  occ-hwmon-objs := common.o
>  
>  ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
> -#occ-hwmon-objs += p9_sbe.o
> +occ-hwmon-objs += p9_sbe.o
>  endif
>  
>  ifeq ($(CONFIG_SENSORS_OCC_P8_I2C), y)
> -- 
> 2.17.0
> 
