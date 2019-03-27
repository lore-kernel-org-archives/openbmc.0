Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="aVVPEC0A"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TdD070fnzDqP4;
 Wed, 27 Mar 2019 17:20:48 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v32so17525468qtc.10;
 Tue, 26 Mar 2019 23:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RkAqskGhb3rKweR8/hhft1cpPbTDZf0GMF4rn5LhENs=;
 b=aVVPEC0AqdWhDa5lTxQmZLe/BDKnQcEhVvNX3y8UwvSA5VGYhOpyfBUGp/bJWfQl5/
 1PziOXRErZfGvgPkWFJ6bW52Ih05nucELMncno3cjvshzBEJTmcILM647/gnhNt+mcRN
 ClNdDw6sZmjnJGL1GtEzUaspnsQdbJIFBLBh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RkAqskGhb3rKweR8/hhft1cpPbTDZf0GMF4rn5LhENs=;
 b=LGKn0YGA8o4fTooE5kqziXHWDZb8pQ2ZnfzVmNkrqUbtbO+velgEcLJ9XLIljTqVbM
 n70LEeqZs1LTdaIdzCpYZUx4zH2h3m7vm/0Ph43qqmBk99XCMwLsBkfVfcWkRg1yNwwv
 ZUYKMiPSwy4mmPmhZ9sjdUvrUJW03WcB//uUcrmsNnVi12YBSF9ZJDD/6K75WLGRf/RJ
 crvnZ/zOJgb+JUIHPrxIl/YsJfjySS0qmpMZdiP73cfRwItSavOWQ2lBbskOL2S1C9cG
 COsVz0kQaKq9m58aZnnaNLmnjSV2cuiHvOqxMMceZ/eld8ChDXdwFa54CR0RbIKnulfg
 H5KA==
X-Gm-Message-State: APjAAAUqR5ETOr1N4AsZyaQHnup/YbWSJ1BxtTVkXt3VubpC5NaghDVu
 OswPd1xXqPFI+388+SW+HWxLwyVSUyxjZv51Unw=
X-Google-Smtp-Source: APXvYqwh9gksAJn5vQ5BQhZZ5awjMrtDUxj1xvTfHKD+HZ1APKc2Z/k+9r29pfZfitpHL15bxxUpV8ybfm1jOlUB2ys=
X-Received: by 2002:aed:3641:: with SMTP id e59mr28965120qtb.235.1553667646397; 
 Tue, 26 Mar 2019 23:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:20:35 +0000
Message-ID: <CACPK8Xer53amWbQ-6dvEaXfHu=grk3ZWsH9NKCa_Xi_JKUnCMg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2019 06:20:49 -0000

On Tue, 12 Mar 2019 at 16:50, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add simplified partitions for BMC and alternate flash. Include these by
> default in Witherspoon.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi  | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts       |  3 ++-
>  3 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
> new file mode 100644
> index 0000000..9277599
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi

As there are no other machines that use this layout, I think you
should have the layout in the dts file.

> @@ -0,0 +1,18 @@
> +               label = "alt-bmc";
> +               partitions {
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               compatible = "fixed-partitions";
> +                               u-boot@0 {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "alt-u-boot";
> +                               };
> +                               u-boot-env@60000 {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "alt-u-boot-env";
> +                               };
> +                               obmc-ubi@80000 {
> +                                       reg = < 0x80000 0x1F80000 >;
> +                                       label = "alt-obmc-ubi";
> +                               };
> +               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
> new file mode 100644
> index 0000000..0059ad1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
> @@ -0,0 +1,18 @@
> +               label = "bmc";
> +               partitions {
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               compatible = "fixed-partitions";
> +                               u-boot@0 {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env@60000 {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               obmc-ubi@80000 {
> +                                       reg = < 0x80000 0x1F80000 >;
> +                                       label = "obmc-ubi";
> +                               };
> +               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c51e3e8..058b9b7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -191,7 +191,7 @@
>                 label = "bmc";
>                 m25p,fast-read;
>                 spi-max-frequency = <50000000>;
> -#include "openbmc-flash-layout.dtsi"
> +#include "aspeed-bmc-opp-flash-layout-ubi.dtsi"
>         };
>
>         flash@1 {
> @@ -199,6 +199,7 @@
>                 label = "alt";
>                 m25p,fast-read;
>                 spi-max-frequency = <50000000>;
> +#include "aspeed-bmc-alt-opp-flash-layout-ubi.dtsi"
>         };
>  };
>
> --
> 1.8.3.1
>
