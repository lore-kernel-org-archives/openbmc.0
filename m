Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7062606A31C
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV36hIyA
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbZwl1tY9z2ySY;
	Sat, 28 Nov 2026 01:07:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795788422;
	cv=none; b=bfkacR5+QvczrVtdVUjveAdeX6oNH1yjSQjrJpsPNNWLKhynH2KD/dYBv3+DD9j4KaYjkK+Wux3V5s9VgoJLaO6xbZx2QcqFm4wksHpHvfnbxLYjNqSShHyDiTutdFkdudRO8KNV0FiaN9TIYQAgV60QBGeAC3KP/T7Muy6kIFMPtx5kl99Y18HLlkqeXZW3jloWYybbR078ti0Wn8RVf5lndTcjA6t0WHJ+x+19aiym0xN5IthvVXzCCw/+NLJSiZONRv5p0mcN4deP4njXtn+wu0n4x+uFPwF2+ocx1KpcCR+wH2gCG0bYRioIDbaTLyGHUP6o39fwr4in8wyFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795788422; c=relaxed/relaxed;
	bh=uNUonCSje6cN/9VgWCRU4BluxhQF/CKb3stuIn8gK6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VB2Jdhp0dtUa4btmPYPi8OkpmfdD5+MmgF6Aq0dO1mLJdS+kkFSagW3AWjGi5tcR/Fo6pKM+PNEeyi0n6DM48dsMgA7MpAAFedA27wqNxv00qIqrv6REN24jWYyDb7boiM4rbJr/wEzjbLqNlrO6jF5ZvQg1ytpr0WV5kqtv26xOnEIz/KRwHcX96LvY8TokcNFsV967iO3tYwoEBiWT9JCELBO0RFwIspciXWgkeOvGrJXOnsdUwkLpBTEMv9+GBVghcNs8NnXenS+xdyIhvtBRRMVxeEqFcoZmdU8/KqFgYeFpYwov/YzvDnl4dlF6n7nz6sZjNjFDfNES0qVDUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV36hIyA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV36hIyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbZwk3YdJz2yLH
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:07:02 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2DD94481F;
	Fri, 27 Nov 2026 14:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267911F00924;
	Fri, 27 Nov 2026 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788420;
	bh=uNUonCSje6cN/9VgWCRU4BluxhQF/CKb3stuIn8gK6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bV36hIyAeeaKzStqZ5R6BHZh20r32LzuGK4Gm68ZCpeAeuz4FlcKODY67wQXGl18L
	 qhz/RMcxsxB2724fbx9/w2S823Krp92tbDIdz7Wjsp7zqt9DxL9qVLU9CACrhHmzre
	 ylrGqUw3rUz1mT5iVjdTi2kG9bRir7oZ9jJcGOUJZ9wzlcSqTXcBfcllWsdXxF0IYP
	 vVS+tuBbMdme5k8hVYX09rN3BdjAwFlZGDHjKU08CG72jY55vuxpuD3Wbf9jjHOiqY
	 i4KEVyHPDf5If9Dyv63xi7Mkz1oJ8u0NkQ9XgA3FmY7Nj5bm41ELYUG4OuWMuL50X0
	 hiAUZOS0GbEHA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linusw@kernel.org>,
	tomer.maimon@nuvoton.com,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 07/12] pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in probe
Date: Fri, 27 Nov 2026 14:04:55 +0000
Message-ID: <20261127140602.2790001-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

npcm8xx_pinctrl_probe() logs an error with dev_err_probe() when
npcm8xx_gpio_register() fails, but omits the return statement and
returns 0 instead.  Propagate the error returned by dev_err_probe().

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-cff468bb-80b4-4cb3-a5ff-2b3a8fdb151f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 40315e89b839..bf9eb1f0e5aa 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2597,7 +2597,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 
 	ret = npcm8xx_gpio_register(pctrl);
 	if (ret < 0)
-		dev_err_probe(dev, ret, "Failed to register gpio\n");
+		return dev_err_probe(dev, ret, "Failed to register gpio\n");
 
 	return 0;
 }
-- 
2.56.1.839.g22a8290db9-goog


