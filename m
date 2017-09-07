Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uHxz9yr3"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnjwd3zgkzDrVm
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 11:46:25 +1000 (AEST)
Received: by mail-lf0-x244.google.com with SMTP id y15so3797229lfd.0
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wxbA8x2z+0ywJA5r7eAuH42E5DAMwGjEbOsiiXAZxvo=;
 b=uHxz9yr3vEqSmChQBhAWGIHQ6AGiXH5a7S0RdtU8Ps+Q/QpTZjQ7H+heL7prvUStns
 4NN6mKjAJay53kCPXQ+0wSzajDJf7xr2+Oc/3LOT5ugVp1PUnQvXUQh2zv1iA+ywRRl1
 t6CSTbsecACuyrfT/aDKM82tkbCJ39YJSuQ7SfWb3zkkmrlaKSqPoWrbRF4j4lvaJiyR
 5wDbgu90VbyFOYG7zVRnvg3PrWjjHVtKWutaQss18GczIg3Fw78muU5XhtKxGcejWtgJ
 e9cFWvl71A+QEwghTxpPnoP22XPdSL/1Dyr25U8mdrp+CLW4nGq/9ef8RtUncreX6rBf
 sM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wxbA8x2z+0ywJA5r7eAuH42E5DAMwGjEbOsiiXAZxvo=;
 b=q7lUJ8DHdrmSLGdA/UXo6wC5T+vU87yOVS25FevaJmboFKcdP94l/G0c7m2lvSL51x
 iTY9g6f5/qqPXcMxXUZ6bMIq6BNOVxWC3KVxylSiJvH77WN3W4P8b4rBoeVIvIKyk6HI
 50sPkFMtGtS7yLF+VVamff01zjFsPM9Zwdg7QwTXPgVRdi2d/4+AfhW0a3n/ReW666Ff
 HZSpgqzv7NyO6ETpwJeAmI5eAo3rkYlFeM0O5piCiX2PjyYOtCoo1MDtYuIpanMrpobu
 D2fGwEqxugMh2NfDWBCnUfx64U3bOo10TTE29lf+brb6/3z3KERQCcrQCAzXECwjJ3XS
 vPTg==
X-Gm-Message-State: AHPjjUg3phZsmoSQf2Pa5Jts+1YV5Uw2cMPVDEitIX/Sllp5dsJ7E06h
 JJKymbrF2eEsF9C9dP7XUFBet8zl9A==
X-Google-Smtp-Source: AOwi7QCwRL9PTKJixiuWSwAk2UskzYJ6OK67FtGUNzsMGbEkEgZuwlu4IhXIMixBfWruGmlKr0Zowb4sdqH83D4QkUo=
X-Received: by 10.25.78.153 with SMTP id u25mr358491lfk.111.1504748781363;
 Wed, 06 Sep 2017 18:46:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Wed, 6 Sep 2017 18:46:00 -0700 (PDT)
In-Reply-To: <20170906221830.172652-1-venture@google.com>
References: <20170906221830.172652-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Sep 2017 11:16:00 +0930
X-Google-Sender-Auth: rpk8T_icorLrd4Z_oxnZvGhyBMA
Message-ID: <CACPK8Xe6EuHhATmaUaAq2nC4837ZTZezp4z=cJaFnt69Gd35Sg@mail.gmail.com>
Subject: Re: [PATCH dev-4.10] ARM: dts: aspeed: quanta: Add iio-hwmon
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 07 Sep 2017 01:46:26 -0000

On Thu, Sep 7, 2017 at 7:48 AM, Patrick Venture <venture@google.com> wrote:
> Signed-off-by: Patrick Venture <venture@google.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index cab64e4230c5..0ff3af7ed871 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -93,6 +93,13 @@
>                         aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>                 };
>         };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>;
> +       };
>  };
>
>  &fmc {
> --
> 2.14.1.581.gf28d330327-goog
>
