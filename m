Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNz214CXwzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 12:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBpza/GQ"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id l16so228163ywb.2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MkHH4PgyhIZHSkO9RjOLGk0UKErJ7ZQnT/HhnZ27YF4=;
 b=UBpza/GQN6Hk0sm/vC7O8BN+rmWkkoguPkip1Kfz7AH6sNttc+7HwaM8Qv10M/hYKM
 1IvcUFrEx7zpDk7go3t3Gwh5z00aAvvOLIfqeMJQwhj7kBxEbbESf1q0VGiRAAyEnqEr
 6Sdys4N4wYtf8rn0iLEoJAYIX0o32DfB0MBLQbWf917oBGVs8EhOqUmeLxLxX80HaDoM
 7KSpJvyQUBBbCxGoBEj30LWe81hKizRDuuz2YYDmqbrjUNLrBUO3oQdloLywP0NpgyFn
 T4V/xagu7SrJQqE0gwR7/x+dnItVaQGhWo3Ipmhy4P8NV6sQUrC3z7fkRrJuaYqe2308
 PclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MkHH4PgyhIZHSkO9RjOLGk0UKErJ7ZQnT/HhnZ27YF4=;
 b=gfjzFaRisKNjcX6sXjqmJliHHv6bTSgLTkkLDLpaRtxpjBW/Ax/X6AP1QFlMJaSWnh
 yWtXnUY9DRm7W2FT95lrCP8Vb8Cf81+pfl57D9S2ySKOTLwEpjKW3CQO9++DGgFlAIrN
 Cutli2XxKRwdyriRJgVw1vau9EihQF5HHv4GAiCEc8yOqaJXiY54BYgZiPFgvAOMSWxn
 QSpGtqx26MlMnKMAbGwgD7r7ABpo3LsfYKrNnxb4w8ZDUQ+UIEjiRQbcqmNeAYVGrA5s
 zHv2DfDshrOGSkjqCuj0XuieNmHFqMfwSN0X1pCvM5qniUrvzjiyKgb3sbo2ozNWyBeD
 rjww==
X-Gm-Message-State: AMke39ly5KKL5TEbFh7uGgajj2cudMCRNmeb3v68f1pn+flcbV3RVLjiVn0Xjys8C4j49mgiCQqU+aYCk5y+Lg==
X-Received: by 10.129.91.194 with SMTP id p185mr27173567ywb.50.1487208214709; 
 Wed, 15 Feb 2017 17:23:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Wed, 15 Feb 2017 17:23:13 -0800 (PST)
In-Reply-To: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Feb 2017 11:53:13 +1030
X-Google-Sender-Auth: 8w4jlYa2q_nKXAXjujA7zWTLWv8
Message-ID: <CACPK8XdVVVEKiP1Z0Kk1ywstbDKtYi4vFByRbpUnLoenbhCnNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Thu, 16 Feb 2017 01:23:38 -0000

On Tue, Feb 14, 2017 at 6:00 PM, Lei YU <mine260309@gmail.com> wrote:
> Define the pins used on Romulus by the FSI GPIO master.

I compared these pins to pdbg and they look good.

> Signed-off-by: Lei YU <mine260309@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index f47eb63..bc13ad9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -1,7 +1,7 @@
>  /dts-v1/;
>
>  #include "aspeed-g5.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>
>  / {
>         model = "Romulus BMC";
> @@ -31,6 +31,17 @@
>                 };
>         };
>
> +       fsi-master {
> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +
> +               status = "disabled";
> +
> +               clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> +               mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +               trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +       };
>  };
>
>  &fmc {
> --
> 1.9.1
>
