Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JAl5s94V"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439l5K5Hc3zDrQV
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 05:49:41 +1100 (AEDT)
Received: from localhost (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F1B420892;
 Thu,  6 Dec 2018 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544122179;
 bh=c2FkfkWDfo0X+sfR3Y93kLhJbaEGXTN6njPigIWWPDQ=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=JAl5s94VPqFfFbh1gWNiJu22dLzK2B9x/9fi1g7vGsbe1XKX9J73zVYtm5oP7Hnmw
 +nmxhmFCaaPBVR/LboMYG8rqFj3cIL2t1o1zYTFVTWCriYMypAhig8b0WDICIE0Dd/
 tXE9tKIrf8pOz9Qk43YsWf6TepH45S+M18pvYAgA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Tali Perry <tali.perry1@gmail.com>, avifishman70@gmail.com,
 brendanhiggins@google.com, mturquette@baylibre.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181206084431.315559-1-tali.perry1@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
References: <20181206084431.315559-1-tali.perry1@gmail.com>
Message-ID: <154412217893.88331.5801113240812610558@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: npcm7xx: get fixed clocks from DT
Date: Thu, 06 Dec 2018 10:49:38 -0800
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
X-List-Received-Date: Thu, 06 Dec 2018 18:49:42 -0000

Quoting Tali Perry (2018-12-06 00:44:31)
> diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> index 27a86b7a34db..4bd2e40997d4 100644
> --- a/drivers/clk/clk-npcm7xx.c
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -8,13 +8,19 @@
>   */
>  =

>  #include <linux/module.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/rational.h>

Why?

>  #include <linux/bitfield.h>
>  =

>  #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> @@ -568,6 +575,31 @@ static void __init npcm7xx_clk_init(struct device_no=
de *clk_np)
>         for (i =3D 0; i < NPCM7XX_NUM_CLOCKS; i++)
>                 npcm7xx_clk_data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
>  =

> +       /* Read fixed clocks. These 3 clocks must be defined in DT */
> +       clk =3D of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_REFCLK);
> +       if (IS_ERR(clk)) {
> +               pr_err("failed to find external REFCLK on device tree, er=
r=3D%ld\n",
> +                       PTR_ERR(clk));
> +               clk_put(clk);
> +               goto npcm7xx_init_fail_no_clk_on_dt;
> +       }
> +
> +       clk =3D of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_SYSBYPCK);
> +       if (IS_ERR(clk)) {
> +               pr_err("failed to find external SYSBYPCK on device tree, =
err=3D%ld\n",
> +                       PTR_ERR(clk));
> +               clk_put(clk);
> +               goto npcm7xx_init_fail_no_clk_on_dt;
> +       }
> +
> +       clk =3D of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_MCBYPCK);
> +       if (IS_ERR(clk)) {
> +               pr_err("failed to find external MCBYPCK on device tree, e=
rr=3D%ld\n",
> +                       PTR_ERR(clk));
> +               clk_put(clk);
> +               goto npcm7xx_init_fail_no_clk_on_dt;
> +       }

Now this looks like a DT validator in the kernel. DT folks are working
on a schema and validator, which should be able to make sure that the
DTS file has the proper set of clks specified for this drivers' node so
that we don't need to check in the kernel.

So it looks like nothing needs to change here?
