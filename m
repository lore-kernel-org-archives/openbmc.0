Return-Path: <clg@kaod.org>
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wZ36V1rztzDqSy
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 20:59:13 +1000 (AEST)
Received: from player718.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 893058D42B
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 12:59:09 +0200 (CEST)
Received: from zorba.kaod.org (ken64-2-78-199-76-109.fbx.proxad.net
 [78.199.76.109]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 4BD314E0090;
 Fri, 26 May 2017 12:59:04 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v2] ARM: aspeed: Add Mellanox MSN machine
To: Joel Stanley <joel@jms.id.au>, Mykola Kostenok <c_mykolak@mellanox.com>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20170525144903.88282-1-c_mykolak@mellanox.com>
 <CACPK8XcydmdN4i8EOohtPNkvHBQwEpCMvNWU_auK71JZaPFSdA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0bdee4c1-69cf-ccc1-9695-c57f79530546@kaod.org>
Date: Fri, 26 May 2017 12:59:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcydmdN4i8EOohtPNkvHBQwEpCMvNWU_auK71JZaPFSdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 755760312938105602
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrfeeigdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 26 May 2017 10:59:14 -0000

On 05/26/2017 06:43 AM, Joel Stanley wrote:
> Andrew, can you please review the pinmux-y bits?
> 
> Cedric, can you double check the mtd bits?

There is the SMC controller flash mapping window on the AHB Bus,
which would need a fix but it requires CONFIG_VMSPLIT_2G. 

The clocks need to be defined :

			clocks = <&clk_ahb>;
			clock-names = "ahb";

to optimize the reads and also :

				m25p,fast-read;

Cheers,

C. 
 
> On Fri, May 26, 2017 at 12:49 AM, Mykola Kostenok
> <c_mykolak@mellanox.com> wrote:
>> Initial introduction of Mellanox switches of MSNXXXX family equipped
>> with Aspeed 2520 BMC SoC. This adds the platform early initialization
>> and msn platform device tree file.
>>
>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>> ---
>> v1->v2
>> Fixed issues pointed out by Joel:
>> - Make commit title shorter.
>> - Replace flash layout from separate dtsi to dts.
>> - Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
>> - Remove no-hw-checksum from dts.
>> - Add comments.
>> - Remove WD2 disable from aspeed.c
>> - Add wdt2 to dts.
> 
> Looking good!
> 
> Sorry for not getting back to you with some of your questions.
> 
> I think it's okay to have the flash layout in the separate dtsi in the future.
> 
> In general when submitting patches for the kernel we want to have
> separate patches for different parts of the system, one to add the
> device tree, one to add the aspeed.c changes, and another for the
> defconfigs. Just keep that in mind for next time.
> 
>> ---
>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      | 239 +++++++++++++++++++++
>>  arch/arm/configs/aspeed_g5_defconfig               |   2 +
>>  arch/arm/mach-aspeed/aspeed.c                      |  23 ++
>>  5 files changed, 266 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 16d3b5e7f5d1..84601d869a1b 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -172,6 +172,7 @@ meas        Measurement Specialties
>>  mediatek       MediaTek Inc.
>>  melexis        Melexis N.V.
>>  melfas MELFAS Inc.
>> +mellanox       Mellanox Technologies
>>  memsic MEMSIC Inc.
>>  merrii Merrii Technology Co., Ltd.
>>  micrel Micrel Inc.
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 30fe65627f30..3dba6c633686 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -990,6 +990,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>>         aspeed-bmc-opp-witherspoon.dtb \
>>         aspeed-bmc-opp-zaius.dtb \
>>         aspeed-bmc-opp-lanyang.dtb \
>> +       aspeed-bmc-mellanox-msn.dtb \
>>         aspeed-ast2500-evb.dtb
>>  endif
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> new file mode 100644
>> index 000000000000..a29b279b4f40
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> @@ -0,0 +1,239 @@
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/pwm/pwm.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
> 
> I don't think you're using any defines from these headers. You can
> remove the includes.
> 
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include "aspeed-g5.dtsi"
>> +
>> +/ {
>> +       model = "MSN BMC";
>> +       compatible = "mellanox,msn-bmc", "aspeed,ast2500";
>> +
>> +       aliases {
>> +               serial0 = &uart1;
>> +               serial4 = &uart5;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200n8 earlyprintk";
>> +       };
>> +
>> +       memory {
>> +               /* 512MiB SDRAM DDR4 @ 0x8000_0000 */
>> +               reg = <0x80000000 0x20000000>;
>> +       };
>> +
>> +       ahb {
>> +               bmc_pnor: fmc@1e620000 {
>> +                       reg = < 0x1e620000 0xc4
>> +                               0x20000000 0x02000000 >;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       compatible = "aspeed,ast2500-fmc";
>> +                       interrupts = <19>;
>> +                       flash@0 {
>> +                               reg = < 0 >;
>> +                               compatible = "jedec,spi-nor" ;
>> +                               label = "bmc";
>> +                               #address-cells = < 1 >;
>> +                               #size-cells = < 1 >;
>> +                               u-boot {
>> +                                       reg = < 0 0x60000 >;
>> +                                       label = "u-boot";
>> +                               };
>> +                               u-boot-env {
>> +                                       reg = < 0x60000 0x10000>;
>> +                                       label = "u-boot-env";
>> +                               };
>> +                               kernel  {
>> +                                       reg = < 0x70000 0x280000 >;
>> +                                       label = "kernel";
>> +                               };
>> +                               dtb  {
>> +                                       reg = < 0x2f0000 0x10000 >;
>> +                                       label = "dtb";
>> +                               };
>> +                               initramfs {
>> +                                       reg = < 0x300000 0x1c0000 >;
>> +                                       label = "initramfs";
>> +                               };
>> +                               rofs  {
>> +                                       reg = < 0x4c0000 0x1740000 >;
>> +                                       label = "rofs";
>> +                               };
>> +                               rwfs  {
>> +                                       reg = < 0x1c00000 0x400000 >;
>> +                                       label = "rwfs";
>> +                               };
>> +                       };
>> +               };
>> +
>> +               host_pnor: spi2@1e631000 {
>> +                       reg = < 0x1e631000 0xc4
>> +                               0x38000000 0x08000000 >;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       compatible = "aspeed,ast2500-spi";
>> +                       status = "disabled";
> 
> As this is disabled it has no affect. You can remove the entire host_pnor node.
> 
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&pinctrl_spi2ck_default
>> +                                    &pinctrl_spi2cs0_default
>> +                                    &pinctrl_spi2miso_default
>> +                                    &pinctrl_spi2mosi_default>;
>> +
>> +                       host_flash {
>> +                               reg = < 0 >;
>> +                               compatible = "jedec,spi-nor";
>> +                               label = "host_flash";
>> +                               #address-cells = < 1 >;
>> +                               #size-cells = < 1 >;
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&uart5 {
>> +       status = "okay";
>> +};
>> +
>> +&uart1 {
>> +       status = "okay";
> 
> You need to request the pins from pinmux. If you'e got all of the
> RS-232 lines connected, that will look like this:
> 
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_txd1_default
>                         &pinctrl_rxd1_default
>                         &pinctrl_nrts1_default
>                         &pinctrl_ndtr1_default
>                         &pinctrl_ndsr1_default
>                         &pinctrl_ncts1_default
>                         &pinctrl_ndcd1_default
>                         &pinctrl_nri1_default>;
> 
> You may just have the tx and rx lines connected, in which case it
> would look like this:
> 
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_txd1_default
>                         &pinctrl_rxd1_default>;
> 
> You will need to check your schematic to work that out.
> 
>> +};
>> +
>> +&mac0 {
>> +       status = "okay";
>> +       use-ncsi;
>> +};
>> +
>> +&i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +       status = "okay";
>> +};
> 
> 
> I assume you're enabling these i2c buses so you can use them from userspace?
> 
>> +
>> +&i2c5 {
>> +       status = "okay";
>> +
>> +       eeprom@50 {
>> +               compatible = "atmel,24c32";
>> +               reg = <0x50>;
>> +       };
>> +
>> +       eeprom@51 {
>> +               compatible = "atmel,24c32";
>> +               reg = <0x51>;
>> +       };
>> +};
>> +
>> +&i2c6 {
>> +       status = "okay";
>> +
>> +       eeprom@51 {
>> +               compatible = "atmel,24c32";
>> +               reg = <0x51>;
>> +       };
>> +
>> +       eeprom@52 {
>> +               compatible = "atmel,24c32";
>> +               reg = <0x52>;
>> +       };
>> +
>> +       eeprom@55 {
>> +               compatible = "atmel,24c32";
>> +               reg = <0x55>;
>> +       };
>> +
>> +       i2cswitch@71 {
>> +               compatible = "nxp,pca9548";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               reg = <0x71>;
>> +       };
>> +};
>> +
>> +&i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c8 {
>> +       status = "okay";
>> +
>> +       carrier_ambient: lm75@49 {
>> +               #thermal-sensor-cells = <0>;
>> +               compatible = "national,lm75";
>> +               reg = <0x49>;
>> +       };
>> +
>> +       swbrd_ambient: lm75@4a {
>> +               #thermal-sensor-cells = <0>;
>> +               compatible = "national,lm75";
>> +               reg = <0x4a>;
>> +       };
>> +};
>> +
>> +&i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c10 {
>> +       status = "okay";
>> +
>> +       hwmon@41 {
>> +               compatible = "ti,ucd9224";
>> +               reg = <0x41>;
>> +       };
>> +
>> +       hwmon@27 {
>> +               compatible = "ti,ucd9224";
>> +               reg = <0x27>;
>> +       };
>> +
>> +       adc@6d {
>> +               compatible = "maxim,max11603";
>> +               reg = <0x6d>;
>> +               adc0: iio-device@0 {
>> +                       #io-channel-cells = <1>;
>> +                       io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>,
>> +                                     <&adc0 3>, <&adc0 4>, <&adc0 5>,
>> +                                     <&adc0 6>, <&adc0 7>;
>> +               };
>> +       };
>> +};
>> +
>> +&i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c12 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c13 {
>> +       status = "okay";
>> +};
>> +
>> +&vuart {
>> +       status = "okay";
>> +};
>> +
>> +&wdt2 {
>> +       status = "okay";
>> +};
>> +
>> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
>> index d0deda45f55b..49a270266fd9 100644
>> --- a/arch/arm/configs/aspeed_g5_defconfig
>> +++ b/arch/arm/configs/aspeed_g5_defconfig
>> @@ -140,6 +140,7 @@ CONFIG_PMBUS=y
>>  CONFIG_SENSORS_ADM1275=y
>>  CONFIG_SENSORS_LM25066=y
>>  CONFIG_SENSORS_UCD9000=y
>> +CONFIG_SENSORS_UCD9200=y
>>  CONFIG_SENSORS_TMP421=y
>>  CONFIG_USB=y
>>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>> @@ -164,6 +165,7 @@ CONFIG_MAILBOX=y
>>  CONFIG_ASPEED_LPC_MBOX=y
>>  # CONFIG_IOMMU_SUPPORT is not set
>>  CONFIG_IIO=y
>> +CONFIG_MAX1363=y
>>  CONFIG_ASPEED_ADC=y
>>  CONFIG_BMP280=y
>>  CONFIG_FSI=y
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 0f1a536ba1b2..942cdffed9bd 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -188,6 +188,27 @@ static void __init do_lanyang_setup(void)
>>         writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>>  }
>>
>> +static void __init do_mellanox_setup(void)
>> +{
>> +       unsigned long reg;
>> +
>> +       do_common_setup();
>> +
>> +       /* Set strap to RGMII for dedicated PHY networking */
>> +       reg = readl(AST_IO(AST_BASE_SCU | 0x70));
>> +       reg |= BIT(7);
>> +       reg &= ~BIT(6);
>> +       writel(reg, AST_IO(AST_BASE_SCU | 0x70));
>> +
>> +       /* Disable UART1 Reset from LPC */
>> +       writel(0x00000A00, AST_IO(AST_BASE_LPC | 0x98));
>> +
>> +       /* Enable RMII1 50MHz RCLK output.*/
>> +       reg = readl(AST_IO(AST_BASE_SCU | 0x48));
>> +       reg |= BIT(29);
>> +       writel(reg, AST_IO(AST_BASE_SCU | 0x48));
>> +}
>> +
>>  #define SCU_PASSWORD   0x1688A8A8
>>
>>  static void __init aspeed_init_early(void)
>> @@ -227,6 +248,8 @@ static void __init aspeed_init_early(void)
>>                 do_romulus_setup();
>>         if (of_machine_is_compatible("inventec,lanyang-bmc"))
>>                 do_lanyang_setup();
>> +       if (of_machine_is_compatible("mellanox,msn-bmc"))
>> +               do_mellanox_setup();
>>  }
>>
>>  static void __init aspeed_map_io(void)
>> --
>> 2.11.0
>>
