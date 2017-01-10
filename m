Return-Path: <roblip@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyDPm2zJgzDqFq
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 12:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEr9KYrE"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id b22so9629114pfd.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 17:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bUO/9XxONcjvRQN7ESLPAbADil7g38UzPR8tSnum9GI=;
 b=VEr9KYrEIqqTnWjCMFi3h29AflyoieUiN7o4uMy8dOAV/AldCETxJlYWGfoQQuMXzN
 CQ+RWwtYgSykNoShMQOvkTDY2VV1lSEGc3xQY2tzsUOlX+a50j2Vey5jIy08fWG9TrCa
 W4yHp+SGCHxrk6rhBkSIJI8mrNcWZbYhrXbZddGm/qt0KooRgumt3RiUq0MKN5K3ueug
 dw3lAAGIS3gEDWjtoqKhE9w6bQ3yguj4CZBfWxC4ssn10Kiv2o+WGTNp4UU+bfdVSpmH
 fV5Gzk1H9s/yFm1HkwKg6ueweV676lop99jmpOwxcU+tFJ7skYOzkl/xhHGO5p39PHC6
 KSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bUO/9XxONcjvRQN7ESLPAbADil7g38UzPR8tSnum9GI=;
 b=i6dU+6WqviHq5vtS7/ZlydZkaGOBGUo9WEvbgLCoPOR7Zu1OX6EOi/YaSl97QdrHkF
 GzmtR7mKHNSps0g/mr4ADayYpWOLGxoZ8vVxdj+BEpC3q0FLvZQ67tQnH1+vDsiXwYld
 c528DoLeqjRj+ER1wAb0kSFqTXHwUd9XL8bUc5l/vzFTGzmWlcbzNrbdStahVc57mm2H
 m18WeKCFw4+CYTx6bTXIsPNwKYx3vyImWUFRKbgnrglZi3X2kEtMfxVthzFRDEEhkPc/
 mUEU+2Ff3jFmMtTUSSa8lEasvXa5kEk90LYuzTGOJRCgrdYAebqseIOD8rbLUFcP/YrW
 z8/w==
X-Gm-Message-State: AIkVDXIv8o4L/S1/G6SeglVw6BhF6KwfrVIWSubegf5lKNl3dULUPU1EnVsqoWO4AzY/Cg==
X-Received: by 10.84.241.129 with SMTP id b1mr827453pll.135.1484010410467;
 Mon, 09 Jan 2017 17:06:50 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id q14sm277678pfa.40.2017.01.09.17.06.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 17:06:49 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux  3/3] mtd: spi-nor: aspeed: fix DMA access on AST2500
Date: Mon,  9 Jan 2017 17:05:23 -0800
Message-Id: <20170110010524.116687-4-rlippert@google.com>
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
X-List-Received-Date: Tue, 10 Jan 2017 01:06:52 -0000

AST2500 has additional bits in the dma_addr field.  Its easier
to just write the full address into the register as the hardware
will handle the masking properly.

Signed-off-by: Robert Lippert <rlippert@google.com>
---

 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index a8ca2ab308d7..6cf159741acd 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -349,7 +349,7 @@ static int aspeed_smc_dma_wait(struct aspeed_smc_chip *chip)
 }
 
 #define DMA_LENGTH(x) (((x) - 4) & ~0xFE000003)
-#define DMA_ADDR(x) ((x) & ~0xE0000003)
+#define DMA_ADDR(x) ((x) & ~0x00000003)
 
 static inline void aspeed_smc_chip_configure(struct aspeed_smc_chip *chip,
 					     u32 ctl)
-- 
2.11.0.390.gc69c2f50cf-goog
