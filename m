Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD7ys4lTgzDqFV
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SflsTu4/"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id j9so2002857ywj.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 00:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l7i9WmnQPmHXz8wV58e0ZW36sqDKWi8HSWUO6b+Mdhg=;
 b=SflsTu4/5sjzUziT0flp+loOWFKuGeZuX3rlDL6uGaLx2VCGFUk7/kZ05N99UqQ0AN
 w6sB5etUuOekpApqq+RsK9Yr1DWAUjzK4264546ryZia0mB/2mPECKqLo0I48izIucGd
 g38eQD3Tqy3jw1elVbwfYFmDnRGJNcTajgV7UMv2KKu+hT06LMf11oM6M3FeEnv7n2wv
 58NaBBm/DevSRHJLyQLmKS4TFH/R1OkVH5YBaZ4lDsyBWiL3vTd46ALJ1PGXzYsc5d1e
 FNALly8ykvqkxKfe+VrjFGl/eb3q1Or64Uo189EFoeMqJbvJBo8lkL66LDJQpxcljJOg
 7mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l7i9WmnQPmHXz8wV58e0ZW36sqDKWi8HSWUO6b+Mdhg=;
 b=LIEOp0JK77sb9HtRQIF/WpnH8c4w7PKibTIK6yIP+e7HKHplNyTY7ekm0WIK6yV8NB
 30deXfijPNz+3y+QZ5P76aBhuV7+8hajuZw0/PONWFCusmog0a9W99CAp/3HaNNonfw5
 sGzzYNceiLGCyksbK4aRmKBuo3xWEjOAtU2VTW+WWoV7Aq0zym3RG+YSqKN8DO4Tn7du
 EDQwU5P5WiNr59Dh6OdplOVFaoIOVGVYwROyUPm0l5fThV4ckGJBgiUoNDLqt9GH962a
 XVzJDVkczIZNESjl3kyWS0JPO7JloyfeX+lneRtWdhROkuJqJEEfpAOR2DDTowWf3AR8
 APWg==
X-Gm-Message-State: AN3rC/6OOkQwBOHP6UWI8fYLczsmo+VP7M3cAaJEk+Jvo/PX5pqA8KP1
 SpYseXMsohRSPLQZ8F/fDknOQOwQlA==
X-Received: by 10.13.251.4 with SMTP id l4mr3079153ywf.329.1493278530780; Thu,
 27 Apr 2017 00:35:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 00:35:10 -0700 (PDT)
In-Reply-To: <20170427072015.23334-1-joel@jms.id.au>
References: <20170427072015.23334-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 17:05:10 +0930
X-Google-Sender-Auth: DkMm62Tq5ZJJd4wcLFFniG1izW0
Message-ID: <CACPK8XecV7ffxhzbKJy_8D3jyieacCryHuoTV_r_MgRDv8XmpQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Update i2c binding
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 07:35:34 -0000

On Thu, Apr 27, 2017 at 4:50 PM, Joel Stanley <joel@jms.id.au> wrote:
> The I2C binding changed when upstreaming the I2C driver.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> I've boot tested this, but please take a look to make sure I didn't stuff it up.

Do I also need aliases so the character devices appear where userspace
expects them?

>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 156 ++++++++++++++++++++-------------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 180 ++++++++++++++++++++++++---------------
>  2 files changed, 207 insertions(+), 129 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index b9a6730cc831..c25c5f839d58 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -958,200 +958,240 @@
>                         };
>
>                         i2c: i2c@1e78a000 {
> +                               compatible = "simple-bus";
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> -                               #interrupt-cells = <1>;
> -
> -                               compatible = "aspeed,ast2400-i2c-controller";
> -                               reg = <0x1e78a000 0x40>;
>                                 ranges = <0 0x1e78a000 0x1000>;
> -                               interrupts = <12>;
> -                               clocks = <&clk_apb>;
> -                               clock-ranges;
> -                               interrupt-controller;
> +
> +                               i2c_ic: interrupt-controller@0 {
> +                                       #interrupt-cells = <1>;
> +                                       compatible = "aspeed,ast2400-i2c-ic";
> +                                       reg = <0x0 0x40>;
> +                                       interrupts = <12>;
> +                                       interrupt-controller;
> +                               };
>
>                                 i2c0: i2c-bus@40 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x40 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <0>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <0>;
> -                                       interrupt-parent = <&i2c>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
>                                         /* Does not need pinctrl node */
>                                 };
>
>                                 i2c1: i2c-bus@80 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x80 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <1>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <1>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
>                                         /* Does not need pinctrl node */
>                                 };
>
>                                 i2c2: i2c-bus@c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> -                                       reg = <0xC0 0x40>;
> +                                       #interrupt-cells = <1>;
> +
> +                                       reg = <0xc0 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <2>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <2>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c3_default>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
> +                                       /* Does not need pinctrl node */
>                                 };
>
>                                 i2c3: i2c-bus@100 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x100 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <3>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <3>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c4_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c4: i2c-bus@140 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x140 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <4>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <4>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c5_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c5: i2c-bus@180 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x180 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <5>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <5>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c6_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c6: i2c-bus@1c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> -                                       reg = <0x1C0 0x40>;
> +                                       #interrupt-cells = <1>;
> +
> +                                       reg = <0x1c0 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <6>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <6>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c7_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c7: i2c-bus@300 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x300 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <7>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <7>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c8_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c8: i2c-bus@340 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x340 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <8>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <8>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c9_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c9: i2c-bus@380 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x380 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <9>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <9>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c10_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c10: i2c-bus@3c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x3c0 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <10>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <10>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c11_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c11: i2c-bus@400 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x400 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <11>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <11>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c12_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c12: i2c-bus@440 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x440 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <12>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <12>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c13_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c13: i2c-bus@480 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x480 0x40>;
>                                         compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <13>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <13>;
> -                                       /* Does not need pinctrl node */
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c14_default>;
> +                                       status = "disabled";
>                                 };
> -
>                         };
> -
>                 };
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index ddfb729bb85a..9f43c978df40 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -1149,199 +1149,237 @@
>                         };
>
>                         i2c: i2c@1e78a000 {
> +                               compatible = "simple-bus";
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> -                               #interrupt-cells = <1>;
> -
> -                               compatible = "aspeed,ast2400-i2c-controller";
> -                               reg = <0x1e78a000 0x40>;
>                                 ranges = <0 0x1e78a000 0x1000>;
> -                               interrupts = <12>;
> -                               clocks = <&clk_apb>;
> -                               clock-ranges;
> -                               interrupt-controller;
> +
> +                               i2c_ic: interrupt-controller@0 {
> +                                       #interrupt-cells = <1>;
> +                                       compatible = "aspeed,ast2500-i2c-ic";
> +                                       reg = <0x0 0x40>;
> +                                       interrupts = <12>;
> +                                       interrupt-controller;
> +                               };
>
>                                 i2c0: i2c-bus@40 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x40 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <0>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <0>;
> -                                       interrupt-parent = <&i2c>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c1: i2c-bus@80 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x80 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <1>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <1>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c2: i2c-bus@c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> -                                       reg = <0xC0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <2>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       #interrupt-cells = <1>;
> +
> +                                       reg = <0xc0 0x40>;
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <2>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c3_default>;
> +                                       interrupt-parent = <&i2c_ic>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c3: i2c-bus@100 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x100 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <3>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <3>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c4_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c4: i2c-bus@140 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x140 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <4>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <4>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c5_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c5: i2c-bus@180 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x180 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <5>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <5>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c6_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c6: i2c-bus@1c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> -                                       reg = <0x1C0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <6>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       #interrupt-cells = <1>;
> +
> +                                       reg = <0x1c0 0x40>;
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <6>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c7_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c7: i2c-bus@300 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x300 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <7>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <7>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c8_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c8: i2c-bus@340 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x340 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <8>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <8>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c9_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c9: i2c-bus@380 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x380 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <9>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <9>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c10_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c10: i2c-bus@3c0 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x3c0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <10>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <10>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c11_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c11: i2c-bus@400 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x400 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <11>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <11>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c12_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c12: i2c-bus@440 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x440 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <12>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <12>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c13_default>;
> +                                       status = "disabled";
>                                 };
>
>                                 i2c13: i2c-bus@480 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> +                                       #interrupt-cells = <1>;
> +
>                                         reg = <0x480 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <13>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> +                                       compatible = "aspeed,ast2500-i2c-bus";
> +                                       clocks = <&clk_apb>;
> +                                       bus-frequency = <100000>;
>                                         interrupts = <13>;
> +                                       interrupt-parent = <&i2c_ic>;
>                                         pinctrl-names = "default";
>                                         pinctrl-0 = <&pinctrl_i2c14_default>;
> +                                       status = "disabled";
>                                 };
> -
>                         };
> -
>                 };
>         };
>  };
> --
> 2.11.0
>
