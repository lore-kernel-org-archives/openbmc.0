Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C7F606A323
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbHw1kC0z30C6;
	Sat, 28 Nov 2026 01:23:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795789419;
	cv=none; b=TpifcnSUvTCda/rjctGcMf3kL/M1wCHZMxFwivbggJRTQRJebWZfrI1lqEND97w+5WbIuuEtMe8QOnihBKsBLIMioSVL2bKJVNruxXH15FMWqR24fDA/k6y5BVPqwH7sfXlkYtjNQJCWOgUsh73X0CG1YLg0izZ0PuuLH4eb5s+NMkXJ77K3I9m4DOCAiTwo1AN4eOM6o4bsBJtuqeys+sVs8HcDr5eqb0iEhmxGyfMxxRKqcYFFmDMpmKyhpUCRUCeo1V48fd56fVZtu7zFWM+Yk5RC9ByhTMMIIGgAfRDSNfgWKvPtWqwHYyVwgF0DXrHmuqJVzDGfHfnEFtjsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795789419; c=relaxed/relaxed;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwYT/arlqZnlYZdZkT1CloaZup8TklTWDrv3ioMGi+LnZ+wW2dw054kSJoJj2gP0cQViIAPX1ztFdZoMOfplUwPFvGG0nuC3qy6mcN7AwiyQqASYdzKXFCPAohYTQoxIx5mQKBCaIdSRSjMzqjBY1Qrs2SnY9Vpi572r4p9zy1ryJMZassowpnlLMioaO/HTzc05e0zKE4v3Rc8/a74bpRYEJicpmecW3e9QEf0pPI7nsaAdCCMMW7c/cMLgLRvJMGE7axVFMNhqPrM+LghwXgIeINdxt7TRF6HY9RFRlirpLxALkrmWj+v8OnbIItcCk3clYj2cJrR1WnvDmqLeeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbHv2CGKz2yMk
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:23:39 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 312B0C2AC4D;
	Fri, 27 Nov 2026 14:23:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663A36049C;
	Fri, 27 Nov 2026 14:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC0E11E69006;
	Fri, 27 Nov 2026 15:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=;
	b=qQwaRkz1NcTtKMJ3rcaD9AaD0G88VYsq9rRXNdRhGxFwrpHJQNa4Qan2umCsy+PgAzkjJi
	YbIeVsEiyfbdLNBIWdd319ntMr1ek7feEq/y0wE2JDkJRgY51bvte2zxJidEhNgWWLyVtt
	5fT4uEQYUESgkzfJYZG1S1+J6VsQWhjPWLBP8TGnXE4GP52SSYhPaagtRkLcR046vEep9V
	/7NBqPAyP0q9YFqATDPFlJR4ttvE+XUEYcuGcu+Tfz1BEYBsfm+/R6dvMss+C4T3MmNQMB
	LK48fjtnD5qHJws2gtwCMBizByQA/gXTJ0ray9Gwg35xbRdb/lRy8A95FuL9CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:24 +0100
Subject: [PATCH RFC v2 02/35] spi: spi-mem: Fix the odd byte count error
 message
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-2-5c93f5e5d630@bootlin.com>
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

The check rejects odd byte counts but the error message claims that
even byte numbers are not allowed. Fix the wording.

Fixes: 8618271887ca ("spi: spi-mem: Limit octal DTR constraints to octal DTR situations")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 648982350863..f4d71f740163 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -188,7 +188,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			    (op->dummy.nbytes % 2) ||
 			    (op->data.nbytes % 2)) {
 				dev_err(&ctlr->dev,
-					"Even byte numbers not allowed in octal DTR operations\n");
+					"Odd byte numbers not allowed in octal DTR operations\n");
 				return false;
 			}
 		}

-- 
2.56.0


