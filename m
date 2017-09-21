Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::236; helo=mail-vk0-x236.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CcyjxpVg"; 
 dkim-atps=neutral
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyfkq54WczDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 00:53:55 +1000 (AEST)
Received: by mail-vk0-x236.google.com with SMTP id i1so3189578vke.12
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=t/2uHZqJlUZJG4LAVLl9feDim+gq7pwNUeTCu2H5QMA=;
 b=CcyjxpVgo6NF44SlI8a/qG8d773hID6Dhi3hD5dJQo0sZLNffzlrVaIDhoqQH7CCkY
 gnKGOZQTGfihK/6E+dmVEVdaatSC3Up5/7ancTUX+efv7W3nRq5em5iBP9Kxpj93w9MH
 THqofugLgf4vxNOqAylBcD7lu0xCSHQ0Ez+h/0X/Vvjo20aetDp5/We3cwxx90ohUoGW
 ahtl68S61Hx1i0dOT2+LIqyI0oyB23ygq7YN/27Uckmu/BOeJ6lefNeI05JUELA7U8ke
 bojkYsjqEp+mWQ1fTlPXdAKwB2SCh1UjIFjn0emJmQuvywL+Heae7Y+1iyKchBv24wA8
 tOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=t/2uHZqJlUZJG4LAVLl9feDim+gq7pwNUeTCu2H5QMA=;
 b=GmONsPQL17E5Pkf5fCuQZjLadkOmdpIEbXBpRyqFlkPLPoY35a6fzLycUKwcfB/xDh
 a90AcO+cMl2Et5LNKaNlEt1qt7JMyVsOBvgpoHjMrjRWfZpq2lqEBWSC9WmmS1rfE3hS
 r0UVSuddldd907PAUT+0hT7x6nox4zvpewQulNapQLf+VgzwBeHBKf7pP4e8h+EYxpbK
 f6ubFYfUFz2wIuo+h/H+fvZBX69MvZwOMNhdYvK6WeoSHP4hwpHgCffeTqPzMH/NzbwT
 yln1zHyn+WuxkXl5GFeB0fxRHWlsaCI9syx+9qe7woFT12Fa4r8gxyeHQALnsCX0rLa1
 46IQ==
X-Gm-Message-State: AHPjjUhsPjHh8oHo/ol6K+iNacIegEXQEtGQtfe/RFTYVLZ2Jcpu+yVZ
 Krn6n0nnprrR7QqDDgW9G7yZaL2TfdLbRGOVdqr8Lc2r
X-Google-Smtp-Source: AOwi7QDMruvowTTRB8u59eW3Sj4geIxrO683DYIbqUCw1CMFS8UFqr3xFmaB47IU/oWGQ9gvC8AmAaf7spikq9iFWaU=
X-Received: by 10.31.16.232 with SMTP id 101mr2021546vkq.158.1506005632985;
 Thu, 21 Sep 2017 07:53:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Thu, 21 Sep 2017 07:53:52 -0700 (PDT)
In-Reply-To: <20170921074521.22796-1-joel@jms.id.au>
References: <20170921074521.22796-1-joel@jms.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 21 Sep 2017 07:53:52 -0700
Message-ID: <CAPLgG=nV3HP=S1n-Y-KMF6dxeRumb922yeKtvveHbqAdF9fvWw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ranges to SCU node
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 14:53:56 -0000

Reviewed-by: Rick Altherr <raltherr@google.com>

On Thu, Sep 21, 2017 at 12:45 AM, Joel Stanley <joel@jms.id.au> wrote:
> The SCU contains a number of devices. To date we have the pinctrl node,
> which doesn't have a reg property, the out of tree clock drivers which
> do have a single address in their reg properties, and the timeriomem
> node which has an address and length.
>
> From now on we will use a ranges property, allowing all of the devices
> under the SCU to specify an address and size starting from the SCU base.
>
> This allows the timeriomem node to live under the SCU syscon node. This change
> is required to get the timeriomem driver to probe on the ast2400.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This supersedes http://patchwork.ozlabs.org/patch/816677/ following discussion
> with Jeremy and Andrew.
>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 21 +++++++++++----------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 31 ++++++++++++++++---------------
>  2 files changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index a83b6a8d73d4..6151704aa87e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -158,9 +158,14 @@
>                         syscon: syscon@1e6e2000 {
>                                 compatible = "aspeed,g4-scu", "syscon", "simple-mfd";
>                                 reg = <0x1e6e2000 0x1a8>;
> +                               ranges = <0x0 0x1e6e2000 0x1a8>;
>
>                                 #address-cells = <1>;
> -                               #size-cells = <0>;
> +                               #size-cells = <1>;
> +
> +                               pinctrl: pinctrl@1e6e2000 {
> +                                       compatible = "aspeed,g4-pinctrl";
> +                               };
>
>                                 clk_clkin: clk_clkin {
>                                         #clock-cells = <0>;
> @@ -171,40 +176,36 @@
>                                 clk_hpll: clk_hpll@70 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g4-hpll-clock";
> -                                       reg = <0x70>;
> +                                       reg = <0x70 0x0>;
>                                         clocks = <&clk_clkin>;
>                                 };
>
>                                 clk_ahb: clk_ahb@70 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g4-ahb-clock";
> -                                       reg = <0x70>;
> +                                       reg = <0x70 0x0>;
>                                         clocks = <&clk_hpll>;
>                                 };
>
>                                 clk_apb: clk_apb@08 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g4-apb-clock";
> -                                       reg = <0x08>;
> +                                       reg = <0x08 0x0>;
>                                         clocks = <&clk_hpll>;
>                                 };
>
>                                 clk_uart: clk_uart@2c{
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g4-uart-clock";
> -                                       reg = <0x2c>;
> +                                       reg = <0x2c 0x0>;
>                                 };
>
>                                 hwrng@1e6e2078 {
>                                         compatible = "timeriomem_rng";
> -                                       reg = <0x1e6e2078 0x4>;
> +                                       reg = <0x78 0x4>;
>                                         period = <1>;
>                                         quality = <100>;
>                                 };
> -
> -                               pinctrl: pinctrl@1e6e2000 {
> -                                       compatible = "aspeed,g4-pinctrl";
> -                               };
>                         };
>
>                         adc: adc@1e6e9000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 9a988f69e610..ba3607c788e8 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -207,55 +207,56 @@
>                         syscon: syscon@1e6e2000 {
>                                 compatible = "aspeed,g5-scu", "syscon", "simple-mfd";
>                                 reg = <0x1e6e2000 0x1a8>;
> +                               ranges = <0x0 0x1e6e2000 0x1a8>;
>
>                                 #address-cells = <1>;
> -                               #size-cells = <0>;
> +                               #size-cells = <1>;
> +
> +                               pinctrl: pinctrl@1e6e2000 {
> +                                       compatible = "aspeed,g5-pinctrl";
> +                               };
>
>                                 clk_clkin: clk_clkin@70 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g5-clkin-clock";
> -                                       reg = <0x70>;
> +                                       reg = <0x70 0x0>;
>                                 };
>
>                                 clk_hpll: clk_hpll@24 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g5-hpll-clock";
> -                                       reg = <0x24>;
> +                                       reg = <0x24 0x0>;
>                                         clocks = <&clk_clkin>;
>                                 };
>
>                                 clk_ahb: clk_ahb@70 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g5-ahb-clock";
> -                                       reg = <0x70>;
> +                                       reg = <0x70 0x0>;
>                                         clocks = <&clk_hpll>;
>                                 };
>
>                                 clk_apb: clk_apb@08 {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g5-apb-clock";
> -                                       reg = <0x08>;
> +                                       reg = <0x08 0x0>;
>                                         clocks = <&clk_hpll>;
>                                 };
>
>                                 clk_uart: clk_uart@2c {
>                                         #clock-cells = <0>;
>                                         compatible = "aspeed,g5-uart-clock";
> -                                       reg = <0x2c>;
> +                                       reg = <0x2c 0x0>;
>                                 };
>
> -                               pinctrl: pinctrl@1e6e2000 {
> -                                       compatible = "aspeed,g5-pinctrl";
> +                               hwrng@1e6e2078 {
> +                                       compatible = "timeriomem_rng";
> +                                       reg = <0x78 0x4>;
> +                                       period = <1>;
> +                                       quality = <100>;
>                                 };
>                         };
>
> -                       hwrng@1e6e2078 {
> -                               compatible = "timeriomem_rng";
> -                               reg = <0x1e6e2078 0x4>;
> -                               period = <1>;
> -                               quality = <100>;
> -                       };
> -
>                         gfx: display@1e6e6000 {
>                                 compatible = "aspeed,ast2500-gfx", "syscon";
>                                 reg = <0x1e6e6000 0x1000>;
> --
> 2.14.1
>
