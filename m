Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="amPASg9s"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgXXr3RwRzF0sl
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 17:23:24 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id s198so5202067qke.5
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 22:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fBCUHCxIsEF4sjtgoe3DWPk1vXY69G32StcrkYuhy+o=;
 b=amPASg9sQI02Qz55vXfjYN0rjIDlB8gC71yLRZxfOqR9wGmtN6BFzro0NdOnmnG0KO
 /YsW07iCpCeLiyuDKdEtQ0+d6VBSJQzpd12z3gH0roxTqqHeJQAv/p4J5wi/DFsEWxRS
 g3RGVgN0TyLk/IEEvv+w9aCHTQDq53lI40suuvD4aPwfgy5GVhuK+s2yKu42jLnRZOFl
 R6lymCi5/3PEI14RwtL1A0TRHOIXwIAQP4LcSq7ranLoJY3wQqagcTiuP1TO/B8jJ0XD
 Q/HvlWqgwdnfDBrlZGEjSmCjCXOWcRPYmIPFwK6k37eKVdR8iEfUArHYBEXVz3/G0oPu
 jMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fBCUHCxIsEF4sjtgoe3DWPk1vXY69G32StcrkYuhy+o=;
 b=htQDxa4LYD6CwmCMypGbjWrRLsTtomUdEnNKUz0kfNEaf+GPLuX6O8tKtR6kOW+O7a
 dytSWyZtZpC7K0gW4A/Pf+o2TARDM+logwS7bkPrrq8Jy4zWmHWXZVauZb5Su8exOIah
 hSkFILQMPFxyhpR94tIeLchWGN3jmHjAEtJtQAgQNtvRQhu7cek7Jtp8gvpH4ppW7yiU
 XmLAvqhhBSsLhDHrWrcb2yZhJRsfj8O3ihO5TTZlN42lHx7iuvBSJPAmeTWgxpneF8JP
 taHnllO1GgxJtgWovcd2+py8sNFz2uHu85TkBGVOcBnMIdAHiXsB80x/T3yecQeu/3y6
 x/xw==
X-Gm-Message-State: APf1xPDmcE/6cW4MEKbJONknTpk4dxkZJBbhQB5pgmTXRCQ/qKo1stZ4
 qhIy9AAzZ3nZSe+svQnkB3czFTmzJqZDHsP40ks=
X-Google-Smtp-Source: AH8x226k9HS0LJ/zMGMbSxpYMtGlK5GagQsp17bNaC10iHCrZP2Avwv/Cqyuf5TRXrb8OehekvuvFcvQILJD+k1MZKI=
X-Received: by 10.55.41.151 with SMTP id p23mr242705qkp.52.1518502996931; Mon,
 12 Feb 2018 22:23:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 22:22:56 -0800 (PST)
In-Reply-To: <20180205235757.246758-3-brendanhiggins@google.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 16:52:56 +1030
X-Google-Sender-Auth: IcbHmKouHDF4Oh91lioBIt2Rt5o
Message-ID: <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 julien.thierry@arm.com, 
 pombredanne@nexb.com, devicetree <devicetree@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Tue, 13 Feb 2018 06:23:25 -0000

Hi Brendan,

On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>

This looks well acked, reviewed and tested. How do you plan to have
the ARM SoC maintainers merge your patches?

> ---
>  .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 ++++++
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  35 +++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 162 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  35 +++++
>  5 files changed, 280 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h

You need to add nuvoton-npcm750-evb.dts to arch/arm/boot/dts/Makefile

Once you've done that you can add

Tested-by: Joel Stanley <joel@jms.id.au>

as I tested this on an EVB.

> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..08e906f88c49
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm7xx-smp";
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
> +/* external clock signal rg1refck, supplied by the phy */
> +clk-rg1refck {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <125000000>;
> +};
> +
> +/* external clock signal rg2refck, supplied by the phy */
> +clk-rg2refck {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <125000000>;
> +};
> +
> +clk-xin {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <50000000>;
> +};

The whitespace here needs to be fixed.

Cheers,

Joel

> +
> +       soc {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges = <0x0 0xf0000000 0x00900000>;
> +
