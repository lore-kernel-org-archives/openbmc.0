Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GxY9pUa8"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynNmp100mzDrpm
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 14:53:45 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id 94so6322599lfy.10
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 19:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=f81wFpvI9AZHK05WUrCmu++XSMojZNiNfq2CvReYIg8=;
 b=GxY9pUa8BPx/tm66qSgSqYUzh6gxRVjxD0rrVrf1i5LpOnrptx1MndBN8HxyF9QKo3
 iaesHdnGfIbSx0QGygrw/ogw2RBlhA33/S0FE9uN9Emj4XrbybuEzZ6LIHBCaL+KsV4q
 xJ5G/LI80yuZJkoypKkElx34ziAyn8BfCd7cqodpnZj2hYxw3F7UJDFQBT796IwgnZ2A
 QP1iRPH9Vl+jR19+qmWQp63sO6z3iR1xZcvoe1XQq8KHPMGRvT5cQ0S7cBu+EUnLUflU
 Fhum6nHX6mcmZX0yF0wQcOYTaV7Xd/PCl14VtVmxZ9NAy+HjRAqKaDQwRchRnWAlBJrx
 EO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=f81wFpvI9AZHK05WUrCmu++XSMojZNiNfq2CvReYIg8=;
 b=i+9ybRlxxu1iMxhULFIy6Ayif+r3oNze1UDq3q5kS+ui2HeWAMBW12gWbYSj0j/G3o
 lEwvU5YSyfPfADS6WDNcqXItQFfuwz6v1CLqJNT0fbtHwS1fz+u3heBuvCC6WmQL2+oL
 KW4F/zEDTRE7ALEqXFSu0WVNfmFvYLlDAPe3DIm5jpM8zBYxjImnkXrg4HmW06+ehxeI
 wb/Qy9n4cPGffd5bCDMGkLv30jXsT7yY9aWboLe+mOhnLvfJKni0RWpoD8W+6DNb1441
 26usy8nP5BctqOqhP8ljD7iNChZ2wmV8K8iBnfq7fAvlOk0D7+vqeCsDzBo9w48bFik3
 HAaA==
X-Gm-Message-State: AJaThX4uGdv7gnzT9z6ZmVtH+1hPji9pX9woL55OnKZaBb/sYHif6i8h
 cQMrimLp2L4IPSg+i4xW1f8iIb6p8KGl/UsLEkw=
X-Google-Smtp-Source: AGs4zMbhOeHfPd7eYM2Xh0tiGpS4Uiwa39K2/WWuacvG26Y3iY32C6S00KBtMiJqmA3s6Fqs/2AR9cuu3RUTSx26i4M=
X-Received: by 10.46.88.68 with SMTP id x4mr2381960ljd.138.1512014022151; Wed,
 29 Nov 2017 19:53:42 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 19:53:21 -0800 (PST)
In-Reply-To: <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
References: <20171120185445.146061-1-venture@google.com>
 <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Nov 2017 14:23:21 +1030
X-Google-Sender-Auth: SdWsJBgFAyMc6WQbfDdEOPxW2hE
Message-ID: <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Patrick Venture <venture@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 03:53:47 -0000

On Thu, Nov 30, 2017 at 5:03 AM, Patrick Venture <venture@google.com> wrote:
> Can I get a status on this patch?  The device datasheet has 4K
> reserved for the range, but only the first 512 are registers
> controlled by this driver.  The rest will be handled by a separate
> driver.  Or at least that's how it's planned.

+cc the people who have worked on this.

I think that's okay, but lets see what the others have to say.

Do you have a driver for the rest of the GPIOs you can submit? I'd
like to see  that code so we can decide if there is good reason to
make that completely separate, and not part of the existing driver.

This work is best done upstream, as you will need to make the same
arguments there.

Cheers,

Joel

>
> On Mon, Nov 20, 2017 at 10:54 AM, Patrick Venture <venture@google.com> wrote:
>> Instead of 4k, it should be 512 because the latter
>> part of the memory region are registers for the serial
>> gpio driver.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index 6505062ac6c7..424d843ec1da 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -231,7 +231,7 @@
>>                                 #gpio-cells = <2>;
>>                                 gpio-controller;
>>                                 compatible = "aspeed,ast2400-gpio";
>> -                               reg = <0x1e780000 0x1000>;
>> +                               reg = <0x1e780000 0x200>;
>>                                 interrupts = <20>;
>>                                 interrupt-controller;
>>                                 gpio-ranges = <&pinctrl 0 0 220>;
>> --
>> 2.15.0.448.gf294e3d99a-goog
>>
