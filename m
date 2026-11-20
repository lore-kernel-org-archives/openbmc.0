Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB2606A320
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ccx2rP8O
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jWLFw51qCz308Q;
	Sat, 21 Nov 2026 03:22:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795191732;
	cv=none; b=PoVvowoaJV9/Ui98bf8eNSE0+mBzJgMduhOaeXsTGTy0HO8znh3nmVKw0nCZY8cHJQW2EsPYdPwgb4eBk8ZWRMPdPyUiovnWaQSLeG0z8RV+ujz/75885LozRzoz0McEdYv13UKuFWZNGce3Jq0/CY6P1zIeyXorn69+aDZRJNvH0L8IR3YJlXyJs/UzJ+XN91SRZU2MikhXvF/FmRIUBDPNq4r1CGnYhnj5UHNpVxemwc60jp3bNp9E1UG3FNiY2tN+S8Fvu0h4t7kZg8avjCDkdpNTJy75rMiyAJBunQoC47sTSnv2aMRLoWzSVch4AGfE26q36eSmBRydSfmEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795191732; c=relaxed/relaxed;
	bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KHrEocz2KAwCu8B5Cu3P/E1Kt0tEE/wYMX6+6GN0tBhHJYYOyjbymyenV6wSFY5g3duzIVQXvgF+hGcVE474FD+zMhqzsHzxSbNoc0xA21KiAfAC9j3SI+dp0FPjgc7hhpzMiI3FcKCHK4/eR7jrI5SK2Pkrml34ebT1o+b7ZMT6RB2yNodWGm0AFoiKzfVbPeIyN9Oo7pjYXw+DMcQ0X4FXSAGWk7QBEakbTvBliOlnMMjW05ESCBrLxTMZJUGyZQ8lAEo1P6Nz62p6poa+9UB4MkPgKBcqRWbQs/nts+E7gzUf5J7gOA23UJho/XiwCgJvV4gu9qaOB8QO0HjxMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ccx2rP8O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ccx2rP8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jWLFq3Srmz2xpt
	for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2026 03:22:07 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so11788215e9.1
        for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 08:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191722; x=1795796522; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
        b=Ccx2rP8OzwdB3mSqjDLRcYijt1azqgORwkXwMEbrF7CI1BJWxmNboCpEhbZkLfRBYB
         hQdkScpHp9gyPMp7JdnxfVgT1u4s2c6gU9gHzIWes6f1VP86EynfruVBQ82xdn2YQ1i2
         2hTis+T5T0Ivg+FTYoIRl66bf5oDCBrVBfzb5zVgstQMKwO3wuz3yZRQ794sX/kb5s7v
         ETZrSvym0tVdvbT9m4YaztWfNVXxFq6yyxJpLd8ecoHd2sVb1lsaO4us5VMoIyvSZv53
         il2RH7GxNB81sWyHN2hVZD5IfrdP+Kss+eSViU4lYh9RbOjImFtIT/dorzChP0Gi0a7d
         WNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191722; x=1795796522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
        b=BekG5lpvikOnYXRw/pDkOCTsbmKSZxEft/kcX4aGX3vUxNETKtmybTGJKDJrpR3xsg
         KSolKUMOfsvO2cg1CJ59Q18SDvzrcjHKsxyn/EubWMSvc+H4JveIf0YYCvgwimy5P2mL
         n4XqMV/awWmpCzX1FhF+/sW0bvipQf+0StAc1QBKf6O5pz7tsrWGG6u6c2pb2LNusp1Z
         CHpyK32dcub5OU8Bw2SlVy/+ndc65pv1hAArs41ASIBQtAagYd0E3HceZejAfNG2XG2T
         dezCO7iGEMWu5Gil82wj7D3dHg6ftL5MUN31YjRlW6KZm1vqzY1rF/7FnYlaTsymaGq0
         J1NA==
X-Forwarded-Encrypted: i=1; AL+hErHkc42JV03yxx7Ratb1inHgYFiVCAex5b4y2jhGh4euNUNLlIDNy+7Vo6aI1C34h76W5p6Zyt6H@lists.ozlabs.org
X-Gm-Message-State: APuU4Z9tsLODVvoriPmtnl5SUxU4GAM9hIgwdqfcXMuwGrpWtBlBNeHG
	8DVP5vnPe/fCBmjFtv/S2gJMgrBAqHLRi89WPOL66T/vV4GXCZELK7zuXscJgNnDICM=
X-Gm-Gg: AYBFou3zouRbnfXdaes+r64yALyEG68rabmtKSeyXcJ4GY4ykg2Sne3/iCuaD5bl6W0
	oYxt++HKkW/nEZoJNaT6MpSpnN05/slYzk6XnQcpsgvzRKdQSoqsrRCQsQUlCGIshEMyGy6ryUR
	/dPEbPKzH1ehDQ8JcftGw6HOiuoLvWueUXIXL2JLABdCDB9TNu7QqPN/yUn6JotPM0TI15I0jlF
	+5btea3DAR553aaYgW8Ad7DhHfABLytokv5dQv0R6+gx9jAACxtNpbAYsn+vdilmf9orMf8dEty
	62NPJsorZenU8TqQ4nHsD5M7j5o0A3CBqiReOvnFkXiIsyT07Xe075MpAxe7CVZRtf8O64QxESf
	h/WJzP3hpXM6ezkAOAksbfau8hy5W5AxU0Hq0kNDI2j2RIYkzYNMGxQDHh3QW75ftTAmprntO0P
	FaRFDl5RFcoPUzNGK2g0paYDxCLk6AdwHVpeZ3kYUhitynx5V0XLOWOhpQ8hI09BfTsLw6Mluc9
	r0FEdJSjYwZDe1slU+ZA+RpRq1SIi/iOrfwrU6B8i7xSC+g4k6TqYQTBPpi+5YxZnVXbkSj37W7
	77TJ0GUfWkOPJ32mzmR8djZRLdpZkk8JNbCLfzYlCe98h4aV
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr87878585e9.26.1795191722209;
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm202623845e9.4.2026.11.20.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
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
Subject: Re: [PATCH v12 02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
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
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3637822831411003847.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21680; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=DMIkjnYMdPi5PyCQ7RLGRqmc6HG3et9tIjQSFKOZqbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcv11/kWmc0t9flmZsgu5M97tqqF0bXK+6qwTJDnA
 unIXR4dpSwMYlwMsmKKLDXc1eLvJLW+zJqucxtmDisTyBAGLk4BmIhGDSPDi8AH2RWZio3MdydP
 vPzM9PjL6NNa5WnvIg+bitYe/V7JwfBP5cmf+0a3buzvddyU8WSlqNK3SRPyzx0UlnwnHWp84Lw
 jEwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The MA35D1 clock provider registers its muxes with parent data
> structures filling .fw_name. This is not the ideal approach since that
> would require a massive amount of internal clock names declaration in
> the DT. Since the DT does not play the game of exposing all these names,
> none of the parent lookups performed when instantiating the muxes
> succeed. As a result, these muxes get registered as root clocks, leading
> to a sadly flat clock tree and no frequency assigned to most of the
> peripheral clocks:
> 
>                                  enable  prepare  protect
>    clock                          count    count    count        rate
> 
>  usbphy1                             0       0        0        480000000
>  usbphy0                             0       0        0        480000000
>     husbh1_gate                      0       0        0        480000000
>     husbh0_gate                      0       0        0        480000000
>     usbh_gate                        0       0        0        480000000
>     usbd_gate                        0       0        0        480000000
>  syspll                              0       0        0        180000000
>  lirc                                0       0        0        32000
>     lirc_gate                        0       0        0        32000
>  hirc                                0       0        0        12000000
>     gtmr_gate                        0       0        0        12000000
>     hirc_gate                        0       0        0        12000000
>  lxt                                 0       0        0        32768
>     rtc_gate                         0       0        0        32768
>     lxt_gate                         0       0        0        32768
>  hxt                                 0       0        0        24000000
>     vpll                             0       0        0        1224000000
>        dcup_div                      0       0        0        612000000
>     epll                             0       0        0        6000000000
>        epll_div8                     0       0        0        750000000
> 
>        epll_div4                     0       0        0        1500000000
>        epll_div2                     0       0        0        3000000000
>           emac1_gate                 0       0        0        3000000000
> 
>           emac0_gate                 0       0        0        3000000000
> 
>     apll                             0       0        0        6048000000
>     ddrpll                           0       0        0        266460000
>        ddr_gate                      0       0        0        266460000
>        ddr6_gate                     0       0        0        266460000
>        ddr0_gate                     0       0        0        266460000
>     capll                            0       0        0        2400000000
>     hxt_gate                         0       0        0        24000000
>  clk_hxt                             0       0        0        24000000
>  spi3_mux                            0       0        0        0
>     spi3_gate                        0       0        0        0
>  spi2_mux                            0       0        0        0
>     spi2_gate                        0       0        0        0
>  spi1_mux                            0       0        0        0
>     spi1_gate                        0       0        0        0
>  spi0_mux                            0       0        0        0
>     spi0_gate                        0       0        0        0
>  i2s1_mux                            0       0        0        0
>     i2s1_gate                        0       0        0        0
>  i2s0_mux                            0       0        0        0
>     i2s0_gate                        0       0        0        0
> ...
> 
> Apart from the wrong clock tree representation, it means that none of
> the device drivers (spi & i2c in the excerpt above) can actually query
> their clock rate, or they would get 0Hz.
> 
> Instead of declaring the parents in the clk_parent_data structure, use
> the actual HW clocks to lookup the parents directly: parents are
> described by an array of indices into the controller's main clock table
> (like in other clock controller drivers), which the "new" mux helper now
> resolves.
> 
> The WDT and WWDT muxes list the /4096 children of PCLK3 and PCLK4 among
> their possible parents. Those two clocks are now registered by the
> previous commit, so their entries in the parent tables are restored
> instead of being turned into invalid slots.
> 
>                                  enable  prepare  protect
>    clock                          count    count    count        rate
> 
>  usbphy1                             0       0        0        480000000
>  usbphy0                             0       0        0        480000000
>     husbh1_gate                      0       0        0        480000000
>     husbh0_gate                      0       0        0        480000000
>     usbh_gate                        0       0        0        480000000
>     usbd_gate                        0       0        0        480000000
>  syspll                              1       1        0        180000000
>     dbg_mux                          0       0        0        180000000
>     sdh1_mux                         0       0        0        180000000
>        sdh1_gate                     0       0        0        180000000
>     sdh0_mux                         0       0        0        180000000
>        sdh0_gate                     0       0        0        180000000
>     sysclk1_mux                      2       2        0        180000000
>        pclk4                         0       0        0        90000000
>        pclk3                         0       0        0        90000000
>           sspcc_gate                 0       0        0        90000000
>           ssmcc_gate                 0       0        0        90000000
>        hclk3                         0       0        0        90000000
>        pclk2                         0       0        0        180000000
>           eadc_div                   0       0        0        90000000
>              eadc_gate               0       0        0        90000000
>           qei1_gate                  0       0        0        180000000
>           ecap1_gate                 0       0        0        180000000
>           spi3_mux                   0       0        0        180000000
>              spi3_gate               0       0        0        180000000
>           spi1_mux                   0       0        0        180000000
>              spi1_gate               0       0        0        180000000
>           epwm1_gate                 0       0        0        180000000
>           i2c5_gate                  0       0        0        180000000
>           i2c2_gate                  0       0        0        180000000
>        pclk1                         0       0        0        180000000
>           qei2_gate                  0       0        0        180000000
>           qei0_gate                  0       0        0        180000000
>           ecap2_gate                 0       0        0        180000000
>           ecap0_gate                 0       0        0        180000000
>           spi2_mux                   0       0        0        180000000
>              spi2_gate               0       0        0        180000000
>           spi0_mux                   0       0        0        180000000
>              spi0_gate               0       0        0        180000000
>           epwm2_gate                 0       0        0        180000000
>           epwm0_gate                 0       0        0        180000000
>           i2c4_gate                  0       0        0        180000000
>           i2c1_gate                  0       0        0        180000000
>        pclk0                         1       1        0        180000000
>           adc_div                    0       0        0        90000000
>              adc_gate                0       0        0        90000000
>           qspi1_mux                  0       0        0        180000000
>              qspi1_gate              0       0        0        180000000
>           qspi0_mux                  1       1        0        180000000
>              qspi0_gate              1       1        0        180000000
> 
>           i2c3_gate                  0       0        0        180000000
>           i2c0_gate                  0       0        0        180000000
> 
> Note: while switching the API, let's use the devm_ alternative to manage
> the clock registration automatically.
> 
> Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of string for parent clock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 626 +++++++++++----------------------------
>  1 file changed, 177 insertions(+), 449 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index e95f72bb8103..c65ceed2fd5e 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -63,300 +63,49 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>  #define PLL_MODE_FRAC           1
>  #define PLL_MODE_SS             2
>  
> -static const struct clk_parent_data ca35clk_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "capll", },
> -	{ .fw_name = "ddrpll", },
> -};
> -
> -static const struct clk_parent_data sysclk0_sel_clks[] = {
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data sysclk1_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data axiclk_sel_clks[] = {
> -	{ .fw_name = "capll_div2", },
> -	{ .fw_name = "capll_div4", },
> -};
> -
> -static const struct clk_parent_data ccap_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "vpll", },
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data sdh_sel_clks[] = {
> -	{ .fw_name = "syspll", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data dcu_sel_clks[] = {
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data gfx_sel_clks[] = {
> -	{ .fw_name = "epll", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data dbg_sel_clks[] = {
> -	{ .fw_name = "hirc", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data timer0_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer1_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer2_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer3_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer4_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer5_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer6_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer7_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer8_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer9_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer10_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer11_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data uart_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data wdt0_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wdt1_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wdt2_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk4_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt0_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt1_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt2_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk4_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data spi0_sel_clks[] = {
> -	{ .fw_name = "pclk1", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi1_sel_clks[] = {
> -	{ .fw_name = "pclk2", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi2_sel_clks[] = {
> -	{ .fw_name = "pclk1", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi3_sel_clks[] = {
> -	{ .fw_name = "pclk2", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data qspi0_sel_clks[] = {
> -	{ .fw_name = "pclk0", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data qspi1_sel_clks[] = {
> -	{ .fw_name = "pclk0", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data i2s0_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data i2s1_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data can_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "vpll", },
> -};
> -
> -static const struct clk_parent_data cko_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "hirc", },
> -	{ .fw_name = "lirc", },
> -	{ .fw_name = "capll_div4", },
> -	{ .fw_name = "syspll", },
> -	{ .fw_name = "ddrpll", },
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "vpll", },
> -};
> -
> -static const struct clk_parent_data smc_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "pclk4", },
> -};
> -
> -static const struct clk_parent_data kpi_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -};
> +#define MA35D1_MUX_MAX_PARENTS	10
> +
> +/* Mux parent selection, by index into the controller's clock table */
> +static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
> +static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
> +static const int sysclk1_parent_idx[] = { HXT, SYSPLL };
> +static const int axiclk_parent_idx[] = { AXICLK_DIV2, AXICLK_DIV4 };
> +static const int ccap_parent_idx[] = { HXT, VPLL, APLL, SYSPLL };
> +static const int sdh_parent_idx[] = { SYSPLL, APLL };
> +static const int dcu_parent_idx[] = { EPLL_DIV2, SYSPLL };
> +static const int gfx_parent_idx[] = { EPLL, SYSPLL };
> +static const int dbg_parent_idx[] = { HIRC, SYSPLL };
> +static const int timer0_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer1_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer2_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer3_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer4_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer5_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer6_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer7_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer8_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer9_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer10_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer11_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int uart_parent_idx[] = { HXT, SYSCLK1_DIV2 };
> +static const int wdt0_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
> +static const int wdt1_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
> +static const int wdt2_parent_idx[] = { -1, LXT, PCLK4_DIV4096, LIRC };
> +static const int wwdt0_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
> +static const int wwdt1_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
> +static const int wwdt2_parent_idx[] = { -1, -1, PCLK4_DIV4096, LIRC };
> +static const int spi0_parent_idx[] = { PCLK1, APLL };
> +static const int spi1_parent_idx[] = { PCLK2, APLL };
> +static const int spi2_parent_idx[] = { PCLK1, APLL };
> +static const int spi3_parent_idx[] = { PCLK2, APLL };
> +static const int qspi_parent_idx[] = { PCLK0, APLL };
> +static const int i2s_parent_idx[] = { APLL, SYSCLK1_DIV2 };
> +static const int can_parent_idx[] = { APLL, VPLL };
> +static const int cko_parent_idx[] = { HXT, LXT, HIRC, LIRC,
> +				      AXICLK_DIV4, SYSPLL, DDRPLL,
> +				      EPLL_DIV2, APLL, VPLL };
> +static const int smc_parent_idx[] = { HXT, PCLK4 };
> +static const int kpi_parent_idx[] = { HXT, LXT };
>  
>  static const struct clk_div_table ip_div_table[] = {
>  	{0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
> @@ -375,24 +124,20 @@ static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
>  	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
>  }
>  
> -static struct clk_hw *ma35d1_clk_mux_parent(struct device *dev, const char *name,
> -					    void __iomem *reg, u8 shift, u8 width,
> -					    const struct clk_parent_data *pdata,
> -					    int num_pdata)
> -{
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> -}
> -
>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
>  				     void __iomem *reg, u8 shift, u8 width,
> -				     const struct clk_parent_data *pdata,
> -				     int num_pdata)
> +				     struct clk_hw **hws,
> +				     const int *parent_idx, int num_parents)
>  {
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};


It works but a little check to make sure we do not overflow the table here
would be nice.

-- 
Jerome


