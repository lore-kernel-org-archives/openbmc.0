Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfDC5DQjzDqZr
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="s/oQ5npu"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id n5so53754957pgh.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fy7yLZDalXPupGd26RkRm5uf4tdnTpBwcZ8/lPnqghM=;
 b=s/oQ5npuQgmsS7XAogxTR1CZW1Uu8Dt42qGHNbg1AE1Nm31cfUeJWxAShtmp00gqZ9
 q8RawzQeNNF0QNHD0abhBHxrPmXxUrhpPJrpqUfx+MIhDWZ41Dhl8dOj0JXMguhg0bTi
 TQyz2cmnqBp45jAO2cm6zzbeaJcrz54Is6eF+v+0LxLG3tnPu/wuj4TPFAZ2mAcb8DUu
 /XvjiSReAIj+CRcrv2HDq++No2kpjICDHUhPGkYRmDRSTuGzUoMnRiaX/syCYzCq81Gn
 xysKgaAWlwOjohIM/Temumc/VnFK456JDrB28u2cbF9ztBu5aalIjsm/Mj3V6QrgP29l
 qJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fy7yLZDalXPupGd26RkRm5uf4tdnTpBwcZ8/lPnqghM=;
 b=qr2OM9XuKSc3xY5JOlvG3sI/0ckUV4eomxoNXJH2iLhKFbnPPnOXRahDW7UQpeCj8c
 LDg1O6W4KABxKffEavLOEikFya0uG4hT9wrSnNcJsozvdwDEm2KJCYDqn5+MhSw5eGi+
 JE38mLoNHZNNrXkNCB7LKWR0VJ1VgAikhInA1rxIEWsb2NMQgaLbT5yhoYq690z2fBj+
 ja2nqjKrYX0G+UKnd4VuIXNaiewiZdF+rAbpVaYZzYxIdEztrF6y7WJlLmYZ152kpFdd
 CpTv/2zg4qaulKnYX0gvlYn8aNcvg73o56iGzt+LgSBv36jO7LTIyMWvhSn3oPCwdi3F
 RQoA==
X-Gm-Message-State: AFeK/H3haHM7kmCzWmDDvavVW1f3qmVwGPgMzC9nhT4FaAtZhh8mNvJYxZ82FwPC8baVINWC
X-Received: by 10.98.61.5 with SMTP id k5mr29762460pfa.229.1490677977659;
 Mon, 27 Mar 2017 22:12:57 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p19sm368233pfl.15.2017.03.27.22.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:12:57 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
Date: Mon, 27 Mar 2017 22:12:23 -0700
Message-Id: <20170328051226.21677-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
In-Reply-To: <20170328051226.21677-1-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:13:00 -0000

The Aspeed 24XX/25XX chips share a single hardware interrupt across 14
separate I2C busses. This adds a dummy irqchip which maps the single
hardware interrupt to software interrupts for each of the busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
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
index 000000000000..59c50b28dec0
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
+	i2c_ic->irq_domain->name = "ast-i2c-domain";
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
2.12.2.564.g063fe858b8-goog
