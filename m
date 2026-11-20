Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007E606A325
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O908feni
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jWLFv10xTz2ySC;
	Sat, 21 Nov 2026 03:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795191730;
	cv=none; b=B9ZLYejt3anwcd3O18s8+qi4RYFclY3d8W8U18/IicP2Rd1QqtSfz8HC0ziS5K0HwrKGYiVBhBQ/tIj+MLCMq6AW2IVqLRPu5MANJeMSnNLEH2CPbqpRX5UYvF+Mvbx4nHJ5ubbc/kpUA2MPwrplOF46CNXlfdzdpVBbd2wIEjLc+lgeOqAnKqxutZoXvEpNLJ6ssoGlCh6lp5r5t+BR/7BqemsCWVGxWyMaOYjJReobOo72eAM17eJ/5lJ+pc/AtjGjfEMVPmE0gxbxWoyPPnL2+ZBHa+9FwBNjZoxgaMcaCx3aWpAdqO8icuFDGaZ6AiCyihNxYpY27uSwyowX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795191730; c=relaxed/relaxed;
	bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GSoav3LoJiS+0DGlH7ECeRNFDAZZM82c+xfFSvTDWcb7+UW4J4yXbCNRjIGownQWJKimvvz/upKRknHbMURFHz+XGSKltxtFSknDN8VDAdcnyTDmbAJ4Mcv7VD4fcw2okgDUn5+ndYS+NJeYp926Ij19R4Qu70WJLyyaPTS+K5KNK4YgwUbxdt4D2H/Y/stU/haIOzzwK8OX1FBzAROWymA7YhgYIlCUFYo5rjtfqpAG+01puodsSgNGSXJw8lV1au4JwZTjMgIuaJVO3sBwA2T68fPH0EOxADAPavYF3nRgEHNula+OASK1PcL1pYk++mP6NkYDehDBhjh94Xym3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O908feni; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O908feni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jWLFp6lgsz2xly
	for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2026 03:22:04 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8592175e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191721; x=1795796521; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=O908fenixGfAkXg4WCatKnzlrlkd7XrFxSt4+LJbnFGhBOCXWNnvcYRCYl36Qyp15e
         R74e5oa3N56SePeyOzYVDdKxnYHq/85oYa5D/yLq5Z+QS3uEBzXB0Z/+VqqF8xzUAsru
         g+pGcmlq1/W/Tud1mnzmDa/LUjiJbSyRlTmx/PdbvJWRAhIL2bwgarBJT/jVkWK34Qsp
         86XW/3yo/INU0AcngvJf8HB1gs9T8GV/5VLiKiLbPxbFw9nFugkFizNu+Jg05hGSxaWI
         E54NmEQgPQx75MHTiiN6+JVBDVftBCE2Jca2Nxh9eQ/OCZkGRfcoz+liCBTfv0P6e4lL
         or9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=JPIdnIPGMAZjKKDDEbXj+Z4eXzTo1aXHRmybuTSECaUE0BFrd1Z/sgQgyD6Aupxgeg
         LNTGuciKPNWd80Xdgu+UTE9yJRtgsFz7/xCexJO8q/sZYUw28SRjsTYGeVqoD7UYhoez
         cNSwN9sGK+6GZ0jtvjL2IRk6zkGQQPOh4AsY8qHPbW459qj/eNm3HLt1Lybag/lDt3O2
         herZZRyUKuk1qCEzKobuBSh4eMUXkFHlE9FmvXMdmHBM4hHPMj/n36Fhio110cKEmzjZ
         0zJ687XytVppsjfFZktiPHHorD3UfNwbrT9+I7Um6OT1AmQAyAUDtKJ7xIUSYq7M45sB
         tHHg==
X-Forwarded-Encrypted: i=1; AL+hErGgDbA8f68O1+7E9CrWai/bE7a5QPyhF5IqIPLR3B2THZlkIFuSkupwU14r7fpS6M9hdbRiBPHL@lists.ozlabs.org
X-Gm-Message-State: APuU4Z8/4LJpqRFSyCwrwSglnlWLPTI9EvU7gRBSdnqRni+4GI6Q2C5A
	60RzpEVHVUsc7fvDXRzlQdmKQcHIha5xi8BCs21pCH8nOmQNVRf5MLaziuaYYMt+tok=
X-Gm-Gg: AYBFou2yiZNag88OUIrufpFQrYsDfGFvCOGOK0meR9f38vOl8jVehGiLeoz9k8r17H3
	NHZx9g/dPAp++OUVUUTkyOWqN3m4TVWMPpzAZ3DkYmSHck7QnSZJ3XXYQcdLK2DNFlp0pxey8rG
	wSWVk0tMRTI7Fy4OBP3/vuN0Av8+Fp7zVcXDBl563Ntt6aZvPtkYbvMqLT61RDHZfZLSi5RUQbD
	tJSAHtwfP0Se+hHLsx0jVO3lNOfJBFCxsS0PPqGbxhi48fept5z6kAV4EfrW5zpCiUQvf7mlF2x
	apTS6Loxsu0g3QYY4oBnQp0VgBDJsEQ46BN8XoP3Vk8VIu0qEW8pCaoWVKLWIpDVb6HOo4VTC+V
	lNkGQuxktQRHVD2cywNdaBnDD+nFSmnMcIMeivwFbuiwL0NXtoklfewyIvbZMMOow1WXlBX3ATw
	yzghHqA9CrUWi0hIaq4tP537NgjexAbzks2iXhAXGY9NGkIhIe0PrnUkUJl0nMAUHynz8QfwDhW
	McqLvhR220n03uM7Hl827bRbmawRu4cpnmOIjjosjz6Y60gmphVLo78VEkvNxTcVv2kZyVjwmsB
	S4HqrDhcICanGAwk+do7yGsaFKasorNEzIFq/imsJRFF+def
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr77585875e9.25.1795191721065;
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm129338075e9.15.2026.11.20.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:00 -0800 (PST)
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
Subject: Re: [PATCH v12 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
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
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.6006858658982158181.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=da1CAgmUNSJ5Vw/XW6Lz4OSgqJ+yn+Z+QoMk5bui0gM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxctdWw95f775+kf6Kd3uhXaOSe5//1wwaWVeY9QYX
 yM9mbu/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOxMGf4nyRy6+VEnRlFq7fI
 GagKJv1//7Hkw7/YmsPPe/Y99eOVz2NkuJ8445EhV1vDy2cFLl7ntuvVZT55xxi3U6SLM/uNTEA
 fBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
> 
> Finally, I was still unsatisfied by the clock tree because there were
> too many root clocks. Many "gates" were wrongly set aside from the
> downstream clocks they would gate, and SYSPLL was simply not parented at
> all (?).
> 
> The clock tree now looks much more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Looks good overall. just 2 tiny nitpick and we are good.

-- 
Jerome


