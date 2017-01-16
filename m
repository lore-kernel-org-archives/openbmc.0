Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v1tjJ3JCszDqGt
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 11:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWJi5Rk6"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id u143so11366015oif.3
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 16:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hV7Y3fYCs6Kr4baH5TJ6oCQ/6XgW/l9FCClSPm/wDwU=;
 b=WWJi5Rk6y9izxdmaPJAK8NReBTHETttM2fVEw/rwloJyjg38Wo9WdNYsIrism3IWFk
 sqj4S7VGUAAHtwGRYyoo4xkbS5Kmb3h6GHe6nqQdcG7qwS4CShf/sKt1lS1LSOeRqMUM
 j+PNxQzGDxPqn8x+EcXlTLIV7GeIDOWE4UPqYe1fyQueYe6kIwbCgC1M1lHupmVz/jwv
 uCiow2yxXm9DS/8Iy8RRgUwwILH7x5sdj50hKepsbi/o+tCeMU9SYgeu6Jse98oxRQEl
 ZW1sz7roaLFHcrgrVXK7xqaVftLcRu1BicGzUJ45UEai/COR6EoIAF6cM5swMZxYYyVr
 D7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hV7Y3fYCs6Kr4baH5TJ6oCQ/6XgW/l9FCClSPm/wDwU=;
 b=FrH2HrQIBOVflfU7ESSoHnlQqiHb5RcMrUO/XAKUZBuVVkh2h/L7PKKzTk2KHWY5Wk
 5Mu2rFNr7yCyV561rFJGO71/Y5xU7Tsjjb5I6Wd97zApMtz2SgJawr/sO6+7fqX3JwkG
 P5BTcEGcC7rbQRntWGYxJtkC3ItztU1B7k9FsZ6KCkpaMdmsmMdWnslDlcEkGEJId1aO
 T+Reys6yAtc2jOcrq/6jUhlVS9wSFp9bzcvtq5AvfHvRznBKSPV66tXvAqZaBgOjQbKs
 kA54ZIRCX5AjkLAeW8GD12T9hrMWeVDhyEo3URGqA3h6mu0CTwuT2Ton3UKOFeZLU5lP
 3M7w==
X-Gm-Message-State: AIkVDXK4rjSye1UebMmbSNJc+0Z7+SerI81RXWVF6RefZFKQ6yXNuSKwdInKcxBNe9XnUkLXwoyh8aVUGbnj7A==
X-Received: by 10.202.50.198 with SMTP id y189mr14258628oiy.198.1484524978460; 
 Sun, 15 Jan 2017 16:02:58 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 16:02:38 -0800 (PST)
In-Reply-To: <20170113192359.18149-1-mspinler@linux.vnet.ibm.com>
References: <20170113192359.18149-1-mspinler@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 11:02:38 +1100
X-Google-Sender-Auth: -YM8chmN7YIyFQLWSYavFc5vzPk
Message-ID: <CACPK8XdNFcZjs7e3X4vWFzYjAyBL6KMyzJ91i=qNF43SZXEzeQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: witherspoon: Add devices
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <spinler@us.ibm.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 00:03:01 -0000

On Sat, Jan 14, 2017 at 6:23 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> From: Matt Spinler <spinler@us.ibm.com>
>
> Add more I2C devices and the rear LEDs.

Please make the subject line more descriptive. "add i2c and led devices".

>
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 39 ++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 9badf3e94599..11de7a957738 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -19,6 +19,22 @@
>         memory {
>                 reg = <0x80000000 0x40000000>;
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               rear-fault-led {

Follow the naming of the other machines. This should be "rear-fault".

Are there other fault leds? If not, call it "fault".

> +                       gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;

Did you attempt to compile this patch? It doesn't build for me, with
the first error on this line.

> +               };
> +
> +               rear-id-led {

Same here. Call it "identify". as in the other dts.

> +                       gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-power-led {

power.

> +                       gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &fmc {
> @@ -115,25 +131,38 @@
>                 compatible = "bosch,bmp180";
>                 reg = <0x77>;
>         };
> +
> +       max31785@52 {
> +               compatible = "maxim,max31785";
> +               reg = <0x52>;
> +       };
>  };
>
>  &i2c4 {
>         status = "okay";
>
> -       /* CP1 TMP423A */
>         /* CP1 VDN & VDDR */
>         /* CP1 VDD & VCS */
>         /* CP1 VIO */
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
>  };
>
>
>  &i2c5 {
>         status = "okay";
>
> -       /* CP1 TMP423A */
>         /* CP1 VDN & VDDR */
>         /* CP1 VDD & VCS */
>         /* CP1 VIO */
> +
> +       tmp423a@4c {
> +               compatible = "ti,tmp423";
> +               reg = <0x4c>;
> +       };
>  };
>
>  &i2c6 {
> @@ -152,13 +181,17 @@
>  &i2c9 {
>         status = "okay";
>
> -       /* Tmp275 */
>
>         /* MUX
>          *    -> PCIe Slot 3
>          *    -> PCIe Slot 4
>          *    -> PCA9517 -> PEX8725
>          */
> +
> +       tmp275@4a {
> +               compatible = "ti,tmp275";
> +               reg = <0x4a>;
> +       };
>  };
>
>  &i2c10 {
> --
> 2.11.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
