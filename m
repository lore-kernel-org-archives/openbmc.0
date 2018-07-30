Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUxE0tG0"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41f3SD0xDNzF0pD
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 12:29:47 +1000 (AEST)
Received: by mail-io0-x242.google.com with SMTP id z19-v6so8623066ioh.4
 for <openbmc@lists.ozlabs.org>; Sun, 29 Jul 2018 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/C2Wd+VqD5tIySsiNsktXk+bEO2Hb3eQawygCqaong=;
 b=SUxE0tG0n3CmkBmQeGyCpl8LQzI//IgxcbZkwtjF7fXLtN4IW/hhhxOvtMfKYDcPDO
 WQdc4hPCWlOSK6w90XH4oRhpbapm0BT4QnzTEY+xO+rC8aBFtsEeWlEvZg8IRtpjLfsu
 dL8eWYmFlg/RRb71TixK5p+DTcdLFew98T1UkrqyEiy17gr/heC5OHAK4isW5tiyZpo9
 3pNRFIeGKUlekIXlJMSSAs1y/SgAQzV/mUKkhyjaMHHVTZE5anGOuSOCzYLSnz7tMLYV
 MNnBWEMwbckrKAwp7F8A++9KjNj7I+zsFmqBZ84j5AFsOJ1/L1bWlFJw/cSCEgyPmxJ6
 Kqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/C2Wd+VqD5tIySsiNsktXk+bEO2Hb3eQawygCqaong=;
 b=b9pud4rpslYLQcdTXphrotPlkZfoTetU/ad2Xd164Jd2jG7DAX073pD9RHQlgZT2Gf
 dynreDvZc6MAoum3smy5ATc8EQBAqcsidblEnka+kCjVJdQw2mlf3JrkGtaQDA5Fs5hU
 fWxCbePR4Aku3m2QX6+G0hfsPEs2/mVFwR6lTuq3KaMSw0Een/K1a0wJeq1wnIl76qWP
 lYxj2TcI2iEoh+SRP8iT3IA8YYGsW4j576kHL94tOGHgh/LF3A7VBaXfoUH6ooreMzT2
 TD+SGg5Z4+9tKjcAZmJBSYTIbrmcIDY3NnLp3ZMxobOo6/GBwcERhWDQwIZO1QwEwKD8
 900g==
X-Gm-Message-State: AOUpUlEMgOQJqTU0wDNO7whvFSnVLr9xaxtoZ3Scjj+No5h0Mqnq6lUl
 fxPVtcjcIW/EVZn8UWTdkqfOQaAJ7iuGL9bQNB6Imw==
X-Google-Smtp-Source: AAOMgpeZ90XUilQEr4n3rVvUx2I1+8x4gUHl0adQgwZkJUQV5GmOEfutXXMeYqpJPZ7STrZaAzLx/2Rwezj0V3/9Ync=
X-Received: by 2002:a5e:8404:: with SMTP id
 h4-v6mr11827594ioj.171.1532917784901; 
 Sun, 29 Jul 2018 19:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <1532669385-45493-1-git-send-email-mine260309@gmail.com>
In-Reply-To: <1532669385-45493-1-git-send-email-mine260309@gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 30 Jul 2018 10:29:33 +0800
Message-ID: <CAARXrtmTbOgOHCg1RWrDRo-ozO+SR8sEWxenVPO_8E4kiSxHVA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17] ARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 02:29:49 -0000

Please do NOT merge this patch, as toggling GPIOR3 drains the battery.
On Fri, Jul 27, 2018 at 1:29 PM Lei YU <mine260309@gmail.com> wrote:
>
> Add iio-hwmon-battery using adc channel 12;
> Pull GPIOR3 high to enable RTC_ADC;
> Enable adc to make adc running.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 852b552..461564c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -83,6 +83,11 @@
>                         linux,code = <ASPEED_GPIO(Q, 7)>;
>                 };
>         };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 12>;
> +       };
>  };
>
>  #include "ibm-power9-cfam.dtsi"
> @@ -236,6 +241,12 @@
>                 output-low;
>                 line-name = "seq_cont";
>         };
> +       rtc_adc_en {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "rtc_adc_en";
> +       };
>  };
>
>  &vuart {
> @@ -304,3 +315,7 @@
>         status = "okay";
>  };
>
> +&adc {
> +       status = "okay";
> +};
> +
> --
> 2.7.4
>
