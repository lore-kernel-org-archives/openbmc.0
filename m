Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8tpf3pLvzDqfj
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 13:31:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dQFjxV3L; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 109so5126791uat.2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 20:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4undcbdLc3DcIUqIdqEm/whdsQGxC9V39OTJKI6aQZA=;
 b=dQFjxV3LsdC0Sp8gXSIb72e9RMzrZ1l3kuRgfL0QcaRKbMEL1GE42wo6UrPakxONpd
 R5A8tRB0BdDLKWX4lByBnsVIBWL8RruhRdShaVY40ExjTH+s88bdAgY22+gY0ip2OaS0
 qs7Y+txNUfA+tq7Gj0stTtpQ2LC0qZJf5G9/dZTcLzXkccbSqcav6sstz9g7nSlvHX/W
 yIkmO5rlgGnbbZ+q9yNQj1MHNB5eFgtwA2upD9u+121wpudJXVSRXNTINbbwxwjh07Yr
 HaZlwu9trcDSGsC2JOCZpwooC3D+z4dOZYcxTMULdBphG5W4Z66iTQJVvle6Vk0N1Jy+
 U1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4undcbdLc3DcIUqIdqEm/whdsQGxC9V39OTJKI6aQZA=;
 b=GjGarNo0NtXFY0a7szFH0tr12CVGMkrRMXIKl8toLulNtYeBKJMjt8pu9AyF5IA/5l
 2Nn0H8Jxx6j2gostVgGavCTtb19RTTa/IAJIsJEyqE6rv310Ee5gFBfWOB+oKOmfvbG9
 YuhchHKB4r+nepCC6aOh29bi3/K6R2GgPGfkE2oz2JeIA4IUR6T5B8rG/7SQkE+kKrmR
 5mlzfcfTZDDXL2Q3r/R2DZua55xgYOMoVQX+lTL5sDFVMzxh5bIJph8CbfDoT8YNFqvV
 6vqzHvSDFKxstUkh1JxY8u0KOzuXgbo0NmsQqgplHOTFiYasvYFDwoOZy3ITeJSdRB/j
 JY7g==
X-Gm-Message-State: AEkoouslRUitlBAG3bhpUV0G4IMVs0LP6R/i9/L+Nmj+xvOXmtlIxNaxnERTJ47PZAzEN83YcVg/Am3Yzbq61Q==
X-Received: by 10.31.146.10 with SMTP id u10mr2093289vkd.14.1470886279312;
 Wed, 10 Aug 2016 20:31:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Wed, 10 Aug 2016 20:30:58 -0700 (PDT)
In-Reply-To: <1470879628.27272.41.camel@aj.id.au>
References: <1470820879-18661-1-git-send-email-joel@jms.id.au>
 <1470879628.27272.41.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Aug 2016 13:00:58 +0930
X-Google-Sender-Auth: u_Dn0lvvbYiEFjeug_i6VsoBVVU
Message-ID: <CACPK8XcLNozgZHF4cKNVn0r8s0NFDidi9dCH12GD13Amg8GEAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl/aspeed: Add GPIOR to g4 pinmux
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 11 Aug 2016 03:31:23 -0000

On Thu, Aug 11, 2016 at 11:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-08-10 at 18:51 +0930, Joel Stanley wrote:
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 81 ++++++++++++++++++++++++++++--
>>  1 file changed, 78 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> index d36e14892d4e..96952bf33b9f 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> @@ -585,6 +585,71 @@ SIG_EXPR_LIST_DECL(ROMCS1, SIG_EXPR_PTR(ROMCS1, ROM8),
>>               SIG_EXPR_PTR(ROMCS1, ROM16S));
>>  MS_PIN_DECL_(V20, SIG_EXPR_LIST_PTR(ROMCS1), SIG_EXPR_LIST_PTR(GPIOR0));
>>
>> +#define W21 137
>> +#define W21_DESC     SIG_DESC_SET(SCU88, 25)
>> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR1, GPIOR1);
>> +SIG_EXPR_DECL(ROMCS2, ROM8, W21_DESC);
>> +SIG_EXPR_DECL(ROMCS2, ROM16, W21_DESC);
>> +SIG_EXPR_DECL(ROMCS2, ROM16S, W21_DESC);
>> +SIG_EXPR_LIST_DECL(ROMCS2, SIG_EXPR_PTR(ROMCS2, ROM8),
>> +             SIG_EXPR_PTR(ROMCS2, ROM16),
>> +             SIG_EXPR_PTR(ROMCS2, ROM16S));
>> +MS_PIN_DECL_(W21, SIG_EXPR_LIST_PTR(ROMCS2), SIG_EXPR_LIST_PTR(GPIOR1));
>
> I'm thinking we should separate out muxing of the chip selects from
> enabling the optional ROM signals. We need to hash that out before I
> resend the patches upstream.

Okay. I'll leave these as-is for now as I'm only interested in the
GPIOR bank for now.

>
>> +
>> +#define Y22 138
>> +#define Y22_DESC     SIG_DESC_SET(SCU88, 26)
>> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR2, GPIOR2);
>> +SIG_EXPR_DECL(ROMCS3, ROM8, Y22_DESC);
>> +SIG_EXPR_DECL(ROMCS3, ROM16, Y22_DESC);
>> +SIG_EXPR_DECL(ROMCS3, ROM16S, Y22_DESC);
>> +SIG_EXPR_LIST_DECL(ROMCS3, SIG_EXPR_PTR(ROMCS3, ROM8),
>> +             SIG_EXPR_PTR(ROMCS3, ROM16),
>> +             SIG_EXPR_PTR(ROMCS3, ROM16S));
>> +MS_PIN_DECL_(Y22, SIG_EXPR_LIST_PTR(ROMCS3), SIG_EXPR_LIST_PTR(GPIOR2));
>> +
>> +#define U19 139
>> +#define U19_DESC     SIG_DESC_SET(SCU88, 27)
>> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR3, GPIOR3);
>> +SIG_EXPR_DECL(ROMCS4, ROM8, U19_DESC);
>> +SIG_EXPR_DECL(ROMCS4, ROM16, U19_DESC);
>> +SIG_EXPR_DECL(ROMCS4, ROM16S, U19_DESC);
>> +SIG_EXPR_LIST_DECL(ROMCS4, SIG_EXPR_PTR(ROMCS4, ROM8),
>> +             SIG_EXPR_PTR(ROMCS4, ROM16),
>> +             SIG_EXPR_PTR(ROMCS4, ROM16S));
>> +MS_PIN_DECL_(U19, SIG_EXPR_LIST_PTR(ROMCS4), SIG_EXPR_LIST_PTR(GPIOR3));
>> +
>> +#define V21 140
>> +#define V21_DESC     SIG_DESC_SET(SCU88, 28)
>> +SIG_EXPR_DECL(ROMA24, ROM8, V21_DESC);
>> +SIG_EXPR_DECL(ROMA24, ROM16, V21_DESC);
>> +SIG_EXPR_DECL(ROMA24, ROM16S, V21_DESC);
>
> Ah, bug here, the DECLs above should be:
>
> SIG_EXPR_DECL(ROMA24, ROM8, V21_DESC, VPO_OFF_12);
> SIG_EXPR_DECL(ROMA24, ROM16, V21_DESC, VPO_OFF_12);
> SIG_EXPR_DECL(ROMA24, ROM16S, V21_DESC, VPO_OFF_12);

Fixed in v2.

>
>> +SIG_EXPR_LIST_DECL(ROMA24, SIG_EXPR_PTR(ROMA24, ROM8),
>> +             SIG_EXPR_PTR(ROMA24, ROM16),
>> +             SIG_EXPR_PTR(ROMA24, ROM16S));
>> +SIG_EXPR_LIST_DECL_SINGLE(VPOR6, VPO24, V21_DESC, VPO_24_OFF);
>> +MS_PIN_DECL(V21, GPIOR4, ROMA24, VPOR6);
>> +
>> +#define W22 141
>> +#define W22_DESC     SIG_DESC_SET(SCU88, 29)
>> +SIG_EXPR_DECL(ROMA25, ROM8, W22_DESC);
>> +SIG_EXPR_DECL(ROMA25, ROM16, W22_DESC);
>> +SIG_EXPR_DECL(ROMA25, ROM16S, W22_DESC);
>
> Similarly, these DECLs should be:
>
> SIG_EXPR_DECL(ROMA25, ROM8, W22_DESC, VPO_OFF_12);
> SIG_EXPR_DECL(ROMA25, ROM16, W22_DESC, VPO_OFF_12);
> SIG_EXPR_DECL(ROMA25, ROM16S, W22_DESC, VPO_OFF_12);

Fixed in v2.

Thanks for the review.

Cheers,

Joel
