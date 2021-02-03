Return-Path: <SRS0=ukuu=HF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDD4C433DB
	for <openbmc@archiver.kernel.org>; Wed,  3 Feb 2021 22:41:38 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FD664D99
	for <openbmc@archiver.kernel.org>; Wed,  3 Feb 2021 22:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FD664D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWGrJ3LcYzDwnr
	for <openbmc@archiver.kernel.org>; Thu,  4 Feb 2021 09:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=syr1cgUV; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVw083hzszDwnV
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 19:32:04 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id 7so23178166wrz.0
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 00:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
 b=syr1cgUVeq439dK2HvZMZmbfC0UuGaMMCA60P47g+FK8dOmODlRmxxVaAUDY8MYNpr
 oDyV97fWiHkRG9DoaUDEiS2vjDh/KEvDgjdfqv/UQvT/PQwBXmMM9bQ9TIemNZtPxwpw
 ie2B+QeaibDHT0kHWFx4wGlZJtlMIgMt9V8XFesnpXrp0pCktbzGUCzB0Nq3iVZL8Mwn
 7VsbFHLub8C16FyatrIkBGNTGkmQybZphlYdJRvQ80x1eA8vfyW2xELf3aIc6AW1MCpw
 cCgk0ZcwNzyvBKV3S3FdZbrmWMrI9KftrGniHiIQ1/9OoeZE4DimhVc3mF3m8YYgoiZ8
 1bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
 b=YiEQyP6HbEmg4Pg4XyMFgmch75z36muvVbD/pMcDKTeM/qivsj6vrmqBxBtCUbhYpi
 HUSuXmesYvsqXbOcDBEKk6SS1aTankjvqPv2KWw1iloR8AWNUr+XSpuJO08gSbblpgzD
 i1zuL5gFFPvVNOKzhokqj7KYbGDhz9X22cZtQZxgpCtuGE9dGXZiLCvaMJz2GkqX/Y5m
 ugS3jMQgCK5HlfVbxRPbHG6cfLC23UlAfhpqTyLQO4rdwoXf2hATHXy2hPo3J5amIlLS
 wbL8I53RKmY8PjFkSH1ObaBROt8GPfNfQOH5OyGoxtYQom7oeV/QpSrltylLs8ixS3yb
 awQg==
X-Gm-Message-State: AOAM533vWaGLFZ9NCOdx+G9kQTqme6pu+UKS6oPtY6s3GjKlGdDVhYo7
 NN3qdFDw1ccM6+EGEDey9lAo8w==
X-Google-Smtp-Source: ABdhPJzYVcDMbwFXa6BCs9Ojta/M4taYxxIoBb83B8dxZ0oM1QClmWS0uM8CMmL56lRXDZcoUBVp9A==
X-Received: by 2002:a5d:4528:: with SMTP id j8mr2190089wra.352.1612341118982; 
 Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id s23sm1646538wmc.35.2021.02.03.00.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Date: Wed, 3 Feb 2021 08:31:55 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andy Gross <agross@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jan Kotas <jank@cadence.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Loc Ho <lho@apm.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Nancy Yuen <yuenn@google.com>,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
 Patrick Venture <venture@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>,
 Richard Woodruff <r-woodruff2@ti.com>,
 Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Stephen Boyd <sboyd@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Tero Kristo <kristo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210203083155.GA2329016@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
X-Mailman-Approved-At: Thu, 04 Feb 2021 09:39:52 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 26 Jan 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the last set.  Clock is clean after this.

Out of interest, what normally happens to the patches which aren't
picked up by individual driver Maintainers?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
