Return-Path: <SRS0=Oq21=KP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27EFC433B4
	for <openbmc@archiver.kernel.org>; Thu, 20 May 2021 05:24:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4B7611BD
	for <openbmc@archiver.kernel.org>; Thu, 20 May 2021 05:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4B7611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flypv5Pf7z303y
	for <openbmc@archiver.kernel.org>; Thu, 20 May 2021 15:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.47; helo=mail-wm1-f47.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlypY5hyjz2xfw
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 15:24:21 +1000 (AEST)
Received: by mail-wm1-f47.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so4606590wmk.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 22:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFsvoCkU9zQjo7Svj5G5k4DUPYp2NU7fos0X3OEtvpQ=;
 b=Jy+bh9VKeybl6dnHdzNMUvN2YW6Dhjca1tHDc2MhMgRKAjnOV/mXKJ6TI7RluihiQw
 RB8+KBEI2ADqf33fr4P/g6BmylNtrWzJvMBx8fQYc5rlGCHEhoWO7cGo9M6GpA2tUc7E
 4n6kneM5ODMZynrGfeJBzmr4UNSIhIsmV7Ud7wt1reMtPaHSLl1SyeNvaKSuJMJqH2Im
 zUsP7n8uUgyLMLyQnW/Pf6+m6F6Cqx0e8HZVxIJeXp1MA2ixSfFDvDS8HgxZ/AE6LeFB
 2vdk0BNV1H6jn/KHv9NKyRwS7655n9OmZ59J8yQOKOQJd6OzIQeefJvfyrqqnkuwlBQQ
 4Caw==
X-Gm-Message-State: AOAM532dWoZlDmT9qN4LLFWge1x27TATe0nbVbgAdMV+pYie3ABPntVE
 7tap0LWZxsmG3t8ntYXoO47c2JZjGIc=
X-Google-Smtp-Source: ABdhPJwN1AJlH1oTPvwkZwtZxul6M9lJoO1Ot1z9kwebbxqx175nN7692CsdnxvBrcF0kKH719VSBA==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr2149681wmq.25.1621488256924; 
 Wed, 19 May 2021 22:24:16 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id g206sm7863810wme.16.2021.05.19.22.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 22:24:16 -0700 (PDT)
Subject: Re: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>, linux-doc@vger.kernel.org
References: <20210520015704.489737-1-andrew@aj.id.au>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <7a14c4ea-46ef-a615-a109-1b9777c507cd@kernel.org>
Date: Thu, 20 May 2021 07:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520015704.489737-1-andrew@aj.id.au>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: corbet@lwn.net, dwaipayanray1@gmail.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joe@perches.com, lukas.bulwahn@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 20. 05. 21, 3:57, Andrew Jeffery wrote:
> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> include/vdso/bits.h via [2].
> 
> I think the move to the vDSO header can be considered a implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
> 
> [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
> 
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Jiri Slaby <jirislaby@kernel.org>

Thanks.

> ---
>   Documentation/dev-tools/checkpatch.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 51fed1bd72ec..59fcc9f627ea 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -472,7 +472,7 @@ Macros, Attributes and Symbols
>   
>     **BIT_MACRO**
>       Defines like: 1 << <digit> could be BIT(digit).
> -    The BIT() macro is defined in include/linux/bitops.h::
> +    The BIT() macro is defined via include/linux/bits.h::
>   
>         #define BIT(nr)         (1UL << (nr))
>   
> 


-- 
js
suse labs
