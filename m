Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t90GJ1sTSzDt1g
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:37:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=d89O4ilE; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 128so9240028oih.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Mb1Eacj9yLIDewehX6mRBif7RMsGMcIto1lLlE86SdE=;
 b=d89O4ilE8tvtAqELMb0ZDYqsOgMcFizESBvQg47vyZR1S4+SCxSq725iKp9GawXxhg
 p7K600VQQxl73TdNb4V1KOBmopoi0/O2u1zFy7W759GKQ8ocqH7qy0owCOwb1Zm7A1Nd
 x5Du/fygVvp7IYkFJ8QeSq8Da+ajkc5Bute/2f3lM5Wmc1GFfrM9YYpkcQ5FuitHtV9s
 sSpyC+GQo3p36LNxzz2X3Go7GuNcgOBA/zQJlVZGcE6PzNApU3H5xrr2XUpVwgdN+R+F
 AuPI4c6JffRh242bstT7nGxooNAnWIaJq5dS7j0xBYvQkhbA1NWJMvWoFDovi3eUKnoA
 /+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Mb1Eacj9yLIDewehX6mRBif7RMsGMcIto1lLlE86SdE=;
 b=Emy4tSnrOOfYuHZY3IigIP0F8qOlbwQP5bcsAVqEFqGzoNAo6XiHVzEnA5ojbz8j4p
 dYUf/1fsfgFk18B/eaJN64bNWjx3DM+8AijhJigRKW627L8CJ0WgOBzzbjjYQJG2CDXT
 T1nwemQGtT1wEPPieb1Wz4RiIcCFn/N17Hbuk+E40eoBgHtzZfuUlpRDekX9DQb7eINM
 C3nR8r0cz+CBtDC7c6utxCZOJ9EezRAm1g7uXTEiQJCiW78TwRxUaZNhSL6TShXKZlh5
 DkKKs3oXoxEiskyPtkRf0Z01TINaG4hcW03HpsgzPOHfP0AC0j4paFWkFHpXkvgOCifi
 MHKA==
X-Gm-Message-State: ABUngvdqzg2dIQmX7/aHij/TPa1EFyLH39JgNQf8tLA/q8BdH62CPiCmcGuaP4XmFX/GX9PYyvwIbsSi/xfJwQ==
X-Received: by 10.202.252.133 with SMTP id a127mr10046772oii.124.1478212646504; 
 Thu, 03 Nov 2016 15:37:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 15:37:06 -0700 (PDT)
In-Reply-To: <1478047846-44588-1-git-send-email-xow@google.com>
References: <1478047846-44588-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 09:07:06 +1030
X-Google-Sender-Auth: 6exH_g7Pwage4Eygid0_k1Vo9eo
Message-ID: <CACPK8XdYPsz+Q9=cU+XYau=exvSooX+kLLzJ52pcYRvzU7Acug@mail.gmail.com>
Subject: Re: [PATCH linux v2] ARM: dts: aspeed: zaius: Update with new spi-nor
 binding
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
X-List-Received-Date: Thu, 03 Nov 2016 22:37:28 -0000

On Wed, Nov 2, 2016 at 11:20 AM, Xo Wang <xow@google.com> wrote:
> Zaius has one flash module for the BMC firmware, one flash module for
> the host firmware, and one more flash module on SPI2.
>
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.7.

Cheers,

Joel

>
> Changes since v1:
> - Added SPI2 pinctrl selectors
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 73 ++++++++++++++----------------
>  1 file changed, 33 insertions(+), 40 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index eef045b..9e59649 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -20,46 +20,6 @@
>                 reg = <0x80000000 0x40000000>;
>         };
>
> -       ahb {
> -               bmc_pnor: fmc@1e620000 {
> -                       reg = < 0x1e620000 0xc4
> -                               0x20000000 0x04000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2500-fmc";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -                       };
> -               };
> -
> -               host_pnor: spi@1e630000 {
> -                       reg = < 0x1e630000 0xc4
> -                               0x30000000 0x04000000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2500-smc";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -                               label = "pnor";
> -                       };
> -               };
> -
> -               data_pnor: spi@1e631000 {
> -                       reg = < 0x1e631000 0xc4
> -                               0x38000000 0x00800000 >;
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       compatible = "aspeed,ast2500-smc";
> -                       flash@0 {
> -                               reg = < 0 >;
> -                               compatible = "jedec,spi-nor" ;
> -                       };
> -               };
> -       };
> -
>         leds {
>                 compatible = "gpio-leds";
>
> @@ -85,6 +45,39 @@
>         };
>  };
>
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";
> +       };
> +};
> +
> +&spi2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi2ck_default
> +                    &pinctrl_spi2cs0_default
> +                    &pinctrl_spi2cs1_default
> +                    &pinctrl_spi2miso_default
> +                    &pinctrl_spi2mosi_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +       };
> +};
> +
>  &uart5 {
>         status = "okay";
>  };
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
