Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK8382q12zDvrN
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 15:56:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kS3+5Wwn"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id b66so17434945ywh.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 20:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WAzARy5L32tA/vl5N8SEiRZ0Fs58+me0ishuCU1QxAw=;
 b=kS3+5Wwn/e2tdezAhjmsbQafiajT+wwGrfFeDqRi+QTEKYXvrWOJjmR00NUjZd06Rz
 +xS4ey+fwge8txIfan2doS7aS4fpqFtqhS98qPcsH26OumPMEU72GwATkKzkD5kKnGrf
 +d2hh01nGUE0uGcsaEVZNHIAx9LKmSuuXtT6lRfac0z8ZsQoYsOyUFr8WF1kJ3GdX8uJ
 RFlm3AxqREY2IAl/i6FH/GioQq3dsW1ShhCZUoF/aH7y4dn5wsf6cLDIky/1JSMjPgC5
 6fm+a/B0f3w42jLjKYh3rd8NQ/tbNtBapViDva2GGnqzw74sLnF+Hu6SPBdrk5KCsEJR
 6sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WAzARy5L32tA/vl5N8SEiRZ0Fs58+me0ishuCU1QxAw=;
 b=i0yZ8g1yOIuikfAIoihvGvw/aVmRNfKrWNn2BvkYwLNOVZ3WjMSwByMTdmfBjo1Ddd
 P54KJEHPc/gvkYbSw8aX4hrY+qeNky1h3j6PoYEH8vDGhCvMDQOME2MM0nPdpppEz/hi
 xxjiFgd70ofJ1cihrxBiG8Dh/9O5PseRT9yaciXkFV3hlkQxDtHTmBab28g7JsiLZdZK
 DMtTz6Gd3c2WHfE9Ch+nH8FtJPFC78wfPTG5nukz36+h2ThxnVMS4r5fARzi4S2+j6L7
 uJRqaiC3086fiYBZ2oBr+g86l2uMBOQTvXiSKwYPGTNqX2If77o79S5acIh00EUzjelV
 SqyA==
X-Gm-Message-State: ABUngvcRbN6BlDprhKzykQAkmCKjUCdl8cj++CpBn96Tr3cR+PR2zUUQd19B9/H9NYaAHz86JXw2McyYTDdRgA==
X-Received: by 10.157.36.36 with SMTP id p33mr481671ota.8.1479358561974; Wed,
 16 Nov 2016 20:56:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 20:55:41 -0800 (PST)
In-Reply-To: <1479338955-5248-1-git-send-email-xow@google.com>
References: <1479338955-5248-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 15:25:41 +1030
X-Google-Sender-Auth: GWGh18BXrw1Q8dMRkj0ZqKnKEpM
Message-ID: <CACPK8Xd-L70Q-jrXGUUS4eU-seYptQh1-1KpNF-8Z1XHDe5XuA@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] ARM: dts: aspeed: zaius: Add 1-wire buses
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
X-List-Received-Date: Thu, 17 Nov 2016 04:56:05 -0000

On Thu, Nov 17, 2016 at 9:59 AM, Xo Wang <xow@google.com> wrote:
> Add device-tree bindings to instantiate GPIO-based 1-wire buses. These
> go to headers for DS18B20 thermal sensors.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index b52e45e..3d997d9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -20,6 +20,26 @@
>                 reg = <0x80000000 0x40000000>;
>         };
>
> +       onewire0 {

I wasn't sure if we should use a cell index: onewire@0, onewire@1, ...
The binding suggests yes, but the convention is usually to make the
cell index correspond to the reg property, and we don't have one one
here.

Lets merge it as is.

Reviewed-by: Joel Stanley <joel@jms.id.au>


> +               compatible = "w1-gpio";
> +               gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       onewire1 {
> +               compatible = "w1-gpio";
> +               gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       onewire2 {
> +               compatible = "w1-gpio";
> +               gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       onewire3 {
> +               compatible = "w1-gpio";
> +               gpios = <&gpio ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
> +       };
> +
>         leds {
>                 compatible = "gpio-leds";
>
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
