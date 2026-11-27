Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A3606A33A
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Nbd+2k2z
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbLB3Wpkz3bYf;
	Sat, 28 Nov 2026 01:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789538;
	cv=none; b=YO0xP3Ot8tX07wtcOw7jfvLNs+ghgKRP0gNPF+pml+icx8qdJRIlfW7CIW/+5g13mnRe2kwZt/ARONRQt8zOqIjzoGyYk5cLWPf1HLncYof5fH15mG+9bmGJzOC49SgMoLeG4DHyUKKRiWiUnIu5TL84g45TFTPpVCq3kh8m8rQm50Rgi90UeNl8J8mbPanAoThLSWDe7kYK6ktLsbYJC/EiVbLCbs/j98vdmf/rJjWe6oX69wh8rMYcE6z1r+B/7ZO5F8XSs4UpjaOomrU6JW6NDvycENc++56hOZzo6uMb0v1Is6jC7/jcIsdFEy9MEoVc7v+rV11nH+u0dqZvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789538; c=relaxed/relaxed;
	bh=oIP6YsVJ0tzemJtkR4/F0RGkjUMxie6otevjRQEs/Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qph5NTHZO2x4XsXgvh49QR7lV0s04xbkg5Bu/FZBIbnbcWohZtKfBBv/p6qeQVM+WpoJVeC2UguYFpdo1DSd+eGPDsYrwqxjWbL+S3gFhOt6EtMy0FkXm6Ez7ba14JOpqu3jbMnHY3lpUhL1QgbN/sDNVtGVSqvAdBSAQjcpAwDGBrzRO9K/ZrRDYg+dBdn3Iw74DT0fbz8+KDqD8o18qQflOhJ+Kg2nVllubI6FGuXFV6qD29Qq3ZRhXQC/i9tmtHaqgOpE/h5p7v5jNXFeWwiASpg3H/mdFaUtaAPPpM6OmSfvAuJv10rEKdOzIF6UAifH8X/dNf/RxxkzCNJiIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Nbd+2k2z; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Nbd+2k2z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbL92szfz2yRC
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:25:37 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAEF94E417C8;
	Fri, 27 Nov 2026 14:25:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B116049C;
	Fri, 27 Nov 2026 14:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 026A611E68FF4;
	Fri, 27 Nov 2026 15:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oIP6YsVJ0tzemJtkR4/F0RGkjUMxie6otevjRQEs/Zw=;
	b=Nbd+2k2zRxfdX4N7PZuOesTe7y9uTS4XxFCrwjSo3LlykwttKnd2QBPXS7PTjAeHu+DGsh
	ub3eIakOiP6Hwf4eE4KcQ6YASWe65YaVejiDLnN5qvyijvuYpqqX5380WkqD+LdzgSxTeG
	hHVt7tbvP1wXmxEl3y3Xj1L7/yArHiTLqkQjyFNFVzowU47sJHCqDoz7MDVHrXwR9Q6Ng6
	cFg4OluANdGXIR+2n8CHr79haJq9g91aU7IpYD0AKFqSBfvfRvX+SutHyxGkqrS9FR19y+
	EaljxuCCa79rQSzyVe7u74NkZpnNJezBU/S5NAko5jt+NEUgcla3e/xg4+kB9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:38 +0100
Subject: [PATCH RFC v2 16/35] spi: microchip-core-qspi: Consume dummy
 cycles directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-16-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-microchip-core-qspi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index c0ea65014d2e..80481011b83e 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -420,7 +421,6 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 
 static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
-	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
 
 	cmd_bytes = op->cmd.nbytes + op->addr.nbytes;
@@ -459,11 +459,7 @@ static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi
 	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
 	frames = total_bytes & BYTESLOWER_MASK;
 	frames |= cmd_bytes << FRAMES_CMDBYTES_SHIFT;
-
-	if (op->dummy.buswidth)
-		idle_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
-
-	frames |= idle_cycles << FRAMES_IDLE_SHIFT;
+	frames |= op->dummy.ncycles << FRAMES_IDLE_SHIFT;
 	ctrl = readl_relaxed(qspi->regs + REG_CONTROL);
 
 	if (ctrl & CONTROL_MODE12_MASK)
@@ -561,6 +557,9 @@ static bool mchp_coreqspi_supports_op(struct spi_mem *mem, const struct spi_mem_
 	if (!spi_mem_default_supports_op(mem, op))
 		return false;
 
+	if (op->dummy.ncycles > FIELD_MAX(FRAMES_IDLE_MASK))
+		return false;
+
 	if ((op->data.buswidth == 4 || op->data.buswidth == 2) &&
 	    (op->cmd.buswidth == 1 && (op->addr.buswidth == 1 || op->addr.buswidth == 0))) {
 		/*
@@ -601,6 +600,7 @@ static const struct spi_controller_mem_ops mchp_coreqspi_mem_ops = {
 
 static const struct spi_controller_mem_caps mchp_coreqspi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int mchp_coreqspi_unprepare_message(struct spi_controller *ctlr, struct spi_message *m)

-- 
2.56.0


