Return-Path: <roblip@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynSg1jq3zDqGv
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rgo8jaWg"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id c20so14288939itb.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9/24dqv/SFUIgYco87ZfFBdp25EEW3yBxawNkYWRTlw=;
 b=rgo8jaWgWLnydnIhCZXYFvC3dl3a7a4JQmfCWxmO73kVDm5YkNKEEzv/SjEe4dyCqU
 NVym7RdJI/oocEyY8+F+vZ2Q4VjtUwKJBdNTJZEDulFu/FffWhbgG2qClZ6D49wwtMQQ
 aJZqXxCx8PnQEn9dspbd8wKwO7AX+keNIvnZ2MSU1Qb6Kw3GAr0kQbaYAU7gwQpyATHO
 AbOsXzdJJNdLMiKW7ZO0QllRFOQgvzg+IZeaY0irX2hIihn6F+19Hjy8uwKSu0wVygJX
 JO/INURm/5AdnfGpq4Rb7JGm7fsOEN73dS5P9KXEClJHTrkAq55n8KW481mIE+lKXxOh
 rqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9/24dqv/SFUIgYco87ZfFBdp25EEW3yBxawNkYWRTlw=;
 b=k6ca+jAk9wsPwdCNv3gFE0LUGwXpC5kcKMBkI5k3QEo2cs8rFP1ypCMQeeAqgY/kLi
 Zo68iZ/6EEH+d0AUFMuxO0mk6r9oY7CdhfoJRnnm64oD07RcUPxPdzjymzgDe8Fumkaj
 SPNKIu2iKPkRvSqf1OrLDzrEu4JC9wsCT4GYq5zc99e6gJe1eOWTP9pG/XRAYi+Pw9hB
 gjq4sNe90LGFnzaYhyREbWuKSfC9PPwD0qs4F1vIeuHtE3xfRWfSSrFXFu9kDQa5vulb
 N4g6tdVapsw9omqPUj+9/WxUdY2AuJUPqiY555HHHz/QB86WXNr4s67mTTr32H26Ha7k
 DEqg==
X-Gm-Message-State: AIkVDXKJiuJ45707pNw5GJ0QrswmCBkCnr99y5qgQ9APYov+Sa7pJEPJjF5bFCvS1Nx6Rg==
X-Received: by 10.36.74.67 with SMTP id k64mr5366475itb.37.1484088977163;
 Tue, 10 Jan 2017 14:56:17 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id f4sm2035948ioe.40.2017.01.10.14.56.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 14:56:16 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux v2 2/3] mtd: spi-nor: aspeed: add support for SPI dual
 IO read mode
Date: Tue, 10 Jan 2017 14:55:54 -0800
Message-Id: <20170110225555.117814-3-rlippert@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170110225555.117814-1-rlippert@google.com>
References: <20170110225555.117814-1-rlippert@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2017 22:56:19 -0000

Implements support for the dual IO read mode on aspeed SMC/FMC
controllers which uses both MISO and MOSI lines for data during a read
to double the read bandwidth.

Signed-off-by: Robert Lippert <rlippert@google.com>
---

Changes in v2: None

 drivers/mtd/spi-nor/aspeed-smc.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index d3bed34f5aa0..3c8e897048c6 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -540,6 +540,9 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 	int ret;
+	u32 ctl;
+	int i;
+	u8 dummy = 0xFF;
 
 	mutex_lock(&chip->controller->mutex);
 
@@ -557,6 +560,18 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
+
+	/* Send dummy bytes */
+	for (i = 0; i < chip->nor.read_dummy / 8; ++i)
+		aspeed_smc_write_to_ahb(chip->base, &dummy, 1);
+
+	if (chip->nor.flash_read == SPI_NOR_DUAL) {
+		/* Switch to dual I/O mode for data cycle */
+		ctl = readl(chip->ctl) & ~CONTROL_SPI_IO_MODE_MASK;
+		ctl |= CONTROL_SPI_IO_DUAL_DATA;
+		writel(ctl, chip->ctl);
+	}
+
 	aspeed_smc_read_from_ahb(read_buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
@@ -870,16 +885,21 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	case SPI_NOR_FAST:
 		cmd = CONTROL_SPI_COMMAND_MODE_FREAD;
 		break;
+	case SPI_NOR_DUAL:
+		cmd = CONTROL_SPI_COMMAND_MODE_FREAD |
+			CONTROL_SPI_IO_DUAL_DATA;
+		break;
 	default:
 		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
 		return -EINVAL;
 	}
 
 	chip->ctl_val[smc_read] |= cmd |
+		spi_control_fill_opcode(chip->nor.read_opcode) |
 		CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
 
-	dev_dbg(controller->dev, "base control register: %08x\n",
-		 chip->ctl_val[smc_read]);
+	dev_dbg(controller->dev, "read control register: %08x\n",
+		chip->ctl_val[smc_read]);
 	return 0;
 }
 
@@ -980,11 +1000,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		if (err)
 			continue;
 
-		/*
-		 * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL attach
-		 * when board support is present as determined by of property.
-		 */
-		err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
+		err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_DUAL);
 		if (err)
 			continue;
 
-- 
2.11.0.390.gc69c2f50cf-goog
