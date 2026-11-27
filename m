Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF15606EF3C
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E+DjkZ/y
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbNB04WDz3bhH;
	Sat, 28 Nov 2026 01:27:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789641;
	cv=none; b=LI3nNrVZ2WsYo0gkAquZloZXmpbrWQvDljwHIdrE/hIOpQOFblrP0UiI9j9D9Xa2PYxivCt+zzCA0I0tndaVmEnr1iyBb4EXEgt7h01/X3CTeRAAczK6zLhPcFc8WlscqgoIKpQyTxZvY0FenQZ9J7NHboA0apyM//UdYII7/TGhi2PAr0V5gG4XiHubHpCzcQj87Fam3mEEP9dXdTdsEOQ0FG6AXmGlgOJLF+LK4CYy7rPN006OMcV8a+QJkPt/76IORpBJyJFwKBmHJB3oIB8OXTDEDEf33orVDInCFuxIvUZ6qkNDrbV473aVFHdVpJ32htK82zJ6WWubZjwncw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789641; c=relaxed/relaxed;
	bh=+CU5gTDGqNI0A7OtXnfaxY+IVWdsopI+NOANirtisZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4czJjBCwbzgHfKGD8XdJcW0rIOXkSGRH6vCl2B5WjFSpmjPjAmeo1Lh0Sa2pMwC9tKlBsAyXN/52v67UBSZrCFXRGQJ1NaljN3RUqgpYebnqzKwhJ0x2xf1dZHzL8oGuUBjY344Cg3EZFrlFf3mU9uuvPomFxK2T1VENouqFqt65zvRIK2cOF6V2wXUDCcBMGB/9+iZoQOJ8WcZkYUdh4gjsnd8e4MbGn8L/h63MhzEgI3zuwUlJ+lfj0/m203rZbRHjYhw5SnTRvKCeMLyj6NeFovTGglTvXfuk9d2ys5pr1s7ny/q7TSq4uLp2tNBufJBO7KUur6icqgfuSta2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E+DjkZ/y; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E+DjkZ/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbN918qgz30WS
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:27:21 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 011A2C2AC4F;
	Fri, 27 Nov 2026 14:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 342DF6049C;
	Fri, 27 Nov 2026 14:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2FF11E68FDF;
	Fri, 27 Nov 2026 15:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+CU5gTDGqNI0A7OtXnfaxY+IVWdsopI+NOANirtisZk=;
	b=E+DjkZ/y7ZfCRww8fNEowh4OMsOcCcn80GvTb4Hr+lBZb5E1kT2KHO395PZmz27BScMe8/
	HSntgqrnLZC/e7np/CzUpxIoMu8Sld45fsWnCmrSTpGiQgj9a2cwhvRpJaJ4CqVANWcvAa
	9NvVc2rFixduWXIeDC1rOTR1MMUxbrCVcb7oXIe7hd/bbYmlPiUaADEghABIBTwcYMzxVe
	PtGt3H5PCCY1K46IijtFval2jAqtebcKcUAFaEwYZHjNhkXo7LL37yqyDP/CofIrsfmm4C
	DG84wbaFSgsE9w2q1oqns1CFnkCWXhufwEqyh0DE3DMpCKV4ljb6RIupvSik+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:51 +0100
Subject: [PATCH RFC v2 29/35] spi: stm32-ospi: Consume dummy cycles
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-29-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-stm32-ospi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index fa0e8e83cb1b..bf42f46ce194 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -492,10 +492,9 @@ static int stm32_ospi_send(struct spi_device *spi, const struct spi_mem_op *op)
 	}
 
 	tcr = TCR_SSHIFT;
-	if (op->dummy.buswidth && op->dummy.nbytes) {
-		tcr |= FIELD_PREP(TCR_DCYC_MASK,
-				  op->dummy.nbytes * 8 / op->dummy.buswidth);
-	}
+	if (op->dummy.ncycles)
+		tcr |= FIELD_PREP(TCR_DCYC_MASK, op->dummy.ncycles);
+
 	writel_relaxed(tcr, regs_base + OSPI_TCR);
 
 	if (op->data.nbytes) {
@@ -691,7 +690,7 @@ static int stm32_ospi_transfer_one_message(struct spi_controller *ctrl,
 		 */
 		if (transfer->dummy_data) {
 			op.dummy.buswidth = transfer->tx_nbits;
-			op.dummy.nbytes = transfer->len;
+			op.dummy.ncycles = transfer->len * 8 / transfer->tx_nbits;
 			dummy_bytes = transfer->len;
 
 			/* If happens, means that message is not correctly built */
@@ -784,6 +783,10 @@ static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
 	.poll_status	= stm32_ospi_poll_status,
 };
 
+static const struct spi_controller_mem_caps stm32_ospi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -933,6 +936,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	ctrl->setup = stm32_ospi_setup;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &stm32_ospi_mem_ops;
+	ctrl->mem_caps = &stm32_ospi_mem_caps;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
 	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;

-- 
2.56.0


