Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyC3Z6zHczDr3j
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 16:06:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mK7R3agX"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l21so1612338ywb.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 23:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u1EBE3DU+WNtoEdkOjT/oSCuM3okEMSOcXi51Ct1+Xs=;
 b=mK7R3agXjav8GHyUVx5DcUwO25eBizCZhiYyKgk+x07X7/cjvZtRSGypCBmWETSFbj
 oA50pzdo/GFuTM4wUj5FY13WCqrjJz0kD7D82ja7ZGiMHbBTBHgaez/GdXerKQOHWbTb
 pa0qrEE/x/15Ns35YWYK7h3DIgNpD2DRhJfVoNBWVC1bIIpI8YNFYHhFir843pgXU6xp
 vgQXuQOXj4VcajNHdDu7mgyjcaKzd9Rk9JxoQccHnmUkRpIN9W5Ob+IJ2KRxSZLtrN/c
 oOXRjqxynx8TrL8t6U/bXSZU6pvVi1C95AwhdFDd2W5x7HnGfDZnMb8jPZo2MKRbk7XX
 Woug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u1EBE3DU+WNtoEdkOjT/oSCuM3okEMSOcXi51Ct1+Xs=;
 b=DgfZLOX92cJwFmVkeJvAdY1lCqRxlfrW4j50zoCr6HFOCnf8YP+qzgDzYoBjWc0FXg
 P2q25ZWU9UNE0Eka13COtNGXa8WZduHbsY6CXwaikAxMEcXq6/2eTEAZVah1COwBVj3q
 KbUZddsg74vZ7r/zy3hZKsqF2B7CNjMBfmkE9ESEqUEg6Ir4kGRLBHTqzo1vT7B0M9Xn
 dndWGerF8WSZzThzlRmPgtRX8A890d6MsJd+rh1Lf65w8RP99g1ObFV0gs2tguERYXbo
 lYrJk7l1Q2sW52cyOhaQzurQLVbdmXB7utL+QBq7niHnZYnS19HgUwh+p2j7wFjuodLN
 fzgw==
X-Gm-Message-State: AKS2vOxlM5tw4II7kEcobPcuU+Tjd6c5+gnbokbzajGuc/v7W5LpfpaE
 HydNc9TAtvTonwx+BuVDALWa/t8ZGg==
X-Received: by 10.129.52.148 with SMTP id b142mr6549528ywa.164.1498629992254; 
 Tue, 27 Jun 2017 23:06:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Tue, 27 Jun 2017 23:06:11 -0700 (PDT)
In-Reply-To: <20170627134459.125774-1-venture@google.com>
References: <20170627134459.125774-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Jun 2017 15:36:11 +0930
X-Google-Sender-Auth: CFGB_y0fCO030oL0ymyw4_5rHWc
Message-ID: <CACPK8XfH0OPN4Lch-JmNWDpRO_5wPDic+-8dFjA3Dzr0LkvU8w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: quanta: Enable pwm
 fans
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
X-List-Received-Date: Wed, 28 Jun 2017 06:06:35 -0000

On Tue, Jun 27, 2017 at 11:14 PM, Patrick Venture <venture@google.com> wrote:
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: Moved pwm_tacho_fixed_clk to clocks.
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g4.dtsi             |  5 +++
>  2 files changed, 56 insertions(+)
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

Nit: convention is to use lowecase for hex numbers in the dt.

> +               compatible = "aspeed,ast2500-pwm-tacho";
> +               clocks = <&pwm_tacho_fixed_clk>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;

It looks like you're using fans 0..7, but you're only requesting the
pins for the first four fans. Should you be requesting all 8?

Cheers,

Joel

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
> index a998a00a2728..9cc959fccfa0 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -36,6 +36,11 @@
>         };
>
>         clocks {
> +               pwm_tacho_fixed_clk: fixedclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <24000000>;
> +               };
>         };
>
>         ahb {
> --
> 2.13.1.611.g7e3b11ae1-goog
>
