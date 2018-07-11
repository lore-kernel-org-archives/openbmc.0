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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSnk4R8pzF37B
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:49:46 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6B5nOu1030907;
 Wed, 11 Jul 2018 00:49:31 -0500
Message-ID: <fe96007894fc49711dd63cec665e947200abbaae.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 2/7] clk: Aspeed: Add sdhci reset and clock
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, ryan_chen@aspeedtech.com,
 mine260309@gmail.com
Date: Wed, 11 Jul 2018 15:49:24 +1000
In-Reply-To: <1531286230-28453-3-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-3-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:49:47 -0000

On Wed, 2018-07-11 at 13:17 +0800, Ryan Chen wrote:
> 1.Add Aspeed sdhci reset for SCU04 bit 16
> 2.Aspeed sdhci have two clock one is for controller clock,
> another is for SD card clock. so when enable sdhci need enable
> both.

You should expose this as two different clocks instead of
putting a hack inside aspeed_clk_enable().

> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 8 +++++++-
>  include/dt-bindings/clock/aspeed-clock.h | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 9e55743..cd1f3b2 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -20,6 +20,7 @@
>  
>  #define ASPEED_RESET_CTRL	0x04
>  #define ASPEED_CLK_SELECTION	0x08
> +#define  ASPEED_SDIO_CLK_EN BIT(15)
>  #define ASPEED_CLK_STOP_CTRL	0x0c
>  #define ASPEED_MPLL_PARAM	0x20
>  #define ASPEED_HPLL_PARAM	0x24
> @@ -260,6 +261,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>  	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>  	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>  
> +	/* sd ext clk */
> +	if (gate->reset_idx == 16) {
> +		regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, ASPEED_SDIO_CLK_EN, ASPEED_SDIO_CLK_EN);
> +	}
> +
>  	if (gate->reset_idx >= 0) {
>  		/* A delay of 10ms is specified by the ASPEED docs */
>  		mdelay(10);
> @@ -317,7 +323,7 @@ static const u8 aspeed_resets[] = {
>  	[ASPEED_RESET_PECI]	= 10,
>  	[ASPEED_RESET_I2C]	=  2,
>  	[ASPEED_RESET_AHB]	=  1,
> -
> +	[ASPEED_RESET_SDHCI]	= 16,
>  	/*
>  	 * SCUD4 resets start at an offset to separate them from
>  	 * the SCU04 resets.
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index 4476184..088553f 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -50,5 +50,5 @@
>  #define ASPEED_RESET_I2C		7
>  #define ASPEED_RESET_AHB		8
>  #define ASPEED_RESET_CRT1		9
> -
> +#define ASPEED_RESET_SDHCI		10
>  #endif
