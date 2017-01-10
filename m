Return-Path: <roblip@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyDPh000nzDqFh
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 12:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IGMrsxjf"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id f144so7075497pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 17:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9e7IDkO6cCKzxpF+0MLiWFVW3AMlA/BY/WQja0j9TTA=;
 b=IGMrsxjfT0gEfTXuMdlWzZZZ/A/nLZVSgirftwW3Z1EG0nWpzY7KRHpxd9aGMu3sdz
 3GpgRhuepqjNWKkMotG4Q8YyPvSCYN0kgc8dl3F7zu6VnqlC8qysE4dlta+bhX+UiRW6
 fjbRTn6kt1aKSh1scOxWREbwTQ6tQGHhnzx+BXuyN5D82rKwyXc7NcbpmKwT/Atiu0pK
 kEj8ID34TBmrVfKLF3FW8+3XmjSR55fFimkG8VjKaRfRcoxSwlclVvwX8e6JslB2FDjO
 WIehAHW0ZY0+5pjBPu/8F5ImCWUJTuPV6xo2HFWHMRfds+VlgE23ckZro8TW14FkqVlX
 Bblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9e7IDkO6cCKzxpF+0MLiWFVW3AMlA/BY/WQja0j9TTA=;
 b=cIV+pC75zRFkol6Of89DfTouJe0QW1MmYxmgK6xzuEZJglOwHqFSPjJWDsxLDh8VgS
 Um5pzzCmMYQJtc9V/iRDcZwMKE3DeWTR19Zf7+A+LAAPxdjkY56Yobt8MYX5nsax9LQk
 FL4q3zWUpOH1hGHQpD3hsyk3yyO20z9yvjKnjXJDD0RZdQP7ux6O8f/YwJD5AzZOkGzb
 ffSE9LlShy2mDJa1jTdRRfmbKsfTmSug6AUNd0ecxDskIwF9FKdCvnBpv/rnaMHE+qFA
 catZwV3q6otRTJa/IoTjwt0F8CUxbY+UBg8oaO99u0180QYDVHVrngJGAZGFVt12bIEf
 WXXg==
X-Gm-Message-State: AIkVDXLLLA4C/DYG6+jMVFMEgpKHFwgK39keQy5HnnxNhrt+9jAymmhBInfNtg1xTMJVIw==
X-Received: by 10.98.200.5 with SMTP id z5mr713118pff.0.1484010406395;
 Mon, 09 Jan 2017 17:06:46 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id q14sm277678pfa.40.2017.01.09.17.06.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 17:06:44 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux 2/3] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
Date: Mon,  9 Jan 2017 17:05:22 -0800
Message-Id: <20170110010524.116687-3-rlippert@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170110010524.116687-1-rlippert@google.com>
References: <20170110010524.116687-1-rlippert@google.com>
X-Mailman-Approved-At: Tue, 10 Jan 2017 12:21:32 +1100
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
X-List-Received-Date: Tue, 10 Jan 2017 01:06:48 -0000

Implements support for the dual IO read mode on aspeed SMC/FMC
controllers which uses both MISO and MOSI lines for data during a read
to double the read bandwidth.

Signed-off-by: Robert Lippert <rlippert@google.com>
---

 drivers/mtd/spi-nor/aspeed-smc.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index d3bed34f5aa0..a8ca2ab308d7 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -540,6 +540,9 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 	int ret;
+	u32 ctl;
+	int i;
+	u8 dummy = 0;
 
 	mutex_lock(&chip->controller->mutex);
 
@@ -557,6 +560,18 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
+
+	/* Send dummy bytes */
+	for (i = 0; i < (chip->nor.read_dummy / 8); ++i)
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
 
@@ -868,6 +883,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 		cmd = CONTROL_SPI_COMMAND_MODE_NORMAL;
 		break;
 	case SPI_NOR_FAST:
+	case SPI_NOR_DUAL:
 		cmd = CONTROL_SPI_COMMAND_MODE_FREAD;
 		break;
 	default:
@@ -876,9 +892,13 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	}
 
 	chip->ctl_val[smc_read] |= cmd |
+		spi_control_fill_opcode(chip->nor.read_opcode) |
 		CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
 
-	dev_dbg(controller->dev, "base control register: %08x\n",
+	if (chip->nor.flash_read == SPI_NOR_DUAL)
+		chip->ctl_val[smc_read] |= CONTROL_SPI_IO_DUAL_DATA;
+
+	dev_info(controller->dev, "read control register: %08x\n",
 		 chip->ctl_val[smc_read]);
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
