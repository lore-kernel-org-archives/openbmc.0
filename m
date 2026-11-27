Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E4606A6B8
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rnfWUyNN
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbJ35KHnz30Vv;
	Sat, 28 Nov 2026 01:23:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789427;
	cv=none; b=KNdG7hZd3EJYx7MKKSqiC6onmyxuQYgPxLAqzUPh+nv7I9poMhz08JTiqp6wNBFbcK3AavM3oiT+qlgFcmRKWbUkOv1ZiCRiRCLtlGeJNb6VA0pBuAJmPOrjrNPgWCRPYnR0CVJSBkl8VBa5h8dFSHJBKWTQGDw8r321o9OneP2snWVzZQBQ7yhnri/keLLLFPvQ9w30xIzjUjw0ZcTQ1e6GLG2dJezWrenafLxoecRuBG2PhQO4Rlmd7+GBUSH8rwAPK7IKKRX7P1Uunw/koCxBgLcEQhsbqUu1/ckJlG3YHgR83tEVruZzp6IsPEUQzZh85bMVIRvKvXeJcYWNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789427; c=relaxed/relaxed;
	bh=HXhroBPZRcgrGIbcVc0pbxOO3IgNrBXDGvDEJWoY0CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJ0TayjhaWxkguQTD/SQ3b2lVej8TeM9iLoO+tDUHXde1OPQHdqZAgAzstG4zfhDffSYJowMKXI96JCV9qQi/6s84pL0E7uqZUWSl1hQkeK1o6RKRnaba0neJ97UBfXTbqTfrTMUWZlaq9QAd7RrozRzosNAgPX6Kzfb/Bh5SZRph2Kvi6alTIEIHNSdNl0aVqzkqE39iSCtOp5fgPfmBA5a7oYSgU49zAG1Fh6vMtJFwCqPE7oAE6MuhsaBrGD7oJsuTj+6UUcSUzP5SJJQVOhHw7055jc6NihYcHYqdWKH+dY1AaFLTa/G8Sc0Q9HZPeFh/Atpk+jZdKenqp5VJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rnfWUyNN; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rnfWUyNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbJ24gBSz2yMk
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:23:46 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 372A74E417C9;
	Fri, 27 Nov 2026 14:23:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0352B6049C;
	Fri, 27 Nov 2026 14:23:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E836E11E68FD9;
	Fri, 27 Nov 2026 15:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HXhroBPZRcgrGIbcVc0pbxOO3IgNrBXDGvDEJWoY0CY=;
	b=rnfWUyNNVeOK0yIxaUGUvuInfYVJ+8b8lpDJm7yQa263eaQy52ZcaPnICSJQiAeL1v5PW1
	BnxVGnjOPlC8YUqXIxXhDIQUW/RW3ZRbLzF5WsQCZz0yDnP5ZL71LBUa587cvfv2OJ9sv/
	UcAi5Mj64c6CUQXYFtv835NnxDv3LiUbKzxbXYI8NMWmsBtskn3W3+HIPWoWNYL5qwTQEZ
	vIJ5IR5fSoZzIQ7kOiVGXDybE81wHr76CUoskIRh15IokIpWwGocq6mcYlvefx27LCEEdx
	Fx8MHL/xhrCG9qjTqN8pmNrGBupdr2M7X6UB1sRWSTFWLhMjXM/RydF0YQeuVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:25 +0100
Subject: [PATCH RFC v2 03/35] spi: spi-mem: Handle a corner case while
 sanitizing ops
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-3-5c93f5e5d630@bootlin.com>
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

Mixed DTR operations (eg. 1S-xD-yD) set op_is_dtr but do not enter the
ODTR checks, so their command size is never validated.

Always check the command size: one byte, or two bytes in ODTR mode.
Require an even byte count only on 8-bit DTR phases, which carry two
bytes per clock cycle. Narrower DTR phases may use odd counts.

Regarding the dummy phase, either the controller is only supporting
"bytes", in which case the check must be performed, or (soon) they might
advertize the dummy_cycles capability for which sending an even number
of dummy bytes is irrelevant. The check can remain though, since in this
case dummy.nbytes will be 0 (those values are mutually exclusive, the
core will check that).

Fixes: 8618271887ca ("spi: spi-mem: Limit octal DTR constraints to octal DTR situations")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index f4d71f740163..3989017dd86f 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -171,6 +171,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 	struct spi_controller *ctlr = mem->spi->controller;
 	bool op_is_dtr =
 		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
+	bool op_is_odtr = op->cmd.dtr && op->cmd.buswidth == 8;
 
 	if (op_is_dtr) {
 		if (!spi_mem_controller_is_capable(ctlr, dtr) && !ctlr->dtr_caps)
@@ -178,23 +179,20 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 
 		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
 			return false;
+	}
 
-		/* Extra 8D-8D-8D limitations */
-		if (op->cmd.dtr && op->cmd.buswidth == 8) {
-			if (op->cmd.nbytes != 2)
-				return false;
+	/* Command phase is single byte, except in ODTR mode where it is two */
+	if ((!op_is_odtr && op->cmd.nbytes != 1) ||
+	    (op_is_odtr && op->cmd.nbytes != 2))
+		return false;
 
-			if ((op->addr.nbytes % 2) ||
-			    (op->dummy.nbytes % 2) ||
-			    (op->data.nbytes % 2)) {
-				dev_err(&ctlr->dev,
-					"Odd byte numbers not allowed in octal DTR operations\n");
-				return false;
-			}
-		}
-	} else {
-		if (op->cmd.nbytes != 1)
-			return false;
+	/* ODTR phases shall carry even byte numbers */
+	if ((op->addr.dtr && op->addr.buswidth == 8 && op->addr.nbytes % 2) ||
+	    (op->dummy.dtr && op->dummy.buswidth == 8 && op->dummy.nbytes % 2) ||
+	    (op->data.dtr && op->data.buswidth == 8 && op->data.nbytes % 2)) {
+		dev_err(&ctlr->dev,
+			"Odd byte numbers not allowed in octal DTR phases\n");
+		return false;
 	}
 
 	if (op->data.ecc) {

-- 
2.56.0


