Return-Path: <SRS0=cdlr=I5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EDFC433B4
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 22:38:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F69861056
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 22:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F69861056
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9h7D6lrCz30Bm
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 09:38:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Kgc+9Sik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wak.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=33flkyamkb24imwsaasxq.oayabqznyoxuefe.alxmne.ads@flex--wak.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Kgc+9Sik; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9h6q70RKz2xZP
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 09:38:25 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id x8so3862239ybo.6
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 15:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xhwibL3PhF+o0xJpVUO8W1dDnF18zqErSXXEJcfBeA4=;
 b=Kgc+9SikmAOblOitJGhHwj60eTBCHfDn3M4xqBEeyxNj+Pbi0V8GUrmokq2aaKJczb
 +ZwKjHcmxP9xFpMwPqhWv+rvCznln0M/xsR8cvEM9apqnNiSVTy/o3CcvgiDcsppaCMA
 wZzsncY/Ro19rESfGXe7OXimExh9MLh1d2Ex0dQ2l86zDsx7rue0LVHsOqvkLgguICOA
 o+IRD01h6nZH8OUr5TWPXViNKSnLbpcnJOMeltljZ3cY5JxgN41TKA5zn0kLh0vQbpD0
 SjLO8tbUda2Lk51eMjpa1xHaMazZElHmVr0/jaCN1FfQbkaX8YOep2Bm5keSyQw6tL2h
 1mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xhwibL3PhF+o0xJpVUO8W1dDnF18zqErSXXEJcfBeA4=;
 b=i9KmiIAkXyLNXFX6vFyUFokCSX1e++KUC6B34bS7Smz+PJP/pErOy8cyFh/QuoTXSi
 7PBM84umjkd65G9++yxQ3oYUCZ5+84ReqUVvrwMibSjEaPLXxyXVe8ejnsF6R2Hp1DOu
 ajcFY7F2LNcGbZKqIYxvYm9RnNvRhHDnqyxFF8xsF3MeFHV/NM1Du6Smz3gihfnYO8XM
 ZuupC72vG5knquzokg3O8D9n5D6iTKIkej8z3naySjtNyiowcJT1mVnE1juCBwJMcWIv
 Y1D3z9SDbV5nDa7E1+TsbPU7FUQ9Yzsp7wD7i+HWmoY7afhs4kIMk2d/TaR5AxQhKboW
 0nXQ==
X-Gm-Message-State: AOAM533DG8Bw2tpN9/1TiRRwSGSlQwi1YnbL5//odakR5Jf9snPq+TbL
 /qYqPIiS4OdyF4G/4SWUu8TjNMzbsNrB/fcKuPvfSWWeqRp6G3cW8l10K9lsa5OxkF9lQbF7Z8V
 YpjMqqlHAG2qAj70KzjQrjSvK0Wxndbr4UTR/RukiwTz/IS5yCMiY1aQl
X-Google-Smtp-Source: ABdhPJw1a+go4JHtWCSIaz7JSvLUS99AIRvX6DoSUH+neGvEEtVEHD9AboqrxBZhnD3NyEcn/iqYJLc=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:3:f09c:9c69:d30f:bc77])
 (user=wak job=sendgmr) by 2002:a25:aa63:: with SMTP id
 s90mr7746012ybi.393.1617230301780; 
 Wed, 31 Mar 2021 15:38:21 -0700 (PDT)
Date: Wed, 31 Mar 2021 15:38:15 -0700
Message-Id: <20210331223815.2994650-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH linux dev-5.10] net: npcm: Remove superfluous logging
From: "William A. Kennington III" <wak@google.com>
To: openbmc@lists.ozlabs.org
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
Cc: "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Any queries of the ethernet interface will enter the settings functions.
This causes dmesg to fill up with unnecessary log entries every time the
phy information is queried.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
index 3e9b8b68fc55..28aaee3e80ff 100644
--- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
+++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
@@ -1773,7 +1773,6 @@ static int npcm7xx_get_settings(struct net_device *netdev,
 	if (!phydev)
 		return -ENODEV;
 
-	dev_info(&ether->pdev->dev, "\n\nnpcm7xx_get_settings\n");
 	phy_ethtool_ksettings_get(phydev, cmd);
 
 	return 0;
@@ -1789,7 +1788,6 @@ static int npcm7xx_set_settings(struct net_device *netdev,
 	if (!phydev)
 		return -ENODEV;
 
-	dev_info(&ether->pdev->dev, "\n\nnpcm7xx_set_settings\n");
 	ret =  phy_ethtool_ksettings_set(phydev, cmd);
 
 	return ret;
-- 
2.31.0.291.g576ba9dcdaf-goog

