Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA2F606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:04:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTYr19Lpz30Pp;
	Thu, 29 Oct 2026 14:02:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793242975;
	cv=none; b=VpKw00DFLoDM3TF2IalCJlXcyvtVHVIJgllG5uGHb8EeBeXZ+9og/AAv1hfq4BEbAvqoi/3dEiUbxZ8KGTqxQfXJKBVfJZix1lr/9x2ju2q0Q933/GGfAcHJP8QBRcgHZboYZK44VpvfZmJp/6mwSFpEP8stY9Gmcgm37ZGfxJxLB+T7QtmvvV6TUxvYUZWU5PZvGN8XL/6Y16UTTZhlFu0mu89OOULJUSwaUUNRxHGkTQTfd1c2vN01djsCYA4oov5+kf+JjEvEWV1rA+oqn8bynMz+h1SVh0ohAV2HsTLX7djjgk2E3iWbIDLVFl4ewOlBHzT1XlYPUDIVtbo0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793242975; c=relaxed/relaxed;
	bh=ObNICfGPcH6BGX8QdlUt2GqrCzWDcpQoe8uJURqriJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9pbzjzebBVRFcuZHbdaSUeyomTfS8xM74IyTxHkfAR2EpytXt75urkkistrrpp9lr3wz0bSmv9GuJDKREM7FDQ3ilyz9T5wJs8715p5UOB+45J2WuHvs/VNGhQl8FulEKuRL5tX6oTv5CatcRqt5JjNvwocxOuVy5zYx3U21kZZzRePHzrnnR9gFt6wuJAhZD6xx3Ypfh9Uct44OZ+zRThA0cZl5dOvUPHtmRJLHbtpvHWi4rGFV1pYigU3yu65BAXy/1F/UGrR1L1dkB0G4utydAMAQdzUFduWfN7z0aeuwA5cdiJzLZu7bfk1GK6vfydw7rYkDp3CPtviCT4twA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTYq0tvvz30NF
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:02:55 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:02:25 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:02:25 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Michael Pesa <michael.pesa@icloud.com>, <joel@jms.id.au>, Thomas Gleixner
	<tglx@kernel.org>
Subject: [PATCH linux dev-6.18 6/6] irqchip/ast2700-intc: Disable all interrupt merge banks on probe
Date: Thu, 29 Oct 2026 11:02:21 +0800
Message-ID: <20261029030224.470029-7-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029030224.470029-1-vince_chang@aspeedtech.com>
References: <20261029030224.470029-1-vince_chang@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Pesa <michael.pesa@icloud.com>

The INTC0 interrupt-merge (INTM) space has 50 sources at 10 per bank, i.e.
INTC0_INTM_NUM / INTM_IRQS_PER_BANK = 5 banks. This is reflected everywhere
the banks are indexed: the aspeed_intc0_intm_routes[] table has 5 valid
entries, and the mask/unmask/eoi paths compute the bank as (hwirq -
INTM_BASE) / INTM_IRQS_PER_BANK, spanning banks 0-4.

However, INTC0_INTM_BANK_NUM is hardcoded to 3, so
aspeed_intc0_disable_intm() only clears IER for banks 0-2 at probe. Banks 3
and 4 are left in whatever state the firmware configured them , which can
leave interrupts enabled before a handler is installed.

Derive the bank count from the source count so the probe-time disable
covers every bank.

Fixes: 07825e41519a ("irqchip/ast2700-intc: Add AST2700-A2 support")
Signed-off-by: Michael Pesa <michael.pesa@icloud.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260722050243.298355-1-michael.pesa@icloud.com
(cherry picked from commit 34b7e953d19a39515f8fc6c0820ebf243ea6b026)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/irqchip/irq-ast2700-intc0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ast2700-intc0.c b/drivers/irqchip/irq-ast2700-intc0.c
index c85b98a19bd4..1e375e9dffae 100644
--- a/drivers/irqchip/irq-ast2700-intc0.c
+++ b/drivers/irqchip/irq-ast2700-intc0.c
@@ -48,9 +48,9 @@
 #define INTC0_INTMX_IER		0x1b00
 #define INTC0_INTMX_ISR		0x1b04
 #define INTC0_INTMX_BANK_SIZE	0x10
-#define INTC0_INTM_BANK_NUM	3
 #define INTC0_IRQS_PER_BANK	32
 #define INTM_IRQS_PER_BANK	10
+#define INTC0_INTM_BANK_NUM	(INTC0_INTM_NUM / INTM_IRQS_PER_BANK)
 #define INTC0_SEL_BASE			0x200
 #define INTC0_SEL_BANK_SIZE		0x4
 #define INTC0_SEL_ROUTE_SIZE	0x100
-- 
2.43.0


