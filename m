Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bzlycE3Y"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VpQP6f7FzF3Hb
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:18:04 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id s17-v6so1641334plp.7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CvCl3QQ2ptti4MMnTdwvnLdoqpNRamIpbw9gl4qLCzk=;
 b=bzlycE3Y++HLrRVKDOD0BOSeLyPEiMxOy+zCQOjiT69jZJtMRLMvWHzrNxS2CiiSWO
 NVRnnlTR52dQCJlZoaDzUYQMZ93T5gcocd4AfdobFhelpsounGqS56OZfGsUN/lP+fDr
 zLAvpbNce7leo6zc+MwOY/4Ttm9bSgkw4Vv+s5a2wBbsGHJR4l7yTSaquLN8CNG/3oOQ
 QwKKfQPBv8yp2gFpE9Tp9oRz3pitPtHitCy/y32dl9/DJBhRGCZbDoHOLgNpp2MZBjHE
 NKLJRp9oYJ3EH5BhUWI6zzAxCorAIizQJEkItKgkSh9y3s/Ttmpdz4zKATI0NInqrt1m
 kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CvCl3QQ2ptti4MMnTdwvnLdoqpNRamIpbw9gl4qLCzk=;
 b=CnVwO1E9pdSkPVtwbLakSU1imze79LIfYYmp3Rwj1VrnJCB2xepWDb5eQrfWcqGdKa
 bZEHPiidXiD5tWStwGHdCkEOwqQH938JBMU3hrBp3ktnEKD4nmd1bUR9XuNSL6Gsgrur
 W6ZlduIW67zN7EsTuZkn0mSCboWBPuGijo6Z+xd0WVhzBYNbBriSUpn4ZsZtAvELkjMK
 lw+zn/yfIKBQbFfX8Tq9c9wU+OLKEK0OORyyx2y2QVoBsjWs/7GHK3zqamSFC28jKGpg
 8h8f5LN6tRephpuodUUi4EEGBkl8NovdBIjmCOD/WUO8ipA2VZjanQ/oXVrPhFglLvjT
 k83w==
X-Gm-Message-State: AOUpUlEaNBGFjF7kUVXriJiuRpxLIo6VgXyj+lT/OEcN0rxZ1nsojDEP
 tpyAuSbqQS78tzH4vLUS51w=
X-Google-Smtp-Source: AAOMgpf0wX08qywnKh9KgC8W3lizxqL7KK6mUZkEIHelTnLmK/ISwitS6SgkS7g07OITU23b2o1HAA==
X-Received: by 2002:a17:902:530a:: with SMTP id
 b10-v6mr4889492pli.316.1531898282814; 
 Wed, 18 Jul 2018 00:18:02 -0700 (PDT)
Received: from ryan-ubuntu (211-20-114-70.HINET-IP.hinet.net. [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id
 u89-v6sm4836320pfg.79.2018.07.18.00.18.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Jul 2018 00:18:01 -0700 (PDT)
Date: Wed, 18 Jul 2018 15:16:14 +0800
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
Subject: Re: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
Message-ID: <20180718071614.GA10740@ryan-ubuntu>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
 <84064771141b017e5fe3cafef8dc8307f5d97eba.camel@kernel.crashing.org>
 <20180717060411.GA10750@ryan-ubuntu>
 <dea1363bae3cfaa7c8244b64bfab7dfddaae8e4a.camel@kernel.crashing.org>
 <CACPK8XfiLvYMxAjEAvCQOiZBjFqVz733NVhpzfFTstFgDrP9zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfiLvYMxAjEAvCQOiZBjFqVz733NVhpzfFTstFgDrP9zg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 18 Jul 2018 07:18:07 -0000

On Wed, Jul 18, 2018 at 04:07:14PM +0930, Joel Stanley wrote:
> On 17 July 2018 at 19:15, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Tue, 2018-07-17 at 14:04 +0800, Ryan Chen wrote:
> >> On Wed, Jul 11, 2018 at 03:47:56PM +1000, Benjamin Herrenschmidt wrote:
> >> > On Wed, 2018-07-11 at 13:17 +0800, Ryan Chen wrote:
> >> > > In Aspeed's SoC, all IP clk gating and pll parameter is in scu
> >> > > controller, before IP driver probe, scu driver need prepare for it.
> >> > > So buildin_platform_driver to core_initcall.
> >> > >
> >> > > Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> >> > > ---
> >> > >  drivers/clk/clk-aspeed.c | 7 ++++++-
> >> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> >> > > index 8796b8a..9e55743 100644
> >> > > --- a/drivers/clk/clk-aspeed.c
> >> > > +++ b/drivers/clk/clk-aspeed.c
> >> > > @@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver = {
> >> > >           .suppress_bind_attrs = true,
> >> > >   },
> >> > >  };
> >> > > -builtin_platform_driver(aspeed_clk_driver);
> >> > > +
> >> > > +static int __init aspeed_clk_init(void)
> >> > > +{
> >> > > + return platform_driver_register(&aspeed_clk_driver);
> >> > > +}
> >> > > +core_initcall(aspeed_clk_init);
> >> > >
> >> > >  static void __init aspeed_ast2400_cc(struct regmap *map)
> >> > >  {
> >> >
> >> > It's generally considered dangerous to register drivers at core
> >> > initcall time.
> >>
> >> Understand.
> >>
> >> But if interrupt controller have clk gating.
> >> the scu driver should be eraly than irq chip driver probe.
> >> Is this point is reasonable?
> >
> > I'm not sure I understand what you are trying to solve other than
> > making sure the clock driver is loaded before everything else. Joel, do
> > we have a way to ensure that ? I noticed all other clock drivers use
> > that macro to be initialized at of_clk_init, any reason we don't ?
> >>
> >> >
> >> > Any reason we don't use the generic clock driver registration mechanism
> >> > that runs at of_clk_init() time ?
> >>
> >> I will use "if (gate->reset_idx == aspeed_resets[ASPEED_RESET_SDHCI])",
> >> is it suitable ?
> >
> > I'm on holiday, I don't have the code at hand to check. Joel ? What do
> > you reckon ?
> 
> We don't need to do this. I mentioned this in my review; we have the
> reset added to the clk driver already. With this, reset can be
> released via the normal reset controller call in the sdhci driver.

In my new patch will use following in aspeed_clk_enable function
.....
	- Put in reset
	- enable sd clk
	/* sd ext clk */
	if (gate->reset_idx == aspeed_resets[ASPEED_RESET_SDHCI]) {
		regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, 
				ASPEED_SDIO_CLK_EN, ASPEED_SDIO_CLK_EN);
	}
	- Out of reset
.....
Do you think is it suitable, Joel? 
