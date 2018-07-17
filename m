Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hcyd38vI"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41V8sl6cwtzF3HZ
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 16:06:03 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x5-v6so8507839pgp.7
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OeN3lH4mkg6h8Qxc6dq3xgRH5ESINpSW9FBVjdsLpTs=;
 b=Hcyd38vImBNDWPFb8Bo4DExygh7LyL0f95cKQUNI5qLd2ji8vgdJMerMk7IdpgjdpR
 6OCArrXd6Kzja8n80V7M+ojaoCq/2+lR9dgSkPX8+P/nhW5bngu3ClnF4mi0+/XG8xat
 XvfNCsXf+kmEJAcH3TEVueWKexVuKqPtA+RGlHLGKvijMe/d9f4AfrSt3UAHg4bN7rb6
 oARk8YX8riTL3zqJMLEFREzeyzK8WVt252UY7bKQtQfsN7jilVSOgN52kr6LWmDAnQqx
 yfSwWShbVngMV4I8SZPC4ST1ppEu5cn8FGvEqdi3rd5VM18EguRxh1BkoAgfTbiC/Bwo
 1FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OeN3lH4mkg6h8Qxc6dq3xgRH5ESINpSW9FBVjdsLpTs=;
 b=FJJD31TFzF5i0jNDi25Qug4lkJh9MHdfUDcurctHBEHY1ixaew4ssS9usK+vNvNaJ+
 UzhjLCckrnS+7MdEwNOiKkxN334tEWrQZHsvAK/pytzaaKJoqSKDwJLL4fZ8xr/0mdFo
 Gh92YGxl0WMzr/eW843SYo3JdTbuMqB2ml0Hg/lEsoc2ViS/wqIr27aLgbRcf8hpiNo7
 T8SGkUKfVilvOfxO0Qx2hNPnhoYUgDpUZMS8r5lwhee+v25fUifyULdNmaTH1NcqgO7j
 WbDbKw3alLvmh+3eHd/iJadWgvFMRR5BS8Wdi2YBpxXxCmWveV5zLzQJ0IZfXf3/xPcW
 8XzA==
X-Gm-Message-State: AOUpUlGJgILpCzPVLhZubsQoYc5rTENS2CQ3oPuEa28uAwsoB9tcezqv
 zJFuguSwNhQo0uAoi+TD0sE=
X-Google-Smtp-Source: AAOMgpdAAMQV1JJ8rfIEY5YY63doWpSCgn48NMKqZUNjs/S5imO36Etlw3bLHo/LiOatIu2JNt9ryg==
X-Received: by 2002:a63:ac57:: with SMTP id z23-v6mr282129pgn.74.1531807560538; 
 Mon, 16 Jul 2018 23:06:00 -0700 (PDT)
Received: from ryan-ubuntu (211-20-114-70.HINET-IP.hinet.net. [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id
 n86-v6sm303876pfj.68.2018.07.16.23.05.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Jul 2018 23:05:59 -0700 (PDT)
Date: Tue, 17 Jul 2018 14:04:11 +0800
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Subject: Re: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
Message-ID: <20180717060411.GA10750@ryan-ubuntu>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
 <84064771141b017e5fe3cafef8dc8307f5d97eba.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84064771141b017e5fe3cafef8dc8307f5d97eba.camel@kernel.crashing.org>
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
X-List-Received-Date: Tue, 17 Jul 2018 06:06:05 -0000

On Wed, Jul 11, 2018 at 03:47:56PM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2018-07-11 at 13:17 +0800, Ryan Chen wrote:
> > In Aspeed's SoC, all IP clk gating and pll parameter is in scu
> > controller, before IP driver probe, scu driver need prepare for it.
> > So buildin_platform_driver to core_initcall.
> > 
> > Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> > ---
> >  drivers/clk/clk-aspeed.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> > index 8796b8a..9e55743 100644
> > --- a/drivers/clk/clk-aspeed.c
> > +++ b/drivers/clk/clk-aspeed.c
> > @@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver = {
> >  		.suppress_bind_attrs = true,
> >  	},
> >  };
> > -builtin_platform_driver(aspeed_clk_driver);
> > +
> > +static int __init aspeed_clk_init(void)
> > +{
> > +	return platform_driver_register(&aspeed_clk_driver);
> > +}
> > +core_initcall(aspeed_clk_init);
> >  
> >  static void __init aspeed_ast2400_cc(struct regmap *map)
> >  {
> 
> It's generally considered dangerous to register drivers at core
> initcall time.

Understand. 

But if interrupt controller have clk gating. 
the scu driver should be eraly than irq chip driver probe. 
Is this point is reasonable? 

> 
> Any reason we don't use the generic clock driver registration mechanism
> that runs at of_clk_init() time ?

I will use "if (gate->reset_idx == aspeed_resets[ASPEED_RESET_SDHCI])", 
is it suitable ?  


Ryan Chen

> 
> Cheers,
> Ben.
> 
