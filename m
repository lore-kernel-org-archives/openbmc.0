Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP4571LdCzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:11:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4N5UwS3"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id o65so254214ybo.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 21:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KHzxfWCHTksBZoUYK4wEGcZ3aGZd2iK6qXtkP+Gu6fU=;
 b=N4N5UwS3YIMLOWmTC9IkF8n913z6iNB62JKVtIOgl7diWFJ8cPfkzERxnivXNzrOef
 huxjulCW7CsLCnZARyXjl24KH6GFFOr8x2LxTtnLcnFlBNfOvBOQ1Gcjbq14hsodWrIu
 ThxKuvOhAebNGbkbFd0kYg6xVuhgphGKfEPj7OLVjOQYItISdKWpUwc6qQgshbeyTwbl
 XWGrcsrEKmSDvbvjjXw9fOpGqWVeUKpvXSOGVytbu+CfqtRnAF3qwWL10u46s/s7PBKt
 2f1piSCHgqhVrEipqRNyK1ZC2yYcQeRqp7bacu+op4HwSIscMuG0/tq5/UDpyOcMe159
 bIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KHzxfWCHTksBZoUYK4wEGcZ3aGZd2iK6qXtkP+Gu6fU=;
 b=Zs/v5uxb+/0UyIWQichvs5w/Ck5zacmjFe/6mOEfgu4yAED07zZgxEar1lhgO6dQTq
 DOBY/KhWXggvrBjJqp+WMWZFXbHwwhzBJwcgpebYiN6QgTvTEu5fVgq0a8dLodJbXSyR
 8QZQl/6ltK9T2ci8nMMeGbL5jK4WVZJqYV6pOB8wjjggrR75G1MG+IWZWKu0cpvDeCEh
 yX06I4OBuWfFYRvfsXqqhnjce2vQBzlGrreK6UPZ67zn1H9S2NELhJnur/ut0r/Svsiy
 MDa+hNc0A9ktwgcrZCk19j5zSMm93GNiDXQc/8KJ4YWAPAUpw1eppo823UOOGtpf1sPb
 68Qw==
X-Gm-Message-State: AMke39mw4RAthasDgJe9EefGMYweAADCxqyPNZjwJrst2BwD1psSR0PT9YTitk1Yg5zWKpaCvPYvtIgaFggyPQ==
X-Received: by 10.37.70.66 with SMTP id t63mr274923yba.196.1487221896644; Wed,
 15 Feb 2017 21:11:36 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Wed, 15 Feb 2017 21:11:15 -0800 (PST)
In-Reply-To: <CAARXrtksFuxQ7ZvYpm6bTLvn7DMFAJ1b1uPvyW_8dEDbSd9JzQ@mail.gmail.com>
References: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
 <1487207539.3661.30.camel@aj.id.au>
 <CAARXrtksFuxQ7ZvYpm6bTLvn7DMFAJ1b1uPvyW_8dEDbSd9JzQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Feb 2017 15:41:15 +1030
X-Google-Sender-Auth: qyaZ4k0fuSOUJIWaGM-0CxEtYeY
Message-ID: <CACPK8XecYgUYOb-aZub71GDBTediTDcN+CP+OG29K_8ivd2WgQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-bmc-opp-romulus:
 Enable mailbox and LPC control nodes
To: Mine <mine260309@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 16 Feb 2017 05:11:39 -0000

On Thu, Feb 16, 2017 at 2:02 PM, Mine <mine260309@gmail.com> wrote:
> Hi Andrew,
>
> On Thu, Feb 16, 2017 at 9:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Hi Lei,
>>
>> On Tue, 2017-02-14 at 15:25 +0800, Lei YU wrote:
>>> Also add the reserved-memory node needed by the LPC
>>> control driver.
>>>
>>> > Signed-off-by: Lei YU <mine260309@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> index c23627e..f47eb63 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> @@ -19,6 +19,18 @@
>>> >     memory {
>>> >             reg = <0x80000000 0x40000000>;
>>> >     };
>>> +
>>> > +   reserved-memory {
>>> > +           #address-cells = <1>;
>>> > +           #size-cells = <1>;
>>> > +           ranges;
>>> +
>>> > > +         flash_memory: region@94000000 {
>>> > +                   no-map;
>>> +                     reg = <0x94000000 0x04000000>; /* 64M */
>>
>> So these values are also used in the zaius dts. Why are we reserving
>> 64M 128M down from the top of the RAM address space? Is the top 64M
>> meant to be reserved for anything as well? Why not reserve the top 64M?

The top 64MB is for the host VGA framebuffer.

$ python3 -c "print(((0x80000000 + 0x40000000) - (0x94000000 +
0x04000000)) /1024./1024.)"
640.0

There was a mistake made due to not knowing the size of Zaius' DRAM,
so things are 512MB lower than they should be.

> This is a good question, but honestly I just copied this part from Witherspoon,
> and this is just the same as Zaius.

> Maybe Joel has some comments on this?

The intent was to leave a 64MB window for the host framebuffer, and
then put the 64MB buffer for mbox below.

Can you please fix up this patch and also send one to fix Zaius?

Cheers,

Joel
