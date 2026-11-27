Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F96606A327
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=faSRBE9x
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbNX49fYz3bsL;
	Sat, 28 Nov 2026 01:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789660;
	cv=none; b=JaRiUY3xR9/tT1xoCDbBlrPtkKdP5khJ5bG4dl5wN1wj43tU2XnLKm2r8fg9FT7zhOoKcu+TuYtCsqdzlzt7Anb/YyVNIEz8+8GgN1YSi1zNO/YkHCNmt/ZD81LotTj2dkEhu1JNjK70Nky4uXJzUSIYf4CtXGPxMNla7vwdCAFObucXQM8vZ197Gea1T3eAROUSSn+95UFJv4seHmHpl+Fx1PlYBEJsLu9PDQiGrPPgf1+ZB6NTCe/23MXydNvzvKg3/NHOq0ASk4OvK5IEerkK+d7FXDefszf4CcF5ZHCDB38W7JKt1/qZIKy9rauJ/Dn9uqPizx4xjesbHO6JRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789660; c=relaxed/relaxed;
	bh=NI1jRy0SNvAcR0rqCH0J86Yv5/i/7FwImrdwEEYORLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAK58xWKH/tChWXIChM8gXs93UtwIwb/tPSn7MQdrwfpu7V6bCprJvojuUqWneNGX5kuMYChHpMViovOtgXwnGSoNzyqdgaX6CptPmDJMnFjY2V3eWH/In7bE9pvNw4FPaOAUMYMYEEgVw+0/c9L4b4ucublqpl62aBJrkdrVD8DpblB8slGQG/iBqRQIzJl5DnVmmLAKv40WMt7wVHopApPawnISQ2gIBHbRpnnh2U0RMliGswarn48VYLxDyAw0MLL7q5AG2F7kKRVvz70Ncq9/93jkyoFLwDRptJgi5jc6KzXclXQ0zjU7SCT5r2pIWUKCWo50wqLexx1hmOasA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=faSRBE9x; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=faSRBE9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbNW4hWRz3bZR
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:27:39 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86819C2AC4F;
	Fri, 27 Nov 2026 14:27:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBF016049C;
	Fri, 27 Nov 2026 14:27:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56E0411E68FDF;
	Fri, 27 Nov 2026 15:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NI1jRy0SNvAcR0rqCH0J86Yv5/i/7FwImrdwEEYORLw=;
	b=faSRBE9xIdwm6CpFvu5BuVaGN/LXN08eSEmrEpnKLeaHTshe++AwkohlHGgEN1r/8PgxqT
	FlVZLDNThZxhe4T3xc3kqgZ3VVGomrqueIGAA0LRjFV6Uj+zPx6p5AmWt1JWC18xitdQEo
	hwvjrQVgP9dkiY4wzgXgJ6sddFUo8QQenTTL5QNbWKJ8u05NmZzYRme4FSXlDgYeiaChEB
	MHVcjee1bGnVuCcB+ugWlahVrRnk0ahgh2k6R+WiVVVFQx4MT3pOPlU1eHATCAI31UK/e5
	mSpc5OP2dMIYvpW/6+fNQ1gr1gBnKFnL92OB7rSwuAo9sLL0lVZyO+X46+fM4Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:53 +0100
Subject: [PATCH RFC v2 31/35] spi: stm32-qspi: Consume dummy cycles
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-31-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-stm32-qspi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index b77daba6db83..993b09cc5124 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -393,9 +393,8 @@ static int stm32_qspi_send(struct spi_device *spi, const struct spi_mem_op *op)
 		ccr |= FIELD_PREP(CCR_ADSIZE_MASK, op->addr.nbytes - 1);
 	}
 
-	if (op->dummy.nbytes)
-		ccr |= FIELD_PREP(CCR_DCYC_MASK,
-				  op->dummy.nbytes * 8 / op->dummy.buswidth);
+	if (op->dummy.ncycles)
+		ccr |= FIELD_PREP(CCR_DCYC_MASK, op->dummy.ncycles);
 
 	if (op->data.nbytes) {
 		ccr |= FIELD_PREP(CCR_DMODE_MASK,
@@ -593,7 +592,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
 		 */
 		if (transfer->dummy_data) {
 			op.dummy.buswidth = transfer->tx_nbits;
-			op.dummy.nbytes = transfer->len;
+			op.dummy.ncycles = transfer->len * 8 / transfer->tx_nbits;
 			dummy_bytes = transfer->len;
 
 			/* if happens, means that message is not correctly built */
@@ -773,6 +772,10 @@ static const struct spi_controller_mem_ops stm32_qspi_mem_ops = {
 	.poll_status	= stm32_qspi_poll_status,
 };
 
+static const struct spi_controller_mem_caps stm32_qspi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int stm32_qspi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -856,6 +859,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	ctrl->setup = stm32_qspi_setup;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &stm32_qspi_mem_ops;
+	ctrl->mem_caps = &stm32_qspi_mem_caps;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_qspi_transfer_one_message;
 	ctrl->num_chipselect = STM32_QSPI_MAX_NORCHIP;

-- 
2.56.0


