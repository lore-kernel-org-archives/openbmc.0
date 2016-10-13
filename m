Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svb4C1DGbzDsrV
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 13:57:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=UR7UMXRd; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id b186so2912791vkb.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 19:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ljdv/TKvUwGKZ9XJ8fs3Y4EdFvVCB1exGZ6VHW8OeDM=;
 b=UR7UMXRd0tfRRzmxURUo7H5VZOU+Hn4K5Tg4C9GtkT/V6a+dKYbJ0wUs0n2g1HbywD
 8vsJTzkkrv13eE31UyAMQR4MN+NTM+SMLhH2zdZWhwyM9ZGH8jiCZ2VUOnsgZHAZCECp
 sIrLcW8mVSMUc5DxDb02E7dnTGkDxxer9cBvYLSKh/rYDym3oT94IeSCKQ1UsDW5m/oV
 yggZrOrkivwqjydnsWAlHESxFZH9jGFwzaBsNBqj6F+zoHKnYHvm4nC6+uz6JBW2SIuv
 e4aWUiSmt/NRd9YH6eJbSyu6Alk3apVhUgBrb+z1jeVB10Jj7Seno6T7oPPWx5QEIWum
 2ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ljdv/TKvUwGKZ9XJ8fs3Y4EdFvVCB1exGZ6VHW8OeDM=;
 b=F+zyLfPXcHBBAHa8eo2m4NdH7sZQdAEshD2au0tC4H4fu3gSqX6O8fl2r31whmwJkI
 bBi9MKAfYPStivWIfYbd/JVnBj2PeLZsHti0T30lQiAXSmG0zwqs62CicREXGC5aCH0L
 0BvZrjZ3EBmbs7Auu0nUPF1s6gBXLG91PLHly+r31Slmb/BezmgwLTsfSWNPd3YGJfdz
 /UQuKXVHraZ40jGj7tkM2x/FjR3TDo85pYmPlkIjVgrjSYGhdTekwWZQ66P8L/yOt9Lg
 /LmMHKsINUHG5+2wcSKAg0I5RP/fvX3grUCSBs5pYqlER29zrhpRj/BoOb6y6pExhDz5
 V8oQ==
X-Gm-Message-State: AA6/9RlchQaKXhSvgTHy+ixlXxrMAzlzuMLYKFadcILoRK4pBjDLYO3appv+StcKSBMy1FUuUrvVvOWqB8cmBg==
X-Received: by 10.31.129.194 with SMTP id c185mr2574279vkd.67.1476327433264;
 Wed, 12 Oct 2016 19:57:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 12 Oct 2016 19:56:52 -0700 (PDT)
In-Reply-To: <1476312288-100725-4-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
 <1476312288-100725-4-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Oct 2016 13:56:52 +1100
X-Google-Sender-Auth: KrLFy93C_d2w5GNRHcI7wku7Xbo
Message-ID: <CACPK8XfmthcQ075ehzvkpNw_bYtS2C9seVd8rXO0gF_=VevKcA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: aspeed: zaius: Use I2C buses and muxes
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 02:57:15 -0000

On Thu, Oct 13, 2016 at 9:44 AM, Xo Wang <xow@google.com> wrote:
> Enable I2C buses on Zaius that have devices attached and add bindings
> for muxed I2C buses.
>
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index cc2e84b..8c3912a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -102,7 +102,14 @@
>  };
>
>  &i2c1 {
> -       status = "disabled";
> +       status = "okay";
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x71>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
>
>         /* MUX1 PCA9546A @71h
>          *   PCIe 0
> @@ -125,7 +132,14 @@
>  };
>
>  &i2c4 {
> -       status = "disabled";
> +       status = "okay";
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x71>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
>
>         /* MUX1 PCA9546A @71h
>          *   PCIe 3
> @@ -153,7 +167,7 @@
>  };
>
>  &i2c7 {
> -       status = "disabled";
> +       status = "okay";
>
>         /* MUX PCA9541A (other master: CPU0 PCIe 1)
>          *   ADM1272 PMBUS @10h
> @@ -167,7 +181,7 @@
>  };
>
>  &i2c8 {
> -       status = "disabled";
> +       status = "okay";
>
>         /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
>         /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
