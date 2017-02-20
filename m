Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRPLV3M5qzDq60
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 11:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uGvgjcdm"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id u130so1709508ybb.2
 for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2017 16:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=U+Kw7pdXU9LC7qZOZn3UBbzHgalPz1plsKqvL5OYhJc=;
 b=uGvgjcdm9U6+dFoTsdnWgUJF6hAoykOExboAvxWwFiatso0HkKIixBdk8ppBv5mCbq
 aO5s/7btBmTadj34ekdBNVAlzLBDH0FQC3ObNVduoJYjEoVtiMGyYrBNsnJ2Qfrz5teW
 n1WZ6NNTlXb6rKdkURJu3URmajNVsiOj3W2P01lBIl4MTgRphIsnl5AMyHhhW5qThDbn
 GPreIuaA+xUI0ltHIsNjhT7p+DaDC4d4/5lHcGHVLAGGDRjVnb3pEDRYxNBZ7RSRPyq8
 Pc4LFtrKLwJg1VPfq2l3aExK/q7VJpH4ks4i+T7jj7vb7ypUazcgtCLW+8MeuSWI39zt
 RHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=U+Kw7pdXU9LC7qZOZn3UBbzHgalPz1plsKqvL5OYhJc=;
 b=DWae7ol84VfzChXgBzwIJmG3DB2/KRW/iqObzBRvx0GO+nBWyWr0z+Qd+WDgQUJBLv
 1VPTGjk1tVdCkLrnHF8qIlz2twZRXeCNn/02/exDicpvtAtUsvp+IpALShySsz+fZ7jE
 YkaWt6gjdrAGoeYOfuqUOqWRzdeymrMnHa3o9ATsGAW+AofDkB9utK3FSFm3/BZPXxyw
 hzfTq5G1EF30CNxx85rlAcINnqFfd142W/0jT6FLH51zAZf6bWFai3DbzQtfayRIVajm
 FZDvRAV67r4cvm0/B+FBavX1ya2uEP0AbvI7Y3IrU2wYwfwgbQ59xajKl/O4OlV1EUO8
 Bxhw==
X-Gm-Message-State: AMke39m7RU66r1cGrtoIBAZxU8I4aU5Bybxw+CnpyFpGYM2zcOalnY3p39eN7u2iADyHliqtnaCCP0ww4TCH8w==
X-Received: by 10.37.194.5 with SMTP id s5mr13174380ybf.136.1487549775120;
 Sun, 19 Feb 2017 16:16:15 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Sun, 19 Feb 2017 16:15:54 -0800 (PST)
In-Reply-To: <CAARXrtmp_dhz_7jTTDh2+tKK_dOniWzz=KB0Lt9-pAOc-Wt80Q@mail.gmail.com>
References: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
 <CAARXrtmp_dhz_7jTTDh2+tKK_dOniWzz=KB0Lt9-pAOc-Wt80Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Feb 2017 10:45:54 +1030
X-Google-Sender-Auth: EVXWR3_fGTHlX8dRekqGZFcQWsw
Message-ID: <CACPK8Xf5AgsKPMVuA8KUjrTrGc1j_2r4kMOC8kmX33wNRxGAFg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspeed: romulus: Do common setup
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 20 Feb 2017 00:16:19 -0000

Hi Lei,

On Sun, Feb 19, 2017 at 12:06 AM, Mine <mine260309@gmail.com> wrote:
> I thought do_common_setup() is called by default, but actually it's not.
> So Romulus needs to call do_common_setup() as well.

We don't need most of what this is doing on any platform.

>        /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
>        writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));

This is performed by the LPC driver that Cyril has written.

>        /* Set UART routing */
>        writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));

This is the default. If we need to change it in the future we might
write a pinmux driver, but for now we could omit this.

>        /* Setup scratch registers */
>        writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
>        writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));

We don't have a driver for this. Andrew was thinking about a UIO
driver. Ben started a discussion[1] upstream about the preferred
approach.

[1] https://lkml.org/lkml/2017/2/17/30

Cheers,

Joel

>
> --
> BRs,
> Lei YU
>
> On Sat, Feb 18, 2017 at 9:33 PM, Lei YU <mine260309@gmail.com> wrote:
>> Call do_common_setup for romulus.
>> No other romulus specific setup is needed.
>> Consider moving do_common_setup() to a common place.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 2a11c2e..726b8fa 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -218,6 +218,11 @@ static void __init do_witherspoon_setup(void)
>>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>>  }
>>
>> +static void __init do_romulus_setup(void)
>> +{
>> +       do_common_setup();
>> +}
>> +
>>  #define SCU_PASSWORD   0x1688A8A8
>>
>>  static void __init aspeed_init_early(void)
>> @@ -253,6 +258,8 @@ static void __init aspeed_init_early(void)
>>                 do_zaius_setup();
>>         if (of_machine_is_compatible("ibm,witherspoon-bmc"))
>>                 do_witherspoon_setup();
>> +       if (of_machine_is_compatible("ibm,romulus-bmc"))
>> +               do_romulus_setup();
>>  }
>>
>>  static void __init aspeed_map_io(void)
>> --
>> 1.9.1
>>
