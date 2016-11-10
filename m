Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDkJp1L42zDvNk
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 11:22:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HW6J7yD5"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id b123so4648itb.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 16:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=id+GInugl3BCBxhgpOtiwHWzJobD1FW2hWCdL+tJKzE=;
 b=HW6J7yD52MOudLOsRohc5BKRTKq1tw4DwV5qozIcPip2TYyvxw/RP7ZucFCQjqpay9
 0CjdgF7oN2nkaBdxtdfB1IEX3ZswhSlB5P9nSS9sOa6f/ZuO4oVqkwdhhrjKK2K6YORf
 /wLXXGHKfpZfh/drbJoWXAjfs4Hr7z+Ku5God2EXNo+TRqkbZ21R+7oxTLHHGqKTjT68
 MuYcYOshO74Bc1tu5TbvzobX11kraxk6rwpkFDNbcaBg0iVnggBNifbmkdUQ+RM0aFNw
 295X0gCiwvdBRO/Mx0hcueLmo7OoojXJE3tyLyL7Fn7wn/L4aSDhmN/KfCPsonYxKmXO
 N+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=id+GInugl3BCBxhgpOtiwHWzJobD1FW2hWCdL+tJKzE=;
 b=SH+MZlz1pjww3offPrdtEVLrFrJDfp7R7TORALofyp3R7qc1jH1x4mzdY454/dVnry
 lmVJ7gv1nZoFjMxFtP+1/eZRm/fiJyOiOwbjVCmWsw+CwY8XKjKVMwbP2f2r5v3Bxwwo
 eNd4C01ime4i7IdTTEy2WDkSiCRppWbnSaHGg3OFI1xLITlk8YakEN8zCmymkDqNa2JD
 /d/b/ycCdGfikwK/gfkTawGsQSz0w5YZI8lBzHP/Zvl1RNHyz0U7NAB7FSDALx8CS8jc
 Gi+/rx6xcTZzBLOJ04ZA5SOQg9sh/npj0BIqxiY9M0eDnWbfkQ6JpNTi7Achm4u+Jujv
 HfQw==
X-Gm-Message-State: ABUngvdPy2OCmAw02hxJYwEruZ/DvBX/H7yAqyqxws1JS44PtNWmDIksxFI4xCnPYCgpTfaGnj01AlmrK56F+w==
X-Received: by 10.202.252.133 with SMTP id a127mr1485648oii.124.1478737352342; 
 Wed, 09 Nov 2016 16:22:32 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 9 Nov 2016 16:22:11 -0800 (PST)
In-Reply-To: <1478270123-20809-1-git-send-email-clg@kaod.org>
References: <1478270123-20809-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 10:52:11 +1030
X-Google-Sender-Auth: JZBfVi7GbDVx5tYDDefXghnFb8Q
Message-ID: <CACPK8Xe-a_V+KFhz4-hsmzzO3wqxGN7-JwftEhH_3UtvtVo75g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] clk: add a ahb clock for aspeed g4
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 10 Nov 2016 00:22:35 -0000

On Sat, Nov 5, 2016 at 1:05 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> and fix g5 ahb clock which has a 3bits ratio.
>

Thanks. I have rewritten the clock drivers as upstream rejected them
in their current form. As I have not submitted them for inclusion in
the dev-4.7 tree yet I will merge this patch.


> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi |    7 +++++
>  drivers/clk/aspeed/clk-g4.c      |   48 ++++++++++++++++++++++++++++++++=
+++++++
>  drivers/clk/aspeed/clk-g5.c      |    4 ++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
>
> Index: linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-g4.dtsi
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.7.git.orig/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -820,6 +820,13 @@
>                                 };
>                         };
>
> +                       clk_ahb: clk_ahb@1e6e2070 {
> +                               #clock-cells =3D <0>;
> +                               compatible =3D "aspeed,g4-ahb-clock";
> +                               reg =3D <0x1e6e2070 0x4>;
> +                               clocks =3D <&clk_hpll>;
> +                       };
> +
>                         clk_apb: clk_apb@1e6e2008 {
>                                 #clock-cells =3D <0>;
>                                 compatible =3D "aspeed,g4-apb-clock";
> Index: linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g4.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.7.git.orig/drivers/clk/aspeed/clk-g4.c
> +++ linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g4.c
> @@ -68,6 +68,54 @@ static void __init aspeed_of_hpll_clk_in
>  CLK_OF_DECLARE(aspeed_hpll_clock, "aspeed,g4-hpll-clock",
>                aspeed_of_hpll_clk_init);
>
> +static void __init aspeed_of_ahb_clk_init(struct device_node *node)
> +{
> +       struct clk *clk, *hpll_clk;
> +       void __iomem *base;
> +       int reg, rate, hpll;
> +       const char *name =3D node->name;
> +       const char *parent_name;
> +
> +       of_property_read_string(node, "clock-output-names", &name);
> +       parent_name =3D of_clk_get_parent_name(node, 0);
> +
> +       /* Strap register SCU70 */
> +       base =3D of_iomap(node, 0);
> +       if (!base) {
> +               pr_err("%s: of_iomap failed\n", node->full_name);
> +               return;
> +       }
> +
> +       /* bits 11:10 define the CPU/AHB clock frequency ratio */
> +       reg =3D (readl(base) >> 10) & 0x03;
> +       iounmap(base);
> +
> +       /* A value of zero is undefined */
> +       WARN_ON(reg =3D=3D 0);
> +
> +       hpll_clk =3D of_clk_get(node, 0);
> +       if (IS_ERR(hpll_clk)) {
> +               pr_err("%s: of_clk_get failed\n", node->full_name);
> +               return;
> +       }
> +
> +       hpll =3D clk_get_rate(hpll_clk);
> +
> +       rate =3D hpll / (reg + 1);
> +
> +       clk =3D clk_register_fixed_rate(NULL, name, parent_name, 0, rate)=
;
> +       if (IS_ERR(clk)) {
> +               pr_err("%s: failed to register clock\n", node->full_name)=
;
> +               return;
> +       }
> +
> +       clk_register_clkdev(clk, NULL, name);
> +       of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +}
> +CLK_OF_DECLARE(aspeed_ahb_clock, "aspeed,g4-ahb-clock",
> +              aspeed_of_ahb_clk_init);
> +
> +
>  static void __init aspeed_of_apb_clk_init(struct device_node *node)
>  {
>         struct clk *clk, *hpll_clk;
> Index: linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g5.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.7.git.orig/drivers/clk/aspeed/clk-g5.c
> +++ linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g5.c
> @@ -119,7 +119,9 @@ static void __init aspeed_of_ahb_clk_ini
>                 pr_err("%s: of_iomap failed\n", node->full_name);
>                 return;
>         }
> -       reg =3D (readl(base) >> 9) & 0x03;
> +
> +       /* bits 11:9 define the AXI/AHB clock frequency ratio */
> +       reg =3D (readl(base) >> 9) & 0x07;
>         iounmap(base);
>
>         /* A value of zero is undefined */
