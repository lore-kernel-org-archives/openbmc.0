Return-Path: <roblip@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynSj4RSZzDqGh
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:56:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5H6xVdH"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 203so11229407ith.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tsrPHf7LNE7N0dgvIeJwOFwQpRG5qjurHjF4TZtbgxo=;
 b=G5H6xVdHgMLypyOU53d19E5/UA6Gqu5+iYD9I6ylLQzuYi7gC/+CTtUuNRmDByCxmX
 K0wlTkGHyXT16DWTR5mgnRDBVEk+RCZ7+wAqKcric2ybB6pbE8VW5QbdDuogJr6KDA2t
 +k0z+J9hXtqkfIIAjVv7frNqnwdIazIS5zsH5AKCIk+ZImxUk7lxXCbhKRNG7L+/6wCm
 gHXefaT98YUiaa1ueZEPaxhaoFHZXZDOWp+EX/u7MWsR91V0x/YuqoXwj7+ncsfUIDH6
 txfHEMMnZK9ypdjAIoMBtqF0WP2VKuE6yg8Lu1xHSdCOTETL9g780L3RqPjbh1r0j+hU
 WN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tsrPHf7LNE7N0dgvIeJwOFwQpRG5qjurHjF4TZtbgxo=;
 b=M7VMXh6/uEN/mU1sp0eDzJAbs5EBp1TtpmqI+y4iRTcaJTq0+pFeWozDRkW9hnD7KR
 U8RFzuru4ya2JqMODzqEFM15x/DecJ84p7MnLMuzGKeh6XBy14NqyUaS62N66Gcjt/0W
 vv+4itPfGBv2xZUPuD52aAaIMOg25DSZK8AZ6K+TLfXn44RkHMJhuv8aykhNFQYlFKKD
 aduf7dpGP0faBXJi74mtvPZ9qVBNR3l/sG480qSflrFw1dJocVtIjy++jnbaOOgsHDd1
 jYwUG1XjeoHFgYcFjNQRikK1s0VtQxveFKc4JyiVRi/Jp+R2wIxMgyErqAh/0ZTV0En0
 fzqA==
X-Gm-Message-State: AIkVDXJgLOVb9fI8K66zSvhUZS1JhmnVsfEJMYJj9g9pXYGaw660K+Dk49UM5EjMqYHEXA==
X-Received: by 10.36.27.75 with SMTP id 72mr5467165its.12.1484088979692;
 Tue, 10 Jan 2017 14:56:19 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id f4sm2035948ioe.40.2017.01.10.14.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 14:56:18 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux v2 3/3] mtd: spi-nor: aspeed: fix DMA access on AST2500
Date: Tue, 10 Jan 2017 14:55:55 -0800
Message-Id: <20170110225555.117814-4-rlippert@google.com>
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
X-List-Received-Date: Tue, 10 Jan 2017 22:56:22 -0000

AST2500 has additional bits in the dma_addr field.  Its easier
to just write the full address into the register as the hardware
will handle the masking properly.

Signed-off-by: Robert Lippert <rlippert@google.com>
---

Changes in v2:
- Cleanups suggested by Cedric.

 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 3c8e897048c6..cd8a43238660 100644
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
