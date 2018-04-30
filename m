Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ovc5bOcU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZZ3BsiP0"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Zh2l11vrzF2QN
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 09:44:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AEBC229FE;
 Mon, 30 Apr 2018 19:44:12 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 30 Apr 2018 19:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ccHv456iYV7DQpC6d0rePN24K5DBF
 lhH20t4139DKoI=; b=ovc5bOcUTFEqhyo1rRYA5sFpwunMvnMigPUVzWd4fXwkf
 OddOcd5cULvKAYKEMtsxWNNu6johWwqgldVeeurN2/8s+AQhVOPphIaUEQm/fjwK
 nGCu1YuyNq92rRyEGodTMh/9Yc2tiXYSgVrIMiTaDgnc5XB9OGqdxEGTITjstgwQ
 qCfwo2kOebO66k+Mc8qpY+wRcpFxvt2XF5Jg6Ge6NTk/xHQBYjbJTlpIe6PKyTm6
 Q65n3F11ZWajhmK7kgq4UoP13bL2q2vRBcUWd+Vrpf/zJgL5G1PnWsBZ9ocvcEF4
 NIVOhY45mm2D96S50+IuJ3PPCjNMl78n3DZ5XrFvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ccHv45
 6iYV7DQpC6d0rePN24K5DBFlhH20t4139DKoI=; b=ZZ3BsiP0cOllpuCAAhEJvV
 UahgWc2AiAEfzIIzcEquOcWQa35FTDIpT46a7cXxW8oznwDC8JbzPpkIQdd7M1to
 dVMYMC8UThb+RVVa8beWZqNfOnU8LVyNHHMB4BJsS6fPXZ/f5aOqWsXTpaI/jGAL
 qWPdV3PJIft3mCpyu+gnX+6d4QZev/lJD74L77w9XqoEKykYeLos5Mfis2KONOAu
 0J9stMp2KkLRxhuEH0lvkFcE6bOF3cvkjR1CTDF+H0/Xa29CuaBblNowk8DXTaoa
 Ob+YMOr1dPsmAPAxVTqyG0iFzX3UzdID9g6Gaje/z+2xnM7ph+7JYILIu8AubjeQ
 ==
X-ME-Sender: <xms:TKrnWn1bhkb0_ULr_Vxa5m_c8d-lBxTrLQqQOsE7XwgFS_B2QYBreQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EA94542A8; Mon, 30 Apr 2018 19:44:09 -0400 (EDT)
Message-Id: <1525131849.252145.1356261360.2E85A1F6@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
In-Reply-To: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13] fsi: occ: Add check for OCC response
 checksum
References: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Tue, 01 May 2018 09:14:09 +0930
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
X-List-Received-Date: Mon, 30 Apr 2018 23:44:15 -0000



On Tue, 1 May 2018, at 06:35, Eddie James wrote:
> The OCC specification indicates that it is an error scenario if the
> response checksum doesn't match the sum of the bytes of the response.
> The driver needs to perform this calculation and check, and return an
> error if it's a mismatch.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-occ.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 45ae13c..16f18df 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -427,6 +427,27 @@ static int occ_release(struct inode *inode, struct 
> file *file)
>  	.release = occ_release,
>  };
>  
> +static int occ_check_sum(struct occ_response *resp, u16 data_length)

Why pass in data_length when it's been extracted from resp?

> +{
> +	unsigned int i;
> +	u16 checksum = 0;
> +	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);

This looks like the definition of struct occ_response is broken:

struct occ_response {
	u8 seq_no;
	u8 cmd_type;
	u8 return_status;
	__be16 data_length;
	u8 data[OCC_RESP_DATA_BYTES];
	__be16 checksum;
} __packed;

The checksum member is misleading, as we're not always transferring 4089 bytes of data, but it is necessary to "avoid" an out-of-bounds memory access if we do. I think it's worth redefining data as `u8 data[OCC_RESP_DATA_BYTES + 2]` and dropping the checksum member.

Also can you add a comment explaining why you're doing an "out of bounds" access through the data member by indexing with data_length?

> +
> +	checksum += resp->seq_no;
> +	checksum += resp->cmd_type;
> +	checksum += resp->return_status;
> +	checksum += (data_length >> 8) + (data_length & 0xFF);
> +
> +	for (i = 0; i < data_length; ++i) {
> +		checksum += resp->data[i];
> +	}
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
> @@ -692,6 +713,8 @@ static void occ_worker(struct work_struct *work)
>  
>  	xfr->resp_data_length = resp_data_length + 7;
>  
> +	rc = occ_check_sum(resp, resp_data_length);
> +

It's a pity there aren't two checksums: one for the fixed length data (covering the variable data length value) and one for the variable length data. We're pretty much reduced to inferring that the data length is fine if it doesn't exceed OCC_RESP_DATA_BYTES, but that doesn't mean that it isn't corrupt.

Cheers,

Andrew

>  done:
>  	mutex_unlock(&occ->occ_lock);
>  
> -- 
> 1.8.3.1
> 
