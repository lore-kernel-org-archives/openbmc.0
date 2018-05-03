Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RrfXHHF2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KvrO16yt"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40c05L3Dl8zF2TR
 for <openbmc@lists.ozlabs.org>; Thu,  3 May 2018 12:51:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 64C1121182;
 Wed,  2 May 2018 22:50:55 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 02 May 2018 22:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=MB9J9/a9YKENja8NhUtUyC75FCrpe
 4FiUEdzjy1aWTU=; b=RrfXHHF22hUb7RFBnZPVzmSa7xu3TFITwhZHskmR0/AVa
 KLzIZ5wAbFxPnCN0Lf+9BjrZXHNyes0NtVTj8LaJZHz21kTE8bWbLsCRjziLsY+E
 EiMxaVLgHO+enX5MoBaIf2IF4b/+1c50ha6bXJjogtehCQPE/79ZZIKg8TD7pYCA
 rfJl65EbsAhTI7ofyQuHx57PSWlaAcuDlLwDCXCNJ2enzkPUcEEBv6H32WU1oDiY
 tUka2qnQ+JBkf7GuCrkr7TayXuRrZWRBoYHx6IKCFHv55yICyZ6uQlyOYDH2SK2V
 hboE4e3L98ce16tXmbihxcxHFOUbBjkGVnXPXav3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MB9J9/
 a9YKENja8NhUtUyC75FCrpe4FiUEdzjy1aWTU=; b=KvrO16ytL2cTT1zv9jr5/0
 V8QBMPWe3rI/BTKh89AlyyunPFlaMaBrxdnDA6vo33BzoGO7HTRRgW3j7k+woW3i
 xtULmjSz9XZmAjcl5i+OC2I2xwG9/29XLPbOBn0pPqAwtSUEwOygwhenu3nnFzR/
 BMq48L08XA/Gb0SyBBSnDJ0DXw7IPDooDqQAQRLUIlzOofT7RFkUBV4byQT1LHMG
 Ala9budhtsgx7QduPt5EPG3c8T8ilfsdUlu6sbakA3BNeiWHYeI+EGBXioBWHOq0
 00DWmdjrlhw+QmEM7almp6Y3VpMxnR8VhmN8/Bj0d59tGuSH4tl7Kv3WjlUsSA/g
 ==
X-ME-Sender: <xms:D3nqWp8OatMtIFsa0ekBeIc0n50SgYhqlk0t1Gc_aOP2ycsJqFdpyA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id DF781BA780; Wed,  2 May 2018 22:50:54 -0400 (EDT)
Message-Id: <1525315854.3282381.1359035056.37137F72@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, stewart@linux.ibm.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-62b61488
Subject: Re: [PATCH linux dev-4.13 v2] fsi: occ: Add check for OCC response
 checksum
In-Reply-To: <1525186285-27508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1525186285-27508-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Thu, 03 May 2018 12:20:54 +0930
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
X-List-Received-Date: Thu, 03 May 2018 02:51:04 -0000



On Wed, 2 May 2018, at 00:21, Eddie James wrote:
> The OCC specification indicates that it is an error scenario if the
> response checksum doesn't match the sum of the bytes of the response.
> The driver needs to perform this calculation and check, and return an
> error if it's a mismatch.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> Changes since v1:
>  - rename occ_check_sum() to occ_verify_checksum()
>  - remove checksum field from occ_response and instead add two bytes to data
>    field, with comment
>  - add comment to fetching checksum from response data
> 
>  drivers/fsi/fsi-occ.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 45ae13c..8df1c64 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -58,8 +58,7 @@ struct occ_response {
>  	u8 cmd_type;
>  	u8 return_status;
>  	__be16 data_length;
> -	u8 data[OCC_RESP_DATA_BYTES];
> -	__be16 checksum;
> +	u8 data[OCC_RESP_DATA_BYTES + 2];	/* two bytes checksum */
>  } __packed;
>  
>  /*
> @@ -427,6 +426,27 @@ static int occ_release(struct inode *inode, struct 
> file *file)
>  	.release = occ_release,
>  };
>  
> +static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
> +{
> +	u16 i;
> +	u16 checksum;
> +	/* Fetch the two bytes after the data for the checksum. */
> +	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
> +
> +	checksum = resp->seq_no;
> +	checksum += resp->cmd_type;
> +	checksum += resp->return_status;
> +	checksum += (data_length >> 8) + (data_length & 0xFF);
> +
> +	for (i = 0; i < data_length; ++i)
> +		checksum += resp->data[i];
> +
> +	if (checksum != checksum_resp)
> +		return -EBADMSG;
> +
> +	return 0;
> +}
> +
>  static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
>  			     ssize_t len)
>  {
> @@ -692,6 +712,8 @@ static void occ_worker(struct work_struct *work)
>  
>  	xfr->resp_data_length = resp_data_length + 7;
>  
> +	rc = occ_verify_checksum(resp, resp_data_length);
> +
>  done:
>  	mutex_unlock(&occ->occ_lock);
>  
> -- 
> 1.8.3.1
> 
