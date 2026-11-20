Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AB0606A332
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T+sC8xzb
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jWLFw2VSQz2yrC;
	Sat, 21 Nov 2026 03:22:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795191731;
	cv=none; b=iNp8PW7t/shLIT/akyuL1cxY5Uxk06/Nfi8NULWdoSYy3G8CQvNKTdVc5Cz6InWSQ9F9+cb65xOBxOxboCdQvum0t4SF8Bs8jXFwsWBOLTGS66RULBYNG2g9KMHMZ533LlpzUHGDCvGtLn/t2hdFa12eGJsOZ53KFH38FTzgGDMgrrpuLeCdyaTw1VM1ziHLj1k7stApeUWLUnnscJOQDjxahWWpETVaO+cU4FenBY5R7K6KXf7ImHYUB9y/BSJt7STfa0jbwlScSLThDB7fvYRXBmCC1qkKGmylnjgDX5+zzZnuNgypXo36TaeKaIkfFKrelHX8XJx8cEhcJyzvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795191731; c=relaxed/relaxed;
	bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=VVD4oLDWjKiM1GQXupu7KRY0En9TSOybAY87JrxIMxi+JNdgAnBZQh65S8ckGSeL4cyoO3Tz858oj9VLA+V+scFTrMMELCHz0ncvamBAGX4riiaDLCXRHgBfbk2kARQdqmtdAIJK4aLbDbEvjeBTcIgIsKSo2vdvcqD57ynMefz6rK7z7Dlq0Fth1mSMNiTEkcZwiU8iGhMzrNoqb4KZBWRZz35k7nnhZ6beqr0lWxJ316Xc0V8tLCwsocTHGT/D5fiGI+FkPkijDnYXAhUbIk/3w4m0tSE2S855vPTLRzFpJBonnsXXo2Fs8CKTCNV4ZAFL8Imb3oYYBTEausL/Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T+sC8xzb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T+sC8xzb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jWLFq47r5z2xwN
	for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2026 03:22:07 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7640145e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 08:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191723; x=1795796523; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=T+sC8xzb3Cub2XkeMcegVtLNQRqS5Hg0cY6GEFrLfB91sRtWtFT9GK+PQELizGHTBz
         ykMxSWTIuV5S7DPkWOXZD620yc9/xWg8tccYNgAUa86O0uqNo2rwMRB47vM00H1vdI9F
         G1GCO3LKtUHwkke0ksqPigma3em2p/qJm6k5AcoJoGt5bdco2M5xVCsz/88a2pEDAQbP
         iWxShFDvsH99JBfqGPMOvgmeL1jCIaYHiYaRR/x9ArWTOrdS17eYXBYBX6ohhVFWEIM5
         yfcjsPQ6dqqFUzYsrkQt6ycVYvjmAxjcHzXiX6jGWhU1Il4axjeORiFmdvpuj55F3HcS
         Ei1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191723; x=1795796523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=H9t4vuHgQuJH4w5amE5YUJYRt8rJRstVI/JkTZ1dnLPNVJbkKR2tKhhOVrGALDViwb
         urjVl+DHwSiMzej1wioSsjzlOrZNleUo92vKwbGe2Vxs/i0eiLec0SEbSaDHP/LClIA3
         dPlGCnhTW+c0czXDt+7aWXidMdTxDKTsY+TsFOGTh4qyM1JeOc8bjprTBUv7Rq7UR80G
         O0Fi3ZD6bUg08G12ftawdyqVcZrD9RyslaeGrcXdhq15PfAmVOijgof602pYtsrBZ/BN
         tat+fuQZGst/CBVnwhEDhAnJbNKF/XrRSfAC5+tekp6V18Junj2xL9KjkU40FJrPhJI+
         1VpA==
X-Forwarded-Encrypted: i=1; AL+hErGvCMR4eAVVtbOElzxz/g4Jey/zLLV9HO5j6W7DqXEAiIYUvNCn6uwTq3qHX9WQqBkCFImPTx4e@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/w0aULoydgRrfQ2UYaWnpLXpktT0d9BAtfIGin/0U6IZKUbrFu
	0pVr7vy4UwqcXJcgMSx32y9QklBDCzAwGRNt8HySll/JvVde34nivTdjULafsbgnNKM=
X-Gm-Gg: AYBFou2SHzL89/2pBbQkJF6IOzGGLHt8N2lhYTZRpc8Wu8+ElUrCPSGjsFaD2yclanA
	EoHep9mEAc6WUwUDyDgvy3FRU2Z1DzCn+NV/SYF3/F+a3jLlUG5mQaaoGMCL6Lmn2LakkePSeuU
	dXvKlY2JEC+0HAcCOGJRquQtXC116tggp41Odz/nLJ1P4+mGj0ADY6WXd7jSpqPoTkA/VxKsioh
	d35Ef/JfjeGPZzI2n9WqpdL3I8Vv2ASaR+7IO4Z09PMOpeP6JXYMGdwlKZgMRD3JllzvA+uvQbe
	+/2eq5wbPQc11xdwZV3jojLbwEJmhwDexQLn/bSkBi/NqpsyobvgIcBXG6mJt9uprsmJvDaDzUr
	fS9SGGZQiWzV4mVVfaLoDC3Z6wXsRg5A+11ILOmy4dWcpcWWt6CpyFHSw5v1kFN5yI6dHWgIldV
	qnOCEFyf2QeWZKw6QbQCEzwZtj+T3usnCTCtbaeRkJZ+UMEC7sX/Hl+eebVbrvq8KsJ1kuDrfYl
	jdN1JcQR2kAteJOpBAfshiVABEcpb8rWWtXKStRPzaoAgi8Fcht6KbkpE7STs52jdAmWuCFPgSG
	NkSqUhCtwHdwzrSLS2Tuf6gp/etNoyBNfSQKRLdxmopl5e+f
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr92312295e9.3.1795191723347;
        Fri, 20 Nov 2026 08:22:03 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm137854885e9.11.2026.11.20.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
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
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
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
 openbmc@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3121589367853881174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UYAuJv9SVgURGKW/pKO2M7vMHBgjYbXz0H2zRl5sLMI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcufFn3NUD4mbSymcPHS9iXCz8sUe2X4GLL0RHsYf
 By1gyM6SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJF5pYwMj9eqR/3X/nTu9Pwp
 X8wmLIr1uLFhAkNJevMtlgmutw10XRn+V89UVdsW7afy87rS+tO36nYKuB5ZLxh/zPbCkR+ztzL
 oMwEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I have the platform, I currently use it for my developpements and
> therefore I care about the clock controller driver and the SPI
> controller driver not being constantly broken. I would like to step up
> to help the Nuvoton team (not visible in the diff since they created
> an MA35D1 catch-all entry) in the maintaince of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Commit log nits:
- The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
  controller maintainer".
- developpements -> developments
- maintaince -> maintenance

-- 
Jerome


