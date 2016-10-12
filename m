Return-Path: <xow@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTT63NVtzDrLv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KKIuFG7P; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id e6so24616208pfk.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5oq4eWzwjMte+hLPYp2O8Ed23ZVV1RVWm90n4H7Lpk=;
 b=KKIuFG7PHsrvYLlkZAAZXZm+Fb7JZfeeWAKo05V9M0D2eAVqo9TTQBlahxPwKuLbn9
 L3Cem0hujQJDBgedueHtSlQrGX85E3ta5DVSl7VGCCPFlahr5qlYKWKMTwUkq86iu2K9
 vRVM23ztZmADva4T7bBRCt532KL8RxdD2SUGY5uM1xNpertFJNhVLLCZUrlgGd7cvs7i
 /yWKwDzWX16ow/MraJhN2OXj8scdl9YJpfH9qZTAPFgo0mvNTu0MjKSeVqpUSIi6+OVb
 ECMyAZm3JbOu9t9aOgG1VYgAZUXstMdUx/+T1YVBwI1mVWjeJAubKp8KHwHF4YhnvKW1
 bcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v5oq4eWzwjMte+hLPYp2O8Ed23ZVV1RVWm90n4H7Lpk=;
 b=l/zXgI9tWacfBx1NaFK3hRSG8mfeZwcS0u+KpDXE7YskHSmZuYLXkFzcdGYk9s1dmO
 4fWlixHZZbBrmgdN6DJDTE+mx9IP5R2aNmB5kwl/1HgOCg9V65xp0G86SBa6CXjeMwHa
 N38a1bm8CmRERUYFN3NKnys7FIqQ8a8QdKSv4ISmbTsUCXV70rWElcEfYT/oYctnW4Ry
 BJ6dYzLLMxnUQ1rDxO1nQt6sLWqZi2pyrL9QJDMJdB9ppvGenfNR0dpod8LfUBuqjj8f
 LezD/0z/bDCZEi+ubHHtstAXmqtp9NZjaWpHdaqalTOWyx6NgyQiKrGUlsmOLYeboxkG
 +LAQ==
X-Gm-Message-State: AA6/9Rn92EQFgu03P44tjf8CrgJmuB5yi6rErTeLJY8N2bVOW89EoBW0dsiF4M28v42Qq/1D
X-Received: by 10.98.86.139 with SMTP id h11mr5324274pfj.73.1476312296692;
 Wed, 12 Oct 2016 15:44:56 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id z6sm14170700pay.31.2016.10.12.15.44.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:44:56 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/5] mach-aspeed: Add Zaius BMC-specific early setup
Date: Wed, 12 Oct 2016 15:44:44 -0700
Message-Id: <1476312288-100725-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:44:59 -0000

Add initialization for "ingrasys,zaius-bmc" machines to deal with
hardware issues on EVT1 boards. This overrides incorrect straps that
enabled the SPI slave and disables pull down resistors that prevented
buttons inputs from being driven high.

This code reads board revision fuse bits directly from GPIO registers
because GPIO drivers are not available yet.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 12a63db..9bf159c 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -170,6 +170,31 @@ static void __init do_witherspoon_setup(void)
 	do_ast2500_common_setup();
 }
 
+static void __init do_zaius_setup(void)
+{
+	unsigned long reg;
+	unsigned long board_rev;
+
+	do_ast2500_common_setup();
+
+	/* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
+	board_rev = (reg >> 3) & 0x1F;
+
+	/* EVT1 hacks */
+	if (board_rev == 0) {
+		/* Set strap[13:12] to 01, Enable SPI master */
+		/* Set bits in writes to SCU7C are cleared from SCU70 */
+		writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
+		/* SCU70 is set-only, so no read-modify-write needed */
+		writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
+
+		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
+		reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
+		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
+	}
+}
+
 
 #define SCU_PASSWORD	0x1688A8A8
 
@@ -216,6 +241,8 @@ static void __init aspeed_init_early(void)
 		do_ast2500evb_setup();
 	if (of_machine_is_compatible("ibm,witherspoon-bmc"))
 		do_witherspoon_setup();
+	if (of_machine_is_compatible("ingrasys,zaius-bmc"))
+		do_zaius_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.8.0.rc3.226.g39d4020
