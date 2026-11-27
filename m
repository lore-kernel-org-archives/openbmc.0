Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D06072F26
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbMP5Hnhz3bnJ;
	Sat, 28 Nov 2026 01:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789601;
	cv=none; b=V7lhZ9zFEppLPJISEr85eIooLDDf3FKKprva+4zU11wH5b25xoKlMKiVnbevvXrlNiugMKn44uen+PccXIYFSEzruWfYmRl2P/PEOIGnh21zg11KA5bmor0rK8tUi1zMl/6gvAGFlFDF0mQB2JIGr8Kyi2pHKFM6RM1rSDcB9148U/46ugui/t/42e17Fpdc+x4XTreGwcYJhXqbVgjM1GKUnSL6u3ei0lZIV9KecqWGXC73i0sNGnVFAda43POGGfl3tVznOaFsUxcPA8VE/S29oMT92LP423i+tsVSfIuVMoDwizEsaPDMHWqhu0Ky67OhweVREp872vJ3u1BFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789601; c=relaxed/relaxed;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE5b7HJItmsmcAYTRZfLT2Vu0mXpXq6sQucczbAvvfhXdyVMBS3nFt0LPQwrQk15C3UlkTyMI3kJulDUXkjShHCFdG5nlZ6m0Y81999mrmM1VzENuyZQQ5/qcXKp5WeqsKtDDk7Wy2S14YNrUlfRs5xCo6nLZhTfm20oJ71ZWmE+dE8vnVd+DC9IpN7V5FZ8lPOV3k+eqg4IORATDYaPL9KHso5D5t8B4RIhBKBTsTxsScwVk0u3Osc4/ZPaaeKb/PbA3+StKd0x+2yjesxWx1v/DThqqrl6WnBKJu6Fsdr4BWNysKdbXlcIPL2I7NVgWRUuQDq+ydQ+ZSEIxCgszA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbMN6Khxz2yhV
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:26:40 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3ADFA1A183A;
	Fri, 27 Nov 2026 14:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 064DA6049C;
	Fri, 27 Nov 2026 14:26:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B1111E68FD9;
	Fri, 27 Nov 2026 15:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=;
	b=F5FxOjCNucjObr+WpOHDrEhkZVlYHLQEzVZPxyFtxTgV4dEIzIKnUN7gxonuOrhSqt9p9e
	SZgyMm5WF9oF5//bprUzP0wEVKjkXBG8brJ9Lpd2+pqj7JZf5RyAYk4IBBgvnOSkZuJsQR
	2T8fXKyTJ3NMrC9KryISZCkIhYemuPGhB55+OmsKA+n2yJRZLtZ27dyJXEsPCQDPyK5EBm
	U1IeQDQJvLpcLC73J9fuABHcni2av3M+s1RZs+HuC62rl4UkR6N3788pNG1i5gujetnks9
	6qTztonu2XIu+6i9c9N81L82lXcEsgVWSBH5jwUUiIgRSrss6FuwJ4DWNqf6PQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:46 +0100
Subject: [PATCH RFC v2 24/35] spi: rpc-if: Consume dummy cycles directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-24-5c93f5e5d630@bootlin.com>
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

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-rpc-if.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 9a740342d0f7..fb27ee6064c2 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -32,10 +32,9 @@ static void rpcif_spi_mem_prepare(struct spi_device *spi_dev,
 		rpc_op.addr.val = spi_op->addr.val;
 	}
 
-	if (spi_op->dummy.nbytes) {
+	if (spi_op->dummy.ncycles) {
 		rpc_op.dummy.buswidth = spi_op->dummy.buswidth;
-		rpc_op.dummy.ncycles  = spi_op->dummy.nbytes * 8 /
-					spi_op->dummy.buswidth;
+		rpc_op.dummy.ncycles = spi_op->dummy.ncycles;
 	}
 
 	if (spi_op->data.nbytes || (offs && len)) {
@@ -141,6 +140,10 @@ static const struct spi_controller_mem_ops rpcif_spi_mem_ops = {
 	.dirmap_write	= xspi_spi_mem_dirmap_write,
 };
 
+static const struct spi_controller_mem_caps rpcif_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rpcif_spi_probe(struct platform_device *pdev)
 {
 	struct device *parent = pdev->dev.parent;
@@ -167,6 +170,7 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &rpcif_spi_mem_ops;
+	ctlr->mem_caps = &rpcif_spi_mem_caps;
 
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_QUAD | SPI_RX_QUAD;

-- 
2.56.0


