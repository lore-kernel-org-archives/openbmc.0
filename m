Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxKfaJGu"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CkjT5T8SzDqF6
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 02:39:41 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id k21so4260314ior.13
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 07:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qE0Zu8808ijdzE0BYmvxkSngUFssgXh8tClUyxa3sPs=;
 b=XxKfaJGuBJFgk/cdzD/2HpobQxzZr57hTbpvfh13vBE5YuF1CzL5NjGfXYEyubSy45
 mrZeA//EbvTkN/Dc/l47MzxTn0blpFiRh3HUUek9XzoSZo0oONipY3wgWQJPxf1a3JOc
 kcyDmj3yESxM27HELfXm3OvSdgldEL+ef/FqFkq9L6LZ7WoPxmHVxRREoWTWkjgJ2aZZ
 Uy1R4mLYOPh0AV/lS+Y1oL5RuwJHBheMeytrI0eF68IZm9r4/sLVBXMmkbq9h4ljPs2y
 JpmYdd4rzleV1s3KJpV6MSVDlix4/rP0huFfFs3oqrhe8E0pxWzDpiJ52SPLkWjvzRix
 w5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qE0Zu8808ijdzE0BYmvxkSngUFssgXh8tClUyxa3sPs=;
 b=VNd3EdH7HS/4Nhvp98ORUyC/gydVWS1YGHlJZOxisbYbw0rVTey6aApnOXXMkQcXmY
 crOMIZBhCLukhWVbh5uQxrseQZKZQr1ORA5zwPC6OfxF4iMniBmp9GXl0rl5N90CZ2JG
 mVTf6a9i/7J4q1N/duBjQkCV7gKKe6V9huz1oOBfZ+Sp9lSNukmJP984xNvnW3LzAlWj
 2gKPj0kb08O3Qy5ZgKmSxKNHdK+0+GIP2dQAJR72CznLLIZg6yVihwVos2ZyX+6Gwu+Q
 dJ3mgLSUbMNb90zo00277FrE0gFpv9BpADOj8h1kNODaQtIArSErl/id5YWVnPo93m/K
 Cf/A==
X-Gm-Message-State: APjAAAUvtALZzNbZ59XXHsy2/W16UrK2C/0amoO/nDlA4T6ROKUn5ydU
 hSnn1HpEPoI9e7JE8MPULW/TM1ieRH1QObASfg==
X-Google-Smtp-Source: APXvYqwWnygP/CYpVoom77HVoDG4du5ty9Av0tuv/JeGLUOQ0LxSf9rbgiHm7uq2/vEea5xSyJtthzBi3q2mIa56j88=
X-Received: by 2002:a6b:6e11:: with SMTP id d17mr9864707ioh.297.1551713977983; 
 Mon, 04 Mar 2019 07:39:37 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-6-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1551430616-42014-6-git-send-email-wen.yang99@zte.com.cn>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 4 Mar 2019 17:39:28 +0200
Message-ID: <CAKKbWA5GkC7M9gm_HRN-4=neJKNH4JGRj1aaNsHyR7Ar54dS0A@mail.gmail.com>
Subject: Re: [PATCH 06/15] arm: npcm: fix a leaked reference by addingmissing
 of_node_put
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, 
 Russell King <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgene@kernel.org,
 krzk@kernel.org, 
 linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com, afaerber@suse.de, 
 manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, heiko@sntech.de, 
 linux-rockchip@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, 
 rjui@broadcom.com, sbranden@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org, 
 catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au, 
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, 
 linux-imx@nxp.com, wang.yi59@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Mar 2019 12:27:30 +1100
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
X-List-Received-Date: Mon, 04 Mar 2019 15:39:42 -0000

Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Thanks

On Fri, Mar 1, 2019 at 10:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-npcm/platsmp.c:52:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 31, but without a corresponding object release within this function.
> ./arch/arm/mach-npcm/platsmp.c:68:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 60, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/mach-npcm/platsmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> index 21633c7..fe63edc 100644
> --- a/arch/arm/mach-npcm/platsmp.c
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -35,6 +35,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
>                 goto out;
>         }
>         gcr_base = of_iomap(gcr_np, 0);
> +       of_node_put(gcr_np);
>         if (!gcr_base) {
>                 pr_err("could not iomap gcr");
>                 ret = -ENOMEM;
> @@ -63,6 +64,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>                 return;
>         }
>         scu_base = of_iomap(scu_np, 0);
> +       of_node_put(scu_np);
>         if (!scu_base) {
>                 pr_err("could not iomap scu");
>                 return;
> --
> 2.9.5
>


-- 
Regards,
Avi
