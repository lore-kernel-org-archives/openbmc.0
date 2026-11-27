Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872AB606A685
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h1TDITrE
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbLX1fx3z3blC;
	Sat, 28 Nov 2026 01:25:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789555;
	cv=none; b=mBNfaMGswNxL/KhVi5HvOAtGDtHmPRxtgxEOzYKHnSdYTx2daduSwuaWZDKfi3psqjeP5K8DQzGHdenn9e3/vY6ju0rVbmGuIDzaeV+6vhwpFatETjyyv8GyR3UWXafJwUr0K20h3RFUOq8BjjrG+Sl60kwWRLfeqorYK5upQ/TJ5MZaGtEvSkQZO+Zd79Y5A6ZDd/DkVbckL+RW4g2lNPOVMJhvL7RRuFYhJuWqQU8PDDaFeSCaKSetZgrGQR0kDN6BdESfLhegv4Tg4MF7Tg0AU8kG/O0LlFjvgFu017TgZXvaNSIYp5wSvkK+TPSXW2vNXpO6bqrVoNkn8+1iQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789555; c=relaxed/relaxed;
	bh=Z7J8RFTeR+O5qxgkBrWEhbpfO8vy8KFpxScRWHW4sNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjCQKqiv40EW5tGb9hothJPFy3PKfeYiU2p7Gbu5bAzOMjWq0+BWxqaANqhUC6k6fwDCvtdHGOoQWqg54J2ZkSk2UrEhde5j3ozRcAh4qDp1/ULl/1bNEWBPrLEHeX8NksikWARiubQCh42Knil2VRoHhf5+gNNxKZiKD1TaDn6jb69GpuJbiT480IYtPkonbXYbQfNEzfCjpw443jqlHtqOUEw5fWEabf7U0p2y91Qf58d06CDb9Oi6C19OB+lZg7q3Q2O+m/V396Gh7jJh5xtxWk+ovzZBV4GO7SMg7q7jb/HOnMMC5vZZ0qGzsUMedUyP+jbztGVvrO2mV04IIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h1TDITrE; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h1TDITrE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbLV5NV3z2yRC
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:25:54 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43A7FC6223B;
	Fri, 27 Nov 2026 14:26:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 759536049C;
	Fri, 27 Nov 2026 14:25:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC0D511E68FD9;
	Fri, 27 Nov 2026 15:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z7J8RFTeR+O5qxgkBrWEhbpfO8vy8KFpxScRWHW4sNU=;
	b=h1TDITrE5rFBAEHgSpChjkohl9gGsEMmV2KR5aw1kHDblUhtISY7f3kvJgn/BUmFS1sJ/W
	6w5TvkyqOnUD01g90D2uSU4+7hk1ZOi0KeKUiTy6guMwSFwHMDuK9K++iL8uFisukOZC8f
	6zIa4RLKxjCXh+LYzKQ65Cyse3ho0ayvXp7M+L4ACovmI0Ab/9SwWj4bzVpbqjPCmIyqAZ
	tpGThMyMGXmlDmNFn4LznRjofJn7vqS7C1nO4+WdnfrkTv6YNGEChlOK5KAgruHcuSjn0y
	63G2ItL4pn/u/UasHFtq+3LgS4q2XL7cuQ083plQHW3iyd2Bm870yFwtErpcvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:40 +0100
Subject: [PATCH RFC v2 18/35] spi: nxp-fspi: Consume dummy cycles directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-18-5c93f5e5d630@bootlin.com>
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

The controller programs the dummy phase in clock cycles in the LUT, but
the driver converts the legacy dummy byte count itself. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-fspi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 66cb58f95fdb..e6fdded67a00 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -543,7 +543,7 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes)
 		ret |= nxp_fspi_check_buswidth(f, op->addr.buswidth);
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		ret |= nxp_fspi_check_buswidth(f, op->dummy.buswidth);
 
 	if (op->data.nbytes)
@@ -567,8 +567,7 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
 		return false;
 
 	/* Max 64 dummy clock cycles supported */
-	if (op->dummy.buswidth &&
-	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
+	if (op->dummy.ncycles > 64)
 		return false;
 
 	/* Max data length, check controller limits and alignment */
@@ -652,16 +651,15 @@ static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
 		lutidx++;
 	}
 
-	/* dummy bytes, if needed */
-	if (op->dummy.nbytes) {
+	/* dummy cycles, if needed */
+	if (op->dummy.ncycles) {
 		lutval[lutidx / 2] |= LUT_DEF(lutidx, op->dummy.dtr ? LUT_DUMMY_DDR : LUT_DUMMY,
 		/*
 		 * Due to FlexSPI controller limitation number of PAD for dummy
 		 * buswidth needs to be programmed as equal to data buswidth.
 		 */
 					      LUT_PAD(op->data.buswidth),
-					      op->dummy.nbytes * 8 /
-					      op->dummy.buswidth);
+					      op->dummy.ncycles);
 		lutidx++;
 	}
 
@@ -1372,11 +1370,13 @@ static const struct spi_controller_mem_caps nxp_fspi_mem_caps = {
 	.dtr = true,
 	.swap16 = false,
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static const struct spi_controller_mem_caps nxp_fspi_mem_caps_disable_dtr = {
 	.dtr = false,
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static void nxp_fspi_cleanup(void *data)

-- 
2.56.0


