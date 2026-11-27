Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F4606C70E
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JfwfhOwW
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbJx4snkz3bYx;
	Sat, 28 Nov 2026 01:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789473;
	cv=none; b=J070AUXiuYCsjB/u3+CEBG2yZfCTT/wp2fL5nTJbp4Z6kdwTk+H8DAp8AWGOzYm1FbYxrUecbo+/d7h9CqvOQLn8/EdjQaZvRtudmLXYItWgURNG4KkFpbejOwouAgerYQzh+KhsnzgT7X4UUWtMHH61d6tqRpV2MdAKSuQWKfunGycCe/NnVhpHmtmpu10HPSRkCxqXQZaKzaXJyWeWDalGcHDLMTMhASikC5QEYbECZyyLCw7y1lRFeOAWnF2CCT488v8Whvsmtuh1yrRNuDSylx6+VTOjzlLk8s3pePByAZPU6k2g0qRNTKTwNUMBaJvIvTRKRr5v8VoCsS9k8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789473; c=relaxed/relaxed;
	bh=y57dJmsapUsf0K8zIJYUWSjG4lZHxo72aG5YqrWTl8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQP0iPNhev2k3ewqwm+1z0670CJtvE+foLZhmbTQyv+Nb43oJGu9KvouvamIXIOjL6cHmfvQZ9Jb/zu9LKVjSdRWphrqVHWGWuBp4CzsM9q/EXzCvuii8qrHM/na/3vc1uY6rXQS0gweBWMgRLuuTeSY2O4NhjmpmYhQ55RVGd2qnUOMNNtnWp8njIdfp5GUXRH77lxqHDEwMZ+TuFWkv30NnnmwwFWboT3890WCgr1FsY8XeZJ/2aGVK1Bfeimrc1OKtaZsOkJKfeIeA56F/VZBqcjR1X4lEUQUrvYZ/iKiD9Umq+p3MSJlyj0BglaMUdzxXgCG56iqd+Y4Q4O3Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JfwfhOwW; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JfwfhOwW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbJw5X50z2yMl
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:24:32 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C72D4E417C8;
	Fri, 27 Nov 2026 14:24:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F38AB6049C;
	Fri, 27 Nov 2026 14:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D86911E68FF9;
	Fri, 27 Nov 2026 15:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y57dJmsapUsf0K8zIJYUWSjG4lZHxo72aG5YqrWTl8Q=;
	b=JfwfhOwWdfse5PNcdH/We4rNKJosXgz5tUZtt/kIO5++eOp2GdasD+vaEYBsDHI+O6NHcU
	LbPlWvLnHag9BymLka7+ZOy27yswPFsmLqAms9mOw/Gs6ReC5vEd6icRtVdE/3ZZJ+FSGv
	iQvCy/4VcmtJUI42j7H+J7F1PxAcsbLut/gYalCTEX7gooxZrtvLPKFWa1+LjjFXNkiG8u
	sbOaf6qOaM2sQ89KdbvxqXAPswiEss1+nlSvrPsh+cyckKJwdigRHjNrM78qPjcyBIee5E
	r4qhoGU7+McO8Lbb9rzOSFa+laqInnQ6/iu2uVq0v8PCTd9OXH0XhcAlL5jEww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:30 +0100
Subject: [PATCH RFC v2 08/35] spi: amlogic-spifc-a1: Reject excessive dummy
 cycle counts
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-8-5c93f5e5d630@bootlin.com>
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

The controller stores the number of dummy cycles in a 6-bit field.
Prevent field corruption by adding a proper ->supports_op() callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index d99c72c7a965..bbe1b6b52b85 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -314,7 +314,17 @@ static void amlogic_spifc_a1_hw_init(struct amlogic_spifc_a1 *spifc)
 	writel(0, spifc->base + SPIFC_A1_USER_DBUF_ADDR_REG);
 }
 
+static bool amlogic_spifc_a1_supports_op(struct spi_mem *mem,
+					 const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(SPIFC_A1_USER_DUMMY_CLK_CYCLES))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
+	.supports_op = amlogic_spifc_a1_supports_op,
 	.exec_op = amlogic_spifc_a1_exec_op,
 	.adjust_op_size = amlogic_spifc_a1_adjust_op_size,
 };

-- 
2.56.0


