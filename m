Return-Path: <weiyongjun1@huawei.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=weiyongjun1@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 930 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Apr 2018 21:29:09 AEST
Received: from huawei.com (unknown [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WvwP2mYqzF24d
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 21:29:08 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2C8E2CFBB546B;
 Thu, 26 Apr 2018 19:13:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.361.1; Thu, 26 Apr 2018 19:13:24 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Tali Perry <tali.perry1@gmail.com>, Stephen Boyd <sboyd@kernel.org>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <openbmc@lists.ozlabs.org>,
 <linux-clk@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] clk: npcm7xx: fix return value check in
 npcm7xx_clk_init()
Date: Thu, 26 Apr 2018 11:21:08 +0000
Message-ID: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2018 11:29:10 -0000

In case of error, the function ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index dba5384..740af90 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -555,7 +555,7 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	}
 
 	clk_base = ioremap(res.start, resource_size(&res));
-	if (IS_ERR(clk_base))
+	if (!clk_base)
 		goto npcm7xx_init_error;
 
 	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
