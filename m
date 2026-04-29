Return-Path: <openbmc+bounces-1865-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1302FF8867
	for <openbmc@archiver.kernel.org>; Wed, 29 Apr 2026 07:07:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g57f52SSpz2yZc;
	Wed, 29 Apr 2026 17:07:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777446429;
	cv=none; b=Sf/pDqewnQoNwh2+doCf6bGiMj83ccUg+m5AsRs34GQE2lUi4EmPxUd1i2hyIUblZJlF8208wMsKPqeYFYtWGfSAXBqc867LX6Nhx1LQjrbHzow1qJ4oD4y9Q0gJtJEH5fRgRwGuUlZiqJ2nuwSooTdRIT1fsmTNTSy8Ea1ksz/mBRrywN3RgpxlSWk6m79fBwRUYCQVCIpfBM4M3XSYB8BDGSo8BfohU+mG2IwTsm+N7ZG1zT16PrAkUjU9wvOEhhI9aUXdTsYnV8WoftfFHQ6a2knlDwdWO5tFJvMVymcxJsoXjdL+WEg/fzX3htGgudz/9+sMVEByJanZguMQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777446429; c=relaxed/relaxed;
	bh=KT6OP/ry6T+4MLBW8humFxHDSqRTVMMi018acs72cgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVmcy+xOjUSDCmDdzXiMCdTZ+2IuR4E49JQiQjU24jeznwGYl33rTf7/k5V4NtK9WAJGgVIMiL0nUBT2rqXQJMGcnrJ8yrz+tOblWxL7AZsIcWEVHW/9Dj9ckW72SMaLxJgIFVJ7VTofCWFaMxyvmkxi0JnfvqJC0xE0oLdwxgRXiSHzKG4ATS1/5fzkHe6llHW8mXmHv475/BA1tS7gPCrkXTNlCTh7LepEP0PB9uHlyAhSR4g2bB1ZwYasEBSGTrXbMgF4UKQhHz8R0r+WFy0GUw3x/Gu0/bVxHOC07GGwnpJmXb9zU+wNVF102y/oi45V4VzTNJPBjApqUVVQFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJQqIs7y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJQqIs7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g57f3008Mz2xQD
	for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2026 17:07:06 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a283c44478so19062649e87.3
        for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2026 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446418; x=1778051218; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KT6OP/ry6T+4MLBW8humFxHDSqRTVMMi018acs72cgc=;
        b=OJQqIs7ylO64PvELjj29KQJNfMEu4n9w2TATL5Ak8Q3V0JxCu3C8IOYc9E++vF5yzG
         zm0KarCl+1+tdhUbiyMZTZDC8LQ+v9W/WOvdQZwZ39UWFLWrle1ncIBWY1xG/grW8399
         +Y8fqjkN6ndHRnD9lkaN9PZbOAUVaiG+eFzoevayczt2VXA669WlmkyM+jSJINI4CjD0
         lQ76QH7gUJQ3ldVI0FnSO0nueDlcdg8KMLJ6R8/QtJtbTsK/FIrN1qQNlyO9GSvaaI2G
         197Fx+Eph92NQTnGYcOp+xhdYGSnVOse8vqFVGc1xaVMifZqug6A67RKa5QuQW81ySEC
         WiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446418; x=1778051218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT6OP/ry6T+4MLBW8humFxHDSqRTVMMi018acs72cgc=;
        b=TiDhN+pXwvLUyOdnqrm6RMR7EHIuI5+sP5wMXK9cHGAvXznzs89Nc5KW2UyNDc4Bpd
         sR4UWd6482cCmrdWsmuFqTCfcE+jVQelNIeIyJV4vdtkJ22OOdahdpoziKCKvAynYW4W
         qdamcTAK0Np5U0q2olo51uBKJHbe3v/4hOn6e03hUV4TLNQPY0WjzD02dTrmoPaVyFIA
         15QGdTttQOD95vpWcqgCZiey3y7UuvGewXp30r7D7oYiGc4upViXahXtFA554TgcLrht
         Ynbt0IZ/YpPwuylLDDEjiuNqUQEOwAeO6cGwqpFr2k/KHC1mfOog31OF9Y20ZV5BfK7j
         afhQ==
X-Gm-Message-State: AOJu0Yy9FjDMAnU+5fbpDDW6g8aTYOGZQI7iUMS0lqD3mF6s49oYJn5r
	Z3F+qh/cbkCB2BS9z8XNpAq5mLFYIuSgk4EoMDNVMsqBQfHMUP4Q8QfwNOFMcECv
X-Gm-Gg: AeBDieuHRWZFZxOrY1XGObT0oFqjxyLfkiViK932du7NRHM+TijomNhv3nWgANSH/qZ
	1KwH6jLjQG3Te5sCB7kg5ZqP/KSxy/C0kZZE4XaW5VXBTU7mraV2mFGDi9ohMbJnrzboAkhuNxO
	N6IfmlhwhZCFFABqsF4cHzbe20axuJVuE5Xw1Ej/ff/+hw+fH6EzMPYSZv8Zb4y9i12k60ZKVAw
	nwOn2SJ9L5GQm3JuHX/J7nMHcDuAheP0mcpCbgSxX8nsGvLaeSEMbq8wDJ91YTV1uj2+ECPPuY3
	FdQEeCuALYQ6mw4iXMueh6k4YFVYPhPu0EA/X4DD+J7tzb0zake+GwWtt2HPq66RhNr270zP4T1
	HUdJlBhQHeW5sSPFeI+oarTIhkt/pCmen0de4I0N79BcreXAOdyWv3LlVmZrSBUaF/qFc4pkgeb
	6YkSH1B8L2PCA98PRUIRhvFQZ31L2kCgSF
X-Received: by 2002:ac2:4c4d:0:b0:5a4:175d:1278 with SMTP id 2adb3069b0e04-5a746603823mr2324098e87.1.1777446417174;
        Wed, 29 Apr 2026 00:06:57 -0700 (PDT)
Received: from PC10411.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5a74a773599sm301035e87.77.2026.04.29.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:06:56 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: [PATCH linux dev-6.18] eeprom: ee1004: Fix build error
Date: Wed, 29 Apr 2026 10:06:47 +0300
Message-ID: <20260429070650.28931-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Currently driver compilation fails because of the undeclared
'ee1004_groups' variable.
This variable was deleted in the commit
79d0df36b541 ("eeprom: ee1004: Add nvmem support")
but by mistake was used in the commit
1b9ab93850ac ("eeprom: ee1004: Add OF matching support").
Remove 'ee1004_groups' usage from the driver to fix the compilation.

Fixes: 79d0df36b541 ("eeprom: ee1004: Add nvmem support")

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 drivers/misc/eeprom/ee1004.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index 639615749e2f..e1a571b77de9 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -347,7 +347,6 @@ static int ee1004_probe(struct i2c_client *client)
 static struct i2c_driver ee1004_driver = {
 	.driver = {
 		.name = "ee1004",
-		.dev_groups = ee1004_groups,
 		.of_match_table = ee1004_of_match,
 	},
 	.probe = ee1004_probe,
-- 
2.43.0


