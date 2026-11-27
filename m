Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56660A263C
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbLZ3LyMz308H;
	Sat, 28 Nov 2026 01:25:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789558;
	cv=none; b=clHh1s6QMThEpbbN9Ds2JC5JjzJMk3xLlBIa9aJLZmJkhYwZ2rhPeAP4RJdGLqIAK4/uloNcTi0f/IJHMMELklNZwEar8Lp5wxow0sc7hTc0PvDCANb7dbIr0t6vq6JpZbSFalVJZ0NTRdfzWQuceFuNghQamDy6lG85bVzL/h4PvhTYN//xEhCC3pRSvruKRQO/uk4jZXq4voszAoCn1bwgc+HIn7NDLcn2vhmXlfIOAR4HHOKptQbfeF2EMAGLVXgkFFq/pkUxxurWWaPyqPfbN7t+ldBpTAXZtLI1+o+SyX5jROxWJp6Zc1Q1AtTU/hOpfA8rRFTVDCVgY9fa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789558; c=relaxed/relaxed;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LlUAS0P0VWLRYOrIJljUVuOGUbbGz8RyWcBSL87AxYR/MnxnjFcN0WP9fck95Dp0IvIQM6z5fc71n2vEch2FIlHpO9vSPTVQues2pcB+p+alHYYpQy0T/q95DYsPThEJxMJSPvj0Cp3I2YTRLzY04ujIcX4HvUVhDO1yFCS0ox6o/sQuXboO5u2y2zTgsb0VuaqI5P2t/tDXjJdHGj4N4QRI5VLp+kfsvzGwEroAm+/sWCxt8cYGgN95blLhr/lc98m5mDoO9s60IdPqky1+gM84teIGeZ23CE7pPXUB4awT7hncw7Sc8uzoWlvu7fBkx+ulhFb23KdKJGvXHcBe3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbLY4hfTz2yRC
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:25:57 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 282214E417C8;
	Fri, 27 Nov 2026 14:25:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E40556049C;
	Fri, 27 Nov 2026 14:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4691111E68FF9;
	Fri, 27 Nov 2026 15:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=;
	b=ARVAU9R2xy9uuRKVkdmefjQoskOgHFe8fpI2N2Kov/njbz9iRUs6eTvn8rw5VXuBZfOrkf
	8orW/O6YvvntEFXT5BlcZGMtPYyPT0c21XToq9cTbVnwkrxrDpffYfFBzezjEGK4vFIpgo
	GudppOKqbE1uqFaEUuumhvwQsIi+o4BHIumyGVTmd6mzmCuOwRy/jEOXdH4J0L59TEniRd
	FWdBuytjzdpL/mKJxUexfL3MglNvAUZhnLXvSwWMsOdGP9NewhS2owG5RrDxU0WnZDSMkS
	pTrZqtldbTss89snDMycmGpBcOUD578uKhrbSholrl8JGrhfxdyuiF0qdS2e7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:41 +0100
Subject: [PATCH RFC v2 19/35] spi: nxp-fspi: Reject mixed DTR modes
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-19-5c93f5e5d630@bootlin.com>
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

The controller only supports operations where all phases use the same
DTR mode. The mode selection in nxp_fspi_select_mem() assumes either an
all-DTR or an all-SDR operation; mixed DTR operations would be
misconfigured.

Reject mixed DTR operations from ->supports_op().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-fspi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index e6fdded67a00..04999369dd1b 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -536,8 +536,18 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct nxp_fspi *f = spi_controller_get_devdata(mem->spi->controller);
+	bool all_true, all_false;
 	int ret;
 
+	all_true = op->cmd.dtr &&
+		   (!op->addr.nbytes || op->addr.dtr) &&
+		   (!op->data.nbytes || op->data.dtr);
+
+	all_false = !op->cmd.dtr && !op->addr.dtr && !op->data.dtr;
+
+	if (!all_true && !all_false)
+		return false;
+
 	ret = nxp_fspi_check_buswidth(f, op->cmd.buswidth);
 
 	if (op->addr.nbytes)

-- 
2.56.0


