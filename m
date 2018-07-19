Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WLpM26rMzDq6t
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 14:37:15 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6J4ar23020458;
 Wed, 18 Jul 2018 23:36:54 -0500
Message-ID: <4650dbde15d552e7d9f7635745808797a47a3cbb.camel@kernel.crashing.org>
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, ryan_chen@aspeedtech.com,
 mine260309@gmail.com
Date: Thu, 19 Jul 2018 14:36:53 +1000
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2018 04:37:15 -0000

On Tue, 2018-07-17 at 15:26 +0800, Ryan Chen wrote:
> This series implements Aspeed SDIO driver. In Aspeed SDIO controller
> with two slots and have a global register for interrupt status and other
> general information.
> 
> v2 
> Change irqchip driver(irq-aspeed-sdhci-ic.c) to aspeed sdhci core driver
> aspeed-sdhci-core.c

Thanks, that's much better I think.

Cheers,
Ben.

> 
> v0
> For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci
> each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).
> 
> Another is sdhci-of-aspeed.c for specific function call.
> 
> 
> Ryan Chen
> 
> 
> Ryan Chen (7):
>   clk: Aspeed: Modify clk-aspeed.c driver probe sequence
>   clk: Aspeed: Add sdhci reset and clock
>   mmc: Aspeed: Add Aspeed sdhci core driver
>   mmc: Aspeed: Add driver for Aspeed sdhci
>   dts: Aspeed: Add devicetree for Aspeed sdhci
>   Documentation: mmc: add aspeed sdhci binding document
>   configs: Aspeed: enable mmc host in defconfig
> 
>  .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  54 +++++++
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
>  arch/arm/configs/aspeed_g5_defconfig               |   6 +
>  drivers/clk/clk-aspeed.c                           |  51 +++---
>  drivers/irqchip/Makefile                           |   2 +-
>  drivers/mmc/host/Kconfig                           |  12 ++
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/aspeed-sdhci-core.c               | 147 +++++++++++++++++
>  drivers/mmc/host/sdhci-of-aspeed.c                 | 178 +++++++++++++++++++++
>  include/dt-bindings/clock/aspeed-clock.h           |   2 +-
>  include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
>  13 files changed, 553 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
>  create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
>  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
> 
