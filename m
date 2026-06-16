Return-Path: <openbmc+bounces-2105-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF0ACD98DA
	for <openbmc@archiver.kernel.org>; Tue, 16 Jun 2026 10:35:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfk040G3dz3bt2;
	Tue, 16 Jun 2026 20:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781606115;
	cv=none; b=Mz9QQ38qYgAufpR5vMGdyvgyf26DBfMIJ6oH5tdKR/sSvlyZB7E7+CwO9EAoPU3GKIx7aP8dRiF0j12IMIRKxRKJCK6pZw4IHmxG0nO2sARsQYTd9ADBfUh6J+RUcgEMK4KNWxQAEzpy0G9+P0WLhrLEbEqJi6cWoTc10iQlOOEUr7ll2hKTe2R7dGgPMUKlSf7DYP4W9HmlkRv6/CcN+455Q5Jqm1bw49FjKm4cg5aVFVWrJ4rUD40Gou5g4b5+nR/ziHq6MCxhLgOF/ZHpBAIhjB9ebJ6hk1Pp+X7qWkYilR7kNZ39CWVoC2dDccsBkXR1alS5HUhz3An1k6GXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781606115; c=relaxed/relaxed;
	bh=CR0IsEvrozyczXDOOrou30qVP7P+36a7TB8eBq/npug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3I0Ny40k24HDbQnEgXsI3R7It4dun9opPd85amJMnPdHUZME3UUHmREin92jQvmPfI8f/wyBZGwpwAZ8IEBqyN6X2ATOVLJX3BU5II1XseeKSUI1uCFq/QFqaO6HG4JjSeXA+GbnSfpwYmo82ZpCHyjDHr2s0owsk+XBkDbej0EFVohc0N59DAbfvPEAWqslSgIGZD4thbjLReQElSarUdURFjJZ2Mp3maUddvRkLFz8xprj1jIuPI6BFU5cmphzepjUJKSL5mHBavAwmVYq+0XckhBd5hg6vJGhqHL2wb/a72O2rYxD0EwHBg9CAEc4DiPbxaI6aR3luoIpHPREA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B65/HULJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132b; helo=mail-dy1-x132b.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B65/HULJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132b; helo=mail-dy1-x132b.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132b.google.com (mail-dy1-x132b.google.com [IPv6:2607:f8b0:4864:20::132b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfk024sGSz30FP
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 20:35:13 +1000 (AEST)
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30b6dad2382so4091390eec.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606111; x=1782210911; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CR0IsEvrozyczXDOOrou30qVP7P+36a7TB8eBq/npug=;
        b=B65/HULJfifayI94GbraeUWntiYzN8f/ba1P0rM/g15sEJkMchCnhGIoF/H93LYEr9
         8Bbzn6yOfXF2UxkOPGWxZxtC8KcWAERkgBnq31yqqIIR/ISegHmgapVtfWEX/50+tUxd
         S4wD0yqDIZspLS/FMZ0lDE8Cd2f38f14PsZVesnFxr2Mx04gcaGybLvEUeeqo0oggar7
         hfJL6ggjHdY713G8NRXh+Cz4hKojFoR8jecRDJN9ucpQjR4EZS7jZLDClaDdj3mf43Km
         zXgKN+qlS90zEjZJqP3/hbJhcyI/4ANXORuFdXnduDmUc5q8zVzOTqrqUabitpk+ufHI
         Xh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606111; x=1782210911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR0IsEvrozyczXDOOrou30qVP7P+36a7TB8eBq/npug=;
        b=ZXjpXgmxfk0LMCS+2VtvJlNiaPfmerhhcC2m0Lsdu7x5E4wV4KjDaQLeLWGp+lXcvd
         tgICOWDPcYfudcWqyE/cA459+wbWiyQ+ba8ehTvs+LVGcCKZT6FM0oaW0nzCobg+Y29y
         vi0jxg2OxZJBeYBGjrMuqkc/CVVcjVvx2Ha5zs0Q3jCixyBcqCxktpkSSvZ+qIhqRz9o
         IqeiIaoi4JVE1ofSP8EZXixRvu5+RZRzVIYmvFXpDfCepYZXasXYyGdiejeohsc+xiOi
         sMeiu7yGI91ELC+7cQpH+a/735h20i+ePsXuGn+7lEPnWqxwzUvZZFXsgkp346IAAj4d
         L8jQ==
X-Gm-Message-State: AOJu0YwNLZyaRfxScdl6cuK1T02/83T0lp6FP+NkSldMELKydvaNZ3d9
	33MS9rEhvNTwXvQOyep+YDDJKVx514QIApDPv6lAdHlZ3StcZHNZekMZsckSSA==
X-Gm-Gg: Acq92OElEkFEZVpynCfNxEQCqXfoNfOs3uHeZkYSnc+7Bn0ZNHiUGrDXwGGfqwevlb8
	2gXTiSXdI7g1MvpSi5N43z4tV9XlVlNZtDObgeI7rom1PWFnihERdtR5ie6S/rAecVR27ZjQRsM
	es3qkdbxn4+z+LlXnCgRIAQzN+nvy6w4n3IOuk6+fIy49rO50ZdDmJeeuNTQP+15pnun83NY2KX
	u70q5S3IcNLSOylvnCgsOuBFlBOyQ5a/iz3QL+J2o9rG6z7tiOJx00dZbShHLwCQpWKpbl0WiUa
	hpiH06Ju7FXmuAqpiyUyTNyrvlDizD/UIgLTsGTnZ7Od37zB7WxMgY3qyBn+LRbob4b/ROU4931
	zV8/YNfJwCCSxzoHUsXC71z93VNg+yNHJL2tWaNO7xP8OVnUOnkAzsaNzCL6lks2AU2M88QPTQk
	mvJ5M+JrRq97aLocLYia7wfvLNCyqy+ldckOST0yekFTChaKJiugVTftO/sMVFXRfvkKVA/FmaE
	TDj82AWUTW/DgxRqIaa+KQ=
X-Received: by 2002:a05:693c:69d8:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30b8860a6abmr3118254eec.23.1781606111162;
        Tue, 16 Jun 2026 03:35:11 -0700 (PDT)
Received: from java-bs-ipv4.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm19946748eec.8.2026.06.16.03.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:35:10 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH linux 6.18 1/1] hwmon: (pmbus/lm25066) Fix PMBus coefficients for LM5064/5066/5066i
Date: Tue, 16 Jun 2026 18:32:57 +0800
Message-ID: <20260616103259.2426892-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.52.0
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
Content-Transfer-Encoding: 8bit

Swap the high setting and low setting coefficients in the lm25066_coeff
table for LM5064, LM5066, and LM5066i. The coefficients were previously
mapped incorrectly, resulting in inverted current and power scaling.

Additionally, dynamically assign the exponent (R) registers inside the
probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
exponent is applied (e.g., for LM25056, high setting power exponent
is -4, but low setting power exponent is -3).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Lore: https://lore.kernel.org/all/20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com/
Github: https://github.com/torvalds/linux/commit/83dda7ed185501ba1f8165aeca83ff4a8ef7c263
---
 drivers/hwmon/pmbus/lm25066.c | 54 ++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..6e23ada64e2f 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -132,23 +132,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10742,
-			.b = 1552,
+			.m = 5456,
+			.b = 2118,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5456,
-			.b = 2118,
+			.m = 10742,
+			.b = 1552,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = 8524,
+			.m = 612,
+			.b = 11202,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 612,
-			.b = 11202,
+			.m = 1204,
+			.b = 8524,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -167,23 +167,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10753,
-			.b = -1200,
+			.m = 5405,
+			.b = -600,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5405,
-			.b = -600,
+			.m = 10753,
+			.b = -1200,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = -6000,
+			.m = 605,
+			.b = -8000,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 605,
-			.b = -8000,
+			.m = 1204,
+			.b = -6000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -202,23 +202,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 15076,
-			.b = -504,
+			.m = 7645,
+			.b = 100,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 7645,
-			.b = 100,
+			.m = 15076,
+			.b = -504,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1701,
-			.b = -4000,
+			.m = 861,
+			.b = -965,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 861,
-			.b = -965,
+			.m = 1701,
+			.b = -4000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -519,18 +519,20 @@ static int lm25066_probe(struct i2c_client *client)
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	if (config & LM25066_DEV_SETUP_CL) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER_L].R;
 	} else {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	}
 
 	/*
-- 
2.52.0


