Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh7Pm0B0fzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G3oO9Hjb"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id i206so21072393ita.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8T+P0qip3vgmW3tFsWYSq2U0S+Eod3aUdhNgWbLc4gU=;
 b=G3oO9HjbKfw618O03JYmI7HZV0aA+wvtyLIRVrM8IGzk4lgHdGAzHSj86ydERMUtJ6
 384GjTqhnPI0ocRiRrePSIY+q5rCMkKTeMRa8sGH2Tv/oIrZm+v7KXL0ckNzZpwulvXY
 TW2HFuM78PNOe1YalCuSgzVYf0Uk/0xdXXAFtbPdpIXhgJxu/dX/HSMyyDi5C4SmaNRM
 qTh8vlF/xYK2NPWlq0TF2zJX280DSWyRgbhwKZ17DWM7op6iGFKlsAEVeVWia1KWLAXx
 fQSLKGEZDa4duqgTsKve8X8RotVJpn9DamWLHBwXcwqbzXr8qibGmSvMaLlJnN1Ss4ww
 tWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8T+P0qip3vgmW3tFsWYSq2U0S+Eod3aUdhNgWbLc4gU=;
 b=GNuViI9UH3eg+8vimiKxT+sZTB1bN4tHeYNtaPAVqmTbEYaFoQaj6dOt+GmQzWq3/L
 2ZZDmoGBuC4CNzI6U3TMEzLZhgpcvALU4QHCwXAY945rny/LdK3pnCAy3F18X+nCkLNH
 uLufjWmzTayPxkMeC54GnyakYluMDfwvByaUUHrVfF43r3BmazUOOfuAUsly5K1TDBlm
 m6qYH889sdYnhXOzi1vdBtRNyHeL8GDHAGzQNfZDW7XZJtzSyfZ34mco20FeFiO3t0ND
 C3rE5rt47e3U5y6fXM+mHenA10y2wfyp7XTJv8c9VZs2K0YWxpJe/OY9mvGpdbrHA6Wc
 Ni/Q==
X-Gm-Message-State: AODbwcAfcz0AE7C5AoNDu7cB5BkIvIz+2e177fd20m8H0un20xo/AxPr
 HBSrisVgW4TMLHp200GMK+mSXX5cmQ==
X-Received: by 10.107.162.204 with SMTP id l195mr18552535ioe.218.1496651609877; 
 Mon, 05 Jun 2017 01:33:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.81 with HTTP; Mon, 5 Jun 2017 01:33:29 -0700 (PDT)
In-Reply-To: <20170605074301.11310-1-joel@jms.id.au>
References: <20170605074301.11310-1-joel@jms.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 5 Jun 2017 16:33:29 +0800
Message-ID: <CAARXrtmCsNhrQP+YQ-kdErGuW0+2C4PEWeF12fxHKLOZj4MDkw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add devices under FSI
 CFAM
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 05 Jun 2017 08:33:32 -0000

Acked-by: Lei YU <mine260309@gmail.com>

On Mon, Jun 5, 2017 at 3:43 PM, Joel Stanley <joel@jms.id.au> wrote:
> This describes the SBE FIFO and OCC device that are attached via the FSI
> bus.
>
> As this layout is common to all existing p9 machines, we add them via a
> dtsi.  This dtsi requires the 'fsi' label be present.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  8 +++--
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  8 +++--
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 45 ++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/boot/dts/ibm-power9-cfam.dtsi
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 03cde39189c5..dd01dfaa8509 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -47,10 +47,10 @@
>                 };
>         };
>
> -       gpio-fsi {
> +       fsi: gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
> -
> -               status = "okay";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> @@ -70,6 +70,8 @@
>         };
>  };
>
> +#include "ibm-power9-cfam.dtsi"
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 3001597d42d9..42b70a5d57aa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -63,10 +63,10 @@
>                 };
>         };
>
> -       gpio-fsi {
> +       fsi: gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
> -
> -               status = "okay";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> @@ -81,6 +81,8 @@
>         };
>  };
>
> +#include "ibm-power9-cfam.dtsi"
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> new file mode 100644
> index 000000000000..5beb978f9f31
> --- /dev/null
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -0,0 +1,45 @@
> +&fsi {
> +       cfam@0,0 {
> +               reg = <0 0>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               sbefifo@2400 {
> +                       compatible = "ibm,p9-sbefifo";
> +                       reg = <0x2400 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       occ@1 {
> +                               compatible = "ibm,p9-occ";
> +                               reg = <1>;
> +                       };
> +               };
> +
> +               hub@3400 {
> +                       compatible = "fsi-master-hub";
> +                       reg = <0x3400 0x400>;
> +                       #address-cells = <2>;
> +                       #size-cells = <0>;
> +
> +                       cfam@1,0 {
> +                               reg = <1 0>;
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +
> +                               sbefifo@2400 {
> +                                       compatible = "ibm,p9-sbefifo";
> +                                       reg = <0x2400 0x400>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       occ@2 {
> +                                               compatible =
> +                                                       "ibm,p9-occ";
> +                                               reg = <2>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> --
> 2.11.0
>
