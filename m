Return-Path: <openbmc+bounces-2484-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACEBC5DF94
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 04:16:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hSyJd42BRz2y2g;
	Mon, 24 Aug 2026 14:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787544387;
	cv=none; b=duqdzBsH9/JrWIwTV0MInDT+WklL6hANfxpYOHOxOHFJIKNM7eT/0+CEAlvj7MWrRLUY21QLQwYjsYDRZM+PJpFszM9dhr7k0bkFY/3UBIKnLZK5sTid39zr18PGNyY1y0IgUgwfJLwkmWhfwTb7+bBjxdY/Y5NX1tkS/mgttgLpk1yxlHUPUd17HlBD/auoLjqXQR40rPVwMQCxN+PPob0cDUynIbUEfCwPWYENJpb48EwpAsyvxKzLr1r5Ohl7/XMRoTb+GhyKxEts3g61iqj06W7f3qoILdOuHBGe4ojnDceaC0tH8WmA8/DIZgzf1q3IZhmaqkQ/7SID4n2fiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787544387; c=relaxed/relaxed;
	bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg7Nna1WMPEvazrT79Vb29Oc7YgWGFr1NpxyiwMN6xhyF9Gjzu+J5DPHgP0AwY2p8noUIOKPJCY7oM/sIxdxmp3GJSVzUS/ceNW+2892pNPmbAK6WSXQWQzcTjallTItqkz+K9odKDD8qFnuwXrSffyDsrvndGAaiRAP+/Gdi4CQPeDYrpxwAh6QHE9jNT372zs28nL3QYve5x6izo19J4LilKfntfPUX/tTOaNpsfZo0pDuK4kEeSfeGDE2ok7kZAT34yjklt91do5ESJ2+kQrkSLU4qM0R2VCWux8R6EuNwrCi+VZmn4DPXGMc/0B2hU+VRRKgyLJdPRPbPDB2gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ImPCb+sS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ImPCb+sS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hSy5Z1Bj2z2xGt
	for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 14:06:24 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so2452701b3a.2
        for <openbmc@lists.ozlabs.org>; Sun, 23 Aug 2026 21:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544381; x=1788149181; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=ImPCb+sSkJfJ0LFBxVX3sY5so5B6YaFkRGgzJ5mWiIGTuv0HMEzKUwBeh3x6HkqD0c
         4IlA8RYunwZglWKo7+N0d65XGqOY+ezVcp0zDQx52myGozarpb+u0dZkRfQ8AT50afpn
         29C4/Gt/jEEUFeRwgle/MavDW/N/AME/hWWNn3Hu1rXmewZ3Q1jE4UUiFRb9LXbNC19O
         2UE18c7SVMNSZiK/rjg23Os/Ip0RWyVDQrx7R5yQHJti8s6zSxQWh40d2sDBDCJ1uVoy
         qayyASuCBflHylXlRzlW0GaE+wIWlpSbt1TCtYL+Oc+E25jxPO9suneszdQ8zX6dDfep
         WYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544381; x=1788149181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=nyNAgDLNBIchug4a838a3SqI/mZqbv76Ezl//kvSgKgqu6lF1uH9fT4IqIoU/Kb9PO
         GqMa2UnkwHV/WDw5rcKKLKZzdLsBX2ZJ6CrzTYjoPI0WdTQYpuoAKv3OtKIjCouCb1ik
         MO69F89Lkx5R9hRWYf5opPGkTH7AlEiyAjqfBFMY41jaEmnPtgHYsiPCXYWgxYVn6Gfr
         xz4rAqS1efbhjp5EHTKXQekG45sbi6aUbXtHavOL8IzolHtVAX46WhBo4ZUwwfe9Dpt3
         IUHS/1VzSr0UC9mr8w4l7YtbLAm45tqAflWxc0Ujj7QD1vCeLrLxN65MHPb90SAf1mXk
         X2mw==
X-Forwarded-Encrypted: i=1; AHgh+RoO3JDVBAXh2KiwuyjtWpzW2PP4nGO3y38zj/N5nzp2leqfqaswovFOrA+QxpI7Egc15R1w09e4@lists.ozlabs.org
X-Gm-Message-State: AFuF++mEV+bhrAVqg0Tnav7W0fsiTu5L8GUBy045IjIpQwPyQToniwNJ
	yijx9pDCb6WpIKGqt+HbBYhBzt5koiGLhcnCYM0y9etugRrEXd+FHSSNz8eTcBDodvE=
X-Gm-Gg: AR+sD12r2+25z/HR8Gh7ejwSB7v5CBGkIVvyEi4u7EuBU0HDVLygkK/LVTm6LPE7Ye9
	vBdEY+MXO2piXZMn5Mqe4iLJt0+sMg20OjAPRu9tomDFp3hjnRal6nEEkJWhW7Da3vMNnlr4Ud7
	3cE4jYLTRTb0VSyi/aoz3ew/BMyo5RdU8uYyzsylw5w4wgUjOSJkjnV1w6ID8qDgufGmVJ5l17C
	1RPwidPGnfsuWwLbpz1U9dIkRIS2AHJxNSZ6Q2qTBKqYVhgW9zNSHXuMeRf4fzx9jhn8R5/i7rP
	naFo2conkcJ/MvgK1JW5FzJ0qVMs5qEVfzLwXdAr/QG0YGLjs20xVvSGGww35MGz2NOiV7fUo5Q
	85cEKb3bnuAPEihw8e7aG1cv1c2MSgFNlqMagqqu+vnq91AKzuodnGRqF9YhlWrXS0MsEllhDsH
	Z66Szr37q5xS0CqMhqDzK6vXpCAmL48Y285toX3QaXO5TMBs1PeEM6hKoCBC5FLGw=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

