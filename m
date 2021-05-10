Return-Path: <SRS0=tH7v=KF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45F6C433ED
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 12:09:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D35613DF
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 12:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D35613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff0Gw4qnjz306k
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 22:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BzLt1oXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BzLt1oXD; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff0GS14gbz2yWQ
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 22:09:17 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id x2so22947279lff.10
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NJng7PQC67RAAaiNCrNQGjU4OkvKZ2vfyKzArqYrHk8=;
 b=BzLt1oXD+h6+ZbMDkdKtH6riILREsFoJfikq/iyagzNPpkReMuMxGgaFYTHl3HviNV
 tdp0UboOwTinDRyV4nqK8xb0eZx/or0hmZY6Xw7tIwpXmwdVEkB+LSbVb9U0ates6fIF
 wly7/eIM4mVCXuPnuCr4hGktlNy64XSIyxt6zLkGKV9UNIPad7EGvjFZmKDY0O/J05wV
 5yIPHhVx7w12RTteKKGV0PZqFnBTLHWBGNzsDe0nUTKmoakwCyC7sEpkcBAiDSIGXMUO
 PKjjr1Efo+a10rX3QbOV9uHSZjpKodgPNMN96Sq7BXLTxVNpw1QpUwORkV1kBOVZoxjj
 ROVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NJng7PQC67RAAaiNCrNQGjU4OkvKZ2vfyKzArqYrHk8=;
 b=fB5isNds9LFng/8MigJ9jHPGEcGup8vI4ZeI8HM2RQZi+yDNJnWkAK9sXn9VehyFrR
 wWg/tiwQ+8YRTjg4aGTMf0eGOH3y2Wo3ZOFwxLPUsDdzWQ/CzdaLfxPnfWgmyZBwdkip
 x90S63fG/nFolR8xfmVldqZz5/d156TVb/CDj6A1DhReBS/LpJfP1a38Lefclxd8fLZG
 b8zyHbLuqv8AY0U/SkxNWwmQhl1MMKvvRzkA/wsZZNOw1dNlW/teu2+1LCL1KcT2D5bY
 hVhcpqtxPWbT5Xo8dd0aGi4ZqouEAp4rHhxD+5sVMHbFCBcNU10FNKv5A8+d6yr9EgJ5
 LyMQ==
X-Gm-Message-State: AOAM531MNJdGjHsTDQVqN1CYaXMEgo9nAdIcJqbBMCUsu9MoPTWCXBt7
 WJkG4Ye7N8ftGwLGtHU5/gjs8/vie2jQDyHuyS642tV1qS/J
X-Google-Smtp-Source: ABdhPJzqjQzQ/7RWzO/tHFYl7RyRT7q5dIlgCK5ZVQYSwxvor6zo6lfU5nvwPRN9gfneNIbkiWA4x4uqtNW4e9V5VWM=
X-Received: by 2002:a05:6512:45a:: with SMTP id
 y26mr16647412lfk.128.1620648551677; 
 Mon, 10 May 2021 05:09:11 -0700 (PDT)
MIME-Version: 1.0
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 10 May 2021 15:09:00 +0300
Message-ID: <CAKKbWA4YJZPuC+b8+ud-PW=ttfR_rmVG6bEtuYfkkmi1a6EtQA@mail.gmail.com>
Subject: [PATCH] net: nuvoton: emc: Fix: some failed phy functions did not
 return error
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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

Fix: before this fix when mdiobus_register() or phy_find_first()
failed the function did not return error.

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
---
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
index f07449e2f68d6d..4d9fdb6088a1ac 100644
--- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
+++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
@@ -1801,7 +1801,8 @@ static int npcm7xx_mii_setup(struct net_device *dev)
  writel(readl((ether->reg + REG_MCMDR)) | MCMDR_ENMDC,
        (ether->reg + REG_MCMDR));

- if (mdiobus_register(ether->mii_bus)) {
+ err = mdiobus_register(ether->mii_bus);
+ if (err) {
  dev_err(&pdev->dev, "mdiobus_register() failed\n");
  goto out2;
  }
@@ -1809,6 +1810,7 @@ static int npcm7xx_mii_setup(struct net_device *dev)
  phydev = phy_find_first(ether->mii_bus);
  if (!phydev) {
  dev_err(&pdev->dev, "phy_find_first() failed\n");
+ err = -ENODEV;
  goto out3;
  }
