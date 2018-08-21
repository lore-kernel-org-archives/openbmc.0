Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XCevJ5yy"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vWt35pg2zDrWY
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 10:35:23 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id x7-v6so9091392qtk.5
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndCKVGflncI6j1GMBMibwl4onllui+nDT039H6XWo9o=;
 b=XCevJ5yywezmPgiJeMP4O9Pc9jcv5YEjLMpbLv88K4udsHB0O2CJotzotVc/2//GAB
 WU7tR8aHYkkSyHOsG9+qLjFm1HkvTeeVUBejZtgHm2L8/ktk0DLa50J8sfPQTDUkSLdJ
 HwJKqGSvK8BuXv6iInmizfCXXdkRRLR6sXXqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndCKVGflncI6j1GMBMibwl4onllui+nDT039H6XWo9o=;
 b=a9Mv2Q6JJYt/dUnc5vjmR4eT1ZKdegHcDQqhMpvlareWyyYDteDDLaNsrmspL8/cFb
 tgWgZ8crWa2WRovmHL6gSoqeF9wP9x3kD9lfr1GeaXj7gknk4oEfqfguZu9SEtftvssM
 l1Jl/HzMMVLsG0aN4ODl1MTW1dbLRyLi+60ntz25UoiUh1pk8RXFfwjyyxnJ4nFNKaVR
 CPzfrL4+U8CxjYNZaZydkGhbnWy6jd91cl8tI0vO7ovl3FupKFBkFMOdISRPmPgCzzI8
 Bgmyg0DgIPqSuPDRwXHYULh3K3Dr3wX15UpCc5+NqSZ15ZZqebRoTwHfa7D48zW27ylZ
 GKdA==
X-Gm-Message-State: AOUpUlGO72abGSNoab9H3wpZ/yYr+Q6NpI47iQDExL2KAkyyIIzbP5l6
 +ZAmqwOa9yvLVcw7OUA7tcXOLIOgc1mYiiI8TIE=
X-Google-Smtp-Source: AA+uWPy5dYVDI/lWFK3u/qhxVgdUGbaHQb5IX18647NbioG9fjEVIcl80kpv4rjsuO1SsOIHNBDu4ho1OEa1zTPhQhI=
X-Received: by 2002:a0c:d7c3:: with SMTP id
 g3-v6mr42886564qvj.85.1534811721104; 
 Mon, 20 Aug 2018 17:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <1534485925-63307-1-git-send-email-mine260309@gmail.com>
In-Reply-To: <1534485925-63307-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Aug 2018 10:05:09 +0930
Message-ID: <CACPK8XfcvJiX8jPgMxtnijtt7jVGXM2SCe6fiYfpvqQuU2du2w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v2] ARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Aug 2018 00:35:24 -0000

Hi Lei,

On Fri, 17 Aug 2018 at 15:35, Lei YU <mine260309@gmail.com> wrote:
>
> Add iio-hwmon-battery using adc channel 12;
> Enable adc to make adc running.

I assume we're doing this to read a battery voltage of some kind (was
it the RTC)? The commit message should describe why the change is
being made (as we can read the patch to see what is being done).

This patch does not apply to dev-4.17. Can you rebase and test on top
of the latest?

Cheers,

Joel

>
> Note it requires GPIOR3 to be pulled high to read the voltage, and this
> is left for user space to toggle the GPIO to save the battery usage.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 852b552..a910bc8 100644
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
> @@ -304,3 +309,6 @@
>         status = "okay";
>  };
>
> +&adc {
> +       status = "okay";
> +};
> --
> 2.7.4
>
