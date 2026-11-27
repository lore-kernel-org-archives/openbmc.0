Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E372160A3823
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kYxGE0WH
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbJr2nDfz3bWn;
	Sat, 28 Nov 2026 01:24:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789468;
	cv=none; b=CWLNftSvm0YR9OzAvDzGNJLOSUdjeYbGMFXURhSDVDdnqGGWPGsmFLBxXqp27wgZeca4ZrMw0z6uqwUaFo2vPwsF925JKNWVTsogS9CK5lRCcjbn6e08ztyTRo8Rosck5fK8cDY7gU2fIOcg8BrHqoxa387+aZiWhQuK5ielVSGMkpKxhwOwIfdBNPE/0V+rMGob7aPNSYJ8rEv3pmmO1cO4hFTvC4I+vKkYQhmluw7FGMn/bqSG+POnxeJCTzKCq8hcPZaCCL2Hwpv7c41GHwGd6aTuuqrTZJS8h1Lmo1weyNg8x3EO4FcHu6hQRWq9+uUd2hW/mUTnuv7qcOCl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789468; c=relaxed/relaxed;
	bh=zonOBGO6156kvCeWKd0snm1db/Bu74bIS0ahMayf6oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqW3fbbh3JTk6vXiThJsfXj/ZRGIgt8bNNBMnV0hrnqPf59J7JjFw/A8Aceo5wF9QMwqzuHlCLsXieklx172SAZSeZxgzkJs7xuB3OIIS9tx7X3O6S8Bi24yK946+VBttu1OZEllMFkUEf6/Gfg2VaAKjtJJzBiszERzIkpHnzPY8DY0OrqVrdeqk/0TfntvH0oqtF3wjJBy9seFcLHoU3yo/n9C9mDX2v/NBLqQfiyiaEYzcboTpds4QFp0PL0d6IbwrP4g5T5e2Gw2GmygsZ8UQBf2jBgkmVbSV4TdsEq31efx1ujZQa8X03FYcGxAKNn20h9+75DYys5zVQHNlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kYxGE0WH; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kYxGE0WH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbJq3pR3z3bV5
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:24:27 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A728C2AC4D;
	Fri, 27 Nov 2026 14:24:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D9AD6049C;
	Fri, 27 Nov 2026 14:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5124C11E68FD9;
	Fri, 27 Nov 2026 15:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zonOBGO6156kvCeWKd0snm1db/Bu74bIS0ahMayf6oc=;
	b=kYxGE0WHExEavfLxiryWok6MCYv5qIIkKetTtYMLHh4ksnOXG7zujnaqyGLojlf06KvXFm
	eB8dboYQ+STmwq5m3wUaEJfos0toy8eXRzBxKyM2ydvJ3pUNz/5N7gG4W2izgNY31CBKMQ
	q2+kSWBMWPHSuYCfrABK2wjoxhAjbG3HQgYnW9caRPR50XLRzrSnXJhTNWZYFWr4KxU/tS
	Lhsslj3xuCmwQF9pSd+eB4zLX5e3LxkNzboNZgZT8vwviWsu8Zvc7kJ6EZG2y0TfMfUMd4
	kXhD+GoufkgNjXdY+EoNKlhhBVgkpndlzJxLxNHlFzvqXDr5/AL2GXQiKVc+EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:29 +0100
Subject: [PATCH RFC v2 07/35] spi: amlogic-spifc-a1: Consume dummy cycles
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-7-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-amlogic-spifc-a1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index c7cccc8de6dc..d99c72c7a965 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.nbytes << 3))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.ncycles))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -269,7 +269,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 		amlogic_spifc_a1_set_addr(spifc, op->addr.val,
 					  SPIFC_A1_USER_ADDR(op));
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		amlogic_spifc_a1_set_dummy(spifc, SPIFC_A1_USER_DUMMY(op));
 
 	if (data_size) {
@@ -321,6 +321,7 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
 
 static const struct spi_controller_mem_caps amlogic_spifc_a1_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int amlogic_spifc_a1_probe(struct platform_device *pdev)

-- 
2.56.0


