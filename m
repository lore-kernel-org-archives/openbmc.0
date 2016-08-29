Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sN4MJ4wg9zDrHp
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 18:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wulDc0FU; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 35so3344152uaj.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8DdrJoEZ/GZx/Oksz7TmK5XzHL930e1na8xDUXPyXKk=;
 b=wulDc0FUWY+TkzpDhMph43bGQ35r57Kp2pTJrFL797gBYbZAyA9gaGlr2HDO2IypUz
 Yv0RxSdLtEawQIdj0sfvQ90wEpHihq1IZA1HPmkFNDl8/yhZzpVpJhH8H91BX1pDU+XK
 TQaptYVyGGnqRs+xXYFA1IlskglxC+VHwd2olxKXlgrwfunn0pT7lTEDFtGpmF4Pr/sR
 9E6aoghvbX2N2ijWgQyzKlleZ2sXrI3z0iRn/4cuvUNrMxNfphdfP1EwRcUsbojsGJyd
 6WvctFBkXnn2yzKZFB1WvySEjm/EkzF0CGcccSJg7gWj96xvcxMV+f2iuhvTjU7vvCr0
 xFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8DdrJoEZ/GZx/Oksz7TmK5XzHL930e1na8xDUXPyXKk=;
 b=CTvj5UiQXkmLNH5BFjSWcUBQA7vc6R4WQxFt7r0b/VIi0W5bI7/pALVRHomIwTtWH7
 XB/F2ozEMHEbsOShBeytH1bPNXbDoDhbDI273WFs71F2zwViFhV4PEUPqPIcxaB6PCYC
 JDvsgBb4KeNKrhRYqH0ZNtxCI+y611gvD8xyz70mxBZYGmz7EHLE22JvhJHVMyfLnHZu
 wJJZrIIlaR7bpTfA17ezaBu6+1iBYyKsNXYpSCyslE889Im6WG2Ndp2l5plVreM+lzD2
 cNtAdW4rf11HQLZbYGu4eIdlnOf3PlfagFe/LMz05VNRlVh7rxlSi1nBxQNK8xbM+leK
 grqA==
X-Gm-Message-State: AE9vXwPiPt+iHCC4N3ihN9wXnua7idsBqdaWaqXN7nRgya9t4yAShze6Nzc3r40Nc1qtd0o9zNPeemFOoqcjqA==
X-Received: by 10.159.37.238 with SMTP id 101mr895209uaf.57.1472458794171;
 Mon, 29 Aug 2016 01:19:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Mon, 29 Aug 2016 01:19:33 -0700 (PDT)
In-Reply-To: <1471992220-3192885-1-git-send-email-mattconolly@fb.com>
References: <1471992220-3192885-1-git-send-email-mattconolly@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Aug 2016 17:49:33 +0930
X-Google-Sender-Auth: j2QEeytfd4g4W6uwAJhi7IE2U1U
Message-ID: <CACPK8XekvmaP9cxX0Gy2dscmvjr+bzVGBXA_wL4JCyGA4tV_Ng@mail.gmail.com>
Subject: Re: [PATCH v3] arm/dts/aspeed: Add minimal Facebook CMM BMC board
 based on AST2500
To: Matthew Conolly <mattconolly@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 29 Aug 2016 08:19:57 -0000

On Wed, Aug 24, 2016 at 8:13 AM, Matthew Conolly <mattconolly@fb.com> wrote:
> Minimal device tree for CMM bmc board to boot into a console over UART with some drivers functional.
>
> Signed-off-by: Matthew Conolly <mattconolly@fb.com>

LGTM. Applied to dev-4.7 as
https://github.com/openbmc/linux/commit/c0cc430995887f3e196961f6e7db65ed17cb29d0

Cheers,

Joel


> ---
>
> I'm going to start looking at the UART1 pinctl that Andrew mentioned
>
> v3:
> Changed fmc compatible string to use "aspeed,ast2400-fmc" as per review
>
> v2:
> Rebased patch on the openbmc github dev-4.7 branch
> Removed commented out eeprom
> Removed of_machine_is_compatible for LPC/UART config
> checkpatch whitespace fixup
>
>
>
>
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 100 +++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 048fbb5..495ca3d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-firestone.dtb \
>         aspeed-bmc-opp-garrison.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
> +       aspeed-bmc-facebook-cmm.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
> new file mode 100644
> index 0000000..1b3133f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
> @@ -0,0 +1,24 @@
> +/* This file is the label for the bmc primary flash and its partitions */
> +                               label = "bmc";
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               u-boot {
> +                                       reg = < 0 0x80000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel  {
> +                                       reg = < 0x80000 0x280000 >;
> +                                       label = "kernel";
> +                               };
> +                               initramfs {
> +                                       reg = < 0x300000 0x300000 >;
> +                                       label = "initramfs";
> +                               };
> +                               pd_rootfs  {
> +                                       reg = < 0x4c0000 0x1740000 >;
> +                                       label = "pd_rootfs";
> +                               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> new file mode 100644
> index 0000000..1b3bb22
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -0,0 +1,100 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "FACEBOOK CMM BMC";
> +       compatible = "facebook,cmm-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial1 = &uart1;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart1;
> +               bootargs = "console=ttyS1,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x3f000000>;
> +       };
> +
> +       ahb {
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0x94
> +                               0x20000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2400-fmc";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> +                       };
> +               };
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&mac1 {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> --
> 2.8.0.rc2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
