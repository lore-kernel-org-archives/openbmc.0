Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS0130BgvzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:18:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSqQlNut"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so4310246ywz.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u3SdhHVdQMpm1mBAygCDXcM2Bvw2xu3YpFjx8VPdhxc=;
 b=PSqQlNut434m7/rS2k/kl9MmaZwvxFg/kR5mJurINlh2Vx9qAWveVIU/GG6hrp81vY
 mwTRxYwn3ncOpsokBD2+yyf2BiRd9R6h2iCcEZF1s2n+MEQzCcgtQz1mEy6STNQr6F6Z
 fOsQRFTet2fLu0+51MlgG7kfk51l77GhEqHZDSlM5h0qZLFSbgbFri9LEVAy0eNdyDxn
 vXbaoRCRcFu4b7CLuzFLBBl4Vx2zoZ4dzzp1u5jOttpbnqdMZ0XydITej7UC8aDlwatp
 s7gXWqgU19VUs4yLjn2fNSs8F9lzWItSUO7BUTDGoD9vZawQix2PVkFQ72qS+lAhZpuP
 OhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u3SdhHVdQMpm1mBAygCDXcM2Bvw2xu3YpFjx8VPdhxc=;
 b=rhs/JL1HgHwUkhObv/oOdSjlvemm9GByNYcH3AMEaSqIS9RNoNoIZj43h/JX+CNI6K
 +7O5o4udndBOzdjkkl8t4MmbvbvzVpuGIKyliWkSPv72HMxJaCfz0aFVEoGRNSAgY2IE
 wqmSkg7CpuYHQPiqIooMCyxT06OdU8Oakge8MpCCS7cnY7OLhJvFuHG5JoRGfYqoICpH
 M8RCLjgJ1OGVa4PjBW1M61qTvaZeXRTjSVyqo7IqHdlhHUx5Z0DUGxu3pnwu/C7edcgO
 zGb6+e7492cWxZ2xKb6nKwVw1obVboU3oLCvuGKjWGf6Cc2Wwf64+VisU4/vKkgZcsPR
 R/bA==
X-Gm-Message-State: AMke39n/LnAXQlvEvzvndZDevXyxYJ883NiAB0CmqUfjpsHbuM+n97nfOl6Xordw1LAWH6s0/Nw4RcM1VVOXmg==
X-Received: by 10.129.91.194 with SMTP id p185mr17854788ywb.50.1487632692052; 
 Mon, 20 Feb 2017 15:18:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:17:51 -0800 (PST)
In-Reply-To: <1487632428-9868-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487632428-9868-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 09:47:51 +1030
X-Google-Sender-Auth: TyXUWX_qh1p5tV8XUTU7F6KesU0
Message-ID: <CACPK8Xfvn2dzX9soC_mAQXab_BLDbzUy_H40es+c1uo-AUPu=w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] dts: aspeed: romulus: Add FSI gpio pins and
 enable FSI master
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:18:15 -0000

On Tue, Feb 21, 2017 at 9:43 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add gpio pin config for FSI (source: pdbg romulus pin cfg) and set
> status to "okay".
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Thanks Eddie. Lei already sent a patch to add the pins; could you
review his instead?

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index c23627e..b39280f 100644
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
> @@ -19,6 +19,18 @@
>         memory {
>                 reg = <0x80000000 0x40000000>;
>         };
> +
> +       fsi-master {
> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +
> +               status = "okay";
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
> 1.8.3.1
>
