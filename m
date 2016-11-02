Return-Path: <xow@google.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8DPR24XCzDvJ5
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 03:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Z+Qxdh9U; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id p16so12389428qta.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4ywSULnnfFxx3wbc2xfI6yC/1bKFYRgSlcFUBJTyw9A=;
 b=Z+Qxdh9U/Hz1UPzzJoeTOFoyQ6/pHMjfzRdivn268aSz/VD3eOfbcyjv04gZ1vuOim
 yD9OMlkoWeeH22kb9If732F7px8Hv126RDcao3k3oS7DFpMH9bt8f2oU58TMG7+AED9t
 bySdTRTBPf7FUJbvbVWd9tGMaTMVQcgE0W7mYbT9xBToCBot22BKYY1vu1R96aoPimGk
 MX/jboN971TgOKD1UONU7a+pWtgb7ivsShAVb6iJj8IX2tVfSZ27Rc5o3wH6qkqst2tU
 4vJu/HkIIpEqI8W+a0PIMttDvEgjKtG+iiZMeLx00nawjZN+ouXIHKUZBfoOOBdeU3HX
 O69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4ywSULnnfFxx3wbc2xfI6yC/1bKFYRgSlcFUBJTyw9A=;
 b=mOaYVFR4K71mrgj8lgb1wbb0W/jDQuDyYKsUuqvmyIj4YcTJhk/3tajgFMHWqZcrEZ
 AMwWvgFRr1Bmsfej6E/dMtRzU4AIFViaZQ3FfBAu4cZ45oWis0pm0iE+yKmgaT0PzB7F
 PSuULG2oCHSo9GkgXjdk5mpTfPH4K+HR474+5HyQ6H1Znm9/OjTTXYphTlfjM99IESwM
 1qOqnduA7TqCUrTZHy4h74XPP8aFK8E/fI9rJW65DJybgJW2HFtxMXLTc31bglujjS3A
 Ysnfj7zn0NDsrVyRcqI5S/uDcY1EYdGJ17LyawUAP7cy+glNBZ9IOy2pKQ4HRD6j/J65
 kYaw==
X-Gm-Message-State: ABUngvfyDM/RQPitq6ONeUReRKyKKJ8aVMxPGsZOiXnoDY2y96Dn9yntRFmzbbUHNK7s0XA5hWgBlBKfdC7TFYnj
X-Received: by 10.200.41.108 with SMTP id z41mr4013285qtz.20.1478104855650;
 Wed, 02 Nov 2016 09:40:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Wed, 2 Nov 2016 09:40:55 -0700 (PDT)
In-Reply-To: <1478088662.27396.5.camel@aj.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
 <20161102055557.24349-2-joel@jms.id.au>
 <1478088662.27396.5.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Wed, 2 Nov 2016 09:40:55 -0700
Message-ID: <CAPH-5w498pdxsc22+TSMY4u1hEiPmWqrQMa2j6bQzuUsqGkG1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
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
X-List-Received-Date: Wed, 02 Nov 2016 16:41:01 -0000

On Wed, Nov 2, 2016 at 5:11 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
>> All of the ast2500 systems that we support have incorrect strapping for
>> SPI. This commit moves the Zaius specific strapping change to the common
>> ast2500 setup, so that Witherspoon, Romulus and the EVB can benefit.
>>
>> This moves the strapping change out from the Zaius board version check.
>> I don't see an issue there, as the will still be correct for future
>> boards.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>

Reviewed-by: Xo Wang <xow@google.com>

>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 0a4578290d5e..57c32ff0fa83 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -152,6 +152,12 @@ static void __init do_ast2500_common_setup(void)
>>       reg = readl(AST_IO(AST_BASE_MAC0 | 0x40));
>>       reg &= ~0x80000000;
>>       writel(reg, AST_IO(AST_BASE_MAC0 | 0x40));
>> +
>> +     /* Set strap[13:12] to 01, Enable SPI master */
>> +     /* Set bits in writes to SCU7C are cleared from SCU70 */
>> +     writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
>> +     /* SCU70 is set-only, so no read-modify-write needed */
>> +     writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
>>  }
>>
>>  static void __init do_ast2500evb_setup(void)
>> @@ -190,12 +196,6 @@ static void __init do_zaius_setup(void)
>>               /* D3 in GPIOA/B/C/D direction and data registers */
>>               unsigned long phy_reset_mask = BIT(27);
>>
>> -             /* Set strap[13:12] to 01, Enable SPI master */
>> -             /* Set bits in writes to SCU7C are cleared from SCU70 */
>> -             writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
>> -             /* SCU70 is set-only, so no read-modify-write needed */
>> -             writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
>> -
>>               /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
>>               reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
>>               writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
