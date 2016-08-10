Return-Path: <vadimp@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3s8LSG3YV3zDqRR
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 16:13:33 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 vadimp@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 10 Aug 2016 08:58:31 +0300
Received: from r-mgtswh-236.mtr.labs.mlnx (r-mgtswh-236.mtr.labs.mlnx
 [10.209.1.207])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id u7A5wVeT017923;
 Wed, 10 Aug 2016 08:58:31 +0300
From: vadimp@mellanox.com
To: openbmc@lists.ozlabs.org
Cc: jiri@mellanox.com, michaelsh@mellanox.com, shays@mellanox.com,
 yanivab@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>
Subject: [dev-4.7 patch 1/5] Add reset interface for SoC micro-controller
Date: Wed, 10 Aug 2016 07:02:40 +0000
Message-Id: <1470812560-50832-1-git-send-email-vadimp@mellanox.com>
X-Mailer: git-send-email 2.1.4
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
X-List-Received-Date: Wed, 10 Aug 2016 06:13:35 -0000

From: Vadim Pasternak <vadimp@mellanox.com>

arch/arm/mach-aspeed: introduce reset and init interfaces for SoC micro-controller

- Enable Aspeed 2500 SoC interface for micro-contollers reset and
  initializations.
- Add Aspeed to ARM machine types list.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 arch/arm/mach-aspeed/Makefile             |  4 ++
 arch/arm/mach-aspeed/include/mach/reset.h | 99 +++++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/reset.c              | 86 +++++++++++++++++++++++++++
 arch/arm/tools/mach-types                 |  1 +
 4 files changed, 190 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/include/mach/reset.h
 create mode 100644 arch/arm/mach-aspeed/reset.c

diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
index 3a4f025..c45cd1c 100644
--- a/arch/arm/mach-aspeed/Makefile
+++ b/arch/arm/mach-aspeed/Makefile
@@ -1,3 +1,7 @@
 # Object file lists.
 
+ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
+	-I$(srctree)/arch/arm/mach-aspeed/include
+
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed.o
+obj-$(CONFIG_MACH_ASPEED_G5)	+= reset.o
diff --git a/arch/arm/mach-aspeed/include/mach/reset.h b/arch/arm/mach-aspeed/include/mach/reset.h
new file mode 100644
index 0000000..801f921
--- /dev/null
+++ b/arch/arm/mach-aspeed/include/mach/reset.h
@@ -0,0 +1,99 @@
+/*
+ * arch/arm/mach-aspeed/include/mach/reset.h
+ * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the names of the copyright holders nor the names of its
+ *    contributors may be used to endorse or promote products derived from
+ *    this software without specific prior written permission.
+ *
+ * Alternatively, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") version 2 as published by the Free
+ * Software Foundation.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef __ASM_ARCH_ASPEED_RESET_H
+#define __ASM_ARCH_ASPEED_RESET_H
+
+#define AST_BASE_SCU            0x1E6E2000
+#define AST_SCU_RESET		0x04	/* System reset control register */
+#define AST_SCU_RESET2		0xD4	/* System reset control register  2*/
+
+#define SCU_PROTECT_UNLOCK	0x1688A8A8 /* Unlock SCU registers: Write
+					    * 0x1688A8A8 to this register.
+					    * When register is unlocked, the
+					    * read back value is 0x00000001,
+					    * when locked is 0x00000000.
+					    * Writing any non 0x1688A8A8 to
+					    * this register will lock it.
+					    */
+
+/* AST_SCU_RESET 0x04 Reset control register */
+#define SCU_RESET_H264		(0x1 << 26)
+#define SCU_RESET_XDMA		(0x1 << 25)
+#define SCU_RESET_MCTP		(0x1 << 24)
+#define SCU_RESET_P2X		(0x1 << 24)
+#define SCU_RESET_ADC		(0x1 << 23)
+#define SCU_RESET_JTAG		(0x1 << 22)
+#define SCU_RESET_PCIE_DIR	(0x1 << 21)
+#define SCU_RESET_PCIE		(0x1 << 19)
+#define SCU_RESET_MIC		(0x1 << 18)
+#define SCU_RESET_RFX		(0x1 << 17)
+#define SCU_RESET_SD		(0x1 << 16)
+#define SCU_RESET_USB11		(0x1 << 15)
+#define SCU_RESET_USB20		(0x1 << 14)
+#define SCU_RESET_CRT		(0x1 << 13)
+#define SCU_RESET_MAC1		(0x1 << 12)
+#define SCU_RESET_MAC0		(0x1 << 11)
+#define SCU_RESET_PECI		(0x1 << 10)
+#define SCU_RESET_PWM		(0x1 << 9)
+#define SCU_PCI_VGA_DIS		(0x1 << 8)
+#define SCU_RESET_2D		(0x1 << 7)
+#define SCU_RESET_VIDEO		(0x1 << 6)
+#define SCU_RESET_LPC		(0x1 << 5)
+#define SCU_RESET_HACE		(0x1 << 4)
+#define SCU_RESET_USB_P1	(0x1 << 3)
+#define SCU_RESET_I2C		(0x1 << 2)
+#define SCU_RESET_AHB		(0x1 << 1)
+#define SCU_RESET_SRAM_CTRL	(0x1)
+
+/* AST_SCU_RESET2 0xD4	Reset Control register set 2 */
+#define SCU_RESET_CRT3		(0x1 << 8)
+#define SCU_RESET_CRT2		(0x1 << 7)
+#define SCU_RESET_CRT1		(0x1 << 6)
+#define SCU_RESET_CRT0		(0x1 << 5)
+#define SCU_RESET_NIC1		(0x1 << 4)
+#define SCU_RESET_NIC0		(0x1 << 3)
+#define SCU_RESET_RFXDEC	(0x1 << 2)
+#define SCU_RESET_BITBLT	(0x1 << 1)
+#define SCU_RESET_RFXCMQ	(0x1)
+
+#define SCU_PROTECT_LOCK	0x123456789 /* Lock SCU registers: Write
+					    * 0x123456789 to this register
+					    */
+#define AST_IO_VA		0xf0000000
+#define AST_IO(__pa)	((void __iomem *)(((__pa) & 0x001fffff) | AST_IO_VA))
+
+void aspeed_toggle_scu_reset(u32 mask, u32 delay);
+void aspeed_scu_multi_func_reset(u32 reg, u32 amask, u32 omask);
+
+#endif /* __ASM_ARCH_ASPEED_RESET_H */
diff --git a/arch/arm/mach-aspeed/reset.c b/arch/arm/mach-aspeed/reset.c
new file mode 100644
index 0000000..1ca0d8e
--- /dev/null
+++ b/arch/arm/mach-aspeed/reset.c
@@ -0,0 +1,86 @@
+/*
+ * arch/arm/mach-aspeed/reset.c
+ * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the names of the copyright holders nor the names of its
+ *    contributors may be used to endorse or promote products derived from
+ *    this software without specific prior written permission.
+ *
+ * Alternatively, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") version 2 as published by the Free
+ * Software Foundation.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <asm/mach-types.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <mach/reset.h>
+
+static DEFINE_SPINLOCK(aspeed_scu_lock);
+
+/*
+ * aspeed_toggle_scu_reset - reset SoC micro-controller.
+ * Resets the requested micro-controller.
+ */
+void aspeed_toggle_scu_reset(u32 mask, u32 delay)
+{
+	u32 val;
+
+	spin_lock(&aspeed_scu_lock);
+	val = readl(AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
+	writel(SCU_PROTECT_UNLOCK, AST_IO(AST_BASE_SCU));
+	writel(val | mask, AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
+	udelay(delay);
+	val = readl(AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
+	writel(val & ~mask, AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
+	spin_unlock(&aspeed_scu_lock);
+}
+EXPORT_SYMBOL(aspeed_toggle_scu_reset);
+
+/*
+ * aspeed_scu_multi_func_reset - Multi-function Pin Control.
+ * Resets the requested mutli-function pins.
+ */
+void aspeed_scu_multi_func_reset(u32 reg, u32 amask, u32 omask)
+{
+	u32 val = 0;
+
+	spin_lock(&aspeed_scu_lock);
+	val = readl(AST_IO(AST_BASE_SCU) + reg);
+	val &= ~amask;
+	writel(SCU_PROTECT_UNLOCK, AST_IO(AST_BASE_SCU));
+	writel(val | omask, AST_IO(AST_BASE_SCU) + reg);
+	spin_unlock(&aspeed_scu_lock);
+}
+EXPORT_SYMBOL(aspeed_scu_multi_func_reset);
+
+MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
+MODULE_DESCRIPTION("Aspeed SoC controllers reset");
+MODULE_LICENSE("GPL v2");
diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 2ed1b8a..742ef24 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -1006,3 +1006,4 @@ eco5_bx2		MACH_ECO5_BX2		ECO5_BX2		4572
 eukrea_cpuimx28sd	MACH_EUKREA_CPUIMX28SD	EUKREA_CPUIMX28SD	4573
 domotab			MACH_DOMOTAB		DOMOTAB			4574
 pfla03			MACH_PFLA03		PFLA03			4575
+aspeed			MACH_ASPEED_G5		ASPEED_G5		4576
-- 
2.1.4
