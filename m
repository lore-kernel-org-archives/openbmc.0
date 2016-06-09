Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQJ4d46GCzDqFJ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 18:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ZdVcabCO; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id CEB3831A078;
 Thu,  9 Jun 2016 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 qefFTnPj2hLacVdVXUvehGP5WGg=; b=ZdVcabCOKLVPduVYw3JFYcrDlOSGnmow
 VUGqEmsNenk3J4BzsSgkfAY605noZULZruD4F2RvHffP+ednXNR3LWic4tz2lGoo
 mHsPaEG6WOh0w4Xwt7dTIL0NUNY5z6x31+mLLaeND19bk4XfLVcvXXaFubr0kN61
 ol31Bp8q5wU=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id 66F6E31A061;
 Thu,  9 Jun 2016 01:14:38 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu 2/2] ast2400: Integrate the SCU model and configure reset
 values
Date: Thu,  9 Jun 2016 17:44:06 +0930
Message-Id: <1465460046-7692-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 09 Jun 2016 08:14:42 -0000

Almost all configured reset values are specified by the datasheet. The
exception is ASPEED_SCU_SOC_SCRATCH1, where we mark the DRAM as
successfully initialised by the SoC to avoid unnecessary dark corners in
the SoC's u-boot support.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/ast2400.c         | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 4a9de0e10cbc..240da180befa 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -24,12 +24,46 @@
 #define AST2400_IOMEM_SIZE       0x00200000
 #define AST2400_IOMEM_BASE       0x1E600000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
 
 static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
 
+static const AspeedSCUResetCfg scu_reset[] = {
+    /* Values are defaults from the datasheet except where noted */
+    { ASPEED_SCU_SYS_RST_CTRL,   0xFFCFFEDCU },
+    { ASPEED_SCU_CLK_SEL,        0xF3F40000U },
+    { ASPEED_SCU_CLK_STOP_CTRL,  0x19FC3E8BU },
+    { ASPEED_SCU_D2PLL_PARAM,    0x00026108U },
+    { ASPEED_SCU_MPLL_PARAM,     0x00030291U },
+    { ASPEED_SCU_HPLL_PARAM,     0x00000291U },
+    { ASPEED_SCU_MISC_CTRL1,     0x00000010U },
+    { ASPEED_SCU_PCI_CTRL1,      0x20001A03U },
+    { ASPEED_SCU_PCI_CTRL2,      0x20001A03U },
+    { ASPEED_SCU_PCI_CTRL3,      0x04000030U },
+    { ASPEED_SCU_SYS_RST_STATUS, 0x00000001U },
+    { ASPEED_SCU_SOC_SCRATCH1,   0x000000C0U }, /* SoC completed DRAM init */
+    { ASPEED_SCU_MISC_CTRL2,     0x00000023U },
+    { ASPEED_SCU_RNG_CTRL,       0x0000000EU },
+    { ASPEED_SCU_REV_ID,         0x02000303U },
+    { ASPEED_SCU_PINMUX_CTRL2,   0x0000F000U },
+    { ASPEED_SCU_PINMUX_CTRL3,   0x01000000U },
+    { ASPEED_SCU_PINMUX_CTRL4,   0x000000FFU },
+    { ASPEED_SCU_PINMUX_CTRL5,   0x0000A000U },
+    { ASPEED_SCU_WDT_RST_CTRL,   0x003FFFF3U },
+    { ASPEED_SCU_PINMUX_CTRL8,   0xFFFF0000U },
+    { ASPEED_SCU_FREE_CNTR4,     0x000000FFU },
+    { ASPEED_SCU_FREE_CNTR4_EXT, 0x000000FFU },
+    { ASPEED_SCU_CPU2_BASE_SEG1, 0x80000000U },
+    { ASPEED_SCU_CPU2_BASE_SEG4, 0x1E600000U },
+    { ASPEED_SCU_CPU2_BASE_SEG5, 0xC0000000U },
+    { ASPEED_SCU_UART_HPLL_CLK,  0x00001903U },
+    { ASPEED_SCU_PCIE_CTRL,      0x0000007BU },
+    { ASPEED_SCU_BMC_DEV_ID,     0x00002402U }
+};
+
 /*
  * IO handlers: simply catch any reads/writes to IO addresses that aren't
  * handled by a device mapping.
@@ -72,6 +106,10 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
     object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
+    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -110,6 +148,15 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* SCU */
+    aspeed_scu_configure_reset(&s->scu, scu_reset, ARRAY_SIZE(scu_reset), &err);
+    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
+
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index c05ed5376736..f1a64fd3893d 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -14,6 +14,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
+#include "hw/misc/aspeed_scu.h"
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
 
@@ -27,6 +28,7 @@ typedef struct AST2400State {
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedSCUState scu;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
-- 
2.7.4
