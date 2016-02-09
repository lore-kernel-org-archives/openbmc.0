Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B3371A0191
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 01:26:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 455C2140317; Wed, 10 Feb 2016 01:26:13 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] serial/aspeed-vuart: Disable host TX discard mode during init
Date: Tue,  9 Feb 2016 22:25:57 +0800
Message-Id: <1455027957-9524-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2016 14:26:13 -0000

If host TX discard mode is enabled, we don't see the LSR[RBR} bit
getting set on new characters written on the host side. This makes the
VUART a little useless.

This change set this bit during VUART initialisation, to disable host
TX discard.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/aspeed-vuart.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
index f1988dd..a56d3a9 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -20,7 +20,8 @@
 #include "8250/8250.h"
 
 #define AST_VUART_GCRA		0x20
-#define AST_VUART_GCRA_VUART_EN		0x1
+#define AST_VUART_GCRA_VUART_EN		0x01
+#define AST_VUART_GCRA_HOST_TX_DISCARD	0x20
 #define AST_VUART_GCRB		0x24
 #define AST_VUART_GCRB_HOST_SIRQ_MASK	0xf0
 #define AST_VUART_GCRB_HOST_SIRQ_SHIFT	4
@@ -143,6 +144,17 @@ static ssize_t ast_vuart_set_sirq(struct device *dev,
 static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
 		ast_vuart_show_sirq, ast_vuart_set_sirq);
 
+static void ast_vuart_setup(struct ast_vuart *vuart)
+{
+	u8 reg;
+
+	/* disable TX discard mode */
+	reg = readb(vuart->regs + AST_VUART_GCRA);
+	reg |= AST_VUART_GCRA_HOST_TX_DISCARD;
+	writeb(reg, vuart->regs + AST_VUART_GCRA);
+}
+
+
 /**
  * The device tree parsinc code here is heavily based on that of the of_serial
  * driver, but we have a few core differences, as we need to use our own
@@ -261,6 +273,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
 
 	vuart->line = rc;
 	platform_set_drvdata(pdev, vuart);
+	ast_vuart_setup(vuart);
 
 	/* extra sysfs control */
 	rc = device_create_file(&pdev->dev, &dev_attr_lpc_address);
-- 
2.5.0
