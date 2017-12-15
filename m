Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L8uDk/Gc"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyWvN0JtpzDrcw
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 11:46:07 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id c140so8656245lfg.7
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 16:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rOULaFnzZ9lHr4lLHeTB+jRS9c7we9nLbMELj9zl2J8=;
 b=L8uDk/GcwJk/w+0V+ksyU7jADcZJsuNfMJLmymuCZcu0i8BNnl8oWYYd42H9qOkTkb
 EBkNKQbA2aWQDmgN40NpTWa69QEvdSK0OOvq4i/5O0Nb6M3c5U12Iz2m1StJFwVfhq+4
 EbXCXfBwVaZqv28HVPpqAqdThBVWiYqGTTMwJXCSrQGwluMGG+rWPXtqfv00w+k8TMkq
 uHWjxfrIiFlwuDqAVH+rXdQal/sZa3xEL7/9TQIAC547TSoe6hYi1/sKYHwDWcK0o62a
 9nsAEoqdGkJgT1ZEey8sDrZWIxTvmYwsufqcNk/vLSmO22pRdli5cB92ZoaNW2U/k85M
 RVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rOULaFnzZ9lHr4lLHeTB+jRS9c7we9nLbMELj9zl2J8=;
 b=Ju9bgrAtIIvIdhUmWfDqEyAzmnslf3WpF1+xV4XCAv3n/wt3d01sjdhIgetlKrxaru
 TilAB1K2ByQPNZh6JjioDlGKB9GxdYyqTjHbMrdpwWRhizfQAAFXc0Xb7z9xf80JC9nS
 y4nLMlmfOQw7jRoMmswRD7UkjXvjo3b416cr43obGUOeNt7tcYQwSpTAckCYmLF2h6E9
 Fs7EzQAqs1bb1MUYkegi9WXflUuu+MCDxL1hFCYylG5XaeMZUHf3Qt9Ya9bqqMmoyqEC
 JFDq2jphe5bsSMikoE0AOj+huHWFBPOkzWm3XR/H31e1wnCfgy70FUtkvfqSNlQwPPSz
 0EXQ==
X-Gm-Message-State: AKGB3mLITho7bFQdUMHZEjljHBojCedCGwtPo87BAedshVcpDjyE7Y4D
 VH7o5FpZ8wj9t0U0kXF73aKRRYw+/cZWuaCV05g=
X-Google-Smtp-Source: ACJfBovD1ojkEFcQRLTtjW/RnJESa/IyeCgMW7qMHYhvVFhHTYCb0tL6tDfy6Jcl1b8bww79RwpWI+pO9Xb6M+ipNB4=
X-Received: by 10.46.85.208 with SMTP id g77mr4915277lje.114.1513298763877;
 Thu, 14 Dec 2017 16:46:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 14 Dec 2017 16:45:43 -0800 (PST)
In-Reply-To: <1513172728-20998-2-git-send-email-tmaimon77@gmail.com>
References: <1513172728-20998-1-git-send-email-tmaimon77@gmail.com>
 <1513172728-20998-2-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Dec 2017 11:15:43 +1030
X-Google-Sender-Auth: DZ7UEcCDPSA0-j8wuzU1zt_-sBc
Message-ID: <CACPK8Xdc0jcqf1DPge-2D-E1e-Sfi72c6=UEVWjoPuyxfEy1wg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 00:46:09 -0000

On Thu, Dec 14, 2017 at 12:15 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Adds basic support for the Nuvoton NPCM750 BMC.
>
> Based on [v8,1/3] arm: npcm: add basic support for Nuvoton BMCs patch:
> Brendan Higgins : - https://patchwork.kernel.org/patch/10063409/
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/Kconfig                    |   2 +
>  arch/arm/Makefile                   |   1 +
>  arch/arm/configs/PolegSVB_defconfig | 428 ++++++++++++++++++++++++++++++++++++

Convention is to use lowercase for the filename. Please put the
defconfig in a separate patch.

>  arch/arm/mach-npcm/Kconfig          |  61 +++++
>  arch/arm/mach-npcm/Makefile         |   6 +
>  arch/arm/mach-npcm/headsmp.S        |  22 ++
>  arch/arm/mach-npcm/npcm7xx.c        |  27 +++
>  arch/arm/mach-npcm/platsmp.c        |  86 ++++++++
>  8 files changed, 633 insertions(+)
>  create mode 100644 arch/arm/configs/PolegSVB_defconfig
>  create mode 100644 arch/arm/mach-npcm/Kconfig
>  create mode 100644 arch/arm/mach-npcm/Makefile
>  create mode 100644 arch/arm/mach-npcm/headsmp.S
>  create mode 100644 arch/arm/mach-npcm/npcm7xx.c
>  create mode 100644 arch/arm/mach-npcm/platsmp.c

> diff --git a/arch/arm/configs/PolegSVB_defconfig b/arch/arm/configs/PolegSVB_defconfig
> new file mode 100644
> index 000000000000..149e422a24ef
> --- /dev/null
> +++ b/arch/arm/configs/PolegSVB_defconfig

The defconfig should be the result of running "make savedefconfig".
This produces a file called "defconfig" that you can copy to
arch/arm/configs/poleg_svb_defconfig and commit.

This is the same process you should use when updating the defconfig:

make ARCH=arm poleg_svb_defconfig
// update config options
make ARCH=arm savedefconfig
cp defconfig arch/arm/configs/poleg_svb_defconfig
git commit -vsm "ARM: configs: npcmu: update defconfig"

Cheers,

Joel
