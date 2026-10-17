Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8749606A319
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2026 23:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RSdbYHd8
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j7sX34hdqz2ynZ;
	Tue, 20 Oct 2026 10:41:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792248845;
	cv=none; b=dyEur1rn8BkhCoLTet0/QFRSfziT+qNlJ3Qoa1gjpGufS2Hae/kTfyEORGdzjBUt126Phv5ag/qwQ1WUUK9Lk8LvSjxUE2SjWT/XvNTbX1MqqGA0iNMd20hjfmzd1WPJ4AJtbHCrt0tKR0Rh5/wPee3zjrSQhy1sqVDFQskoV/MStSYW3XzQokPqqxysTHfwHJx6QJal9+/KfwIXe4oV5xipfj2xGrdzbvRuu6fnyOVDif19SZ934DfNKUKnoJkbeZvkq6zIDf9R2/v0i6uP+osmSvpJQF2UkUDSCjRz3qbsXX7VWS9jEKHTTLVjebbCIHSZPWhIpv/EepiJaXDnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792248845; c=relaxed/relaxed;
	bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bX1Mlh/NGv7Slp6PcdR3tvYUjAuI3mZT/OKRXEYvwiQdJ7TT56LMx72oIDhhKT436DIPryO6/r9G9m4FyzCxyF1AuA7Bs/cg5lsctbn0W/SDq1pJwqyNxwnaGJ5FJushak6quKnEKpYsAHGguHTEAqb2aEnWrG2LFi5mLtt+c//ymhfCPEGlC2s4fEOTSsCyClzWyIBFco3facTOE6AccdUrfRlnqfVKBMuV1lEDtuht4pCrIjWPJZVTJJtUMYfg/yJTRGHCN3Y32zUa6xvMHqdovJjduXWSjq9JPHq5+N/7yp923yIlNh9M7/pHtfBbqgMlh+AY6lDbRlvRFiTxWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RSdbYHd8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RSdbYHd8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j6Pvs2JMfz2xlk
	for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2026 01:53:58 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so1198805e9.0
        for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248835; x=1792853635; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=;
        b=RSdbYHd8PGrr8wSrR9faLjmDZ3KwtXRiwdUeQhERH2fVFlKmVUl8pKBDV/EywW5zYo
         G6TPPBklDW2VSkfJmLSDPJGZe+yiu5LeQElo8DNFMEP7HbJCoB1h6P3c06kSSPbjF7RO
         a3eLOjG0L6OJO0BG8XAAbDPkPYTXdDpOm5oQxuqrLhTGsBx4LN/v5vum5RHA+XRqo3wa
         LF4tgWq8pUB9W/IKioQDLlyKwD1AH1xi144qXfyEKB0MMXZUxG7fOJLAtYiMifCh8cj1
         87hhL40K5jziuAS3OiWfjWqUN6cVF+9l8riCPIAzsB55rotVRkpeS+KrpRdDB792FR+Y
         l0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248835; x=1792853635;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=;
        b=vfR3E8w9thDnVUnl/bhVtP4je/cO2JHK95+Gt7VQ9d1a7CUURBX7mpt0e7zJa5WXtT
         TyCxW5NqBAve5FIdjtFVm9+4VASnhI6JsB46r65lN1aV5/R3o822uvv4cjB5LdsKFPEI
         8am91YQ3jx67/yQGlwlXM9NPtfjYIMFZykWlD56xdlQZB7Cm/IkrCVvHdDyU1/z1yoWZ
         csmHuwfbCyxVxIjyelShjqNuIToughnvt025KyYVvSA2czfWsnT2d2mWiJJOr70OkyrX
         R8tPsEVyXiOY4D2tJRFR6zgre33p6xPIy4fMseA5xYdJLvnm+q0u1YB5Z+u2Anv2wPzz
         rIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+NkIwHEoAe20BxZ0b6B7QYjPYgdZYqSa6z51U56pk8Y3NEZ6AAjCOUy12aYiNYjGGj3M/HaGF@lists.ozlabs.org
X-Gm-Message-State: AFq9FYIunyj1mOeIi8SVaSaU7XHxxR/oYvNU2lvrif6TQHC54ljIh3lg
	S4wvxuR0m50BAh2/9Syy545k/73JLoZEmuxCGRzBu3F+UWt7sU0xrTJaBRjBPfSpbfo=
X-Gm-Gg: AYBFou0wCiSF68NU+sXhy0k/J2rFdtA5Z8tkeumfDGaRGEilLonvn7mKBUuTWbwJKds
	FIO8kKe8JAiHtHWjq75eFm2156aNsVf3aptndEypw4WI3iY89d1laotnny0UdqXjc6HyTMFBYru
	WF75jiyw9ykv0cUjp9tm+Zj0IFFG+aujWp7EU3jnZvYJszqUREMpaNdMCGG6ArcJjJNElQYDuda
	X4d6ZSNDoDkB1T9OSYeuwTimjWKhYC0WjiD88zPja4QyIDUaNFgMcThaErMBPqfUx/qTMbjY/HZ
	9HsGsWSML2MJ41bXFSkUFz5Hw88u4r34v+Up6r0TIncnwL4e+iI72O3VbCgYRVA+9GW1Kkqtoub
	BeGPs572aTMBDSTqv8dF979ZlPdlO5zQQWRQ0SEFMlZ6v/J2508ZziJMQBfT5jltQk/odBa9F3N
	as8TP9KAx5rZaNFDx/d5KKBhbhlmjNvzILV6rRPLhpL16us5ERalH3ReysM4Jvm57iJ76TtxVVA
	Zj+XeVNuoBM32+JZA==
X-Received: by 2002:a05:600c:19ca:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1d75fce82mr60259805e9.15.1792248835113;
        Sat, 17 Oct 2026 07:53:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm11663833f8f.46.2026.10.17.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:53 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 03/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from
 DT when possible
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:42 +0200
Message-Id: <179224882241.859276.15035084302735586039.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4123; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=14/hMLHV/tYtznG0hyhpzTapCNH3vt/FqyYM36Xqhsw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXexhiw+4KLE5n8ZwffqTXfGbaLNNtyasLfJ8e/iCm3
 CLy7tCfjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzErpWR4Sdf0fTfq1xm7zgu
 fv93xOVbXPPn+r/I3S6oeFzkuOUXhThGhgMHEnaejKt438ISlZTPdOvAkmXKVzS2fls294zl9io
 tcx4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> HXT and LXT are crystal oscillator inputs of the clock controller. As
> such, they are external clock sources which should not be registered by
> this driver.
> 
> HXT is already described in the DT, but is not named. In order to point
> to this parent from its direct child which is HXT_GATE, we must provide
> a fw_name (when it is named, new DTs) and a .name (for when it's not
> named, but the fixed clock node name is used).
> 
> LXT is missing in old DTs, so we must create that clock and register it
> for backward compatibility reasons. It should however be described and
> pointed at in updated DTs.
> 
> Both HXT and LXT are exposed by this driver only in the backward
> compatibility case. Otherwise, both clocks are expected to be retrieved
> from the DT.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 44 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index 00d635cdb604..33b397d7b7c5 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -65,6 +65,14 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>  
>  #define MA35D1_MUX_MAX_PARENTS	10
>  
> +static const struct clk_parent_data hxtg_parent_data[] = {
> +	{ .fw_name = "hxt", .name = "clk_hxt" },
> +};
> +
> +static const struct clk_parent_data lxtg_parent_data[] = {
> +	{ .fw_name = "lxt", .name = "lxt" },
> +};
> +
>  /* Mux parent selection, by index into the controller's clock table */
>  static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
>  static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
> @@ -191,6 +199,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
>  				    reg, shift, 0, &ma35d1_lock);
>  }
>  
> +static struct clk_hw *ma35d1_clk_gate_parent_data(struct device *dev, const char *name,
> +						  const struct clk_parent_data *parent_data,
> +						  void __iomem *reg, u8 shift)
> +{
> +	return devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
> +						     CLK_SET_RATE_PARENT,
> +						     reg, shift, 0, &ma35d1_lock);
> +}
> +
>  static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
>  {
>  	const char *of_str;
> @@ -219,7 +236,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	static struct clk_hw **hws;
>  	static struct clk_hw_onecell_data *ma35d1_hw_data;
>  	u32 pllmode[PLL_MAX_NUM];
> -	int ret;
> +	int ret, num_clks;
>  
>  	ma35d1_hw_data = devm_kzalloc(dev,
>  				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
> @@ -240,12 +257,25 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> -	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks = of_clk_get_parent_count(clk_node);
> +	if (num_clks < 1 || num_clks > 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * Old DTs do not describe the low-speed crystal. They may also expect
> +	 * an HXT output from this driver. In practice, nobody should use these
> +	 * clocks directly, but they must be kept for backward compatility
> +	 * purposes.
> +	 */
> +	if (num_clks == 1) {
> +		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> +		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> +	}

The above is fine but the problem is those IDs still exist and something like
<&clk HXT> is still valid in DT but now does not provide a clock anymore.

This is why I asked if you about removing the ID. At the very least a comment is
needed next to the IDs saying those are obsolete and should not be used.

-- 
Jerome


