Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0hXv2mx1zDrmy
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 00:22:36 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBID4n5j026784;
 Mon, 18 Dec 2017 15:04:49 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8331E5A938; Mon, 18 Dec 2017 15:22:27 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 2/2] watchdog: npcm: add NPCM7xx watchdog
 driver
Date: Mon, 18 Dec 2017 15:22:24 +0200
Message-Id: <1513603344-5700-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513603344-5700-1-git-send-email-tmaimon77@gmail.com>
References: <1513603344-5700-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 13:22:42 -0000

Add Nuvoton BMC NPCM7xx watchdog driver.

Nuvoton NPCM7xx have three watchdog timer modules, each watchdog timer
is a free-running timer with programmable timeout intervals.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/Kconfig                   |  11 +
 drivers/watchdog/Makefile                  |   1 +
 drivers/watchdog/npcm7xx_wdt.c             | 369 +++++++++++++++++++++++++++++
 drivers/watchdog/npcm7xx_wdt_fiq_handler.S |  68 ++++++
 4 files changed, 449 insertions(+)
 create mode 100644 drivers/watchdog/npcm7xx_wdt.c
 create mode 100644 drivers/watchdog/npcm7xx_wdt_fiq_handler.S

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c722cbfdc7e6..5995e099ccf3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -504,6 +504,17 @@ config COH901327_WATCHDOG
 	  This watchdog is used to reset the system and thus cannot be
 	  compiled as a module.
 
+config NPCM7XX_WATCHDOG
+	bool "NPCM750 watchdog"
+	depends on ARCH_NPCM7XX || COMPILE_TEST
+	default y if ARCH_NPCM7XX
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include Watchdog timer support for the
+	  watchdog embedded into the NPCM7xx.
+	  This watchdog is used to reset the system and thus cannot be
+	  compiled as a module.
+
 config TWL4030_WATCHDOG
 	tristate "TWL4030 Watchdog"
 	depends on TWL4030_CORE
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 56adf9fa67d0..4ac0c790093a 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
 obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
 obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
 obj-$(CONFIG_COH901327_WATCHDOG) += coh901327_wdt.o
+obj-$(CONFIG_NPCM7XX_WATCHDOG) += npcm7xx_wdt.o npcm7xx_wdt_fiq_handler.o
 obj-$(CONFIG_STMP3XXX_RTC_WATCHDOG) += stmp3xxx_rtc_wdt.o
 obj-$(CONFIG_NUC900_WATCHDOG) += nuc900_wdt.o
 obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
diff --git a/drivers/watchdog/npcm7xx_wdt.c b/drivers/watchdog/npcm7xx_wdt.c
new file mode 100644
index 000000000000..2c5aba04adbf
--- /dev/null
+++ b/drivers/watchdog/npcm7xx_wdt.c
@@ -0,0 +1,369 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/watchdog.h>
+#include <asm/fiq.h>
+#include <linux/of_irq.h>
+
+/* Wdog0-2 are connected with OR gate directly to nFIQ. */
+#define WATCHDOG_FIQ
+
+/* #define DEBUG */
+#ifdef DEBUG
+	#undef WDOG_DEBUG
+	#define WDOG_DEBUG(f, x...)	pr_info("NPCM7XX-WDOG: %s():"
+					f, __func__, ## x)
+#else
+	#define WDOG_DEBUG(f, x...)
+#endif
+
+#define REG_WTCR	0x1C	/* WTCR Register Offset */
+
+#define WTCLK		(0x03 << 10)
+#define WTE		(0x01 << 7)	/* WTCR enable*/
+#define WTIE		(0x01 << 6)	/* WTCR enable interrupt*/
+#define WTIS		(0x03 << 4)	/* WTCR interval selection */
+#define WTIF		(0x01 << 3)	/* WTCR interrupt flag*/
+#define WTRF		(0x01 << 2)	/* WTCR reset flag */
+#define WTRE		(0x01 << 1)	/* WTCR reset enable */
+#define WTR		(0x01 << 0)	/* WTCR reset counter */
+
+/*
+ *Watchdog timeouts
+ *
+ *170     msec:    WTCLK=01 WTIS=00     VAL= 0x400
+ *670     msec:    WTCLK=01 WTIS=01     VAL= 0x410
+ *1360    msec:    WTCLK=10 WTIS=00     VAL= 0x800
+ *2700    msec:    WTCLK=01 WTIS=10     VAL= 0x420
+ *5360    msec:    WTCLK=10 WTIS=01     VAL= 0x810
+ *10700   msec:    WTCLK=01 WTIS=11     VAL= 0x430
+ *21600   msec:    WTCLK=10 WTIS=10     VAL= 0x820
+ *43000   msec:    WTCLK=11 WTIS=00     VAL= 0xC00
+ *85600   msec:    WTCLK=10 WTIS=11     VAL= 0x830
+ *172000  msec:    WTCLK=11 WTIS=01     VAL= 0xC10
+ *687000  msec:    WTCLK=11 WTIS=10     VAL= 0xC20
+ *2750000 msec:    WTCLK=11 WTIS=11     VAL= 0xC30
+ */
+
+/* Default is 86 seconds */
+#define NPCM7XX_WDOG_TIMEOUT	86
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0000);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct npcm7xx_wdt {
+	struct resource		*res;
+	struct platform_device	*pdev;
+	void __iomem		*wdt_base;
+	int irq;
+};
+
+static struct npcm7xx_wdt *npcm7xx_wdt;
+
+static int npcm7xx_wdt_ping(struct watchdog_device *wdd)
+{
+	unsigned int val;
+
+	WDOG_DEBUG("Ping\n");
+	val = __raw_readl(npcm7xx_wdt->wdt_base + REG_WTCR);
+	val |= WTR;
+	WDOG_DEBUG("Ping REG_WTCR = 0x%x\n", val);
+	__raw_writel(val, npcm7xx_wdt->wdt_base + REG_WTCR);
+	return 0;
+}
+
+static int npcm7xx_wdt_start(struct watchdog_device *wdd)
+{
+	unsigned int val = 0;
+
+	WDOG_DEBUG("Start timeout = %d\n", wdd->timeout);
+	val |= (WTRE | WTE | WTR | WTIE);
+
+	if (wdd->timeout < 2)
+		val |= 0x800;
+	else if (wdd->timeout < 3)
+		val |= 0x420;
+	else if (wdd->timeout < 6)
+		val |= 0x810;
+	else if (wdd->timeout < 11)
+		val |= 0x430;
+	else if (wdd->timeout < 22)
+		val |= 0x820;
+	else if (wdd->timeout < 44)
+		val |= 0xC00;
+	else if (wdd->timeout < 87)
+		val |= 0x830;
+	else if (wdd->timeout < 173)
+		val |= 0xC10;
+	else if (wdd->timeout < 688)
+		val |= 0xC20;
+	else if (wdd->timeout < 2751)
+		val |= 0xC30;
+	else
+		val |= 0x830;
+
+	WDOG_DEBUG("Start REG_WTCR = 0x%x\n", val);
+	__raw_writel(val, npcm7xx_wdt->wdt_base + REG_WTCR);
+	return 0;
+}
+
+static int npcm7xx_wdt_stop(struct watchdog_device *wdd)
+{
+	WDOG_DEBUG("Stop\n");
+	__raw_writel(0, npcm7xx_wdt->wdt_base + REG_WTCR);
+	return 0;
+}
+
+
+static int npcm7xx_wdt_set_timeout(struct watchdog_device *wdd,
+				  unsigned int timeout)
+{
+	unsigned int val;
+
+	WDOG_DEBUG("Timeout = %d\n", timeout);
+
+	wdd->timeout = timeout;     /* New timeout */
+
+	val = __raw_readl(npcm7xx_wdt->wdt_base + REG_WTCR);
+	val &= ~(WTCLK | WTIS);
+
+	if (wdd->timeout < 2)
+		val |= 0x800;
+	else if (wdd->timeout < 3)
+		val |= 0x420;
+	else if (wdd->timeout < 6)
+		val |= 0x810;
+	else if (wdd->timeout < 11)
+		val |= 0x430;
+	else if (wdd->timeout < 22)
+		val |= 0x820;
+	else if (wdd->timeout < 44)
+		val |= 0xC00;
+	else if (wdd->timeout < 87)
+		val |= 0x830;
+	else if (wdd->timeout < 173)
+		val |= 0xC10;
+	else if (wdd->timeout < 688)
+		val |= 0xC20;
+	else if (wdd->timeout < 2751)
+		val |= 0xC30;
+	else
+		val |= 0x830;
+
+	WDOG_DEBUG("Set Timeout REG_WTCR = 0x%x\n", val);
+	__raw_writel(val, npcm7xx_wdt->wdt_base + REG_WTCR);
+
+	return 0;
+}
+
+static int npcm7xx_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+
+	__raw_writel(0x83, npcm7xx_wdt->wdt_base + REG_WTCR);
+	udelay(1000);
+
+	return 0;
+}
+
+#ifndef WATCHDOG_FIQ
+/*
+ * This interrupt occurs 10 ms before the watchdog WILL bark.
+ */
+static irqreturn_t npcm7xx_wdt_interrupt(int irq, void *data)
+{
+	unsigned int val;
+
+	val = __raw_readl(npcm7xx_wdt->wdt_base + REG_WTCR);
+	WDOG_DEBUG("%s() val = 0x%x\n", __func__, val);
+
+	if (val & WTIF) {
+		__raw_writel((val & ~WTIE) | WTIF,
+			     npcm7xx_wdt->wdt_base + REG_WTCR);
+		pr_info("NPCM7XX - Watchdog is barking!!!\n");
+
+		/*
+		 * Just disable and clear interrupt and await the imminent end.
+		 * If you at some point need a host of callbacks to be called
+		 * when the system is about to watchdog-reset, add them here!
+		 *
+		 * NOTE: on future versions of this IP-block, it will be
+		 * possible to prevent a watchdog reset by feeding the
+		 * watchdog at this point.
+		 */
+	}
+	return IRQ_HANDLED;
+}
+#endif
+
+static const struct watchdog_info npcm7xx_wdt_info = {
+	.identity	= "npcm7xx watchdog",
+	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING
+				| WDIOF_MAGICCLOSE,
+};
+
+static struct watchdog_ops npcm7xx_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = npcm7xx_wdt_start,
+	.stop = npcm7xx_wdt_stop,
+	.ping = npcm7xx_wdt_ping,
+	.restart = npcm7xx_wdt_restart,
+	.set_timeout = npcm7xx_wdt_set_timeout,
+};
+
+static struct watchdog_device npcm7xx_wdd = {
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+	.info = &npcm7xx_wdt_info,
+	.ops = &npcm7xx_wdt_ops,
+	.min_timeout = 1,
+	.max_timeout = 2751,
+};
+
+#ifdef WATCHDOG_FIQ
+extern unsigned char npcm7xx_wdt_fiq_start, npcm7xx_wdt_fiq_end;
+#endif
+
+static int npcm7xx_wdt_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+#ifdef WATCHDOG_FIQ
+	struct pt_regs regs;
+#endif
+
+	WDOG_DEBUG("Probing...\n");
+
+	npcm7xx_wdt = devm_kzalloc(&pdev->dev, sizeof(struct npcm7xx_wdt),
+				   GFP_KERNEL);
+	if (!npcm7xx_wdt)
+		return -ENOMEM;
+
+	npcm7xx_wdt->pdev = pdev;
+
+	npcm7xx_wdt->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (npcm7xx_wdt->res == NULL) {
+		dev_err(&pdev->dev, "no memory resource specified\n");
+		ret = -ENOENT;
+		goto err_alloc;
+	}
+
+	if (!devm_request_mem_region(&pdev->dev, npcm7xx_wdt->res->start,
+				resource_size(npcm7xx_wdt->res), pdev->name)) {
+		dev_err(&pdev->dev, "failed to get memory region\n");
+		return -ENOENT;
+	}
+
+	npcm7xx_wdt->wdt_base = ioremap(npcm7xx_wdt->res->start,
+					resource_size(npcm7xx_wdt->res));
+	if (npcm7xx_wdt->wdt_base == NULL) {
+		dev_err(&pdev->dev, "failed to ioremap() region\n");
+		ret = -EINVAL;
+		goto err_mem;
+	}
+
+	WDOG_DEBUG("PA_ADDR = 0x%x\n", npcm7xx_wdt->res->start);
+	WDOG_DEBUG("VA_ADDR = 0x%x\n", npcm7xx_wdt->wdt_base);
+
+	npcm7xx_wdd.timeout = NPCM7XX_WDOG_TIMEOUT;
+
+#ifdef WATCHDOG_FIQ
+
+	set_fiq_handler(&npcm7xx_wdt_fiq_start,
+			&npcm7xx_wdt_fiq_end - &npcm7xx_wdt_fiq_start);
+
+//    regs.ARM_r10 = (long)DUMP_SRC;
+//    regs.ARM_fp = (long)DUMP_DST;          // r11
+	regs.ARM_ip = (long)npcm7xx_wdt->wdt_base;     // r12
+	set_fiq_regs(&regs);
+#else
+
+	npcm7xx_wdt->irq = platform_get_irq(pdev, 0);
+	WDOG_DEBUG("npcm7xx_wdt->irq = %d\n", npcm7xx_wdt->irq);
+
+	if (request_irq(npcm7xx_wdt->irq, npcm7xx_wdt_interrupt,
+			0, pdev->name, pdev)) {
+		ret = -EIO;
+		goto err_map;
+	}
+#endif
+
+	watchdog_set_nowayout(&npcm7xx_wdd, nowayout);
+	ret = watchdog_register_device(&npcm7xx_wdd);
+	if (ret) {
+		dev_err(&pdev->dev, "Error register watchdog device\n");
+		goto err_irq;
+	}
+
+	WDOG_DEBUG("Probed\n");
+	return 0;
+err_irq:
+	free_irq(npcm7xx_wdt->irq, pdev);
+#ifndef WATCHDOG_FIQ
+err_map:
+#endif
+	iounmap(npcm7xx_wdt->wdt_base);
+err_mem:
+	release_mem_region(npcm7xx_wdt->res->start,
+			   resource_size(npcm7xx_wdt->res));
+err_alloc:
+	kfree(npcm7xx_wdt);
+	return ret;
+}
+
+static int npcm7xx_wdt_remove(struct platform_device *pdev)
+{
+	WDOG_DEBUG("%s()\n", __func__);
+
+	watchdog_unregister_device(&npcm7xx_wdd);
+	iounmap(npcm7xx_wdt->wdt_base);
+	release_mem_region(npcm7xx_wdt->res->start,
+			   resource_size(npcm7xx_wdt->res));
+	kfree(npcm7xx_wdt);
+
+	return 0;
+}
+
+static void npcm7xx_wdt_shutdown(struct platform_device *pdev)
+{
+	WDOG_DEBUG("%s()\n", __func__);
+	npcm7xx_wdt_stop(&npcm7xx_wdd);
+}
+
+#define npcm7xx_wdt_suspend	NULL
+#define npcm7xx_wdt_resume	NULL
+
+static const struct of_device_id wd_dt_id[] = {
+	{.compatible = "nuvoton,npcm750-wdt"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, wd_dt_id);
+
+static struct platform_driver npcm7xx_wdt_driver = {
+	.probe		= npcm7xx_wdt_probe,
+	.remove		= npcm7xx_wdt_remove,
+	.shutdown	= npcm7xx_wdt_shutdown,
+	.suspend	= npcm7xx_wdt_suspend,
+	.resume		= npcm7xx_wdt_resume,
+	.driver		= {
+		.name	= "npcm7xx-wdt",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(wd_dt_id),
+	},
+};
+
+module_platform_driver(npcm7xx_wdt_driver);
+
+MODULE_DESCRIPTION("Watchdog driver for NPCM7XX");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/watchdog/npcm7xx_wdt_fiq_handler.S b/drivers/watchdog/npcm7xx_wdt_fiq_handler.S
new file mode 100644
index 000000000000..92ea5e7bd267
--- /dev/null
+++ b/drivers/watchdog/npcm7xx_wdt_fiq_handler.S
@@ -0,0 +1,68 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+
+#define WDOG_REG_WTCR	0x1C		/* Watchdog register offset */
+#define WDOG_BIT_WTIF	(0x01 << 3)	/* WTCR interrupt flag*/
+#define WDOG_BIT_WTIE	(0x01 << 6)	/* WTCR enable interrupt*/
+
+/*
+ * Register usage
+
+ * r12 - virt. base addr
+ * r13 - reg_val
+ */
+
+	.text
+	.global npcm7xx_wdt_fiq_end
+
+ENTRY(npcm7xx_wdt_fiq_start)
+	@ FIQ intrrupt handler
+	MRC p15,0,r0,c0,c0,5@ read Multiprocessor ID register
+	BIC r0, #0xFFFFFFF0
+	CMP r0,#0x0
+	BEQ THIS_IS_CPU0
+	b .     @ loop - all other cpus stuck here
+
+	THIS_IS_CPU0:
+
+        ldr r13, [r12, #WDOG_REG_WTCR]
+        tst r13, #WDOG_BIT_WTIF
+	beq exit				@ none - spurious FIQ? exit
+
+	ldr r13, [r12, #WDOG_REG_WTCR]
+	bic r13, r13, #WDOG_BIT_WTIE            @ Disable watchdog interrupt
+	str r13, [r12, #WDOG_REG_WTCR]
+
+@@@@@@@@@@@@@@@@@@@@@@@@@@
+@
+@ FIQ - Kernel Dump
+@ Add Assembler Code here ...
+
+
+@
+@
+@@@@@@@@@@@@@@@@@@@@@@@@@@
+
+	b .	@ CPU0 - loop until HW watchdog reset
+
+
+exit:
+	subs	pc, lr, #4			@ return from FIQ
+
+
+npcm7xx_wdt_fiq_end:
+
+/*
+ * Check the size of the FIQ,
+ * it cannot go beyond 0xffff0200, and is copied to 0xffff001c
+ */
+.if (npcm7xx_wdt_fiq_end - npcm7xx_wdt_fiq_start) > (0x200 - 0x1c)
+	.err
+.endif
-- 
2.14.1
