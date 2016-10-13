Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svb5W4hbtzDsxp
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 13:58:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=hvDMIPSH; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id b186so2913551vkb.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 19:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Rc+UqfIV43qcvVPwRccFJLH/lAOsLI7VBlHpq/q1ikc=;
 b=hvDMIPSHNwUhS+czVmFz7dOuFweh9Yb2svzuTC/HiMrL7QJUS+8bfSpcZDG5prSTAI
 xwPkiNHEVm0HsVJbiK4H4z6E/L/xq3uG24gFlYUBMCsgWVbXd8imRQqNM5dinghasJj5
 VYuDyZ5sOfa1KeAFzATeMarSsWlyBW9L72QMPDlYf79+7Mh4L48lRZlMwduCPHZkv6S+
 pMnhUiMqZBkHWzrgJhCZOP0rwQ4XGjzybvxbgMNo7TCyEvz7iS0wVUDpypgHt97NP/He
 ACOALJXcOwM+DrStls1Vzs81w+ZntaosZ2z5uh12TdbJWgpQmsyLdp8qRjDvT8aBlqSt
 q7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Rc+UqfIV43qcvVPwRccFJLH/lAOsLI7VBlHpq/q1ikc=;
 b=mNAL+U8svcqLfMtPyVQeQxpffPAKvm/n4VyZY174Fs5b2TAGoN/4XWeTvyB1spLgo9
 A1A4IC5PPJVICg5YfePxtyD21ZtzbgOCAOuVHUj9sKGiZI4LB3xgy2fTQF2xdA0ZaICh
 oILrxvGVHc6FGyvx9E1J7H1UKbofjK1YGpBcSTsu2vQGNnwtYBpAML08VLG6iLIEDq4/
 jCrD/72oiaDb5VpbHuRk3aBHa2ID9RD/v/qGAuh/7sQqDzAdjy+DvaviG/2lKpjus2D/
 H9/rqfZmW6FFptaEeDqvVA+vWW1YDJw8tGYKoFaav2nsT7jpKmgGJygjWE6fFg1jaoMN
 kx7w==
X-Gm-Message-State: AA6/9Rlk2KpcYg0xG5t903LLgsbho4Gwe0PDPX5uNh9Clw6ZGFPLtf7/3D684QU6NXwb/kwrTMI/xLviq4/Ygw==
X-Received: by 10.31.102.6 with SMTP id a6mr2495275vkc.151.1476327501516; Wed,
 12 Oct 2016 19:58:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 12 Oct 2016 19:58:01 -0700 (PDT)
In-Reply-To: <1476312288-100725-5-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
 <1476312288-100725-5-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Oct 2016 13:58:01 +1100
X-Google-Sender-Auth: anE_Kks4o0gnjIybMKX07ZI8gpI
Message-ID: <CACPK8XfJNu7405xpmqF5HrDeR=PdK_gr_r-B8MZCE8+E55bfxg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: zaius: Add front panel LEDs
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
X-List-Received-Date: Thu, 13 Oct 2016 02:58:24 -0000

On Thu, Oct 13, 2016 at 9:44 AM, Xo Wang <xow@google.com> wrote:
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 8c3912a..eef045b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -59,6 +59,30 @@
>                         };
>                 };
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               sys_boot_status {
> +                       label = "System boot status";
> +                       gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               attention {
> +                       label = "Attention";
> +                       gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               plt_fault {
> +                       label = "Platform fault";
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               hdd_fault {
> +                       label = "Onboard drive fault";
> +                       gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &uart5 {
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
