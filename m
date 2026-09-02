Return-Path: <openbmc+bounces-2522-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24DDC61DD6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:20:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0cQ2tt3z2yr1;
	Thu, 03 Sep 2026 10:20:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788362659;
	cv=none; b=jT+kclLYh+gpWvLjkXB0g63+xfj5kxsQzCjvJTsmHrpT/vkLsTAA0YgZUl3v4v/HDDZz4PrRJLWRcXjOgbWCuMco0vbBgWvGbw1CcQs7IQfi/0psIK2+3i0Xe4SPw/oVyUdtOCCHpQmyWMYES2vWLWolGh5i3CjVBegeUpojF1ZVH+VDDdTm06hXTN/MdEwxW7T0yCnKoB6nNQfg052fcOT0H1aOHLhRlHZpv80lzVeociOyTCjZwDqk4lEK+XhIyVfaAF3NrI3JSD93SVmYiOO011B2zOrukBn8RQddef8BXVKpZaFb+iEVo9NqHj9k+eN8M0NTHHHZplh2aPhw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788362659; c=relaxed/relaxed;
	bh=TRS6pZD0gWBW+I2u01vpUsFWHU2ENnJgfpVpPwcSxGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JeD552npRmdSxHRyG4msXWO5HaBI9QBP8o/87XVca9DCoP56R3OnODNC0GkOwKGpW2yOH/yX3Zhzw6NDZjAHSzfMUURLShpCU+wdpaeDlBJtbReBHOrtmmm8RxLvXp6G5SAzlJwAO48n8D7h7PZ/3FY1ciEE32M43gitB4WgCcbTUhYMXz/7A/srrS2diunHxOrzyr7ao53VcHjIskF1dj4tqPfMIPZIyHLf75jyGDVKxlEaul2bnxKv0qCZvjtZCTZdwcUapBD5ErmrtV0cG/r+Rqed4XdmGUHX9BEUmZly6bw+t51UL0P8RhhrAH152ME8LiXgIgywwzydvWP1pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=TImTtoJU; dkim-atps=neutral; spf=pass (client-ip=101.71.155.101; helo=mail-m155101.qiye.163.com; envelope-from=runyu.xiao@seu.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=seu.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=TImTtoJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seu.edu.cn (client-ip=101.71.155.101; helo=mail-m155101.qiye.163.com; envelope-from=runyu.xiao@seu.edu.cn; receiver=lists.ozlabs.org)
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hZmhh0Xhtz2xl6
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 01:23:27 +1000 (AEST)
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c491061c;
	Wed, 2 Sep 2026 23:23:03 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] peci: npcm: Initialize state before requesting IRQ
Date: Wed,  2 Sep 2026 23:22:56 +0800
Message-Id: <20260902152256.3591658-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa062b76f3003a1kunm3e6bdf361afe3e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHklDVkhDTEJNQhlIT0NPQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TImTtoJUXiD1qTIb0D6iXCOpnHCKrriXBqCjbhTmkXPj2AKqLzPqNheF1lXNn/qCdftmsxAbaMN9ybSXEZ9s4m7Euy9H8+9706e6atCkSRRvCzV2LJrrqwo50Iwy31S93bu+Iuc00RjMqefRtE1ZRqviwiG8k0T4+XsVgzjRpxc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=TRS6pZD0gWBW+I2u01vpUsFWHU2ENnJgfpVpPwcSxGw=;
	h=date:mime-version:subject:message-id:from;

The PECI interrupt handler uses the lock and completion object as soon as
the interrupt is delivered. Initialize both before registering the
handler so an early interrupt cannot access uninitialized state.

Fixes: 3e16184a1bd8 ("peci: Add peci-npcm controller driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/peci/controller/peci-npcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
index 931868991..3cc4e959a 100644
--- a/drivers/peci/controller/peci-npcm.c
+++ b/drivers/peci/controller/peci-npcm.c
@@ -253,14 +253,14 @@ static int npcm_peci_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
+	init_completion(&priv->xfer_complete);
+	spin_lock_init(&priv->lock);
+
 	ret = devm_request_irq(&pdev->dev, priv->irq, npcm_peci_irq_handler,
 			       0, "peci-npcm-irq", priv);
 	if (ret)
 		return ret;
 
-	init_completion(&priv->xfer_complete);
-	spin_lock_init(&priv->lock);
-
 	ret = npcm_peci_init_ctrl(priv);
 	if (ret)
 		return ret;
-- 
2.34.1

