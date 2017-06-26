Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wwzN748g4zDr0c
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 16:16:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7p/c5Zt"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id g124so2439400ywg.1
 for <openbmc@lists.ozlabs.org>; Sun, 25 Jun 2017 23:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wkX3nxhIYQ7LHh7VlndHvErtLx5H6ijNW0UllnKNbF0=;
 b=I7p/c5ZtgdQ/luhwa0yFDjYBMa8tpTdiEpn6XVztgylJDkaHUGoObGGgxqQtyQzB1b
 t0PP5h9FbGBSdF0Zq2GKYYnM+AOiVborvdmcZRINXGrh0v4yVNoDSwzKyrtIqgvvkQ+a
 Ob2ueFrPYPhm8GuyEPMtZuhOq66+q6cWwQcySL1ARzSNt9DXi3duKEqWpOfGQzY/klNH
 Zdno60zjBeOO5E5LhVMGttsrWmSEzb+PqvqwY/DWFXbq6EMDLUt20pQHiVpH2y80wxS1
 xRUxPbH6ECWkZAW+PXwYAQvQzeXUcd2fo4twaGQoViWu75Ukp3JYG8FScbG1/lvFfkNH
 RQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wkX3nxhIYQ7LHh7VlndHvErtLx5H6ijNW0UllnKNbF0=;
 b=BYeOzTyxqkLFQcupsvP4JikKSKELoP8JgO+ZDYGRRdDMeDs1Tff0jLf8zPxD53Y3TM
 BMu3m53ytojEcr9po3p25JBHZb3QApkdP2bh+w5ms/0g8o4qsY+LotKul4OfVIXwadut
 ElR3DicZnFW23xdRQ1oPXxloJEofqANL9M7z8L34PRJ5Nm9vtMRPosVXZqqe2SnRmRn7
 gmD5o/KNLl/7XtGBaxdhbSBzV8ML6j0/FYHg/urwrUTXnMbthV4mFP9eVJ4v5EcEaDju
 0n+TsUTrn6UnO+lD4ohTD7JcI8xaP7+JAZuxZNfuHQv1p01Ga4w7ZndYMzVs+lvFlly1
 12dw==
X-Gm-Message-State: AKS2vOxc/sxMGI5ilIqvpGCMl3zhU3jsgxfK1EOf57lpNuWIJTb9mJWV
 j1UtWTkwcw+vXQEX+aAhkk1xgx8lDA==
X-Received: by 10.129.52.148 with SMTP id b142mr12603447ywa.164.1498457797066; 
 Sun, 25 Jun 2017 23:16:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Sun, 25 Jun 2017 23:16:16 -0700 (PDT)
In-Reply-To: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 15:46:16 +0930
X-Google-Sender-Auth: 5yE87SI8HmO05NiphGMpQyvNp5M
Message-ID: <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Brandon Wyman <bjwyman@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Mon, 26 Jun 2017 06:16:40 -0000

Hello Brandon,

On Sat, Jun 24, 2017 at 9:26 AM, Brandon Wyman <bjwyman@gmail.com> wrote:
> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
> is used for fan fault and identify LED control. Adding this chip and the
> LED lines to the device tree.

Great first submission. One issue I found, please see below.

>
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 47 ++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..e5e3b37 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -203,6 +203,53 @@
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
>         };
> +
> +       pca0: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;

You've missed out the #address-cells and #size-cells properties here.
Without these you would have seen this when you compiled the patch:

  DTC     arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dtb
Warning (reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@0 has invalid length
(4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@1 has invalid length
(4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@0

If you go back and check the bindings document, you will notice that
it specifies these properties as required:

- #address-cells: must be 1
- #size-cells: must be 0

https://github.com/openbmc/linux/blob/95dffc96f1f1271c60f180bf736e18278f905a88/Documentation/devicetree/bindings/leds/leds-pca955x.txt#L13

Please send a v2 with this fixed.

Cheers,

Joel


> +               fan0: led@0 {
> +                       label = "fan0:yellow";
> +                       default-state = "keep";
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               fan1: led@1 {
> +                       label = "fan1:yellow";
> +                       default-state = "keep";
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               fan2: led@2 {
> +                       label = "fan2:yellow";
> +                       default-state = "keep";
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               fan3: led@3 {
> +                       label = "fan3:yellow";
> +                       default-state = "keep";
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               led@13 {
> +                       label = "yellow";
> +                       default-state = "keep";
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               led@14 {
> +                       label = "green";
> +                       default-state = "keep";
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +               led@15 {
> +                       label = "blue";
> +                       default-state = "keep";
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_LED>;
> +               };
> +       };
>  };
>
>  &i2c4 {
> --
> 1.8.2.2
>
