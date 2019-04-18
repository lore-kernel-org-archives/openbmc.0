Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dtOEtzun"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Monpq502"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l8D31DvYzDqB5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:22:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 186DA2210C;
 Thu, 18 Apr 2019 02:22:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=hFHXpogrJbIyP4CWKU1LOsbQsYim9EM
 R/SalW2Xgum4=; b=dtOEtzun2PxKIRT152V8j1Eig7KE9U2P0Du+gGoL2BYXkwi
 KCAODZ0fmLk6BQlmzM+zPLbuyMDuU6GbsN7TMv/iQ29/zkrC5hsvQEcfTdu6HgAx
 OYpGKNZ8yW+vv1pERTck8WaDz7MyupHSYxTvfYtiNW2nK0V/7wFTzdM9/Jq6JoWE
 Bqj+E2vwWPss0leiXWXJFCgwIo6WBi3EKfa5gxurLZfrryz/vU+1yN4p0v8JQbrs
 yi18+2Eq/tNJDuSCHHM3VIU/YJc6pc9yup1PNYWjQDzBQKkSgfpFPtQ9wCY/Gpj9
 /VlKXVLd/8i94Rx5Zl3svhG/FT4AEfjs3jM6/XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hFHXpo
 grJbIyP4CWKU1LOsbQsYim9EMR/SalW2Xgum4=; b=Monpq502boN72uN2jEI6v/
 ZiG9iDZoXeRrsUERIWS4XPGTXbI0g6BRAJ8SdaWGdegUJ165cfbt9IyPUtTj1Cpk
 qEP31Q7xmxO03FsM2zLnFX9W0CCwVKpp4+lEB+hBqdu/aWijC+ybPiv3EoeAEPgc
 sRLJf9a7snKJCBQCsLId7LLCDFtAsOKR4b1NG11kXEmY6XkHHzbtw395Bh3HDauf
 hRzcdsCU56HOgTFZGGNRcanuAOT5YDK5B5swvhD8caSb2/+13AZwtQKhGJwAh0Ds
 0eV8JoBOFsJglKqs2uJghwcLi3EXNbijL9+LvF+fiPSft5fPZYgdVxuc+l/KSxLg
 ==
X-ME-Sender: <xms:rhe4XNz1DHb4DU4n8CNAb7OaSoLPb9FE5cwrXAwIMCESf5RfEAxLqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpeihrggurhhordgtohhmpdhoiihlrggsshdrohhrghenucfrrghrrghmpehmrghi
 lhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpe
 dt
X-ME-Proxy: <xmx:rhe4XFESiXUMht2d9YJNaJhsjk4Hmav8O0h8eOA5ATllSs2LUDkpuA>
 <xmx:rhe4XCsrwrxGnc9naGkAhmEeZ-lp8maKa_A8TCcbvnx53SZHP5KLkg>
 <xmx:rhe4XJVb3RGyLM6OKRjG7fsqKwuXoHj_FltgEslY4SPAmNIdgn3lIA>
 <xmx:sBe4XL_78mtana6GbWB00g1sHczV0BCUh0rotiyQXDaKJKY_vKjhWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 946A37C199; Thu, 18 Apr 2019 02:22:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <3b0bbf7d-b5c4-440f-80e6-ad1b1df4388b@www.fastmail.com>
In-Reply-To: <13436c7f-ced3-2bcb-b368-cc75accf2040@yadro.com>
References: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>
 <13436c7f-ced3-2bcb-b368-cc75accf2040@yadro.com>
Date: Thu, 18 Apr 2019 02:22:38 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Amelkin" <a.amelkin@yadro.com>, "Joel Stanley" <joel@jms.id.au>
Cc: "OpenBMC Mailing List" <openbmc@lists.ozlabs.org>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCHv2-modified_dev-4.19_0/7]_Add_support_for_ASPEED_SDH?=
 =?UTF-8?Q?CI_controller?=
Content-Type: text/plain
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
X-List-Received-Date: Thu, 18 Apr 2019 06:22:44 -0000



On Tue, 16 Apr 2019, at 20:34, Alexander Amelkin wrote:
> 11.04.2019 15:33, Joel Stanley wrote:
> > Alexander, if you want to post the version that you tested to the
> > openbmc list I can apply that.
> 
> Sure, Joel, that would be great!
> 
> This series of patches is based on the original patchwork submitted
> by Ryan Chen here: https://patchwork.ozlabs.org/cover/942313/
> 
> The patch set has been updated by YADRO to cleanly apply and build
> for dev-4.19 branch of OpenBMC linux kernel.
> 
> This patch works fine for us with our AST2400 BMC on VESNIN.

Thanks for posting the tested series.

Any chance you can rebase on dev-5.0?

Andrew

> 
> With best regards,
> Alexander Amelkin,
> Leading BMC Software Engineer,
> YADRO, https://yadro.com
> 
> Original cover letter:
> ----------------------------
> This series implements Aspeed SDIO driver. In Aspeed SDIO controller
> with two slots and have a global register for interrupt status and other
> general information.
> 
> For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci
> each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).
> 
> Another is sdhci-of-aspeed.c for specific function call.
> 
> Ryan Chen
> ----------------------------
> 
> 
> Ryan Chen (7):
>   clk: Aspeed: Modify clk-aspeed.c driver probe sequence
>   clk: Aspeed: Add sdhci reset and clock
>   irqchip: Aspeed: Add Aspeed sdhci irq driver
>   dts: Aspeed: Add Aspeed sdhci dts document
>   mmc: Aspeed: Add driver for Aspeed sdhci
>   dts: Aspeed: Add devicetree for Aspeed sdhci
>   configs: Aspeed: enable mmc host in defconfig
> 
>  .../aspeed,aspeed-sdhci-ic.txt                     |  25 +++
>  .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  42 +++++
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
>  arch/arm/configs/aspeed_g5_defconfig               |   6 +
>  drivers/clk/clk-aspeed.c                           |  15 +-
>  drivers/irqchip/Makefile                           |   2 +-
>  drivers/irqchip/irq-aspeed-sdhci-ic.c              | 147 
> +++++++++++++++++
>  drivers/mmc/host/Kconfig                           |  12 ++
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/sdhci-of-aspeed.c                 | 178 
> +++++++++++++++++++++
>  include/dt-bindings/clock/aspeed-clock.h           |   2 +-
>  include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
>  14 files changed, 548 insertions(+), 4 deletions(-)
>  create mode 100644 
> Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
>  create mode 100644 
> Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
>  create mode 100644 drivers/irqchip/irq-aspeed-sdhci-ic.c
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
>  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
> 
> -- 
> 2.7.4
> 
> 
> 
> Attachments:
> * signature.asc
