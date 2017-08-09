Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSBww34jlzDqZy
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 23:30:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="23cpzPaV";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZIzH3FmR+jdPaHcnj/+8X36OsSh9MgG5KiPQLC0p4qo=; b=23cpzPaVjZGhG/V0s7yE5b44yR
 nLX37sr7en3mJZhPIO20pvl6SyCtZk8BjCgu0M5MKU3uXOBTU7KYGFL0Q301tqC6KVBxxlH/tIsZH
 yegXcW70aLPqXznxcIYF8mW2O8F45kUiKfjl/XQ81L/HvwaEid2Vd3pmyBL3VHoYkaI/XUSE0ynbW
 Sjq4k2xm84pYSjSihr7aV1CBlxXmXcOr0TflXVl8UnDemMYCcr8w4nHkSMIjbfTn5lBxh86+nowRr
 jrKj3jvc/hVkWUv934guNh04g84JEIGwgpk8hPsYSSuC3ums4Z/XkjiJmUCKf3VL5QY1JKhac16pV
 64VwubMg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:56694 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dfR4W-002urJ-Vp; Wed, 09 Aug 2017 13:30:53 +0000
Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
To: Mykola Kostenok <c_mykolak@mellanox.com>, Rob Herring
 <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>,
 Ohad Oz <ohado@mellanox.com>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
 <3c427ddd-aab6-13d4-bfb2-ae22848c0d13@roeck-us.net>
 <DB5PR05MB122451EAD6E4A470ED2FCFBEEF8B0@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a1b34c1d-b00e-7a8f-7950-c2007d6b5eb7@roeck-us.net>
Date: Wed, 9 Aug 2017 06:30:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <DB5PR05MB122451EAD6E4A470ED2FCFBEEF8B0@DB5PR05MB1224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated_sender: linux@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 linux@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: linux@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 09 Aug 2017 13:30:57 -0000

On 08/09/2017 12:15 AM, Mykola Kostenok wrote:
>> -----Original Message-----
>> From: Guenter Roeck [mailto:linux@roeck-us.net]
>> Sent: Wednesday, August 9, 2017 7:09 AM
>> To: Mykola Kostenok <c_mykolak@mellanox.com>; Rob Herring
>> <robh+dt@kernel.org>; devicetree@vger.kernel.org
>> Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>;
>> openbmc@lists.ozlabs.org; Patrick Venture <venture@google.com>; Vadim
>> Pasternak <vadimp@mellanox.com>; Ohad Oz <ohado@mellanox.com>
>> Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-
>> tacho cooling device.
>>
>> On 08/03/2017 01:46 AM, Mykola Kostenok wrote:
>>> It's add support for cooling device creation to aspeed-pwm-tacho.
>>> Cooling device could be bound to a thermal zone for the thermal
>>> control.
>>>
>>> v1 -> v2:
>>>    - Fix commit message.
>>> v2 -> v3:
>>>    Pointed out by Rob Herring:
>>>    - Put cooling-levels under fan subnodes.
>>>
>>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>>
>> Did Rob ever Ack this patch ?
>>
>> Note you didn't copy the hwmon mailing list, which doesn't exactly help to
>> keep track of it, and I may have lost Rob's Ack. My apologies if that is the
>> case.
>>
>> Guenter
> 
> Hi, Guenter.
> 
> No, Rob Herring did not ack patch yet. Just comment.
> 
> Yes, since I split initial patch to 2 patches, I have sent one to you and hwmon mail list,
> and another to Rob and devicetree mail list. And added you both to cc.
> Am I need to add both mail lists to both patches in such cases?
> 

Normally the dt patch would still be pushed through the same subsystem as the driver,
so, yes, it would be useful to have hwmon copied. Otherwise it won't be in the hwmon
patchwork and can easily get lost.

Guenter
