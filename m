Return-Path: <dja@axtens.net>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7wmt5MCzzDq68
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 08:56:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=SkmqvKDU; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id g132so16876579pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version; bh=J+9R0Az9RbV3KK6TbqTy2me6Lgb37ZcY8BQtmBXsM7E=;
 b=SkmqvKDUT5ggqBZyDc4PYUhlkVLjrqRMVtCkZl2CCpTPPAA1EFeMBUos+Uuud65/IZ
 HtpyOaBbMCuROIEX06g6HB4AQkYp+AlqY/6Z+GRZur/iC/vZa2RhZyU2nN6rCzZyR4qx
 haEp0fWlugAs/96YGVRKRjzHWn3J9T1c4LRB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version;
 bh=J+9R0Az9RbV3KK6TbqTy2me6Lgb37ZcY8BQtmBXsM7E=;
 b=A0gzYxH5pQnr+irWXs+rVFTCRAePgwlR0TXz0cM2xvwG0xUeD0QWUQaq2stN0cCEEQ
 8edw0xc44txmILXV3S/VHGHQ674GBilcdT0lmBsSWeP21Id+gWjgMG3Jzxcu3Y2ieLOy
 zN2Nkb+20Z4NSegUM4lrgX+c2j4yhCL1SOl/NjvnyA18PiveQzlArYXy1Ac64QHJGH/n
 crxND0hDfmgWpHP1wXOD5hVEg39fCNkj0KkUXX1yEiSE094i1FSImREfZp819HaqY4FY
 xgfsd1RITNcCtiePzk5YrpsdJSWCqKyYIxkI8BfiQQdEMiK/vJ67aZbnZ3z3uvhhrNLM
 ObYg==
X-Gm-Message-State: AOPr4FXEllJ03gaCpFO222o7mSjP9P7ip4mmsTdkAgnJecwrIffR17hKwXpGfzPtF4h4cA==
X-Received: by 10.98.101.199 with SMTP id z190mr49176605pfb.1.1463439371284;
 Mon, 16 May 2016 15:56:11 -0700 (PDT)
Received: from localhost (ppp121-45-219-137.lns20.cbr1.internode.on.net.
 [121.45.219.137])
 by smtp.gmail.com with ESMTPSA id q129sm49588807pfb.16.2016.05.16.15.56.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 May 2016 15:56:10 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 anoo@us.ibm.com
Subject: Re: [PATCH ipmi-fru-parser v2] Replace uint8_t buffer length variable
 with size_t
In-Reply-To: <1463427614-11252-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463427614-11252-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463427614-11252-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 17 May 2016 08:56:06 +1000
Message-ID: <878tz9bojd.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2016 22:56:15 -0000

Hi,

Looks good to me!

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The latest Barreleye vpd contains additional custom fields in one
> of the board sections, pushing the size of the buffer over 0x100.
>
> The current variable that stores the buffer size is set to be
> size_t, but the function using it crops it to uint8_t  which
> doesn't fit the extended size. Changing the function to use size_t.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  frup.c | 2 +-
>  frup.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/frup.c b/frup.c
> index 7bdf35f..49718ba 100644
> --- a/frup.c
> +++ b/frup.c
> @@ -948,7 +948,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
>    return (rv);
>  }
>  
> -int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl)
> +int parse_fru_area (const uint8_t area, const void* msgbuf, const size_t len, sd_bus_message* vpdtbl)
>  {
>    int ret = 0;
>    int rv = -1;
> diff --git a/frup.h b/frup.h
> index 8400951..64a0562 100644
> --- a/frup.h
> +++ b/frup.h
> @@ -10,7 +10,7 @@ extern "C"
>  
>  /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
>  int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
> -int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
> +int parse_fru_area (const uint8_t area, const void* msgbuf, const size_t len, sd_bus_message* vpdtbl);
>  
>  #ifdef __cplusplus
>  }
> -- 
> 2.8.2
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
