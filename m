Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLXYJ6HfBzDrMt
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 18:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HtSbNpjj"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id t139so9349145ywg.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=v1XyS03NfIbsElJ6EHXi6ClOetsX5qVjk6haYtXOQdI=;
 b=HtSbNpjjlXgNlpgjDx7BH2nWNqExicNip7ArQig65Bp3BfYlX3cnvUtRxU6a95NPFQ
 6KAMtItFQQygE5db1GeESHnCZA6Rz//9D4indzur1SVKCknZmWjIowaXp/goVxIvHBah
 ++E29sVNJzzYBwcCTN8F2kYdL4aUz/Ey9n43PtI+AU87AFxKms0izl2ltLcszI/nbUrA
 xf8mA3ZquJFjBsYRo0SBSjO7bE+AfFJwUOIZlE4aKMKzVR6dpRj3NN3FhrdsDaTpx4Gy
 eN0au4GH1iHVjrbIvJSjWYHaEvLQom/ro5hZOvNuS7mhNFINeOSQwTA+ViWd+Q6Nz4RV
 FdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=v1XyS03NfIbsElJ6EHXi6ClOetsX5qVjk6haYtXOQdI=;
 b=D6cBXQCsuojGGPVCOgBhXr9yKSXsbhb00K3do0QOMgfKUbOV35jOY+yDR5fBpYMj6T
 aHsPbaYRxXgP7ODeJGzEvbMkvv8nP6rIe3bKB+pXIwQzwoDLoAs6kjxu5VhymwjlFpYk
 QEyJwVYV424oBVoKvS7y4Ccs20+JjQvEEGJZBSkX0noQTRSTrQ93fYHsoRweedVYJfSC
 Msa1ZkFLbPaz8SPUGA8GEQ1GFMHVstyop5Gkh51kr0j5MlbPmm0blfhVI3aJMS7hh+OG
 j9IeggN10Fp7pB8iI9KLDegFT8WaY1ZPiTXCTrst/EtLqFNWlUXeUjzzXDlQ9tgEd7Ef
 pBeA==
X-Gm-Message-State: AIVw112SnwenTO6nI4inaHDsqFBTJBrEown33fX8g31nilOleLSPdi20
 E3bNve8vPrmBALLqupriuVFmPdlYjw==
X-Received: by 10.37.190.74 with SMTP id d10mr421167ybm.188.1501489458049;
 Mon, 31 Jul 2017 01:24:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 01:23:57 -0700 (PDT)
In-Reply-To: <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 17:53:57 +0930
X-Google-Sender-Auth: I9HC31-XLgzJdmhmiR4TAnLNQrk
Message-ID: <CACPK8XcOLYf-r_r=H_y-=RQUdLs8jUXmX=osdJZVvfpkpiotJQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v6 1/2] ARM: dts: aspeed: Witherspoon add
 gpio-keys-polled for fan presence
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 08:24:21 -0000

On Sun, Jul 30, 2017 at 4:06 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Add gpio-keys-polled  node for pca955x fan presence lines.
> Add GPIO details to pca955x for the presence lines as well.
>
> Polling period of 1 second determined to be the max acceptable
> value based on discussions with Brad Bishop and Matt Spinler.
> Tested with gpiomon program - verified.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v6 - Add gpio pin details for fan presence to pca955x node
> v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
>      gpio cells property and wrong format for poll-interval.
> v4 - Add details regarding polling period to commit message.
> v3 - Remove 'autorepeat'
>    - Increase polling period to 1 second.
>    - Remove GPIO specifiers from pca955x in dev tree
> v2 - Change 'linux,code' from a unique global value to a local one
>      for all the gpio-keys-polled devices.
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 5afc03a..70328668 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -56,6 +56,37 @@
>                 };
>         };
>
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               poll-interval = <1000>;
> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +                       linux,code = <4>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +                       linux,code = <5>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +                       linux,code = <6>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +                       linux,code = <7>;
> +               };
> +       };
> +
>         leds {
>                 compatible = "gpio-leds";
>
> @@ -277,6 +308,7 @@
>                 reg = <0x60>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> +               #gpio-cells = <2>;
>
>                 fan0: led@0 {
>                         label = "fan0";
> @@ -302,6 +334,26 @@
>                         reg = <3>;
>                         type = <PCA955X_TYPE_LED>;
>                 };
> +               fan0_pres_gpio: gpio@4 {
> +                       label = "fan0_presence";

These signals are all labled _N, so I would expect them to be marked
as active low in the device tree. I am looking at the pass 4
schematic.

Cheers,

Joel

> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               fan1_pres_gpio: gpio@5 {
> +                       label = "fan1_presence";
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               fan2_pres_gpio: gpio@6 {
> +                       label = "fan2_presence";
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               fan3_pres_gpio: gpio@7 {
> +                       label = "fan3_presence";
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
>                 front_fault: led@13 {
>                         label = "front-fault";
>                         default-state = "keep";
> --
> 1.8.2.2
>
