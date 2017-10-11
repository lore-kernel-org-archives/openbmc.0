Return-Path: <weiyongjun1@huawei.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=weiyongjun1@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 373 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Oct 2017 21:52:30 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBrR23DwxzDr5S
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 21:52:30 +1100 (AEDT)
Received: from 172.30.72.58 (EHLO DGGEMS409-HUB.china.huawei.com)
 ([172.30.72.58])
 by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id DIV89342; Wed, 11 Oct 2017 18:45:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.301.0; Wed, 11 Oct 2017 18:45:47 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Joel Stanley <joel@jms.id.au>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Jason
 Cooper" <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-i2c@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH] irqchip/aspeed-i2c-ic: Fix return value check in
 aspeed_i2c_ic_of_init()
Date: Wed, 11 Oct 2017 10:50:23 +0000
Message-ID: <1507719023-127618-1-git-send-email-weiyongjun1@huawei.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020205.59DDF667.01A0, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8a13449f66e8a4ac568d3adaeac3bd09
X-Mailman-Approved-At: Fri, 13 Oct 2017 15:36:15 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 10:52:31 -0000

In case of error, the function of_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test..

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index 815b88d..f20200a 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -76,8 +76,8 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 		return -ENOMEM;
 
 	i2c_ic->base = of_iomap(node, 0);
-	if (IS_ERR(i2c_ic->base)) {
-		ret = PTR_ERR(i2c_ic->base);
+	if (!i2c_ic->base) {
+		ret = -ENOMEM;
 		goto err_free_ic;
 	}
 
