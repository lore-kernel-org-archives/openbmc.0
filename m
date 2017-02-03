Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDz3N1dDzzDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:57:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="poiqm/yA"; 
 dkim-atps=neutral
Received: by mail-ot0-x244.google.com with SMTP id 73so567611otj.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=q+RVFtCAkA6ZV2wEOlYRdArVeS1e1ZQYVfUTXz2Ds7w=;
 b=poiqm/yAWAbpphonLvd19YP4ulTFQt1+LkfORUAxqrONSgorjz/NfYvafBQULvIsVM
 BjHug6s9Q6ycyqGG9mfpTs83XAoBo8h9EXnmFTbU85w6iVBbtBh+ulDJipu9zDlyZzbe
 OYpUlhY+T3Po8phBBOvjq6MFWEZWjdCGZJy4gzNm4qa/GDQ4jBZ9pyNP1mLynB2Xw1/d
 WvQFRam+KcicaLpIw7jhNBc15gNtq2Rtiw7tkNllcNhdfr1pX6GDX39Hfi4a1e9Ncah5
 mKzCJ4oKYFst+opOheZB6Ix1mJlU+LzOjy+L0N5uVB2nfRXHOEDwHimK192ij4RuA2Sw
 fkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=q+RVFtCAkA6ZV2wEOlYRdArVeS1e1ZQYVfUTXz2Ds7w=;
 b=E6iITb6JJDCyVmhLBCtwtE2OKOqPHa/CRyBqEwjYBsol6hx59HyUjHMc88AtEhN1sl
 RBFBc43vZirWwLufqNTdRdAdw0V1otOqeJeF07dsgE3YLMCrMiQXBJ/ZffdtqVDvCQna
 ub4QNHtbcKPXVP5N6c1aWncF+2e8p901Q9UJSPySI6i1F84nvfB7z6EN3LLi8+18kMyu
 OknBYTEeusphDH1JMmloaJFcOXnXNAb63jKyE1/+lLg6RLLhdkmzAGPzaQw8sCUF3ouC
 EzlhCrO9016gDtkdUdPhLUvWBEhlbe4DeQ7iqZ1SGfHj7EKhW8lETwWpUkMXR+NFlrbT
 SedQ==
X-Gm-Message-State: AIkVDXIVoReidyOqQZi5aVHwNA/3kpgPj3gwDEhXCEdoPJMmTHr+83rurMYlg0fEpwLMczdrsTRS4TC1Zy/ctw==
X-Received: by 10.157.46.67 with SMTP id c3mr6062918otd.163.1486083422297;
 Thu, 02 Feb 2017 16:57:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 16:56:41 -0800 (PST)
In-Reply-To: <20170201014414.31868-1-raltherr@google.com>
References: <20170201014414.31868-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:26:41 +1030
X-Google-Sender-Auth: xIRM-mY5OC0_0C2ou2ORCN2khPQ
Message-ID: <CACPK8Xcj+PS=ubZFFPKmGYqT4+Hmf8KuLrP8-o3FBEer-kmGOg@mail.gmail.com>
Subject: Re: [PATCH linux v4] dts: Minimal device tree for Quanta Q71L BMC
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
X-List-Received-Date: Fri, 03 Feb 2017 00:57:04 -0000

On Wed, Feb 1, 2017 at 12:14 PM, Rick Altherr via openbmc
<openbmc@lists.ozlabs.org> wrote:
> Supports:
>   - BMC console UART
>   - BMC boot flash
>   - host boot flash
>   - host virtual UART (host console)
>
> Signed-off-by: Rick Altherr <raltherr@google.com>

Thanks, applied to dev-4.7.

Cheers,

Joel


>
> ---
> Changes in v2:
>  - Reserve correct VGA framebuffer location in RAM
>  - Remove pinctl settings for FLBUSY and FLWP as Q71L uses those pins as
>    GPIOs
>  - Enable I2C masters used by Q71L
> Changes in v3:
>  - Remove opp prefix from dts filename as this is not an OpenPower
>    machine
> Changes in v4:
>  - Fix commit message noise.  Time to go home.
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 120 +++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> new file mode 100644
> index 000000000000..229764c091dd
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -0,0 +1,120 @@
> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Quanta Q71L BMC";
> +       compatible = "quanta,q71l-bmc", "aspeed,ast2400";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x40000000 0x8000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@47800000 {
> +                       no-map;
> +                       reg = <0x47800000 0x00800000>; /* 8MB */
> +               };
> +       };
> +
> +       ahb {
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0x94
> +                               0x20000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2400-fmc";
> +                       aspeed,fmc-has-dma;
> +                       interrupts = <19>;
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +                       };
> +               };
> +
> +               host_pnor: spi@1e630000 {
> +                       reg = < 0x1e630000 0x18
> +                               0x30000000 0x01000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2400-smc";
> +                       flash {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +                               label = "pnor";
> +                       };
> +               };
> +       };
> +};
> +
> +&pinctrl {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_vgahs_default &pinctrl_vgavs_default
> +                       &pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       use-ncsi;
> +       no-hw-checksum;
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> --
> 2.11.0.483.g087da7b7c-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
