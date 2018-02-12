Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zg3qN2MR7zF0jq
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 22:49:19 +1100 (AEDT)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Mon, 12 Feb 2018 19:49:10 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w1CBn3J5082422	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 19:49:03 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])	by IEC1-SPAM-2.inventec.com with ESMTP id w1CBn7TD096663
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 19:49:09 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-lf0-f71.google.com with SMTP id h8so4144854lfe.18 for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 03:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=v2DZbyfP0yEs0djPGggWoANQK2n691RbV0agPcR3chA=;
 b=sEPWYo4G/GqTBafd/UDgB5O8uCtxR8c3dDv8hGe51hGXD2DuaxbFBVjsflclVsOp5V
 t0YeJpyWuVCCV6X/GbF9LkuUV7tWdk/YdokJ227SoSsK7m/S0LLG5/ftsqMZyPp1v77X
 /5wg5cq+mUHeAbpsyAwsF/Oeo+1a9ac/8m84GxZuxrUYZBU1PEshjDrgpkXjKtqw9CUw
 7wLDoj5bGCoeRm9AWr90C1v3+z4DJxs7f+/PIOK8GrWFi4d1rmmpNTWP6ZWSqrDqyrhZ
 UZU20QtvuB2Vyny54dGmWHlQj13wikLezuowOXQ++vMdAXOahuQlmSqGCmotcyi9moxz
 fGXw==
X-Gm-Message-State: APf1xPCKwrBcXJF19QrMa9+XdFs7SJ31NtpeN07CqRkMtNnXInmD0Z0L
 J3UdUolbIqMjrYBDmNl1l6pfUR8G/SyNkSD6l1uaJIZCihpQw6jDLicfWgilldr2EPGRCgreZE+
 t5WP5tCd5G9nxhcbMTHmp1dda8Qt4Cuk5l2CSbQ==
X-Received: by 10.25.0.20 with SMTP id 20mr1474659lfa.69.1518436138942;
 Mon, 12 Feb 2018 03:48:58 -0800 (PST)
X-Google-Smtp-Source: AH8x227B3M+OW3C1G6B9mu74DQWyT8laYzU5EqsTu8WFXZpH8UAFiWYzhZb+ncMWJLkH6Hj9Q9FrYt73PYuMPVsu3lY=
X-Received: by 10.25.0.20 with SMTP id 20mr1474643lfa.69.1518436138542; Mon,
 12 Feb 2018 03:48:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.167.145 with HTTP; Mon, 12 Feb 2018 03:48:57 -0800 (PST)
In-Reply-To: <CACPK8XeyaPq69hY7LFFr+jPXzm5==LpJWDtro9bz6c-F4B-aAA@mail.gmail.com>
References: <20180212025523.5566-1-chen.kenyy@inventec.com>
 <CACPK8XeyaPq69hY7LFFr+jPXzm5==LpJWDtro9bz6c-F4B-aAA@mail.gmail.com>
From: =?UTF-8?B?Q2hlbktlbllZIOmZs+awuOeHnyBUQU8=?= <chen.kenyy@inventec.com>
Date: Mon, 12 Feb 2018 19:48:57 +0800
Message-ID: <CADo_Z42FsdsPP8Qx+wnWAg+gpp_o_tWW4DSqqirfEiJ-UPYh2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v4] ARM: dts: aspeed: Add ARM system BMC
 device tree
To: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w1CBn3J5082422
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
X-List-Received-Date: Mon, 12 Feb 2018 11:49:21 -0000

Hi Joel,

2018-02-12 15:53 GMT+08:00 Joel Stanley <joel@jms.id.au>:
> Hi Ken,
>
> This is looking much better. Just a few small things to tweak before I
> can merge this.
>
> On Mon, Feb 12, 2018 at 1:25 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
>> Add centriq2400-rep dts and modify platform initial
>
> This commit message needs some work.
>
> Take a look at the commit messages from the introduction of other machines:
>
>> commit 8f9bafbb92c0308cf8d33536803c822e14bed4d7
>> Author: Joel Stanley <joel@jms.id.au>
>> Date:   Wed Jan 4 16:31:28 2017
>>
>>    ARM: dts: aspeed: Add Romulus BMC platform
>>
>>    Romulus is an OpenPower machine with an ast2500 BMC. It has NCSI
>>    networking and 512MB of RAM.
>
> or
>
>> commit f88bc8e15f1c1154495107ed378cce271309349d
>> Author: Rick Altherr <raltherr@google.com>
>> Date:   Tue Nov 28 23:11:05 2017
>>
>>    ARM: dts: aspeed: Add Qanta Q71L BMC machine
>>
>>    The Qanta Q71L BMC is an ASPEED ast2400 based BMC that is part of a
>>    Qanta x86 server.
>
>
>>
>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>
>> ---
>> v3->v4
>> - Modify Makefile for centriq2400-rep dts
>> - Fix typo label
>> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
>> - Removed lpc device
>> - Fix coding style
>> - Removed ssif device
>> - Removed max31790 device
>> - Removed register control of GPIO and Watchdog
>
> Great changelog. This is very useful to me as a reviewer.
>
>> ---
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
>>  arch/arm/mach-aspeed/aspeed.c                      |  11 +
>>  3 files changed, 288 insertions(+)
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
>>         aspeed-ast2500-evb.dtb
>>  endif
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>> new file mode 100644
>> index 0000000..6c7784f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>> @@ -0,0 +1,276 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model = "Qualcomm Centriq 2400  REP AST2520";
>
> May I ask, what does REP mean?
>
REP is reference evaluation platform.
>> +       compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200 earlyprintk";
>> +       };
>> +
>> +       memory {
>> +               reg = <0x80000000 0x40000000>;
>> +       };
>> +
>> +       iio-hwmon {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
>> +       };
>> +
>> +       iio-hwmon-battery {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&adc 7>;
>> +       };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               uid_led {
>> +                       label = "UID_LED";
>> +                       gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               ras_error_led {
>> +                       label = "RAS_ERROR_LED";
>> +                       gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               system_fault {
>> +                       label = "System_fault";
>> +                       gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +};
>> +
>> +&fmc {
>> +       status = "okay";
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +                label = "bmc";
>
> Still some strange whitespace here. Make sure your editor is using tabs.
>
>> +#include "openbmc-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +&spi1 {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_spi1_default>;
>> +       flash@0 {
>> +               status = "okay";
>> +       };
>> +};
>> +
>> +&spi2 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>;
>
> Andrew, can you please review the pinctrl bits?
>
>> +};
>> +
>> +&uart3 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
>> +       current-speed = <115200>;
>> +};
>> +
>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 5965bbf..8fce9bc 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>
> We do not have an aspeed.c in the dev-4.13 branch.
>
> I do not plan on merging one, as at this stage all of the
> functionality that was present in aspeed.c can be performed in other
> drivers. I suggest submitting the device tree without any change to
> aspeed.c.
>
OK, I will remove this.
> To review what the changes are:
>
>> static void __init do_common_setup(void)
>> {
>>        /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
>>        writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
>
> This is now done in drivers/misc/aspeed-lpc-ctrl.c
>
>>        /* Set UART routing */
>>        writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
>
> This is the default, so we do not need have this line.
>
>>
>>        /* Setup scratch registers */
>>        writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
>>        writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
>
> These are specific to the operation of Hostboot on OpenPower
> platforms. I suspect you do not require these lines.
>
> Cheers,
>
> Joel
>
>
>
>> @@ -232,6 +232,15 @@ static void __init do_mellanox_setup(void)
>>         writel(reg, AST_IO(AST_BASE_SCU | 0x48));
>>  }
>>
>> +
>> +static void __init do_centriq2400rep_setup(void)
>> +{
>> +       u32 reg;
>> +
>> +       do_common_setup();
>> +}
>> +
>> +
>>  #define SCU_PASSWORD   0x1688A8A8
>>
>>  static void __init aspeed_init_early(void)
>> @@ -284,6 +293,8 @@ static void __init aspeed_init_early(void)
>>                 do_lanyang_setup();
>>         if (of_machine_is_compatible("mellanox,msn-bmc"))
>>                 do_mellanox_setup();
>> +        if (of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
>> +                do_centriq2400rep_setup();
>>  }
>>
>>  static void __init aspeed_map_io(void)
>> --
>> 2.9.3
>>
