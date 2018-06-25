Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Wx0mghVU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZzbZGJYa"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DWn40QpJzF15L
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 11:29:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AA7721B6D;
 Sun, 24 Jun 2018 21:29:41 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 24 Jun 2018 21:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=lIYDxK1m3H0FHddRgMgqMnOy0ZY4/
 U15ScbEWUtPmtM=; b=Wx0mghVUtsEZ+dgtUlKeI7ZOHpEOBA+KdYHT8OIRCtbG5
 8dXgKhsqSRQJttDJ9ZW19K6dlWERMyNga/R5eT4WTHYG9y5P+zUixeCm0NJuKuOc
 eCj3OXop7Q8YOCc1vNhxfcXuoqI+lODtgKwmIa+U5PI6OWSkyUjTFUqulluOH65r
 UnqwJHUFndlYJehLK2i34PImkrnDru2yH30Yjd1TiDZHtl4cMFGnxKXwu+AakD/F
 t2VT1WYlxrrRS7zg9YXtu+UrH4OthZk0AfrJPsXPm2oEwXtdXA5CQOGIcpcNDs7b
 P0IrHXiVA4OkjArI0CMwSKm7GWNBx4SO9kP75Mf0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lIYDxK
 1m3H0FHddRgMgqMnOy0ZY4/U15ScbEWUtPmtM=; b=ZzbZGJYajG+0z+EjO4J+yH
 yrocFIxlAl4TOzToJxXP0FaUuNTUySmVQksmi57OBQ/AGGLjWd+Uu7AFD1N/ILER
 a8wGzDaSqhvXYV9IlhHXEbh7Do7itFdZzRjjiSw/43dKQBsRRycbSu/XxQX7MqXB
 j3S3cokSRtRwWa58TggMrapmOAW4c8LpDD+QsGiCUidGNAt8w9ge4GsHn5sY7BvT
 uTAFZGedHwzdaaQ89kwxNfeXmU0ti6stkYsOjtKPJ8XtCBPRLhC2R9WVZGR4mjCk
 ghJ6qBKmgMtbAuUZ7ytSFYn3QdAoqCOu69mi0ffZNj6tOzQH/swyStGP/9CF+XZg
 ==
X-ME-Proxy: <xmx:hUUwW1RH3BvLuoraHgK8ioVjsLd9QOmfYZEW8P952qgvhp3gh8OiKA>
 <xmx:hUUwW1s0M3M6e6aOizhsfn2BNtthe5pw7_SKvl_HAYoPH2aqs1fHbA>
 <xmx:hUUwW_5equ1U5aZrvsGkf6MsaF-d479NQtSva26DzC3Ft5FWI5z1Yg>
 <xmx:hUUwW0LewD2_Tb8UehHq0Gmtn2qMB6AiSrGomztjWWoHBj4weW_AXA>
 <xmx:hUUwW5TiBM4cymXhvMc0w3vpJLmShDcHMnfLOhlCeK618JNcESxAAA>
 <xmx:hUUwWyRFxjt2VxNyML6mvQHPVoMNVyMAaEKJdacR0k-sRMRbxsoTlQ>
X-ME-Sender: <xms:hUUwW2Pt_kJjJaY75CMqdjGk81oXvzG81_yJ-wKW8dj8zJwRSIGt9w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6EDAEBA43D; Sun, 24 Jun 2018 21:29:41 -0400 (EDT)
Message-Id: <1529890181.2203912.1418959776.6CB889DC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Date: Mon, 25 Jun 2018 10:59:41 +0930
Subject: Re: [PATCH linux dev-4.17 v2] clk: aspeed: Support HPLL strapping on
 ast2400
In-Reply-To: <CACPK8XfCR7UQjp4-OsBwgitc0seCC2C1grZDJOH3tc8uXCdsNg@mail.gmail.com>
References: <20180621072525.23832-1-joel@jms.id.au>
 <1529889079.2198985.1418947520.361B7CD6@webmail.messagingengine.com>
 <CACPK8XfCR7UQjp4-OsBwgitc0seCC2C1grZDJOH3tc8uXCdsNg@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Jun 2018 01:29:44 -0000

On Mon, 25 Jun 2018, at 10:43, Joel Stanley wrote:
> On 25 June 2018 at 10:41, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 21 Jun 2018, at 16:55, Joel Stanley wrote:
> >> The HPLL can be configured through a register (SCU24), however some
> >> platforms chose to configure it through the strapping settings and do
> >> not use the register. This was not noticed as the logic for bit 18 in
> >> SCU24 was confused: set means programmed, but the driver read it as set
> >> means strapped.
> >>
> >> This gives us the correct HPLL value on Palmetto systems, from which
> >> most of the peripheral clocks are generated.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> ---
> >> v2: Fix comment and commit message
> >> ---
> >>  drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
> >>  1 file changed, 19 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> >> index c17032bc853a..7d8cc412959d 100644
> >> --- a/drivers/clk/clk-aspeed.c
> >> +++ b/drivers/clk/clk-aspeed.c
> >> @@ -24,7 +24,7 @@
> >>  #define ASPEED_MPLL_PARAM    0x20
> >>  #define ASPEED_HPLL_PARAM    0x24
> >>  #define  AST2500_HPLL_BYPASS_EN      BIT(20)
> >> -#define  AST2400_HPLL_STRAPPED       BIT(18)
> >> +#define  AST2400_HPLL_PROGRAMMED BIT(18)
> >>  #define  AST2400_HPLL_BYPASS_EN      BIT(17)
> >>  #define ASPEED_MISC_CTRL     0x2c
> >>  #define  UART_DIV13_EN               BIT(12)
> >> @@ -586,8 +586,24 @@ static void __init aspeed_ast2400_cc(struct regmap *map)
> >>        * and we assume that it is enabled
> >>        */
> >>       regmap_read(map, ASPEED_HPLL_PARAM, &val);
> >> -     WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
> >> -     aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
> >> +     if (val & AST2400_HPLL_PROGRAMMED) {
> >> +             aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
> >> +                     aspeed_ast2400_calc_pll("hpll", val);
> >> +     } else {
> >> +             /* hpll is configured by the strap register */
> >> +             regmap_read(map, ASPEED_STRAP, &val);
> >> +             val = (val >> 8) & 0x3;
> >> +             if (val == 0x00)
> >> +                     freq = 384000000;
> >> +             else if (val == 0x01)
> >> +                     freq = 360000000;
> >> +             else if (val == 0x02)
> >> +                     freq = 336000000;
> >> +             else if (val == 0x03)
> >> +                     freq = 408000000;
> >> +             aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
> >> +                     clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
> >> +     }
> >
> > Logic looks fine, but I feel this might be better as a lookup table. Bikeshed will be hot pink.
> 
> I anticipated your review, and sent v3 last week with a lookup table.
> I also merged it into the openbmc tree :)

Hah, right after I sent it I saw there was v3 and :facepalm:ed. I've got to get more responsive with mail :/
