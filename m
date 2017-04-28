Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb154gb9zDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:54:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKaQAKK7"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 203so3927075ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=1fvDZ/fylIOVCg5niBZBdCln+aJMyz0qGK9SAKrF6lI=;
 b=GKaQAKK7zYimL2BETZYuAdPcMa1NmuKkDF/HYI/s5ew7AwlzkSuSYs8ccYr1q5/1Jq
 mwGumCwXb7Hqd1U+it517Aketaa/FxkYCC+sRKkUfgQRsWWSGY3RYSM3ubu5MgWomW5q
 25mY7dFwkKw43MvnmdB7voWC8gJ+b7DgKvN7znMSASmKY6qqFA5u6EXZG0x2nwxc2vty
 YKmNaL+4l2o6He3tFkYCf5Y+1T8ODe+pIn4FzMt4FvgQuC9THFAd4lp9kLiV+uNiR9os
 5c+ZOhKPpTBYlUyzCDk25ID7x137uTKxajPn1kpTw5UMlwpmL/TTrA0Wwl6C2YbT/3XP
 KzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=1fvDZ/fylIOVCg5niBZBdCln+aJMyz0qGK9SAKrF6lI=;
 b=THLy7MwWIRb1jZbVGjg+VlexP419HSWkAuJjQ/VC9EhSJLjfnBBvYrbXZccd9+uXow
 6PIM5Cm7OqS6FffrojHkA9dU/SP9iU7r7LAxk4/itKlWgSR4EstdvH2obvLY42Wxk78R
 2X31LL5KG0+uBHzXzurNFcofrAkkVwhjwLE3tgFF+ZA2yiTUZkGg3dEh7B+H/WaHqgJG
 rVYnZ35B4FqPfhjH0uaDwaNFisdp1yS7RJbwZWzAKGZuik8F72qxJTIJXRUS/FwTFZmY
 XDLL8wtYaF/NJyGiGcrvuK5+lNX0mVS8GV38V/6qYSRc32WfkftWsVR0vJSWrnuUWQB4
 Ij1g==
X-Gm-Message-State: AN3rC/7wXjrjzph5MyQIA8/CtIPlfNbBBvUuhYidqkggsinoHlGpuH2q
 ATOl0FPZvmaM3gxwEsKeyb8aMEU75Q==
X-Received: by 10.129.73.12 with SMTP id w12mr4794514ywa.219.1493340839503;
 Thu, 27 Apr 2017 17:53:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:53:39 -0700 (PDT)
In-Reply-To: <34e26925-3142-9917-feac-eeb17d1eea13@kaod.org>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-11-andrew@aj.id.au>
 <34e26925-3142-9917-feac-eeb17d1eea13@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:23:39 +0930
X-Google-Sender-Auth: xwG9mvuZSi_03OmGKmGGK67OYLw
Message-ID: <CACPK8XcVvwdkkttdx4DZDb6jsbym5+6HZk1TUcwOTMC7bWKktw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 10/10] aspeed: romulus: Remove manual CS
 decoding window configuration
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Lei YU <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Apr 2017 00:54:02 -0000

On Thu, Apr 27, 2017 at 4:27 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
>> This is now handled by the SMC driver.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

I will take the cleanups that Cedric and Xo have has acked now. As
applying without the earlier patches in the series created conflicts,
I applied these three similar ones as one patch.

Applied to dev-4.10.

Cheers,

Joel

>
> Thanks,
>
> C.
>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed=
.c
>> index 837649b9fad9..14cea0825199 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -153,12 +153,6 @@ static void __init do_witherspoon_setup(void)
>>  static void __init do_romulus_setup(void)
>>  {
>>       do_common_setup();
>> -
>> -     /* Set SPI1 CE1 decoding window to 0x34000000 */
>> -     writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
>> -
>> -     /* Set SPI1 CE0 decoding window to 0x30000000 */
>> -     writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>>  }
>>
>>  #define SCU_PASSWORD 0x1688A8A8
>>
>
