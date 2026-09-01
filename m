Return-Path: <openbmc+bounces-2517-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41848C61DD3
	for <openbmc@archiver.kernel.org>; Tue,  1 Sep 2026 07:20:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hYy1H0JT5z2y2h;
	Tue, 01 Sep 2026 17:20:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788247202;
	cv=none; b=jpSXVx6rSJgez658FIeMB/TO2StUZ79SM2FqnWbI/Je/ayOvOsYoF8afjNGs/LEOt08zgy7uYKiqgFogD9eTQtw9RILqz+qVaK2DzBthNeLwTrSdatqh5aasP7RX8Aa0h++jZI7EKUhaFYZflSeUubiOAa2jYk0l/pj74xATnTQmcQlP5+2Y3Dq6HCho9te7E/XLqzoFLVB/p3k5WPTqtoSXJGeVa6VtiMETbUvUNKv8AQ8WVX/Bf1se9zsyVnisnE+CBPp2QL/P3TwKvkINidcF102IfbGmzhaHprraKUcD6umiy7j6ZTl0YkHbbPQ5DWp8LwxWXT1vhLTgRYMyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788247202; c=relaxed/relaxed;
	bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Akc8BzkKA87/+Y7Tieus5ZboRwCZy/a1VP5R9dvEFtSA3AnIzBURIbaeMDO963vBIhviMecqoQcebAUa8PZv5wx9vUpCkbrhxr0I9tfNjLszD73ePA6VQfGtdAgs5YIvZ6oVUDHxZFFuSqPcn+3ELAplLNtx8atzucqCd/r/HGk7haYVQT0VYv06JsWdfW4qNu+aleSs6eMm2LJv0HYC6h84Sw9GHZDgsj10uB0QbtfXOcUT0zv4UesLNygIINT8r8yYaagGtQi8R9JFipiKIAgf3b1x8JCq8Uive4XbYJfTuN1tioQ1j+A7dMqrA+4YBs36AHB0dQH5cqhVBfdivA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.160.180; helo=mail-qt1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.180; helo=mail-qt1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hYy1F147hz2y2P
	for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2026 17:20:00 +1000 (AEST)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53016020b2fso26171781cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2026 00:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247197; x=1788851997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=G5bbRxzrVRptAzCEf7fdPcls84qZSqToHpS8pCxeMycEi+3p7L3Uvx0ZCZ7DkvZ01L
         zBg8TYSbl3ucCU29jYAt+ZXY0u5+P+WASyKQsHq6iEaynX9XDLvgi8KQvaP6EMP42fA9
         bvDhIYfryJH7r5g7ZJS3ORjWM9/oHSE/AyPAapnk3he2qs5yZMbsWg7AgyoXRTjbFjjt
         iJsjjlZn0PTBdpjuZXqSbWlF0KJzmG673ZLEhU16R0jpForc9YgwlNtNWUdbqyfkyYjA
         NrCaCZGAOWja6IqnOrA6tqp6jsnre0HnRKXo14Y4jv+H+WHF6YChHffhVbFIjpOvnJMA
         fLMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk4MffwGvKTcwddazpcc2mLa3gRQ2vrd8v7OhtR+gI78wBVdMSmaU1hOa6AccxKYP7r7kCg8lc@lists.ozlabs.org
X-Gm-Message-State: AFuF++ns0RFTuh4LWIirnXnQC9a1+DCMIw1yEKUdfHOxd4inFlyxXwLa
	NwjMP8IzhvXZNAZNyAXJwL1t6hUDUso/VhnPafXjSkPgcsNM40GEKwlwrHLBPiY8
X-Gm-Gg: AR+sD10hBiF4vIgF+GQkd61tCXZBdOC05Gntr9qr4oHyzGRgMkngjvh0SijdgVHTRkd
	Oe8AAJ30/HOYLrm/Bh09b6Y5R36+0XET1SNUF64scBZQeT40UhrKlFSnskz53QiFimK5HZ/yvvs
	F+G8mwExebCiuiMvfHseCplQX3ezH6OMKRVCRAKMJHfKh7CLknzU/du+lyP87dkyApNZYXqEXdW
	Rp/aSFhaHeJxUPeoS7cAinMdI9fq8Aa/+Q+jINefdlBao289fGZAsowupi5eyMvxALZbOxDe4rX
	9zdY6LA7b5OLWjpIU1nUgPIdrCC3L8GWlYSBpDFaetT9srasvugPPwyq9mf6lLqNZpfVh1iV8Mi
	jwkXpoOgJEZDTgFLtm1X+IMM01b6Zd+m5OiRo5tEmhWOY9jRVYweMMBavTEROHDDf2Ed0Ar8S9P
	gfB+c1DnPl5M9u9bMzSABonhbmScPFVX3Xzxc/DyeKbWeb8i5j470Y02oemGVstHHJAuuIl5wEq
	UwrC1YZnZNpMZACnm995ueWVycZVw==
X-Received: by 2002:ac8:5750:0:b0:52f:9e5c:33ff with SMTP id d75a77b69052e-52fb93edd51mr386828791cf.13.1788247196515;
        Tue, 01 Sep 2026 00:19:56 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ff73ae220sm70950451cf.23.2026.09.01.00.19.56
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:19:56 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-934956bee57so607101285a.2
        for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2026 00:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYTR0x3MhusexvfvbHAl9aQmpr6VN5O/LbONBGj9blS+ydmkdG4CARIMeRz8WEDYGJm927TR9n@lists.ozlabs.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
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
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
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
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

