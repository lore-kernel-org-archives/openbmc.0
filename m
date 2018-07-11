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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSm21GlNzF37Y
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:48:17 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6B5lvNj030802;
 Wed, 11 Jul 2018 00:47:58 -0500
Message-ID: <84064771141b017e5fe3cafef8dc8307f5d97eba.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, ryan_chen@aspeedtech.com,
 mine260309@gmail.com
Date: Wed, 11 Jul 2018 15:47:56 +1000
In-Reply-To: <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:48:18 -0000

On Wed, 2018-07-11 at 13:17 +0800, Ryan Chen wrote:
> In Aspeed's SoC, all IP clk gating and pll parameter is in scu
> controller, before IP driver probe, scu driver need prepare for it.
> So buildin_platform_driver to core_initcall.
> 
> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 8796b8a..9e55743 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver(aspeed_clk_driver);
> +
> +static int __init aspeed_clk_init(void)
> +{
> +	return platform_driver_register(&aspeed_clk_driver);
> +}
> +core_initcall(aspeed_clk_init);
>  
>  static void __init aspeed_ast2400_cc(struct regmap *map)
>  {

It's generally considered dangerous to register drivers at core
initcall time.

Any reason we don't use the generic clock driver registration mechanism
that runs at of_clk_init() time ?

Cheers,
Ben.
