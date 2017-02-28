Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXVLn6KJKzDqHJ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 18:19:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HfnbDTeM"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id 1so627321pgz.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 23:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=133A3FMMs99vY1tDbhD8rs8q58/owV7Z4To0Wd6v+DY=;
 b=HfnbDTeM2fV4sbSKrYpafJQktpEgP59YZExEvaVS/VCSF8eVyH6Jg/2RxcWTBc+78J
 I3pvZwKBC3mtFOenUz2A9RdnDiqMw5Joi2y9rAt0IAUah50VuliA3Mcqn1peXQXX7R2t
 lYOAorgG5C0bmYSOykAYAuTUMmwV5heK6OqbDeGTVQV6aHG0X9lukp5+BJyyPE7qOUIp
 Ygw4PdDxRZ0HLAskcbOFLYM4KaILpyvcxJJBqq1EoRha2YYKqbDtOorbgro73N+j1kVk
 8olrnUv1fCRlQc5+sb6QXAI1riCuvNNB6kRj/KZ5vA73b8JBz59Y6BTTnD4p2Ibb/pUE
 su/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=133A3FMMs99vY1tDbhD8rs8q58/owV7Z4To0Wd6v+DY=;
 b=Lz7MUGeLCrpl9qnqzsUMxqBLcdY7n6Njrp/mv3oTAyD3e8IG7xi8xpQq4/hKUoXZS+
 Qlixjqb6aw3iF7VpmthLlVq6MBuq7U+CxVfG/4CMO0CFR99Ng4IY8c/kL2/Klwv38kbP
 h+pLsKhQ79wCgMi5E/rBXsKrwIVKNB8cRnpOEZD5wtNbN/uPJIxU+Hots1CSdA46JOUL
 ezXqNDgeUeZkHuYTs8BKlnRL/b8RWKMXEra5k87Q0D8EhyAl1ggO9dref3p08sgpg2og
 goI3CaQPiyCxbgOFpVQVfWUBGJYsH+aJtd9ZzqujOv9I7hVfsYBdpyUHMHtx9xeNgGRb
 CScw==
X-Gm-Message-State: AMke39lOTPg5+QdvV/AWArSCGhWNbqT4p0K6WKVmnMVpiGvyKB/RZo1SJc76IwNy071O+Q==
X-Received: by 10.98.36.138 with SMTP id k10mr1001384pfk.53.1488266351817;
 Mon, 27 Feb 2017 23:19:11 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id y21sm1904208pgh.52.2017.02.27.23.19.10
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 27 Feb 2017 23:19:11 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
Date: Tue, 28 Feb 2017 15:18:00 +0800
Message-Id: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Tue, 28 Feb 2017 07:19:14 -0000

The PNOR SPI address mapping is the same as Witherspoon.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 726b8fa..ec9eecf 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)
 static void __init do_romulus_setup(void)
 {
 	do_common_setup();
+
+	/* Setup PNOR address mapping for 64M flash
+	 *
+	 *   ADRBASE: 0x3000 (0x30000000)
+	 *   HWMBASE: 0x0C00 (0x0C000000)
+	 *  ADDRMASK: 0xFC00 (0xFC000000)
+	 *   HWNCARE: 0x03FF (0x03FF0000)
+	 *
+	 * Mapping appears at 0x60300fc000000 on the host
+	 */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* Set SPI1 CE1 decoding window to 0x34000000 */
+	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+	/* Set SPI1 CE0 decoding window to 0x30000000 */
+	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
 #define SCU_PASSWORD	0x1688A8A8
-- 
1.9.1
