Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="saZqRdGU"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BlTAjUA9"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRGN1F5zzF1Nf;
 Thu, 28 Jun 2018 14:13:16 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id d23-v6so3638121qtp.1;
 Wed, 27 Jun 2018 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xYdLdL5NOhOanKBmDogwIFVhN3D1iPAwaIm1IGp6c8Q=;
 b=saZqRdGUqTMT0RmnLQ99R0iOlLLTQW5l4wvJnshIPfccm3bLpwB/JXNYk8Zi9+/Xes
 w48uSqb4WJ8EIldPlTKwcMk84eZFL0pUZxBKQVfw/9EQt7BORE9Fefril5gw/zSGisQR
 6MvL5rIeSJ1/944LXIjBM2b7eB7DIHuVO18lbffATWlBIuZBgFucSASxasqVI9a3/0T4
 tP5vzZbEft9gQdWw2TQkBU5rGSHEPLvJheT4E8ElnUEGonx7kC8TyOoSF4Ai9OMTSawL
 /io+IO1FwWGyRfh9+LQXdV4a+RG2u353saD6GjmhtNoT+90E1LFN0ImiIj1XEeAx2RMI
 93jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xYdLdL5NOhOanKBmDogwIFVhN3D1iPAwaIm1IGp6c8Q=;
 b=BlTAjUA9j+k5ghjUrJo3WsAxkep5bBSeeTBy1Ou7EOOo0PkXWkl9HaB09gbe8okISb
 lXY/zIhJcEAxzYS0bHRTcraqkNiV9zQOil0T/+zMPbyVadKMdfSeWs0+/341FOXb4nzq
 m7fBoRA2ZrXgw3VpKYIBC0xuGXeXFt+ouBbwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xYdLdL5NOhOanKBmDogwIFVhN3D1iPAwaIm1IGp6c8Q=;
 b=qGn6LCKdhMm5gFzLr/Jx11xbcy0jHbsH1ZJkGw6nXXia81kG+Yh6cYVHoMMB6pROjI
 XGwnv1mI5QnKzyRP+H+s1w5M4EsT5jmASqaoZCey92iYVm1qR6TUHYN1SsVggFcmP8Sl
 wWW6n+3LNY7erTXxm6fVyRae9apN6L9PVFBOEBAQgN6oF387ZcfyidZPtJrk6sZ6SrWE
 jbdyJFuYmG46oa+RciI/b/lNyUXsVo9Ak66zLSPPVQE4PXy8UxUVgSoLr+QU2xSif3nS
 tHqKynd5G9UiH/66lWZKESyfj6csTx8UXKWTty1y+2r7SkT6fK/oY3W5izW5nmIvoqSp
 leHg==
X-Gm-Message-State: APt69E2+5OO+BVHrEyI5Fo4niTlcM5LRKHu0vMIp5G5/sHqvzQz/ThLZ
 PRmFpfxL6Lfff1vy3fsTDIlaftV/zUdG/yCKyKo=
X-Google-Smtp-Source: AAOMgpe6TN7pLH/U9qXyfHQSGjKCvy9/mCDiQNWEW6azyUrbXAtbwi+SNBIvD+2WHlsmoDef/VUkOZyfFCHTSgqiMhE=
X-Received: by 2002:aed:24f0:: with SMTP id
 u45-v6mr452399qtc.340.1530159193487; 
 Wed, 27 Jun 2018 21:13:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:12:53
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-14-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-14-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:42:53 +0930
X-Google-Sender-Auth: djlhkPWpR4JqcdJAomm9pcMi_68
Message-ID: <CACPK8XcyncbmU3kMVPVZV49Hnt+avbzgUOL=KMP+Ed12axWqRQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm: dts: OpenPower Romulus system can use
 coprocessor for FSI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2018 04:13:16 -0000

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

I will take this through the ASPEED SoC tree once we've got acks on
the bindings.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 347938673c83..070b8f8f1d62 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -37,6 +37,11 @@
>                         compatible = "shared-dma-pool";
>                         reusable;
>                 };
> +
> +               coldfire_memory: codefire_memory@9ef00000 {
> +                       reg = <0x9ef00000 0x00100000>;
> +                       no-map;
> +               };
>         };
>
>         leds {
> @@ -56,10 +61,16 @@
>         };
>
>         fsi: gpio-fsi {
> -               compatible = "fsi-master-gpio", "fsi-master";
> +               compatible = "ibm,fsi-master-ast2500-cf", "fsi-master";
>                 #address-cells = <2>;
>                 #size-cells = <0>;
> -               no-gpio-delays;
> +
> +               memory-region = <&coldfire_memory>;
> +               sram = <&sram>;
> +               cvic = <&cvic>;
> +
> +               fw-name = "romulus";
> +               fw-platform-sig = <0x526d>;
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> --
> 2.17.1
>
