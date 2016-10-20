Return-Path: <xow@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0PM51GFjzDvY4
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 09:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MY3LBvcr; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 128so44811233pfz.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xUXOcDn3BihjRXZGLc0eOTiryCWNKvDngLfgdkDF/U=;
 b=MY3LBvcrkgKcmUKbeLh2P4DGVHqBRf8QRbPUnhSErhvpgc3gAGbuJaQcgIVxIT67cv
 mTCiTxh3DWF4RGEadmLswgbbYv0+I/xh8+ghcroPve7XpOujWZRWXFUKBZhOLdw4Mcpo
 sxPJKUBBqTxiRUwWzL7/TrwAqwckFAOa6dbU6cQW92BDU+jjS2160QzcZN7wBsEHL4dl
 8BnGU45ooSVwgsTlYVbw3xMfK5O50O79PySFgYjYggMxf3glcByv0djettC+NrD/BU0A
 FRAt79BQdyYj5fDFfzCJ8HK0R2ME1IpXlbe1jgZFRFJedSyy4cfO1Ef1Hvcjxu/g0HHh
 VL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xUXOcDn3BihjRXZGLc0eOTiryCWNKvDngLfgdkDF/U=;
 b=lDlzbmcvqH8L2VnWzCqEbSzgKn4MHfrCC3Th/L+uoV3Ad/zFpe7PhP1s7edEvZixe9
 Pg2VqYuEoKTbKDjMOo6MqVRpbZ0qsHza1RW2oawq+vyDGM77zkf/KJlT/QzuTYGMyXL4
 UxtzkhvblJS/dUNVOHYtK2En8F49wr8cDGb+ro07WRGNJ3mNdwoMG/JiaLgk8EW/YNdY
 7yTpchJ9wGMTsdxyOsS8DKfXFt4wQhvRlnaVzYuHTVzF7WG3MBTA9z0RTCKM9xhTR7L1
 PMEUc08MgV19bIsABggVS8rl/AFTjnwSoUc8r1jchxPwdh5wlZrILsRu6Z9EnEIDvTu8
 ZSmw==
X-Gm-Message-State: AA6/9RlCwoKhmHWwu6t7NxBKLCZRv452C8xMS2QQCs1PPUNfOryxl4zimM3wMrYV5fbFyAaI
X-Received: by 10.99.42.80 with SMTP id q77mr4152507pgq.3.1477004206786;
 Thu, 20 Oct 2016 15:56:46 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id q12sm51769527pfd.7.2016.10.20.15.56.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Oct 2016 15:56:45 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] mach-aspeed: Add Zaius BMC PHY reset
Date: Thu, 20 Oct 2016 15:56:34 -0700
Message-Id: <1477004194-107484-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 20 Oct 2016 22:56:49 -0000

The Broadcom PHY for the Zaius BMC requires a hard reset after RGMII
clocks are enabled. This asserts the reset in case it wasn't performed
in U-Boot.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0a1700e..ebb2224 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -186,6 +187,9 @@ static void __init do_zaius_setup(void)
 
 	/* EVT1 hacks */
 	if (board_rev == 0) {
+		/* D3 in GPIOA/B/C/D direction and data registers */
+		unsigned long phy_reset_mask = BIT(27);
+
 		/* Set strap[13:12] to 01, Enable SPI master */
 		/* Set bits in writes to SCU7C are cleared from SCU70 */
 		writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
@@ -195,6 +199,18 @@ static void __init do_zaius_setup(void)
 		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
 		reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
 		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
+
+		/* Assert MAC2 PHY hardware reset */
+		/* Set pin low */
+		reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+		writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
+		/* Enable pin for output */
+		reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
+		writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
+		udelay(3);
+		/* Set pin high */
+		reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+		writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
 	}
 }
 
-- 
2.8.0.rc3.226.g39d4020
