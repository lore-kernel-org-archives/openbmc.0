Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1A606A984
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UOSh5fzb
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGfd1Y3Cz30P3;
	Thu, 19 Nov 2026 09:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795015023;
	cv=none; b=KnKJdXvDUe2tN7UhIYQxzswwgkDNEiIIfryL02i3qluwz4nmbt5D38bfXJ2s3aGbFh7DmpSXSNJdti+86zih7rHb/02lvd4DAsY9KBS8n7blVpBkIhg1cfkIIv+CUwe4xOxVRHeXZxGqZwE+NBExce5uNHJi6XthSY9eqJWVbNTsB210gPit8i3Fx3yXVZ/P9aw3YsUKtNyCRvoYLzC1YH7ALekW1dC/ACLpMueZtl2ddD9IbsJAci2GUw/sio/aGgEfpv8RD3IKuIXDB6wucLC5asvpcV6hqW/7b517m5zt6SaYTC9U43avcdlH79dNCV7GNL/r8Ppvvmc9LB/IMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795015023; c=relaxed/relaxed;
	bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Gd0iCE7z7thSPZ3JXV7W6vAC6r9o5VZRhxbZEfRS4xs43wsh03e1A7SMyXsu0IDbx+sJZMO2zxuMIr68raIiVBvonRJO/qeN2ApHI9nGZk9mMyFw5e71hNLCF7hJFKOJhgvc7/DSbOtoyq3Ct9xDJYRfnvsofLw/Z/PJhzhP4/dB517VmyoH1XNNvb2NCJhRXOmcjvxASKHeEQ+LI3dEmBAb6NnnT5zA8rzpanuwGhO4BIcCe1wZa9IdHRRBYvmtNJzg2SvGnpwg95dBznMqNplwjvdZSZU5AAJ5yE7IUVv0nwV54WLwYmLx6zKeHbZswyWacNfpNMPr8mlCLMY3JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UOSh5fzb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UOSh5fzb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV4vd4bjtz2xMt
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 02:16:59 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so906842f8f.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 07:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795015016; x=1795619816; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=UOSh5fzb0bWcNuVIEuX4GJchCEN9xl7sUq+BVQ1s6XE7wNiR75XoITR42etwU+sNQ8
         ikD1oU0G5Vycdz7lkyUNysoqBXjaW86M7XExURG9mveS/Wh2hdVGgkECD2IDWXSJL+uD
         3NlCgD+cJ5NYKMfdhilae4AK6HCiS5h9JhaVB+Mv9jd6O4sCAk2nPjAwkZoUhVkFYKvF
         yBAvX/A/9uGpv2TE3o1muCelRSFn7K5Y4ByuQisQnhSnbGD+JHUg8W/uLCMHjjcLImpg
         DlKgC96fJ5UjxX6qkchJF6OiYEb8Vw9YzAQy0gykNYt3L1DYUhQsPodi1jrFctS7Llph
         /Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015016; x=1795619816;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=W3rqdVoOG6oKXm3xoOMl5n5LwenGuLfmmvr/U0IElO6w7XIPO8iEXYFjwb2h0r+fVJ
         h4An3wuOOLdoDCMG9UEnRR8BTeFKpTimvelZRPw+DP5G6mMsMILlrZC/PrAUPHD27IYd
         Ol0k8UkMWz2ittk+p11Akt1Cd8wgdKTKbLYgJsyyAHMT5lMx+U7yppHAmHrCYV3DGzXg
         JkuO+WfGfGw608AJl8yzhfEKMJrg9hJA9Qb1hamsaIEl1uyqyLHp8PtI6LY/C4o0H0sN
         nAyPQDPA77S4p4c72/pVR8duAX0mPC76CJBusWS2tyd3O7z3Dyr/w2o0X2S9bDEyctAd
         UOow==
X-Forwarded-Encrypted: i=1; AL+hErF1WchB+EWsGHoXpQDeaGwxmQqrK1hO+puEoiO9DQkVgR9YLNSayYQZHAgJbR+Tv3BUmR/uMbUR@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/wMOfl3rvr2rK3DSNVZ/5XspjSerGuNGM2rbGb5ZmwUycINxPH
	P5ApqQQNlDfxw6ca9cEKz8OC9J76mLLNgiLtDxI76cG3va7NadCrMtDSMB1ZSCywwtg=
X-Gm-Gg: AZFdTZdjwiA4t+Bhi+KkBDOoDwO64MFhGR+cKL9mDgqvDEEEl8kkIG5yanMBuhp9tpX
	QqTf+v5ggQRAO9qE11BjS866Y/t+RpevRQAFzuySH/LWZp/xpHBIcZiJff1Z6AF68+dp99C4nsc
	x+KU9IuxXSXs493Cy7jF3gdiew1fuelt2/sYMat6ZhLjWaMvZ0M+w6/nrzIlTkKv7fqOuAJuTQx
	FS++bZc5JJ2NLlZIyyBrKGVKYbUr4E8z4KENS1opXqbI5UtfFlrVOhfVP46BJjW2K+tGDRjG9aI
	M5rIOU/gxtYTLz31ccv+JKjaVz8bhPuSBWOSuh2FCwz5/T4/zcEphjZUYjINpvVSDrBqgoB+c8V
	svFBk+eGIOlIedGHwiOEU0lfmA0bWOkQz9yYO0ZEuTgTFm//fvL2iu5MREGwe7u2JbuzfeWwSc3
	zO3mhyp6cnpzQEJmj2Wl2wgA6v6rgRMpVO9p8fhmLQrHWnN+2jy0MTa9fo4EqIMyOhuH3NwIxIW
	0L0qsbmHsnKeQCtiq0W+feRIk8DArBUyLjjiU22JgkEbRIJu0d3oiGxSSNldUohL0giU7Mzixej
	puGscbG5kyZUV4A8OBNeoMT7oGHOIQvDgK1mJJSTAFHtGOmW
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr4688498f8f.28.1795015015881;
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5148396f8f.6.2026.11.18.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
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
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
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
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
Date: Wed, 18 Nov 2026 16:16:50 +0100
Message-Id: <179501501070.639563.9357303541273366380.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ze/lWMxenuMFFinRWmaSX0IcexmH1tvXM9t0DvMowcU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/D6bpy/0tV5+lWL51RkjKPQXn58FtMoH+f5SuWOVVn
 Q0z+7iko5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5Z8bwP3716cfT9okus2OZ
 8K++LlbF6Pn25IUzVn3Zf0aba1HEyhhGhjdSSyMeLDnMVr/5vvLSWKM/unu682QdT776tVq3cnv
 vJwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).

Hi Miquel,

We've had to base clk-next on v7.4-rc2 because it carries a treewide change
around devm_kzalloc. This was triggering a lot of conflict in linux-next.

I did not look at your series yet but it does not apply cleanly on patch 3
(maybe others too) because of the same change. Would you mind rebasing on -rc2
or clk-next please ?

https://sashingci-clk.liltaz.com/builds/555/steps/3

-- 
Jerome


