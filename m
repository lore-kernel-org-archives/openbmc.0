Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7JdJ4GWpzDqjx
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 11:48:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cPMa0WF8"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id v193so4952050itc.2
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fSqeiElay58xBDMGvdr/doGmy6oOe1YOR57y26rAvrE=;
 b=cPMa0WF89aNxWjBVe5C1pANkTBZzgcWMsUJmc7/WJtempn5XmU51Md6+cG1LD3XtiQ
 Dd3UsjR/9/APPZpGmp1xCZ4IxTHEQdmAvq4zFHiQazNjv0SveemOJ05ShMNTjupn4V/6
 RaK1VxYzb6h+pFd8T83Z2s+uInL56wjYXi/CpyaWliLSbKP81wD9cBJG1nQf7BWOv3DF
 fOhERbNd8jawmqwAYqyiGJEmlXUyMqwG2JNYN1RlVBzljp5sup7QtB4jwnQmbKK/SrLG
 11HGWy+lrKvuQ/xabjIRRzzFrdbNHtX6vXh36o1BoG1kvCmYEFbvbPRNDZW/MCVV43mx
 Zw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fSqeiElay58xBDMGvdr/doGmy6oOe1YOR57y26rAvrE=;
 b=Ei5uBX4HyxnMCJPz08/OgmEse3wOY9GBiuuLRdOsJ56CCpkDrLGqrbAwuFysLvli3f
 E2iygMykxtt1opyeiT9xOI97DaZq0tJ0qqEk/W7yWZhplQcH9bOjpIVFoQTUHbqhwtRd
 EGmyNxdHpCfe0OQtPa3EGHHU6cjqtcf+X5Etvp2OSXHBcQKChV1qKdppBfSoWQMdtm5v
 aGrDyZR2d5YYxgq2gC1Uzkf0nhapSDtdB9VsEh98p42wiXuAsp0ulazvDtojT9GgfhqB
 /pauI41bNWW/lVztKeEvAP7lkIIIVfoWQhTeA8lJ7yMSAqQXh1V6k5znQOmVhX7uqQ1a
 9Tbg==
X-Gm-Message-State: AIVw1107Bz6BdpCaFvKiqDzKWDt6Nb3bX+U5lkZ8RhgSaYEqgpruO8q1
 WOieLoQp02T1PldR6maaR84f+CAUb9eS
X-Received: by 10.36.172.29 with SMTP id s29mr15990691ite.32.1499910530822;
 Wed, 12 Jul 2017 18:48:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.170.160 with HTTP; Wed, 12 Jul 2017 18:48:50 -0700 (PDT)
In-Reply-To: <20170707072544.25003-1-andrew@aj.id.au>
References: <20170707072544.25003-1-andrew@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 12 Jul 2017 20:48:50 -0500
Message-ID: <CALLMt=qTEZn5zNYRVad8+pBGuns4ekCxHgvct8zkwy888mw70w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: witherspoon: Add reset
 tolerance for host power GPIOs
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 13 Jul 2017 01:48:53 -0000

On Fri, Jul 7, 2017 at 2:25 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Enables the host to stay up across BMC reboots. This is a temporary
> approach. Ultimately bindings support and reset tolerance capability
> will be added to the GPIO driver, and the behaviour will be described
> in the devicetree.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 74611a9c2c79..100805e8c263 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -177,7 +177,17 @@ static void __init do_zaius_setup(void)
>
>  static void __init do_witherspoon_setup(void)
>  {
> +       unsigned long reg;
> +
>         do_common_setup();
> +
> +       /* Reset tolerance for BMC_POWER_UP (GPIOD1) */
> +       reg = readl(AST_IO(AST_BASE_GPIO | 0x01C));
> +       writel(reg | BIT(25), AST_IO(AST_BASE_GPIO | 0x01C));
> +
> +       /* Reset tolerance for SOFTWARE_PGOOD (GPIOR1) */
> +       reg = readl(AST_IO(AST_BASE_GPIO | 0x12C));
> +       writel(reg | BIT(9), AST_IO(AST_BASE_GPIO | 0x12C));
>  }
>
>  static void __init do_romulus_setup(void)
> --
> 2.11.0
>

Our test team took for a spin last night on a witherspoon, looked good.

Acked-by: Andrew Geissler <geissonator@gmail.com>
Tested-by: Andrew Geissler <geissonator@gmail.com>
