Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3CE606EF09
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbKg45qKz3bfP;
	Sat, 28 Nov 2026 01:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789511;
	cv=none; b=Wf1JJRZmGeQcmJtDC1nvdI7JmeI4OMxN+dpmJZBNjyS/tQKAQfmtoLMxfN78e7tjpvCC58bn86UTFMc8Sfvub53h+AqhMpoc6RVctEr/wtkYt0jMfawYz/+R+wZJTys/+jNLfKm0CYaHEJ4OgwNIFd497ltwmLWYPC2hJgKjp5N/JY5c4LK9VHjg/ISYkHFTkpAHnT+BZTFFKzN/GGs8FZdjFvV9JiSnyNRtpD8IGohGtBIulEAcD6DzTckwGarwqVwHCBewrHIrA/d2rMF64LUoa1V944g+nx56EEBI8FTmW+vdNyZ8xRlDLdA1tQeQ4VgGInW5kFOlQwUXme7Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789511; c=relaxed/relaxed;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFxeJCnuToOvKW8vCpfnPwP39+UIoS4AddDhBAfbcxCz61Kc3lAnMZV3SEMvKPoGcXt3SXQfMu/ZlXhozrL3tBXwgc0taFSgfaS9A/kxQWvVWQ7NKZuh+71lJwFgMy0FI3uLGt4WoV/7Ako7iWNAP3g9/z1SyWRtjxgF3tv4Nogx/t3pl4e4cawYKjmFbo1qAWRHMeCrAjVL4iPo49IDDAkC11tir+xYcs6WJRcjM9z9+p9rgEoT4AHN2T8NqzwKkmcFEcFzmMK4m0ID01l0H2fX+rOBw2cy457DlPLt0eTh4wxnO9oixcAzRPdDUYmc66hPutRU75KfWrv1MPs6aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbKf0q85z30Vm
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:25:10 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A28104E417C9;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EC866049C;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3EAA11E68FF4;
	Fri, 27 Nov 2026 15:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=;
	b=mCPupFMkcRfnTzAr1Spz4Iuoof0rLblYlcTgdlvYugdCRiPEsvTHWNKbhADlCvSGKwJ1Je
	lG5Vz4gbMxFDMXUAKX2zEYbs9SW2y0Jt47OVeQdpx5boCZeYYwietaLpwk2CBCcFzA01od
	hVYZ222UDqBIVsfEuci6NiuPKeuD2ZvKxyVqhraL0Objx+rpc+fqiGjWVnPgNKypPf0fKm
	JBTqjtXV9bIr1kQI/iTrkEOQPe34K0Ljw8c3zBiDtM4FKtg1390PqeJTgE3ARKDWqV77no
	PMvdPfBmyC4s/lrYEyIosPnLrCgIz2+uZdciTN3WxwezM/pZCt3kVrFNO09jVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:35 +0100
Subject: [PATCH RFC v2 13/35] spi: cadence-qspi: Drop redundant checks
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-13-5c93f5e5d630@bootlin.com>
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

The core already sanitizes the spi-mem operations, these checks are
redundant so let's drop them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index df7c04e0e2d2..97725ffeae93 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -476,9 +476,6 @@ static int cqspi_setup_opcode_ext(struct cqspi_flash_pdata *f_pdata,
 	unsigned int reg;
 	u8 ext;
 
-	if (op->cmd.nbytes != 2)
-		return -EINVAL;
-
 	/* Opcode extension is the LSB. */
 	ext = op->cmd.opcode & 0xff;
 
@@ -1515,11 +1512,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 
 	if (all_true) {
 		/* Right now we only support 8-8-8 DTR mode. */
-		if (op->cmd.nbytes && op->cmd.buswidth != 8)
-			return false;
-		if (op->addr.nbytes && op->addr.buswidth != 8)
-			return false;
-		if (op->data.nbytes && op->data.buswidth != 8)
+		if (op->cmd.buswidth != 8)
 			return false;
 
 		if (cqspi->is_rzn1)

-- 
2.56.0


