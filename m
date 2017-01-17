Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2W416YLbzDqSY
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 11:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CAyua+oH"; 
 dkim-atps=neutral
Received: by mail-ot0-x243.google.com with SMTP id 36so7819510otx.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=s5CBtFx4CjZdzYRsnhAewALpKI7uSRZwSzAYPLhBYMk=;
 b=CAyua+oHclzmxHK1NAONQXLXPjBvXHgcO/sFsdcR58Yg/ZV8LcM2RgjtfelbywoSks
 ///cLV8LjUL0UwMdlOsFWqZn8NQ37DxUX5naLhj+3GGlQ/4kFM9ExjOdFCScZnp3Dula
 o2jkd3d9ejuFjI6X/Q4zsqqA+Tw+uq2bbTnf7VYcbw2Xzp6k4LEDrJJkAA0eWPDdHe9y
 XcpwMeEMqil/i+jXto4+5x4vLoSedQ7aaa75iF9KshQmuNJ+btlgG2djqDxpN9ax2Lwn
 nIcFd+uUKdsrlTWSk2/GUbeiQWmlX8D8s93S0HNhS7XmTkzogttvlYOxTUfG0xNlfnAs
 YcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=s5CBtFx4CjZdzYRsnhAewALpKI7uSRZwSzAYPLhBYMk=;
 b=JC0sHRqak5kQfkKROVsSBq/qRzuc1xYY6s0PG3iMJ08ClidX8Ezc2djowWfqUULiNG
 oYf2O2dj7s+LL6l3FfRgHjI6XFFsRZ8gNIJgx9FB9zu5CFJrxZ6xVNQhC9CeBa2b6Wmp
 zi6sbdws4DkDS0SyOKtsSXdAHPDn2gQaidcFzLem6fMLs4X4UrZ224Jljzgvx4+N40ME
 b2NRfBipIqFIcjmtedeCygPmq5McPPBnc9ZmUWpDLH0Qw5S06/c52YFAlmS9q5GxCmcR
 U5I5g/IHXrLnDMTtxCl/f1WuAyRfdj/49wv/mg50WuDnTlZM5UnAkKcM96uZv+tJuBYL
 Th+w==
X-Gm-Message-State: AIkVDXJObnyGlBa+YIBYNUecSz47uyHHc72nUONZc3MEsSWfWiio4shHPLAJr6oagavxkx/4pKCGT+N0uj2itg==
X-Received: by 10.157.17.212 with SMTP id y20mr16782660oty.230.1484612479918; 
 Mon, 16 Jan 2017 16:21:19 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Mon, 16 Jan 2017 16:20:59 -0800 (PST)
In-Reply-To: <20170116202120.17855-1-mspinler@linux.vnet.ibm.com>
References: <20170116202120.17855-1-mspinler@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Jan 2017 11:20:59 +1100
X-Google-Sender-Auth: SIxyVlQlmBnozCMF0t_Qisnqa6A
Message-ID: <CACPK8Xc2K23QbxpZLFDDCmfCUiBfaWJDNQxrqtU4wOU_M-4uQw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: witherspoon: Add i2c and led devices
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <spinler@us.ibm.com>
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
X-List-Received-Date: Tue, 17 Jan 2017 00:21:22 -0000

On Tue, Jan 17, 2017 at 7:21 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> From: Matt Spinler <spinler@us.ibm.com>
>
> Add more I2C devices and the rear LEDs.
>
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Thanks, merged into dev-4.7.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 41 +++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 9badf3e94599..da5ec5ee3746 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -1,7 +1,7 @@
>  /dts-v1/;
>
>  #include "aspeed-g5.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>
>  / {
>         model = "Witherspoon BMC";
> @@ -19,6 +19,22 @@
>         memory {
>                 reg = <0x80000000 0x40000000>;
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               rear-fault {
> +                       gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-id {
> +                       gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-power {
> +                       gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &fmc {
> @@ -115,25 +131,38 @@
>                 compatible = "bosch,bmp180";
>                 reg = <0x77>;
>         };
> +
> +       max31785@52 {
> +               compatible = "maxim,max31785";
> +               reg = <0x52>;
> +       };
>  };
>
>  &i2c4 {
>         status = "okay";
>
> -       /* CP1 TMP423A */
>         /* CP1 VDN & VDDR */
>         /* CP1 VDD & VCS */
>         /* CP1 VIO */
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
>  };
>
>
>  &i2c5 {
>         status = "okay";
>
> -       /* CP1 TMP423A */
>         /* CP1 VDN & VDDR */
>         /* CP1 VDD & VCS */
>         /* CP1 VIO */
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
>  };
>
>  &i2c6 {
> @@ -152,13 +181,17 @@
>  &i2c9 {
>         status = "okay";
>
> -       /* Tmp275 */
>
>         /* MUX
>          *    -> PCIe Slot 3
>          *    -> PCIe Slot 4
>          *    -> PCA9517 -> PEX8725
>          */
> +
> +       tmp275@4a {
> +               compatible = "ti,tmp275";
> +               reg = <0x4a>;
> +       };
>  };
>
>  &i2c10 {
> --
> 2.11.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
