Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZeXX3MXK"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwyP938PVzF1Z4
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 13:33:16 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id p78so1278262iod.13
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 18:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vWqZvGBUNXhXGb8a9kGNHL4m74SlWXLE19UPD91Klt0=;
 b=ZeXX3MXKNWAIAOJbujwKkHJi9NtqRwDUC4H5paE5xND0HEKsBx9WYpIONYQZUgcrUO
 A3ejnvFT+ZpSysZkruHZvDeIAdcp/xR7jfQkJSKSPXksSiAbKIbF726KzSIjsg3Y+W8C
 +Nxhe5D0zAyseJcs2T8RjKmUEtWRRafCXj1bNZAovk2AY5ZP4gVWAv3rRukXZM+Ba1p0
 fvRRqxO0VrB4KU28VDbkjDKvg3r42pdM+/1V1sfpAaYM7tERVkaq7HHsct24D+hnWbCc
 zpszS5OAP9o+dvVuGp5VJAzrJgAI/IAMeSMp9jyI6i5q29RNIomM+BanaqO2KjrYg+OG
 dmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vWqZvGBUNXhXGb8a9kGNHL4m74SlWXLE19UPD91Klt0=;
 b=sA92GMC50/Ky8ZlwANY2z0kJXMfBjQf6s0mxTUPKWJgArnoqQUVh1JykK4b3Ki/ItS
 UguxqUCgB0lPUZDZWUrQbWQSAtd4yzoelowPx/kQkYJOBAe5hPIUMh9OKYdh5TypQEZX
 vuxNVbOw+uSaumnBGZyzrhYFpC23V1SieQRwxKP5Hjwxh4s6nF02FTNGSzH0cTIIo3mn
 OKkpqctrfHAPL50LAW60xvsryM8WbwwqVLxlILJp1/N8/627zRXYFmtzPVFM+Nt1aWxK
 uJVO2xlTk9K+BCB1BTeZekFCouGFlNrKHhkdaKkcLKPUcqtTzkSGpWpa1L3Jsd/ByO1r
 X6mQ==
X-Gm-Message-State: APf1xPBSstVaxeQxhgEnilggJm/QtKqH7GxaCaXuRvJ9+NAISKtNNmCb
 RzC7Kq0dTnpWQ0tj9qrmEPvxs9zV7J8ZB4lDwos=
X-Google-Smtp-Source: AG47ELuugYkRRPuledwj6+cHsOZxbiH+iPFqLTF0P/u0AnTs7LeN6iZ1zgOutg8mAuanb0cRl5BNFWQk2Ad7JbgigzY=
X-Received: by 10.107.201.11 with SMTP id z11mr23838448iof.171.1520389994698; 
 Tue, 06 Mar 2018 18:33:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.146.18 with HTTP; Tue, 6 Mar 2018 18:33:14 -0800 (PST)
In-Reply-To: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 7 Mar 2018 10:33:14 +0800
Message-ID: <CAARXrt=MV0eA0xb76Q+oDHPh2TkZjsFwd=wh-DtZC_FHJFFtpA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Prevent reset and enable if
 clock is already enabled
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 07 Mar 2018 02:33:18 -0000

With the patch, the hang issue in ISTEPS (openbmc/openbmc#2948) is gone, in both
cold and warm boot.

Tested-by: Lei YU <mine260309@gmail.com>

On Wed, Mar 7, 2018 at 4:24 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Systems are seeing some issues where the LPC clock gets into a bad state
> when the ASPEED clock driver resets and enables the clock during
> startup. The LPC clock (according to AST2500 spec) is enabled by default,
> so resetting and re-enabling is not desired. Add a simple check before the
> enable procedure to see if the clock is already enabled.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/clk/clk-aspeed.c | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index b67ba14..3d12f7a 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -221,27 +221,33 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>         u32 clk = BIT(gate->clock_idx);
>         u32 rst = BIT(gate->reset_idx);
>         u32 enval;
> +       u32 reg;
>

I would prefer to call aspeed_clk_is_enabled() to check if it's
enabled and return
before spin_lock_irqsave().

>         spin_lock_irqsave(gate->lock, flags);
>
> -       if (gate->reset_idx >= 0) {
> -               /* Put IP in reset */
> -               regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
> -
> -               /* Delay 100us */
> -               udelay(100);
> -       }
> -
> -       /* Enable clock */
> -       enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
> -       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
> -
> -       if (gate->reset_idx >= 0) {
> -               /* A delay of 10ms is specified by the ASPEED docs */
> -               mdelay(10);
> -
> -               /* Take IP out of reset */
> -               regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
> +       /* Only reset/enable/unreset if clock isn't already enabled */
> +       regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
> +       if (reg & clk) {
> +               if (gate->reset_idx >= 0) {
> +                       /* Put IP in reset */
> +                       regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,
> +                                          rst);
> +
> +                       /* Delay 100us */
> +                       udelay(100);
> +               }
> +
> +               /* Enable clock */
> +               enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
> +               regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
> +
> +               if (gate->reset_idx >= 0) {
> +                       /* A delay of 10ms is specified by the ASPEED docs */
> +                       mdelay(10);
> +
> +                       /* Take IP out of reset */
> +                       regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,                                              0);

Remove the extra blanks or put it in next line.

> +               }
>         }
>
>         spin_unlock_irqrestore(gate->lock, flags);
> --
> 1.8.3.1
>
