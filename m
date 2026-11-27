Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023C606B18E
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zAkwwjJh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbLx45hBz3bmQ;
	Sat, 28 Nov 2026 01:26:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789577;
	cv=none; b=TdJ+EISrfaHsOkDU/3DZP6XtxaYI9pgtGRujSG+TquJBL9BI0nQCi+53e3t3wAJn9GGrY360Gogb8vGmaYQZkgpvmEgz8vSRMPPvrwXqf0VN/lFy9BHQzUrw32qXM9DpUbKHFHWiK7Pv2ndRgV6Ia6kjO/CB2fJe4jRxPeYqiAIgsGMTXE52Fflsnlm39GNVH020xQbz+EZwzguEKgqZEJpkcE1fLf57DXe5Oi8cV5snLTcixKBbfoifVHngeOjqngBoZqiXa/yFjKfgXkv4/VOo4RYEF6rVGIxU67YjgFQEGXoc3TlwyMA77oH3D+j2LCuXtrz+0ZGOWpTVS75jfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789577; c=relaxed/relaxed;
	bh=AoxU+JhvKBTXrYbtTbJzsGk9QEyditaab6z3oGK2TJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqqI0ZiGB2UPdWg7uiRPcCHEr+yQImuJu9qzVyYCrbLL7CU6Yn5JQxLULukGz+Vu1vlfipcRQDxenahUHLJWgSxQBzUSg4U8Tjk5Z0Y5PnlCYJhHEodkbFVRZVgQHS+JB/MlnN9s6kUldP6/rqeCCt+RjVxNujDf62VNCp5Jz2obrmwSdX7lTcMHeWhp40usF8u/fDgSaIvHaOK2A0if5OW8pzk/prTOcrYAx+RyJk+3LHO8aZ78uL33S+HZ+/by1H38jXYo0hiRmjEwHKK6rAlNeZJ2YHbvEx9vb4bdtg9iNNKUyfUV8JRG3DZXkQqmJrTMiXxHCgWG3RcTuTeERw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zAkwwjJh; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zAkwwjJh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbLw4YhNz3bQl
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:26:16 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7EE7DC2AC4C;
	Fri, 27 Nov 2026 14:26:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B32536049C;
	Fri, 27 Nov 2026 14:26:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC5DB11E68FF4;
	Fri, 27 Nov 2026 15:25:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AoxU+JhvKBTXrYbtTbJzsGk9QEyditaab6z3oGK2TJY=;
	b=zAkwwjJhwVG0zSV6YA46JQojW1bolXRH0EAHLZlwyqXLXtk9FaxqcsUZKb+OQ07CO9PpA4
	KfDre7rmcmytfCYVyYQ/OPPYrgRL6OYfPg+JczDL2rRTLqgsiKqd8JeYHfs7JrB8GOsNf8
	kl17IMq1kAfobSqitEG6cidb+v+vQDJ85/q88WXuQEB+rNQg8RJyVPQA6f+UfBnf4WRIBc
	IGFxwV1X5/oObK49PmVtOCrbpeahRDC87AewuGKejSG2iCgDQZoLexg4JQdwtq76TRMFbI
	pA+e5j/GlD477cxLSbyqWFl/HVZGTzoDgvxYow1S58Kv/pjmgX0fa86bkaMgpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:43 +0100
Subject: [PATCH RFC v2 21/35] spi: nxp-xspi: Fix a comment
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-21-5c93f5e5d630@bootlin.com>
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

Looking at the i.MX952 TRM which is I believe one of the SoCs with this
controller inside, the maximum number of supported dummy clock cycles is
64 and not 32, so the code seems more accurate than the comment, which
needs fixing.

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-xspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 8b836662a5da..ccd00c744d18 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -407,7 +407,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 4)
 		return false;
 
-	/* Max 32 dummy clock cycles supported */
+	/* Max 64 dummy clock cycles supported */
 	if (op->dummy.ncycles > 64)
 		return false;
 

-- 
2.56.0


