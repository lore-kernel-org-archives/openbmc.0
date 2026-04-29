Return-Path: <openbmc+bounces-1879-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A3FF8875
	for <openbmc@archiver.kernel.org>; Thu, 30 Apr 2026 00:17:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g5ZSn3f7dz2xlm;
	Thu, 30 Apr 2026 10:15:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777486102;
	cv=none; b=blEhXXH6CReEBP2vmUfysbtjz7vr8rmvl7UVO3p2nRylESIH35dQGwbY52/D9upL/iZGmKTpF1EMkBp6M4bp6xrIwAMpzLhUpJ9lqy/h23HkxIOrpr37fBZLdVaoyH+Td0PlKjw7W/tUOc1NBav+H0TjGn/JYKEwE55hz7Zo54WAFFYmskT67dJKiEkvsma5KKP5TyFtj+m4JWIHJuN6NtS2+2QQ37vnh9/X/CV1lVa67J4qILJ2Ji8RIeV/A8J5YvxA1ySY9l/KYi4V+YCvkNbq3r+ptsXxIMvi8MEF3sHHs8XSPApzd/t2OrTaVk+mqH2Jpa3hC4bEdu0TljToCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777486102; c=relaxed/relaxed;
	bh=djNQC+WiehgbSjZPUHPGAOR2nkZcZmEr0KjHIcYf3t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkCnSYZazTHYaw1ugnDC3Jpg5ELxnOxegtxgVJS2H9IUpL3gWTsjquVApYjDSegW5KGyrCQzwMK93VrAlvNL9hbPiPLpFhq5izzwTrxgcV1rjnuDW41FKBYs+9Cm8fFxxeSMTg/8RnVBSnRqPtvHGuo78TTv6dRUzXrru6aq+Loi2VdG+USL/o7/uHsfDRrRv4KL5Kc0TPVbpJaetD+iTMzwEkcQGyVzVGl3MXJmcQKUeW5klpyiwKH1zmh/QOLGPRVom2oST1CKsoELTaDuMj0dMyoOVR1XDk52XrNZQg2sDPaaY76czvlqVUqx9KnZqlweTj81jR/qYzvrSmY0kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NmSZF+iW; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NmSZF+iW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g5QK169Wbz2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2026 04:08:21 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 409131A3470;
	Wed, 29 Apr 2026 17:58:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CCFF5FD43;
	Wed, 29 Apr 2026 17:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C0971072B171;
	Wed, 29 Apr 2026 19:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=djNQC+WiehgbSjZPUHPGAOR2nkZcZmEr0KjHIcYf3t4=;
	b=NmSZF+iWjEyn2SmSbXR4+EkHCCLdjDtILUG9X51p5SCiphlxZnjKNNGhMMDdv6+IE8Z0pT
	ASIHf/oK5ins8abEGkf3OT/DpAh4+l/rTkVjcESvNc56zjX3c6MzBilErApZ2Bhx8qWhnA
	q4skr5wiZcq3mmwHq2jiVNGW1mYCJN/tNbDh2F3BzrrvyfD4fdGmhsSID0jKhhjNOiGAz6
	jJJPYq8QKvuUtagfzMs9+zJqCAJairETws7j+Woa85G71iDosgPBr85dnsTyIGKlD82Shb
	llYfvCKlpMGTCJF/Xyt0qdAzxC71iYXH4L/FxQpv9jVgln0FJY4chh9edS6YQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:47 +0200
Subject: [PATCH v3 10/11] mtd: spinand: winbond: Create a helper to detect
 the need for the HS bit
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
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-10-0f38b3c229ad@bootlin.com>
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

The logic is not complex but might be reused to cleanup a bit the
section by moving it to a dedicated helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b30a343a6672..ffbcd25b0366 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -421,30 +421,33 @@ static int w25n0xjw_set_sr4_hs(struct spinand_device *spinand, bool enable)
 	return spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
 }
 
+/*
+ * SDR dual and quad I/O operations over 104MHz require the HS bit to
+ * enable a few more dummy cycles.
+ */
+static bool w25n0xjw_op_needs_hs(const struct spi_mem_op *op)
+{
+	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
+		return false;
+	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
+		return false;
+	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
+		return false;
+
+	return true;
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
-	bool hs;
 
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
-	/*
-	 * SDR dual and quad I/O operations over 104MHz require the HS bit to
-	 * enable a few more dummy cycles.
-	 */
 	op = spinand->op_templates->read_cache;
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		hs = false;
-	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
-		hs = false;
-	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
-		hs = false;
-	else
-		hs = true;
 
-	return w25n0xjw_set_sr4_hs(spinand, hs);
+	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)

-- 
2.53.0


