Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbl33Km3zDqFb
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:26:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mNrTf5eG"; 
 dkim-atps=neutral
Received: by mail-io0-x244.google.com with SMTP id d203so7723635iof.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bj0srrOxFWP6RxKKJcjuK91VQwWkX5oO53YysVUKxx0=;
 b=mNrTf5eGDBWmtCtlgOrnNPVeFVgBwqKkT3KNLTNHJGPAmPQhtJ0h5EE0WUYonc8154
 bIY8smrGUXFu+0zuJ/o5rH0rXBYgCNeh1izQq77dvqo1DJ9KW4GcTpq5emIUd/8qk9DU
 efzDnqDch0S6eNC8L+/0toctxZ9QMjQMERQuYBndxxOq52eWv6gYdr/mr+czigQ/NFsa
 j6ReNL943ROvkrtwdF9mtQAnl9wflLxYEhp6Ve7Qw5wX2WtcaQcXm9M4Eife/vR6M8TJ
 cM/M0gDo24rkBnSJnea22fkTq4XqPb3SMjqJ0xdH20qdRb/zmFxOkK8rdplsWQo9Gujg
 DM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bj0srrOxFWP6RxKKJcjuK91VQwWkX5oO53YysVUKxx0=;
 b=SRPe5IYfg5ZtK1Xh4WsCkZon4Avqp1VgcMTeIInrms8V/hFPm3JvtIzQO4HZU/tl2A
 nA3vRCYLjWjgcG22ot97T4NS490kOuBvAuLgldnaOfEyR5Yq17evPWUyc/k2bvOLAzU/
 mfqW4WYL+oBzVhR83phKTQtd0ilL4zTN8hYrD5B354xIFy9wNsDNISywB2KuwnYLHn8F
 25IV1UHVDaL/9V1iCSsqMMpURFSi+7MhlwY6R0kVDu+CieSIEWjq1W34MJWD3iHArphl
 PaLX7h0njeQT6jHBUrrJGSLMnzol5TU7FJ1lj5g3Jy9jvCXyQtNAaq535qGuGTQQqUpZ
 E+VQ==
X-Gm-Message-State: AN3rC/7aWb/+RYxeVlAuj91QIGbTDRc8/7FJYKkL5+7oJ9GyHK8FSMip
 sPkexYV8ol2eJp0TRJ+jPVtgeaGeZw==
X-Received: by 10.107.7.18 with SMTP id 18mr8216069ioh.218.1493342813216; Thu,
 27 Apr 2017 18:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.68 with HTTP; Thu, 27 Apr 2017 18:26:52 -0700 (PDT)
In-Reply-To: <20170427060823.32226-5-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-5-andrew@aj.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 28 Apr 2017 09:26:52 +0800
Message-ID: <CAARXrtkHZW9t7HSWk2cgBggSAZx+0hVO3TVk0FA66=ZMrh5BHA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 04/10] aspeed: garrison: Request RGMII and
 MDIO through devicetree
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@kaod.org,
 raltherr@google.com, Xo Wang <xow@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 01:26:55 -0000

Hi Andrew, Joel,

I was working on a pre-GA Garrison machine which uses PHY as Firestone.
But later it's found out that GA machine uses NCSI.

I had some patches related to this sent to OpenBMC, which is now abandoned.
So this patch can be dropped, though the lines should be removed as well.

-
-       /* SCU setup */
-       writel(0xd7000000, AST_IO(AST_BASE_SCU | 0x88));

Thanks!
--
BRs,
Lei YU

On Thu, Apr 27, 2017 at 2:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This drops the muxing of ROMCS[1-3]#, ROMA24.
>
> I assume they are unused as no other system designs have used them.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 5 +++++
>  arch/arm/mach-aspeed/aspeed.c                 | 3 ---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 3bdaaf5008b2..8518bdf529f4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -121,4 +121,9 @@
>
>  &vuart {
>         status = "okay";
> +}
> +
> +&mac0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
>  };
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 2333670f5c1d..b3aba87964bf 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -103,9 +103,6 @@ static void __init do_garrison_setup(void)
>         /* Setup PNOR address mapping for 64M flash */
>         writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
>         writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> -
> -       /* SCU setup */
> -       writel(0xd7000000, AST_IO(AST_BASE_SCU | 0x88));
>  }
>
>  static void __init do_ast2500evb_setup(void)
> --
> 2.9.3
>
