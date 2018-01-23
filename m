Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQWYY3x6KzDqxK
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 12:53:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.31])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1DDB26E229;
 Mon, 22 Jan 2018 20:53:44 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system BMC
 device tree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <39E6480C5A587146BAA4D885C7BCF7EEC6AD4D07@IET-EX2010-MX2.iec.inventec>
Date: Mon, 22 Jan 2018 20:53:43 -0500
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "Tsung-Han Yang (Harold)" <haroldy@qti.qualcomm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C03C998-DA3A-4B3B-B19C-483AAB871441@fuzziesquirrel.com>
References: <20180108030013.20873-1-chen.kenyy@inventec.com>
 <CACPK8XeHFZrCJuFb33i3+xvCvfTLNEXbKcW11eFLjRtm8V5LXQ@mail.gmail.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6AD4D07@IET-EX2010-MX2.iec.inventec>
To: =?utf-8?B?IkNoZW4uS2VuWVkg6Zmz5rC454efIFRBTyI=?= <Chen.KenYY@inventec.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 01:53:54 -0000


> On Jan 22, 2018, at 1:02 AM, Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F =
TAO <Chen.KenYY@inventec.com> wrote:
>=20
> Hi Joel,
>=20
> Thanks you.=20
> Before I update new patch, I have some question.
> Should I remove the definition which the driver didn't update now?
> The related driver added or modified will be update in future.
>=20
> The watchdog is check for BMC and avoid BMC boot error, if we didn't =
stop this, BMC chip will boot second BMC SPI ROM.
> Does the driver support this? Could you give me an example or advice?
>=20
> The multi-function is enable SPI. It might modify driver.
>=20
> What is the mean of "Can you use a GPIO hog instead?" ?
>=20
> Hi Mohit and Harold,
>=20
> Do you have any advice for the company name?

In the Qualcomm layer it is called centriq2400-rep.

>=20
> Thanks.
> Ken
>=20
> -----Original Message-----
> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of =
Joel Stanley
> Sent: Wednesday, January 17, 2018 8:18 AM
> To: Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO; Brad Bishop; Andrew =
Jeffery
> Cc: OpenBMC Maillist
> Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system =
BMC device tree
>=20
> Hello Ken,
>=20
> Thanks for the patch. Some comments are below. Feel free to ask =
questions if you need more information.
>=20
> On Sun, Jan 7, 2018 at 9:00 PM, Ken Chen <chen.kenyy@inventec.com> =
wrote:
>> Add 2400-rep dts and modify platform initial in aspeed.c
>=20
> What is 2400-rep stand for?
>=20
> I can see it being confused with the ast2400. Do you have other =
suggestions for names for this machine?
>=20
>>=20
>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>> ---
>> arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts | 440 =
++++++++++++++++++++++++++
>> arch/arm/mach-aspeed/aspeed.c                 |  22 ++
>> 2 files changed, 462 insertions(+)
>> create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts=20
>> b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
>> new file mode 100644
>> index 0000000..cf389f5
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
>> @@ -0,0 +1,440 @@
>=20
> Add copyright information to the first line. Something like this:
>=20
> // SPDX-License-Identifier: GPL-2.0
> // Copyright 2018 My Company, Inc
>=20
> eg:
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/tree/arch/=
arm/boot/dts/aspeed-bmc-opp-palmetto.dts?h=3Dfor-next
>=20
>=20
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model =3D "Qualcomm Centriq 2400  REP AST2520";
>> +       compatible =3D "qualcomm,centriq2400-rep-bmc", =
"aspeed,ast2500";
>> +
>> +       chosen {
>> +               stdout-path =3D &uart5;
>> +               bootargs =3D "console=3DttyS4,115200 earlyprintk";
>> +       };
>> +
>> +       memory {
>> +               reg =3D <0x80000000 0x40000000>;
>> +       };
>> +
>> +       reserved-memory {
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <1>;
>> +               ranges;
>> +
>> +               flash_memory: region@98000000 {
>> +                       no-map;
>> +                       reg =3D <0x98000000 0x04000000>; /* 64M */
>=20
> We use this for an OpenPower specific feature that allows faster =
loading of the host firmware. Are you planning on doing the same with =
ARM?
>=20
>> +               };
>> +       };
>> +
>> +       iio-hwmon {
>> +               compatible =3D "iio-hwmon";
>> +               io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc =
3>,
>> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
>> +       };
>> +
>> +       iio-hwmon-battery {
>> +               compatible =3D "iio-hwmon";
>> +               io-channels =3D <&adc 7>;
>> +       };
>> +
>> +       leds {
>> +               compatible =3D "gpio-leds";
>> +
>> +               UID_LED {
>=20
> lowercase for the node please:
>=20
> uid_led {
> }
>=20
>> +                       label =3D "UID_LED";
>=20
> I think we have a naming convention for openbmc led labels. Brad, can =
you help out here?

There isn=E2=80=99t one, beyond standard DT naming conventions.  We are =
free to call
them whatever we want as far as userspace is concerned.

There is retain-state-shutdown and default-state that may be desirable =
to use
here.

>=20
>> +                       gpios =3D <&gpio ASPEED_GPIO(Q, 5) =
GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               RAS_ERROR_LED {
>> +                       label =3D "RAS_ERROR_LED";
>> +                       gpios =3D <&gpio ASPEED_GPIO(F, 6) =
GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               System_Fault {
>> +                       label =3D "System_fault";
>> +                       gpios =3D <&gpio ASPEED_GPIO(A, 1) =
GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +};
>> +
>> +&fmc {
>> +       status =3D "okay";
>> +       flash@0 {
>> +               status =3D "okay";
>> +               m25p,fast-read;
>=20
> add:
>=20
>                label =3D "bmc";
>=20
>> +#include "openbmc-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +&spi1 {
>> +        reg =3D <0x1e630000 0xc4 0x30000000 0x08000000>;
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        compatible =3D "aspeed,ast2500-spi";
>> +        status =3D "okay";
>> +        clocks =3D <&clk_ahb>;
>> +        clock-names =3D "ahb";
>> +        flash@0 {
>> +                reg =3D < 0 >; /* chip select number */
>> +                compatible =3D "jedec,spi-nor";
>> +                status =3D "okay";
>> +        };
>=20
> This is all defined in the aspeed-g5.dtsi. You just need this to =
enable the controller and the first chip select:
>=20
> &spi1 {
>     status =3D "okay";
>     flash@0 {
>               status =3D "okay";
>               m25p,fast-read;
>               label =3D "pnor";
>     };
> };
>=20
>> +};
>> +
>> +&spi2 {
>> +        compatible =3D "aspeed,ast2500-spi-generic";
>> +        reg =3D <0x1e631000 0xc4 0x38000000 0x02000000>;
>> +        interrupts =3D <59>;
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        status =3D "okay";
>> +        spi2@0 {
>> +                reg =3D < 0 >;
>> +                compatible =3D "centriq,centriq2400-spi-hwmon";
>=20
> That's kind of strange. I assume you have a driver for this?
>=20
> Either way, the device tree is incorrect.
>=20
>> +                spi-max-frequency =3D <16000000>;
>> +                status =3D "okay";
>> +        };
>> +};
>> +
>> +&uart3 {
>> +        status =3D "okay";
>> +
>> +        pinctrl-names =3D "default";
>> +        pinctrl-0 =3D <&pinctrl_txd3_default
>> +                     &pinctrl_rxd3_default>;
>> +        current-speed =3D <115200>;
>> +};
>> +
>> +&lpc_ctrl {
>> +       status =3D "okay";
>> +       memory-region =3D <&flash_memory>;
>> +       flash =3D <&spi1>;
>> +};
>> +
>> +&uart5 {
>> +       status =3D "okay";
>> +};
>> +
>> +&mac0 {
>> +       status =3D "okay";
>> +
>> +       pinctrl-names =3D "default";
>> +       pinctrl-0 =3D <&pinctrl_rgmii1_default =
&pinctrl_mdio1_default>;=20
>> +};
>> +
>> +&i2c0 {
>> +       status =3D "okay";
>> +
>> +       pca9542@70 {
>> +                compatible =3D "pca9542";
>> +                reg =3D <0x70>;
>> +               i2c@0 {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +                       reg =3D <0>;
>> +                       pca9546@77 {
>> +                               compatible =3D "pca9546";
>> +                               reg =3D <0x77>;
>> +                               i2c@0 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <0>;
>> +                                       eeprom@52 {
>> +                                               compatible =3D =
"atmel,24c02";
>> +                                               reg =3D <0x52>;
>> +                                       };
>> +                               };
>> +                               i2c@2 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <2>;
>> +                                       eeprom@57 {
>> +                                               compatible =3D =
"atmel,24c02";
>> +                                               reg =3D <0x57>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +               i2c@1 {
>> +
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +                       reg =3D <1>;
>> +                       pca9546@77 {
>> +                               compatible =3D "pca9546";
>> +                               reg =3D <0x77>;
>> +                               i2c@2 {
>> +                                       #address-cells =3D <1>;
>> +                                       #size-cells =3D <0>;
>> +                                       reg =3D <2>;
>> +                                       eeprom@57 {
>> +                                               compatible =3D =
"atmel,24c02";
>> +                                               reg =3D <0x57>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +
>> +        };
>> +};
>> +
>> +&i2c1 {
>> +       status =3D "okay";
>> +
>> +        tmp421@1e {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x1e>;
>> +        };
>> +        tmp421@2a {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x2a>;
>> +        };
>> +        tmp421@4e {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x4e>;
>> +        };
>> +        tmp421@1c {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x1c>;
>> +        };
>> +};
>> +
>> +&i2c2 {
>> +       status =3D "okay";
>> +       ssif {
>> +                compatible =3D "ssif-smbus-slave";
>=20
> There are no bindings that use this string. Do you have a driver for =
this?
>=20
>> +                reg =3D <0x42>;
>> +        };
>> +
>> +};
>> +
>> +&i2c3 {
>> +       status =3D "okay";
>> +};
>> +
>> +&i2c4 {
>> +       status =3D "okay";
>> +};
>> +
>> +&i2c5 {
>> +       status =3D "okay";
>> +
>> +        ir38163@42 {
>> +                compatible =3D "ir38163";
>=20
> There are no bindings that use this string. Do you have a driver for =
this?
>=20
>> +                reg =3D <0x42>;
>> +        };
>> +       ir38163@44 {
>> +                compatible =3D "ir38163";
>> +                reg =3D <0x44>;
>> +        };
>> +       ir38163@46 {
>> +                compatible =3D "ir38163";
>> +                reg =3D <0x46>;
>> +        };
>> +       ir38163@48 {
>> +                compatible =3D "ir38163";
>> +                reg =3D <0x48>;
>> +        };
>> +       pxm1310@02 {
>> +                compatible =3D "pxm1310";
>=20
> Again, there are no bindings that use this string. Do you have a =
driver for this?
>=20
>> +                reg =3D <0x02>;
>> +        };
>> +       pxm1310@04 {
>> +                compatible =3D "pxm1310";
>> +                reg =3D <0x04>;
>> +        };
>> +};
>> +
>> +&i2c6 {
>> +       status =3D "okay";
>> +
>> +       tmp421@1d {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x1d>;
>> +        };
>> +        tmp421@1f {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x1f>;
>> +        };
>> +        tmp421@4d {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x4d>;
>> +        };
>> +        tmp421@4f {
>> +                compatible =3D "ti,tmp421";
>> +                reg =3D <0x4f>;
>> +        };
>> +
>> +        nvt210@4c {
>> +                compatible =3D "nvt210";
>> +                reg =3D <0x4c>;
>> +        };
>> +
>> +       eeprom@50 {
>> +                compatible =3D "atmel,24c128";
>> +                reg =3D <0x50>;
>> +               pagesize =3D <128>;
>=20
> Whitespace is bad here.
>=20
>> +        };
>> +};
>> +
>> +&i2c7 {
>> +       status =3D "okay";
>> +
>> +        adm1278@10 {
>> +                compatible =3D "adi,adm1278";
>> +                reg =3D <0x10>;
>> +               Rsense =3D <250>;
>> +        };
>> +        adm1278@11 {
>> +                compatible =3D "adi,adm1278";
>> +                reg =3D <0x11>;
>> +               Rsense =3D <250>;
>=20
> This looks wrong. Is this a custom modification to the driver to =
support this property?
>=20
>> +        };
>> +};
>> +
>> +&i2c8 {
>> +       status =3D "okay";
>> +
>> +       pca9641@70 {
>> +               compatible =3D "nxp,pca9641";
>> +               reg =3D <0x70>;
>> +                #address-cells =3D <1>;
>> +                #size-cells =3D <0>;
>> +                i2c-arb{
>> +                        tmp421@1d {
>> +                                compatible =3D "tmp421";
>> +                                reg =3D <0x1d>;
>> +                        };
>> +                       adm1278@12 {
>> +                               compatible =3D "adi,adm1278";
>> +                               reg =3D <0x12>;
>> +                               Rsense =3D <500>;
>> +                       };
>> +                        max31790@20 {
>> +                                compatible =3D "max31790";
>> +                                reg =3D <0x20>;
>> +                                #address-cells =3D <1>;
>> +                                #size-cells =3D <0>;
>> +                               fan-mode =3D "pwm";
>> +                                fanconfig1 =3D <0x08>;
>> +                                fanconfig2 =3D <0x09>;
>> +                                fanconfig3 =3D <0x08>;
>> +                                fanconfig4 =3D <0x08>;
>> +                                fanconfig5 =3D <0x09>;
>> +                                fanconfig6 =3D <0x08>;
>> +                        };
>=20
> Andrew, can you please review the max parts?
>=20
>> +                       max31790@23 {
>> +                               compatible =3D "max31790";
>> +                               reg =3D <0x23>;
>> +                               #address-cells =3D <2>;
>> +                               #size-cells =3D <0>;
>> +                               fan-mode =3D "pwm";
>> +                                fanconfig1 =3D <0x08>;
>> +                                fanconfig2 =3D <0x09>;
>> +                                fanconfig3 =3D <0x08>;
>> +                                fanconfig4 =3D <0x08>;
>> +                                fanconfig5 =3D <0x09>;
>> +                                fanconfig6 =3D <0x08>;
>> +                       };
>> +                       eeprom@50 {
>> +                               compatible =3D "atmel,24c02";
>> +                               reg =3D <0x50>;
>> +                       };
>> +                        ds1100@58 {
>> +                                compatible =3D "ds1100";
>> +                                reg =3D <0x58>;
>> +                        };
>> +               };
>> +       };
>> +};
>> +
>> +&i2c9 {
>> +       status =3D "okay";
>> +};
>> +
>> +&i2c10 {
>> +       status =3D "disabled";
>> +};
>> +
>> +&i2c11 {
>> +       status =3D "disabled";
>> +};
>> +
>> +&i2c12 {
>> +       status =3D "disabled";
>> +};
>> +
>> +&i2c13 {
>> +       status =3D "disabled";
>> +};
>=20
> Delete the above; they are disabled by default so you don't need to =
specify this.
>=20
>> +&vuart {
>> +       status =3D "okay";
>> +};
>> +
>> +&gfx {
>> +        status =3D "okay";
>> +};
>> +
>> +&pinctrl {
>> +       aspeed,external-nodes =3D <&gfx &lhc>; }; &gpio {
>> +       pin_gpio_a3 {
>=20
> Do you want to add labels that contain the net names for each gpio? I =
recommend doing this so it is understood what each line is doing.
>=20
>=20
>> +               gpios =3D <ASPEED_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_c7 {
>> +               gpios =3D <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_d2 {
>> +               gpios =3D <ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +       };
>> +       pin_gpio_d3 {
>> +               gpios =3D <ASPEED_GPIO(D, 3) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +       };
>> +       pin_gpio_f6 {
>> +               gpios =3D <ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +       };
>> +       pin_gpio_g4 {
>> +               gpios =3D <ASPEED_GPIO(G, 4) GPIO_ACTIVE_LOW>;
>> +               output-low;
>> +       };
>> +       pin_gpio_g6 {
>> +               gpios =3D <ASPEED_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_l4 {
>> +               gpios =3D <ASPEED_GPIO(L, 4) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +       };
>> +       pin_gpio_o6 {
>> +               gpios =3D <ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_p0 {
>> +               gpios =3D <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +       };
>> +       pin_gpio_p2 {
>> +               gpios =3D <ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_q4 {
>> +               gpios =3D <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +       };
>> +       pin_gpio_r1 {
>> +               gpios =3D <ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +       };
>> +       pin_gpio_y2 {
>> +               gpios =3D <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +       };
>> +};
>> diff --git a/arch/arm/mach-aspeed/aspeed.c=20
>> b/arch/arm/mach-aspeed/aspeed.c index 5965bbf..4f6a5e9 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>=20
> Device tree changes should go in a separate to code changes.
>=20
>> @@ -29,6 +29,7 @@
>> #define AST_BASE_MAC0          0X1E660000 /* MAC 1 */
>> #define AST_BASE_SCU           0x1E6E2000 /* System Control Unit =
(SCU) */
>> #define AST_BASE_GPIO          0x1E780000 /* GPIO Controller */
>> +#define AST_BASE_WDT           0x1E785000 /* Watchdog Timer */
>>=20
>> static struct map_desc aspeed_io_desc[] __initdata __maybe_unused =3D =
{
>>        {
>> @@ -232,6 +233,25 @@ static void __init do_mellanox_setup(void)
>>        writel(reg, AST_IO(AST_BASE_SCU | 0x48));  }
>>=20
>> +
>> +static void __init do_centriq2400rep_setup(void) {
>> +       u32 reg;
>> +
>> +       do_common_setup();
>> +       writel(0x00000010, AST_IO(AST_BASE_WDT | 0x2c));
>=20
> We have a watchdog driver for modifying the watchdog. Please use that =
instead of this line.
>=20
>> +
>> +       writel(0xff000000, AST_IO(AST_BASE_SCU | 0x88));
>=20
> This appears to be modifying the multi function pin control. What are =
you trying to do?
>=20
> We should be able to use the pinctrl driver to modify these settings.
>=20
>> +
>> +       /* Set GPIOC7 to output high to init host spi driver */
>> +       reg =3D readl(AST_IO(AST_BASE_GPIO | 0x04)) | BIT(23);
>> +       writel(reg, AST_IO(AST_BASE_GPIO | 0x04));
>> +       reg =3D readl(AST_IO(AST_BASE_GPIO)) | BIT(23);
>> +       writel(reg, AST_IO(AST_BASE_GPIO));
>=20
> Can you use a GPIO hog instead?
>=20
>=20
>> +}
>> +
>> +
>> #define SCU_PASSWORD   0x1688A8A8
>>=20
>> static void __init aspeed_init_early(void) @@ -284,6 +304,8 @@ static=20=

>> void __init aspeed_init_early(void)
>>                do_lanyang_setup();
>>        if (of_machine_is_compatible("mellanox,msn-bmc"))
>>                do_mellanox_setup();
>> +        if =
(of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
>> +                do_centriq2400rep_setup();
>> }
>>=20
>> static void __init aspeed_map_io(void)
>> --
>> 2.9.3
>>=20
