Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oESkMf/0"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjGwh2M0nzDqBf
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:16:35 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id u6so2158572qtg.13
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=H4HolCElW3FhgZleVntuhiDxG0tnpIvA54ADU8XDzXo=;
 b=oESkMf/0mOFt2Yrqay7ss7nwB3W/MQAiLiM7+ivZwvLgXTlxhFpCYIQAGqeljBf/Yk
 499rOw6A2UH4S0rT9MQ5XQvZh6FXNopfd9wPPia9T/WoQ/0+G9VkAfWfjIrSbKcRF1Tm
 LzziswK9qq58o9nmOCVDRf2bvgbEMLVuZJ9AT6zwVqESVX0/tsNqDv4boqaAjendN/+L
 LSbHIVDwXuctSuyws4jmbhG12iGYhxDXl1Ab9XzU4jW3GDcPBYzfjBmeWbSk6ND2qyX5
 MFNQoK6gYLGoF9n+VAwZpAFy8VdXtiVV8H3/PaQZPkNCETroL3KgaBSHZt2l+yAK6xY8
 5zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=H4HolCElW3FhgZleVntuhiDxG0tnpIvA54ADU8XDzXo=;
 b=oFt5uOE3PiOnE8qcg8PRfOAS34A8WoamaSXViqYX7fNvQwKDZ5hyxh4vIGHmzdkH7W
 7xH1UP4eu06mSBT/A6sAgEhJs0YymnJVOaNppo7HkAWr6cgnnyFMvivGSe94OdWoFaRq
 jr8d6jm4alUlUcwEwfbQGPmaILiXgXSzw6IcKMn18zHaybomGQ6nrQwh589pGhkjwG3j
 GPLCGa5XRJ5yVj7f8o5Sv3B2nguJ5eAB7r0LjPn3yfuulZLXfRzQbzaETLxTMQhqkA+7
 b5rGVPsnpmPOt5lri1+pzxfJP9eWCJhzP4O2BSzYBvCePktnvG1/fEHgvsS453KRXUwB
 jOtA==
X-Gm-Message-State: APf1xPDZpMSSF8ba+xAWlXlVt+gbFVDUVs9s9EyF/U6eeU88N22l1z+V
 mptUqFKCXVVI6uedCHzmH6C69A9Tsn+joQJvdlU=
X-Google-Smtp-Source: AH8x225nRlwmktNpyJ6DHG+Fs6uNUqfWXSi6VwD89H1zNT/vw4HOBD0mAXfQMOKR4PlxhHTjqQJyiAbWVBob52+qSWY=
X-Received: by 10.237.40.34 with SMTP id r31mr7886310qtd.330.1518747393576;
 Thu, 15 Feb 2018 18:16:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Thu, 15 Feb 2018 18:16:13 -0800 (PST)
In-Reply-To: <CACPK8XfqpOFnMekHjOAvw_ge_T_ouaGQdEF9gTmEZYEKLOFbqw@mail.gmail.com>
References: <20180212121047.24831-1-chen.kenyy@inventec.com>
 <CACPK8XfqpOFnMekHjOAvw_ge_T_ouaGQdEF9gTmEZYEKLOFbqw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Feb 2018 12:46:13 +1030
X-Google-Sender-Auth: 1XvfeyVGbdsAV3Tf73GoyvSl7yU
Message-ID: <CACPK8XdTTqmVo0B+yvqAuH0TS1ir+8PZPb-yYnyWh59f1d-u=w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v5] Add ARM system BMC device tree
To: Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 16 Feb 2018 02:16:37 -0000

On Fri, Feb 16, 2018 at 12:40 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Ken,
>
> On Mon, Feb 12, 2018 at 10:40 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
>> Centriq2400-rep is ARM system reference evalutiion platform
>> with ast2520 BMC.
>
> How about:
>
> The Qualcomm Centriq 2400 REP (Reference Evaluation Platform) is
> aarch64 Armv8 server platform with an ast2520 BMC.
>
>
>>
>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>
>> ---
>> v4->v5
>> - Removed strange whitespace
>> - Removed aspeed.c commit
>> - Modify commit content
>>
>> v3->v4
>> - Modify Makefile for centriq2400-rep dts
>> - Fix typo label
>> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
>> - Removed lpc device
>> - Fix coding style
>> - Removed ssif device
>> - Removed max31790 device
>> - Removed register control of GPIO and Watchdog
>> ---
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
>>  2 files changed, 277 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 7c54fc8..77aef19 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>>         aspeed-bmc-mellanox-msn.dtb \
>>         aspeed-bmc-quanta-q71l.dtb \
>>         aspeed-bmc-intel-s2600wf.dtb \
>> +        aspeed-bmc-arm-centriq2400-rep.dtb \
>
> Nit: we keep these in alphabetical order.
>
> I notice that this patch is against the 4.10 branch. Please rebase
> your patch on dev-4.13.
>
>>         aspeed-ast2500-evb.dtb
>>  endif
>>
>
>> +&gpio {
>> +       pin_gpio_c7 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
>> +               output;
>> +               line-name = "BIOS_SPI_MUX_S";
>> +       };
>> +}
>
> Have you built and booted a kernel using this device tree?
>
> I get an error when building:
>
> Error: arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts:276.2-277.1
> syntax error
> FATAL ERROR: Unable to parse input tree
>
> Please fix up the missing semicolon, do a build, and ensure this boots
> on your system.

Please take a look at these warnings too:

  DTC     arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0 has invalid length
(4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1 has invalid length
(4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #address-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
(avoid_default_addr_size): Relying on default #size-cells value for
/ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58

>
> When you send v5 you can add the Acked-by line from Andrew to your
> commit message.
>
> Cheers,
>
> Joel
