Return-Path: <openbmc+bounces-2511-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A59C61DD9
	for <openbmc@archiver.kernel.org>; Sun, 30 Aug 2026 23:46:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hY80d5NW8z2y8d;
	Mon, 31 Aug 2026 09:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788095488;
	cv=none; b=mO5bxHk2pPy1yhwn3rVS9QjD87x+VN8C0o2PTy7R9IGGMLfhnlID6i74rm/fohL6kGtahT7zTeL1Dc+tM1NM6E26iSV/ivYf1ZttgADTAqS9u8UMFKdgsqM1yEkTWD+AEeDc2q5AlobfEceaIlpkAx0aJqQ7dZl18cfCITgpu0BuuyDmIX3Oq8JAc07lpsWWXXOW02q9KWzpSKLsOwFqbwn6Gy2xlUjR0L/wUj8x+T+mA/lm+TZGQslERECI+FaRurhznIuKLxjrBc1/SZvqydVaA+9VKi4v8IaN9im+dV5jS8C3Xohn+aYHGyMJpKlK+ySGDxwe/itcmwrhQQ+uLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788095488; c=relaxed/relaxed;
	bh=jKB91Fij6drewQFiv4G9toC8JIKw8NtMNFmKj8lVYwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ndAKeH+IBUlWfXffnW05RjS5tuRRjQ6dBrIwCc9FZ9Sojp3lEEzT5Lp8I9Y9E2x46LeCSmnGFlCtldj7U9ucoOrG/caku2sI0a8ahs8cFCP876X7JIZr0VN4F3janBsFPGTAsTwJOeko/hieC40OD6tjIZe8E+lkphf8eZf+qCAoUCreJgYJ6imGzv+3+Mj5Fkf6OwOT7uwxUgoz3yW/Xtk0hY/1/pw7mMVhxSZulN6MnWFnTSJMeMhfvwo4fuGJbRH/9aIugya/ZrDf36l7bZhJ88Wmo0SllKQtreV278ptNQrxm4r3tQCrJqf0gBI1H4bc8UxixIXzPv+jBE6/tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=pengpeng@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=pengpeng@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 314 seconds by postgrey-1.37 at boromir; Sun, 30 Aug 2026 23:11:27 AEST
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hXsvg1PKbz2xT6
	for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2026 23:11:26 +1000 (AEST)
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzm6KpRqe9GaBg--.26886S2;
	Sun, 30 Aug 2026 21:06:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: propagate reset deassert errors
Date: Sun, 30 Aug 2026 21:06:00 +0800
Message-ID: <20260830130600.560-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
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
X-CM-TRANSID:rQCowAAXGzm6KpRqe9GaBg--.26886S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1DGFyxKw13Jw18GF4kZwb_yoWkCrXE9F
	1kW3ZxXrn8CrZY9w15J3y3ZrZIkF909F1kW3WUtw1SkFyjvayUXF1DZr95Ar43Xr12gFy7
	u3WYvr4fAwnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUgXocUUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

aspeed_i2c_probe_bus() initializes and registers an adapter after
deasserting its shared reset, without checking whether the reset provider
accepted that transition.

Do not publish an adapter whose controller may still be held in reset.

Fixes: edd20e95bca4 ("i2c: aspeed: Deassert reset in probe")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a26b74c712061..bf29719bab1ea 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1023,7 +1023,9 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 			"missing or invalid reset controller device tree entry\n");
 		return PTR_ERR(bus->rst);
 	}
-	reset_control_deassert(bus->rst);
+	ret = reset_control_deassert(bus->rst);
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(pdev->dev.of_node,
 				   "bus-frequency", &bus->bus_frequency);

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1


