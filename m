Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eM+r0Sc/"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vgqn3C9yzDqBV
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:21:56 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id t8so352320otp.7
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9lrIHuY9fD/UPR5Age0eP8PxWjndHGiSHD27i6LQR14=;
 b=eM+r0Sc/VkAbhK/bPOgcTLEVbXf0Ez6Yqv0TjTM5+gZQL9qF8mmNibiOzNkLhc5HAv
 gI3v85YnV/Y6f2+Zt0tncyGJDv8bpGZIA/0XXxK9mAeVAY8OpqOqqbX8Rltlk0EM0sHK
 ZFPsPgTSWinToNx6CfmBB2EUo7gajLhPLsU7iWk2PV03TTvmsdbCtLNwe9iQEIaFXmCN
 u5y1Y/Guat9oPq/5qYtcCSLTwqMS/9GJOukcHLcw8wCvzjsocT46I+nQRwHjGwK7saOy
 suyog+byj28e6B1Ha5TuSixW2Z2Nq/LhSmWr7FF+v+/SihT4z3F44np8TmfikGBBSzs8
 Zw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9lrIHuY9fD/UPR5Age0eP8PxWjndHGiSHD27i6LQR14=;
 b=rTWMJ5A+1I9PdcXaPRAiMY/teC7EFEUGT9NxCZTDcXzPujAnzkHsBWobc2D3Z4I5A6
 pk1c203BW2BxhBTOBGqHu1On6jNPgkRN2MeJQabOylYy66yTzXfvACbaNmF4XORDqRjv
 CN/bfZVnoaKZuCv13BP4tUfZ5c8Tn6CKT+MY6ouNbAvzYAdgV0cIeJanAE1GK2FFZOR0
 x33jnPy0b/S8QX3l9AIaEnBPJ2wfB5iMfen+8NuFOkCQkAytg5ac5K/DPdD6sBJI3m15
 xoghKoBbOKzJc6IDL5S7gjsUqLSraoAflOKq0SQ3rOfGCNmPTQz6oWanlaVEzrB0vGu6
 X9yw==
X-Gm-Message-State: APjAAAXQcSPLUK1qlhQ/obb75XvYj+6EMdbVIZ8i5na2HyMTBDue88Zx
 9rsrOWde+x8fLxvL9dGkYuAIxiiQrIx46COBVmB9yQ==
X-Google-Smtp-Source: APXvYqzCZnM1lVu/xws9rDcFXq5U0cvAhkMgEF/N2p9L0WtVItB1svcSaV+lRNCs92JDq+mpSQ82ArSepCH1S5kliGU=
X-Received: by 2002:a9d:6b97:: with SMTP id b23mr12731178otq.113.1553815311761; 
 Thu, 28 Mar 2019 16:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190328231317.330699-1-tmaimon77@gmail.com>
In-Reply-To: <20190328231317.330699-1-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 28 Mar 2019 16:21:40 -0700
Message-ID: <CAFd5g44h8J9VV84QbbEeE9U-=2kpOk-vgqCnmLV_=0uMu20MZw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Joe Perches <joe@perches.com>, Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tali Perry <tali.perry1@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Mar 2019 23:21:58 -0000

On Thu, Mar 28, 2019 at 4:13 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> In the process of upstreaming architecture support for ARM/NUVOTON NPCM
> include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
> include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
> MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
> of this file.
>
> Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM architecture")
> Reported-by: Joe Perches <joe@xxxxxxxxxxx>
> Signed-off-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>

Hmm...looks like you just copied the text from Spinics, because the
email addresses are x'ed out.

You can download the patch here: https://lore.kernel.org/patchwork/patch/996114/

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e5a5d263f29..8b305d2f2a8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1900,7 +1900,7 @@ L:        openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>  F:     arch/arm/mach-npcm/
>  F:     arch/arm/boot/dts/nuvoton-npcm*
> -F:     include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> +F:     include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>  F:     drivers/*/*npcm*
>  F:     Documentation/devicetree/bindings/*/*npcm*
>  F:     Documentation/devicetree/bindings/*/*/*npcm*
> --
> 2.14.1
>
