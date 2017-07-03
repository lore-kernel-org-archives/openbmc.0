Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1H0w1NWrzDr44
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 16:14:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFqfO7Bq"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id n205so2273261yba.1
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=06ERUj3j8EtwOIMUPA3vWM7huM2kXZ9Nbr0/tGTzB1o=;
 b=VFqfO7BqrtFKLL6u3n1fQR4VZbn9PjP8zu9bG1AsiyKPretDohhb6ZJdNbz6hOCG2O
 9xHVDh7fp1V53qUUl+lds6Hp2UQp7ggw2B0KQI6ttqI2zG3etX/hfTvlGOlt3V1ciy74
 sVZEpsTmhUW855PfnKL86t0qSGb2Ew4aDSv1xxGD/Cy69xQG5CKGR1+UXzQEoXjpXNf6
 lr3TspTvfRNd7wRhmZwRgmHg+3IIc4+ySxP5RsO8bsoQLcaFp5GeL7/vEoqiEU3+pK4D
 fgIt0JNhjgE2SBigg4ldvLfN/GozJBl9MCp3KmGioTrLVNWLPgxrxdWh4n3ha9nRzpM6
 6irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=06ERUj3j8EtwOIMUPA3vWM7huM2kXZ9Nbr0/tGTzB1o=;
 b=ep2f8VZx7vav3dfrwLiriqy9NCRivA6sCMJEHge9ptndpWo2ZXZFnuCZ0d+3i4yzIQ
 3KmeHEpY5Zb7KS+aJ63Yg7urVY3QptFPmdZDzcrZCmu28dHmBbWwH2AKdV1dlI8sMETt
 qEr06BudAHWlghQYwZWV24ivf6pVpdx3D2OTiHHuv8bCF0XL9ZOxhuSn2mvkK92IFlWx
 LNDVQpPJW10nYGtsrtFtrAUWeBW7nhsaODyJ1TYuqPKq2z/7RNZNtFx7rosoO6F8zLUL
 YT5vxnHDP2HuZXunETY6Fg9MrJpheXP7OW/dSJSjvN/8eWNhR2WfkkFnXlgkr6I/3fDN
 dr/w==
X-Gm-Message-State: AKS2vOyv/dd2vdDaoriS7yHN1W2gozyR9wQqB6lt1XVr8hTyQb73Nn0Q
 OM3iN5WUM8j/qpjCmFK2vsSioequYg==
X-Received: by 10.37.88.193 with SMTP id m184mr25497003ybb.39.1499062494246;
 Sun, 02 Jul 2017 23:14:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 23:14:33 -0700 (PDT)
In-Reply-To: <20170630114844.30027-1-c_mykolak@mellanox.com>
References: <20170630114844.30027-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 15:44:33 +0930
X-Google-Sender-Auth: v1vk0AxxkV-NCoceHv13bCbG--0
Message-ID: <CACPK8Xe6g2VZUQBwJopcBBLwjzjsxAaX9arw6Gqh7ZO23htGGA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-tacho.
To: Mykola Kostenok <c_mykolak@mellanox.com>,
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 06:14:56 -0000

On Fri, Jun 30, 2017 at 9:18 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add aspeed,ast2500-pwm-tacho to dtsi.
> Enable aspeed,ast2500-pwm-tacho for msn.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Patrick, you're our pwm/tach expert. Can you please review this one?

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi              | 16 ++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index c71a6dbe1410..55d5dc15d136 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -144,3 +144,48 @@
>         status = "okay";
>  };
>
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 992242d3b22e..01c86bb71932 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -35,6 +35,14 @@
>                 i2c13 = &i2c13;
>         };
>
> +       clocks {
> +               pwm_tacho_fixed_clk: fixedclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <24000000>;
> +               };
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> @@ -366,6 +374,14 @@
>                                 #size-cells = <1>;
>                                 ranges = <0 0x1e78a000 0x1000>;
>                         };
> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
> +                               compatible = "aspeed,ast2500-pwm-tacho";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x1e786000 0x1000>;
> +                               clocks = <&pwm_tacho_fixed_clk>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>  };
> --
> 2.11.0
>
