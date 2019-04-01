Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CPF+jwZH"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xj7G6x7gzDqBP
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 17:27:20 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id t28so9495618qte.6
 for <openbmc@lists.ozlabs.org>; Sun, 31 Mar 2019 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iPhbP6IFxfLnRL0yoF3EaGNY8CgSKnZXXx91lGYRdcU=;
 b=CPF+jwZH5xDGMwzq57OaX9m9Kn91jy9qPhM7vj8NWE2vqFOuTXHBY2zQ4ZHHymThnd
 Ha2Qc1fxgJu0WkROIp2MHkzWcUqklOVJFM5V1nYNUeTDzv4hzGRxgV/Nw1TbYbu8appt
 wVUXZ1D2b1YQNgSBtAASf9y8yXSlTd0uZEFVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iPhbP6IFxfLnRL0yoF3EaGNY8CgSKnZXXx91lGYRdcU=;
 b=qXfPBaW2hYgLL05TEXwIUnmOs7FNhdxXcHW4XTR9J8DKxnM70mpG/UaXlj6QoNQiPG
 uBS0uMHg/+71WDunY3gT/UW+p20Gt1oqxq+YOkFCY8Tns+qTXj7AChKhDFj+fyiAqrsx
 UO/AHTtaHsrD0d8L6d5y/9flCYOSrO8dI3HKkZv0NVWxVlm/f8QDyYPj59IjLUMmTTea
 WfXCOtEzdTEq49ZFeX7du7faNfUaJV0xrh5SVj1Defd5ly+c3lkruamRx1+Tp2qHFKR9
 EUuvtU0h7Ql7AU4SPEi9T7xpxVNsK8++wsp0mBwO68O89BpTYwsqPIoLaA4xIhtqtkA4
 lQeg==
X-Gm-Message-State: APjAAAXw7y0ekyjrbHe1CVBfi9sF9btN7aNtc7qOU9khmHur5JA5k686
 0KP1Y6DU1pq6esYbGnCDWegJHyKMnxXvqNdLIMY=
X-Google-Smtp-Source: APXvYqwvIKy9U9MOCgHoSjTt7A4DI1BbDCOXhp5ZYFF0hZmbwCj40Sl7tBRKcN52X6RneGdMOfnMX5ixaNnptN6erNw=
X-Received: by 2002:ac8:26e7:: with SMTP id 36mr52565570qtp.37.1554100037701; 
 Sun, 31 Mar 2019 23:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-6-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553894143-559-6-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Apr 2019 06:27:06 +0000
Message-ID: <CACPK8Xf_yDn4Ss=tBHCWZQEw3C8K_wcBpKBh+AjP0wq0g7pOqQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 5/5] ARM: dts: romulus: Enable video engine
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 01 Apr 2019 06:27:23 -0000

On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
>
> Enable the video engine and add it's required reserved memory region.

The upstream bindings don't mention the reserved memory region at all.

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index ee1a460..54427f4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -42,6 +42,13 @@
>                         compatible = "shared-dma-pool";
>                         reusable;
>                 };
> +
> +               ve_memory: jpegbuffer {

video_memory or video_engine_memory

> +                       size = <0x04000000>;    /* 64M */

How do we get to 64MB?


> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
>         };
>
>         leds {
> @@ -315,4 +322,9 @@
>       memory-region = <&gfx_memory>;
>  };
>
> +&video {
> +       status = "okay";
> +       memory-region = <&ve_memory>;
> +};
> +
>  #include "ibm-power9-dual.dtsi"
> --
> 1.8.3.1
>
