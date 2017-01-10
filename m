Return-Path: <roblip@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynSW3cWLzDqGK
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:56:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="krBMLGEr"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id 203so11229112ith.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OXX7beTDZuV73uROuirFEvcglCeNY/xa/vOBDpJ2eQ0=;
 b=krBMLGEr3mUhnXFbblyoQo4Oy7cZ3I4Ak9h9VLFL3x+0oDgeqNvDVZjH3bhOp28o5D
 jwx2ikh02ORB5dTw3GATkhDQtU6/CB+5TYXABo7e2iRhM/jW+/IwgU0inYecBb5bE3zr
 6JIAwn3MLqbCMHL6n+2wwJIea9sH+mezr0Po+rZ5nIC8uSvAI5j/1/gppfkPzhGem/s8
 wCfneNGmf45Yeper5Nvv4DDzZ4JhR7nP/SbbjNawGrfuQIb0qIY7ALwlqpYpaHdPnl6q
 QIAIuwl5TKF2iyVQ9kLhIoB2sLwZsxinlJSiSQnltnYiWr+7k/ytWNZIw2fFbH9/3e2P
 T6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OXX7beTDZuV73uROuirFEvcglCeNY/xa/vOBDpJ2eQ0=;
 b=JtI9hzBYNT49jXFxpnAYS635YkkRZ8sVmid50qLmbWYVXVk0Psret/xG9DuUsGIIWQ
 4v1BI3H05WhDbB6IwFXYURvRQKO5Y15mYNRaiVxLwUYwf9H7ZFCVLEZYKYDhJnIgJI7c
 KV7Hk1AhFBMZeLsBAIC21X8SiCuaTe7tDpPXUzy0LRFlnv3WqnmrepGtR5evmWmYzvxV
 6iG9x/hjuTB0lpGZyTQfQ3QhLi67/gsU4af803/y6swD9WlYhd9VqTANw+XmHGxi1bkv
 03LvuTLGQo1VA/CmjDlQ2ZxjqH/YbGqHdcHlqMhFJVpFBP5W/wmNWJ2+BzvKCnAaoFi7
 4pVg==
X-Gm-Message-State: AIkVDXJVeprp3+wwOuKXd7AMYfd5uTcrXRk8K6e4D9g2Jf5wGjI3x3PBWRw0zVoOJGSeWg==
X-Received: by 10.36.224.140 with SMTP id c134mr2299657ith.105.1484088969539; 
 Tue, 10 Jan 2017 14:56:09 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id f4sm2035948ioe.40.2017.01.10.14.56.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 14:56:08 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux v2 1/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to
 mx66l51235l
Date: Tue, 10 Jan 2017 14:55:53 -0800
Message-Id: <20170110225555.117814-2-rlippert@google.com>
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
X-List-Received-Date: Tue, 10 Jan 2017 22:56:12 -0000

Signed-off-by: Robert Lippert <rlippert@google.com>
---

Changes in v2: None

 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a68073afe8a8..e508c25a47f7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -857,7 +857,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
-- 
2.11.0.390.gc69c2f50cf-goog
