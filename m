Return-Path: <xow@google.com>
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqbKS5zQtzDqgK
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 07:55:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g/Bc2usn"; 
 dkim-atps=neutral
Received: by mail-qt0-x22a.google.com with SMTP id i34so1506060qtc.0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eqbgNZkjaqzkTYsk5VefJpljBcUlyMHpH7LB1fB3kGM=;
 b=g/Bc2usnLSnPVJdY3ysMuIQ6/Q/D0M5MlK0xVdkOoENB9/8xRMvMFvTG6cBRffN3lw
 i1PpA2VVHvPM2vxXeKfZkwuvPGkBD0+xfO9tr3TusSQtxPr8kc8am1omwPrSOwBS6tO0
 3dKVar95vFm5PQGSyMNUe5ArWruBBo/jV1OAmkZlHjqd15WW3IiR3iygr+d7UDetBJYd
 OZtRG/1NB5cMJBFvKGW4tdH2sq6vCH3bbKQNCTcEZq5Fks9duHA9NGbjN2WSeliaGs0v
 e1daAAnM4JgcxfaAtXTFb8WE61PLPc5+pBBkM/pYOFRsfo8x9Xdt/LLkxWmY9qLCtrEL
 pLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eqbgNZkjaqzkTYsk5VefJpljBcUlyMHpH7LB1fB3kGM=;
 b=oVUDeO1xkpRyq+tk2U2XxWLRPiS60fQMUHnRVZI3/OMoNYKC0ndGwsKOiMY/v0PSSR
 wfA4nl82Wui+dgm91FGstVr0UWY+BB9KIq702Owk2Q4AJA9UUbgRwwvgGo5LNL7g/Hcr
 L6rEuos4RfMsydId8KzdMMCx3FhIZLvegaqHN0FwFkEQlSbca2lFPz8kHP4TLZjNFG+1
 NeT1t4QjfVpbH7+dKIVopYTdEVKZ0a1VaVsroULj3W6ToAxy426v70k7gN1Yfy0Zv9F8
 hE1QYWehAN13P2f5jEWXkX8QQq2maHJzcB6Pno7zRZBv+AAkmzmIgbHA9E2ybH+/EDn8
 ct0Q==
X-Gm-Message-State: AFeK/H2gTs/uO1zhwFzouz7wbbJCFrLLcJtpJPWeT7l0aPitFUnu7qS4kQoprKLYxH0oO3JV5dygU3oSYY4lMWFY
X-Received: by 10.200.3.230 with SMTP id z38mr10427200qtg.181.1490388921231;
 Fri, 24 Mar 2017 13:55:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Fri, 24 Mar 2017 13:55:20 -0700 (PDT)
In-Reply-To: <1490321135.3847.6.camel@aj.id.au>
References: <20170324011322.31837-1-andrew@aj.id.au>
 <1490321135.3847.6.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 24 Mar 2017 13:55:20 -0700
Message-ID: <CAPH-5w7Ac9tw0+Q8XvLspENjPuMczewKOT9dMeGLYs1nB2ZVWw@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: Disable UCD90160 in the Witherspoon
 devicetree
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Mar 2017 20:55:25 -0000

On Thu, Mar 23, 2017 at 7:05 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Xo: Adding you in case you've seen any issues with Zaius that may
> benefit from a similar work-around in the short term.
>

Thanks for the copy. I haven't seen the unsupported command errors
from the UCD90160 on Zaius. I suspect it's because we perform less
i2c-get/-set on our UCD, since it is already programmed to treat the
UCD rails' control pins as output GPIOs.

Do those errors you see always come after a UCD9000 driver bind operation?

> The associated userspace changes for Witherspoon are here:
>
> https://gerrit.openbmc-project.xyz/#/q/topic:unbound-ucd+status:open
>
> Andrew
>
> On Fri, 2017-03-24 at 11:43 +1030, Andrew Jeffery wrote:
>> This is a work-around for [1]. Binding the UCD9000 driver to the device (and
>> possibly the sequence of unbinding, poking the UCD90160 via i2cset, then
>> re-binding the UCD9000 driver) appears to have some negative effects.
>> Instrumenting the transactions with reads of the PMBus status tree lead to
>> the following observations under "normal" operation.
>>
>> [1] https://github.com/openbmc/openbmc/issues/832
>>
>> UCD9000/PMBus core sending unsupported commands:
>>
>>          Jan 24 06:42:50 witherspoon kernel: ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Unknown error
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: CML status: 0x80
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
>>          Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning error -5
>>
>> Reading the status bytes off the UCD90160 gives -EBADMSG:
>>
>>          Jan 24 06:43:21 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_BYTE: -74
>>          ...
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_CML: -74
>>
>> "Other comms fault" errors:
>>
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Unknown error
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: CML status: 0x82
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Other comms fault
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
>>          Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
>>          Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
>>          Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Unknown error
>>          Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: CML status: 0x2
>>          Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Other comms fault
>>          Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Unknown error
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: CML status: 0x80
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
>>          Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning error -5
>>
>> Reduce our problems by communicating with the UCD90160 as little as possible.
>> With the associated userspace change, the only communication will be applying
>> the VCS work-around.
>>
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 4d26d4702a34..69d5897dbfde 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -253,6 +253,7 @@
>> >     };
>>
>> >     ucd90160@64 {
>> > +           status = "disabled";
>> >             compatible = "ti,ucd90160";
>> >             reg = <0x64>;
>> >     };

cheers
xo
