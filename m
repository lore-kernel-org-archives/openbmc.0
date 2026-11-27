Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B70606B43F
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbKp2922z3bh4;
	Sat, 28 Nov 2026 01:25:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789518;
	cv=none; b=XDv5SdszxqpqAJMPRfKabM6Z1uZx60qYzAD09PX2aRTSY97RlqG1gxQixTGBWoEEHtNShwBTd+Hn4U19AQs8YW2P8GRFgBeKcyZL8bmrhrlmKSIxAd18M5JJYnWxx/1/SJl8KKJKndNcnphfbjnkUdG6ruv+p4n+m6JkhD/VonqDhTW+yk/uhd1gE2Abuty7s0EXGbLRWKa+cSy4cbkdbO1PWhMr4rts5/pZ8G+lm/GPmcspAlHyD72NPar2FXLiJ/2BRDeM83CdeQnhhXiU/Hik8pv5fzfDverTwuPIWL2d+3D8MNlY6m/bLOnUTg8tQr5tk2tlC/jlnDveo0Jl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789518; c=relaxed/relaxed;
	bh=jwWNjtl5ORcZ1deftfr5RsBJJtV3zrm7nwySNJ1wAXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUu8BckEgAzm8V0fbD4IW8f2x0z0otWi+QgeL4TqdlrYP+Zw2hnQTTl6m5UKw5E35fpz5/MZDnz+L+7J6L8b/sAbKN/cKWBAGatrFoVBQBXhTy/Su4WVrZAdYrem8u/1aXhDc4uMcsUFWNnx1zYhyV1KuNk6rLgXYkN1fI6J+PZ4GES9kOEy5PH767PtS3ImBJiaL9S2nE+QRXyEc2qSg9d1o9XkMgoNXlqSi6TLXRp0bG9agEFqyLZzuIs7nYGz+83qs7zPB9ZrVVd/3BempryXzLHfoZruemLz6wuZ8K4W6P0n4le4RVmeKq7u9JZfivAeor/MflqUdkauoFMZaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbKn3fMfz30Vm
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:25:17 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20B2F1A1840;
	Fri, 27 Nov 2026 14:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1F2A6049C;
	Fri, 27 Nov 2026 14:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CE7911E68FF9;
	Fri, 27 Nov 2026 15:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jwWNjtl5ORcZ1deftfr5RsBJJtV3zrm7nwySNJ1wAXA=;
	b=UGbmJbOdcNVCi3ELelQsVl1jbj/ViXJ795sQ5pB3eqnkHRfW37/lv0w4DTEUZsimBvjKCZ
	bwLNRPX6CT6PCRoWg4O8d0RqL8UAZjsezDbumzXw1CxZHA6jNaFMZm96NIyled1ziyLbto
	EDofliexKT20UNgI/5pJY4LUYzTNFdlI8Y+PHZ1gbd+CdwFHrEYUQSkSfi+aUFjpRu06Tk
	zbPC6kZLAYg0sGkrMBcyaw6bKjWtQzrQOmpW4Ka+gZ/Hgi5+nlbcUbjGZ5pzPxjrE2Wasr
	ysa9IYTRL1ou53CorKfDhH/uN5bAQr9L6imMuj7CJS7cODFKpnbgndqbzELLtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:36 +0100
Subject: [PATCH RFC v2 14/35] spi: cadence-qspi: Drop now useless checks
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-14-5c93f5e5d630@bootlin.com>
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

The controller programs the dummy phase in clock cycles, so the dummy
buswidth is no longer used. Drop the check requiring it to match the
address buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 97725ffeae93..d52e0aa1ea41 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1522,13 +1522,6 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		return false;
 	}
 
-	/*
-	 * The controller has no separate dummy buswidth: the dummy phase is
-	 * clocked with the address buswidth.
-	 */
-	if (op->dummy.ncycles && op->dummy.buswidth != op->addr.buswidth)
-		return false;
-
 	return spi_mem_default_supports_op(mem, op);
 }
 

-- 
2.56.0


