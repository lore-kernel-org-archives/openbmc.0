Return-Path: <openbmc+bounces-1882-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B85FF887E
	for <openbmc@archiver.kernel.org>; Thu, 30 Apr 2026 00:18:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g5ZSp2JV4z2yx7;
	Thu, 30 Apr 2026 10:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777485815;
	cv=none; b=eMb2MqCcIlp5yztsr3JTb53n10V4N6S1xwne9pDs6sx1C0nXGkgDkd+rtET4MJY6U/mzzYVr5yqTA4KXWZfVY9dc5GaHjNgGaquFdwpJ56hxoCMr/zokGZjiEHZe+wP5iNKTN10Gdwt/nQMcRzvhYrbsK+LHIGsX/gWUKxjD5iYJdZg6csHv3afwVyH2hDTtd8ZkHBPwTxmxd/YcB3T69huYjdOFqzPys9AB0wrY+nM28FpBljRdBSVDZWGjFPcsPdUKtxa0oeGGdEd8cLDME+pbYatEztGmq+oACTnKzR3KUYqWl9v5ry2b4TS/bayczBWs4Bn9VicuKTNW++k2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777485815; c=relaxed/relaxed;
	bh=pRtlUGFfk1AjNaQYKbHs4RmZNZ5DHT9f7bq1vbOMB34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGiRpZoWxZe0ZXobrIXjY7KWRLtAtdUUE7Yoo2XxzRz8THs+stmBVjGxWfhEWyO7Tdb0n3LcVyZwTticOTxL6qv9WIQNGR7+CgOaHdOgboTQiPjKoM5o9ABpc+6SaCgr4cGYlD/33+//h9CV+1SIwGbnwOHx7s2P3t9pWpUjpIWqXgQG7VWaRGppDt3UwsZ0it/b/jbPSeuup0TVgbYvE0xgzo2QaMa58Wg7FekCU+lIGSbwBLqxesXhxX0bqjretqyM7cyodfjt4SMiHb1dN6Fb0X8nLpfsbmk+SIT+BZqrVnJFMxdz5h7F7eqDv/DhU9XWWblk9HFje+2Ha+BnTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NXWUJIFz; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NXWUJIFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 348 seconds by postgrey-1.37 at boromir; Thu, 30 Apr 2026 04:03:35 AEST
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g5QCW1jSsz2ySc
	for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2026 04:03:35 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5D82C5CD5F;
	Wed, 29 Apr 2026 17:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A25475FD43;
	Wed, 29 Apr 2026 17:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811921072B16D;
	Wed, 29 Apr 2026 19:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pRtlUGFfk1AjNaQYKbHs4RmZNZ5DHT9f7bq1vbOMB34=;
	b=NXWUJIFzygDfQ7zjIeyD37p2jDhewvoKDSntinFms7jvk9dOXJLWtQHw+UkFYO0NhJeIjM
	STfpzdg2sYIjGY6C7+Fzr4WXsn+KBSuIu5UyfYzZlD/U1c7XLIx37jF1O1AhcTxI21N33E
	DQmxcpFD41RJYWNdmP5qpl3rNVUo2uPxARHR+n5Z8u599+GT+0ka1catIfl/VshOMoAu0W
	fsSlRi+NTvVI+VHtDf4qZIFZMj6xPiJCYPTqUPkB2Nns0fWL31gmeq1mdv9+6WcM7lGBeO
	JbHctYaj9m9K68JL+5ZH58LGrBE1dl+Luq9ZVrU4Z8dxJGq188aCiwAdf5nSSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:39 +0200
Subject: [PATCH v3 02/11] mtd: spinand: Expose spinand_op_is_odtr()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-2-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This helper is going to be needed in a vendor driver, so expose it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fba3cc213c88..1c3ac9ad650e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1400,7 +1400,7 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
-static bool spinand_op_is_odtr(const struct spi_mem_op *op)
+bool spinand_op_is_odtr(const struct spi_mem_op *op)
 {
 	return op->cmd.dtr && op->cmd.buswidth == 8;
 }
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306ebe3..e1f19664bb25 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -862,6 +862,8 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
 	nanddev_set_of_node(&spinand->base, np);
 }
 
+bool spinand_op_is_odtr(const struct spi_mem_op *op);
+
 int spinand_match_and_init(struct spinand_device *spinand,
 			   const struct spinand_info *table,
 			   unsigned int table_size,

-- 
2.53.0


