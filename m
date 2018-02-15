Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NYyPYT41"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjBLt2PdgzF1C0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 09:50:29 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id f25so1705326qkm.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 14:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oz4BZgNNusXbVcgOHLMl9GyTVKlq1GUHLthZv8ebuSE=;
 b=NYyPYT41iejVFi7QJbatR9IRyoxwjtrBGc2xYfadlDXGxYoUyqNwT7JjfPFBZEicas
 wCbKGSAxwkh/02tBTGPN9IF39MyciffUzjwoWPP2sGGAvuPtAs8WNmtOiu1PQPR/L4vS
 kkA942Mjwb2IkrSM4OOojdqNnHNO8gSJkNYelaXPota3b0xfkYSkkyKO5/cZPni6CfvQ
 JKGmckDM5GbddUw0LE9N+hiY13PJ7pjXZgo7KfpZthk8JO1jBeI5ybR0K16tHPie5dRe
 jDjinfsKS/hh+gf/60VO6rTr+KDGUcRc42MC5KXYnsxSCQ63NoK2i3/elgWiw06Hzqrv
 0rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oz4BZgNNusXbVcgOHLMl9GyTVKlq1GUHLthZv8ebuSE=;
 b=hiKYMVWceixjCCKT2QmUy7zcnaLUettmAJoglCsWY97vugCRFwT5LCoaLK6vkyQV4w
 +ee+2hvI1f9bCKSakcVf05VKcSI/8ut78b4AHSRAyjMH6Jg533oCh2/4cHktF1funGEv
 3LSZw4xcel7rCnFcHBRKAvBQSmoak+XdR6xIZ1/k1AsUW3/Of219mIml0jrwrumUUmb+
 xl83jSZL+ipbrbgow101Oe6GNyRI771JAWVgS6TFx4eaU4Ho/F2TrEbKEJt1/4FYu5gr
 CZ+8/ZqEm3qSGq5UARnvuw7rizGu3m+PlvVEa3XIZ2iNEl4JUklgR4u9YFWoktPEiKxa
 25iw==
X-Gm-Message-State: APf1xPCXJhcNVYpBMfECRvseasOal56RduncwhwiytTG3qQsI+rf9J/t
 m9/7Trtx8HRIRuoMHiXadQ3eBEzEx15LvD6Lmqdopw==
X-Google-Smtp-Source: AH8x227sCWKni2a2MGxFeqeqlbvge13dCGcMG4us6wWDG/pTSPfW3+P3zkZo2GndeNj7A/k/BeA/alwCEXqBAvrtbKQ=
X-Received: by 10.55.212.12 with SMTP id l12mr6566360qki.303.1518735026873;
 Thu, 15 Feb 2018 14:50:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.183 with HTTP; Thu, 15 Feb 2018 14:50:26 -0800 (PST)
In-Reply-To: <1518702115-22990-2-git-send-email-tali.perry1@gmail.com>
References: <1518702115-22990-1-git-send-email-tali.perry1@gmail.com>
 <1518702115-22990-2-git-send-email-tali.perry1@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 15 Feb 2018 14:50:26 -0800
Message-ID: <CAFd5g44BZjZtCoOurtvwn6TuPzYPt6hN4+8CaSfdmU1E3qAXBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] npcm750: add fixed clocks (moved from
 drivers/clk/clk-npcm7xx.c)
To: Tali Perry <tali.perry1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 22:50:31 -0000

On Thu, Feb 15, 2018 at 5:41 AM, Tali Perry <tali.perry1@gmail.com> wrote:
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>

First off, this patchset should probably be combined with "[PATCH v2 0/1] clk:
npcm: add NPCM7xx clock driver":
https://www.spinics.net/lists/devicetree/msg215082.html

> ---
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi | 1223 ++++++++++++++++++++++++++++++++
>  1 file changed, 1223 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..107d901c06f2
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi

This file is already added in "[PATCH v10 2/3] arm: dts: add Nuvoton NPCM750
device tree": https://www.spinics.net/lists/arm-kernel/msg634281.html . You
should base this patchset on that patchset since this depends on it.

> @@ -0,0 +1,1223 @@
> +/*
> + * DTSi file for the NPCM750 SoC
> + *
> + * Copyright (c) 2014-2017 Nuvoton Technology corporation.
> + *
> + * Released under the GPLv2 only.
> + * SPDX-License-Identifier: GPL-2.0
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
<snip>

Cheers
