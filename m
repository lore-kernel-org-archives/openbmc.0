Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDzCJ4CNkzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 12:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ri2TyRAa"; 
 dkim-atps=neutral
Received: by mail-ot0-x243.google.com with SMTP id 65so575798otq.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qU0P6TDUcsELeyE/j/FlzY+n1NIKMHvlbwTwdUgKt1Q=;
 b=ri2TyRAafTHgPmKFwGNSn/nveJA2IIegwqGNn/9+001X/fb/3jr0LjrzoSghWgXgUp
 3Rg0ydXidO4FTVz6A4wQCpmiU6IRl2DyTDWdzIT2T+VbIBTIfEr2Fjh6/q+CNdSS43id
 zZYqeQbwYHjmpBLDUF+Qkzi8LCCBH+v3dq76m9Fm6oDpOLBGgJj8r3UBLmsLt3VMnw/s
 TT8yxQh23/mV7CGwJYD5lXe29ZFuvC19D6Sd3/fBF7tGQo3D8tHKvA0jGkEyHGbGmVAd
 KJCdwFQCkqscFhwIN9RUuEV9S/Bnrw1YEPAusoFoXnEqCNr71ZGn3Ulf8QVwj5DlcPV9
 2n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qU0P6TDUcsELeyE/j/FlzY+n1NIKMHvlbwTwdUgKt1Q=;
 b=OgPYr9TakJ8y2W/yf2IicsocRu9X6JkyKDqv1N4zV9IQGj5NR/thgXMdGMV7C++0BP
 25jSMGNu1346nPDqkEIM1EO58PpXLEa4OYuuyrBCV+gHop38mo0qTxNiQoMq3d2JDfdB
 qT3vk3LNE7qNVtak38nGbiEBVQFsVXHbhbN9Z4ce199ROo3TYUwZoGiOWBlGHGTJ6dAI
 6DXtwK8eRNmxI54bknvLHZ3E6dkKOWuBKp+zJPsUmdBLEolSMQLn2nYtSDG6aMwdOzle
 tLbwZwatihhmp/hCaHV9gnQjBhxXq1ppust7kbE+Lfmwr6WW3R2jT2IJt+IWGrvw7E7c
 tYPQ==
X-Gm-Message-State: AIkVDXKVWE8Bpw7O8aCZrM6xWUnnPHM7Q7CIADmb49g2kfvh8SRtEnADUJWLltJ4cgyV4zdTJwCWNnSJSrw1uQ==
X-Received: by 10.157.16.88 with SMTP id o24mr6217874oto.24.1486083834704;
 Thu, 02 Feb 2017 17:03:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 17:03:34 -0800 (PST)
In-Reply-To: <20170201011230.141303-1-xow@google.com>
References: <20170201011230.141303-1-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:33:34 +1030
X-Google-Sender-Auth: 12rWRgvCFrfWtUkBIkMWOPDRp-k
Message-ID: <CACPK8Xei__7D565e2qW1YW8KZP_ZL7NckZdRMHaVeH5-OMV5MA@mail.gmail.com>
Subject: Re: [PATCH linux v3] arm: aspeed: zaius: Disable LPC reset for UART1
To: Xo Wang <xow@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 03 Feb 2017 01:03:57 -0000

On Wed, Feb 1, 2017 at 11:42 AM, Xo Wang via openbmc
<openbmc@lists.ozlabs.org> wrote:
> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
> powering the host on. In that default reset state, ttyS0 can still be
> opened and UART1 silently drops bytes, which is not obviously expected
> behavior.
>
> Clear the LPC block control bit that enables LPCRST# as a reset source
> for UART1, making UART1 immediately useful in that it won't discard
> bytes.
>
> Signed-off-by: Xo Wang <xow@google.com>

Andrew, Rick, are you guys happy with this now? Can I get an ack or review tag?

Cheers,

Joel

> ---
>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 4bd3680d742d..b7022eaa7b5d 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -185,6 +185,14 @@ static void __init do_zaius_setup(void)
>
>         /* Set SPI1 CE0 decoding window to 0x30000000 */
>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> +       /* Disable default behavior of UART1 being held in reset by LPCRST#.
> +        * By releasing UART1 from being controlled by LPC reset, it becomes
> +        * immediately available regardless of the host being up.
> +        * */
> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +       /* Clear "Enable UART1 reset source from LPC" */
> +       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
>  static void __init do_witherspoon_setup(void)
> --
> 2.11.0.483.g087da7b7c-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
