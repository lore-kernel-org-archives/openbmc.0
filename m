Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJJyC0FWtzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 12:34:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TLQ2dL7H"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id i63so183270pgd.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 19:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=esn0h8022WxUZuysc7hvIkZ5X3P59J4tXBnSs5zuOZA=;
 b=TLQ2dL7HouBnbkU244ilDmQF+i1yDYBTiRcx/iCPM1b19CVLCWxTtAwPCLooYClgKm
 lZbwRwmRDnZlnWwgB2XG8wzNmhn8kCPM79KM0fpaj+BO4xD3A5FaO2YGjZorW+CFhOXI
 hVelDFwzr7YN1170VEtUAc3xTnyuvSks99romcIJ1l6pC2gcVnCSUxT6CPFW83GDxznT
 KLzzUaGn5Lj1nCmenwBdGoLEUk5KnPlEXJ6A/lLThUcb+5bwWLdtNu0wQvTU03CCYzyI
 SBw+yUb6QlbMlM/xJuYaF/NvtKfnDM73DTGxBjntAT8v2B0NmnB40qxJ7bYuf1NXo/Wg
 K4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=esn0h8022WxUZuysc7hvIkZ5X3P59J4tXBnSs5zuOZA=;
 b=WtJUmSDhY347Kq0JIxZT4c+HBA16Bxvh6yxdPeh14/Yn8O9Hi0e6vgkYi4EmY2BB+P
 GrpEIkaTGs91aOOx5HcMbBKYI55jIaCH8dEhWLwcSg0aAIzYLTsjnWsr8LTY7UKEqWHF
 wuo1d7MW0ZS8lgQEAArPmFx/7x261KGCUpr4p+CD5Q15+XSSlFZpQKJQjiC+XLaDy0yc
 akUkQc5Wla7D9KeYWPmqg5OGW6KJkJ6Y7UozJaSJ/8M+c4fcuEVLC1jgbBfbFdG4cOda
 QTzJUvOuOJfIxsoevts5eX1OGkDMPAYNhyPkR08oWn1uVRXPQ1+FJIUnHQDRGJNn7uD2
 tJpw==
X-Gm-Message-State: AN3rC/5NQ54AZocA3JWXP5EEYXQb1kSuSYTCkEEe9aj7FCozywn326Gq
 PuUrsruSvJhEv63lGT4=
X-Received: by 10.84.238.200 with SMTP id l8mr700832pln.85.1493865264912;
 Wed, 03 May 2017 19:34:24 -0700 (PDT)
Received: from aurora.jms.id.au ([103.232.208.194])
 by smtp.gmail.com with ESMTPSA id b77sm729431pfe.39.2017.05.03.19.34.21
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 03 May 2017 19:34:24 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 04 May 2017 12:04:18 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10] spi-nor: aspeed-smc: Fix flash window size
 message
Date: Thu,  4 May 2017 12:04:16 +0930
Message-Id: <20170504023416.25653-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Thu, 04 May 2017 02:34:27 -0000

When booting we see something like this:

 aspeed-smc 1e620000.flash-controller: Using IRQ 17
 aspeed-smc 1e620000.flash-controller: DMA support disabled.
 aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes)
 aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000- 0x22000000 ] 32MB
 aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000- 0x2a000000 ] 128MB

The lack of space after the first hex number haunts me every time I
boot a BMC.

With this fix we see the pleasingly symmetrical:

 aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
 aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 875b029198fc..23622bf62b6b 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -709,7 +709,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 		size = end - start;
 	}
 
-	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
+	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
 		 cs, start, end, size >> 20);
 
 	return size;
-- 
2.11.0
