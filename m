Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B2606E101
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VUC9H8n3
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbJD1yWGz30WT;
	Sat, 28 Nov 2026 01:23:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789436;
	cv=none; b=Eq3JyL5Arc7+yLlbhwxrmMRi3jcIQHhEbUYAalAxGvfwH+wnHiZim2VL5Qa2eOnBGYN+qN90qLq1c0qt6eDUpLcBHNCcGDfMgyfi4Yp4Ga+0x1+incxfYxsz0F457gNWHf9JJmwgAF4FTLU1CXAa1FfWZ+LUvQPPh0fz8VJfgT5RbTq9k4upiXZzVJeYOFbQ225Qr0T4yLr0HBWsgdPiJCM+4MHJ5GgqYl+G2pGVgBhJNcsniziSXvRWnWPSJ3EIks+ySB9NPVEmPmkAT0bgxtowfpy68p0Th7RApraO+/psYmdONpWE3Uzg9Wfmwav2aiqS7L6KvdHL7gypthVKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789436; c=relaxed/relaxed;
	bh=rLV3AiVfesH7+JN4SghWwMFjSPsBHJqy3yngjEbzPMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F0OgAKr+qxJGp2iYv2UvjDJ9Cre7KQRBYY6Hiu+dk9j59xVvi+A9m1ncpBT0iRF86qwCQ0SpflhlncEE0DKzDLCTTJghjAcHjAO687VtGMuixYee4mmjhpqx0Z+YoiK5VivHHI0VaAGW33mLkwn2laFZGdSilxgFwD3XC5fUD6OZ3Gt+TNEBVLTr+lw5i4yspM8wUZ9KAp7upoGcmGDe3Gh3XE64DjN+fBDIkNJZA6ASg2K3EFPWD1NuN8vva++KgUwUB1zDvWIp+icIqJWIkq7KaRhQNyf2j4FyghziCt35I1+7H/nnf5lmebnAProMSSPtwCJUQ37Rx9DAHXIvmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VUC9H8n3; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VUC9H8n3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbJC2YCtz2yMk
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:23:55 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22E67C2AC4D;
	Fri, 27 Nov 2026 14:24:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 547B16049C;
	Fri, 27 Nov 2026 14:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6422611E68FDF;
	Fri, 27 Nov 2026 15:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rLV3AiVfesH7+JN4SghWwMFjSPsBHJqy3yngjEbzPMg=;
	b=VUC9H8n3pAarXQo2g6qN067XkCpnQwpm/9E/2Hk/I/tB2/1XjdWLGM9P4hBoCk9E1JFxvl
	7J73tquQz2tKFGE2WS1IAUZmedaT+KEy8IOWHjtt+NZ5NVCKpzAogmzQQ432xXmK788h7I
	OPnifGiuXyvdQgpKjfmZW/6R/gmGUXYAqZN5x8erH8kLD7UZmo88dREo0edxaZo7/VHVOB
	O8HcV8efoiegMzRWc5KP4Jp+8apQaRGkS6nhprcWVDoH/FjQQxuOI06RFltCq+Kqlauzdv
	16TuJt77aMuawELzzNmaPR/mVBrmDeGr+G1nP3Q9031kHufg6haf+aH0byuP1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:26 +0100
Subject: [PATCH RFC v2 04/35] spi: spi-mem: Sanitize mixed DTR modes
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-4-5c93f5e5d630@bootlin.com>
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

The following operations are supported:
- S-S-D
- S-D-D
- D-D-D
But the following are not:
- S-D-S
- D-D-S
- D-S-S

Make sure these cases are refused by the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 3989017dd86f..25f795d5e9ba 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -195,6 +195,27 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		return false;
 	}
 
+	/* xD-xS-xS is not allowed */
+	if (op->cmd.dtr) {
+		if ((op->addr.nbytes && !op->addr.dtr) ||
+		    (op->dummy.nbytes && !op->dummy.dtr) ||
+		    (op->data.nbytes && !op->data.dtr))
+			return false;
+	}
+
+	/* xS-xD-xS is not allowed */
+	if (op->addr.nbytes && op->addr.dtr) {
+		if ((op->dummy.nbytes && !op->dummy.dtr) ||
+		    (op->data.nbytes && !op->data.dtr))
+			return false;
+	}
+
+	/* xS-xS-xD-xS is not allowed */
+	if (op->dummy.nbytes && op->dummy.dtr) {
+		if (op->data.nbytes && !op->data.dtr)
+			return false;
+	}
+
 	if (op->data.ecc) {
 		if (!spi_mem_controller_is_capable(ctlr, ecc))
 			return false;

-- 
2.56.0


