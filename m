Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="acvmTC8F"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O966ytS5"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jnbt3K4GzDqJP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 11:20:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5C0C766B;
 Mon, 15 Apr 2019 21:20:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 15 Apr 2019 21:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=npmts75I7FfoUh49/+wPClFxbnWTe0X
 ImZIMNeOl8xo=; b=acvmTC8FfxJy8FwptNLhouHKXL0toK3F/Icu8x9qtNk7+ZN
 Lf9md/iXrBIgnXJo54ENwxD2/buvGB3J0e5SqstwrnRgfqMzl5a1jspyFQk815Ab
 9I/g+XtyV+/rSOH87le2V2mlEN2pJUH0LPP9u7LTHHlPxHFW8pKHSMZUsrjeBO6Y
 6UVGp7WtGrWoRPyvdqhl5J+a7fkV4ET8Mfnl5O1JjED0IJIiIVowBmf3J9dyGJ7S
 x6fvsgV125iqwfEWLkhqW4hzn6Mll8hh/UaOUko6SE6IamcB0n2QN63N88L1EGRH
 lJm9r+Ckjy+Q67DesI3+9MACARv5NqW5658eFnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=npmts7
 5I7FfoUh49/+wPClFxbnWTe0XImZIMNeOl8xo=; b=O966ytS5NrytARk9wE04c/
 mop3lD79GqHSPTzXwB2sL3TZDaVV2eQMQRLRB2bRD0yyT6K1ZiqOhLq/rXLZBcim
 m2mlXgcNfL9OwyIp3G0kqpR4I/yNoOIJIGrr1Rhoue4QDy5+IzRKUaBfuwRO7PUk
 I22sC+hjesboaDOHv/mMkK3fJ6fychFb+X1CiekWoGH7QdoMxWRikQliKxTt2czV
 yzEIewz92IhXug0PMGbB5cM7jIMFVtmtMvIdim8jZg8q5Ud2W6OsGJ/Q0XGM47S9
 9dWV435pliuq2tj9wvZ/y75M3ZmJU2jYX5QJ/AUJb1zwtgLtqGfrktuyUR9OfNAQ
 ==
X-ME-Sender: <xms:xi21XPZfoiKkwkzmvMiW3JhFAY4SQRco2fKsP2yD0_QSgpwFUSv26w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:xi21XCrVRg2advyvBtpnf6A8zDAk95vkn_csef3mB0-Ohc0NcL_6Eg>
 <xmx:xi21XM9rD_uJvmKPi9FBsNRbprNrWJOxmaIMTiZUPJXE2or49x3G9w>
 <xmx:xi21XJ_qP7RhJpR803XNwdZbBhAGANEUGsHO9rpfd3fUtuD6nliAAQ>
 <xmx:xi21XIlGu9ozPEZPFIQyBRDpYY1r24iwxdZ21TACrXaWMatB_WhqiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C07B77C283; Mon, 15 Apr 2019 21:20:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <59bbef63-e90a-4c74-af96-b0963b4e95bd@www.fastmail.com>
In-Reply-To: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
References: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
Date: Mon, 15 Apr 2019 21:20:06 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_1/2]_hwmon_(occ):_Store_error_condition_for?=
 =?UTF-8?Q?_rate-limited_polls?=
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
X-List-Received-Date: Tue, 16 Apr 2019 01:20:11 -0000



On Tue, 16 Apr 2019, at 07:59, Eddie James wrote:
> The OCC driver limits the rate of sending poll commands to the OCC. If a
> user reads a hwmon entry after a poll response resulted in an error and
> is rate-limited, the error is invisible to the user. Fix this by storing
> the last error and returning that in the rate-limited case.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Should this be sent upstream?

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
