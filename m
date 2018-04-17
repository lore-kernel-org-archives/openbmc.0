Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ap4FAf47"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jR46pZfm"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Q7rX0FG1zDrJw
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 12:05:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E91421CE3;
 Mon, 16 Apr 2018 22:05:45 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Mon, 16 Apr 2018 22:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=foasks9w4azoscTF7PBxA9Myp4lgV
 CNyzCxfIHxH8zo=; b=ap4FAf475SMrMWCKIpMkxnOyjAt5bm0C1vvp7HLcXACR9
 TNMk5iTITkem21b5Sgw94rU6/FAKNhIwi1nJRqlTdieq2eJvb8pMWCxCQDFsToX+
 1NYeJHr8oXsgV+GchuifSjPfHKLEfYYtAv14fhSouFrVpYTDowV4Re8pqUYh7kCZ
 x1TwJDQCAP7V0yrCNmLRhMlFFiWmBoh4MJ68hOiJnr02C9/2GgnUruguGhqf74PL
 rkyouq34Y1k89b9fprW4OtChl+Kdh1bzUn9wcGQugUPr9pwLxqxsAiNudQKVOdJR
 6IEEG+8j7UT840y+1QFKmSf7smgYhd9DAou8c7Zog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=foasks
 9w4azoscTF7PBxA9Myp4lgVCNyzCxfIHxH8zo=; b=jR46pZfmMfJGgn/9v2u9By
 RzHyvS4v88AZJ5KUSjIr6PMJYx3Xn1QhIfH1PypgazooAawY0+7BceA4PvukMrJN
 hf1DcxtFQK6+Uhxu/SOZMeu+2rsOEJT0SaNbZYOyZQgNM22Ej1ZM1YmDq94LcaTc
 2jR6k8UFRwppSByF/wJwAJjTInIzpgSvFocTwjO8Xk70pQ0NPkoRRLV5QOxsa95n
 9bdlUcO8JKMMNeGC6FGxiqxVaI5B0CJIzUCMxKyfCwQnljtQXiVFljc0Judu/+wu
 HUXFFszqxE/IH1xyXbjnFqxU77ZfCqcPbb52NBRKs2r/7GYuCVur/STzoL8OeZtA
 ==
X-ME-Sender: <xms:eVbVWia5PSTXpWYjV6nw4BjVoSyHuMuoRrZJJqRd7jj_vjdZLPKTuA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 0A85ABA780; Mon, 16 Apr 2018 22:05:45 -0400 (EDT)
Message-Id: <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?YangBrianC=2EW=20=E6=A5=8A=E5=98=89=E5=81=89=20TAO?=
 <yang.brianc.w@inventec.com>,
 =?utf-8?Q?Chen=2EKenYY=20=E9=99=B3=E6=B0=B8=E7=87=9F=20TAO?=
 <Chen.KenYY@inventec.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f2937c11
Date: Tue, 17 Apr 2018 11:35:44 +0930
Subject: Re: FW: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
 Lanyang BMC
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6B7921E@IEC1-EX2010-MX4.iec.inventec>
 <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
In-Reply-To: <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Apr 2018 02:05:50 -0000

Hi Brian,

On Mon, 16 Apr 2018, at 20:39, YangBrianC.W =E6=A5=8A=E5=98=89=E5=81=89 TAO=
 wrote:
> Hi Andrew,
>=20
>=20
> 2018-04-16 15:04 GMT+08:00 Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO <Ch=
en.KenYY@inventec.com>:
> > FYR
> >
> > -----Original Message-----
> > From: openbmc [mailto:openbmc-bounces+chen.kenyy=3Dinventec.com@lists.o=
zlabs.org] On Behalf Of Andrew Jeffery
> > Sent: Friday, April 13, 2018 9:58 AM
> > To: openbmc@lists.ozlabs.org
> > Subject: Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec L=
anyang BMC
> >
> > Hi Brian,
> >
> > On Wed, 11 Apr 2018, at 17:12, Brian Yang wrote:
> >> The Inventec Lanyang is Power 9 platform with ast2500 BMC.
> >>
> >> Tested-by: Brian Yang <yang.brianc.w@inventec.com>
> >> Signed-off-by: Brian Yang <yang.brianc.w@inventec.com>
> >>
> >> ---
> >>
> >> v0->v1
> >> -Add test information in commit
> >> ---
> >>  arch/arm/boot/dts/Makefile                   |   1 +
> >>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 331
> >> +++++++++++++++++++++++++++
> >>  2 files changed, 332 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> >>
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index 5cfee25..d1882f0 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -1057,6 +1057,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >>       aspeed-ast2500-evb.dtb \
> >>       aspeed-bmc-arm-centriq2400-rep.dtb \
> >>       aspeed-bmc-intel-s2600wf.dtb \
> >> +     aspeed-bmc-opp-lanyang.dtb \
> >>       aspeed-bmc-opp-palmetto.dtb \
> >>       aspeed-bmc-opp-romulus.dtb \
> >>       aspeed-bmc-opp-witherspoon.dtb \
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/
> >> boot/dts/aspeed-bmc-opp-lanyang.dts
> >> new file mode 100644
> >> index 0000000..6241730
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> >> @@ -0,0 +1,331 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +// Copyright (c) 2018 Inventec Corporation /dts-v1/;
> >> +
> >> +#include "aspeed-g5.dtsi"
> >> +#include <dt-bindings/gpio/aspeed-gpio.h>
> >> +
> >> +/ {
> >> +     model =3D "Lanyang BMC";
> >> +     compatible =3D "inventec,lanyang-bmc", "aspeed,ast2500";
> >> +
> >> +     chosen {
> >> +             stdout-path =3D &uart5;
> >> +             bootargs =3D "console=3DttyS4,115200 earlyprintk";
> >> +     };
> >> +
> >> +     memory {
> >> +             reg =3D <0x80000000 0x40000000>;
> >> +     };
> >> +
> >> +     reserved-memory {
> >> +             #address-cells =3D <1>;
> >> +             #size-cells =3D <1>;
> >> +             ranges;
> >> +
> >> +             flash_memory: region@98000000 {
> >> +                     no-map;
> >> +                     reg =3D <0x98000000 0x04000000>; /* 64M */
> >> +             };
> >> +     };
> >> +
> >> +     leds {
> >> +             compatible =3D "gpio-leds";
> >> +
> >> +             sys_boot_status {
> >> +                     label =3D "System_boot_status";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_L=
OW>;
> >> +             };
> >> +
> >> +             attention {
> >> +                     label =3D "Attention_locator";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_H=
IGH>;
> >> +             };
> >> +
> >> +             plt_fault {
> >> +                     label =3D "Platform_fault";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_H=
IGH>;
> >> +             };
> >> +
> >> +             hdd_fault {
> >> +                     label =3D "Onboard_drive_fault";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_H=
IGH>;
> >> +             };
> >> +             bmc_err {
> >> +                     lable =3D "BMC_fault";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_H=
IGH>;
> >> +             };
> >> +
> >> +             sys_err {
> >> +                     lable =3D "Sys_fault";
> >> +                     gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_H=
IGH>;
> >> +             };
> >> +     };
> >> +
> >> +     fsi: gpio-fsi {
> >> +             compatible =3D "fsi-master-gpio", "fsi-master";
> >> +             #address-cells =3D <2>;
> >> +             #size-cells =3D <0>;
> >> +
> >> +             clock-gpios =3D <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIG=
H>;
> >> +             data-gpios =3D <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH=
>;
> >> +             trans-gpios =3D <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIG=
H>;
> >> +             enable-gpios =3D <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HI=
GH>;
> >> +             mux-gpios =3D <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> >> +     };
> >> +
> >> +     iio-hwmon {
> >> +             compatible =3D "iio-hwmon";
> >> +             io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> >> +                     <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> >> +                     <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> >> +                     <&adc 13>, <&adc 14>, <&adc 15>;
> >> +     };
> >> +
> >> +     iio-hwmon-battery {
> >> +             compatible =3D "iio-hwmon";
> >> +             io-channels =3D <&adc 12>;
> >> +     };
> >> +};
> >> +
> >> +#include "ibm-power9-cfam.dtsi"
> >> +
> >> +&pwm_tacho {
> >> +     status =3D "okay";
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
> >> +             &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> >> +
> >> +     fan@0 {
> >> +             reg =3D <0x00>;
> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> >> +     };
> >> +
> >> +     fan@1 {
> >> +             reg =3D <0x01>;
> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> >> +     };
> >> +
> >> +     fan@2 {
> >> +             reg =3D <0x02>;
> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> >> +     };
> >> +
> >> +     fan@3 {
> >> +             reg =3D <0x03>;
> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> >> +     };
> >> +};
> >> +
> >> +&fmc {
> >> +     status =3D "okay";
> >> +     flash@0 {
> >> +             status =3D "okay";
> >> +             m25p,fast-read;
> >> +             label =3D "bmc";
> >> +#include "openbmc-flash-layout.dtsi"
> >> +     };
> >> +};
> >> +
> >> +&spi1 {
> >> +     status =3D "okay";
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_spi1_default>;
> >> +
> >> +     flash@0 {
> >> +             status =3D "okay";
> >> +             label =3D "pnor";
> >> +             m25p,fast-read;
> >> +     };
> >> +};
> >> +
> >> +&spi2 {
> >> +     status =3D "okay";
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_spi2ck_default
> >> +                  &pinctrl_spi2cs0_default
> >> +                  &pinctrl_spi2cs1_default
> >> +                  &pinctrl_spi2miso_default
> >> +                  &pinctrl_spi2mosi_default>;
> >> +
> >> +     flash@0 {
> >> +             status =3D "okay";
> >> +     };
> >> +};
> >> +
> >> +&uart1 {
> >> +     status =3D "okay";
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_txd1_default
> >> +                  &pinctrl_rxd1_default>;
> >> +};
> >> +
> >> +&lpc_ctrl {
> >> +     status =3D "okay";
> >> +     memory-region =3D <&flash_memory>;
> >> +     flash =3D <&spi1>;
> >> +};
> >> +
> >> +&lpc_snoop {
> >> +     status =3D "okay";
> >> +     snoop-ports =3D <0x80>;
> >> +};
> >> +
> >> +&mbox {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&uart5 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&mac0 {
> >> +     status =3D "okay";
> >> +
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_rmii1_default>;
> >> +     use-ncsi;
> >> +};
> >> +
> >> +&mac1 {
> >> +     status =3D "okay";
> >> +
> >> +     pinctrl-names =3D "default";
> >> +     pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>; =
};
> >> +
> >> +&i2c0 {
> >> +     status =3D "okay";
> >> +
> >> +     eeprom@55 {
> >> +             compatible =3D "atmel,24c64";
> >> +             reg =3D <0x55>;
> >> +             pagesize =3D <32>;
> >> +     };
> >> +
> >> +     rtc@68 {
> >> +             compatible =3D "nxp,pcf8523";
> >> +             reg =3D <0x68>;
> >> +     };
> >> +
> >> +     tmp75@48 {
> >> +             compatible =3D "ti,tmp75";
> >> +             reg =3D <0x48>;
> >> +     };
> >> +};
> >> +
> >> +&i2c1 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c2 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c3 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c4 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c5 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c6 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c7 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c8 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c9 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c10 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&i2c11 {
> >> +     status =3D "okay";
> >> +};
> >
> > Do we need to enable all of the above i2c buses? By comparison, Zaius e=
nables i2c0, i2c1, i2c4, i2c7 and i2c8.
>=20
> Thank you for your review.
>=20
> We need to enable all of the above i2c buses because we want to verify
> the i2c bus is fine by i2ctool.
>=20
> Because we use the above i2c buses on Lanyang platform.

Okay, it's still not clear to me. Are there devices on all the buses? If so=
, do any have bindings that we could use to describe them here? It looks od=
d enabling all the buses but not "using" any of them.

If you're just enabling them to test the bus with i2ctool then I feel that =
we might be better with that staying as a local change for your testing, ra=
ther than merging this as is. Joel?

Cheers,

Andrew

>=20
>=20
> >
> >> +
> >> +&vuart {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&gfx {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&pinctrl {
> >> +     aspeed,external-nodes =3D <&gfx &lhc>; };
> >> +
> >> +&gpio {
> >> +     pin_gpio_b0 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
> >> +             output-high;
> >> +             line-name =3D "BMC_HDD1_PWR_EN";
> >> +     };
> >> +
> >> +     pin_gpio_b5 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> >> +             input;
> >> +             line-name =3D "BMC_USB1_OCI2";
> >> +     };
> >> +
> >> +     pin_gpio_h5 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
> >> +             output-high;
> >> +             line-name =3D "BMC_CP0_PERST_ENABLE_R";
> >> +     };
> >> +
> >> +     pin_gpio_z2 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> >> +             output-high;
> >> +             line-name =3D "RST_PCA9546_U177_N";
> >> +     };
> >> +
> >> +     pin_gpio_aa6 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
> >> +             output-high;
> >> +             line-name =3D "BMC_CP0_RESET_N";
> >> +     };
> >> +
> >> +     pin_gpio_aa7 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
> >> +             output-high;
> >> +             line-name =3D "BMC_TPM_RESET_N";
> >> +     };
> >> +
> >> +     pin_gpio_ab0 {
> >> +             gpio-hog;
> >> +             gpios =3D <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
> >> +             output-high;
> >> +             line-name =3D "BMC_USB_PWRON_N";
> >> +     };
> >> +};
> >> +
> >> +&ibt {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&adc {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> --
> >> 2.7.4
> >>
> >
> > Looks okay from a pinctrl perspective, so if there is reason to enable =
all of the i2c buses, then I'll send an Acked-by
> >
> > Cheers,
> >
> > Andrew
>=20
>=20
> Thank you
>=20
>=20
> Brian
