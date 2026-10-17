Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDD606A319
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2026 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XCGqA8vV
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j7sWx6Y0Bz2ygD;
	Tue, 20 Oct 2026 10:41:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792248845;
	cv=none; b=hkO3YxPtkXJSvpamsqxjkmh/4J+Y/xDdOXf+wOML2UqTaApsZ6DSeunnipj1JAcp9GQioTO1h+P+mtsFcbMp6i53WFX1F5aVMx/E9K5YSKmgxXdoFfLqbzd/BopRserF0F/64/DGzfgV5AqhqK1/qSBbMiNd0zrRUaxb2xwN/b0+2kBUsxERuIjMhW4+KDqlIz6//ri5WmAM5SaD40P0loyCzIWJ8uzUor0LBCKrZ6ZyKWuazDUTD/SkYT96ImteYMz1hsdF54FRagC4PxB0T2Guz+teY/Liom5h/fI0NByqW+5h0hvFPLNwWj3P3LNLvhKH9y6WFtXAjPpMS/FX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792248845; c=relaxed/relaxed;
	bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PphmZ9jGcNrtZIn3FwzTqfzf3NSLVzAutK2Y8l0W+xHdKNNjb1b8kwhGT157Tl4GCf2atSUvXwspXPFBVQL1XiLb2tPZbfzArlIdoM1c+3dipT25MvoT4kDoKopIUOdSZ9Ma5OIvJNARFc7jzqMslj8jBgsunfKVBZswj45GJSt/cr5E1yLaH+dhjgSqKm9XLdRvPD4lqP4sPsN2YCMhER7U5TNUGUSrUG+tF9yBpVNQ+hRu1MeROfZhFlmZCoXMuZFG5ws3w9FBrir4zsjwNJeghOMhMrWBJ69GWPz0Jx3TO++BNu5owmsI9PY7JlpIciHopRkzHP+fajn5U2l3sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XCGqA8vV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XCGqA8vV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j6Pvs2LQYz2xqh
	for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2026 01:53:59 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df8fe8513so524948f8f.0
        for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248836; x=1792853636; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=XCGqA8vVX9sTMAAdQ+7Pcm2zFr+F0F2DzNKGpgUyeg5xlo9JxLiA3X2x5aYCl8xFBU
         LYCzqmBThYp3+/hiWUUYyvy53DtvCQy4vQoKMmtdFgWpIDfBtSPMj7eWx0Zcm1/zhUSO
         mVYmU8n8Wrv8ZkfcZee1p8qWH/2gNgJcpdgTwcGm7ymVtjU0lN7swAGQSZWnotUU2Djv
         E9c5nuOFD7Kh3yK0WuDfM47xXNGpabGVMVzj2slzOwWZs2JqMcmDAC3bjBjoBfnNP4e+
         aHGoiCWKnspZhLUxP28ODII9qOgezb4JfdF2MoOU5mEZtaTuWAp94QJ7It3zoJEM1oWe
         GgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248836; x=1792853636;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=RPCP85RMnGlL+TvvqeLZtuViXpZU4Px+GTCs9hRHmC1hSyM6QzkvW5inPOly+5yeGY
         5HmFrokqQvFFyYMTfgFH8+JX1htZNMePsBuAvuxudkq/4l8rpFEtxgq82KNUxTdUODO1
         FH8tvdF9fXyS0OEcvimBsyYXyuTAWjiklMOQM8eveJm0ZFk+5f29EAM4m4dETVaoh7Fv
         SOFdevnqOLrXFrMOxYq8nJv0qyiaUUCcyJh/ZivkEWPn7giC0jTS+nO80RiYGehSjuCx
         QyVkSl/IAShlfB5K+EKagRZMCwH88ds2z4swPwBVS3jKdDUti8HBzj+Kg9SocfmEAefm
         H/3w==
X-Forwarded-Encrypted: i=1; AKwUvByvuQtNaV0VOcxT2YyAYIGLUo/9xwWL+pBFvw0sfeSboYpaAgX2gzs+X+gJFiHHswU3t+/rKReI@lists.ozlabs.org
X-Gm-Message-State: AFq9FYJfcPo5pLSAvdBhkGTBkhfJU+gjena9orArkpSYK8dAQkh0snoB
	Y1WuiclVvmPdTNnK2bzVWK3Ih+nig78bxDfru9CwEZ2VQ+V03u0ioqZh1uEWscCZZDU=
X-Gm-Gg: AYBFou3eVcOS8fOgIyWgYDn49WRXoyU2EO2pB+5r4ktFCue/SbYfg3yySrJb6Fp0A+j
	R5dVR8rrNeI+m/slA15LiuY/VLTLVEqGZJmlspTxMRidTE9g0Dn+jzpGuu88eT0ty1waxkclm+0
	+D329SQvWeQvKW3c8ZV728+6+qC7SExDFQsCcbvBLL144c4vbqFV1sBWyT+3Y3jFS40ViVxgISH
	AMlX0/RX6DzBYjKV8dclwjmQUaQoiN16Dr4BU5uLzoxRm13FjoVhPIW/9GUbCJrM5lUGdRUH9fo
	1DKMGP1mYUbuY4b0Yl9C5dLtb2fDAn2TvQ2e/ufmFtXJzwVr6qruU0H0LzvaPjRaeaTwp+bGvgi
	6MrLxZmOdC3bGraxXPWYT+ZRcmQfZKXvVeDBUxcLR+I3rQwuDJMS4GkmW+yIYzp9ExBVmaBvcU4
	tDA/WfA2Lws+0Aw9utHrXcHhNgNSnqYig4BvtNq/ZyGjJF6kVcKDlAJO8G5ASN1EGudXpAtVMqf
	9JSGmWW0UNUKl6w0Q==
X-Received: by 2002:a5d:69c3:0:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e07f9c04emr3912331f8f.38.1792248836373;
        Sat, 17 Oct 2026 07:53:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm11683485f8f.44.2026.10.17.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:55 -0700 (PDT)
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
Subject: Re: [PATCH v10 06/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
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
 openbmc@lists.ozlabs.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:42 +0200
Message-Id: <179224882241.859276.3068400770588177354.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=543; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QGkkL2Br9nOFTntWsohnZUbwzb7F2vn9vpbJDAOpngU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXexj3VFp7rN9ucmVlQYXo+uJV97vPuik3FKzN0dvAc
 yEnL0i5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOR1WBkODlR7IHFf528iI1X
 /i/aHic+02uHx8LYcm8Lg3WbjXaKuDP89z+wrdmo2azRkSO5eCNfZH+wZRH7Vc+bs3Z7m0kEvd7
 HAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 15 Oct 2026 18:01:19 +0200, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> clk-provider.h exposes many different helpers to help registering
> clocks. Most of them expose both a 'basic' variant and their 'devm_'
> extension (with just the last parameter of the inner function call
> becoming true instead of false). Do the same with:
> 
>      clk_hw_register_fixed_rate_parent_hw() by creating
> devm_clk_hw_register_fixed_rate_parent_hw().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


