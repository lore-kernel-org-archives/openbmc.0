Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPdnP6r1bzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:30:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dhdrjP5n"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id v73so2539881ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Pltq27k/u2dxR8p0Gjefobu1vTKBfZUmYewRGJxONG8=;
 b=dhdrjP5nP/o+LzrKkfYCDszvVdEIBydGZCnA5CfsOFiLSDy7AHTmEduu7iXvjfEI3B
 witnRIwS8mRBapYy2qDi2uciZdibd9fySUum/o2ATUg4DDzuVysjT4kk7ODbjg+by1yf
 OIjb9RGooe/JW+VmkNGv9xf4mrOnvSS/pLXW/kAd1RGLwCvya3VLZc53P9KshfQhJY/0
 BTMkhXtESf+Ks6VwnID/XstYfvxv/1uCMIKaTvlL+0wzHFNb6etI2rdyj30tnM4AlRd/
 1zt+5twWpqjH9II59OQjlR7paRHfSrTMZqaaYoEQQix9/GachOBvyu/l68Vb1XB7A3ZI
 HCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Pltq27k/u2dxR8p0Gjefobu1vTKBfZUmYewRGJxONG8=;
 b=PoELu93tdAvjK6opbYmPOd2zQ0g/s3gotE74QerxHtkSYuIKuYxs1uMZpbS7hObeez
 cXljelouWEdGIdRlMatBxvNHl/bz0UW+xbLOQWiS+Xf3I1lcOW2ClaZRrD+cXZ7KHFj1
 pFFozR8X3qdlCRh5TR7HS2/CSP13c0qk0Kz0Yqc3rKsetAkZTBBUkjNA42GmlKQ258TL
 z78IyVyZkkTK4onIT/aWCignn4pQXn/skPLJSauT1UIYvcl/MlsH9ky8IlvmVxZ3obsP
 nPRLYELr3WsrmYq7bwG6sMwB1qRBj49NgHyjlbKlzz/MR5xPMJRibA01yLEUiE4pBeKB
 xr9g==
X-Gm-Message-State: AMke39mR+2JQ0GUxi9p2KMf6WhrXBBdcbHeMQcb3Y7rUPoWdQLqaQNEXYokbLrPMOVCzX+AOxGMQFqvHaGKRKw==
X-Received: by 10.13.247.134 with SMTP id h128mr4971518ywf.56.1487302199480;
 Thu, 16 Feb 2017 19:29:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 19:29:39 -0800 (PST)
In-Reply-To: <20170214005104.11940-2-andrew@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 13:59:39 +1030
X-Google-Sender-Auth: vGrNP0kpubVGQ3EFps_w2SGIm3E
Message-ID: <CACPK8XfNP560Koh=TCCEu7rWkFU0pFuBBN7J2bB3-0PYo2atyg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
To: Andrew Jeffery <andrew@aj.id.au>, Xo Wang <xow@google.com>,
 Lei YU <mine260309@gmail.com>, Matthew Conolly <mattconolly@fb.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 03:30:02 -0000

On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> (cherry picked from commit daf042580a0dacd894a3825dd6f048364fd66770)
> [AJ: Reworked to disable GFX in the dtsi, as it is missing from the 2520]
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Xo, can we get your ack for the Zaius change.

Lei, please review for Romulus.

Matthew, please review for the Facebook board.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 9 +++++++++
>  6 files changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 9d88f3aadbc6..1999a06eec80 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -79,3 +79,7 @@
>                 reg = <0x4d>;
>         };
>  };
> +
> +&gfx {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index e6d61c3abd80..9e48c4a1313c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -198,3 +198,7 @@
>         status = "okay";
>         /* CPLD at reg = <3E> */
>  };
> +
> +&gfx {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index c23627ec5e84..947cfeb02457 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -155,3 +155,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&gfx {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4b2d8aa8abb6..76b738dd0c6b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -273,3 +273,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&gfx {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f4fe44..e22701bfe5fc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -343,3 +343,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&gfx {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index e1994c9e38c3..b73503c866aa 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -1005,6 +1005,15 @@
>                                 reg = <0x1e6e202c 0x4>;
>                         };
>
> +                       gfx: display@1e6e6000 {
> +                               compatible = "aspeed,ast2500-gfx", "syscon";
> +                               reg = <0x1e6e6000 0x1000>;
> +                               reg-io-width = <4>;
> +
> +                               /* AST2520 doesn't have GFX, so disable */
> +                               status = "disabled";
> +                       };
> +
>                         sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x9000>;      // 36K
> --
> 2.9.3
>
