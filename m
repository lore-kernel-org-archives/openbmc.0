Return-Path: <peterh@google.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpSm21BZDzDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 11:56:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MwPLGa/W"; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id b140so73977670iof.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 17:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nYUDTNsew5RU4bkegTezaD8qFRffs7HCnQo3HcsO7eA=;
 b=MwPLGa/WL+VY6baHIQXmzZ4SjHr0NBOSLuE5tzVHz1goi4VuWvDcV7UkEjIAlhcsUL
 gtjFR8NZqzpChO3bcZI6DUeszmIezSyUpL9fjC8bl28xkmj/cUnES7K6oIB6CcLZcIAA
 znmhlcRlGPzz6BpMH6EeACGPJZGHlh/+Kgbv/p5LZWvJS0JdGm1BRkDyhc8MdE7uwgO6
 BvwaLDGI4PmKEmAgaU5X9Pp+HCXj4WZeLRwbNhT5KZbAxJP9kcMLVUrBvqlmplOIO47w
 bOpob0/FvZKjg2ZAyob/joqxrSejXwGmy78g2wgmz+iI2hW14yB9ZRH8TPntg8he2i/A
 cajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nYUDTNsew5RU4bkegTezaD8qFRffs7HCnQo3HcsO7eA=;
 b=McZ9/b+aIEAdrNy/wu9c6YcU9n5CLkSHBrDBx49UHeT6w/V+HfalD+jKASBtXMWXrY
 YalM2nBIUGUHV4Il5TRev/+HT+DSlNm3uwMl3JCU9hQGQ4lN+eUuXxvoANbd+ABi1MXk
 p3S7mFei6CRVrAqZYYzDk41MeIj/0m+hnNPxh+PytuznfIkIgrhcznPz+J1HA+xOqGdk
 WoUZJ9n4bOej1vCMkRV6XNsvmg3phleA1419Cql4CqGyuvvJGW78mlbzZwegcqnhwC1V
 mhtlLg80gnsl9eDoQbIYy4+RsntUuc7VkfAe9z1OBxj7QnTydogJ5etJBLDSbjT5LoJl
 GZFA==
X-Gm-Message-State: AFeK/H04Is2CznLa0BI30X2LhA6i0IcywVB1P7Q8xmBU7WOh0HI+KaC1E302XPOzyWnzb6zFvydnrjj1thn3scz+
X-Received: by 10.107.6.13 with SMTP id 13mr307142iog.72.1490230559464; Wed,
 22 Mar 2017 17:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.84.202 with HTTP; Wed, 22 Mar 2017 17:55:58 -0700 (PDT)
In-Reply-To: <CACPK8Xc2jfaxO5yXMj=vHOt6sRmrcDa8-YcKbC3ptEwN9LCSGA@mail.gmail.com>
References: <20170323002727.117666-1-peterh@google.com>
 <CACPK8Xc2jfaxO5yXMj=vHOt6sRmrcDa8-YcKbC3ptEwN9LCSGA@mail.gmail.com>
From: Peter Hanson <peterh@google.com>
Date: Wed, 22 Mar 2017 17:55:58 -0700
Message-ID: <CAPozSNogeicObhLbQb_OryvxV_69rxLaQPUz9kMWi-EiE2C9fQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 00:56:02 -0000

On Wed, Mar 22, 2017 at 5:41 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hello Peter,
>
> Welcome to the project. Congrats on your success with the git tools,
> v2 looks much better. There's some tips and tricks on the wiki for
> next time:
>
>  https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-tools
>
> On Thu, Mar 23, 2017 at 10:57 AM, Peter Hanson <peterh@google.com> wrote:
>> Signed-off-by: Peter Hanson <peterh@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index 3bd70ed810af..4fd27617bb3a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -269,7 +269,13 @@
>>         /* Master selector PCA9541A @70h (other master: CPU0)
>>          *   LM5066I PMBUS @10h
>>          */
>> -       /* 12V SMPS Q54SH12050NNDH @61h */
>> +
>> +       /* 12V SMPS Q54SJ12050 @61h */
>> +       q54sj12050@61 {
>
> This is an interesting name. I assume it means something to you? My
> favourite search engine came up empty.
>
> You're free to use whatever name you think is appropriate for the
> node, so if you want to make it name like "power-brick" you could.

It is (allegedly) the part number I tested with.

I prefer your idea. The Delta site references to quite a few related parts,
any of which should work the same, as far as pmbus is concerned.
Incoming!

> If you're happy with this name then that's fine too. I'll wait for
> Xo's ack and apply it.
>
> Cheers,
>
> Joel
>
>> +               compatible = "delta,dps800";
>> +               reg = <0x61>;
>> +       };
>> +
>>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>>         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
>>         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
>> --
>> 2.12.1.500.gab5fba24ee-goog
>>
