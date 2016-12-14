Return-Path: <xow@google.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tf6FV0cNQzDw3P
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 06:33:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aGuuQIep"; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id n21so32656635qka.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 11:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=LJMTKIcymCm3SFd8ujZBf8qW5YO56J5zbUkWxmmBFFg=;
 b=aGuuQIepv+tX9Lqlv1n9we26jrPLpCV+P6TdG2uVYEg5INQ6C7fBrjV3R4zwGe7Gd6
 bVRll4PZbjcDAln59nx1ifYATLriPwxraT+aUbXo5MCZcwJAMceSj9NtTjzPya/6VMAY
 r7i8npqHcT737/ZieHIWwM3OlQZ7hgYD6yjFcGKIdFtVYw/KyMAMB9xjvfKjianT+l8j
 1eKXVvDM8FNuy8XOEYp6pnfUlh1SY5coSrRgMBrAkbev+sq1JxJaN1EnKDgYv0VFDKIv
 xBk6G3d7avwBsuIQO3sR49Rkec0tlhoi+u/yEg4MyYNRzG7z3RPX4DvN/+ALXyVeTAcQ
 Ynnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=LJMTKIcymCm3SFd8ujZBf8qW5YO56J5zbUkWxmmBFFg=;
 b=E8cwMzd3fZ7NcnTuSwY6g2YQr75+RXJQNOb7ww7yOT7UhEPbF/3zSYgGMo7MrFMvcP
 75PUVtHfjiqvVMaVH6/GxfeT1puTFy5FI3VsQBpscj2SaOgApTQXEUrYQHXINuNWquk8
 XGdXxuPHtnAc7K7cjmxoOhN5Lv4i46fn4WSMiysx/rlSGfGRsAb1dueHTqXkbw8Dzt6p
 J8bOo19m9parAIFx1DDWx7iT10gxtBhqfh09FOcMu5PdWtVz4V7M0owh0+S26HW/KSUb
 mKT1gJMNxePCW1Mjg3wDM7xhCUwnyPcxbSbtOWFHLHBqndKXWmpUliw59nmSkT47m7yy
 OCLA==
X-Gm-Message-State: AKaTC00290WW6Ro9rKnIh0WNbuTs5fq6zj2R6DRpqx6XcBfQE48EtJ/H0BxX0cTeNVToj0QoqAufull/0Eg9kro+
X-Received: by 10.55.70.76 with SMTP id t73mr86322857qka.195.1481744026699;
 Wed, 14 Dec 2016 11:33:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.18 with HTTP; Wed, 14 Dec 2016 11:33:46 -0800 (PST)
In-Reply-To: <1480571345-135418-1-git-send-email-xow@google.com>
References: <1480571345-135418-1-git-send-email-xow@google.com>
From: Xo Wang <xow@google.com>
Date: Wed, 14 Dec 2016 11:33:46 -0800
Message-ID: <CAPH-5w4ZKBy+eJBjoqHQa5A30kg415+H9S7LejDK+DaQC=3Knw@mail.gmail.com>
Subject: Re: [PATCH linux] arm: aspeed: zaius: Setup LPC to AHB bridge
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 14 Dec 2016 19:33:50 -0000

On Wed, Nov 30, 2016 at 9:49 PM, Xo Wang <xow@google.com> wrote:
>
> Add explicit SPI1 flash windows rather than use boot values.
> Add 64 MiB mapping for LPC host interface to SPI1 CE0's window.
> Add missing call to do_common_setup() which includes enabling LPC FWH
> access cycles.
>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index a491cd2..807ccc2 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -137,6 +137,8 @@ static void __init do_zaius_setup(void)
>         unsigned long reg;
>         unsigned long board_rev;
>
> +       do_common_setup();
> +
>         /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
>         board_rev = (reg >> 3) & 0x1F;
> @@ -162,6 +164,24 @@ static void __init do_zaius_setup(void)
>                 reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
>                 writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
>         }
> +
> +       /* Setup PNOR address mapping for 64M flash
> +        *
> +        *   ADRBASE: 0x3000 (0x30000000)
> +        *   HWMBASE: 0x0C00 (0x0C000000)
> +        *  ADDRMASK: 0xFC00 (0xFC000000)
> +        *   HWNCARE: 0x03FF (0x03FF0000)
> +        *
> +        * Mapping appears at 0x60300fc000000 on the host
> +        */
> +       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
> +       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> +
> +       /* Set SPI1 CE1 decoding window to 0x34000000 */
> +       writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
> +
> +       /* Set SPI1 CE0 decoding window to 0x30000000 */
> +       writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>  }
>
>  static void __init do_witherspoon_setup(void)
> --
> 2.8.0.rc3.226.g39d4020
>

ping
