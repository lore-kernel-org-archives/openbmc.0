Return-Path: <clg@kaod.org>
Received: from e06smtp09.uk.ibm.com (e06smtp09.uk.ibm.com [195.75.94.105])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2f1cpXzDqP9
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:41 +1000 (AEST)
Received: from localhost
 by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:38 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
 by e06smtp09.uk.ibm.com (192.168.101.139) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:36 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 32A0117D805A
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:42 +0100 (BST)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
 [9.149.37.249])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKaHL11272688
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:36 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKZGD005182
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:36 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKZ2K005177; Sun, 29 May 2016 15:20:35 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 27EAC220164;
 Sun, 29 May 2016 23:20:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 12/12] ast2400: add a FTGMAC100 nic
Date: Sun, 29 May 2016 23:20:05 +0200
Message-Id: <1464556805-4340-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0037-0000-0000-000011240F96
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 21:20:43 -0000

Only the first nic, but the second shouldn't be too complex to add if
needed.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c         | 18 ++++++++++++++++++
 include/hw/arm/ast2400.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index a4a7c10e4361..67ae91f5f977 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -19,6 +19,7 @@
 #include "hw/char/serial.h"
 #include "hw/boards.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "net/net.h"
 
 #define AST2400_UART_5_BASE      0x00184000
 #define AST2400_IOMEM_SIZE       0x00200000
@@ -32,6 +33,8 @@
 #define AST2400_LPC_BASE         0x1E789000
 #define AST2400_IBT_BASE         (AST2400_LPC_BASE + 0x140)
 #define AST2400_I2C_BASE         0x1E78A000
+#define AST2400_ETH1_BASE        0x1E660000
+#define AST2400_ETH2_BASE        0x1E680000
 
 static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
@@ -95,6 +98,10 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->bt, sizeof(s->bt), TYPE_ASPEED_BT);
     object_property_add_child(obj, "bt", OBJECT(&s->bt), NULL);
     qdev_set_parent_bus(DEVICE(&s->bt), sysbus_get_default());
+
+    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
+    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
+    qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -221,6 +228,17 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->bt), 0, AST2400_IBT_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->bt), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 10));
+
+    /* Net */
+    qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
+    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0, AST2400_ETH1_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
+                       qdev_get_gpio_in(DEVICE(&s->vic), 2));
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index 2b517e89eeea..bb221734c7b1 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -19,6 +19,7 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_bt.h"
+#include "hw/net/ftgmac100.h"
 
 typedef struct AST2400State {
     /*< private >*/
@@ -35,6 +36,7 @@ typedef struct AST2400State {
     AspeedSMCState smc;
     AspeedSMCState spi;
     AspeedBTState bt;
+    Ftgmac100State ftgmac100;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
-- 
2.1.4
