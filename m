Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34293606A31C
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IfdeGbmD
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvvz3N17z30V6;
	Sat, 28 Nov 2026 13:52:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834350;
	cv=none; b=CaUBP+eCTdXi45K3yIVGdjWMKuKT9SILC4kFJVYiZnpI1V1TT2weHrxkQ9rrfJ4h0T2dDJyhDvAjRUIBbnh3f27eWeYew05MjdfJ837dFDsTonQnvFR0RpItNc029jPKwJDXSzBGEGubjEl8SjA20oFgQrd4mr8HI8tvM2oUup7H5ldG/8QAnI2ZmLN9chkUwWl+8yOc7FX8Hl+oUcCxbTlYR+tfyE0UiZL7dNlO/1V3jQySlgeNxp+lUvfZl5ACJCo0f591oRh80ex0Rj1jimW8UnpHfUkhP8uvo7JKqeoviiEFMQF8iCcZ0ZoWo1V0puzbpLb3zQQGE/uJ97nxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834350; c=relaxed/relaxed;
	bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hD0UQ5Wf0MVhiudsbXHY+CmDfdemdR7NGDcmuIrDC8toysXoGEV6u2sl9d9jZ++J97g5Vhyrmt3DO62t1OesJCOBZj5f0QZlSvYQ5vZTo3caK5IhxqvgM2oY/Op5BqkXGTtqq+4T0MFF73EM0z5ob8jDOxZYLXLNXdZSt2UY1zsXbJaJHEwKD4pksRK/zpKK0q5Qf+3XGMZJdyTzfLJ5FWqs4JCle206EwxlwlYG7je7pW7GE3iGX/e9J3UVrGSYYpd0PXtxJV/kuvcyz4SIQ8WdbcF2gVULnmnvZcogRuDLXgWGBHfMdRYxw6zjiCLagOd4fOeIdF+kiRfsbGLNuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IfdeGbmD; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IfdeGbmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvx2lRVz2yCP
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:29 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cde827b7b95so2908769a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834347; x=1796439147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
        b=IfdeGbmDZEoaTArjZznskgQkqpw/lPK3kk4Q1lKfUVcK/I2aMvGcRGt15tff6109yv
         tty828qSMiAbX7e8hieMKjQQdUw1sw5m70MeXWhRczeryLufUGpNSsiKiosFWnhJMDnE
         bn/X9lFbDiFNiW9/PmdqmoNUCrEp2GrMd1IlMSXD2kniIw2bRWx8LMKJa98dy0G4U8NI
         CYul6WqIis9Ef/HVjNnfHcr8KTb1GMDsKJMIIblLV/T/YVa8vg/DvRMqCbUsn1mGXbPO
         qkCgkHhEX8i7SoHD011gvd51k1dCde3r7zZxYAt6pjyrjZUQSNATjilISzloK+OLu2ws
         2Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834347; x=1796439147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
        b=ZVvycA0WcRAmse9tyrx/dJ+PRLLvkI9u2p9fo34ba3PSd1/HwpDNc5k8NV1jOTF9qH
         QKfC0/D+z7uKwTKm5sOgh6qAOJ+IUmScJX5BOF4ZL459mBglGV6sJPfE5ZHsNsljqmro
         8VnTibNul71TYDJOtsjNRaoi+aFR5BFeo/PuNRH6DpPm4U2UQPC5NbYMs9AiZrn5eRx2
         RlFWT9wcb6QqbNhFvo8jH45WHpqInyIlRqCaNPaSMHHdCr9GJ4pA3xSIZJ2HWUmuZBt1
         suA5CPWctuLStCDUPcs0tCQMzEX6jhZHMkb+wkqSwCOwtnJXRAHik1oGoGkkOK9CP5KO
         vLQA==
X-Forwarded-Encrypted: i=1; AL+hErFnh6PRNacJgbuqKhayxFV3awExmPNkyJxVQ7bWW7zFAEeeX3JiMu+xBT83KPKENlnHkuIw/rgn@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+jtZDOweLz1ZvIE7pGaF9FcWg7x2c+IlSMc4cP2Il8BkC+Ts8E
	93g4AL5iuVo3MNGzV/Ge/KWQlT83G5DBo9obwNhYqQOsdWhxa04U+u1VVRO7Svt9/98=
X-Gm-Gg: AZFdTZfcKz3ReKr0KYg0la0c0LOEI4adx/OT+m7CTrQyM07lU4TiMuR+JR4hQ0m1pqN
	Nc5TPZvk3F4p8Y22EdnepaJmzH91aKbWVTLRtlvmK4Ob9kWstTyM3/q5MsARLCrB3xWxTCUqxWk
	Ls4D0gYSp3k83If62eyd8joMSiyRH4oDlTQ8OWT16HqYaXxftnECumJvS/HYiIhirmgLTyN8FpX
	zQdlqWKOM0tXhUVONNVXJMrQ691oyxcd1qUk8El8OZeytR1Lkzxna0yzs/99CPnK6uVKbuyL9Xx
	paFuVPNy33OSxih3lNUOi5HK5e2zzmUKQxfJS8GOE4LBihcgwewsguVFQUR9pZwbP04ZpuFplRF
	DfODrNNemtIF83l/6kb8VZKk6CzHHw1Wwr9Oszt5/UvPTjICfD+tHbv9nlXR1gPSuHTe8FEkAcr
	z45CnCw/9r2b2GIo0y+X1TCiyO9J+loH0Upu3/dsRDxOCravVG0ZYlBQBU5tEwHCahEOcVgYuPg
	L3/cScLhyR/1CDh1td0aiZM2EHBqa6j96c8I+3OJUwmOhmScZcVLsYAH0E7eadnczr9LfH7tDKh
	1cNRyCoLTOepsOppd3nYXByLoAhL3JWomo/cnppZi86FpmWLZ5JVy2i45WHgXG59ClaYRDIkCjR
	BGCb843W9H4nNpQ==
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr24356298a91.26.1795834346952;
        Fri, 27 Nov 2026 18:52:26 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:26 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 1/2] clocksource/drivers/timer-npcm7xx: Fix spurious timer1 clock warning
Date: Sat, 28 Nov 2026 02:52:23 +0000
Message-ID: <20261128025224.2680046-2-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025224.2680046-1-william@wkennington.com>
References: <20261128025224.2680046-1-william@wkennington.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_clk_get(np, 1) returns ERR_PTR(-ENOENT), not NULL, when only one
clock is listed in the device tree. No in-tree device tree lists a
second timer clock, so the existing if (clk) check always logs a
warning on boot:

  /ahb/apb/timer@8000: Failed to get clock for timer1: -ENOENT

Ignore -ENOENT since the second clock is optional, add the missing
trailing newline, and check clk_prepare_enable() for errors.

Fixes: db78539fc95c ("clocksource/drivers/timer-npcm7xx: Enable timer 1 clock before use")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/clocksource/timer-npcm7xx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 9af30af5f989..c7377f30e95a 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -202,11 +202,15 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 
 	/* Enable the clock for timer1, if it exists */
 	clk = of_clk_get(np, 1);
-	if (clk) {
-		if (!IS_ERR(clk))
-			clk_prepare_enable(clk);
-		else
-			pr_warn("%pOF: Failed to get clock for timer1: %pe", np, clk);
+	if (!IS_ERR(clk)) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			pr_warn("%pOF: Failed to enable clock for timer1: %d\n",
+				np, ret);
+			clk_put(clk);
+		}
+	} else if (PTR_ERR(clk) != -ENOENT) {
+		pr_warn("%pOF: Failed to get clock for timer1: %pe\n", np, clk);
 	}
 
 	npcm7xx_clocksource_init();

