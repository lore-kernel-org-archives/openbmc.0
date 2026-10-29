Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C37606A331
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 02:02:57 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFSD16yF2z2ypY;
	Thu, 29 Oct 2026 13:02:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793239345;
	cv=none; b=TEOFG8SGux7olMT7MvFICAhclTSD+z94EurEk6I8GEsyyRnKzLwl4i3kMSIpM/qdfTrvs33y2ZuSvDUxpUNwCbSZvtPKVQyI7znUXIkimPvpetDXYj6B5zVqRIma5SvgYpPEkwKNy7ojRZBZIFuC30K/80YANBPLBml/W9Vy6nArDYzwPVRPRnMpYCbtBL+/8oQC9wV3mtSBGo2DzH/1u/C4kgk2vUHmQkNd26oqGwMDtibCJFL6iMDsCQsNup+AMBEExPCYYSzsZNzD/XZsSNoRKp7cPzeKAFF9f+7yS8usyQdiz0ypJyDiE8Stun76MKuDMlnm9UtAm6UR74LXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793239345; c=relaxed/relaxed;
	bh=p++B/8iyn/Ec24+3W2GqJTkDRLR3H24juIow0swenAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JF1XZV4vFeWW5qP9SjWAmVCCJc/bi11bIOmJGlzCNB4ka/+TTIO9G6JNNTOBarBnSTtp8qkGTTLv0oMV/Sb1DdmswVSBaGshasQcsObcaN31C0T/JgPzV0/SR2E0fMSBoUubknqyNxrgDJujmIpPIOd5+TsKCpsGV+7XwRkPEt5HqSKmEx/5lsAFbhQNqmqQHzNi9WiDt4i6CNl6Uhz8cnnIyGZmdqBpT3raRnG3J3LmirJtqVJQxaNpgVa8hYR+qWb+6f5oSHDbL9hoqTPyYkdUAShbx2tSlIQjk1rVoWzFDbb6OqZuZFfQPnRmgR7Y3f36OpaqLQiJx5loxI47yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFSD06Vsxz2yjN
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 13:02:24 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 10:02:06 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 10:02:06 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH linux dev-6.18 2/4] spi: aspeed: Enable Quad SPI mode for page program
Date: Thu, 29 Oct 2026 10:02:01 +0800
Message-ID: <20261029020205.335352-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029020205.335352-1-vince_chang@aspeedtech.com>
References: <20261029020205.335352-1-vince_chang@aspeedtech.com>
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

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Ensure the controller switches to quad I/O mode when
spi-tx-bus-width dts property is 4 and the Quad SPI program
opcode (32h or 34h) is used. Without this change, high-bit
data will be lost during page programming.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Link: https://patch.msgid.link/20251114101042.1520997-3-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit 716d0a0a2ab00c601120c19bb357f4373f4722d1)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 01fe42bdbc39..aabaa2aa816f 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -263,11 +263,15 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
 				     const struct spi_mem_op *op)
 {
 	int ret;
+	int io_mode = aspeed_spi_get_io_mode(op);
 
 	aspeed_spi_start_user(chip);
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val, op->cmd.opcode);
 	if (ret < 0)
 		goto stop_user;
+
+	aspeed_spi_set_io_mode(chip, io_mode);
+
 	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out, op->data.nbytes);
 stop_user:
 	aspeed_spi_stop_user(chip);
-- 
2.43.0


