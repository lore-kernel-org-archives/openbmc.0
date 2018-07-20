Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OTHmPQpw"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WsmZ5wj0zDqCF
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 10:52:29 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id s198-v6so18360858oih.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 17:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wC6yuxBYZiA715IWa5FPyzX+zMHBgkT3F9ryZ6wetmE=;
 b=OTHmPQpwYIhbvMhE6NLYJC3/QmEowWxLPl6EYFHCl6tpPNrOkQcPDcAog0N44F5bmK
 QmMEguF44PQmqgHNt7HwDPmVVPI3kCbO+y6CcnSYFSGtVHXsov50LEYjXLeHOrCCDPlR
 Dg+kVl4PdWvb6mLOhqgudmjBfpc74G7NxZRQMKYrgq+WK6p5dfaWHujC4UWxLTk6C/v5
 o++run5XNXv1bWr6jP4OeUJJ3PSXXNmvfNZQr50f9XCKlgRweHPjN7qy4YRNt9hokc0m
 31ImOY78UJvlr05dWMri0wpEsgSx5jmJtn0bl71zzqNLI1dp/jhpLvlo8kK1RseS6irk
 gDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wC6yuxBYZiA715IWa5FPyzX+zMHBgkT3F9ryZ6wetmE=;
 b=VUOnO1ItT3kww32F9jCVCiYri9Mw1AzykGuJccCV9wJojitp7qzdVE6GDnQPhTgqZx
 SJ1SaYxGoFBJJYplAEfCPbW6xAf0b3gb/GD9u1R8Wv2wyLQQmaFTjFc60hM+j/nVW0TE
 whyNinuKnbcU/wpb3vuQbIhSEMBVRMF7M5pdWnjrOBQHWBjESdFbhbFDqM6KNYfJPbMK
 5gAOmqc+GsEU4WI3VCMitd8lYrooAVI9lCPFlftk+4aOrq9vbIiPfsO52Sxuapbf2m2m
 YXMuk/ac/Ms7Jt1Mnu4oraChHBWshdvfwJzNtQiAw9QXZ48+ULTTBza2G/9vkLTaDo80
 z0gg==
X-Gm-Message-State: AOUpUlGhLWbqKRiRu9ai60rVMZebCshMrPOMhCaLPLnUFXkUjKs71CoT
 3VnGWcNsI/NhSPQr92v7fg==
X-Google-Smtp-Source: AAOMgpeu7gwFCFjpQFPXNSl86ZndfYms396cJWV7lxASQB5aYuFhZ0A5Uj3ymK0fFzaDKPLd2iM6iw==
X-Received: by 2002:aca:758c:: with SMTP id
 q134-v6mr303121oic.334.1532047947853; 
 Thu, 19 Jul 2018 17:52:27 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.59])
 by smtp.gmail.com with ESMTPSA id w204-v6sm1426864oif.2.2018.07.19.17.52.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Jul 2018 17:52:26 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id DACE884D;
 Thu, 19 Jul 2018 19:52:25 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH] ipmi: kcs_bmc: don't change device name
To: Benjamin Fair <benjaminfair@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Cc: AviFishman70@gmail.com, tmaimon77@gmail.com, haiyue.wang@linux.intel.com, 
 tali.perry1@gmail.com
References: <20180706181601.134913-1-benjaminfair@google.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <caadb9ae-68ca-3086-26fc-e03cb7ce1d59@acm.org>
Date: Thu, 19 Jul 2018 19:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180706181601.134913-1-benjaminfair@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2018 00:52:32 -0000

On 07/06/2018 01:16 PM, Benjamin Fair wrote:
> kcs_bmc_alloc(...) calls dev_set_name(...) which is incorrect as most
> bus driver frameworks, platform_driver in particular, assume that they
> are able to set the device name themselves.

Sorry for the delay, I've been busy and on vacation.

This is queued for the next release.

-corey

> Signed-off-by: Benjamin Fair <benjaminfair@google.com>
> ---
>   drivers/char/ipmi/kcs_bmc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> index fbfc05e3f3d1..cd75118bb0ac 100644
> --- a/drivers/char/ipmi/kcs_bmc.c
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -16,6 +16,8 @@
>   
>   #include "kcs_bmc.h"
>   
> +#define DEVICE_NAME "ipmi-kcs"
> +
>   #define KCS_MSG_BUFSIZ    1000
>   
>   #define KCS_ZERO_DATA     0
> @@ -440,8 +442,6 @@ struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
>   	if (!kcs_bmc)
>   		return NULL;
>   
> -	dev_set_name(dev, "ipmi-kcs%u", channel);
> -
>   	spin_lock_init(&kcs_bmc->lock);
>   	kcs_bmc->channel = channel;
>   
> @@ -455,7 +455,8 @@ struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
>   		return NULL;
>   
>   	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> -	kcs_bmc->miscdev.name = dev_name(dev);
> +	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
> +					       DEVICE_NAME, channel);
>   	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
>   
>   	return kcs_bmc;
