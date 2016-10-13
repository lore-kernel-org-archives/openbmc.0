Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svhtT6TsgzDsyG
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 18:19:13 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 37363F4F3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:13:00 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id B07232A007F;
 Thu, 13 Oct 2016 09:12:54 +0200 (CEST)
Subject: Re: [PATCH u-boot] aspeed/g5: Device Tree for ast2500
To: Joel Stanley <joel@jms.id.au>, Maxim Sloyko <maxims@google.com>
References: <1476117535-48144-1-git-send-email-maxims@google.com>
 <CACPK8Xdief-K9XMX1NkjZEs8v616vbN9yECBjwq_9DqL-2bx_Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5c3a669e-471c-3457-9bae-066e31e9d98d@kaod.org>
Date: Thu, 13 Oct 2016 09:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdief-K9XMX1NkjZEs8v616vbN9yECBjwq_9DqL-2bx_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3745587518472227586
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeefgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 13 Oct 2016 07:19:14 -0000

On 10/13/2016 07:24 AM, Joel Stanley wrote:
> On Tue, Oct 11, 2016 at 3:38 AM,  <maxims@google.com> wrote:
>> From: Maxim Sloyko <maxims@google.com>
>>
>> Device Tree for ast2500, copied from openbmc/linux (include file), plus
>> minimal device tree configuration for ast2500 eval board.
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>> ---
>>  arch/arm/dts/Makefile          |   2 +
>>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
>>  arch/arm/dts/aspeed-g5.dtsi    | 541 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 571 insertions(+)
>>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
> 
> Use the same name as the kernel device tree.
> 
>>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index d1f8e22..09efa0a 100644
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
>>         k2e-evm.dtb \
>>         k2g-evm.dtb
>>
>> +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
>> +
>>  targets += $(dtb-y)
>>
>>  # Add any required device tree compiler flags here
>> diff --git a/arch/arm/dts/aspeed-g5-evb.dts b/arch/arm/dts/aspeed-g5-evb.dts
>> new file mode 100644
>> index 0000000..95dc77a
>> --- /dev/null
>> +++ b/arch/arm/dts/aspeed-g5-evb.dts
> 
> This doesn't include the rest of the devices present in the kernel
> device tree. Is there a reason why you didn't include them?
> 
>> @@ -0,0 +1,28 @@
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +
>> +/ {
>> +       memory {
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x20000000>;
>> +       };
>> +
>> +       aliases {
>> +               i2c1 = &i2c0;
>> +               i2c4 = &i2c3;
>> +               i2c8 = &i2c7;
> 
> Why are you doing this?
> 
>> +       };
>> +};
>> +
>> +&i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c7 {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
>> new file mode 100644
>> index 0000000..eb81a2e
>> --- /dev/null
>> +++ b/arch/arm/dts/aspeed-g5.dtsi
>> @@ -0,0 +1,541 @@
>> +/* The device tree is copied from
>> + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/boot/dts/aspeed-g5.dtsi
> 
> Please update this with the latest from the dev-4.7 tree.

May be we should include the flash controllers first in the kernel,
we will need that in u-boot as well for a spi-nor driver.

These should help :

https://github.com/legoater/linux/commit/d666d4ab769d766d0b47022980ba3893e86762db
https://github.com/legoater/linux/commit/87cc2850ee497226d4a6bb47840109cf2d54d687

I can send on the list for review 

Thanks,

C. 

> 
>> + */
>> +#include "skeleton.dtsi"
>> +
>> +/ {
>> +       model = "Aspeed BMC";
>> +       compatible = "aspeed,ast2500";
>> +       #address-cells = <1>;
>> +       #size-cells = <1>;
>> +       interrupt-parent = <&vic>;
>> +
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               cpu@0 {
>> +                       compatible = "arm,arm1176jzf-s";
>> +                       device_type = "cpu";
>> +                       reg = <0>;
>> +               };
>> +       };
>> +
>> +       ahb {
>> +               compatible = "simple-bus";
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges;
>> +
>> +               vic: interrupt-controller@1e6c0080 {
>> +                       compatible = "aspeed,ast2400-vic";
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       valid-sources = <0xfefff7ff 0x0807ffff>;
>> +                       reg = <0x1e6c0080 0x80>;
>> +               };
>> +
>> +               mac0: ethernet@1e660000 {
>> +                       compatible = "faraday,ftgmac100";
>> +                       reg = <0x1e660000 0x180>;
>> +                       interrupts = <2>;
>> +                       no-hw-checksum;
>> +                       status = "disabled";
>> +               };
>> +
>> +               mac1: ethernet@1e680000 {
>> +                       compatible = "faraday,ftgmac100";
>> +                       reg = <0x1e680000 0x180>;
>> +                       interrupts = <3>;
>> +                       no-hw-checksum;
>> +                       status = "disabled";
>> +               };
>> +
>> +               apb {
>> +                       compatible = "simple-bus";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       ranges;
>> +
>> +                       clk_clkin: clk_clkin@1e6e2070 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-clkin-clock";
>> +                               reg = <0x1e6e2070 0x04>;
>> +                       };
>> +
>> +                       syscon: syscon@1e6e2000 {
>> +                               compatible = "aspeed,g5-scu", "syscon", "simple-mfd";
>> +                               reg = <0x1e6e2000 0x1a8>;
>> +
>> +                               pinctrl: pinctrl@1e6e2000 {
>> +                                       compatible = "aspeed,g5-pinctrl";
>> +
>> +                                       pinctrl_i2c9_default: i2c9_default {
>> +                                               function = "I2C9";
>> +                                               groups = "I2C9";
>> +                                       };
>> +
>> +                                       pinctrl_i2c10_default: i2c10_default {
>> +                                               function = "I2C10";
>> +                                               groups = "I2C10";
>> +                                       };
>> +
>> +                                       pinctrl_i2c11_default: i2c11_default {
>> +                                               function = "I2C11";
>> +                                               groups = "I2C11";
>> +                                       };
>> +
>> +                                       pinctrl_i2c12_default: i2c12_default {
>> +                                               function = "I2C12";
>> +                                               groups = "I2C12";
>> +                                       };
>> +
>> +                                       pinctrl_i2c13_default: i2c13_default {
>> +                                               function = "I2C13";
>> +                                               groups = "I2C13";
>> +                                       };
>> +
>> +                                       pinctrl_gpid0_default: gpid0_default {
>> +                                               function = "GPID0";
>> +                                               groups = "GPID0";
>> +                                       };
>> +
>> +                                       pinctrl_gpid1_default: gpid1_default {
>> +                                               function = "GPID1";
>> +                                               groups = "GPID1";
>> +                                       };
>> +
>> +                                       pinctrl_sd1_default: sd1_default {
>> +                                               function = "SD1";
>> +                                               groups = "SD1";
>> +                                       };
>> +
>> +                                       pinctrl_i2c5_default: i2c5_default {
>> +                                               function = "I2C5";
>> +                                               groups = "I2C5";
>> +                                       };
>> +
>> +                                       pinctrl_i2c6_default: i2c6_default {
>> +                                               function = "I2C6";
>> +                                               groups = "I2C6";
>> +                                       };
>> +
>> +                                       pinctrl_i2c7_default: i2c7_default {
>> +                                               function = "I2C7";
>> +                                               groups = "I2C7";
>> +                                       };
>> +
>> +                                       pinctrl_i2c8_default: i2c8_default {
>> +                                               function = "I2C8";
>> +                                               groups = "I2C8";
>> +                                       };
>> +
>> +                                       pinctrl_pwm0_default: pwm0_default {
>> +                                               function = "PWM0";
>> +                                               groups = "PWM0";
>> +                                       };
>> +
>> +                                       pinctrl_pwm1_default: pwm1_default {
>> +                                               function = "PWM1";
>> +                                               groups = "PWM1";
>> +                                       };
>> +
>> +                                       pinctrl_pwm2_default: pwm2_default {
>> +                                               function = "PWM2";
>> +                                               groups = "PWM2";
>> +                                       };
>> +
>> +                                       pinctrl_pwm3_default: pwm3_default {
>> +                                               function = "PWM3";
>> +                                               groups = "PWM3";
>> +                                       };
>> +
>> +                                       pinctrl_pwm4_default: pwm4_default {
>> +                                               function = "PWM4";
>> +                                               groups = "PWM4";
>> +                                       };
>> +
>> +                                       pinctrl_pwm5_default: pwm5_default {
>> +                                               function = "PWM5";
>> +                                               groups = "PWM5";
>> +                                       };
>> +
>> +                                       pinctrl_pwm6_default: pwm6_default {
>> +                                               function = "PWM6";
>> +                                               groups = "PWM6";
>> +                                       };
>> +
>> +                                       pinctrl_pwm7_default: pwm7_default {
>> +                                               function = "PWM7";
>> +                                               groups = "PWM7";
>> +                                       };
>> +
>> +                                       pinctrl_i2c3_default: i2c3_default {
>> +                                               function = "I2C3";
>> +                                               groups = "I2C3";
>> +                                       };
>> +
>> +                                       pinctrl_i2c4_default: i2c4_default {
>> +                                               function = "I2C4";
>> +                                               groups = "I2C4";
>> +                                       };
>> +
>> +                                       pinctrl_i2c14_default: i2c14_default {
>> +                                               function = "I2C14";
>> +                                               groups = "I2C14";
>> +                                       };
>> +
>> +                                       pinctrl_rgmii1_default: rgmii1_default {
>> +                                               function = "RGMII1";
>> +                                               groups = "RGMII1";
>> +                                       };
>> +
>> +                                       pinctrl_rmii1_default: rmii1_default {
>> +                                               function = "RMII1";
>> +                                               groups = "RMII1";
>> +                                       };
>> +
>> +                                       pinctrl_rgmii2_default: rgmii2_default {
>> +                                               function = "RGMII2";
>> +                                               groups = "RGMII2";
>> +                                       };
>> +
>> +                                       pinctrl_rmii2_default: rmii2_default {
>> +                                               function = "RMII2";
>> +                                               groups = "RMII2";
>> +                                       };
>> +                               };
>> +                       };
>> +
>> +                       clk_hpll: clk_hpll@1e6e2024 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-hpll-clock";
>> +                               reg = <0x1e6e2024 0x4>;
>> +                               clocks = <&clk_clkin>;
>> +                       };
>> +
>> +                       clk_ahb: clk_ahb@1e6e2070 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-ahb-clock";
>> +                               reg = <0x1e6e2070 0x4>;
>> +                               clocks = <&clk_hpll>;
>> +                       };
>> +
>> +                       clk_apb: clk_apb@1e6e2008 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-apb-clock";
>> +                               reg = <0x1e6e2008 0x4>;
>> +                               clocks = <&clk_hpll>;
>> +                       };
>> +
>> +                       clk_uart: clk_uart@1e6e2008 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,uart-clock";
>> +                               reg = <0x1e6e202c 0x4>;
>> +                       };
>> +
>> +                       sram@1e720000 {
>> +                               compatible = "mmio-sram";
>> +                               reg = <0x1e720000 0x9000>;      // 36K
>> +                       };
>> +
>> +                       gpio: gpio@1e780000 {
>> +                               #gpio-cells = <2>;
>> +                               gpio-controller;
>> +                               compatible = "aspeed,ast2500-gpio";
>> +                               reg = <0x1e780000 0x1000>;
>> +                               interrupts = <20>;
>> +                               gpio-ranges = <&pinctrl 0 0 220>;
>> +                       };
>> +
>> +                       timer: timer@1e782000 {
>> +                               compatible = "aspeed,ast2400-timer";
>> +                               reg = <0x1e782000 0x90>;
>> +                               // The moxart_timer driver registers only one
>> +                               // interrupt and assumes it's for timer 1
>> +                               //interrupts = <16 17 18 35 36 37 38 39>;
>> +                               interrupts = <16>;
>> +                               clocks = <&clk_apb>;
>> +                       };
>> +
>> +                       ibt: ibt@1e789140 {
>> +                               compatible = "aspeed,bt-host";
>> +                               reg = <0x1e789140 0x18>;
>> +                               interrupts = <8>;
>> +                       };
>> +
>> +                       wdt1: wdt@1e785000 {
>> +                               compatible = "aspeed,ast2500-wdt";
>> +                               reg = <0x1e785000 0x1c>;
>> +                       };
>> +
>> +                       wdt2: wdt@1e785020 {
>> +                               compatible = "aspeed,ast2500-wdt";
>> +                               reg = <0x1e785020 0x1c>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       wdt3: wdt@1e785040 {
>> +                               compatible = "aspeed,wdt";
>> +                               reg = <0x1e785074 0x1c>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart1: serial@1e783000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e783000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <9>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart2: serial@1e78d000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78d000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <32>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart3: serial@1e78e000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78e000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <33>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart4: serial@1e78f000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78f000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <34>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart5: serial@1e784000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e784000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <10>;
>> +                               clocks = <&clk_uart>;
>> +                               current-speed = <38400>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       vuart: vuart@1e787000 {
>> +                               compatible = "aspeed,vuart";
>> +                               reg = <0x1e787000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <8>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       i2c: i2c@1e78a000 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <1>;
>> +                               #interrupt-cells = <1>;
>> +
>> +                               compatible = "aspeed,ast2400-i2c-controller";
>> +                               reg = <0x1e78a000 0x40>;
>> +                               ranges = <0 0x1e78a000 0x1000>;
>> +                               interrupts = <12>;
>> +                               clocks = <&clk_apb>;
>> +                               clock-ranges;
>> +                               interrupt-controller;
>> +
>> +                               i2c0: i2c-bus@40 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x40 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <0>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <0>;
>> +                                       interrupt-parent = <&i2c>;
>> +                               };
>> +
>> +                               i2c1: i2c-bus@80 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x80 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <1>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <1>;
>> +                               };
>> +
>> +                               i2c2: i2c-bus@c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0xC0 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <2>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <2>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c3_default>;
>> +                               };
>> +
>> +                               i2c3: i2c-bus@100 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x100 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <3>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <3>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c4_default>;
>> +                               };
>> +
>> +                               i2c4: i2c-bus@140 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x140 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <4>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <4>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c5_default>;
>> +                               };
>> +
>> +                               i2c5: i2c-bus@180 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x180 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <5>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <5>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c6_default>;
>> +                               };
>> +
>> +                               i2c6: i2c-bus@1c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x1C0 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <6>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <6>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c7_default>;
>> +                               };
>> +
>> +                               i2c7: i2c-bus@300 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x300 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <7>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <7>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c8_default>;
>> +                               };
>> +
>> +                               i2c8: i2c-bus@340 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x340 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <8>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <8>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c9_default>;
>> +                               };
>> +
>> +                               i2c9: i2c-bus@380 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x380 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <9>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <9>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c10_default>;
>> +                               };
>> +
>> +                               i2c10: i2c-bus@3c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x3c0 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <10>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <10>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c11_default>;
>> +                               };
>> +
>> +                               i2c11: i2c-bus@400 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x400 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <11>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <11>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c12_default>;
>> +                               };
>> +
>> +                               i2c12: i2c-bus@440 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x440 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <12>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <12>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c13_default>;
>> +                               };
>> +
>> +                               i2c13: i2c-bus@480 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x480 0x40>;
>> +                                       compatible = "aspeed,ast2400-i2c-bus";
>> +                                       bus = <13>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <13>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 = <&pinctrl_i2c14_default>;
>> +                               };
>> +
>> +                       };
>> +
>> +               };
>> +       };
>> +};
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
