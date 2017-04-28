Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDm5147gqzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 17:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Gxl3QPsl"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id f76so46555565qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AVoPUwyj3CS5FoKGbqzv/cUT8oz3PiatVgZT4mg0jrY=;
 b=Gxl3QPsln7eC224G8pdE0eBHjVOiiGNP1b34AjsgNKPOUSNf23QS9bSYx87b/QnLXn
 mZX3N12xaS1axcaTlX4htkx2FVkEAjtSk4bD3jYR0STfgnSkZ1wUZQSpGqCE6ZfCf3tf
 q25i2BGTtQWlMe1dB3pxEpED+XTTfU/XIhdje+TlP24Yp4jxGyTyrNo+BC8crrKqqXf/
 kMqx3VrbI/OHH5EAe5IQD1EeUQfXRR3ncgOIbY1vAQ5vC08RkgDUO6VdSug8UM0fFBcq
 Ah6lr/TcyOVUWXf0retXVLCzb6BjYjfdF450RnhY4XtNtpmHHsdy0y3v/Q3DxwxdFuJI
 g4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AVoPUwyj3CS5FoKGbqzv/cUT8oz3PiatVgZT4mg0jrY=;
 b=ELE1VJ2YWPCqNqptiFWq6d6gYS7K84Pi/g79Bd8yQAH1pHGTGcJYk345kkfNJTWn2p
 NTLw8RyyU5NMGpeDzha7g+KKDupR+8LNcHzyJap7DOHh6drb3o8se751AkV3tShjSOfO
 MuIgFtFHDe95CWj3SucImVTkEN1OrzwzzzMck9ZGFELx1FkK+Z0rw1zy/F4U3okQiSbS
 ArB+sIn0Y3f19zaeu+UqJBqpB0gNoXXubhvNMOSP3R6RMP0rGs9qUycTAvqqS6A01r9r
 p7iqXXCL1uDQPLaNYJxi0Mv+2uTXrn5Wtfdsuv1WtJ+aKNZ+hDxN5b5WeYwZ+zDdHAX1
 QH2Q==
X-Gm-Message-State: AN3rC/6qoBlFw6YMCH9gvC3mFNiho3uf9hwqCpVqCffxJuyROH0D/pEe
 D996KZYXinWQHBQFhEJK8/E5jF828u7YVYPNyw==
X-Received: by 10.55.24.9 with SMTP id j9mr7883185qkh.25.1493365376701; Fri,
 28 Apr 2017 00:42:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.185 with HTTP; Fri, 28 Apr 2017 00:42:56 -0700 (PDT)
In-Reply-To: <20170428011805.22513-1-joel@jms.id.au>
References: <20170428011805.22513-1-joel@jms.id.au>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Apr 2017 00:42:56 -0700
Message-ID: <CAFd5g45dNZvFApkKrUHDvH_5=j--Co8JMh4umST+foxogVUq0Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Update i2c binding
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Apr 2017 07:43:02 -0000

On Thu, Apr 27, 2017 at 6:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> The I2C binding changed when upstreaming the I2C driver.
>
> This adds aliases for the 14 built-in I2C busses to ensure userspace
> sees the numbering that we had with the old driver.
>
> This change moves the description of the i2c buses to the bottom of the
> dtsi to improve readability.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

> ---
> v2:
>  Added i2c aliases.
>
>  Boot tested on qemu-palmetto. We see the same i2c entries under /dev as before,
>  so the aliases work. Note that we can't use qemu for testing with the new
>  driver, tracked at https://github.com/openbmc/qemu/issues/5
>
> v3:
>  Fixed missing pinctrl properties for i2c2
>
> v4:
>  No code change. Send patch with --diff-algorithm=histogram so it made sense
>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 440 ++++++++++++++++++++++-----------------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 439 +++++++++++++++++++++-----------------
>  2 files changed, 501 insertions(+), 378 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index b9a6730cc831..952e23d553f8 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -18,6 +18,23 @@
>                 };
>         };
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +       };
> +
>         clocks {
>         };
>
> @@ -958,200 +975,245 @@
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
> -
> -                               i2c0: i2c-bus@40 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x40 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <0>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <0>;
> -                                       interrupt-parent = <&i2c>;
> -                                       /* Does not need pinctrl node */
> -                               };
> -
> -                               i2c1: i2c-bus@80 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x80 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <1>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <1>;
> -                                       /* Does not need pinctrl node */
> -                               };
> -
> -                               i2c2: i2c-bus@c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0xC0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <2>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <2>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c3_default>;
> -                               };
> -
> -                               i2c3: i2c-bus@100 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x100 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <3>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <3>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c4_default>;
> -                               };
> -
> -                               i2c4: i2c-bus@140 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x140 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <4>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <4>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c5_default>;
> -                               };
> -
> -                               i2c5: i2c-bus@180 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x180 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <5>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <5>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c6_default>;
> -                               };
> -
> -                               i2c6: i2c-bus@1c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x1C0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <6>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <6>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c7_default>;
> -                               };
> -
> -                               i2c7: i2c-bus@300 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x300 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <7>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <7>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c8_default>;
> -                               };
> -
> -                               i2c8: i2c-bus@340 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x340 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <8>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <8>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c9_default>;
> -                               };
> -
> -                               i2c9: i2c-bus@380 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x380 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <9>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <9>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c10_default>;
> -                               };
> -
> -                               i2c10: i2c-bus@3c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x3c0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <10>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <10>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c11_default>;
> -                               };
> -
> -                               i2c11: i2c-bus@400 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x400 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <11>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <11>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c12_default>;
> -                               };
> -
> -                               i2c12: i2c-bus@440 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x440 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <12>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <12>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c13_default>;
> -                               };
> -
> -                               i2c13: i2c-bus@480 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x480 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <13>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <13>;
> -                                       /* Does not need pinctrl node */
> -                               };
> -
>                         };
>
> +
>                 };
>         };
>  };
> +
> +&i2c {
> +       i2c_ic: interrupt-controller@0 {
> +               #interrupt-cells = <1>;
> +               compatible = "aspeed,ast2400-i2c-ic";
> +               reg = <0x0 0x40>;
> +               interrupts = <12>;
> +               interrupt-controller;
> +       };
> +
> +       i2c0: i2c-bus@40 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x40 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <0>;
> +               interrupt-parent = <&i2c_ic>;
> +               status = "disabled";
> +               /* Does not need pinctrl properties */
> +       };
> +
> +       i2c1: i2c-bus@80 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x80 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <1>;
> +               interrupt-parent = <&i2c_ic>;
> +               status = "disabled";
> +               /* Does not need pinctrl properties */
> +       };
> +
> +       i2c2: i2c-bus@c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0xc0 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <2>;
> +               interrupt-parent = <&i2c_ic>;
> +               status = "disabled";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c3_default>;
> +       };
> +
> +       i2c3: i2c-bus@100 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x100 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <3>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c4_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c4: i2c-bus@140 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x140 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <4>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c5_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c5: i2c-bus@180 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x180 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <5>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c6_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c6: i2c-bus@1c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x1c0 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <6>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c7_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c7: i2c-bus@300 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x300 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <7>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c8_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c8: i2c-bus@340 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x340 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <8>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c9_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c9: i2c-bus@380 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x380 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <9>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c10_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c10: i2c-bus@3c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x3c0 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <10>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c11_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c11: i2c-bus@400 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x400 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <11>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c12_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c12: i2c-bus@440 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x440 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <12>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c13_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c13: i2c-bus@480 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x480 0x40>;
> +               compatible = "aspeed,ast2400-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <13>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c14_default>;
> +               status = "disabled";
> +       };
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index ddfb729bb85a..905edd7b83ae 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -18,6 +18,23 @@
>                 };
>         };
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> @@ -1149,199 +1166,243 @@
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
> -
> -                               i2c0: i2c-bus@40 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x40 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <0>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <0>;
> -                                       interrupt-parent = <&i2c>;
> -                               };
> -
> -                               i2c1: i2c-bus@80 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x80 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <1>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <1>;
> -                               };
> -
> -                               i2c2: i2c-bus@c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0xC0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <2>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <2>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c3_default>;
> -                               };
> -
> -                               i2c3: i2c-bus@100 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x100 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <3>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <3>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c4_default>;
> -                               };
> -
> -                               i2c4: i2c-bus@140 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x140 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <4>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <4>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c5_default>;
> -                               };
> -
> -                               i2c5: i2c-bus@180 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x180 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <5>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <5>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c6_default>;
> -                               };
> -
> -                               i2c6: i2c-bus@1c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x1C0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <6>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <6>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c7_default>;
> -                               };
> -
> -                               i2c7: i2c-bus@300 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x300 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <7>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <7>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c8_default>;
> -                               };
> -
> -                               i2c8: i2c-bus@340 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x340 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <8>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <8>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c9_default>;
> -                               };
> -
> -                               i2c9: i2c-bus@380 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x380 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <9>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <9>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c10_default>;
> -                               };
> -
> -                               i2c10: i2c-bus@3c0 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x3c0 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <10>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <10>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c11_default>;
> -                               };
> -
> -                               i2c11: i2c-bus@400 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x400 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <11>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <11>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c12_default>;
> -                               };
> -
> -                               i2c12: i2c-bus@440 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x440 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <12>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <12>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c13_default>;
> -                               };
> -
> -                               i2c13: i2c-bus@480 {
> -                                       #address-cells = <1>;
> -                                       #size-cells = <0>;
> -                                       reg = <0x480 0x40>;
> -                                       compatible = "aspeed,ast2400-i2c-bus";
> -                                       bus = <13>;
> -                                       clock-frequency = <100000>;
> -                                       status = "disabled";
> -                                       interrupts = <13>;
> -                                       pinctrl-names = "default";
> -                                       pinctrl-0 = <&pinctrl_i2c14_default>;
> -                               };
> -
>                         };
> -
>                 };
>         };
>  };
> +
> +&i2c {
> +       i2c_ic: interrupt-controller@0 {
> +               #interrupt-cells = <1>;
> +               compatible = "aspeed,ast2500-i2c-ic";
> +               reg = <0x0 0x40>;
> +               interrupts = <12>;
> +               interrupt-controller;
> +       };
> +
> +       i2c0: i2c-bus@40 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x40 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <0>;
> +               interrupt-parent = <&i2c_ic>;
> +               status = "disabled";
> +               /* Does not need pinctrl properties */
> +       };
> +
> +       i2c1: i2c-bus@80 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x80 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <1>;
> +               interrupt-parent = <&i2c_ic>;
> +               status = "disabled";
> +               /* Does not need pinctrl properties */
> +       };
> +
> +       i2c2: i2c-bus@c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0xc0 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <2>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c3_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c3: i2c-bus@100 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x100 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <3>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c4_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c4: i2c-bus@140 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x140 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <4>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c5_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c5: i2c-bus@180 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x180 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <5>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c6_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c6: i2c-bus@1c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x1c0 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <6>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c7_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c7: i2c-bus@300 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x300 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <7>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c8_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c8: i2c-bus@340 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x340 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <8>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c9_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c9: i2c-bus@380 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x380 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <9>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c10_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c10: i2c-bus@3c0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x3c0 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <10>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c11_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c11: i2c-bus@400 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x400 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <11>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c12_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c12: i2c-bus@440 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x440 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <12>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c13_default>;
> +               status = "disabled";
> +       };
> +
> +       i2c13: i2c-bus@480 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <1>;
> +
> +               reg = <0x480 0x40>;
> +               compatible = "aspeed,ast2500-i2c-bus";
> +               clocks = <&clk_apb>;
> +               bus-frequency = <100000>;
> +               interrupts = <13>;
> +               interrupt-parent = <&i2c_ic>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c14_default>;
> +               status = "disabled";
> +       };
> +};
> --
> 2.11.0
>
