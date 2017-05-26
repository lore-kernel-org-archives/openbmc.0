Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYtYy5WnvzDqR2
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 14:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KgHZgx1a"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id d72so477ybh.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 21:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YHq/45oMNdWgUQ1MJXjXw6UbfhI65byPg4yrukkAKJc=;
 b=KgHZgx1adJr4bbT0Fl8bUIrj77/xdN8Ukg9NOKy1f/tYN0AB+nLQBl+SmSyGoMACDv
 tqmG9OYCpb4XeQUnKmQh2a95AshE7sQzZGKTxMxPMwN1hjDJ5gAoNUQnaCAbjzjMi6jq
 /SBd73uI6o4MpnA4/XGf9ZkeYXeGhVwt8ak/GYBZCx8FlAqXFAAIM6np3Jhk3/+SRjbK
 FlYcnmxqgOnr2EIsEgwD6Vqgqxd9Gks02DFFIAmkuXoeS8UTiKft+dnBieS52G4AXo/O
 sQlhBnX/LOGFtKRO7O5kxoESyIlpYNR1izuTZD7LlwDqw3yiQwuX8R8fce+8p9iCkvm8
 bEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YHq/45oMNdWgUQ1MJXjXw6UbfhI65byPg4yrukkAKJc=;
 b=pIDVFdTY24P1y5XC1KdzkF+SCdAcNjL0xI6QCBzyCjlHWSsYR8x+ItUlvoH0XdolvL
 501E5ozCYhoclLUrk4yYJjfe0jfIeCmTY32pyGYx/uYnRKUsII6hCG/h4UvvtHVl3RbW
 kE2Fw2Lhal3qgKQL9GdxDArE5T56O/KxFKtaZEmOw+w02m1anYW4ybwBDCu1Lq2sfoM6
 gF+oQontzl4gstRgPdPOWr/GeBvG8DJ8liNFv3ROiSn4VJWm52suwaaDNor1Fucp6519
 /JbtNuDOyY+1elfQNBO2tIRctmujaL5Ygwhu9uNXFW4jKLqG5Aiszv0HNlK8ghsdnV6e
 EHEQ==
X-Gm-Message-State: AODbwcAmmwEay0meLcgzkaBndBq28imkvk4Tp5x0PwA98ZMPPTaENrmH
 xbIxRfTjQ5x+4j9xLBuFgY5BG1JnINBYQwY=
X-Received: by 10.37.65.199 with SMTP id o190mr36308498yba.142.1495773234981; 
 Thu, 25 May 2017 21:33:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 25 May 2017 21:33:34 -0700 (PDT)
In-Reply-To: <1495746791-2748-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495746791-2748-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 26 May 2017 14:33:34 +1000
X-Google-Sender-Auth: hZrbHKCLXvx6ZRMDsMFsePK8g0s
Message-ID: <CACPK8XcPUcbZt4xKHh+bNGq799ObpD1dfGaZamPL=Q9-UStS9Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 26 May 2017 04:33:59 -0000

On Fri, May 26, 2017 at 7:13 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Reorganize flash controllers into the ast2400 config. Barreleye wasn't
> booting with the new aspeed-smc driver.

Your commit message mentions Barreleye, but you're also updating Palmetto.

Can you please update all of the ast2400 platforms?

Also cc Cedric on your next version so he can check that we're doing
the correct thing.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 44 ++++++++--------------
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 52 ++++++++------------------
>  arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++++
>  3 files changed, 66 insertions(+), 64 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index be1f2d1..7a616bb 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -31,34 +31,6 @@
>                 };
>         };
>
> -       ahb {
> -               bmc_pnor: fmc@1e620000 {
> -                       reg = < 0x1e620000 0x94
> -                               0x20000000 0x02000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2400-fmc";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -                       };
> -               };
> -
> -               host_pnor: spi@1e630000 {
> -                       reg = < 0x1e630000 0x18
> -                               0x30000000 0x02000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2400-spi";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -                               label = "pnor";
> -                       };
> -               };
> -       };
> -
>         leds {
>                 compatible = "gpio-leds";
>
> @@ -76,6 +48,22 @@
>         };
>  };
>
> +&bmc_pnor {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +       };
> +};
> +
> +&host_pnor {
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +       };
> +};
> +
>  &pinctrl {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index b4faa1d..e55abe6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -47,42 +47,6 @@
>                  };
>          };
>
> -       ahb {
> -               bmc_pnor: fmc@1e620000 {
> -                       reg = < 0x1e620000 0x94
> -                               0x20000000 0x02000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2400-fmc";
> -                       aspeed,fmc-has-dma;
> -                       interrupts = <19>;
> -                       clocks = <&clk_ahb>;
> -                       clock-names = "ahb";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -                               m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -                       };
> -               };
> -
> -               host_pnor: spi@1e630000 {
> -                       reg = < 0x1e630000 0x18
> -                               0x30000000 0x02000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2400-spi";
> -                       clocks = <&clk_ahb>;
> -                       clock-names = "ahb";
> -                       flash {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -                               label = "pnor";
> -                               m25p,fast-read;
> -                       };
> -               };
> -       };
> -
>         gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
>
> @@ -94,6 +58,22 @@
>         };
>  };
>
> +&bmc_pnor {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +       };
> +};
> +
> +&host_pnor {
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +       };
> +};
> +
>  &pinctrl {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index d8827d5..9fb7889 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -44,6 +44,40 @@
>                 #size-cells = <1>;
>                 ranges;
>
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0x94
> +                               0x20000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2400-fmc";
> +                       status = "disabled";
> +                       aspeed,fmc-has-dma;
> +                       interrupts = <19>;
> +                       clocks = <&clk_ahb>;
> +                       clock-names = "ahb";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               host_pnor: spi@1e630000 {
> +                       reg = < 0x1e630000 0x18
> +                               0x30000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2400-spi";
> +                       status = "disabled";
> +                       clocks = <&clk_ahb>;
> +                       clock-names = "ahb";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +                               status = "disabled";
> +                       };
> +               };
> +
>                 vic: interrupt-controller@1e6c0080 {
>                         compatible = "aspeed,ast2400-vic";
>                         interrupt-controller;
> --
> 1.8.3.1
>
