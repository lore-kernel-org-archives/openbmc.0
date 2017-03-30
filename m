Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvL8Q3xX8zDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 10:15:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U5cPnhVu"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id p125so1670021ybb.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 16:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=bK0zIwD43WW/1mZYdmySjsuGc52SlhstbAN2UJI9ntw=;
 b=U5cPnhVuQW+GDpivK8tAiWnBp/j0Mu3c8ch9iuc49QFWnyWe59sw5A9DgRYtEGCG4q
 fWRiY06Xt/F58UqED41VoCGBtE9EEVgn0pD/Vy1HkvzW2CMaj1B1WimJa1lDIqcfkLYp
 x3HSNh3ZMyNIq3p+zUO8TrM1R6Fx+d2vLLgDpsYusYNKKPpuGFh2gKWG8HNxrgQdZdr6
 Qh9m13yuidIdcRL5NQGPRe0qVWugqs0Z1ekDro9T/wQfhXEvQpyCSQKzzHG2IF8beIZ8
 jRu9462EyWzvuoxUtMoyzf05At7ZGuQgKw2TcjBkX560V1JSHcgy02uwg7NjBHzQSxTv
 oWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=bK0zIwD43WW/1mZYdmySjsuGc52SlhstbAN2UJI9ntw=;
 b=OmLrvFKXzGqTVCyc+77Ht+PK01iSnf86ql5hpgei2wf4kHofaSi739yAkitieLFOgX
 uookCWyOe6kJPQ8cHbVFpVWIkhRYPfCGumpxfADnIcOqHCvtMd+MSQqkHzoW5xL0PyVJ
 5qD78NGAKrtVyEYpermkMQ888Fq/Q0XOdU4YHzRc8+jzoQTQY1C9ffjYOoICybILXXeB
 uMR+INk6uN715df+9jcH81gOPqDSmMluyvq5k82h6t66ImcOmsJAwFSrveS6N472Jug9
 Zp9ynPj/I1rIjeBTIGR5s2cw64fQGVRaV1VLni5pcsFTFvyo+IkOnKbuRDUYM1OW9vih
 P0ag==
X-Gm-Message-State: AFeK/H0/mZbjSvrldR+6YpK+ChH6JMuh7dka8K/4KCNVoit+KIVarMLi9oKkhcyae4UaUb+7upZInVwpR3xMpw==
X-Received: by 10.37.25.139 with SMTP id 133mr1802810ybz.15.1490915732386;
 Thu, 30 Mar 2017 16:15:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Thu, 30 Mar 2017 16:15:11 -0700 (PDT)
In-Reply-To: <20170330010846.6394-1-raltherr@google.com>
References: <20170330010846.6394-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Mar 2017 09:45:11 +1030
X-Google-Sender-Auth: gGZOfWaQn6tvS0uVJNSlsqfDMeU
Message-ID: <CACPK8XcY5t3Cn=4DO+6dB-FMw6c5SKEKgZUWw6iT5ZFEVjbayQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: dts: aspeed: Describe ADCs for
 AST2400/AST2500
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 30 Mar 2017 23:15:35 -0000

On Thu, Mar 30, 2017 at 11:38 AM, Rick Altherr <raltherr@google.com> wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 28408a2e2ad5..e5be87076a6b 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -840,6 +840,13 @@
>                                 reg = <0x1e6e202c 0x4>;
>                         };
>
> +                       adc: adc@1e6e9000 {
> +                               compatible = "aspeed,ast2400-adc";
> +                               reg = <0x1e6e9000 0xB0>;
> +                               clocks = <&clk_apb>;
> +                               #io-channel-cells = <1>;
> +                       };
> +
>                         sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x8000>;      // 32K
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 7c09a26eea6e..48fd068251d6 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -394,7 +394,6 @@
>                                                 function = "LAD0";
>                                                 groups = "LAD0";
>                                         };
> -
>                                         pinctrl_lad1_default: lad1_default {
>                                                 function = "LAD1";
>                                                 groups = "LAD1";
> @@ -1019,6 +1018,13 @@
>                                 status = "disabled";
>                         };
>
> +                       adc: adc@1e6e9000 {
> +                               compatible = "aspeed,ast2500-adc";
> +                               reg = <0x1e6e9000 0xB0>;
> +                               clocks = <&clk_apb>;
> +                               #io-channel-cells = <1>;
> +                       };
> +
>                         sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x9000>;      // 36K
> --
> 2.12.2.564.g063fe858b8-goog
>
