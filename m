Return-Path: <openbmc+bounces-2485-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF4C5DF94
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 12:49:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hT9jT0vrCz2y71;
	Mon, 24 Aug 2026 22:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787575788;
	cv=none; b=JtpAdnPCSExG7AVizQJdvYJvGvl4jzl+XF6Trh+9OnCeWN9dnCTVfN1j0Dita0KyItdcP/Cr20DMYM/aIJzRS6DMi7nG8HfR0TvPfON1foy+Cd6MrciTpdNRLLjd0diG/hbMDmylnTWaAVLx36Ray7MWIN1f2BnQHsXtZI+joeTNmpd29MZUVhAvwOazF+v1j32wHDee+WclJkVqzZXe5ETkq4FTYUf+6sidYYbmtI0LOAHFdcs4LXCKyi7LeBSBaCCFwG2tFvlnrVG1LtUC0Ztqn6DoBaEYGavJmdYUqqoEn9V/XFios7jRWxSiap75xiBdr2yniv43Bi0zaw9Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787575788; c=relaxed/relaxed;
	bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5zW9TvVzgLQwlKilDom8KAx1CPziq8p/6MonqdNW7DBT4psnygustEj1dCcaN7onbWkGx/+NMlhtHR2aRAjauvj9xvEeRnEv8GMgYbiip5h29Gp05nKcf8Q38SwPH+kJDWQv1te3/fKBcvwrb+Boikm6tVyyhcvm1xOTLYoIYxeOW2sFTwzwc3BPKYOHnjcix+5TAJvyZOOQojOkRvP7AXVuh+ntIsIsOJa21V3IQH2ZackqH0MX+c1MOPjJt56D700wtuxzCMDzodd2oQWlcfQ2ZW8nhKOOn0xPmqrRtdvnlj56guPOXgnAJo/oFpGnGMJOdSxH/VXjiadc94/0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=74.125.224.51; helo=mail-yx1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.224.51; helo=mail-yx1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hT9jS0PSsz2xnW
	for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 22:49:47 +1000 (AEST)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c71239c48so4734587d50.2
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 05:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575785; x=1788180585;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=RIWytfBZhXIjpTSiWwQSyMp3mhB+3QUHVqRICzhw/m5e7SmPGOmX+WRI0FhTL5T+mH
         iUYbyet+ptU1ZK2Tu861hLrMEUgX++iDhvTMpJzn6LtH8PKI5NdG0EX5GAuApqM06mkm
         tZ8PKvV79FxtLnxwe5/5HvpeChXqEdnBzVBfosyks4iTJULtK2qJbS4DEsv/7Vasz7fh
         RRCwm0UAv7v1dqrz6Xs06wFcNtH56+mrVHe8vS9jlzm6lvNk6Ky//03zWzNQSntqn2cc
         AcFDe1NjzY1ZibqeRoD7ynGV9CuqjMcgQkJN3s8TQ7/FPLRe/zuKopKatAP1YKjJI+Mr
         xXrw==
X-Forwarded-Encrypted: i=1; AHgh+RoeVhdOeh2xElM7cMNRUmwQy5rZcdJseVmbWHyWgX7fAu4HWykObwVufEVk9f6XjdbWp2NxG/Vx@lists.ozlabs.org
X-Gm-Message-State: AFuF++n349JMRhAxoP0sZP0mxH+Iy5wXu2iYtchVn5UB0sREXyW4LEG/
	LNfv0cTVYxtq4G0C14SNWzXM5Rq9H7Fay8RESGEK8MA2SmoOnawCiROk51pRX1pN
X-Gm-Gg: AR+sD13U+xJvFS8oVeC01bxLjebBtN5YTVehhKCmWiRysQxt3XyNESVtRi10YB0r5eS
	yMxzfcjAUfD5H03zVDT8h0BvrCqSf7z+44mHfsonJBkEKSt3Ge8jhChZddsnLMALum7F+gsxLgj
	YZLlD3yDrsPer4MEj0GWJwsWRythp1SE9Idg0XNeNySvkdc+wm8p+XQVmwMSORlTtrPRX6Q1qM2
	CufTZ1of6JeyCMBI6K5kD2ZJfkDnTMx9n5bN2RV/p6WPH7PXr5p03UMKQxP2TVMibrmZzsNhaHv
	53Vhc/H72uRSpEu0ra6sB+ZnV4wnCVkolKES/ykwQyr/gnZ3KarAxlDvSPUI//An4L/yLxlje3f
	o8IF8eHBjPIP/Azts1ZO8e6L2Gr64iw65xYqC4kIZKrMn7NFMBNLAXVAEbIAT7vtvgDu0JARhj0
	iZ66spzseEtrfLm+Pz8UODmSQ/a/UdvMkd2xMP3vVUBOsZDhjn1f8bTBJ8KJWYd1ZScPxK3IgEU
	jgKMspeBEy2fpCdM/n3911SqdW+/w==
X-Received: by 2002:a53:c1c7:0:b0:667:dfad:8767 with SMTP id 956f58d0204a3-66ce49e15admr6655566d50.9.1787575785572;
        Mon, 24 Aug 2026 05:49:45 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85425354e5asm169137b3.3.2026.08.24.05.49.45
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:49:45 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80c5cb9a888so36458987b3.3
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 05:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqy9HQ+XjUOgWksl9Vt3j87ZTPMPE6e823EruIlTEbPFlQLcgRaaMDgefsGn3RiosvyQBrqxWRQ@lists.ozlabs.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

