Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBZNN1CY7zDqC2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 04:18:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pS7WlNXe"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id v14so12412670pfd.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P49h1F9pLgRjOUTxTO4EJ+Pl86ZuPy1i+9ZGG8ONGR8=;
 b=pS7WlNXedCv+0nNyNjSI8UGlboLEN+bp9AudvDBQyCeLHaCWdYWx5reAosmskofva6
 M1VefcPYFpJH4XlGe9+JUwO1DOAx0cX57A1bpWdF9+kTQjIWoUL+jEJLF+T3e7dEhb3s
 PUp0k0Uoo/m/qnff44eqmmffs+X8ksyiR/Ga6RhEG/r4ls/Un6y8bglAo3BuAut6fVRn
 vqoSWq1x6nOb2qSY4wmDshjObK2QunRDFxe5NB4sJ6Koi0/lF7Z0VIhE44m3171bPPFv
 E+AvYlRoLl2b2xhkwArQ7AdAIvt/P/EXfwCrDodH8xOwNEgTmu9cPVP04y+6Oqb3JbKQ
 JBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P49h1F9pLgRjOUTxTO4EJ+Pl86ZuPy1i+9ZGG8ONGR8=;
 b=um+E9o4XR0apyd0s4Ka/dfUqpTLDXQsO9Ckn5KcJLxzSGG0SFuh8/bq5EipX+X2rXu
 ln60aotS95iA8HXMzD+3H5QzxbTyTGSXPQjMArgf+pfrnOExU3qXEJSnZGuuuTjPAdzc
 z+8Qs+e232CykA/Yw4OrdxT7mIq+rMznkya9YhzCdGOUamEOi5BkfzyaC93Db0YjuzoI
 M1jJfuC4zG9GnpPmoHH+OL1ut0WM2AHgwyHqenp/2zyOGicf53XcH3Zt2u1aK3EfxTMr
 yu0hRvPWeSPWpv5L2/o8YOWzcZW5wgSQOW8yQhrUBO4wJSt07K/rIB2Kwssm/N90Do15
 13tA==
X-Gm-Message-State: AN3rC/64lye5yGXZTEBuzy6MCJ/0BRRFDi/glgM7K/M2Ygrw1jki9hs/
 ZSZE/Q5hjis49TkV
X-Received: by 10.84.129.4 with SMTP id 4mr35111009plb.37.1493057922159;
 Mon, 24 Apr 2017 11:18:42 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm32220630pgc.1.2017.04.24.11.18.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Apr 2017 11:18:41 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
Date: Mon, 24 Apr 2017 11:18:15 -0700
Message-Id: <20170424181818.2754-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.816.g2cccc81164-goog
In-Reply-To: <20170424181818.2754-1-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 18:18:44 -0000

The Aspeed 24XX/25XX chips share a single hardware interrupt across 14
separate I2C busses. This adds a dummy irqchip which maps the single
hardware interrupt to software interrupts for each of the busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
Changes for v7:
  - Renamed irq domain for consistency
---
 drivers/irqchip/Makefile            |   2 +-
 drivers/irqchip/irq-aspeed-i2c-ic.c | 102 ++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-aspeed-i2c-ic.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 152bc40b6762..c136c2bd1761 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -74,6 +74,6 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
 obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
+obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
new file mode 100644
index 000000000000..a36fb09c10c2
--- /dev/null
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -0,0 +1,102 @@
+/*
+ *  Aspeed 24XX/25XX I2C Interrupt Controller.
+ *
+ *  Copyright (C) 2012-2017 ASPEED Technology Inc.
+ *  Copyright 2017 IBM Corporation
+ *  Copyright 2017 Google, Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/io.h>
+
+
+#define ASPEED_I2C_IC_NUM_BUS 14
+
+struct aspeed_i2c_ic {
+	void __iomem		*base;
+	int			parent_irq;
+	struct irq_domain	*irq_domain;
+};
+
+/*
+ * The aspeed chip provides a single hardware interrupt for all of the I2C
+ * busses, so we use a dummy interrupt chip to translate this single interrupt
+ * into multiple interrupts, each associated with a single I2C bus.
+ */
+static void aspeed_i2c_ic_irq_handler(struct irq_desc *desc)
+{
+	struct aspeed_i2c_ic *i2c_ic = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long bit, status;
+	unsigned int bus_irq;
+
+	chained_irq_enter(chip, desc);
+	status = readl(i2c_ic->base);
+	for_each_set_bit(bit, &status, ASPEED_I2C_IC_NUM_BUS) {
+		bus_irq = irq_find_mapping(i2c_ic->irq_domain, bit);
+		generic_handle_irq(bus_irq);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+/*
+ * Set simple handler and mark IRQ as valid. Nothing interesting to do here
+ * since we are using a dummy interrupt chip.
+ */
+static int aspeed_i2c_ic_map_irq_domain(struct irq_domain *domain,
+					unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &dummy_irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_i2c_ic_irq_domain_ops = {
+	.map = aspeed_i2c_ic_map_irq_domain,
+};
+
+static int __init aspeed_i2c_ic_of_init(struct device_node *node,
+					struct device_node *parent)
+{
+	struct aspeed_i2c_ic *i2c_ic;
+
+	i2c_ic = kzalloc(sizeof(*i2c_ic), GFP_KERNEL);
+	if (!i2c_ic)
+		return -ENOMEM;
+
+	i2c_ic->base = of_iomap(node, 0);
+	if (IS_ERR(i2c_ic->base))
+		return PTR_ERR(i2c_ic->base);
+
+	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
+	if (i2c_ic->parent_irq < 0)
+		return i2c_ic->parent_irq;
+
+	i2c_ic->irq_domain = irq_domain_add_linear(
+			node, ASPEED_I2C_IC_NUM_BUS,
+			&aspeed_i2c_ic_irq_domain_ops, NULL);
+	if (!i2c_ic->irq_domain)
+		return -ENOMEM;
+
+	i2c_ic->irq_domain->name = "aspeed-i2c-domain";
+
+	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
+					 aspeed_i2c_ic_irq_handler, i2c_ic);
+
+	pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(ast2400_i2c_ic, "aspeed,ast2400-i2c-ic", aspeed_i2c_ic_of_init);
+IRQCHIP_DECLARE(ast2500_i2c_ic, "aspeed,ast2500-i2c-ic", aspeed_i2c_ic_of_init);
-- 
2.12.2.816.g2cccc81164-goog
