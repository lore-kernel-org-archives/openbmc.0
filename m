Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC3462N16zDqq4
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 20:52:00 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w049Y33v030702;
 Thu, 4 Jan 2018 11:34:03 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 673205A955; Thu,  4 Jan 2018 11:51:50 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 2/2] hw_random: npcm: add NPCM7xx random
 number generator
Date: Thu,  4 Jan 2018 11:51:46 +0200
Message-Id: <1515059506-17818-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1515059506-17818-1-git-send-email-tmaimon77@gmail.com>
References: <1515059506-17818-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 09:52:07 -0000

Add Nuvoton BMC NPCM7xx random number generator driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/Kconfig       |  13 +++
 drivers/char/hw_random/Makefile      |   1 +
 drivers/char/hw_random/npcm7xx-rng.c | 203 +++++++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 drivers/char/hw_random/npcm7xx-rng.c

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 1b223c32a8ae..e7ba0cb04744 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -180,6 +180,19 @@ config HW_RANDOM_OMAP
 
  	  If unsure, say Y.
 
+config HW_RANDOM_NPCM7XX
+	tristate "NPCM7XX Random Number Generator support"
+	depends on HW_RANDOM && ARCH_NPCM7XX
+	default HW_RANDOM
+ 	---help---
+ 	  This driver provides kernel-side support for the Random Number
+	  Generator hardware found on npcm7xx processor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called npcm7xx-rng.
+
+ 	  If unsure, say Y.
+
 config HW_RANDOM_OMAP3_ROM
 	tristate "OMAP3 ROM Random Number Generator support"
 	depends on ARCH_OMAP3
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index b085975ec1d2..c612f1a4bd76 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_HW_RANDOM_MESON) += meson-rng.o
 obj-$(CONFIG_HW_RANDOM_CAVIUM) += cavium-rng.o cavium-rng-vf.o
 obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
 obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
+obj-$(CONFIG_HW_RANDOM_NPCM7XX) += npcm7xx-rng.o
diff --git a/drivers/char/hw_random/npcm7xx-rng.c b/drivers/char/hw_random/npcm7xx-rng.c
new file mode 100644
index 000000000000..b881e61c5a14
--- /dev/null
+++ b/drivers/char/hw_random/npcm7xx-rng.c
@@ -0,0 +1,203 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/random.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/hw_random.h>
+#include <linux/delay.h>
+#include <linux/of_irq.h>
+
+#define RNGCS_REG		0x00	/* Control and status register */
+#define RNGD_REG		0x04	/* DATA register */
+#define RNGTST_REG		0x08	/* TEST register */
+
+#define RNG_CLK_SET             (0x06 << 2)    /* 20-25 MHz */
+#define RNG_DATA_VALID          (0x01 << 1)
+#define RNG_ENABLE              0x01
+
+#define RNG_DEBUG
+
+static void __iomem *rng_base;
+static struct platform_device *rng_dev;
+
+static inline u32 npcm750_rng_read_reg(int reg)
+{
+	return __raw_readb(rng_base + reg);
+}
+
+static inline void npcm750_rng_write_reg(int reg, u32 val)
+{
+	__raw_writeb(val, rng_base + reg);
+}
+
+static int npcm750_rng_data_present(struct hwrng *rng, int wait)
+{
+	int data, i;
+
+	for (i = 0; i < 20; i++) {
+		data = (npcm750_rng_read_reg(RNGCS_REG) & RNG_DATA_VALID) ?
+			1 : 0;
+		if (data || !wait)
+			break;
+		/* RNG produces data fast enough (2+ MBit/sec, even
+		 * during "rngtest" loads, that these delays don't
+		 * seem to trigger.  We *could* use the RNG IRQ, but
+		 * that'd be higher overhead ... so why bother?
+		 */
+		udelay(10);
+	}
+
+	return data;
+}
+
+static int npcm750_rng_data_read(struct hwrng *rng, u32 *data)
+{
+	*data = npcm750_rng_read_reg(RNGD_REG);
+
+	return 1;
+}
+
+static struct hwrng npcm750_rng_ops = {
+	.name		= "npcm750",
+	.data_present	= npcm750_rng_data_present,
+	.data_read	= npcm750_rng_data_read,
+};
+
+static int npcm750_rng_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	int ret;
+
+	/*
+	 * A bit ugly, and it will never actually happen but there can
+	 * be only one RNG and this catches any bork
+	 */
+	if (rng_dev)
+		return -EBUSY;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		ret = -ENOENT;
+		goto err_region;
+	}
+
+	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
+		ret = -EBUSY;
+		goto err_region;
+	}
+
+	dev_set_drvdata(&pdev->dev, res);
+	rng_base = ioremap(res->start, resource_size(res));
+	if (!rng_base) {
+		ret = -ENOMEM;
+		goto err_ioremap;
+	}
+
+	ret = hwrng_register(&npcm750_rng_ops);
+	if (ret)
+		goto err_register;
+
+	npcm750_rng_write_reg(RNGTST_REG, 0x02);
+	npcm750_rng_write_reg(RNGCS_REG, RNG_CLK_SET | RNG_ENABLE);
+
+	rng_dev = pdev;
+
+#ifdef RNG_DEBUG
+	mdelay(10);
+	pr_info("RNG-Random Number Generator 0x%x\n",
+	       npcm750_rng_read_reg(RNGD_REG));
+#else
+	pr_info("RNG-Random Number Generator\n");
+#endif
+
+	return 0;
+
+err_register:
+	iounmap(rng_base);
+	rng_base = NULL;
+err_ioremap:
+	release_mem_region(res->start, resource_size(res));
+err_region:
+
+	return ret;
+}
+
+static int __exit npcm750_rng_remove(struct platform_device *pdev)
+{
+	struct resource *res = dev_get_drvdata(&pdev->dev);
+
+	hwrng_unregister(&npcm750_rng_ops);
+	npcm750_rng_write_reg(RNGCS_REG, 0x0);
+	iounmap(rng_base);
+	release_mem_region(res->start, resource_size(res));
+
+	rng_base = NULL;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+
+static int npcm750_rng_suspend(struct platform_device *pdev,
+			       pm_message_t message)
+{
+	u32 val;
+
+	val = npcm750_rng_read_reg(RNGCS_REG);
+	val &= 0xfffffffe;
+	npcm750_rng_write_reg(RNGCS_REG, val);
+	return 0;
+}
+
+static int npcm750_rng_resume(struct platform_device *pdev)
+{
+	u32 val;
+
+	val = npcm750_rng_read_reg(RNGCS_REG);
+	val |= 0x00000001;
+	npcm750_rng_write_reg(RNGCS_REG, val);
+	return 0;
+}
+
+#else
+
+#define	npcm750_rng_suspend	NULL
+#define	npcm750_rng_resume	NULL
+
+#endif
+
+/* work with hotplug and coldplug */
+MODULE_ALIAS("platform:npcm750-rng");
+
+static const struct of_device_id rng_dt_id[] = {
+	{ .compatible = "nuvoton,npcm750-rng",  },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rng_dt_id);
+
+static struct platform_driver npcm750_rng_driver = {
+	.driver = {
+		.name		= "npcm750-rng",
+		.owner		= THIS_MODULE,
+		.of_match_table = of_match_ptr(rng_dt_id),
+	},
+	.probe		= npcm750_rng_probe,
+	.remove		= __exit_p(npcm750_rng_remove),
+	.suspend	= npcm750_rng_suspend,
+	.resume		= npcm750_rng_resume
+};
+
+module_platform_driver(npcm750_rng_driver);
+
+MODULE_AUTHOR("Deepak Saxena (and others)");
+MODULE_LICENSE("GPL");
-- 
2.14.1
