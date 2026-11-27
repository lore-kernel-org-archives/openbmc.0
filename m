Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0766070F6E
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbNL17Dpz3brx;
	Sat, 28 Nov 2026 01:27:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789649;
	cv=none; b=lCzQ5IvNi2EPnpiKVu1frI1eKhXbX31hbR7urG+nDo6Z/JrKFyhom+SedfCaWFUI3gDaHgGpEFUk+319trh+YCM/iIpim2uY04HGfsVywn1dzxy6rrWV4mumpvqP+1LHIhUpeEezPPJwaJhlkFWeF6KAaURcMFB7/i2DtpxuYF+w4P64diPymX1NSD/5ZoLhhtiNLaz5C0+A+SCN0D3YKYHF+spENrIZzTIIuDxFtRcXTNmMSuVaplkE+SehRb0S5ASzw6oXicrAFNZ122HHJKb9UTCi7DB1CZK4mBUdn7vF0uSoGV+l9aokZcuK2lqSElNC2XBiq5GE1ve3/L1IgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789649; c=relaxed/relaxed;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsw3qDI8EoR2+NBAxYAQHDcHpzq0DvWhpadcMpHFYSiHdNNM5xjjy63brLpF+h7L50NJeDC+nAeYnRe+8AFPd3dHQEml/yPHcCrtUIkWPt/ooOaEZjKUAlDY60qc/pIl/ofiiKU+fa0Byr60AY0w2AGgG3x4u7NwkxPxWgkFfIPua3ehDFoGG0VHE4r8dn8MfMz33Vea5GOCATscfzpcKg4JR4B5YgZbPnkPNY4Fi8UjosJgRnOmCRI+JioKOYOF042WfW7ojQo1Daeie00Ia6Bl1xEKkkbj3odtaaXCAwMXHG5BpGF+XZOSgwjuOIKKjTxsWi/J/nXk1jY7uKIyDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbNK1906z30WS
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:27:29 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF2B04E417CB;
	Fri, 27 Nov 2026 14:27:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 825CB6049C;
	Fri, 27 Nov 2026 14:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04CC211E69021;
	Fri, 27 Nov 2026 15:27:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=;
	b=udHo41LZ9pUYk5V1GKFBsW+tpcv8NEvbhIdv1MV7PCqO9109uFbTupw+GGlpLp4jY0jUNc
	8m+eKM5zExD2ih/EIGrU3+JoJ8HjqcVBNvsxBzTVSoYjikEcax9o94bun1EBRzj4Dgl9er
	R3Ne/Rmgyh9Z1UEMsL8hTkFQ97NmuwtSmKbPC7xpSOXEHWHiLiPE6vAWniqV6lCW7PrzpP
	fQuJovv/7NBZYLkytUwsR+IF9dlAnOdttrpygKXOk/aBWIRzzizFgPBE/seqiHsrVXAUoC
	fp89ZOlDp0u7aUFZRg9hxGo1GrSFPklJCBEECRWRTrr2cxGxVvNCqgFX8wppLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:52 +0100
Subject: [PATCH RFC v2 30/35] spi: stm32-ospi: Reject excessive dummy cycle
 counts
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-30-5c93f5e5d630@bootlin.com>
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

The controller stores the number of dummy cycles in a 5-bit field.
Prevent field corruption by adding a proper ->supports_op() callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-ospi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index bf42f46ce194..30d48ee1be21 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -772,11 +772,17 @@ static int stm32_ospi_setup(struct spi_device *spi)
 	return 0;
 }
 
-/*
- * No special host constraint, so use default spi_mem_default_supports_op
- * to check supported mode.
- */
+static bool stm32_ospi_supports_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(TCR_DCYC_MASK))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
+	.supports_op	= stm32_ospi_supports_op,
 	.exec_op	= stm32_ospi_exec_op,
 	.dirmap_create	= stm32_ospi_dirmap_create,
 	.dirmap_read	= stm32_ospi_dirmap_read,

-- 
2.56.0


