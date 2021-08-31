Return-Path: <SRS0=R7DO=NW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC74C432BE
	for <openbmc@archiver.kernel.org>; Tue, 31 Aug 2021 20:19:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FE86101B
	for <openbmc@archiver.kernel.org>; Tue, 31 Aug 2021 20:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91FE86101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzdnj4hQZz2yPl
	for <openbmc@archiver.kernel.org>; Wed,  1 Sep 2021 06:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mpH5oM2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mpH5oM2S; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzdmn4YMfz2yfn
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 06:18:33 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id e186so501824iof.12
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zD2jk9ErOAZNolbqQHEVl04hUOv8D/uzEqonG0UfPIo=;
 b=mpH5oM2SXJ34SXVOgUxRfB5weIx+CX1uTuM+lJX1i+8CDz8M2zimtUhZh/s29zuta+
 e22qDCGwGt8gStZQOkEvfk8gWnnEVyw5I9ZljjvMha9C7dzVtwnXb94PAkZoF+V053W5
 m29wKXP4QOma0KyawwdS+2g2xysC9Vwau3nQhbSj9HjuQ8NDUKgcgSQft3t5bAfZPzMu
 +j8YhFxUfhlvJDvA93NiSmiQb7aluG1VNXBQgx6NCGGIlcC7EjaZi5liqX+LDpLdughL
 wQ79f/Qb1B6E43yXpigqUGfQMpTqsQwlvOURu2627w8D2ddXhvDkYg8uBe1DWBqmlcrc
 IcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zD2jk9ErOAZNolbqQHEVl04hUOv8D/uzEqonG0UfPIo=;
 b=DeQKYljPHMEJTUOgmEN0MsuKw92a63FQ7Azlvh5+wZLbAvQ48/w/N4EWnMvf+TcH0t
 rdbL2xoUvpGQ75uUIdk2sMdAV9Wl48b2stxL4Xu7azr713RiO8n57sEsSOQ8a9eFeZT2
 ve3d8ugYYkJ1LZKT1daEAXfnPZNCd/6z+z86NLDwD7aozkgtZDVoUAsK+9XF+2ioVaqk
 QhkSDwql2rQOnYdwhMTF8uxCXeBRbwpuULy/3fEFPSPDShLB7hKmBgu/y0tYMhYRipoq
 1wl2H6OuNbiqjZXh/pdq7wbEZr9SLpVOo6eySS/mQX7I8H6YoyJid/CpqdKmy8qpRwjE
 kk3A==
X-Gm-Message-State: AOAM531QSpNANXzizF8gCbngb5GtXI+IJgHbYoqq6ysnFoj6QhEDMHsW
 rAJ4V2YmOihi3i7LTTM4A/k=
X-Google-Smtp-Source: ABdhPJwxMDE0PK0GnmBrS6FYKYMCEbeISyoYF9IP5FjDDKFlC9n9GUdD4UU2WFGqcvf4XtgQRIBsrw==
X-Received: by 2002:a5d:928c:: with SMTP id s12mr23690427iom.151.1630441110832; 
 Tue, 31 Aug 2021 13:18:30 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-117.rochmnaa.metronetinc.net.
 [199.48.94.117])
 by smtp.gmail.com with ESMTPSA id u10sm10958269ilg.15.2021.08.31.13.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 13:18:30 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
To: Guenter Roeck <linux@roeck-us.net>, Eddie James <eajames@linux.ibm.com>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
 <cac545d4-3840-898c-4950-8262fea9e2ab@gmail.com>
 <51149737-4ec6-032b-607e-9aaa48951efc@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <e95c8f49-53ea-9319-43e7-3a05f335a0b2@gmail.com>
Date: Tue, 31 Aug 2021 15:18:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <51149737-4ec6-032b-607e-9aaa48951efc@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


On 2021-08-30 16:27, Guenter Roeck wrote:
> On 8/30/21 2:07 PM, Brandon Wyman wrote:
>>
>> On 2021-08-30 08:50, Eddie James wrote:
>>> On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
>>>> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
>>>>> The bytes for max_power_out from the ibm-cffps devices do not need
>>>>> to be
>>>>> swapped.
>>>>>
>>>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>>>> Eddie, can you confirm this ?
>>> This can't be true for all the power supplies supported by this driver,
>>> no. I think we need to check the version first. Brandon, I tested this
>>> on witherspoon (which is psu version 1) and get 3148 watts. If it's not
>>> swapped, that would be 19468 watts...
>>>
>>> Thanks,
>>> Eddie
>> I had tested this on a variety of systems with a variety of different 
>> power supplies, but I did *NOT* test this on the Witherspoon power 
>> supplies.
>>
>> This apparently requires a bit more thought to figure out how to 
>> handle the other types and also not get Witherspoon wrong.
>>
>
> Is the specification for those power supplies available in public ?
>
> Thanks,
> Guenter
>
No, unfortunately those power supply specifications are not available to 
the public.

Sorry,

Brandon

>> Thanks for checking Eddie.
>>
>>>> Thanks,
>>>> Guenter
>>>>
>>>>> ---
>>>>>   drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c
>>>>> b/drivers/hwmon/pmbus/ibm-cffps.c
>>>>> index df712ce4b164..29b77f192c9e 100644
>>>>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>>>>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>>>>> @@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct
>>>>> file *file, char __user *buf,
>>>>>           cmd = CFFPS_SN_CMD;
>>>>>           break;
>>>>>       case CFFPS_DEBUGFS_MAX_POWER_OUT:
>>>>> -        rc = i2c_smbus_read_word_swapped(psu->client,
>>>>> +        rc = i2c_smbus_read_word_data(psu->client,
>>>>>                            CFFPS_MAX_POWER_OUT_CM
>>>>> D);
>>>>>           if (rc < 0)
>>>>>               return rc;
>>>>> -- 
>>>>> 2.25.1
>>>>>
>
