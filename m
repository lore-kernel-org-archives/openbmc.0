Return-Path: <xow@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVdYb2pffzDrp7
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 10:36:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=EgV+Ydph; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id v123so66861621qkh.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=4tC5SAXcvQBjMELgydF6jryl4pX09gKTqeQG6wdEdBY=;
 b=EgV+YdphuhqeJR8lH/8gihHcp8TQKmg1NZ5JLIe16PXOcB7bPXVKbQSRYh452pwbIH
 S6+mQ+fp2V/W3+U48hWipeS3vYow33xzqOFd05lxol636rmzqYtRnnSQObR513UrwgjD
 CS0OzSfJULCh1W+I4ktGCQfw4UY8i3mx4R9LNQVwr0crqEv09JSwcrLdG0gklYbRyV8Y
 8hjhz8xBn23ss5A3XLYiPcVzZuPovUAKeKAYkF/UAccGxu/f/3bVxGwmNZOv84a7+0Fb
 LGYzUDLHpLBZMmcwQ/X8zEM2WCjE5Ru8rx/PUPmmVn/Z5VO7Ol0mQAuIlHgmp7SIQNZX
 QMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=4tC5SAXcvQBjMELgydF6jryl4pX09gKTqeQG6wdEdBY=;
 b=i3onnSw2ChZcSjF0QDPKSRiXfo8s7Y332FdQcoW0mirDMlp5c5avur/wEOMvfb978b
 8XnM+QbTqnnEysC9G/YRkTL4M0QDpqYU0rmLOQIDosbCHuxZ0PoiZzl+4YiyzGQ2mruf
 MKskiAuGkVlshLdLPfXFVdW0QM0kJfdibK/wTYcgSP2uf5+/wDNIl4rrozE+eZtkhdCf
 fJdDYHYi5n2FIx3UXv/2p+DNuH5l42nUvLwV8J6grh88/BY6zqfXjj9On1Am+OD4FAHO
 m7K2K3Nv6pYxxAh6DXdRQ1vtVEt92I6cSuCNQ9RmX9RG/fW6KO5RJzPgm4qABARREoRu
 Q94Q==
X-Gm-Message-State: AE9vXwNUNWSImQ+6q0ZIFP2B6wjb2m8M4UDs+VpRh4nvhZHGGXJWTHBHjLyzBX/S603j/86c2ZcAdc7nsnnSurkg
X-Received: by 10.55.105.2 with SMTP id e2mr998451qkc.266.1473381392632; Thu,
 08 Sep 2016 17:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.39.34 with HTTP; Thu, 8 Sep 2016 17:36:32 -0700 (PDT)
In-Reply-To: <1472587644-73391-2-git-send-email-xow@google.com>
References: <1472587644-73391-1-git-send-email-xow@google.com>
 <1472587644-73391-2-git-send-email-xow@google.com>
From: Xo Wang <xow@google.com>
Date: Thu, 8 Sep 2016 17:36:32 -0700
Message-ID: <CAPH-5w4=GMWgpJNHZymEwkA4m7r0TSDcKejU420cxw31Hc4TqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Ingrasys Zaius BMC DTS
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 00:36:37 -0000

Ping.

One point I should bring up is that no aspeed,ast2500-smc compatible
driver exists yet.

xo

On Tue, Aug 30, 2016 at 1:07 PM, Xo Wang <xow@google.com> wrote:
> GPIO and LEDs coming later.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 210 +++++++++++++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 495ca3d..b9541c6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-firestone.dtb \
>         aspeed-bmc-opp-garrison.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
> +       aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> new file mode 100644
> index 0000000..4c4754b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -0,0 +1,210 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "Zaius BMC";
> +       compatible = "ingrasys,zaius-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       ahb {
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0xc4
> +                               0x20000000 0x04000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2500-fmc";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +                       };
> +               };
> +
> +               host_pnor: spi@1e630000 {
> +                       reg = < 0x1e630000 0xc4
> +                               0x30000000 0x04000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2500-smc";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +                               label = "pnor";
> +                       };
> +               };
> +
> +               data_pnor: spi@1e631000 {
> +                       reg = < 0x1e631000 0xc4
> +                               0x38000000 0x00800000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2500-smc";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +                       };
> +               };
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default>;
> +       use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c64";
> +               reg = <0x50>;
> +               pagesize = <32>;
> +       };
> +
> +       rtc@68 {
> +               compatible = "nxp,pcf8523";
> +               reg = <0x68>;
> +       };
> +
> +       /* Power sequencer UCD90160 PMBUS @64h
> +        * FRU AT24C64D @50h
> +        * RTC PCF8523 @68h
> +        * Clock buffer 9DBL04 @6dh
> +        */
> +};
> +
> +&i2c1 {
> +       status = "disabled";
> +
> +       /* MUX1 PCA9546A @71h
> +        *   PCIe 0
> +        *   PCIe 1
> +        *   PCIe 2
> +        *   TPM header
> +        */
> +};
> +
> +&i2c2 {
> +       status = "disabled";
> +
> +       /* OCP Mezz Connector A (OOB SMBUS) */
> +};
> +
> +&i2c3 {
> +       status = "disabled";
> +
> +       /* OCP Mezz Connector A (PCIe slot SMBUS) */
> +};
> +
> +&i2c4 {
> +       status = "disabled";
> +
> +       /* MUX1 PCA9546A @71h
> +        *   PCIe 3
> +        *   PCIe 4
> +        */
> +};
> +
> +
> +&i2c5 {
> +       status = "disabled";
> +
> +       /* CPU0 PRM 0.7V */
> +       /* CPU0 PRM 1.2V CH03 */
> +       /* CPU0 PRM 0.8V */
> +       /* CPU0 PRM 1.2V CH47 */
> +};
> +
> +&i2c6 {
> +       status = "disabled";
> +
> +       /* CPU1 PRM 0.7V */
> +       /* CPU1 PRM 1.2V CH03 */
> +       /* CPU1 PRM 0.8V */
> +       /* CPU1 PRM 1.2V CH47 */
> +};
> +
> +&i2c7 {
> +       status = "disabled";
> +
> +       /* MUX PCA9541A (other master: CPU0 PCIe 1)
> +        *   ADM1272 PMBUS @10h
> +        */
> +       /* 12V SMPS Q54SH12050NNDH @61h */
> +       /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> +       /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
> +       /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> +       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
> +       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
> +};
> +
> +&i2c8 {
> +       status = "disabled";
> +
> +       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
> +       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> +       /* CPU1 VR ISL68137 0.8V PMBUS @61h */
> +       /* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
> +       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
> +};
> +
> +
> +&i2c9 {
> +       status = "disabled";
> +
> +       /* Fan board */
> +};
> +
> +&i2c10 {
> +       status = "disabled";
> +};
> +
> +&i2c11 {
> +       status = "disabled";
> +
> +       /* GPU sideband */
> +};
> +
> +&i2c12 {
> +       status = "disabled";
> +};
> +
> +&i2c13 {
> +       status = "disabled";
> +
> +       /* MUX PI3USB102
> +        *   CPU0 debug
> +        *   CPU1 debug
> +        */
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> --
> 2.8.0.rc3.226.g39d4020
>
