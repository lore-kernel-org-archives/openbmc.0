Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNtb7oKX"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lLLc2tQQzF37D
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 11:57:59 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id y189-v6so15326051itb.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 18:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wprIMFtWNdv0n43ZSaIzFDbVe4iZtDcTqewuicapnRM=;
 b=bNtb7oKXtxt4X3AHhP9UNLpyGVU6tjod9wxssYU531aarowjrNmGQPildPdrEnuFDE
 zk7u/RFG7rK8rXJCAqwer+iZKhtzGgx4yRqsaW0a/p2UeIwcOiFC643PcxxnqEA6qSjX
 nASB4PRl0IaEmIY6q9pjyEBuZ7BYZYqxTmCyswDcxKUrKcrulEkbaPa9f78TbV9o6lbn
 Q3gA2qi9QIDYrlVGToTPa70krdHjGnfJu12XaoJ+8yYYZnypRBaKSgctx6lbDdjaayo0
 zCpX0xA+4Xo8+pIHK8i7RLHCqbuyFgYQaxBS0vBVReuD6geN47+fHp28oe6w4YCjteR1
 PAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wprIMFtWNdv0n43ZSaIzFDbVe4iZtDcTqewuicapnRM=;
 b=QLgXVZLNBQVnKd29ADMoKe2ly2vkkPG6LPSJxQtgg50zxkU3+gqn3//0+GboIchopU
 ZZcAAjl6igyy2QPNJAYUwvKOAVaDQw7oQLnl/V5brJZrCKW+d/sPnTQimBTJsEUkJhFQ
 iKERYTpEzueXI87L9+5QUQlY8qbi/hg2tk39ndxV0ZrmZtjjgHf49gUFj4gGau+a+q70
 lhPqz1Y3vhSJCE30Hs2fKYo/NkjHHwdUqTIhAsA5IPOgiFYTo7ehf1DIqedAQrNfBOGr
 baYbUAFNF243HBf5zNBFcZZRhaVZGt7iGBQKxba2N0G2dX4Gg0vTX4w/nt1bsUvifFrk
 vifg==
X-Gm-Message-State: ALKqPwf25k7LdQ9bcFLHYnvphhNTDuPA8U/AMItRnMK/PGdnaLwlWJVH
 5/C5UucmdTRJZsCZurXdx55eC534ve5Ze1yyeOU=
X-Google-Smtp-Source: AB8JxZoX1lmbBT3sDC/8LYpeBnSaW122o++u6FqDwGMAnFK6Hy1+0/u4XYOdBxtrZCJZQNW0gFMnagE9fZadDbr31LM=
X-Received: by 2002:a6b:11df:: with SMTP id
 92-v6mr12995769ior.156.1526349477751; 
 Mon, 14 May 2018 18:57:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Mon, 14 May 2018 18:57:57
 -0700 (PDT)
In-Reply-To: <1526349203.3522551.1372178312.7B38A3F9@webmail.messagingengine.com>
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
 <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
 <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
 <1526349203.3522551.1372178312.7B38A3F9@webmail.messagingengine.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 May 2018 09:57:57 +0800
Message-ID: <CAARXrtkc86rh2WDbK9nAnfY0PPJS2BpSeQSJTLFf3Ccxzc3edQ@mail.gmail.com>
Subject: Re: Question on States monitoring
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andres Oportus <andresoportus@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 01:58:01 -0000

On Tue, May 15, 2018 at 9:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Lei,
>
> On Tue, 15 May 2018, at 11:19, Lei YU wrote:
>> Hi Andres,
>>
>> The existing [phosphor-gpio-monitor][1] contains two services, one is for
>> monitor gpio interrupts, the other is "phosphor-gpio-presence" that checks a
>> gpio output and let it be some state on DBus.
>>
>> I guess the "presence" service is what you are looking for, that maps a
>> gpio output to a Dbus object.
>>
>> The existing use case is:
>> 1. Witherspoon checks if power supply is connected and create dbus object
>>    /inventory/system/chassis/motherboard/powersupplyX, it also is able to
>>    bind the kernel driver when it is attached.
>> 2. Zaius checks if a PCIE card is connected on E2B and create dbus object
>>    /inventory/system/chassis/pcie_card_e2b
>>
>> You can see a little detailed explanation at
>> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#gpio-presence
>
> That porting guide looks like it has some interesting info, and I feel like we should probably make it part of the docs repository. Did you have any plans on integrating it?

Yup, I will submit to openbmc/doc (when it's somehow ready).

This doc is my attempt to help system vendors to know OpenBMC and get it
ported on their machine.
And for now I have sent this to 2 or 3 vendors and ask for feedback.

It's not completed yet as I need to add one more page for some development
tips, e.g. how to quickly modify a code and get it tested.

>
> Cheers,
>
> Andrew
