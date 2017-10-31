Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+GtbWtv"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQvJY5BcDzDqwW
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 12:43:40 +1100 (AEDT)
Received: by mail-io0-x242.google.com with SMTP id 189so31605675iow.10
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 18:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=v8qJbq9lhZ6OnQfcyVf0Rbo+tqZbOl9Gk8itC8/qfkE=;
 b=k+GtbWtvTlqIseuyMI3AoYayeQxEtso+psax1DpnWeEu/9btEQsywcIa07v0IiQ+gI
 gm37rdsbdG0zEf/9PnDJ0OiQR+zY9+32jMcFxaTREr9CtEQLmAy4bR//FZDUHzlQGPt6
 DkALoGS94n7dQWcYrLozRfK4sOcXbfOjCAAN6Ok9UjOJU/gLK50rcOwKrLYTgeHcm9uE
 /OrhOZ7n9VQauCZ8ulsdZOMfrdyqaQ9oYj6PPO/MjuMVSdjaoPaCRcxDqd21TjWfd9t5
 UH5WezST69mSvOE/TETrKEO7Yj6R8P7fX6XlZ6fTBMNMzSgDexB1aCVFsKOtOtK3dhT1
 QjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=v8qJbq9lhZ6OnQfcyVf0Rbo+tqZbOl9Gk8itC8/qfkE=;
 b=nEw4rAZdST3HP9tO2FpW3B/cJEaO53LzcedhKIyxXLkrK2T+Lzl4WSnMM0Lo21gNuT
 E/YrjKkBX9CmFzh5aNTHZevJwy5+6MDKoCjBqlAKSzHWYA1axs1Dm4goBfBcG3xcAbUo
 vhIDZHwMi67zJ4qDfOHYacyk2JikPKncyaTWnF8kDyCOTZx7NloGXVUc2T8CRlMaXBlC
 zW+IofF39zxshLU03zvFpMVfkzbmk9jUqHG4FMOH+qjhz4pAvocp+wrPP8QSw6mibxjh
 rKAAA0rwIiaeMlg2YejFq4ZZO7Wi66Iph20gHESX6HBCp1yr7B7P5A2gzzHv5RPyX7EH
 uZKg==
X-Gm-Message-State: AMCzsaU69OS+rFYXdGy8pi7yHbnd7xaZAtv4ic16FQNKreqxvHE/guxU
 AailpN/ELXgNDgh9mDb7acouSODUGPPND1Pd7Yc=
X-Google-Smtp-Source: ABhQp+RtL67Y+u2ALdNI0nJvc6AEUFPkjGNULLfOeLL9eyiLwWZZd5VyhpxrDLiMqgPdQpKXQqFP5xZMg7dkqjEPNyQ=
X-Received: by 10.36.246.76 with SMTP id u73mr916089ith.55.1509414217399; Mon,
 30 Oct 2017 18:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.9 with HTTP; Mon, 30 Oct 2017 18:43:36 -0700 (PDT)
In-Reply-To: <1509407892.13477.27.camel@aj.id.au>
References: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
 <1509407892.13477.27.camel@aj.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 31 Oct 2017 09:43:36 +0800
Message-ID: <CAARXrtkEGGPJJ8nR=swcP2XMofJiuqp0Bm409OAGtAkXxtmPKw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: romulus: Add reset tolerance
 for power GPIOs
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 31 Oct 2017 01:43:42 -0000

On Tue, Oct 31, 2017 at 7:58 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2017-10-30 at 17:20 +0800, Lei YU wrote:
>> This is a similar change as Witherspoon, that enables the host to stay
>> up across BMC reboots.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index c84c871..5965bbf 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -196,7 +196,17 @@ static void __init do_witherspoon_setup(void)
>>
>>  static void __init do_romulus_setup(void)
>>  {
>> +     unsigned long reg;
>> +
>>       do_common_setup();
>> +
>> +     /* Reset tolerance for BMC_POWER_UP (GPIOD1) */
>> +     reg = readl(AST_IO(AST_BASE_GPIO | 0x01c));
>> +     writel(reg | BIT(25), AST_IO(AST_BASE_GPIO | 0x01c));
>> +
>> +     /* Reset tolerance for SOFTWARE_PGOOD (GPIOR1) and SEQ_CONT (GPIOS7) */
>
> What is SEQ_CONT? I'd guess at "power sequence continue". GPIOS7 doesn't have
> an associated net name in the schematic I have for Romulus, though it's pulled
> up to 3.3V. Maybe my schematic is out of date?

Exactly, it is "power sequence continue" that Romulus CPLD handles this:
* When it's high, CPLD pauses power sequence and when it's low it
continue the sequence.
  This behavior is used for vcs workaround for DD1.x
* When system is powered on it shall be low, and if it becomes high,
CPLD results in PGOOD fault.

Pass1 schematic does not have this and it's done by Nick's EC;
Pass2 schematic has this GPIO named SEQ_CONT.

Thanks.

>
> Cheers,
>
> Andrew
