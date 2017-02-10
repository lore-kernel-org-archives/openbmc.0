Return-Path: <jaghu@google.com>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKjcp1mr5zDqBm
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 05:08:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hYgnz6aA"; 
 dkim-atps=neutral
Received: by mail-vk0-x233.google.com with SMTP id k127so31255895vke.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 10:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lIOAoPfes/yvqqJJK1k+BS8xO4qlFqKa5GEFHxLpMZo=;
 b=hYgnz6aAaemTPSvyO+I9eCljR+SP6g8vt1z9hxda6TM6+LxjTitIFQ019yqkOrwTjz
 hPg8R+WUyuIICpPXo2eBGcnhuSrS+QazgGjJfrJarPM+55A94C7OIlmsUmfUNBlPf9Gg
 e/pzURzTTkQU20fA6ODZPi6i3RoOWPOMZkN4d5M6vY8UaN6AWSiPi7+oAJNI0kkiD1nB
 wLZ7P3wxqPz1WIRX6mzN6DWZi7+7KDNqG8dbsApuXt0j3dGqYaMiWO5D1+nJ1Sliytfq
 4gwK1LA4I0uZ4QMfmX3hnzfKKNLhQFrcIgYZPQmwOckX1XMxG/CskoomteYG/o2ZXcQH
 83Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lIOAoPfes/yvqqJJK1k+BS8xO4qlFqKa5GEFHxLpMZo=;
 b=n05fMz8518Ewv2jrfTNWFjYQg7bIaxryjwr6GMslCeNl6mZ78vK0SjAAm+toVfF0pq
 wY3vvxXVIBufQy7Ze2yxa7YUvMuX97vWhSXwDFqMenPTvjV4hwwwd594m9NJGAgTIC4j
 ViekUfj6OopuL5D/1INZNejgFIuqG9hr08frXanaxkcV39dDbidSN9XgpUDd6ePJNaYq
 fZC6N4vPTwd0nQ2TKfwrJyIIou8R0iG2CJP/UDk41A0GWzWcq/CrU9aPx0LLgHKY5paJ
 N1P0IjNqj8Dp+q4L2FzwCTw6/WIPgfvoe+7r2zjeKckN9lueDVFJ6nWRfK7KddGrl+FA
 PVVQ==
X-Gm-Message-State: AMke39mHqNrO/j1/5fx48sx6omzmmXRZhe2VdRHelWJ0YMVwwFMRtFpvTK5YhFAcWJ/nOQ7zohCtL25pdPTeToGT
X-Received: by 10.31.254.198 with SMTP id l189mr4886312vki.86.1486750134275;
 Fri, 10 Feb 2017 10:08:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.77 with HTTP; Fri, 10 Feb 2017 10:08:33 -0800 (PST)
In-Reply-To: <20170210180106.25127-1-jaghu@google.com>
References: <20170210180106.25127-1-jaghu@google.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Fri, 10 Feb 2017 10:08:33 -0800
Message-ID: <CANsWYUUdXRCaMUCaEG2hq-ESHSQqDrfg0RP+ya4miCaWj+3ckA@mail.gmail.com>
Subject: Re: [PATCH linux v1] drivers: hwmon: Support for ASPEED PWM/Fan tach
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 10 Feb 2017 18:08:59 -0000

Hi Xo,
Please use this patch for the zaius bmc image.

On Fri, Feb 10, 2017 at 10:01 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 178 ++++
>  Documentation/hwmon/aspeed-pwm-tacho               |  22 +
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  73 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |   6 +
>  drivers/hwmon/Kconfig                              |  11 +-
>  drivers/hwmon/Makefile                             |   1 +
>  drivers/hwmon/aspeed-pwm-tacho.c                   | 895 +++++++++++++++=
++++++
>  7 files changed, 1185 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-ta=
cho.txt
>  create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
>  create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c
>
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt=
 b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..290122bfe170
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,178 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan=
 Tacho
> +controller can support upto 16 tachometer inputs.
> +
> +There are three different types M, N, O. These three types are just to h=
ave
> +different PWM and Fan Tach settings. Each type can have the following se=
ttings:
> +       PWM related:
> +               1) PWM period
> +               2) PWM clock division high
> +               3) PWM clock division low
> +       Fan Tach related:
> +               1) Fan Tach type enable
> +               2) Fan Tach clock division
> +               3) Fan Tach mode selection
> +               4) Fan Tach period
> +
> +Each PWM port should be assigned a type which can be type M, N or O.
> +
> +Each Fan Tach channel should be assigned a PWM source, which can be PWM =
port A
> +through H. The Fan Tach channel implicitly gets the type (M, N or O), fr=
om the
> +type assigned to its PWM source.
> +
> +Required properties for pwm-tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the AST2400/AST25=
00 PWM
> +             ports.
> +
> +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
> +              "aspeed,aspeed2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +          and Fan Tach clock)
> +
> +type-values subnode format:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Under type-values subnode there can be upto 3 child nodes indicating typ=
e M/N/O
> +values. Atleast one child node is required.
> +
> +Required properties for the child node(type M/N/O):
> +- type : indicates type M/N/O. integer value in the range 0 to 2 with 0
> +        indicating type M, 1 indicating type N  and 2 indicating type O.
> +
> +- pwm-period : indicates type M/N/O PWM period, as per the AST2400/AST25=
00
> +              datasheet. integer value in the range 0 to 255.
> +
> +- pwm-clock-division-l : indicates type M/N/O PWM clock division L value=
,
> +                        as per the AST2400/AST2500 datasheet.
> +                        integer value in the range 0 to 15.
> +                        0 here indicates divide 1, 1 indicates divide 2,
> +                        2 indicates divide 4, 3 indicates divide 6, and =
so on
> +                        till 15 indicates divide 30.
> +
> +- pwm-clock-division-h : indicates type M/N/O PWM clock division H value=
,
> +                        as per the AST2400/AST2500 datasheet.
> +                        integer value in the range 0 to 15.
> +                        0 here indicates divide 1, 1 indicates divide 2,
> +                        2 indicates divide 4, 3 indicates divide 8, and =
so on
> +                        till 15 indicates divide 32768.
> +
> +- fan-tach-type-enable : indicates fan tach enable of type M/N/O as per =
the
> +                        AST2400/AST2500 datasheet. boolean value.
> +
> +- fan-tach-clock-division : indicates fan tach clock division as per the
> +                           AST2400/AST2500 datasheet.
> +                           integer value in the range 0 to 7.
> +                           0 indicates divide 4, 1 indicates divide 16,
> +                           2 indicates divide 64, 3 indicates divide 256
> +                           and so on till 7 indicates divide 65536.
> +
> +- fan-tach-mode-selection : indicates fan tach mode mode selection as pe=
r the
> +                           AST2400/AST2500 datasheet. integer value in t=
he
> +                           range 0 to 2. 0 indicates falling edge, 1 ind=
icates
> +                           rising edge and 2 indicates both edges.
> +
> +- fan-tach-period : indicates fan tach period as per the AST2400/AST2500
> +                   datasheet. integer value (can be upto 16 bits long).
> +
> +pwm-port subnode format:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Under pwm-port subnode there can upto 8 child nodes each indicating valu=
es
> +for one of the 8 PWM output ports.
> +
> +Required properties for each child node(starting from PWM A through PWM =
H):
> +- pwm-port : should specify PWM #X port , X ranges from A through H.
> +            integer value in the range 0 to 7 with 0 indicating PWM port
> +            A and 7 indicating PWM port H.
> +
> +- type : indicates type selection value of PWM port. integer value in th=
e
> +        range 0 to 2; 0 indicates type M, 1 indicates type N, 2 indicate=
s
> +        type O.
> +
> +- fan-ctrl : set the PWM duty cycle initial value. integer value between
> +            0(off) and 255(full speed).
> +
> +fan-tach-channel subnode format:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +Under fan-tach-channel subnode there can be upto 16 child nodes each ind=
icating
> +values for one of the 16 fan tach channels.
> +
> +Required properties for each child node(starting from fan tach #0 throug=
h
> +fan tach #15):
> +- fan-ctrl-gpios : should specify the tachometer input GPIO pin on the h=
ardware.
> +                  Fan Tachometer function can only work when GPIO is in
> +                  =E2=80=9Dinput mode=E2=80=9D
> +
> +- fan-tach : should specify the fan tach channel #X, X ranges from 0 thr=
ough
> +            15. integer value in the range 0 through 15.
> +
> +- pwm-source : indicates PWM source of the fan tach channel. integer val=
ue in
> +              the range 0 to 7. 0 indicates PWM port A, 1 indicates PWM
> +              port B and so on till 7 indicates PWM port H.
> +
> +Examples:
> +
> +pwm-tacho-fixed-clk: fixedclk {
> +       compatible =3D "fixed-clock";
> +       #clock-cells =3D <0>;
> +       clock-frequency =3D <24000000>;
> +}
> +
> +pwm-tacho: pwm-tacho-controller@1e786000 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +       reg =3D <0x1E786000 0x1000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +       compatible =3D "aspeed,aspeed2500-pwm-tacho";
> +       clocks =3D <&pwm-tacho-fixed-clk>;
> +       type-values {
> +               typem {
> +                       type =3D /bits/ 8 <0x00>;
> +                       pwm-period =3D /bits/ 8 <0x5F>;
> +                       pwm-clock-division-h =3D /bits/ 8 <0x00>;
> +                       pwm-clock-division-l =3D /bits/ 8 <0x05>;
> +                       fan-tach-type-enable;
> +                       fan-tach-clock-division =3D /bits/ 8 <0x00>;
> +                       fan-tach-mode-selection =3D /bits/ 8 <0x00>;
> +                       fan-tach-period =3D /bits/ 16 <0x1000>;
> +               };
> +       };
> +
> +       pwm-port {
> +               pwm-port0 {
> +                       pwm-port =3D /bits/ 8 <0x00>;
> +                       type =3D /bits/ 8 <0x00>;
> +                       fan-ctrl =3D /bits/ 8 <0xFF>;
> +               };
> +
> +               pwm-port1 {
> +                       pwm-port =3D /bits/ 8 <0x01>;
> +                       type =3D /bits/ 8 <0x00>;
> +                       fan-ctrl =3D /bits/ 8 <0xFF>;
> +               };
> +        };
> +
> +       fan-tach-channel {
> +               fan-tach0 {
> +                       fan-ctrl-gpios =3D <&gpio ASPEED_GPIO(O, 0) GPIO_=
ACTIVE_HIGH>;
> +                       fan-tach =3D /bits/ 8 <0x00>;
> +                       pwm-source =3D /bits/ 8 <0x00>;
> +               };
> +
> +               fan-tach1 {
> +                       fan-ctrl-gpios =3D <&gpio ASPEED_GPIO(O, 1) GPIO_=
ACTIVE_HIGH>;
> +                       fan-tach =3D /bits/ 8 <0x01>;
> +                       pwm-source =3D /bits/ 8 <0x01>;
> +               };
> +
> +       };
> +};
> diff --git a/Documentation/hwmon/aspeed-pwm-tacho b/Documentation/hwmon/a=
speed-pwm-tacho
> new file mode 100644
> index 000000000000..0e9ec6d5f900
> --- /dev/null
> +++ b/Documentation/hwmon/aspeed-pwm-tacho
> @@ -0,0 +1,22 @@
> +Kernel driver aspeed-pwm-tacho
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +       ASPEED AST2400/2500
> +
> +Authors:
> +       <jaghu@google.com>
> +
> +Description:
> +------------
> +This driver implements support for ASPEED AST2400/2500 PWM and Fan Tacho
> +controller. The PWM controller supports upto 8 PWM outputs. The Fan tach=
o
> +controller supports upto 16 tachometer inputs.
> +
> +The driver provides the following sensor accesses in sysfs:
> +
> +fanX_input     ro      provide current fan rotation value in RPM as repo=
rted
> +                       by the fan to the device.
> +
> +pwmX           rw      get or set PWM fan control value. This is an inte=
ger
> +                       value between 0(off) and 255(full speed).
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index eef045b9670c..893cee348cf4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -83,6 +83,79 @@
>                         gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LO=
W>;
>                 };
>         };
> +
> +       pwm_tacho: pwm-tacho-controller@2e786000 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               reg =3D <0x1E786000 0x1000>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_defaul=
t
> +                &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> +               compatible =3D "aspeed,aspeed2500-pwm-tacho";
> +               clocks =3D <&pwm_tacho_fixed_clk>;
> +               type-values {
> +                       typem {
> +                               type =3D /bits/ 8 <0x00>;
> +                               pwm-period =3D /bits/ 8 <0x5F>;
> +                               pwm-clock-division-h =3D /bits/ 8 <0x00>;
> +                               pwm-clock-division-l =3D /bits/ 8 <0x05>;
> +                               fan-tach-type-enable;
> +                               fan-tach-clock-division =3D /bits/ 8 <0x0=
0>;
> +                               fan-tach-mode-selection =3D /bits/ 8 <0x0=
0>;
> +                               fan-tach-period =3D /bits/ 16 <0x1000>;
> +                       };
> +               };
> +
> +               pwm-port {
> +                       pwm-port0 {
> +                               pwm-port =3D /bits/ 8 <0x00>;
> +                               type =3D /bits/ 8 <0x00>;
> +                               fan-ctrl =3D /bits/ 8 <0xFF>;
> +                       };
> +                       pwm-port1 {
> +                               pwm-port =3D /bits/ 8 <0x01>;
> +                               type =3D /bits/ 8 <0x00>;
> +                               fan-ctrl =3D /bits/ 8 <0xFF>;
> +                       };
> +                       pwm-port2 {
> +                               pwm-port =3D /bits/ 8 <0x02>;
> +                               type =3D /bits/ 8 <0x00>;
> +                               fan-ctrl =3D /bits/ 8 <0xFF>;
> +                       };
> +                       pwm-port3 {
> +                               pwm-port =3D /bits/ 8 <0x03>;
> +                               type =3D /bits/ 8 <0x00>;
> +                               fan-ctrl =3D /bits/ 8 <0xFF>;
> +                       };
> +               };
> +
> +               fan-tach-channel {
> +                       fan-tach0 {
> +                               fanctrl-gpios =3D <&gpio
> +                                        ASPEED_GPIO(O, 0) GPIO_ACTIVE_HI=
GH>;
> +                               fan-tach =3D /bits/ 8 <0x00>;
> +                               pwm-source =3D /bits/ 8 <0x00>;
> +                       };
> +                       fan-tach1 {
> +                               fanctrl-gpios =3D <&gpio
> +                                        ASPEED_GPIO(O, 1) GPIO_ACTIVE_HI=
GH>;
> +                               fan-tach =3D /bits/ 8 <0x01>;
> +                               pwm-source =3D /bits/ 8 <0x01>;
> +                       };
> +                       fan-tach2 {
> +                               fanctrl-gpios =3D <&gpio
> +                                        ASPEED_GPIO(O, 2) GPIO_ACTIVE_HI=
GH>;
> +                               fan-tach =3D /bits/ 8 <0x02>;
> +                               pwm-source =3D /bits/ 8 <0x02>;
> +                       };
> +                       fan-tach3 {
> +                               fanctrl-gpios =3D <&gpio
> +                                        ASPEED_GPIO(O, 3) GPIO_ACTIVE_HI=
GH>;
> +                               fan-tach =3D /bits/ 8 <0x03>;
> +                               pwm-source =3D /bits/ 8 <0x03>;
> +                       };
> +               };
> +       };
>  };
>
>  &uart5 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index d72aea7ab8f2..710059ec0f78 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -967,6 +967,12 @@
>                                 reg =3D <0x1e6e202c 0x4>;
>                         };
>
> +                       pwm_tacho_fixed_clk: fixedclk {
> +                               compatible =3D "fixed-clock";
> +                               #clock-cells =3D <0>;
> +                               clock-frequency =3D <24000000>;
> +                       };
> +
>                         sram@1e720000 {
>                                 compatible =3D "mmio-sram";
>                                 reg =3D <0x1e720000 0x9000>;      // 36K
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d4de8d5aeed4..8a249a95c1b4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -341,6 +341,15 @@ config SENSORS_ASB100
>           This driver can also be built as a module.  If so, the module
>           will be called asb100.
>
> +config SENSORS_ASPEED
> +       tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
> +       help
> +         This driver provides support for ASPEED AST2400/AST2500 PWM
> +         and Fan Tacho controllers.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called aspeed_pwm_tacho.
> +
>  config SENSORS_ATXP1
>         tristate "Attansic ATXP1 VID controller"
>         depends on I2C
> @@ -1505,7 +1514,7 @@ config SENSORS_ADS7871
>
>  config SENSORS_AMC6821
>         tristate "Texas Instruments AMC6821"
> -       depends on I2C
> +       depends on I2C
>         help
>           If you say yes here you get support for the Texas Instruments
>           AMC6821 hardware monitoring chips.
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 4455478e9e7a..9d2e643bc985 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475) +=3D adt7475.o
>  obj-$(CONFIG_SENSORS_APPLESMC) +=3D applesmc.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI) +=3D scpi-hwmon.o
>  obj-$(CONFIG_SENSORS_ASC7621)  +=3D asc7621.o
> +obj-$(CONFIG_SENSORS_ASPEED)   +=3D aspeed-pwm-tacho.o
>  obj-$(CONFIG_SENSORS_ATXP1)    +=3D atxp1.o
>  obj-$(CONFIG_SENSORS_CORETEMP) +=3D coretemp.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+=3D da9052-hwmon.o
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-=
tacho.c
> new file mode 100644
> index 000000000000..21ed91a9dc2e
> --- /dev/null
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -0,0 +1,895 @@
> +/*
> + * Copyright (c) 2016 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or lat=
er as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysfs.h>
> +#include <linux/regmap.h>
> +
> +/* ASPEED PWM & FAN Tach Register Definition */
> +#define ASPEED_PTCR_CTRL               0x00
> +#define ASPEED_PTCR_CLK_CTRL           0x04
> +#define ASPEED_PTCR_DUTY0_CTRL         0x08
> +#define ASPEED_PTCR_DUTY1_CTRL         0x0c
> +#define ASPEED_PTCR_TYPEM_CTRL         0x10
> +#define ASPEED_PTCR_TYPEM_CTRL1                0x14
> +#define ASPEED_PTCR_TYPEN_CTRL         0x18
> +#define ASPEED_PTCR_TYPEN_CTRL1                0x1c
> +#define ASPEED_PTCR_TACH_SOURCE                0x20
> +#define ASPEED_PTCR_TRIGGER            0x28
> +#define ASPEED_PTCR_RESULT             0x2c
> +#define ASPEED_PTCR_INTR_CTRL          0x30
> +#define ASPEED_PTCR_INTR_STS           0x34
> +#define ASPEED_PTCR_TYPEM_LIMIT                0x38
> +#define ASPEED_PTCR_TYPEN_LIMIT                0x3C
> +#define ASPEED_PTCR_CTRL_EXT           0x40
> +#define ASPEED_PTCR_CLK_CTRL_EXT       0x44
> +#define ASPEED_PTCR_DUTY2_CTRL         0x48
> +#define ASPEED_PTCR_DUTY3_CTRL         0x4c
> +#define ASPEED_PTCR_TYPEO_CTRL         0x50
> +#define ASPEED_PTCR_TYPEO_CTRL1                0x54
> +#define ASPEED_PTCR_TACH_SOURCE_EXT    0x60
> +#define ASPEED_PTCR_TYPEO_LIMIT                0x78
> +
> +/* ASPEED_PTCR_CTRL : 0x00 - General Control Register */
> +#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART1   15
> +#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART2   6
> +#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_MASK    (BIT(7) | BIT(15))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART1   14
> +#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART2   5
> +#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_MASK    (BIT(6) | BIT(14))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART1   13
> +#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART2   4
> +#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_MASK    (BIT(5) | BIT(13))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1   12
> +#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2   3
> +#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK    (BIT(4) | BIT(12))
> +
> +#define        ASPEED_PTCR_CTRL_FAN_NUM_EN(x)  BIT(16 + x)
> +
> +#define        ASPEED_PTCR_CTRL_PWMD_EN        BIT(11)
> +#define        ASPEED_PTCR_CTRL_PWMC_EN        BIT(10)
> +#define        ASPEED_PTCR_CTRL_PWMB_EN        BIT(9)
> +#define        ASPEED_PTCR_CTRL_PWMA_EN        BIT(8)
> +
> +#define        ASPEED_PTCR_CTRL_CLK_SRC        BIT(1)
> +#define        ASPEED_PTCR_CTRL_CLK_EN         BIT(0)
> +
> +/* ASPEED_PTCR_CLK_CTRL : 0x04 - Clock Control Register */
> +/* TYPE N */
> +#define ASPEED_PTCR_CLK_CTRL_TYPEN_MASK                GENMASK(31, 16)
> +#define ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT                24
> +#define ASPEED_PTCR_CLK_CTRL_TYPEN_H           20
> +#define ASPEED_PTCR_CLK_CTRL_TYPEN_L           16
> +/* TYPE M */
> +#define ASPEED_PTCR_CLK_CTRL_TYPEM_MASK         GENMASK(15, 0)
> +#define ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT                8
> +#define ASPEED_PTCR_CLK_CTRL_TYPEM_H           4
> +#define ASPEED_PTCR_CLK_CTRL_TYPEM_L           0
> +
> +/*
> + * ASPEED_PTCR_DUTY_CTRL/1/2/3 : 0x08/0x0C/0x48/0x4C - PWM-FAN duty cont=
rol
> + * 0/1/2/3 register
> + */
> +#define DUTY_CTRL_PWM2_FALL_POINT      24
> +#define DUTY_CTRL_PWM2_RISE_POINT      16
> +#define DUTY_CTRL_PWM2_RISE_FALL_MASK  GENMASK(31, 16)
> +#define DUTY_CTRL_PWM1_FALL_POINT      8
> +#define DUTY_CTRL_PWM1_RISE_POINT      0
> +#define DUTY_CTRL_PWM1_RISE_FALL_MASK   GENMASK(15, 0)
> +
> +/* ASPEED_PTCR_TYPEM_CTRL : 0x10/0x18/0x50 - Type M/N/O Ctrl 0 Register =
*/
> +#define TYPE_CTRL_FAN_MASK             (GENMASK(5, 1) | GENMASK(31, 16))
> +#define TYPE_CTRL_FAN1_MASK            GENMASK(31, 0)
> +#define TYPE_CTRL_FAN_PERIOD           16
> +#define TYPE_CTRL_FAN_MODE             4
> +#define TYPE_CTRL_FAN_DIVISION         1
> +#define TYPE_CTRL_FAN_TYPE_EN          1
> +
> +/* ASPEED_PTCR_TACH_SOURCE : 0x20/0x60 - Tach Source Register */
> +/* bit [0,1] at 0x20, bit [2] at 0x60 */
> +#define TACH_PWM_SOURCE_BIT01(x)       (x * 2)
> +#define TACH_PWM_SOURCE_BIT2(x)                (x * 2)
> +#define TACH_PWM_SOURCE_MASK_BIT01(x)  (0x3 << (x * 2))
> +#define TACH_PWM_SOURCE_MASK_BIT2(x)   BIT(x * 2)
> +
> +/* ASPEED_PTCR_RESULT : 0x2c - Result Register */
> +#define RESULT_STATUS_MASK             BIT(31)
> +#define RESULT_VALUE_MASK              0xfffff
> +
> +/* ASPEED_PTCR_CTRL_EXT : 0x40 - General Control Extension #1 Register *=
/
> +#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART1   15
> +#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART2   6
> +#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_MASK    (BIT(7) | BIT(15))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART1   14
> +#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART2   5
> +#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_MASK    (BIT(6) | BIT(14))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART1   13
> +#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART2   4
> +#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_MASK    (BIT(5) | BIT(13))
> +
> +#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART1   12
> +#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART2   3
> +#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_MASK    (BIT(4) | BIT(12))
> +
> +#define        ASPEED_PTCR_CTRL_PWMH_EN        BIT(11)
> +#define        ASPEED_PTCR_CTRL_PWMG_EN        BIT(10)
> +#define        ASPEED_PTCR_CTRL_PWMF_EN        BIT(9)
> +#define        ASPEED_PTCR_CTRL_PWME_EN        BIT(8)
> +
> +/* ASPEED_PTCR_CLK_EXT_CTRL : 0x44 - Clock Control Extension #1 Register=
 */
> +/* TYPE O */
> +#define ASPEED_PTCR_CLK_CTRL_TYPEO_MASK         GENMASK(15, 0)
> +#define ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT                8
> +#define ASPEED_PTCR_CLK_CTRL_TYPEO_H           4
> +#define ASPEED_PTCR_CLK_CTRL_TYPEO_L           0
> +
> +#define PWM_MAX 255
> +
> +struct aspeed_pwm_tacho_regmap {
> +       void __iomem *regs;
> +};
> +
> +struct aspeed_pwm_tacho_data {
> +       struct regmap *regmap;
> +       unsigned long clk_freq;
> +       bool pwm_present[8];
> +       bool fan_present[16];
> +       u8 type_pwm_clock_unit[3];
> +       u8 type_pwm_clock_division_h[3];
> +       u8 type_pwm_clock_division_l[3];
> +       u8 type_fan_tach_clock_division[3];
> +       u16 type_fan_tach_unit[3];
> +       u8 pwm_port_type[8];
> +       u8 pwm_port_fan_ctrl[8];
> +       u8 fan_tach_ch_source[16];
> +       const struct attribute_group *groups[2];
> +};
> +
> +enum type { TYPEM, TYPEN, TYPEO };
> +
> +struct type_params {
> +       u32 l_value;
> +       u32 h_value;
> +       u32 unit_value;
> +       u32 clk_ctrl_mask;
> +       u32 clk_ctrl_reg;
> +       u32 ctrl_reg;
> +       u32 ctrl_reg1;
> +};
> +
> +static const struct type_params type_params[] =3D {
> +       [TYPEM] =3D {
> +               .l_value =3D ASPEED_PTCR_CLK_CTRL_TYPEM_L,
> +               .h_value =3D ASPEED_PTCR_CLK_CTRL_TYPEM_H,
> +               .unit_value =3D ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT,
> +               .clk_ctrl_mask =3D ASPEED_PTCR_CLK_CTRL_TYPEM_MASK,
> +               .clk_ctrl_reg =3D ASPEED_PTCR_CLK_CTRL,
> +               .ctrl_reg =3D ASPEED_PTCR_TYPEM_CTRL,
> +               .ctrl_reg1 =3D ASPEED_PTCR_TYPEM_CTRL1,
> +       },
> +       [TYPEN] =3D {
> +               .l_value =3D ASPEED_PTCR_CLK_CTRL_TYPEN_L,
> +               .h_value =3D ASPEED_PTCR_CLK_CTRL_TYPEN_H,
> +               .unit_value =3D ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT,
> +               .clk_ctrl_mask =3D ASPEED_PTCR_CLK_CTRL_TYPEN_MASK,
> +               .clk_ctrl_reg =3D ASPEED_PTCR_CLK_CTRL,
> +               .ctrl_reg =3D ASPEED_PTCR_TYPEN_CTRL,
> +               .ctrl_reg1 =3D ASPEED_PTCR_TYPEN_CTRL1,
> +       },
> +       [TYPEO] =3D {
> +               .l_value =3D ASPEED_PTCR_CLK_CTRL_TYPEO_L,
> +               .h_value =3D ASPEED_PTCR_CLK_CTRL_TYPEO_H,
> +               .unit_value =3D ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT,
> +               .clk_ctrl_mask =3D ASPEED_PTCR_CLK_CTRL_TYPEO_MASK,
> +               .clk_ctrl_reg =3D ASPEED_PTCR_CLK_CTRL_EXT,
> +               .ctrl_reg =3D ASPEED_PTCR_TYPEO_CTRL,
> +               .ctrl_reg1 =3D ASPEED_PTCR_TYPEO_CTRL1,
> +       }
> +};
> +
> +enum pwm_port { PWMA, PWMB, PWMC, PWMD, PWME, PWMF, PWMG, PWMH };
> +
> +struct pwm_port_params {
> +       u32 pwm_en;
> +       u32 ctrl_reg;
> +       u32 type_part1;
> +       u32 type_part2;
> +       u32 type_mask;
> +       u32 duty_ctrl_rise_point;
> +       u32 duty_ctrl_fall_point;
> +       u32 duty_ctrl_reg;
> +       u32 duty_ctrl_rise_fall_mask;
> +};
> +
> +static const struct pwm_port_params pwm_port_params[] =3D {
> +       [PWMA] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMA_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM1_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM1_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY0_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM1_RISE_FALL_MA=
SK,
> +       },
> +       [PWMB] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMB_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMB_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM2_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM2_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY0_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM2_RISE_FALL_MA=
SK,
> +       },
> +       [PWMC] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMC_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMC_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM1_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM1_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY1_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM1_RISE_FALL_MA=
SK,
> +       },
> +       [PWMD] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMD_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMD_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM2_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM2_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY1_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM2_RISE_FALL_MA=
SK,
> +       },
> +       [PWME] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWME_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL_EXT,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWME_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM1_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM1_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY2_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM1_RISE_FALL_MA=
SK,
> +       },
> +       [PWMF] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMF_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL_EXT,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMF_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM2_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM2_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY2_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM2_RISE_FALL_MA=
SK,
> +       },
> +       [PWMG] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMG_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL_EXT,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMG_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM1_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM1_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY3_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM1_RISE_FALL_MA=
SK,
> +       },
> +       [PWMH] =3D {
> +               .pwm_en =3D ASPEED_PTCR_CTRL_PWMH_EN,
> +               .ctrl_reg =3D ASPEED_PTCR_CTRL_EXT,
> +               .type_part1 =3D ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART1,
> +               .type_part2 =3D ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART2,
> +               .type_mask =3D ASPEED_PTCR_CTRL_SET_PWMH_TYPE_MASK,
> +               .duty_ctrl_rise_point =3D DUTY_CTRL_PWM2_RISE_POINT,
> +               .duty_ctrl_fall_point =3D DUTY_CTRL_PWM2_FALL_POINT,
> +               .duty_ctrl_reg =3D ASPEED_PTCR_DUTY3_CTRL,
> +               .duty_ctrl_rise_fall_mask =3D DUTY_CTRL_PWM2_RISE_FALL_MA=
SK,
> +       }
> +};
> +
> +static int regmap_aspeed_pwm_tacho_reg_write(void *context, unsigned int=
 reg,
> +                                            unsigned int val)
> +{
> +       struct aspeed_pwm_tacho_regmap *hregmap =3D context;
> +
> +       writel(val, hregmap->regs + reg);
> +       return 0;
> +}
> +
> +static int regmap_aspeed_pwm_tacho_reg_read(void *context, unsigned int =
reg,
> +                                           unsigned int *val)
> +{
> +       struct aspeed_pwm_tacho_regmap *hregmap =3D context;
> +
> +       *val =3D readl(hregmap->regs + reg);
> +       return 0;
> +}
> +
> +static const struct regmap_config aspeed_pwm_tacho_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .max_register =3D ASPEED_PTCR_TYPEO_LIMIT,
> +       .reg_write =3D regmap_aspeed_pwm_tacho_reg_write,
> +       .reg_read =3D regmap_aspeed_pwm_tacho_reg_read,
> +       .fast_io =3D true,
> +};
> +
> +static void aspeed_set_clock_enable(struct regmap *regmap, bool val)
> +{
> +       regmap_update_bits(regmap, ASPEED_PTCR_CTRL,
> +                          ASPEED_PTCR_CTRL_CLK_EN,
> +                          val ? ASPEED_PTCR_CTRL_CLK_EN : 0);
> +}
> +
> +static void aspeed_set_clock_source(struct regmap *regmap, int val)
> +{
> +       regmap_update_bits(regmap, ASPEED_PTCR_CTRL,
> +                          ASPEED_PTCR_CTRL_CLK_SRC,
> +                          val ? ASPEED_PTCR_CTRL_CLK_SRC : 0);
> +}
> +
> +static void aspeed_set_pwm_clock_values(struct regmap *regmap, u8 type,
> +                                       u8 div_high, u8 div_low, u8 unit)
> +{
> +
> +       u32 reg_value =3D ((div_high << type_params[type].h_value) |
> +                        (div_low << type_params[type].l_value) |
> +                        (unit << type_params[type].unit_value));
> +
> +       regmap_update_bits(regmap, type_params[type].clk_ctrl_reg,
> +                          type_params[type].clk_ctrl_mask, reg_value);
> +}
> +
> +static void aspeed_set_pwm_port_enable(struct regmap *regmap, u8 pwm_por=
t,
> +                                      bool enable)
> +{
> +       regmap_update_bits(regmap, pwm_port_params[pwm_port].ctrl_reg,
> +                          pwm_port_params[pwm_port].pwm_en,
> +                          enable ? pwm_port_params[pwm_port].pwm_en : 0)=
;
> +}
> +
> +static void aspeed_set_pwm_port_type(struct regmap *regmap,
> +                                    u8 pwm_port, u8 type)
> +{
> +       u32 reg_value =3D (type & 0x1) << pwm_port_params[pwm_port].type_=
part1;
> +
> +       reg_value |=3D (type & 0x2) << pwm_port_params[pwm_port].type_par=
t2;
> +
> +       regmap_update_bits(regmap, pwm_port_params[pwm_port].ctrl_reg,
> +                          pwm_port_params[pwm_port].type_mask, reg_value=
);
> +}
> +
> +static void aspeed_set_pwm_port_duty_rising_falling(struct regmap *regma=
p,
> +                                                   u8 pwm_port, u8 risin=
g,
> +                                                   u8 falling)
> +{
> +       u32 reg_value =3D (rising <<
> +                        pwm_port_params[pwm_port].duty_ctrl_rise_point);
> +       reg_value |=3D (falling <<
> +                     pwm_port_params[pwm_port].duty_ctrl_fall_point);
> +
> +       regmap_update_bits(regmap, pwm_port_params[pwm_port].duty_ctrl_re=
g,
> +                          pwm_port_params[pwm_port].duty_ctrl_rise_fall_=
mask,
> +                          reg_value);
> +}
> +
> +static void aspeed_set_tacho_type_enable(struct regmap *regmap, u8 type,
> +                                        bool enable)
> +{
> +       regmap_update_bits(regmap, type_params[type].ctrl_reg,
> +                          TYPE_CTRL_FAN_TYPE_EN,
> +                          enable ? TYPE_CTRL_FAN_TYPE_EN : 0);
> +}
> +
> +static void aspeed_set_tacho_type_values(struct regmap *regmap, u8 type,
> +                                        u8 mode, u16 unit, u8 division)
> +{
> +       u32 reg_value =3D ((mode << TYPE_CTRL_FAN_MODE) |
> +                        (unit << TYPE_CTRL_FAN_PERIOD) |
> +                        (division << TYPE_CTRL_FAN_DIVISION));
> +
> +       regmap_update_bits(regmap, type_params[type].ctrl_reg,
> +                          TYPE_CTRL_FAN_MASK, reg_value);
> +       regmap_update_bits(regmap, type_params[type].ctrl_reg1,
> +                          TYPE_CTRL_FAN1_MASK, unit << 16);
> +}
> +
> +static void aspeed_set_fan_tach_ch_enable(struct regmap *regmap, u8 fan_=
tach_ch,
> +                                         bool enable)
> +{
> +       regmap_update_bits(regmap, ASPEED_PTCR_CTRL,
> +                          ASPEED_PTCR_CTRL_FAN_NUM_EN(fan_tach_ch),
> +                          enable ?
> +                          ASPEED_PTCR_CTRL_FAN_NUM_EN(fan_tach_ch) : 0);
> +}
> +
> +static void aspeed_set_fan_tach_ch_source(struct regmap *regmap, u8 fan_=
tach_ch,
> +                                         u8 fan_tach_ch_source)
> +{
> +       u32 reg_value1 =3D ((fan_tach_ch_source & 0x3) <<
> +                         TACH_PWM_SOURCE_BIT01(fan_tach_ch));
> +       u32 reg_value2 =3D (((fan_tach_ch_source & 0x4) >> 2) <<
> +                         TACH_PWM_SOURCE_BIT2(fan_tach_ch));
> +
> +       regmap_update_bits(regmap, ASPEED_PTCR_TACH_SOURCE,
> +                          TACH_PWM_SOURCE_MASK_BIT01(fan_tach_ch),
> +                          reg_value1);
> +
> +       regmap_update_bits(regmap, ASPEED_PTCR_TACH_SOURCE_EXT,
> +                          TACH_PWM_SOURCE_MASK_BIT2(fan_tach_ch),
> +                          reg_value2);
> +}
> +
> +static void aspeed_set_pwm_port_fan_ctrl(struct aspeed_pwm_tacho_data *p=
riv,
> +                                        u8 index, u8 fan_ctrl)
> +{
> +       u16 period, dc_time_on;
> +
> +       period =3D priv->type_pwm_clock_unit[priv->pwm_port_type[index]];
> +       period +=3D 1;
> +       dc_time_on =3D (fan_ctrl * period) / PWM_MAX;
> +
> +       if (dc_time_on =3D=3D 0) {
> +               aspeed_set_pwm_port_enable(priv->regmap, index, false);
> +       } else {
> +               if (dc_time_on =3D=3D period)
> +                       dc_time_on =3D 0;
> +
> +               aspeed_set_pwm_port_duty_rising_falling(priv->regmap, ind=
ex, 0,
> +                                                       dc_time_on);
> +               aspeed_set_pwm_port_enable(priv->regmap, index, true);
> +       }
> +}
> +
> +static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho=
_data
> +                                                *priv, u8 type)
> +{
> +       u32 clk;
> +       u16 tacho_unit;
> +       u8 clk_unit, div_h, div_l, tacho_div;
> +
> +       clk =3D priv->clk_freq;
> +       clk_unit =3D priv->type_pwm_clock_unit[type];
> +       div_h =3D priv->type_pwm_clock_division_h[type];
> +       div_h =3D 0x1 << div_h;
> +       div_l =3D priv->type_pwm_clock_division_l[type];
> +       if (div_l =3D=3D 0)
> +               div_l =3D 1;
> +       else
> +               div_l =3D div_l * 2;
> +
> +       tacho_unit =3D priv->type_fan_tach_unit[type];
> +       tacho_div =3D priv->type_fan_tach_clock_division[type];
> +
> +       tacho_div =3D 0x4 << (tacho_div * 2);
> +       return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
> +}
> +
> +static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv=
,
> +                                     u8 fan_tach_ch)
> +{
> +       u32 raw_data, rpm, tach_div, clk_source, timeout =3D 0, sec, val;
> +       u8 fan_tach_ch_source, type;
> +
> +       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
> +       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 << fan_tach_c=
h);
> +
> +       fan_tach_ch_source =3D priv->fan_tach_ch_source[fan_tach_ch];
> +       type =3D priv->pwm_port_type[fan_tach_ch_source];
> +
> +       sec =3D (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type)=
);
> +
> +       msleep(sec);
> +
> +       regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> +       while (!(val & RESULT_STATUS_MASK)) {
> +               timeout++;
> +               if (timeout > 1)
> +                       return 0;
> +               msleep(sec);
> +       }
> +
> +       regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> +       raw_data =3D val & RESULT_VALUE_MASK;
> +       tach_div =3D priv->type_fan_tach_clock_division[type];
> +
> +       tach_div =3D 0x4 << (tach_div * 2);
> +       clk_source =3D priv->clk_freq;
> +
> +       if (raw_data =3D=3D 0)
> +               return 0;
> +       else
> +               return (clk_source * 60) / (2 * raw_data * tach_div);
> +}
> +
> +static ssize_t set_pwm(struct device *dev, struct device_attribute *attr=
,
> +                      const char *buf, size_t count)
> +{
> +       struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_att=
r(attr);
> +       int index =3D sensor_attr->index;
> +       int ret;
> +       struct aspeed_pwm_tacho_data *priv =3D dev_get_drvdata(dev);
> +       long fan_ctrl;
> +       u32 val;
> +       int i;
> +
> +       ret =3D kstrtol(buf, 10, &fan_ctrl);
> +       if (ret !=3D 0)
> +               return ret;
> +
> +       if (fan_ctrl < 0 || fan_ctrl > PWM_MAX)
> +               return -EINVAL;
> +
> +       if (priv->pwm_port_fan_ctrl[index] =3D=3D fan_ctrl)
> +               return count;
> +
> +       priv->pwm_port_fan_ctrl[index] =3D fan_ctrl;
> +       aspeed_set_pwm_port_fan_ctrl(priv, index, fan_ctrl);
> +
> +       return count;
> +}
> +
> +static ssize_t show_pwm(struct device *dev, struct device_attribute *att=
r,
> +                       char *buf)
> +{
> +       struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_att=
r(attr);
> +       int index =3D sensor_attr->index;
> +       struct aspeed_pwm_tacho_data *priv =3D dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%u\n", priv->pwm_port_fan_ctrl[index]);
> +}
> +
> +static ssize_t show_rpm(struct device *dev, struct device_attribute *att=
r,
> +                       char *buf)
> +{
> +       struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_att=
r(attr);
> +       int index =3D sensor_attr->index;
> +       u32 rpm;
> +       struct aspeed_pwm_tacho_data *priv =3D dev_get_drvdata(dev);
> +
> +       rpm =3D aspeed_get_fan_tach_ch_rpm(priv, index);
> +
> +       return sprintf(buf, "%u\n", rpm);
> +}
> +
> +static umode_t pwm_is_visible(struct kobject *kobj,
> +                             struct attribute *a, int index)
> +{
> +       struct device *dev =3D container_of(kobj, struct device, kobj);
> +       struct aspeed_pwm_tacho_data *priv =3D dev_get_drvdata(dev);
> +
> +       if (!priv->pwm_present[index])
> +               return 0;
> +       return a->mode;
> +}
> +
> +static umode_t fan_dev_is_visible(struct kobject *kobj,
> +                                 struct attribute *a, int index)
> +{
> +       struct device *dev =3D container_of(kobj, struct device, kobj);
> +       struct aspeed_pwm_tacho_data *priv =3D dev_get_drvdata(dev);
> +
> +       if (!priv->fan_present[index])
> +               return 0;
> +       return a->mode;
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm0, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 0);
> +static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 1);
> +static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 2);
> +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 3);
> +static SENSOR_DEVICE_ATTR(pwm4, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 4);
> +static SENSOR_DEVICE_ATTR(pwm5, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 5);
> +static SENSOR_DEVICE_ATTR(pwm6, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 6);
> +static SENSOR_DEVICE_ATTR(pwm7, S_IRUGO | S_IWUSR,
> +                       show_pwm, set_pwm, 7);
> +
> +static struct attribute *pwm_dev_attrs[] =3D {
> +       &sensor_dev_attr_pwm0.dev_attr.attr,
> +       &sensor_dev_attr_pwm1.dev_attr.attr,
> +       &sensor_dev_attr_pwm2.dev_attr.attr,
> +       &sensor_dev_attr_pwm3.dev_attr.attr,
> +       &sensor_dev_attr_pwm4.dev_attr.attr,
> +       &sensor_dev_attr_pwm5.dev_attr.attr,
> +       &sensor_dev_attr_pwm6.dev_attr.attr,
> +       &sensor_dev_attr_pwm7.dev_attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group pwm_dev_group =3D {
> +       .attrs =3D pwm_dev_attrs,
> +       .is_visible =3D pwm_is_visible,
> +};
> +
> +static SENSOR_DEVICE_ATTR(fan0_input, S_IRUGO,
> +               show_rpm, NULL, 0);
> +static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO,
> +               show_rpm, NULL, 1);
> +static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO,
> +               show_rpm, NULL, 2);
> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO,
> +               show_rpm, NULL, 3);
> +static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO,
> +               show_rpm, NULL, 4);
> +static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO,
> +               show_rpm, NULL, 5);
> +static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO,
> +               show_rpm, NULL, 6);
> +static SENSOR_DEVICE_ATTR(fan7_input, S_IRUGO,
> +               show_rpm, NULL, 7);
> +static SENSOR_DEVICE_ATTR(fan8_input, S_IRUGO,
> +               show_rpm, NULL, 8);
> +static SENSOR_DEVICE_ATTR(fan9_input, S_IRUGO,
> +               show_rpm, NULL, 9);
> +static SENSOR_DEVICE_ATTR(fan10_input, S_IRUGO,
> +               show_rpm, NULL, 10);
> +static SENSOR_DEVICE_ATTR(fan11_input, S_IRUGO,
> +               show_rpm, NULL, 11);
> +static SENSOR_DEVICE_ATTR(fan12_input, S_IRUGO,
> +               show_rpm, NULL, 12);
> +static SENSOR_DEVICE_ATTR(fan13_input, S_IRUGO,
> +               show_rpm, NULL, 13);
> +static SENSOR_DEVICE_ATTR(fan14_input, S_IRUGO,
> +               show_rpm, NULL, 14);
> +static SENSOR_DEVICE_ATTR(fan15_input, S_IRUGO,
> +               show_rpm, NULL, 15);
> +
> +static struct attribute *fan_dev_attrs[] =3D {
> +       &sensor_dev_attr_fan0_input.dev_attr.attr,
> +       &sensor_dev_attr_fan1_input.dev_attr.attr,
> +       &sensor_dev_attr_fan2_input.dev_attr.attr,
> +       &sensor_dev_attr_fan3_input.dev_attr.attr,
> +       &sensor_dev_attr_fan4_input.dev_attr.attr,
> +       &sensor_dev_attr_fan5_input.dev_attr.attr,
> +       &sensor_dev_attr_fan6_input.dev_attr.attr,
> +       &sensor_dev_attr_fan7_input.dev_attr.attr,
> +       &sensor_dev_attr_fan8_input.dev_attr.attr,
> +       &sensor_dev_attr_fan9_input.dev_attr.attr,
> +       &sensor_dev_attr_fan10_input.dev_attr.attr,
> +       &sensor_dev_attr_fan11_input.dev_attr.attr,
> +       &sensor_dev_attr_fan12_input.dev_attr.attr,
> +       &sensor_dev_attr_fan13_input.dev_attr.attr,
> +       &sensor_dev_attr_fan14_input.dev_attr.attr,
> +       &sensor_dev_attr_fan15_input.dev_attr.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group fan_dev_group =3D {
> +       .attrs =3D fan_dev_attrs,
> +       .is_visible =3D fan_dev_is_visible,
> +};
> +
> +/*
> + * If the clock type is type M then :
> + * The PWM frequency =3D 24MHz / (type M clock division L bit *
> + * type M clock division H bit * (type M PWM period bit + 1))
> + */
> +static int aspeed_create_type(struct device_node *child,
> +                             struct aspeed_pwm_tacho_data *priv)
> +{
> +       u8 period, div_l, div_h, type, mode, div;
> +       bool enable;
> +       u16 unit;
> +       int err;
> +
> +       err =3D of_property_read_u8(child, "type", &type);
> +       if (err)
> +               return err;
> +       err =3D of_property_read_u8(child, "pwm-period", &period);
> +       if (err)
> +               return err;
> +       err =3D of_property_read_u8(child, "pwm-clock-division-h", &div_h=
);
> +       if (err)
> +               return err;
> +       err =3D of_property_read_u8(child, "pwm-clock-division-l", &div_l=
);
> +       if (err)
> +               return err;
> +       priv->type_pwm_clock_division_h[type] =3D div_h;
> +       priv->type_pwm_clock_division_l[type] =3D div_l;
> +       priv->type_pwm_clock_unit[type] =3D period;
> +       aspeed_set_pwm_clock_values(priv->regmap, type, div_h, div_l, per=
iod);
> +
> +       enable =3D of_property_read_bool(child, "fan-tach-type-enable");
> +       if (!enable)
> +               return -EINVAL;
> +       aspeed_set_tacho_type_enable(priv->regmap, type, enable);
> +
> +       err =3D of_property_read_u8(child, "fan-tach-clock-division", &di=
v);
> +       if (err)
> +               return err;
> +       priv->type_fan_tach_clock_division[type] =3D div;
> +
> +       err =3D of_property_read_u8(child, "fan-tach-mode-selection", &mo=
de);
> +       if (err)
> +               return err;
> +
> +       err =3D of_property_read_u16(child, "fan-tach-period", &unit);
> +       if (err)
> +               return err;
> +       priv->type_fan_tach_unit[type] =3D unit;
> +       aspeed_set_tacho_type_values(priv->regmap, type, mode, unit, div)=
;
> +
> +       return 0;
> +}
> +
> +static int aspeed_create_pwm_port(struct device_node *child,
> +                                 struct aspeed_pwm_tacho_data *priv)
> +{
> +       u8 val, index;
> +       int err;
> +
> +       err =3D of_property_read_u8(child, "pwm-port", &val);
> +       if (err)
> +               return err;
> +       aspeed_set_pwm_port_enable(priv->regmap, val, true);
> +       priv->pwm_present[val] =3D true;
> +       index =3D val;
> +
> +       err =3D of_property_read_u8(child, "type", &val);
> +       if (err)
> +               return err;
> +       priv->pwm_port_type[index] =3D val;
> +       aspeed_set_pwm_port_type(priv->regmap, index, val);
> +
> +       err =3D of_property_read_u8(child, "fan-ctrl", &val);
> +       if (err)
> +               return err;
> +       priv->pwm_port_fan_ctrl[index] =3D val;
> +       aspeed_set_pwm_port_fan_ctrl(priv, index, val);
> +
> +       return 0;
> +}
> +
> +static int aspeed_create_fan_tach_channel(struct device *dev,
> +                                         struct device_node *child,
> +                                         struct aspeed_pwm_tacho_data *p=
riv)
> +{
> +       u8 val, index;
> +       int err;
> +       struct gpio_desc *fan_ctrl =3D devm_gpiod_get(dev, "fanctrl", GPI=
OD_IN);
> +
> +       err =3D of_property_read_u8(child, "fan-tach", &val);
> +       if (err)
> +               return err;
> +       aspeed_set_fan_tach_ch_enable(priv->regmap, val, true);
> +       index =3D val;
> +       priv->fan_present[index] =3D true;
> +       err =3D of_property_read_u8(child, "pwm-source", &val);
> +       if (err)
> +               return err;
> +       priv->fan_tach_ch_source[index] =3D val;
> +       aspeed_set_fan_tach_ch_source(priv->regmap, index, val);
> +
> +       return 0;
> +}
> +
> +static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np, *type_np, *pwm_np, *fan_tach_np, *child;
> +       struct aspeed_pwm_tacho_data *priv;
> +       struct aspeed_pwm_tacho_regmap *hregmap;
> +       struct resource *res;
> +       struct device *hwmon;
> +       struct clk *clk;
> +       u32 *val;
> +       int ret;
> +       unsigned int i;
> +
> +       np =3D dev->of_node;
> +
> +       hregmap =3D devm_kzalloc(dev, sizeof(*hregmap), GFP_KERNEL);
> +       if (!hregmap)
> +               return -ENOMEM;
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENOENT;
> +       hregmap->regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(hregmap->regs))
> +               return PTR_ERR(hregmap->regs);
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       priv->regmap =3D devm_regmap_init(dev, NULL, hregmap,
> +                       &aspeed_pwm_tacho_regmap_config);
> +       if (IS_ERR(priv->regmap))
> +               return PTR_ERR(priv->regmap);
> +       regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
> +       regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
> +
> +       clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(clk))
> +               return -ENODEV;
> +       priv->clk_freq =3D clk_get_rate(clk);
> +       aspeed_set_clock_enable(priv->regmap, true);
> +       aspeed_set_clock_source(priv->regmap, 0);
> +       type_np =3D of_get_child_by_name(np, "type-values");
> +       if (!type_np)
> +               return -EINVAL;
> +       for_each_child_of_node(type_np, child) {
> +               ret =3D aspeed_create_type(child, priv);
> +               if (ret)
> +                       return ret;
> +       }
> +       of_node_put(type_np);
> +       pwm_np =3D of_get_child_by_name(np, "pwm-port");
> +       if (!pwm_np)
> +               return -EINVAL;
> +       for_each_child_of_node(pwm_np, child) {
> +               ret =3D aspeed_create_pwm_port(child, priv);
> +               if (ret)
> +                       return ret;
> +       }
> +       of_node_put(pwm_np);
> +       fan_tach_np =3D of_get_child_by_name(np, "fan-tach-channel");
> +       if (!fan_tach_np)
> +               return -EINVAL;
> +       for_each_child_of_node(fan_tach_np, child) {
> +               ret =3D aspeed_create_fan_tach_channel(dev, child, priv);
> +               if (ret)
> +                       return ret;
> +       }
> +       of_node_put(fan_tach_np);
> +       of_node_put(np);
> +       priv->groups[0] =3D &pwm_dev_group;
> +       priv->groups[1] =3D &fan_dev_group;
> +       hwmon =3D devm_hwmon_device_register_with_groups(dev,
> +                                                      "aspeed_pwm_tacho"=
,
> +                                                      priv, priv->groups=
);
> +
> +       return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static const struct of_device_id of_pwm_tacho_match_table[] =3D {
> +       { .compatible =3D "aspeed,aspeed2400-pwm-tacho", },
> +       { .compatible =3D "aspeed,aspeed2500-pwm-tacho", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
> +
> +static struct platform_driver aspeed_pwm_tacho_driver =3D {
> +       .probe          =3D aspeed_pwm_tacho_probe,
> +       .driver         =3D {
> +               .name   =3D "aspeed_pwm_tacho",
> +               .of_match_table =3D of_pwm_tacho_match_table,
> +       },
> +};
> +
> +module_platform_driver(aspeed_pwm_tacho_driver);
> +
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com=
>");
> +MODULE_DESCRIPTION("ASPEED PWM and Fan Tacho device driver");
> +MODULE_LICENSE("GPL");
> --
> 2.11.0.483.g087da7b7c-goog
>
