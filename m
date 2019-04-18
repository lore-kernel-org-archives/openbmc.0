Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UiCSZb2o"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="baCRJWPI"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7z55qYPzDqRm
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:11:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 799ED220CB;
 Thu, 18 Apr 2019 02:11:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=zqcg5RWTLmjVb2vz+VBSAdH9QP9gKSN
 Fru1Qr2AjS4k=; b=UiCSZb2oom6EnkKW2GiGAySNzEKBFnstMWB9TvA7kcjyOX1
 nV+ySDCLA7efIPTg/JCLxQeAqlX/CajFs4RJ4ZCej5f4/yTvmuealzIkfbrMeAZX
 QDOUxfiPhUW++DEUokphGhyeHjmlHxDUvDJ3dpM0L1bRtnU88oYruKssesELZ7xw
 Vrs1GTJbNGdBExHNzpghmEppRQw3rjkAU1d5iDVDJ5zgzKZ34v+dDHMuKP76vLOv
 3xtVeW2rZbRJQZ2v0Ap+E5l2YAITbF0+MFZLipcfpuQyoG/Biqp45SOVgzxBlIRW
 ePb2bUzujDFGNk9Ggo6KoVPAFGzrysv9dcssZIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zqcg5R
 WTLmjVb2vz+VBSAdH9QP9gKSNFru1Qr2AjS4k=; b=baCRJWPIJrG0QR/tRX41+g
 hX1L8ARhH1FXRHIYA1zUKd7eizY02HCuulehHAfeI7u+nJkRMOPJuvbzIkgEFz8+
 QUbfEFQqSxbSVF2hAkF83NrflLXhEQ00NvInOqHKFVVt04u3qITOEQkSu8CZBYBC
 gRh2rhSEjWLFmF3SaxkMMSdu/CLJqnF5T6sXBQ2+wTdBFQLf9QcFdZZ/Z+3NTwlK
 CE/XpH1AZMiVdWqzzClFztinOSfkQ8jLVL7AZK0GzSiRG39q/XiBTXwJILJ8dM4z
 leADmWukggpdtlrgnBtJHWCq2nja/QJbDVkWNyF0ZMPsErygKGAPTa2QdqrgUD7A
 ==
X-ME-Sender: <xms:DxW4XHUia3DOHQPbvY3plS5feXjTecC9d1suHALGu_G8yvqujzp6Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:DxW4XLZpNQUDJ-3HCj9XtJpJhCrdSzD0B_kH7YmHrSiUQwfNIAp12w>
 <xmx:DxW4XJ2q5pdRV8EzQjU-qy3Z-kPHdMJ74TfJmW781XndjnD3xEPt4A>
 <xmx:DxW4XPC3Zu2Ff6Dowe2nd3KSMnbchktrW9AifzKgaHIKsOQe65eRdg>
 <xmx:DxW4XOEFFcpGlPORvkr9-6jLhevewBXyG1RhlX3BabMG7UsER_D8Yw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 083CC7C199; Thu, 18 Apr 2019 02:11:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <89b5ffc8-93d5-4bff-9bd2-12a1a058cbbf@www.fastmail.com>
In-Reply-To: <1555429864-23291-1-git-send-email-eajames@linux.ibm.com>
References: <1555429864-23291-1-git-send-email-eajames@linux.ibm.com>
Date: Thu, 18 Apr 2019 02:11:26 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_v2_1/2]_hwmon_(occ):_Store_error_condition_?=
 =?UTF-8?Q?for_rate-limited_polls?=
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 06:11:30 -0000

On Wed, 17 Apr 2019, at 01:22, Eddie James wrote:
> The OCC driver limits the rate of sending poll commands to the OCC. If a
> user reads a hwmon entry after a poll response resulted in an error and
> is rate-limited, the error is invisible to the user. Fix this by storing
> the last error and returning that in the rate-limited case.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 4 ++++
>  drivers/hwmon/occ/common.h | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index c888f4a..0e812ef 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -138,6 +138,7 @@ static int occ_poll(struct occ *occ)
>  	/* mutex should already be locked if necessary */
>  	rc = occ->send_cmd(occ, cmd);
>  	if (rc) {
> +		occ->last_error = rc;
>  		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
>  			occ->error = rc;
>  
> @@ -146,6 +147,7 @@ static int occ_poll(struct occ *occ)
>  
>  	/* clear error since communication was successful */
>  	occ->error_count = 0;
> +	occ->last_error = 0;
>  	occ->error = 0;
>  
>  	/* check for safe state */
> @@ -207,6 +209,8 @@ int occ_update_response(struct occ *occ)
>  	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
>  		rc = occ_poll(occ);
>  		occ->last_update = jiffies;
> +	} else {
> +		rc = occ->last_error;
>  	}
>  
>  	mutex_unlock(&occ->lock);
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index 7c44df3..c676e48 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -105,7 +105,8 @@ struct occ {
>  	struct attribute_group group;
>  	const struct attribute_group *groups[2];
>  
> -	int error;                      /* latest transfer error */
> +	int error;                      /* final transfer error after retry */
> +	int last_error;			/* latest transfer error */
>  	unsigned int error_count;       /* number of xfr errors observed */
>  	unsigned long last_safe;        /* time OCC entered "safe" state */
>  
> -- 
> 2.7.4
> 
>

Applied to dev-5.0.

Cheers,

Andrew
