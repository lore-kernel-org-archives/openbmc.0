Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgLcj378lzDslW
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 14:54:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pAy9n9xT; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 15so928559uai.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 21:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ntjZB4gVRt7Bamxczs7PR12JVo51Tdoj5CD8TEYAFbQ=;
 b=pAy9n9xTm/bZzqxD/Zz1trLQ32+tbwYNAObqLC68BFo4axd0QG47XTkGFOMqH1kTEO
 LqsB0ouASPvshwoU02aOWKRk/aN3MVgyRxIEkDOmDNktLiQz724Vlx59jXPUHdfJJmLj
 vUuXB5HKP6q/gUlL1EbWPMsnAqD7SNPqHklGixpy+b3QKiig61rJ2xX+uNsi6//tiSNH
 XphrhoUkcFanusMRQSVBaTAKxwcM5sHZQnVpgQu0WvVVvvBlAAXPeBNOP3OcL+qwVgkC
 o8msXtFDRWDRgaAIcR4YXE+dve2B0nhIOpiLuU2X41+aZTvsIozGIzdLnlIw8Et4Fkhw
 MQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ntjZB4gVRt7Bamxczs7PR12JVo51Tdoj5CD8TEYAFbQ=;
 b=Um3IqWb0KcaT5T/Zn84LxVZgAMKN8Yll8c9cpCdrNp865HpY/Txi/GbksFUFgmG5Ak
 55b82t49COFT386FCTjq/0OzPva8OU0lKp4oFtc9Quu+Tff/SzMKcXS37MU89BNL2bki
 NLUR5MxL9vHikZ3Ep3WfQEbkYRdHj7o/5SHj72oB488R7xPBudritIRNIVooz+2+i/iO
 ILsoxs6y5CeiIA4ujPKnKConHUfs3lrqfLTojQgD/7S75jby4ZsX3r5j+UnHinBO6Tdf
 J132740fGssnO6a7s+01+2ZSH5Q+QsLjajGZaIF9Sk5s+opQ1nemW2nRzJKzC/SHhgmU
 l1Dw==
X-Gm-Message-State: AA6/9RmNgJkbXZH6eI0xChi9mBCY0qUM+X6bc68xwssrVwQV4zTq3tMgPwVD5xIXZGOSeUK1kNih7IIpULeTfw==
X-Received: by 10.176.3.206 with SMTP id 72mr2518829uau.145.1474606465635;
 Thu, 22 Sep 2016 21:54:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 21:54:05 -0700 (PDT)
In-Reply-To: <1474590854-104677-2-git-send-email-xow@google.com>
References: <1474590854-104677-1-git-send-email-xow@google.com>
 <1474590854-104677-2-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 14:24:05 +0930
X-Google-Sender-Auth: LP95j1g1Y2OpoztzJCLNLC-YZPI
Message-ID: <CACPK8XdeaUNo3F1SxUH=VEip4n6O6svnTswaK88uXjmkyiLWeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add Ingrasys Zaius BMC DTS
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 04:54:30 -0000

On Fri, Sep 23, 2016 at 10:04 AM, Xo Wang <xow@google.com> wrote:
> Zaius is a POWER9 platform announced at OpenPOWER Summit 2016. This adds
> basic DTS support for its AST2500 BMC. This includes bringup stage
> hardware like flash, UART, and networking.
>
> Additional work is needed to enable GPIOs and route I2C through muxes.
>
> Signed-off-by: Xo Wang <xow@google.com>

Thanks, applied to dev-4.7 as 31491101bab1f11b01fd880d7d34dd36d26cf8fb.


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
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
