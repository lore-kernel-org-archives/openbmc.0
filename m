Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="iJ0P9PVH"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xch81DmHzDq5n
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 14:07:04 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id k130so4759234qke.3
 for <openbmc@lists.ozlabs.org>; Sun, 31 Mar 2019 20:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=laVGxqjGD8/0MElAwrciQ8OGXV3HW2PG6K88qtKI0V8=;
 b=iJ0P9PVHCcZYL7nNNkXC1+zIaHcQPxFHsamWoPLDq3gv/NLABYXYIEvJHAtsfd5H+2
 PgRHQYe/w8irW+gRWyoRJpx0BYFMZAJBqVLkK7DHrbsW4slLloHQBT2RJP/p9ieJs8fa
 WRvNeiLqr4tPPx5EHU2gI/SBs0tUAvevzKd5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=laVGxqjGD8/0MElAwrciQ8OGXV3HW2PG6K88qtKI0V8=;
 b=a4daRikaDaVKM9bGDDLGk3+rEmEDKkVPvbvbDB5Yci5UA5Na/h1OvZzXw6egFf/938
 4L6aWe/gdnsB8FwZp3kLgOhinSLlz/ALbk0CShD0AMqo9jNpDCL8U5rznGnppfUabsdu
 RSBDnh8myMc/joS1dEs7jHqud18XO9hijph1NIRersy2z62oDM+8HK3eWz6iAHFXqQH5
 UZ0an1TQcrhZvdabdfC2ub2e/MbFweiZeF3JcD+aXVK+0czZX+mfc+Fb8gav++9c50kt
 9dtB4cG9pDrFus4TZE8LXD59uhfB9dns+Ne++ry7KpT8UJ7RUYEPK/6uV3Kf+xij5X1T
 vxDg==
X-Gm-Message-State: APjAAAVtopJz0JNP2DPzuOHSv/haT50OWF6BgwVU/hJVZJvlQzxwEsaM
 6sayXQtVb5VXMD/xArBkLAoM4Ryw5OcHxZwFc2g=
X-Google-Smtp-Source: APXvYqy0utsMJa6cISHOc3T5lgUmOxAt4M6m4m8s4GCGBa/bJfOyn/inUXcjkJJcIPsh0RpPVMT8yyjJh5TVwpDWI2E=
X-Received: by 2002:a37:448:: with SMTP id 69mr42299805qke.336.1554088020916; 
 Sun, 31 Mar 2019 20:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190328150548.3279-1-fran.hsu@quantatw.com>
In-Reply-To: <20190328150548.3279-1-fran.hsu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Apr 2019 03:06:49 +0000
Message-ID: <CACPK8XcLtRmocZoeCXpLHErkGqqF6OVusCbCvGH-BF-krgUTMw@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v1 1/3] ARM: dts: nuvoton: Add Quanta GSJ BMC
 machine.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, 
 Emily Shaffer <emilyshaffer@google.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 03:07:05 -0000

Hello,

On Thu, 28 Mar 2019 at 15:05, <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add a common device tree include file for NPCM730.
>
> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>

I am happy for these to be carried in the OpenBMC tree. However, can
you also submit them to the upstream list?

Cheers,

Joel

> ---
>  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> new file mode 100644
> index 000000000000..20e13489b993
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
> +// Copyright 2018 Google, Inc.
> +
> +#include "nuvoton-common-npcm7xx.dtsi"
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm750-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +       soc {
> +               timer@3fe600 {
> +                       compatible = "arm,cortex-a9-twd-timer";
> +                       reg = <0x3fe600 0x20>;
> +                       interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +                                                 IRQ_TYPE_LEVEL_HIGH)>;
> +                       clocks = <&clk NPCM7XX_CLK_AHB>;
> +               };
> +       };
> +
> +       ahb {
> +               udc9:udc@f0839000 {
> +                       compatible = "nuvoton,npcm750-udc";
> +                       reg = <0xf0839000 0x1000
> +                              0xfffd0000 0x800>;
> +                       interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       clocks = <&clk NPCM7XX_CLK_SU>;
> +                       clock-names = "clk_usb_bridge";
> +               };
> +       };
> +};
> --
> 2.21.0
>
