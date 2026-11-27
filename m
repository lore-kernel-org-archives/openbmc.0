Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF58606A693
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbJT2PHDz3bNr;
	Sat, 28 Nov 2026 01:24:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789449;
	cv=none; b=jA3vbd/q1uLhpS3AkiHMq64floMg8j8BtR+E94cO0EKxh0JtaXJiYK5iEAaozxh+lM1OabH7xETfSzLI6G3NaXgIx7kTV1mMfez1NqhaQvvRG/WvHxWfSTgimkCC9WyXybcAIfdSxDWoyRHNBHpLSfua98XU9NR4oMOTMpwLHUGRsNvcaJOie7srh8/k1UHQRIk0LFwCoGa5vKbdp4wCXAfHrPWfd8UHfdl60cb52WtOdQYarTezs8968K+xhSmYfGWx/n2sax4WbsrOb+7hO7IA1+B/aCJ5xUnDKOeWc4osGuv1F8SqiLU2qMGSXyCX/RFFW/PvsipgtOdrWGbZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789449; c=relaxed/relaxed;
	bh=wxfJPUKHoAB+1K3wnXPXnqak814WKCu5TUfSaAEjIso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnmuMiIHsw+onkHpWKQli2PMuvzYH/towyH6oY2bpdUKpwKmATGmLSwkv4bLspFJN2qVntT9Hdf/ql2FoWZmYxS1aYgK+w57q8fKSJ/ANOndEHGXPeWAAXEq/Y0+2FzjhOjbFtXlMyz2rHRuT9s42NpfzPWx+q9Oo3YWFg0zyVrxP0wLYy999ndi091TEEvtNATL9ItMq1w+fK91rZYb9VvpODp8P3i8Len2YdUv4w9sWiWAW477v8gRqTeV1KxHE7AkKiWIolRB360a2WQQH0Ptk9qrSYdvxyoK8aRixx/LRkNTA1xP+BKyZd+guguguiDhila46gw5YU1djC8ibg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbJS3Dxzz2ySY
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:24:08 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 429AAC2AC4E;
	Fri, 27 Nov 2026 14:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72CDF6049C;
	Fri, 27 Nov 2026 14:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C07811E69006;
	Fri, 27 Nov 2026 15:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wxfJPUKHoAB+1K3wnXPXnqak814WKCu5TUfSaAEjIso=;
	b=KqziPh8ltiM8u5+b6eKfqHjpZwwL1tuSrz9B43KqmDBcTFYtGFxkYvIYsXji0ngHmJfQMz
	HMYknla3frw6GZAIimkPVVve5WfMCll0ltxhioVlYXjqQK8QDtC+0X4nyAizs1G2E8mjSx
	QEmiP3NpEAk1JuFMrlPs/jHoMSE3uRpjOgOXUHCyiijgIHx9/ZQG0DU/2WZILymrbq1sRP
	qgX5ttf/7/I1Ei7RuCVq0X1p4AtlqgzQ5mCqeZFZYv+l14QKJWryXuh/kRwtSZXUH+2o/P
	Br+32uJQRsmzsk7ElCYdt/m/ZNr1crLvAtt1D58vA61ocIx1A+3fg26Xcipd3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:27 +0100
Subject: [PATCH RFC v2 05/35] spi: spi-mem: Sanitize mixed buswidth
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-5-5c93f5e5d630@bootlin.com>
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

Buswidth is allowed to evolve over phases. Many controllers strictly
apply the settings passed by the core. In practice for an X-Y-Z
operation where X, Y and Z represent the buswidth of the command,
address and data phase, respectively. We do not support:
- Y < X
- Z < Y
- Z < X

Make sure those conditions are sanitized early by the core, to avoid the
feeling that these needs to be checked in controller drivers. The
implementation also covers the dummy.nbytes case with the same logic.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 25f795d5e9ba..a1f129c47698 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -216,6 +216,15 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			return false;
 	}
 
+	/* Bus width can only grow across phases, ie. 1-4-1, or 1-8-4 are not allowed */
+	if ((op->addr.nbytes && op->addr.buswidth < op->cmd.buswidth) ||
+	    (op->dummy.nbytes && op->dummy.buswidth < op->cmd.buswidth) ||
+	    (op->data.nbytes && op->data.buswidth < op->cmd.buswidth) ||
+	    (op->addr.nbytes && op->dummy.nbytes && op->dummy.buswidth < op->addr.buswidth) ||
+	    (op->addr.nbytes && op->data.nbytes && op->data.buswidth < op->addr.buswidth) ||
+	    (op->dummy.nbytes && op->data.nbytes && op->data.buswidth < op->dummy.buswidth))
+		return false;
+
 	if (op->data.ecc) {
 		if (!spi_mem_controller_is_capable(ctlr, ecc))
 			return false;

-- 
2.56.0


