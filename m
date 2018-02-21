Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmRg50bbWzF0qL
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 17:00:46 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Wed, 21 Feb 2018 14:00:39 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w1L60Sol013778	for
 <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:00:28 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])	by IEC1-SPAM-2.inventec.com with ESMTP id w1L60WQ9004532
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:00:35 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-lf0-f71.google.com with SMTP id y66so184810lfc.16 for
 <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 22:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TuvfZd09BDXAIyhGfoie45ykzxLjFj6+9PdQuuYwBcg=;
 b=b5SepZH6BKH/M6oW+d7ryHvgMvqBUz3T62fxf+Qi7iiE4frpzThcg++Xbytl0/Nbtq
 eOZhMTc2F84PTmqHyoK/XjOFX/8Zf8fXXPkR1e4WLsi841RLGgS/+zwDAiewTvleVG8q
 kh+k1hflXd/a0siQG9gFLw62D1w6vOgGHzowgovy8xUAingUiilOUuP/6s5w8GtgzhEM
 P1WUbEKaoOZszYDG8x0QARE6HlfR5to2J3ttuAEEZPO9zLwFBTFDjhSNIsTuGYgjSBJC
 iOsp5WghlbNbb9kWXxcpKKaknZygUU2usx6YupHZ+W534GO6NPE16Uip3nIrEiIFyhTL
 315A==
X-Gm-Message-State: APf1xPDNR3VxjkxyJMhbS6hB2YUOfFlLPDWb+phGxQlZpMMWenc+ajLO
 kfkJka2TLErOMrxc4P7Q4bDRsBxX0urSRiaiLrXh3ddhoqwQYrpRdZik0iW/cQCbH7IDCAtXzrO
 u8n4vQB8xddwVKKcBZHzUIRkHBbO5buAwBvzSnQ==
X-Received: by 10.46.86.201 with SMTP id k70mr1383925lje.16.1519192816651;
 Tue, 20 Feb 2018 22:00:16 -0800 (PST)
X-Google-Smtp-Source: AH8x225wzwhFHVe0kIIkeMFBTDkEXMpvSyDx6NCKs2/DN/ii+XrLfAS31b/vk3zkrgMOZP6juZIiwpHnudf2y+rrqfs=
X-Received: by 10.46.86.201 with SMTP id k70mr1383915lje.16.1519192816321;
 Tue, 20 Feb 2018 22:00:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.167.145 with HTTP; Tue, 20 Feb 2018 22:00:15 -0800 (PST)
In-Reply-To: <CACPK8XdTTqmVo0B+yvqAuH0TS1ir+8PZPb-yYnyWh59f1d-u=w@mail.gmail.com>
References: <20180212121047.24831-1-chen.kenyy@inventec.com>
 <CACPK8XfqpOFnMekHjOAvw_ge_T_ouaGQdEF9gTmEZYEKLOFbqw@mail.gmail.com>
 <CACPK8XdTTqmVo0B+yvqAuH0TS1ir+8PZPb-yYnyWh59f1d-u=w@mail.gmail.com>
From: =?UTF-8?B?Q2hlbktlbllZIOmZs+awuOeHnyBUQU8=?= <chen.kenyy@inventec.com>
Date: Wed, 21 Feb 2018 14:00:15 +0800
Message-ID: <CADo_Z42omtCYK0zKp-F9K0GdwRhdDtyVqZy14ifXpHt_1U1jvQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v5] Add ARM system BMC device tree
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w1L60Sol013778
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
X-List-Received-Date: Wed, 21 Feb 2018 06:00:51 -0000

Hi Joel,

2018-02-16 10:16 GMT+08:00 Joel Stanley <joel@jms.id.au>:
> On Fri, Feb 16, 2018 at 12:40 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Ken,
>>
>> On Mon, Feb 12, 2018 at 10:40 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
>>> Centriq2400-rep is ARM system reference evalutiion platform
>>> with ast2520 BMC.
>>
>> How about:
>>
>> The Qualcomm Centriq 2400 REP (Reference Evaluation Platform) is
>> aarch64 Armv8 server platform with an ast2520 BMC.
>>
OK!
>>
>>>
>>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>>
>>> ---
>>> v4->v5
>>> - Removed strange whitespace
>>> - Removed aspeed.c commit
>>> - Modify commit content
>>>
>>> v3->v4
>>> - Modify Makefile for centriq2400-rep dts
>>> - Fix typo label
>>> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
>>> - Removed lpc device
>>> - Fix coding style
>>> - Removed ssif device
>>> - Removed max31790 device
>>> - Removed register control of GPIO and Watchdog
>>> ---
>>>  arch/arm/boot/dts/Makefile                         |   1 +
>>>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
>>>  2 files changed, 277 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 7c54fc8..77aef19 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>>>         aspeed-bmc-mellanox-msn.dtb \
>>>         aspeed-bmc-quanta-q71l.dtb \
>>>         aspeed-bmc-intel-s2600wf.dtb \
>>> +        aspeed-bmc-arm-centriq2400-rep.dtb \
>>
>> Nit: we keep these in alphabetical order.
>>
>> I notice that this patch is against the 4.10 branch. Please rebase
>> your patch on dev-4.13.
OK
>>
>>>         aspeed-ast2500-evb.dtb
>>>  endif
>>>
>>
>>> +&gpio {
>>> +       pin_gpio_c7 {
>>> +               gpio-hog;
>>> +               gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
>>> +               output;
>>> +               line-name = "BIOS_SPI_MUX_S";
>>> +       };
>>> +}

here miss a ";".
I will fix it.
>>
>> Have you built and booted a kernel using this device tree?
>>
>> I get an error when building:
>>
>> Error: arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts:276.2-277.1
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>>
>> Please fix up the missing semicolon, do a build, and ensure this boots
>> on your system.
>
> Please take a look at these warnings too:
>
>   DTC     arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0 has invalid length
> (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1 has invalid length
> (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58 has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@0
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@0/pca9546@77/i2c@2
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@40/pca9542@70/i2c@1/pca9546@77/i2c@2
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/tmp421@1d
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/adm1278@12
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/eeprom@50
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #address-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning
> (avoid_default_addr_size): Relying on default #size-cells value for
> /ahb/apb/i2c@1e78a000/i2c-bus@340/pca9641@70/i2c-arb/ds1100@58
>
I will remove the device and update the pca9641 drvier in future.
>>
>> When you send v5 you can add the Acked-by line from Andrew to your
>> commit message.
Got it
>>
>> Cheers,
>>
>> Joel
