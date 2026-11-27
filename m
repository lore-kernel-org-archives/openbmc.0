Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936E606A32E
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5CGmgTl
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbNy0kkVz3btg;
	Sat, 28 Nov 2026 01:28:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789681;
	cv=none; b=F/mEOgBmcF2YW09FwhiGFOParzXq4GbYaH/TJiZTtbbp2dp2BiEAMTfJZ7aQdWFCh+vXDGUUqvdwY+GZHqYOHEcgFPBLlgSLmWKIoSBMyv1yE82yS41gc7lMvRBwNvrCZVdCHhjY6UHwzWvRAeQxtSNsylI5I6TGV2BqnwityFA/sYZlPXdOVeUto9unUd6NMfFqPXlIjrNSznpwAxQJIDT6kWSD9ljHe7PZbAqQ82Nhl1FitlSVzVkdvqtuatXs/XTaS1Bm8MDTEhJW0ROBqnmEwpVkZmV4rpJyuqchh2iQI2YKDAFbZ1loxU7EYeWbHfeUMkJbw6KTmWArUpkwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789681; c=relaxed/relaxed;
	bh=t8xaCGkapw3XVy4Hw7CV1emEcGQK7H2PmWY00ef3WO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJeluRmY/5wdCL0O5L3aPV1NoORtplazTxUQgIq1e5me0PHUPH7dkvInW0mmBE63+/jItL7i6MlxktLEsiX8ARoVEDmht8Cb5bKG/8QZw/WNsRY2HMjnHErU0CGAqZ3WSh6jMVWyeFK6GyKv0plJXXYxFi7ZzMbshuFDISQgy9PlrEZTkzFE8p3S3eZPkO2AlII1xInb5buhRHUuzp2NgSnisYJYMAQugltSjPWozUZR1rl6t4mbe1UnI3T0AnPK6IxBz5NhoEaAJEfjeYap3gEbkU+R2l9/HE6mlvrNgt5Lfc7fGcF5fDG1v3tq3sC3GlT1NoHoibY7WfvL+lpRMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5CGmgTl; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5CGmgTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbNw6G0Lz3bbm
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:28:00 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64B654E417CD;
	Fri, 27 Nov 2026 14:27:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E54A6049C;
	Fri, 27 Nov 2026 14:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50A7611E68FDF;
	Fri, 27 Nov 2026 15:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t8xaCGkapw3XVy4Hw7CV1emEcGQK7H2PmWY00ef3WO0=;
	b=E5CGmgTl43LUv/Wxw0p2JNyzgHt6z+dpetXd2kS2qL+rL3snuzvIp+P3rbNz+oyk3fu7hU
	TreJNAyLrcFBm0ugH5RPSeM0g9U79sBAo6XOxTA0gykC687ycVdJNNS8Omz1uj7z0kNkMj
	ptomlmpr0rgl6yiczbLUuJ0sCh9qWzEjbvJpVGx3HrxQZmFyOInGk/ho6nHCOJrDnNMGKQ
	/ffnWqCFriCA1995pfJqfSAshYk3zJkoF0AyX/et/5qq9IVuqHC+Wx+beqi9s7hknfy5a3
	XVhD4IsrEdp1utYqalbP0yCtkNQrPGdfvYa4RkylmyJh+fe3smtIk4rCrLocDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:56 +0100
Subject: [PATCH RFC v2 34/35] spi: zynqmp-gqspi: Consume dummy cycles
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-34-5c93f5e5d630@bootlin.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller programs the dummy phase in clock cycles in the GEN_FIFO,
but the driver converts the legacy dummy byte count itself. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Store the dummy cycle count in a dedicated dummy_cycles field instead of
reusing bytes_to_transfer, which is reserved for byte-oriented transfers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 15e9d3ef8839..6289e33c2807 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -176,6 +176,8 @@ struct qspi_platform_data {
  * @rxbuf:		Pointer to the RX buffer
  * @bytes_to_transfer:	Number of bytes left to transfer
  * @bytes_to_receive:	Number of bytes left to receive
+ * @dummy_cycles:	Number of dummy cycles to insert
+ * @dummy_phase:	Whether the dummy phase is currently executing
  * @genfifocs:		Used for chip select
  * @genfifobus:		Used to select the upper or lower bus
  * @dma_rx_bytes:	Remaining bytes to receive by DMA mode
@@ -198,6 +200,8 @@ struct zynqmp_qspi {
 	void *rxbuf;
 	int bytes_to_transfer;
 	int bytes_to_receive;
+	u32 dummy_cycles;
+	bool dummy_phase;
 	u32 genfifocs;
 	u32 genfifobus;
 	u32 dma_rx_bytes;
@@ -681,8 +685,14 @@ static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
 			transfer_len = xqspi->dma_rx_bytes;
 		else
 			transfer_len = xqspi->bytes_to_receive;
-	} else {
+	} else if (xqspi->txbuf) {
 		transfer_len = xqspi->bytes_to_transfer;
+	} else {
+		/*
+		 * The GEN_FIFO immediate_data field carries a number of
+		 * dummy SCLK cycles, not a byte count.
+		 */
+		transfer_len = xqspi->dummy_cycles;
 	}
 
 	if (xqspi->txbuf)
@@ -832,7 +842,8 @@ static irqreturn_t zynqmp_qspi_irq(int irq, void *dev_id)
 			(mask & GQSPI_IER_GENFIFOEMPTY_MASK))
 		zynqmp_qspi_readrxfifo(xqspi, GQSPI_RX_FIFO_FILL);
 
-	if (xqspi->bytes_to_receive == 0 && xqspi->bytes_to_transfer == 0 &&
+	if (!xqspi->dummy_phase &&
+	    xqspi->bytes_to_receive == 0 && xqspi->bytes_to_transfer == 0 &&
 	    ((status & GQSPI_IRQ_MASK) == GQSPI_IRQ_MASK)) {
 		zynqmp_gqspi_write(xqspi, GQSPI_IDR_OFST, GQSPI_ISR_IDR_MASK);
 		complete(&xqspi->data_completion);
@@ -1109,15 +1120,13 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 		}
 	}
 
-	if (op->dummy.nbytes) {
+	if (op->dummy.ncycles) {
 		xqspi->txbuf = NULL;
 		xqspi->rxbuf = NULL;
-		/*
-		 * xqspi->bytes_to_transfer here represents the dummy circles
-		 * which need to be sent.
-		 */
-		xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
+		xqspi->dummy_cycles = op->dummy.ncycles;
+		xqspi->bytes_to_transfer = 0;
 		xqspi->bytes_to_receive = 0;
+		xqspi->dummy_phase = true;
 		/*
 		 * Using op->data.buswidth instead of op->dummy.buswidth here because
 		 * we need to use it to configure the correct SPI mode.
@@ -1136,6 +1145,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 			xqspi->rxbuf = NULL;
 			xqspi->bytes_to_transfer = op->data.nbytes;
 			xqspi->bytes_to_receive = 0;
+			xqspi->dummy_phase = false;
 			zynqmp_qspi_write_op(xqspi, op->data.buswidth,
 					     genfifoentry);
 			zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST,
@@ -1151,6 +1161,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 			xqspi->rxbuf = (u8 *)op->data.buf.in;
 			xqspi->bytes_to_receive = op->data.nbytes;
 			xqspi->bytes_to_transfer = 0;
+			xqspi->dummy_phase = false;
 			err = zynqmp_qspi_read_op(xqspi, op->data.buswidth,
 					    genfifoentry);
 			if (err)
@@ -1179,6 +1190,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 
 return_err:
 
+	xqspi->dummy_phase = false;
 	zynqmp_qspi_chipselect(mem->spi, true);
 	mutex_unlock(&xqspi->op_lock);
 
@@ -1206,6 +1218,7 @@ static const struct spi_controller_mem_ops zynqmp_qspi_mem_ops = {
 
 static const struct spi_controller_mem_caps zynqmp_qspi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 /**

-- 
2.56.0


