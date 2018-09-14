Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UcuTCz+T"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Bbmt46NlzF3Rs;
 Fri, 14 Sep 2018 23:23:10 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x26-v6so4394898pge.12;
 Fri, 14 Sep 2018 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o7n8h3dsvy/5m8MNklCTfmR6wi7Je7Iul01LWrZX5Tk=;
 b=UcuTCz+TiE5TnTeVA/F9HLWh0bDDm0hhRAEJTCiXK4krbkwJO2WnyHWiuUfjt326Ug
 LxceM54b0pT+yZdOsfIfMvWdk5wxia0wvx2/JCHf8hifZlkbbxpvyd0osgH4fdGCDsdV
 FokvfMfCKUetgktRSVx0+kAikMJ3pU4FTICD1GRQncpvIRryaLG3w+/du3t4zBUP/AEQ
 GegTZIE5aAPk4iB88NJQoT9sKZt87yzr2EmAE9CLRBalQbsa51eulUSX6PnOeTNp047S
 aqCQD4tBE7mYohAS68EDo5kTAK9VWiNGqQyF2cyuD6peH+bWjZfnZnbKsJdi5beDz5fX
 AX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o7n8h3dsvy/5m8MNklCTfmR6wi7Je7Iul01LWrZX5Tk=;
 b=fRhUjiCtkzLjPqPHNeJQmCyzxteY9qsfWoNwa/4kjsG0fDg6h1MB86tFAojljwaTrU
 90zX4GX0jl9jMircpbJtIFaywoSunk4ae9Q/7FXzspOwmxoaDPZXjmnubYH45M7BvMSP
 Z8PV5p2vOeyWRkYDhHpeqUlNFuDSicjjmfH/t5O+7gpuLQDAOyIIXsQUIaFVL6x3NADo
 pWR4xcPuqPj5KeIIpNscLlH0EUFnpI7U1mciKCqwqrBO8BC3FSFFEpTRpyDB9sICr6Eb
 0OzFn2mAI7ZjnLPXegT9a/CqCcS6uhCK/nz5Wek90Vqd5UFJGYvSSSC8wAOErwOih1On
 sN2g==
X-Gm-Message-State: APzg51Bn2jXmYlbrmXjYdD0h3s/kxxe5S075xmbYDg50I3lBVKJUybLa
 K/H5LANzWgJr92eFC7KdN9Y=
X-Google-Smtp-Source: ANB0VdbXLVtwFnbM+BsKQEwVy6O7ga81Sp5+JTQf/yujrdVY0W5LmeV2UWG5MmERahBryB6H2mIDeg==
X-Received: by 2002:a63:b705:: with SMTP id
 t5-v6mr11219048pgf.366.1536931388027; 
 Fri, 14 Sep 2018 06:23:08 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id h85-v6sm11258362pfk.71.2018.09.14.06.23.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Sep 2018 06:23:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Feist <james.feist@linux.intel.com>
References: <20180911233302.GA18799@roeck-us.net>
 <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
 <20180912013449.GA12612@roeck-us.net>
 <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
 <20180912195844.GA6893@roeck-us.net>
 <da7f4691-7428-3114-32bb-e0171f6c7228@linux.intel.com>
 <20180912203059.GA18201@roeck-us.net>
 <fb185839-3ae0-01dc-09e8-f22db55ecb04@kaod.org>
 <3f86e75f-1502-eae8-0633-d087937111c8@roeck-us.net>
 <f47b3050-3abd-caa4-cc71-4b13ef60e2c0@kaod.org>
 <20180913155703.GA22605@roeck-us.net>
 <2c481986-7ee0-4887-5c9b-64e2cd9d8c04@kaod.org>
 <b4da2b68-e6e3-e068-cd6e-9e638aa67889@roeck-us.net>
 <ccbf7059-77fd-44e8-daee-516582814cb3@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <94a2aa4e-69ac-7042-92d9-1ada46d5fc33@roeck-us.net>
Date: Fri, 14 Sep 2018 06:23:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ccbf7059-77fd-44e8-daee-516582814cb3@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 14 Sep 2018 13:23:12 -0000

On 09/13/2018 10:38 PM, Cédric Le Goater wrote:
>>>> That seems to suggest that none of the status bits auto-clears, and that
>>>> the above code clearing intr_status should be removed entirely.
>>>> Am I missing something ?
>>>
>>> You are right. I just pushed another version of the previous patch with this
>>> new hunk :
>>>
>>> @@ -188,7 +200,6 @@ static void aspeed_i2c_bus_handle_cmd(As
>>>    {
>>>        bus->cmd &= ~0xFFFF;
>>>        bus->cmd |= value & 0xFFFF;
>>> -    bus->intr_status = 0;
>>>          if (bus->cmd & I2CD_M_START_CMD) {
>>>            uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
>>>
>>>
>>> The QEMU palmetto and witherspoon machines seem to behave fine. Can you give
>>> it a try ?
>>>
>>
>> Works fine for me for all affected qemu platforms.
>>
>> How do you want to proceed with the qemu patches ? I attached my patches
>> for reference. Maybe you can add them to your tree if they are ok and submit
>> the entire series together to the qemu mailing list ?
> 
> yes. They are pushed in my aspeed-3.1 branch. I will send the series
> on the list.
> 

Excellent. Thanks a lot!

Guenter
