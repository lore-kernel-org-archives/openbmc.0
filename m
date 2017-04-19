Return-Path: <sjg@google.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WB4RwyzDqC5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c+o8JPEk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="hl1QIh4n";
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id k4so2313610vki.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Rtb5jEvrQvSc5HI5EAwlfGdWuBok6kXTgviSwDPDE0g=;
 b=c+o8JPEk08ktNJNFyug5jiqjSeuMi5jUoFG6Fs8Hh7zwp5Vo544A04eUo/uvPK4qZp
 ASP/V9ex5E2ViG3E6nHg1qzNmMg6ALVPsXA+XAp3Ipy2YGgP4S7n8WGtVGDWxpMF7ttg
 atYon8gNtminW/wKNQsfqGILUPySPwun1t1z8Kuj+LejzuuPb3/A+PRFOkbBSwksR+Dy
 V1DQ+9iu+IuDEEBdhfQLLDqP4iN/Zpi9Q8knQftlfQZJR3MBr8gbdmxXwiUlW588ZeJy
 Fd1Veulrn0ulSC0zbSxKAjCUpMiKS7YzTCHEggCDxDX0zmuAiMWMZllzayNko8PO5KpQ
 yvfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Rtb5jEvrQvSc5HI5EAwlfGdWuBok6kXTgviSwDPDE0g=;
 b=hl1QIh4nTWnsrDxoDu4x90iOk0nZs/1hoOgouycnFoKsPt2M7drciQwD6dwVriFvpj
 dMFuhCVAG0bE+akdVftlqmw2mBKQRQnkDNpLBicdozslWvbx03IceH1bhttLJ2g7QQ1r
 JmeUY07ERf0b6P6IH4B8VfhR58iqaw4t7imoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Rtb5jEvrQvSc5HI5EAwlfGdWuBok6kXTgviSwDPDE0g=;
 b=fkghs753sSSe6Oo8mh/9sMCFLY4Fd40D39sWIXE4oP0iDbNeNPTFlppxX5VFWpXTSy
 jpB3y8Y6QWaNqWMa4sOBrLM+J4IVPEWknOPF//EIKsiAGiKkeAiyWuxRFLqhpkG/vAu8
 9Q12MelS9xUc6YSl2IP8RzOkA4o7VzKtrFmMfDQn9+QuTsZvnD69XvjU5sCkAyGK5453
 3zeJ97PvsdNYjHWffUY9qyGWImiCCrAi39TTe84V5HQi3oIzPTQglt6eB2owlPlVjYH6
 ErI5Eoq13FPlg0cy6vajJ2F2JrGwFmKWp92dxDYFi/q0QVVsIWkHwg6OFBnHOac+or0n
 9xmg==
X-Gm-Message-State: AN3rC/6oKlGVYn4vlgcH9wsuA5O0Fxm0+B+vmjyPXXGngu9cdhr2Dq3J
 H0Bau+wDT/eTeuLXHWjC4GjDTb/wjzuw9lQ=
X-Received: by 10.31.220.199 with SMTP id t190mr29885vkg.3.1492560739738; Tue,
 18 Apr 2017 17:12:19 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:59 -0700 (PDT)
In-Reply-To: <20170417190034.71945-11-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-11-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:59 -0600
X-Google-Sender-Auth: 2sxkIJBM4Kh6y0C5ccd8lZxOtCk
Message-ID: <CAPnjgZ3J9SNaCDRPhH=6ns4XeMwdJi68FFEGLE6mk3Vz30J_Zw@mail.gmail.com>
Subject: Re: [PATCH v1 10/15] aspeed: Add P-Bus clock in ast2500 clock driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:23 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Add P-Bus Clock support to ast2500 clock driver.
> This is the clock used by I2C devices.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  3 ++-
>  drivers/clk/aspeed/clk_ast2500.c               | 11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> index 1cdd3b9198..319d75e05c 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> @@ -21,7 +21,8 @@
>  #define SCU_MPLL_NUM_MASK              0xff
>  #define SCU_MPLL_POST_SHIFT            13
>  #define SCU_MPLL_POST_MASK             0x3f

I think it works better in general if the mask is defined as 0x3f <<
SCU_MPLL_POST_SHIFT. Something to think about as a possible clean-up.

> -
> +#define SCU_PCLK_DIV_SHIFT             23
> +#define SCU_PCLK_DIV_MASK              7
>  #define SCU_HPLL_DENUM_SHIFT           0
>  #define SCU_HPLL_DENUM_MASK            0x1f
>  #define SCU_HPLL_NUM_SHIFT             5
> diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
> index 504731271c..9e4c66ea85 100644
> --- a/drivers/clk/aspeed/clk_ast2500.c
> +++ b/drivers/clk/aspeed/clk_ast2500.c
> @@ -110,6 +110,17 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
>                 rate = ast2500_get_mpll_rate(clkin,
>                                              readl(&priv->scu->m_pll_param));
>                 break;
> +       case BCLK_PCLK:
> +               {
> +                       ulong apb_div = 4 + 4 * ((readl(&priv->scu->clk_sel1)
> +                                                 >> SCU_PCLK_DIV_SHIFT) &
> +                                                SCU_PCLK_DIV_MASK);
> +                       rate = ast2500_get_hpll_rate(clkin,
> +                                                    readl(&priv->scu->
> +                                                          h_pll_param));
> +                       rate = rate / apb_div;
> +               }
> +               break;
>         case PCLK_UART1:
>                 rate = ast2500_get_uart_clk_rate(priv->scu, 1);
>                 break;
> --
> 2.12.2.762.g0e3151a226-goog
>

Regards,
Simon
