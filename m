Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B927C606C2C7
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iNcMVji5
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbK95lrZz3bcb;
	Sat, 28 Nov 2026 01:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789485;
	cv=none; b=cjTQdTEh9/db4QvAz91sdYCwsrSawemGqTCxiuT5yz6LPDz81T44CAwzQUc/sL1VwrOpqpnPgsJcBtGxAvPqIXBZ0knnHgqFUJKg6gvUVXHr7BOOF6MYk2W9OFpcpSKkivLDEFxWxKz4B3cqEznWFJCcSAx7Y/UoOHp7o99q5jk7yOnp/1aKOcciiOPR0THHpwAkBLd+qSBadYcNYFQqgb+5TO3xVzGNqr37sDJJH8+ua05iMD4oRf5+jEB9IK49HHo3AgLxXYi9nDZJpIY2dJ3OYASikP/TaZT0kekB6i1TZvHGjbUp41zREUOdE71olxxWUbgnltnOwenTQtFFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789485; c=relaxed/relaxed;
	bh=TBZW7Ptwz+yw8AXqBhejxSGjbWw/7ikzInaFBRYqbMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgMjfxe6o6ST1a51M1LBlqh3L165u2I5P/D9z3wqho7TREJuJDCKmoki0llaLD/FYtRMvLMwax/zl3vSYnesq06/s2d+A/T0GmhNLGDHMkDY1YxYRsN4J3xOO+zTcxti6m4fQYFg6D2D+OtLg2Y978z4wTZTv66jLT3n1newhD0742AjjV2HHOkkJFe7KhxfykW3wfPDZjWsJuVmOMIYf4+lDj1RiuVujHgBcncAUwen9L1oIo6ZPYa8vO0BFQNWyF9VmVS/ZgHRRv1y6iRJCKAGwmvSZP21TVwCShfSrsqwKUTs81T3wMXG/A6ZDhj8i8pFdf1Nw2CAQMy+A+5J2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iNcMVji5; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iNcMVji5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbK85H6gz2yMn
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:24:44 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65DFB1A1838;
	Fri, 27 Nov 2026 14:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 332896049C;
	Fri, 27 Nov 2026 14:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22E8111E68FD9;
	Fri, 27 Nov 2026 15:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TBZW7Ptwz+yw8AXqBhejxSGjbWw/7ikzInaFBRYqbMw=;
	b=iNcMVji5FJ6CiqLt5PrRB1JZ3mB+OTxGlkV8xIWF1ejjwqQTrcOX0vXSSQ85Z2x9fXRRZu
	EyBYoOJrmudeLSJVqboEMsF2ZCpJQqtc+2Auxps+wVOSHd2Ib4FAL8pMmtlePbC9BCRu/f
	dVUgxy2omCV0x0LT//8irghtcm3zfTMOMmONKITlE1X08b5QTNXUG4kdBwjw+DQg2msRdH
	LaY+0h5WJ0H9melMp5ZaoeKAT6OTmuBTR6UDr+o3htZYUbimya7dqN+IELDdlqa8z1rtE+
	Z1osr8DpkaZ2d1+GP/Ct6gE7Ur/NDLh8luqp6qvDNrP0vEc/VhRs+2aQkZoq8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:32 +0100
Subject: [PATCH RFC v2 10/35] spi: atmel-quadspi: Consume dummy cycles
 directly
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-10-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/atmel-quadspi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 0b695b0b3c98..abca99b32b61 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -502,7 +502,7 @@ static bool atmel_qspi_supports_op(struct spi_mem *mem,
 
 	/* special case not supported by hardware */
 	if (op->addr.nbytes == 2 && op->cmd.buswidth != op->addr.buswidth &&
-	    op->dummy.nbytes == 0)
+	    !op->dummy.ncycles)
 		return false;
 
 	return true;
@@ -543,8 +543,8 @@ static int atmel_qspi_set_cfg(struct atmel_qspi *aq,
 		return mode;
 	ifr |= atmel_qspi_modes[mode].config;
 
-	if (op->dummy.nbytes)
-		dummy_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
+	dummy_cycles = op->dummy.ncycles;
+
 
 	/*
 	 * The controller allows 24 and 32-bit addressing while NAND-flash
@@ -706,14 +706,8 @@ static int atmel_qspi_sama7g5_set_cfg(struct atmel_qspi *aq,
 		return mode;
 	ifr |= atmel_qspi_sama7g5_modes[mode].config;
 
-	if (op->dummy.buswidth && op->dummy.nbytes) {
-		if (op->addr.dtr && op->dummy.dtr && op->data.dtr)
-			ifr |= QSPI_IFR_NBDUM(op->dummy.nbytes * 8 /
-					      (2 * op->dummy.buswidth));
-		else
-			ifr |= QSPI_IFR_NBDUM(op->dummy.nbytes * 8 /
-					      op->dummy.buswidth);
-	}
+	if (op->dummy.ncycles)
+		ifr |= QSPI_IFR_NBDUM(op->dummy.ncycles);
 
 	if (op->addr.nbytes) {
 		ifr |= FIELD_PREP(QSPI_IFR_ADDRL_SAMA7G5, op->addr.nbytes - 1) |
@@ -990,6 +984,10 @@ static const struct spi_controller_mem_ops atmel_qspi_mem_ops = {
 	.get_name = atmel_qspi_get_name
 };
 
+static const struct spi_controller_mem_caps atmel_qspi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int atmel_qspi_set_pad_calibration(struct atmel_qspi *aq)
 {
 	unsigned long pclk_rate;
@@ -1441,6 +1439,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	ctrl->set_cs_timing = atmel_qspi_set_cs_timing;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &atmel_qspi_mem_ops;
+	ctrl->mem_caps = &atmel_qspi_mem_caps;
 	ctrl->num_chipselect = 1;
 	platform_set_drvdata(pdev, ctrl);
 

-- 
2.56.0


