Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3E0C433EF
	for <openbmc@archiver.kernel.org>; Sun,  9 Jan 2022 13:27:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JWySG0Bmtz3bVG
	for <openbmc@archiver.kernel.org>; Mon, 10 Jan 2022 00:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.42;
 helo=out30-42.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JWyRm4j3tz2xYK
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 00:27:16 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V1Il5dP_1641734775; 
Received: from fdadf40dcbca.tbsite.net(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V1Il5dP_1641734775) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 09 Jan 2022 21:26:48 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after
 timeout
Date: Sun,  9 Jan 2022 21:26:13 +0800
Message-Id: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 Heyi Guo <guoheyi@linux.alibaba.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The memory will be freed by the caller if transfer timeout occurs,
then it would trigger kernel panic if the peer device responds with
something after timeout and triggers the interrupt handler of aspeed
i2c driver.

Set the msgs pointer to NULL to avoid invalid memory reference after
timeout to fix this potential kernel panic.

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

-------

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c950..3ab0396168680 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		spin_lock_irqsave(&bus->lock, flags);
 		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+		/*
+		 * All the buffers may be freed after returning to caller, so
+		 * set msgs to NULL to avoid memory reference after freeing.
+		 */
+		bus->msgs = NULL;
 		spin_unlock_irqrestore(&bus->lock, flags);
 
 		return -ETIMEDOUT;
-- 
2.17.1

