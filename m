Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XQERdKvm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E7/+JKLe"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q6nQ3nlGzF0wY
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 15:30:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E60BD21908;
 Mon, 21 May 2018 01:30:47 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 01:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=I6LN3c+N1xZ1CwyBT2v4m4zvGmJEn
 vHaoQ4CLq4l6fg=; b=XQERdKvmLyXa/f2CSgHVebHUe1xJruBKqfxx6avJVcbcx
 ZcaLVqxjcSOxqk0GZdjSLulQwHjwEdNu6QwxlFMS+mpIfy40UEY2KaB7Xsh7PH6G
 kG1flBFZ4RQEMC++a+yI8sQUtHyl7JgtIja6X+nXWVpCOL/l7SrbdsNC/AfBltKN
 DLfNnPeF0eFBlhmvuILwh1lnb7W/yXDGXzabYvtOR1y0ZsGs9tSrcpkEGUl2w8gb
 Lvaj5gBBIwLdWXwq4U4hvC/Tjgnztm9o2liCJm5gXXq9xJExzXFpOQq29upxT4dB
 G9f7UraPHMfiL872xkpn+/BZGW6DIPtrJwZvHdk/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=I6LN3c
 +N1xZ1CwyBT2v4m4zvGmJEnvHaoQ4CLq4l6fg=; b=E7/+JKLeIxVO0Zen/qoSun
 UKjmBKFrmX1gLvbawjl9J51tYNxVV38CdqTLxhefU082rz3mzX7yJNAeUlyHPw6G
 7zX3cZmQyHQlN85a+u3E7Xf5fBLZaUVUrwKxSBxxENCqUV/FEZu49Ql7qGqRkXS3
 Aw8G1WlAQ0YgNq+P9aD83S3X9WwfArGXN+AmyvzEqNT6Xoa3ypLQ/tKsZfKIfiDA
 /+GXhnxeLnnLboQQ4iF8D6IULdhQS+nJlb7JuRZt6FytxosHcLRufEH479Qdozzy
 gCWC4vY8KvbWylzv0DCCkMkJWa1R6R4iemRKsvjpjqbFYRZfYCI1IlkSHbqudHkg
 ==
X-ME-Proxy: <xmx:h1kCW5w3w2b1XN-ql9Dd79GFjgM8ISBN9GOlRFZAHRJa1a7WrTwArQ>
X-ME-Proxy: <xmx:h1kCW2aS-uW3-u5uiPNEOFbwZzjX6ez-J027tm20gmZ53_vHQs5FOA>
X-ME-Proxy: <xmx:h1kCWyVTPHkfptdZUmFc47nuZGo0H2DS1Ds8ttdG6fsTSHUZ5JVLyg>
X-ME-Proxy: <xmx:h1kCW8jst-OrjF26cddcboC4GMm0H7x2GLP8L2AedpHj9pMt9qKQhQ>
X-ME-Proxy: <xmx:h1kCW4vC3OM0NXlDHOO-F2X4IiW3KbMLfLiqIxCrDT7iAbVlglRKUg>
X-ME-Proxy: <xmx:h1kCW7sw74zwLdXyeqyj_GZT5Z5V-61RCgUzZrwdIKfaHgs2z3UHGw>
X-ME-Sender: <xms:h1kCW2AO9M5W4_S8jwL4qC-Ik6iJo7cyhlFxaQC9fNYNXVLzacLbCg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8ABF740DC; Mon, 21 May 2018 01:30:47 -0400 (EDT)
Message-Id: <1526880647.2645672.1378951184.5EC6A9F7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Date: Mon, 21 May 2018 15:00:47 +0930
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-3-benh@kernel.crashing.org>
In-Reply-To: <20180518013500.18005-3-benh@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 3/4] fsi/occ: Nicer error messages when
 talking to a host that isn't ready
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
X-List-Received-Date: Mon, 21 May 2018 05:30:51 -0000

On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/fsi-occ.c      | 12 ++++++++++++
>  drivers/hwmon/occ/common.c |  9 +++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 7a5afa78fb6b..4bda1b435ecb 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -484,6 +484,10 @@ static int occ_getsram(struct device *sbefifo, u32 
> address, u8 *data,
>  		rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
>  		if (rc == 0)
>  			rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
> +		if (rc == -ESHUTDOWN) {
> +			pr_info("occ: Host not ready\n");
> +			return rc;
> +		}
>  		if (rc) {
>  			if (rc < 0)
>  				pr_err("occ: FSI error %d, retrying sram read\n", rc);
> @@ -548,6 +552,10 @@ static int occ_putsram(struct device *sbefifo, u32 
> address, u8 *data,
>  
>  		resp_len = OCC_SBE_STATUS_WORDS;
>  		rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
> +		if (rc == -ESHUTDOWN) {
> +			pr_info("occ: Host not ready\n");
> +			return rc;
> +		}
>  		if (rc == 0)
>  			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>  		if (rc) {
> @@ -604,6 +612,10 @@ static int occ_trigger_attn(struct device *sbefifo)
>  		buf[6] = 0;
>  
>  		rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
> +		if (rc == -ESHUTDOWN) {
> +			pr_info("occ: Host not ready\n");
> +			return rc;
> +		}
>  		if (rc == 0)
>  			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>  		if (rc) {
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 88c32915b8bf..10f5c0586d47 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1350,8 +1350,13 @@ int occ_setup(struct occ *occ, const char *name)
>  	/* no need to lock */
>  	rc = occ_poll(occ);
>  	if (rc < 0) {
> -		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
> -			rc);
> +		/*
> +		 * If the error is -ESHUTDOWN, fail silently, as this happen in
> +		 * normal circumstances when the driver is loaded too early
> +		 */
> +		if (rc != -ESHUTDOWN)
> +			dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
> +				rc);
>  		return rc;
>  	}
>  
> -- 
> 2.17.0
> 
