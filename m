Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx0lt4NskzDr1b
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 17:18:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AWH7nQhD"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id s127so5932783ywg.3
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VMkCWZBRti6hlLPHu9bcpGeziVZozi682k2T2XW9v3w=;
 b=AWH7nQhDl3ksEE92F4k1gKE1nYLYTtiBBroiFSLANmyVVdGoj/EgqUMbM4ReEcP/Y/
 EwvdhXAUT6dS9IuvUcsz/haOvh8yC3oCXw+dsPzBSP2EyW7+fAxT0m9TeognrJTuRFKj
 iG8F4Mcp07IDK5s2aMRTWPbNhD/2I+BMbr/nh+OFG6ZfUz27HyZ4AiUgX2mkgU+ZYQJe
 ijSUqelVJQhitAo+PcPilZqFQP72vp5dwCzLAUeV29vkcTbAAoOA7WtDaGz2vd3nDw2E
 chv8u0fFyveX0aJjlt4z16gLIzcKzOzcFI0Tauub0QkzSam0B0QHlWkk10qrTF6DyYe8
 TUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VMkCWZBRti6hlLPHu9bcpGeziVZozi682k2T2XW9v3w=;
 b=RiuQk5nJ2GlXfzFmbFemMjuuYfd1I92jlXxv2XYgzqJcIJpiImOcfXCIcqDAYhrCsw
 O3yFrrCc1hLNq7ANxsUJ1diGYwDIj4P6tdrrkLmXBT7OM43Uh7kIzfXau/daNrdcWXv9
 z9fzWksCwWMIidf9t70mnMBRG20hmCKT4MoyPd0tOJcCTJqTvq2FHAy9S9CnmQrhoCa6
 9l5BaxpZ001Dp09kVKHw4RHpbdSY3ppnFRjoaLJtcIXFSEJcIxojM+vnZbEsfx05p/d2
 Z1rEQEwTljwI7SnZLkF/bAXwmBUnUgCVnYUk3ogcn+cZrhd6dmw+6Y9RQUF82ele5Cjb
 q2MA==
X-Gm-Message-State: AKS2vOxAWD3Tbs9hxZfhPrhK3NGyTiDDqxev0huAar9Z0Qs6f7IDVxie
 hVlqcyuyBD7orWuUepiI3nUy6BRJlw==
X-Received: by 10.13.207.195 with SMTP id r186mr14288420ywd.219.1498461528111; 
 Mon, 26 Jun 2017 00:18:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 00:18:27 -0700 (PDT)
In-Reply-To: <20170623012421.63639-1-venture@google.com>
References: <20170623012421.63639-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 16:48:27 +0930
X-Google-Sender-Auth: 4IbWzATQ0FeNHKXg0zIypIfvmHU
Message-ID: <CACPK8XfuBONVYNEQyymzL_g3beDSwwOjvJG5NgL6gL6f1CM-tg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: Enable pwm fans
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 26 Jun 2017 07:18:51 -0000

On Fri, Jun 23, 2017 at 10:54 AM, Patrick Venture <venture@google.com> wrote:
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g4.dtsi             |  6 ++++
>  2 files changed, 57 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index e609c53d58f5..3abc2954d26e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -46,6 +46,57 @@
>                         gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       pwm_tacho: pwm-tacho-controller@1e786000 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0x1E786000 0x1000>;
> +               compatible = "aspeed,ast2500-pwm-tacho";
> +               clocks = <&pwm_tacho_fixed_clk>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> +
> +               fan@0 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +               };
> +
> +               fan@1 {
> +                       reg = <0x01>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +               };
> +
> +               fan@2 {
> +                       reg = <0x02>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +               };
> +
> +               fan@3 {
> +                       reg = <0x03>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +               };
> +
> +               fan@4 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +               };
> +
> +               fan@5 {
> +                       reg = <0x01>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +               };
> +
> +               fan@6 {
> +                       reg = <0x02>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +               };
> +
> +               fan@7 {
> +                       reg = <0x03>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +               };
> +       };
>  };
>
>  &fmc {
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index a998a00a2728..c93b0460cada 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -184,6 +184,12 @@
>                                         reg = <0x2c>;
>                                 };
>
> +                               pwm_tacho_fixed_clk: fixedclk {
> +                                       compatible = "fixed-clock";
> +                                       #clock-cells = <0>;
> +                                       clock-frequency = <24000000>;
> +                               };

This is a bit strange. I don't think it should live at this spot in
the device tree.


> +
>                                 hwrng@1e6e2078 {
>                                         compatible = "timeriomem_rng";
>                                         reg = <0x1e6e2078 0x4>;
> --
> 2.13.1.611.g7e3b11ae1-goog
>
