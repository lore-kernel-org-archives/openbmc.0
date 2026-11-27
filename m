Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C761606C2FF
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qLq/w5HZ
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbKH12bcz3bdD;
	Sat, 28 Nov 2026 01:24:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789490;
	cv=none; b=a+I5blxz08mvrfo3S16AQSsyAhgLKejC/Quhamqew9rj59jHVMfZdBwmITHCFGbMLqClWeHpKSlWJnRQa8KrhxgAsh1BJYB5Mhwh98KZ8y7P6N57no8QgDE8Za80obqFNX5lJf9ER55Z1IjqMEoPdNQLrc04Q06tyU4/O2Lajve3C07FOesQf1EZz+lhwKJllacByqeI7WhVSvsMQT8w5HuwpL2YjSZ8j934jdL/HW/LVUQt3g2XcBGjQUq9Nmui8QHbI4zETGfEmAqQVIGQDp7Cga0FTPxm3AqM5LMdpJjZ7It6/RN/R37mnlxUeQTfWCBSwAnD8E+tp1VLBvVy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789490; c=relaxed/relaxed;
	bh=M2k46SqZeFAHhImutX8AfiF7k/5VtRokj0DSCN0ndaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dC5xmAVXq6VaXMC/V6CtqQwutyh7is9k1sVJluR6PGo+O1ngXawRP0NISxvZakmiElBzKhgG3UJw+gdI79T55Fi9RtWRJldDS2QwQZt9AKapfa9RS2W+muqPmVRyZ4BxxO+kM6x84++seDbF5GJM9cURkAGdDW3RukWgXa5mKGyzpx/3ylXzkcDgtmwNwScvd8ImnCUmYE1MAnRDVWla3vKl8qP8iWmU+/6fnQMOYEmMSIj2G2N6aIl8TaZswOS/SvX2a2ZH6qfK+ok9IA9IG6R7z4JG1vEdjo31H6rj4m0LHbMZHESP17O8Brm5n5FBGK4iC4uo5eiBi/u9XaXoLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qLq/w5HZ; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qLq/w5HZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbKG2G79z2yMn
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:24:50 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E466B1A183B;
	Fri, 27 Nov 2026 14:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B61366049C;
	Fri, 27 Nov 2026 14:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C17DC11E68FF4;
	Fri, 27 Nov 2026 15:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M2k46SqZeFAHhImutX8AfiF7k/5VtRokj0DSCN0ndaQ=;
	b=qLq/w5HZ31eb10uUhvMBpLQ5NKAns3tpw/zvBm1CjdBwKY6wum6rePPCIU6Qx6jQ7XlGJh
	ZLLUQTX+BUv/bRtoN5wBzgzRON8u75S5IZXVCmDh5lrqqVehTytTe+9hhyeP0jC7R9Az6J
	ewDDWqzH6IFrt5FH7NpaH4PpzR4qtVuCRgw9EP8b9dpukz12WH4JaYoDIaJmqQ8cOhxffw
	gN9LpHygIsYKbavexGfIueJdC9XGDsPzwTeqxnzWNML1EMEVTCaV9swLofwZFzS9vmaPcT
	lKNF1VjGcTLnrExFNasva/MMGOxKlR9jimuKh7muUV0nQ3ii7KEL2FVlwf97xQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:33 +0100
Subject: [PATCH RFC v2 11/35] spi: atmel-quadspi: Reject excessive dummy
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-11-5c93f5e5d630@bootlin.com>
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
Programming more cycles would silently truncate the value and corrupt
the transfer. Add an extra ->supports_op() check for that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/atmel-quadspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index abca99b32b61..8946abaafa81 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -487,9 +487,15 @@ static bool atmel_qspi_supports_op(struct spi_mem *mem,
 	if (!spi_mem_default_supports_op(mem, op))
 		return false;
 
+	if (op->dummy.ncycles && op->dummy.buswidth != op->addr.buswidth)
+		return false;
+
 	if (!op->addr.dtr && op->data.dtr)
 		return false;
 
+	if (op->dummy.ncycles > FIELD_MAX(QSPI_IFR_NBDUM_MASK))
+		return false;
+
 	if (aq->caps->octal) {
 		if (atmel_qspi_sama7g5_find_mode(op) < 0)
 			return false;

-- 
2.56.0


