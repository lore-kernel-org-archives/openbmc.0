Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD6JP1r2rzDqCC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQUT4TtF"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 203so1907680ywe.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 23:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=bKmQy7YbpVLAjmyIwtQQm6hm/6IhT/5I9x1Scrt8lUI=;
 b=KQUT4TtFAmPOjZqdUcyfP/RavkkLNL/1C9ol69P996Q/giI8kNMU1LrDhT/h4LuMjS
 5UbxNTKDACLRAasABSEIirXR8l2yklGI0JK48oR0D9JcGcJv0wbuwXc1WC7ck8Fk+k3m
 5x+RYW+JPvT8h2CkunU6qkahoG5q0hegeXJ7rcsCduhgy5ezl2XeeQXJZQIcU3N62kHs
 vk6m1rUjthWsxERUVUMKCs/XhYYEhRH0dds7FP5MaVjX68oZIgXZ1vP8PDtV0mSAw+zC
 fWdrwTOhU+PsR6JJxfwxmB8ClXnfl3uze9U6fTnYTAqrmUBUrq3cUycfmLunBR4hO6kf
 LDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=bKmQy7YbpVLAjmyIwtQQm6hm/6IhT/5I9x1Scrt8lUI=;
 b=JWGtAZ8Nbe/BHFQDUatcn3b3U6/cEIyEuhnPXZLsqxta/WXUawfVxZ/6cS1K1IDwtH
 +11OxoXfUGvB1zci9eP39gHNqqm595LcccEWTs6ooUySsjkH2wU5tPQVDXPx2bEIRi+q
 4cnbK+yHS6McRYUs5D+MQfume+dd/hJHWSE67UoMvmAwqyTzBxJl9B5DdRKhibkScv8/
 88txv99M/S5zlBdIj0lnbLRt34dBQuRFR+x4NLvVQAZjqt+UVnyVx3gLV0uzkbOZLYOg
 VlJi5F9IAZLmhdUHUJuAL5LPuSSK64dgJwelGWO+9gJWAFgxq54nlPRNMvAY7bQRqfdC
 7ylw==
X-Gm-Message-State: AN3rC/4kWeLpnY6JmeSmS3JsRs9Jmb1u4aA7H/scOBUl7VgqW7TLuUs1
 qTFEg5s98PwIy4JpJ3NKiujeLH56HQ==
X-Received: by 10.129.65.74 with SMTP id f10mr3039344ywk.164.1493274034975;
 Wed, 26 Apr 2017 23:20:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 26 Apr 2017 23:20:14 -0700 (PDT)
In-Reply-To: <1493273870.4433.4.camel@aj.id.au>
References: <20170427040214.15096-1-chen.kenyy@inventec.com>
 <1493273870.4433.4.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 15:50:14 +0930
X-Google-Sender-Auth: P-R9Bro_uqd3bUzkeS4kSwin2dc
Message-ID: <CACPK8XegRvaLoO=cn=ot7R4KdROAQfUqVz-CjeHM7DxioY=8iQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v4] ARM: dts: aspeed: Modify Laanyang BMC
 device tree
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Ken Chen <chen.kenyy@inventec.com>,
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
X-List-Received-Date: Thu, 27 Apr 2017 06:20:38 -0000

On Thu, Apr 27, 2017 at 3:47 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-04-27 at 12:02 +0800, Ken Chen wrote:
>> Modify Lanyang dts and add lanyang initial in aspeed.c
>>
>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 13 ++++++-------
>>  arch/arm/mach-aspeed/aspeed.c                | 17 +++++++++++++++++
>>  2 files changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> index 176e4b4..6456458 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> @@ -1,4 +1,4 @@
>> -/dts-v1/;
>> +/dts-v3/;
>>
>
> Was this necessary? What do we get from the change?

This string should be left alone. I will fix that when applying.

>
>>  #include "aspeed-g5.dtsi"
>>  #include <dt-bindings/gpio/aspeed-gpio.h>
>> @@ -302,18 +302,17 @@
>>  };
>>
>>  &gpio {
>> > -   line_apss_reset {
>> > -           gpio-hog;
>> > -           gpios = <ASPEED_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
>> > -           output-high;
>> > -           line-name = "BMC_APSS_RESET_N";
>> > -   };
>> +
>>  };

You can remove this node now that is it empty. I will fix that when applying.

Thanks for the patch! I have applied this to dev-4.7.

Cheers,

Joel

>>
>>  &vuart {
>> >     status = "okay";
>>  };
>>
>> +&gfx {
>> +        status = "okay";
>> +};
>> +
>>  &pinctrl {
>> >     aspeed,external-nodes = <&gfx &lhc>;
>>  };
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index a7b03a0..0717181 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -238,6 +238,21 @@ static void __init do_romulus_setup(void)
>>      writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>>  }
>>
>> +static void __init do_lanyang_setup(void)
>> +{
>> +        unsigned long reg;
>> +
>> +        do_common_setup();
>> +
>> +        /* Disable default behavior of UART1 being held in reset by LPCRST#.
>> +         * By releasing UART1 from being controlled by LPC reset, it becomes
>> +         * immediately available regardless of the host being up.
>> +         */
>> +        reg = readl(AST_IO(AST_BASE_LPC | 0x98));
>> +        /* Clear "Enable UART1 reset source from LPC" */
>> +        writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>> +}
>> +
>> >  #define SCU_PASSWORD       0x1688A8A8
>>
>>  static void __init aspeed_init_early(void)
>> @@ -275,6 +290,8 @@ static void __init aspeed_init_early(void)
>> >             do_witherspoon_setup();
>> >     if (of_machine_is_compatible("ibm,romulus-bmc"))
>> >             do_romulus_setup();
>> +        if (of_machine_is_compatible("inventec,lanyang-bmc"))
>> +                do_lanyang_setup();
>>  }
>>
>>  static void __init aspeed_map_io(void)
