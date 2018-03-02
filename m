Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=74.125.82.195; helo=mail-ot0-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
 [74.125.82.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ztNpK4vm9zF1t1
 for <openbmc@lists.ozlabs.org>; Sat,  3 Mar 2018 09:12:40 +1100 (AEDT)
Received: by mail-ot0-f195.google.com with SMTP id m22so10069500otf.10
 for <openbmc@lists.ozlabs.org>; Fri, 02 Mar 2018 14:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xDFhA1RlenlwGfkhZ0VfatCcwvivE5dEYuNxyKpDicM=;
 b=uc9BHQCUqGUo4pPBzY8b1WJKrC369CpXlzoOrHVLmPAoI509TxmLWvNDYvjT1t0OBh
 q15aqvOAVlP+xNGBW2phmP/9cS4fWRFZZ7NFsN/MDwUe9qClD6H24JnsZVwV6Os824eN
 wDQetkiDF4Bnvu11+93UQsKSYjOhgsY7uvQZMoD//2eyXMvGRXqY7jpOMKjj2aXSP3F/
 3wQxk/BwlkWkAw0U2Z8mSglKN6vN+cJ2eDL394kDbNGg2bGy32F/Mm71+usunigg1kLf
 +uTNxQv7QKsz4koUsGShQ1MrevCKdkOlpTqox7+rOTQWc1ODqQeLLk3Br8ovIf5KSj//
 IZFA==
X-Gm-Message-State: AElRT7HYgRsRGHQq5uiyrbgHuebUkyAQge8T/VYi18T3GJxtv1xOaGSZ
 VvorkHlkwRdRXIetr8iwHA==
X-Google-Smtp-Source: AG47ELtAjRVR0lutjNFhsVZsPjeVd88Mj6tavGybEzFiAQi/HoWyAq3OwYrMIrUXpVSa5SjkoXpMrw==
X-Received: by 10.157.10.227 with SMTP id 90mr5474430otq.17.1520028758512;
 Fri, 02 Mar 2018 14:12:38 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id w31sm3949561otd.51.2018.03.02.14.12.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Mar 2018 14:12:37 -0800 (PST)
Date: Fri, 2 Mar 2018 16:12:36 -0600
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Cc: brendanhiggins@google.com, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 mturquette@baylibre.com, sboyd@codeaurora.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 2/3] NPCM750: add clock tree doc and binding
Message-ID: <20180302221236.qsxooi5l53wx6lby@rob-hp-laptop>
References: <1519553539-15899-1-git-send-email-tali.perry1@gmail.com>
 <1519553539-15899-3-git-send-email-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519553539-15899-3-git-send-email-tali.perry1@gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-List-Received-Date: Fri, 02 Mar 2018 22:12:42 -0000

On Sun, Feb 25, 2018 at 12:12:18PM +0200, Tali Perry wrote:
> 
Need a commit msg.

The subject should be "dt-bindings: clock: ..."

> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 
> ---
>  .../bindings/clock/nuvoton,npcm750-clk.txt         | 100 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  44 +++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
> new file mode 100644
> index 000000000000..dd17b86bd577
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
> @@ -0,0 +1,100 @@
> +* Nuvoton NPCM7XX Clock Controller
> +
> +Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
> +generates and supplies clocks to all modules within the BMC.
> +
> +External clocks:
> +
> +There are six fixed clocks that are generated outside the BMC. All clocks are of
> +a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
> +clk_sysbypck are inputs to the clock controller.
> +clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
> +network. They are set on the device tree, but not used by the clock module. The
> +network devices use them directly.
> +Example can be found below.
> +
> +All available clocks are defined as preprocessor macros in:
> +dt-bindings/clock/nuvoton,npcm7xx-clock.h
> +and can be reused as DT sources.
> +
> +Required Properties of clock controller:
> +
> +	- compatible: "nuvoton,npcm750-clk" : for clock controller of Nuvoton
> +		  Poleg BMC NPCM750
> +
> +	- reg: physical base address of the clock controller and length of
> +		memory mapped region.
> +
> +	- #clock-cells: should be 1.
> +
> +Example: Clock controller node:
> +
> +	clk: clock-controller@f0801000 {
> +		compatible = "nuvoton,npcm750-clk";
> +		#clock-cells = <1>;
> +		reg = <0xf0801000 0x1000>;
> +		clock-names = "refclk", "sysbypck", "mcbypck";
> +		clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
> +	};
> +
> +Example: Required external clocks for network:
> +
> +	/* external reference clock */
> +	clk_refclk: clk-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "refclk";
> +	};
> +
> +	/* external reference clock for cpu. float in normal operation */
> +	clk_sysbypck: clk-sysbypck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <800000000>;
> +		clock-output-names = "sysbypck";
> +	};
> +
> +	/* external reference clock for MC. float in normal operation */
> +	clk_mcbypck: clk-mcbypck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <800000000>;
> +		clock-output-names = "mcbypck";
> +	};
> +
> +	 /* external clock signal rg1refck, supplied by the phy */
> +	clk_rg1refck: clk-rg1refck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_rg1refck";
> +	};
> +
> +	 /* external clock signal rg2refck, supplied by the phy */
> +	clk_rg2refck: clk-rg2refck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_rg2refck";
> +	};
> +
> +	clk_xin: clk-xin {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +		clock-output-names = "clk_xin";
> +	};
> +
> +
> +Example: GMAC controller node that consumes two clocks: a generated clk by the
> +clock controller and a fixed clock from DT (clk_rg1refck).
> +
> +	ethernet0: eth@f0802000 {

ethernet@...

> +		compatible = "snps,dwmac";
> +		reg = <0xf0802000 0x2000>;
> +		interrupts = <0 14 4>;
> +		interrupt-names = "macirq";
> +		clocks	= <&clk_rg1refck>, <&clk NPCM7XX_CLK_AHB>;
> +		clock-names = "stmmaceth", "clk_gmac";
> +	};
> diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> new file mode 100644
> index 000000000000..f21522605b94
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Nuvoton NPCM7xx Clock Generator binding
> + * clock binding number for all clocks supportted by nuvoton,npcm7xx-clk
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_NPCM7XX_H
> +#define __DT_BINDINGS_CLOCK_NPCM7XX_H
> +
> +
> +#define NPCM7XX_CLK_CPU 0
> +#define NPCM7XX_CLK_GFX_PIXEL 1
> +#define NPCM7XX_CLK_MC 2
> +#define NPCM7XX_CLK_ADC 3
> +#define NPCM7XX_CLK_AHB 4
> +#define NPCM7XX_CLK_TIMER 5
> +#define NPCM7XX_CLK_UART 6
> +#define NPCM7XX_CLK_MMC  7
> +#define NPCM7XX_CLK_SPI3 8
> +#define NPCM7XX_CLK_PCI  9
> +#define NPCM7XX_CLK_AXI 10
> +#define NPCM7XX_CLK_APB4 11
> +#define NPCM7XX_CLK_APB3 12
> +#define NPCM7XX_CLK_APB2 13
> +#define NPCM7XX_CLK_APB1 14
> +#define NPCM7XX_CLK_APB5 15
> +#define NPCM7XX_CLK_CLKOUT 16
> +#define NPCM7XX_CLK_GFX  17
> +#define NPCM7XX_CLK_SU   18
> +#define NPCM7XX_CLK_SU48 19
> +#define NPCM7XX_CLK_SDHC 20
> +#define NPCM7XX_CLK_SPI0 21
> +#define NPCM7XX_CLK_SPIX 22
> +
> +#define NPCM7XX_CLK_REFCLK 23
> +#define NPCM7XX_CLK_SYSBYPCK 24
> +#define NPCM7XX_CLK_MCBYPCK 25
> +
> +#define NPCM7XX_NUM_CLOCKS	 (NPCM7XX_CLK_MCBYPCK+1)
> +
> +#endif
> -- 
> 2.14.1
> 
