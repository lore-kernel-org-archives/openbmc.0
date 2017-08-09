Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS1ZD0mJvzDr2v
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 16:29:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MPHAu8ds"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MZrnyTxC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 593A421D8A;
 Wed,  9 Aug 2017 02:29:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=nzpy4AFz5RRQ/dXQA1fozxAB2mDJVh
 hr2zzPzm7M/Xo=; b=MPHAu8dsYvjRXQ4uGHBbGcUMgqw17THOSP14TI9vt71/yP
 bjZq/eA7WLNNvRq2lk3t5pf32bDnJrsL+U9IYGkX4GfYEENM1AGEtiwSxj5YZOEy
 bvXZMAHkuzcURaxaDx7FBfVU5oK3haP7e3r7hQ6JOY8X+8KWcFAGP7dm8F5adxZE
 43hBxM0msoOR3u+DGt0YAJNJViSk6eOUyo8XYxwv/plrVhi+bhoXY8BFVti/99bL
 LCQL+wJhiWnICjrWhHqorih4PCJlRvIAbRxwSX8M1Sh7KKo/XgbkMn1FdPNueorh
 t4+o3+rZyOw1T3l6DMRYZxWVdsg0ZDim4CMFf7fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nzpy4A
 Fz5RRQ/dXQA1fozxAB2mDJVhhr2zzPzm7M/Xo=; b=MZrnyTxCMDs42zcBST8aUr
 dxu0DhXV7oHZQc5wctzS5F+frdfLDDsnVgK47Oshe+em1zNVNu52RohmlUDxLGI7
 dZXdgiY6p8jDzcHYI0bUuSwrMffZ6s8t1hpTikwar0oRnus7r2WgaC+WX8/HZlLU
 YeV0K7TIWeKtyuDPJbIug2f1/cM0O+hEI185e8z9tfCpgYU8i0FGyH7rfmwYWeBc
 rIOj2ZsUry9QX+Ka5xr1UM9QJgV0xCeUawYb8Dtf3Tu6Ex/WFp5l2iZKVt7PJ0+l
 KrGXhMmfmWxxEFnmLURMyPmLoSaWjyZ4++Yacobev1Q1IFx21uzTSyafLrg1BDgA
 ==
X-ME-Sender: <xms:sKuKWfWLSN2Yodx2hIbqNUuy0RX9w3eNA44oYD6KNPtBn3v8ZSfn_g>
X-Sasl-enc: AkqOGMNDlu4TbWKUtakKVm0+GpfI7Nzz9d0jmpw2a3VG 1502260143
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A0DB7E73B;
 Wed,  9 Aug 2017 02:29:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, joel@jms.id.au, f4bug@amsat.org,
 ryan_chen@aspeedtech.com, openbmc@lists.ozlabs.org
Subject: [PATCH for 2.11 v2 0/2] wdt_aspeed: Support reset width patterns 
Date: Wed,  9 Aug 2017 15:58:25 +0930
Message-Id: <20170809062828.3673-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 06:29:10 -0000

Hello,

These two patches add support for the reset width configuration register in the
Aspeed watchdog. Initially this was just one patch[1], but I've reworked it as
two to explicitly support the varying capabilities between Aspeed SoC versions.

Andrew

[1] http://patchwork.ozlabs.org/patch/796039/

Andrew Jeffery (2):
  watchdog: wdt_aspeed: Add support for the reset width register
  aspeed_soc: Propagate silicon-rev to watchdog

 hw/arm/aspeed_soc.c              |  2 +
 hw/watchdog/wdt_aspeed.c         | 93 +++++++++++++++++++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  2 +
 3 files changed, 86 insertions(+), 11 deletions(-)

-- 
2.11.0
