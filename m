Return-Path: <xow@google.com>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com
 [IPv6:2a00:1450:400c:c0c::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x496K6rlszDr67
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 08:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KIHoAa4w"; 
 dkim-atps=neutral
Received: by mail-wr0-x233.google.com with SMTP id k67so65248081wrc.2
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9WxZUkjHgPfLXPO5+dFt8hB7FcQBP+KzrmBn4UgBkMs=;
 b=KIHoAa4wJ/7BisSjFObaJKeTrVcA4f5kKdKQital0qY/F3F98IICjJQCXTDZPaVyFJ
 KQkfNkLs3eWdCAddJPthFcgfJBBPwQNP3hLpB/Nt1okXp3Y+Nlk2jQzEO+teNtdVrNYc
 li+X3ay2HwkvYROv6uqNbOLKXlirQKQ2CYYTZ/6Ayx8kgYD7MGmduHpREvIH74Q69ktE
 NVZvjiLwj2uj4GRQbnSDg1j2FxHE/XgXtxDspx/iFjlMiyc3fweGf3GXWLjStvr4SHJT
 ngzNQIh+pJJfw1zLA//lD+VKIJXcf4YbqCjGP1YsLHzIfopBcQcu8uB9UQaW1ZCmiOtp
 RVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9WxZUkjHgPfLXPO5+dFt8hB7FcQBP+KzrmBn4UgBkMs=;
 b=nonY3xxnhtVwzV5VEcv7At6hgiIwtQgAwC9e3l51v2ifxhWDeyXdgBX9162lrt/lgK
 b1B24EPRBZqQXmjSsHEWaNnWPGWum4f6eXBoNR4jJ7UxzfL2SFw446gJLsIB+/IM1XM6
 WHTlCeUS9gaeN/KH84qerDu1ZQMBegpn4XROsK0pLprk+akJ30743jKge3HzdfCw49wc
 xyBZptQfAoXFMd+Ipy622DslQ/N3lv4K0TSDVX4oX7Nnpc12sCFfMDtOiXgkWQygOzU3
 3nwEojcinMW74Kl9a0O6ozc7I5EsSmKYsa3CsBVeN4s6I3dvzFhTnQFb8wVLg9uVm3F3
 adaw==
X-Gm-Message-State: AIVw113KxCpckz76M2vPsgvDjYJBcDc01mzmvPHwf1KLmNFLnwo9UA4/
 IqBUXUyCtsgCN3rk2oRLJq2EfVaSAdClt0RlyQ==
X-Received: by 10.223.176.119 with SMTP id g52mr2003862wra.26.1499468375024;
 Fri, 07 Jul 2017 15:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.64.131 with HTTP; Fri, 7 Jul 2017 15:59:34 -0700 (PDT)
In-Reply-To: <20170704054206.9160-1-joel@jms.id.au>
References: <20170704054206.9160-1-joel@jms.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 7 Jul 2017 15:59:34 -0700
Message-ID: <CAPH-5w6AmhNybP2is_bB3pmnqTG+8hdxn8MXw1vwcG6+WcFYjQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Move serial aliases into
 dtsi
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 07 Jul 2017 22:59:39 -0000

On Mon, Jul 3, 2017 at 10:42 PM, Joel Stanley <joel@jms.id.au> wrote:
> Instead of specifying the same thing in each dts.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts    | 5 -----
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts   | 7 -------
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts    | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts     | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 4 ----
>  arch/arm/boot/dts/aspeed-g4.dtsi                 | 5 +++++
>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 5 +++++
>  14 files changed, 10 insertions(+), 52 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 1088e1484421..f0786d67700f 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -6,10 +6,6 @@
>         model = "AST2500 EVB";
>         compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 9bfd5462ea9e..bf2e636c2187 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -6,10 +6,6 @@
>         model = "FACEBOOK CMM BMC";
>         compatible = "facebook,cmm-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial1 = &uart1;
> -       };
> -
>         chosen {
>                 stdout-path = &uart1;
>                 bootargs = "console=ttyS1,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index c71a6dbe1410..0774959b1222 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -7,11 +7,6 @@
>         model = "MSN BMC";
>         compatible = "mellanox,msn-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial0 = &uart1;
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200n8 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 2060831e579c..d37d0ea99ffe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -7,10 +7,6 @@
>         model = "Barrelye BMC";
>         compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 873e62ce6673..fef73ea7fd0c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -8,13 +8,6 @@
>         model = "Firestone BMC";
>         compatible = "ibm,firestone-bmc", "aspeed,ast2400";
>
> -       aliases {
> -               serial0 = &vuart;
> -               serial1 = &uart1;
> -               serial2 = &uart2;
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index b64edad3e050..c67fe587d609 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -7,10 +7,6 @@
>         model = "Garrison BMC";
>         compatible = "ibm,garrison-bmc", "aspeed,ast2400";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> index cd7fd3602b1d..833ef17f643e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -7,10 +7,6 @@
>         model = "Lanyang BMC";
>         compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index a171e41790c1..a282de09895a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -7,10 +7,6 @@
>         model = "Palmetto BMC";
>         compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index d53dc597a0ce..a9e36157f1f5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -7,10 +7,6 @@
>         model = "Romulus BMC";
>         compatible = "ibm,romulus-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d03dfb8..355eb56fdb0f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -8,10 +8,6 @@
>         model = "Witherspoon BMC";
>         compatible = "ibm,witherspoon-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index ccf6cad2e382..c6200153a065 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -7,10 +7,6 @@
>         model = "Zaius BMC";
>         compatible = "ingrasys,zaius-bmc", "aspeed,ast2500";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index bb287fb46bb1..cab64e4230c5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -7,10 +7,6 @@
>         model = "Quanta Q71L BMC";
>         compatible = "quanta,q71l-bmc", "aspeed,ast2400";
>
> -       aliases {
> -               serial4 = &uart5;
> -       };
> -
>         chosen {
>                 stdout-path = &uart5;
>                 bootargs = "console=ttyS4,115200 earlyprintk";
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 9cc959fccfa0..6ec0c75f7786 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -33,6 +33,11 @@
>                 i2c11 = &i2c11;
>                 i2c12 = &i2c12;
>                 i2c13 = &i2c13;
> +               serial0 = &uart1;
> +               serial1 = &uart2;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +               serial4 = &uart5;
>         };
>
>         clocks {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 992242d3b22e..4443403d71fb 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -33,6 +33,11 @@
>                 i2c11 = &i2c11;
>                 i2c12 = &i2c12;
>                 i2c13 = &i2c13;
> +               serial0 = &uart1;
> +               serial1 = &uart2;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +               serial4 = &uart5;
>         };
>
>         ahb {
> --
> 2.13.2
>

Reviewed-By: Xo Wang <xow@google.com>
