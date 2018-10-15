Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J22vWe/R"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YMVv1BnNzF1Pr
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 13:16:06 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id c23-v6so26570855itd.5
 for <openbmc@lists.ozlabs.org>; Sun, 14 Oct 2018 19:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcu8fiIB22bJnam70bAqxmrTE76sXF4FQR7Ve2reT20=;
 b=J22vWe/R+NdiQVxf4u+G8A72GYih7Ye9oEU0xMGXTAc10KLPHmtwJ4pdARu6ao3Y4x
 8opVvEQtsvj5/ZpZ1cnAPxTRhChufV4Qgg6JOIfREj20UKFEKjtd7LXZnah4qOZnLPvF
 Ow10+riGq0bhJOqY562vlFoXHN6TJrHU8zqgEZJnlRbNzPkkyg5lYaJ/qYiku1Fs2GSE
 4cuqaY7oYWprczm13xBdfj2GCnBu81tNZs5oi8TBKX1JSoIBabt3/XwhLOjNZLPnGxDp
 +kinAviLb30KZWLy+NyAybEwavCZSSJwtA00p4jEAZNj8m25NA7JXYIHmEmuaVpvr9Op
 qzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcu8fiIB22bJnam70bAqxmrTE76sXF4FQR7Ve2reT20=;
 b=Tv8T55lmgYfhqWm/IpwzfHSGrZUmygmKWVY5twFAWrelvdy8w2VZj68DexW+B6gzeC
 +JsSM1b2VzDUSUKrdxEIOpe9nRhE+dKiOH7aYmPpmc+x/sRu7RePlAjnec/6KcM+oXWz
 u6iaVchwPHTWAXbSpsJ46XDm84T+MoqYE3T4IRC9sFh3l2dIVdi/xrbxUUV2HJm/cy0C
 K6cQ68SARfuwrZ2NEshqIWZLnEsf/gxBLwHb4EEDVwp210nzQwlJ4fkhvtTQmzbp1P9e
 uw8A8P/q/jwB4Wc1P2lhQnResrQvEad8ptST7CMWNREb+/+a6mMTVWNuobLQUzz8S/yO
 Dkaw==
X-Gm-Message-State: ABuFfojlDEa7CuHo7xbrogM8VyLReqmRPbFQBPam25xkafNtfw4Ny+8u
 1iKIxQmb7SiN82GneclQUPletAE4Twsov7AL31I=
X-Google-Smtp-Source: ACcGV61rwl963ViD6AMjE77gKZoB3PAwFrBCKNo00Kpdwtkbq41TlY4X8YMqToZVCGcDiVYzjQb6u6qDZOHI+Yq2IK0=
X-Received: by 2002:a24:ef05:: with SMTP id
 i5-v6mr12346379ith.125.1539569764654; 
 Sun, 14 Oct 2018 19:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <1539358155-9027-1-git-send-email-mspinler@linux.vnet.ibm.com>
In-Reply-To: <1539358155-9027-1-git-send-email-mspinler@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 15 Oct 2018 10:15:53 +0800
Message-ID: <CAARXrtkW8XXuy6=o2h_i1NcxV+AncOVKhgqcwZHmUF14D-99aw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] ARM: dts: aspeed: wspoon: Enable iio-hwmon
 battery
To: mspinler@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 spinler@linux.vnet.ibm.com
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
X-List-Received-Date: Mon, 15 Oct 2018 02:16:08 -0000

On Fri, Oct 12, 2018 at 11:29 PM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> The BMC can read the RTC battery voltage via ADC
> channel 12.
>
> Signed-off-by: Matt Spinler <spinler@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index f4739ec..b933ced 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -63,6 +63,11 @@
>                 };
>         };
>
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 12>;
> +       };
> +
>         gpio-keys-polled {
>                 compatible = "gpio-keys-polled";
>                 #address-cells = <1>;
> @@ -651,4 +656,8 @@
>         status = "okay";
>  };
>
> +&adc {
> +       status = "okay";
> +};
> +
>  #include "ibm-power9-dual.dtsi"
> --
> 1.8.3.1

Reviewed-by: Lei YU <mine260309@gmail.com>
