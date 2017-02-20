Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS05Z16wlzDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:22:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XEiIRxdt"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id d128so1349853ybh.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wWOWB3+ogsaS3ngGbqZJAkKUGiaAOMmSrBtrGP0idwE=;
 b=XEiIRxdtvQzbQOjYaH8FwfGBFkgK/prRb7+SyVxt+k/G8GfAnN/rhvDfXDoZDuxcfv
 dc23sHNKTVb0sFUsl2QtC7d1ADeQOZGPMzZnVJ/dZ5QH7J3iB7P6Wk9RuuXS7hRsuXMF
 c3uJxUIERlfHa6lU4MgaHC4B82WwqwM8HokUh0nFFwdJiNW/hZ3Geq81o5oDeLf34nOY
 ETzHuttyrlWETY9pgmtEFTPgdCEc/aAkXosmKVfT8pOKafXXmiGq2jn3ed7h3h3ZqWWM
 kE6Grolx32XK7ooTBEmdObUYF2AyeQrvUD7CpWb8o6wOs7ARImrao+JDlY1+j/UrM3qE
 9kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wWOWB3+ogsaS3ngGbqZJAkKUGiaAOMmSrBtrGP0idwE=;
 b=Tziqv9pxNaUNDsVOu6p5YNfHDvC0z5kXMRHaXQw6FrZp0psKe8AwjCQmD3hO8WRUPG
 FV4WptyMcbmqDCfQrA0687FD67M1MNLjQ/rpLioprkl4wFHDIed9ZbOh/VR1ujZVl2BI
 6Lr3rAXvd6IYiJvwRI14OZLgyo39h2JXqioWYIXJh7XpZ5HqQRzpukCFInMLzrF2o4FZ
 HQ0+gP9AgBVzQgtfu8LNXN3+Pj06m4Z7DhghJjkBqthiE1FR6ijsYmym7AF4Zbe+wxT0
 cANfDOAecPVSe4jQhAXTL+2Cks82GNjOh5AdQriSEcY4/nRtxGrTrLarQ41z+akTOkh0
 +LAQ==
X-Gm-Message-State: AMke39milPE6alLHR1EwqJ7xTm2+tQ5akFchYUQ7WKscbq42IEnRdI0aWJwyAsVspZ+YRp6Gmp3m5zpLw9EfCg==
X-Received: by 10.37.170.143 with SMTP id t15mr4235893ybi.153.1487632927829;
 Mon, 20 Feb 2017 15:22:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:21:47 -0800 (PST)
In-Reply-To: <1487621986-23229-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487621986-23229-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 09:51:47 +1030
X-Google-Sender-Auth: LAZa1kvXVbSG6GZWsJONuAx3ZXg
Message-ID: <CACPK8Xe1p9BfZyNu45RBBDyxAQOGGx6D3eOcOMwXE2fYVRqUOQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] dts: aspeed: zaius: Enable FSI master
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:22:10 -0000

On Tue, Feb 21, 2017 at 6:49 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> set status to "okay" instead of "disabled"

Can we get away with doing this for machines one by one? I expect we
should switch all P9 machines at once.

Cheers,

Joel

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f..8f563dd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -78,7 +78,7 @@
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> -               status = "disabled";
> +               status = "okay";
>
>                 clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
> --
> 1.8.3.1
>
