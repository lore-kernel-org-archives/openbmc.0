Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS9PC53CMzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:21:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYaAnpVM"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 2so3495843ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 22:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Zt2AJzicGtDwuP3OusuwmcC7mM+B3k7ntYBQx9R/0/E=;
 b=EYaAnpVMAmZlfxOy1J9btsFBn1POp/bRyndM2eGAxobvTqodXjLOe7PZdWQt/Uak1V
 uoVbC2Zbi0eUKRaFtwrfYpvSEKQrMDg5sR7n1zGYRvnfPvwlMpLdm1NviRyy2RjcKg+u
 m0xxxtoYk04Tc1e6oPicimKa8AqwZYKKa9louDvn5KV6/+r8G2RhyHu5LEG0zTbxgS2e
 FQYeLKSds1CxgplNiaoRtaa5ce6bYwKIrnv1q+VVJiZamsu5heugFAv8pfXed246f36r
 Oqw+uYAZJun2Qh1MfQMe0IDM2EQG5zGM3Hr1jXqilXpJGWnuIhOilo5YvKGeDxQYV0np
 ihpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Zt2AJzicGtDwuP3OusuwmcC7mM+B3k7ntYBQx9R/0/E=;
 b=lKZ3XRHPBbRXVJtmxM2ZtB6ufXP4K++jeSVbPgnpag/WR9RAnsxifcLt3tNsKvgv+k
 2VHnXOWxE+yAiXuWMX65sSnQ+pqT/UNTny5/dvUd80Gs8KQtZFQPDfigrApJTU9jrmye
 PBNgLUSlj9H5d73hEfSXNczIj7Jbli0pjVExrrhHGAgU35D+rNQdyDjkk/aHudaHQl4G
 9zypPsLIKVuX1uPzaGrkQ2aOC8OzDgulYJ2o6ND5AyR8BRiM4WdeVj/XjgW7tSwZhxqq
 SXYq1H1JOZUKuva+iKUCSaX5KgciN7sE92H5lL0hnQRO6MFWgsAnDeii7E//CtLHtJwV
 kJQg==
X-Gm-Message-State: AMke39mLW9kHxfTRZMNQMReqZ2RsTqjdi3dv3wOfheMvN16cg1LMUv9H9jiCpSLlD1EvCF9erS64B/u+GnOapw==
X-Received: by 10.129.91.194 with SMTP id p185mr18713231ywb.50.1487658077586; 
 Mon, 20 Feb 2017 22:21:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 22:20:57 -0800 (PST)
In-Reply-To: <20170214005104.11940-4-andrew@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 16:50:57 +1030
X-Google-Sender-Auth: bDiU_41Ae4e_6KzX08t_mmB-U1I
Message-ID: <CACPK8XfyuM-mx2=XBH4nJH76oDuSHJ+aQyZSigfut6KwdhXaew@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 3/3] ARM: dts: aspeed-g5: Give pinctrl
 phandles for gfx and lhc
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Feb 2017 06:21:20 -0000

On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The g5's pinctrl reported:
>
> [    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No GFX phandle found, some mux configurations may fail
> [    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No LHC phandle found, some mux configurations may fail
>
> as the aspeed,external-nodes property was missing from the pinctrl
> node. Fix the mux capability by adding the required phandles in the
> AST2500-based board files, as the AST2520 from the g5 family doesn't
> have a GFX IP block.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.7.

Cheers,

Joel

> ---
>
> The commit is *very* loosely based on b590c8d2eed5748dfe52c4fc13df6cadb1b56d58
> in the ARM next/dt tree.
>
> Since v1:
>
> * Push assignment of phandles to the aspeed,external-nodes property out to the
>   board dts. I expect eventually we'll want to do this in an ast2500.dtsi
>
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
>  5 files changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 1999a06eec80..40f2184f9fe7 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -83,3 +83,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 9e48c4a1313c..8df116ea8594 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -202,3 +202,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 947cfeb02457..f4060551a874 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -159,3 +159,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 76b738dd0c6b..c067fb78d491 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -277,3 +277,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e22701bfe5fc..d9f63d7752dd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -347,3 +347,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> --
> 2.9.3
>
