Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50BE606A68B
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XaxpBtto
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbMv6hPzz3brP;
	Sat, 28 Nov 2026 01:27:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789627;
	cv=none; b=n7Hs1YwIlTrE8LeDH7GaZzNOXxCePR4jE4mjVAZBjDKX5Cy825SPKYqqfIPVkH7hq1R8oXdIDKd95QFQI6uUlGcEIT4sp2ljx+mgJmnYqJVC+yRxHGGvP4wjATd5MH2FmFy2x6sShgE8kR4QZUZWINyFcc5Y2+K+0mMyxON/vqb/I0TpI5LHkZOkjpY3hdikQ5ktXfnW/RePLtHVJV2KApSyq59pLMWD82aOdQqePtud0RoXMjkwAd4eLOO755M/L34r9JSe1YdZOG1hRMTdE7oBlaVzp88Yni5dlDMDSYvX+PKZPP1ca5lJbso62NPhHzr2i0HduKpwRQ9R+1cWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789627; c=relaxed/relaxed;
	bh=Yz6ZHF4IiJQgqN5fGyCKopgkxnOtrQuXNS72mjrBGKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6W3sm6RDEKJP3igk1eG8j3W+fbjjeYpVa7yr1SsbFw2sJQHVlO6A26aWLwUtqNLJrQg3ddqto5txu5pnLCmc0LVN//Irzc60KUw9U6I0uIvB28+JbmtbOLRPyDxmIwcDrh5zyTSTVtMGdo2OhkrbqzM9g452jFVF7kniYYHAVTHnO5hYjLt/JS3o+QOf6sqVPgR9864DuduMGITc5Oggksp3Q6v6VCwPIRig+k6GA0f2dp5V20AASzs+YtLZ8tRtIOO+UR8h6Q1DMd+E4CAbYTSSccgqR/90TJpXoIRLljQ/BG6Vcx5Hq/pHo51Lp9H16cCy25DcqyHJHWlGLjA5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XaxpBtto; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XaxpBtto;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbMv0Rqxz3bgh
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:27:07 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A87F51A1838;
	Fri, 27 Nov 2026 14:27:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 739C36049C;
	Fri, 27 Nov 2026 14:27:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3B1411E68FF9;
	Fri, 27 Nov 2026 15:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yz6ZHF4IiJQgqN5fGyCKopgkxnOtrQuXNS72mjrBGKo=;
	b=XaxpBttouWRivkGS5XBCoKMKjn9+r09abbOOcttCyqgQiDM47o2QC6SVNrFvwZBPSI60dJ
	XsMCzDDNjhx7H8L+HmQYdSmfxQGo0gWzZJ3aqyOs5wBZSk/O9s4UeoTuEluIkz7Kj4yfXD
	1MUrFpvv1HGNwcKhMLSZksf/tciwr2RDI12qctgPjNsotVQ24IADBG5mBAWgZ7Bw4xG9Sd
	RM6F+MsWSqAxEd27wlNxwmKGTOMQ0+PLCX9HURsBYqdGS0n8dwNyxveIh1us4fMaeyWf9u
	86oV9TcgN4S2eP+kPduNd4KKBgUcpBrfkkyNEVmiWZkMP7QRX/qgNpLcWdwTUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:50 +0100
Subject: [PATCH RFC v2 28/35] spi: spi-qpic-snand: Drop redundant check
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-28-5c93f5e5d630@bootlin.com>
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

The core already sanitizes the spi-mem operations, this check is
redundant so let's drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index b03e2e4f0f0b..23f78171d27d 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1531,7 +1531,7 @@ static bool qcom_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op *o
 	if (!spi_mem_default_supports_op(mem, op))
 		return false;
 
-	if (op->cmd.nbytes != 1 || op->cmd.buswidth != 1)
+	if (op->cmd.buswidth != 1)
 		return false;
 
 	if (qcom_spi_is_page_op(op))

-- 
2.56.0


