Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BzgFaWFC"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Yhjp4W0ZzDqKg
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 08:12:13 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id z126so7608461itd.5
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 14:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htFfGQpKZU3q0oH7lj/81kQ8FOxvLSmmUIS4XElYsj4=;
 b=BzgFaWFCNzhRbTt3v0o13xt9pYn/QD2d0XGqJ72cfXZxDvyKQ/1RtH7yFFK6/HwHrp
 sLyn4/nhWZcuTv7Dq9dRBX0A+rnhzz2FoTwoFUXGRu38TvH8R3UIyQPnNTDVkpmuDduk
 OKc318ZMupVKun/Udszd6qH5jpA3jeVea9mb4T9uBC2eYNgyiwYdsFQ4rqXohli5W+tn
 CLAQU3iIoixSsezbZhV+VxESfx6ySccyK2yaCV1GSyAdMb+VZcCI1pL5WfK1QlUnpuOi
 hr2w/1Ll9IqKfP4AaWtSCgu7Y6NdmHbgTP4Y8gU5UponBmDGPS8kDU/k6z20pjro+BaE
 DIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htFfGQpKZU3q0oH7lj/81kQ8FOxvLSmmUIS4XElYsj4=;
 b=SG44CJaZe9QezBT668klwixwbklyiV0F7UJ+6I8CbNYupQbFTSpL1b8C9YYWCSUV1H
 5WZNBBhe9311TEKNJQ6FkxITIZgQsBZmcggOjr5ZMVGOc7me8zWTSSmFb+XJROvtkvxx
 OsU4vn2khNeG2bllrMAKDFeYK4BdXtw4rth652Bcg3d4yEtoy0vRYECdY/n0jX9976z7
 E0r5xNU+jdVntm1VbBB0rRk2VXvgO8LByoH17wL+wGW/AIV8fx69FQCDhAEkFFJ0zefD
 hm5hBPx7GmBaen9gGsBh0Jra07evf8gU4hVOiwhbw3BKeNHXR/Ubekk6cN9WxlNPx0ip
 XLPw==
X-Gm-Message-State: APjAAAWBqpu8l/qdTA6F8txVEu/3Z+dYSeWDcZ0yiSPZGQHxpBK1niJM
 D4VI8cpFOTjAWVORY/0G6GLDNt2xjW+0L7a9UR+PBw==
X-Google-Smtp-Source: APXvYqwO/LBbQzi0fnWulkooEoG4w4XK2TbQ6Z33R5uBonMoxhaTYShSff/zM7gJSHAwZtDVSGV1rVWpjHBILT7ca1U=
X-Received: by 2002:a24:e008:: with SMTP id c8mr5645436ith.93.1554239529727;
 Tue, 02 Apr 2019 14:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190328150548.3279-1-fran.hsu@quantatw.com>
 <20190328150548.3279-3-fran.hsu@quantatw.com>
In-Reply-To: <20190328150548.3279-3-fran.hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 2 Apr 2019 14:11:33 -0700
Message-ID: <CADKL2t5LKK8bErN4McB+f2d+wNukLNgsRrAMOYAeA8YGbtRgrQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v1 3/3] ARM: dts: nuvoton: Add Quanta GSJ BMC
 machine.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 21:12:15 -0000

On Thu, Mar 28, 2019 at 8:06 AM <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add device tree for quanta-gsj BMC module.
> Tested: Build Quanta GSJ image and load on the GSJ BMC module.
> Ensure that BMC boots to console successful.
>
> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 590 ++++++++++++++++++++++
>  1 file changed, 590 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> new file mode 100644
> index 000000000000..75cb099be38b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -0,0 +1,590 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-gsj-gpio.dtsi"
> +/ {
> +       model = "Quanta GSJ Board (Device Tree v8)";
> +       compatible = "nuvoton,npcm750";
> +
> +       aliases {
> +               ethernet0 = &emc0;
> +               ethernet1 = &gmac0;
> +               serial0 = &serial0;
> +               udc9 = &udc9;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +               i2c14 = &i2c14;
> +               i2c15 = &i2c15;
> +               fiu0 = &fiu0;
> +       };
> +
> +       chosen {
> +               stdout-path = &serial0;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       ahb {
> +               gmac0: eth@f0802000 {
> +                       phy-mode = "rgmii-id";
> +                       status = "okay";
> +               };
> +
> +               mc: memory-controller@f0824000 {
> +                       compatible = "nuvoton,npcm7xx-sdram-edac";
> +                       reg = <0xf0824000 0x1000>;
> +                       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               emc0: eth@f0825000 {
> +                       phy-mode = "rmii";
> +                       use-ncsi;
> +                       status = "okay";
> +               };
> +
> +               ehci1: usb@f0806000 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: ohci@f0807000 {
> +                       status = "okay";
> +               };
> +
> +               udc9:udc@f0839000 {
> +                       status = "okay";
> +               };
> +
> +               aes:aes@f0858000 {
> +                       status = "okay";
> +               };
> +
> +               sha:sha@f085a000 {
> +                       status = "okay";
> +               };
> +
> +               fiu0: fiu@fb000000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi0cs1_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-rx-bus-width = <2>;

Please include a property on the spi-nor node:

label = "bmc";

This makes it so the first MTD partition will encompass the full flash chip
allowing us to use "flashcp" to update the firmware.

> +                               partitions@80000000 {

Could you split the partition table into a separate dtsi file similar to
openbmc-flash-layout.dtsi? This would make it easier to adjust the flash layout
in downstream systems if necessary.

> +                                               compatible = "fixed-partitions";
> +                                               #address-cells = <1>;
> +                                               #size-cells = <1>;
> +                                               u-boot@0 {
> +                                                       label = "u-boot";
> +                                                       reg = <0x0000000 0x80000>;
> +                                                       read-only;
> +                                               };
> +                                               u-boot-env@100000{
> +                                                       label = "u-boot-env";
> +                                                       reg = <0x00100000 0x40000>;
> +                                               };
> +                                               kernel@200000 {
> +                                                       label = "kernel";
> +                                                       reg = <0x0200000 0x600000>;
> +                                               };
> +                                               rofs@800000 {
> +                                                       label = "rofs";
> +                                                       reg = <0x800000 0x1400000>;
> +                                               };
> +                                               rwfs@1c00000 {
> +                                                       label = "rwfs";
> +                                                       reg = <0x1c00000 0x300000>;
> +                                               };
> +                                               haven-update@1f00000 {
> +                                                       label = "haven-update";
> +                                                       reg = <0x1f00000 0x100000>;
> +                                               };
> +                               };
> +                       };
> +               };
> +
> +               pcimbox: pcimbox@f0848000 {
> +                       status = "okay";
> +               };
> +
> +               apb {
> +
> +                       watchdog1: watchdog@901C {
> +                               status = "okay";
> +                       };
> +
> +                       rng: rng@b000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               status = "okay";
> +                       };
> +
> +                       adc: adc@c000 {
> +                               status = "okay";
> +                       };
> +                       otp:otp@189000 {
> +                               status = "okay";
> +                       };
> +
> +                       i2c0: i2c@80000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c1: i2c@81000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c2: i2c@82000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c3: i2c@83000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c4: i2c@84000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +                       i2c5: i2c@85000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +                       i2c6: i2c@86000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c7: i2c@87000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c8: i2c@88000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c9: i2c@89000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c10: i2c@8a000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c11: i2c@8b000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               /* P12V Quarter Brick DC/DC Power Module Q54SH12050 @60 */
> +                               power-brick@36 {
> +                                       compatible = "delta,dps800";
> +                                       reg = <0x36>;
> +                               };
> +
> +                               hotswap@15 {
> +                                       compatible = "ti,lm5066i";
> +                                       reg = <0x15>;
> +                               };
> +                       };
> +
> +                       i2c12: i2c@8c000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c13: i2c@8d000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               ipmb@10 {
> +                                       compatible = "slave-mqueue";
> +                                       reg = <0x10>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c14: i2c@8e000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               ipmb@12 {
> +                                       compatible = "slave-mqueue";
> +                                       reg = <0x12>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c15: i2c@8f000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               i2c-switch@75 {
> +                                       compatible = "nxp,pca9548";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x75>;
> +                                       i2c-mux-idle-disconnect;
> +
> +                                       i2c_u20: i2c@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +                                       };
> +
> +                                       i2c_u21: i2c@1 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <1>;
> +                                       };
> +
> +                                       i2c_u22: i2c@2 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <2>;
> +                                       };
> +
> +                                       i2c_u23: i2c@3 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <3>;
> +                                       };
> +
> +                                       i2c_u24: i2c@4 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <4>;
> +                                       };
> +
> +                                       i2c_u25: i2c@5 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <5>;
> +                                       };
> +
> +                                       i2c_u26: i2c@6 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <6>;
> +                                       };
> +
> +                                       i2c_u27: i2c@7 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <7>;
> +                                       };
> +                               };
> +                       };
> +
> +                       pwm_fan:pwm-fan-controller@103000 {
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
> +                                               &fanin0_pins &fanin1_pins
> +                                               &fanin2_pins &fanin3_pins
> +                                               &fanin4_pins &fanin5_pins>;
> +                               status = "okay";
> +                               fan@0 {
> +                                       reg = <0x00>;
> +                                       fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +                                       cooling-levels = <127 255>;
> +                               };
> +                               fan@1 {
> +                                       reg = <0x01>;
> +                                       fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@2 {
> +                                       reg = <0x02>;
> +                                       fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                       };
> +
> +               };
> +       };
> +
> +       pinctrl: pinctrl@f0800000 {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <
> +                               /* GPI pins*/
> +                               &gpio8_pins
> +                               &gpio9_pins
> +                               &gpio12_pins
> +                               &gpio13_pins
> +                               &gpio14_pins
> +                               &gpio60_pins
> +                               &gpio83_pins
> +                               &gpio91_pins
> +                               &gpio92_pins
> +                               &gpio95_pins
> +                               &gpio136_pins
> +                               &gpio137_pins
> +                               &gpio141_pins
> +                               &gpio144_pins
> +                               &gpio145_pins
> +                               &gpio146_pins
> +                               &gpio147_pins
> +                               &gpio148_pins
> +                               &gpio149_pins
> +                               &gpio150_pins
> +                               &gpio151_pins
> +                               &gpio152_pins
> +                               &gpio153_pins
> +                               &gpio154_pins
> +                               &gpio155_pins
> +                               &gpio156_pins
> +                               &gpio157_pins
> +                               &gpio158_pins
> +                               &gpio159_pins
> +                               &gpio161_pins
> +                               &gpio162_pins
> +                               &gpio163_pins
> +                               &gpio164_pins
> +                               &gpio165_pins
> +                               &gpio166_pins
> +                               &gpio167_pins
> +                               &gpio168_pins
> +                               &gpio169_pins
> +                               &gpio170_pins
> +                               &gpio177_pins
> +                               &gpio191_pins
> +                               &gpio192_pins
> +                               &gpio203_pins
> +                               /* GPO pins*/
> +                               &gpio0pp_pins
> +                               &gpio1pp_pins
> +                               &gpio2pp_pins
> +                               &gpio3pp_pins
> +                               &gpio4pp_pins
> +                               &gpio5pp_pins
> +                               &gpio6pp_pins
> +                               &gpio7pp_pins
> +                               &gpio10pp_pins
> +                               &gpio11pp_pins
> +                               &gpio15od_pins
> +                               &gpio17pp_pins
> +                               &gpio18pp_pins
> +                               &gpio19pp_pins
> +                               &gpio24pp_pins
> +                               &gpio25pp_pins
> +                               &gpio37od_pins
> +                               &gpio59pp_pins
> +                               &gpio72od_pins
> +                               &gpio73od_pins
> +                               &gpio74od_pins
> +                               &gpio75od_pins
> +                               &gpio76od_pins
> +                               &gpio77od_pins
> +                               &gpio78od_pins
> +                               &gpio79od_pins
> +                               &gpio84pp_pins
> +                               &gpio85pp_pins
> +                               &gpio86pp_pins
> +                               &gpio87pp_pins
> +                               &gpio88pp_pins
> +                               &gpio89pp_pins
> +                               &gpio90pp_pins
> +                               &gpio93pp_pins
> +                               &gpio94pp_pins
> +                               &gpio125pp_pins
> +                               &gpio126od_pins
> +                               &gpio127od_pins
> +                               &gpio142od_pins
> +                               &gpio143ol_pins
> +                               &gpio175od_pins
> +                               &gpio176od_pins
> +                               &gpio190od_pins
> +                               &gpio194pp_pins
> +                               &gpio195od_pins
> +                               &gpio196od_pins
> +                               &gpio197od_pins
> +                               &gpio198od_pins
> +                               &gpio199od_pins
> +                               &gpio200pp_pins
> +                               &gpio202od_pins
> +                               >;
> +       };
> +
> +
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-bmc-live {
> +                       gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +
> +               LED_U2_0_LOCATE {
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_LOCATE {
> +                       gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_LOCATE {
> +                       gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_LOCATE {
> +                       gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_LOCATE {
> +                       gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_LOCATE {
> +                       gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_BMC_TRAY_PWRGD {
> +                       gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_FAULT {
> +                       gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_LOCATE {
> +                       gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_LOCATE {
> +                       gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_0_FAULT {
> +                       gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_FAULT {
> +                       gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_FAULT {
> +                       gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_FAULT {
> +                       gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_FAULT {
> +                       gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_FAULT {
> +                       gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_FAULT {
> +                       gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +       };
> +};
> --
> 2.21.0
>
