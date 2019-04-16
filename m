Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="dujmOxQc"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2QM429FzDqF1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:57:47 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0F5DB41980;
 Tue, 16 Apr 2019 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412262;
 x=1557226663; bh=EKgqzpeMl2avF2mT4VneuI2zvcB34rvWwCOfUtLkIco=; b=
 dujmOxQccnxMyC8weBr5HbM2MsbaIeDdPJR2YxMaANuXi2oE6eeFzsSJ1rGxKA5S
 VIxz2WujvAWCKu9UhACNJjRdt1/2Bh9A4E9pb58F3Vfc8sJgYLbgzJtCDYM14lNd
 GDU17DXXmQCN0LOiM5eonwxlMYiqup6FFfE3DUVG5+M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKW2yBIGIi0H; Tue, 16 Apr 2019 13:57:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5DF2141943;
 Tue, 16 Apr 2019 13:57:42 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:57:42 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 3/7] irqchip: Aspeed: Add Aspeed sdhci irq
 driver
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <102a7818-09c6-d084-e458-3873032afe28@yadro.com>
Date: Tue, 16 Apr 2019 13:57:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ayGXQkOi3xmT3N8q3zog7wBl44S2AHSX1"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 10:57:48 -0000

--ayGXQkOi3xmT3N8q3zog7wBl44S2AHSX1
Content-Type: multipart/mixed; boundary="IhlMDTIlhdHWaWpPiwtD9S0BAmJ3AeprH";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <102a7818-09c6-d084-e458-3873032afe28@yadro.com>
Subject: [PATCHv2-modified dev-4.19 3/7] irqchip: Aspeed: Add Aspeed sdhci irq
 driver
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--IhlMDTIlhdHWaWpPiwtD9S0BAmJ3AeprH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

In Aspeed SoC's sdhci have two slots and have a interrupt status and
general information in top for register. so it need a sdhci irq driver
probe defore sdhci driver probe

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/irqchip/Makefile              |   2 +-
 drivers/irqchip/irq-aspeed-sdhci-ic.c | 147 ++++++++++++++++++++++++++++=
++++++
 include/linux/mmc/sdhci-aspeed-data.h |  28 +++++++
 3 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-aspeed-sdhci-ic.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index fbd1ec8..57e9f8d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_MVEBU_ODMI)		+=3D irq-mvebu-odmi.o
 obj-$(CONFIG_MVEBU_PIC)			+=3D irq-mvebu-pic.o
 obj-$(CONFIG_LS_SCFG_MSI)		+=3D irq-ls-scfg-msi.o
 obj-$(CONFIG_EZNPS_GIC)			+=3D irq-eznps.o
-obj-$(CONFIG_ARCH_ASPEED)		+=3D irq-aspeed-vic.o irq-aspeed-i2c-ic.o
+obj-$(CONFIG_ARCH_ASPEED)		+=3D irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq=
-aspeed-sdhci-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+=3D irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+=3D qcom-irq-combiner.o
 obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+=3D irq-uniphier-aidet.o
diff --git a/drivers/irqchip/irq-aspeed-sdhci-ic.c b/drivers/irqchip/irq-=
aspeed-sdhci-ic.c
new file mode 100644
index 0000000..c3d9d45
--- /dev/null
+++ b/drivers/irqchip/irq-aspeed-sdhci-ic.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDHCI IRQCHIP driver for the Aspeed SoC
+ *
+ * Copyright (C) ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at=

+ * your option) any later version.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/mmc/sdhci-aspeed-data.h>
+
+#define ASPEED_SDHCI_SLOT_NUM			2
+
+static void aspeed_sdhci_irq_handler(struct irq_desc *desc)
+{
+	struct aspeed_sdhci_irq *sdhci_irq =3D irq_desc_get_handler_data(desc);=

+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	unsigned long bit, status;
+	unsigned int slot_irq;
+
+	chained_irq_enter(chip, desc);
+	status =3D readl(sdhci_irq->regs + ASPEED_SDHCI_ISR);
+	for_each_set_bit(bit, &status, ASPEED_SDHCI_SLOT_NUM) {
+		slot_irq =3D irq_find_mapping(sdhci_irq->irq_domain, bit);
+		generic_handle_irq(slot_irq);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+static void noop(struct irq_data *data) { }
+
+static unsigned int noop_ret(struct irq_data *data)
+{
+	return 0;
+}
+
+struct irq_chip sdhci_irq_chip =3D {
+	.name		=3D "sdhci-ic",
+	.irq_startup	=3D noop_ret,
+	.irq_shutdown	=3D noop,
+	.irq_enable	=3D noop,
+	.irq_disable	=3D noop,
+	.irq_ack	=3D noop,
+	.irq_mask	=3D noop,
+	.irq_unmask	=3D noop,
+	.flags		=3D IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int ast_sdhci_map_irq_domain(struct irq_domain *domain,
+				    unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &sdhci_irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_sdhci_irq_domain_ops =3D {
+	.map =3D ast_sdhci_map_irq_domain,
+};
+
+static int irq_aspeed_sdhci_probe(struct platform_device *pdev)
+{
+	struct aspeed_sdhci_irq *sdhci_irq;
+	struct clk *sdclk;
+
+	sdhci_irq =3D kzalloc(sizeof(*sdhci_irq), GFP_KERNEL);
+	if (!sdhci_irq)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, sdhci_irq);
+	//node->data =3D sdhci_irq;
+	pdev->dev.of_node->data =3D sdhci_irq;
+
+	sdhci_irq->regs =3D of_iomap(pdev->dev.of_node, 0);
+	if (IS_ERR(sdhci_irq->regs))
+		return PTR_ERR(sdhci_irq->regs);
+
+	sdclk =3D devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(sdclk)) {
+		dev_err(&pdev->dev, "no sdclk clock defined\n");
+		return PTR_ERR(sdclk);
+	}
+
+	clk_prepare_enable(sdclk);
+
+	sdhci_irq->parent_irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (sdhci_irq->parent_irq < 0)
+		return sdhci_irq->parent_irq;
+
+	sdhci_irq->irq_domain =3D irq_domain_add_linear(
+					pdev->dev.of_node, ASPEED_SDHCI_SLOT_NUM,
+					&aspeed_sdhci_irq_domain_ops, NULL);
+	if (!sdhci_irq->irq_domain)
+		return -ENOMEM;
+
+	sdhci_irq->irq_domain->name =3D "aspeed-sdhci-irq";
+
+	irq_set_chained_handler_and_data(sdhci_irq->parent_irq,
+					 aspeed_sdhci_irq_handler, sdhci_irq);
+
+	pr_info("sdhci irq controller registered, irq %d\n", sdhci_irq->parent_=
irq);
+
+	return 0;
+}
+
+static const struct of_device_id irq_aspeed_sdhci_dt_ids[] =3D {
+	{ .compatible =3D "aspeed,aspeed-sdhci-irq", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, irq_aspeed_sdhci_dt_ids);
+
+static struct platform_driver irq_aspeed_sdhci_device_driver =3D {
+	.probe		=3D irq_aspeed_sdhci_probe,
+	.driver		=3D {
+		.name   =3D KBUILD_MODNAME,
+		.of_match_table	=3D irq_aspeed_sdhci_dt_ids,
+	}
+};
+
+static int __init irq_aspeed_sdhci_init(void)
+{
+	return platform_driver_register(&irq_aspeed_sdhci_device_driver);
+}
+core_initcall(irq_aspeed_sdhci_init);
+
+MODULE_AUTHOR("Ryan Chen");
+MODULE_DESCRIPTION("ASPEED SOC SDHCI IRQ Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mmc/sdhci-aspeed-data.h b/include/linux/mmc/sd=
hci-aspeed-data.h
new file mode 100644
index 0000000..fba2bf2
--- /dev/null
+++ b/include/linux/mmc/sdhci-aspeed-data.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_MMC_SDHCI_ASPEED_DATA_H
+#define LINUX_MMC_SDHCI_ASPEED_DATA_H
+
+#include <linux/io.h>
+
+#define ASPEED_SDHCI_INFO			0x00
+#define  ASPEED_SDHCI_S1MMC8			BIT(25)
+#define  ASPEED_SDHCI_S0MMC8			BIT(24)
+#define ASPEED_SDHCI_BLOCK			0x04
+#define ASPEED_SDHCI_CTRL			0xF0
+#define ASPEED_SDHCI_ISR			0xFC
+
+struct aspeed_sdhci_irq {
+	void __iomem *regs;
+	int parent_irq;
+	struct irq_domain *irq_domain;
+};
+
+static inline void aspeed_sdhci_set_8bit_mode(struct aspeed_sdhci_irq *s=
dhci_irq, int mode)
+{
+	if (mode)
+		writel(ASPEED_SDHCI_S0MMC8 | readl(sdhci_irq->regs), sdhci_irq->regs);=

+	else
+		writel(~ASPEED_SDHCI_S0MMC8 & readl(sdhci_irq->regs), sdhci_irq->regs)=
;
+}
+
+#endif
--=20
2.7.4



--IhlMDTIlhdHWaWpPiwtD9S0BAmJ3AeprH--

--ayGXQkOi3xmT3N8q3zog7wBl44S2AHSX1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbUlAAoJEOiTWHtbdBeNDiQQAMWdXbyRkn3Bav4z1MVWo0pn
nkLMZuioG3Yqhjgws6ulMeK4gieczlN6r8dYKy5DdBPhKzmqi8+7hvA7JGlJrSKY
UXB65Qq8BHOcSBVS/WL5V1Xidp7GyaHo65tSnwmHo6bHfetmv79DT/zWSXz3jKMM
Po2F2qGqSSWRF3i1s5CQqwZLZUYT7zLaq+rOsAWqoPR/VZuBoUdKCpwpMvRvBpVQ
jbOxOS8hmqrX3f+fZ3tZObbqH3rc1CY5Q4w/5Wvz3NDnISv2fzSLyQvKuIF7Jz/Y
KRFpVy+6Nak1ZMvB6WJmuOPIOmJsa9j7UfHmILSAHuxeeJnxs2dG+xiPivrAeECu
2DBmXdVrmvRWNiXogc4pHPOvsQfJN2gUZ0kn9ZfKHUXjHPe5MEnoPn0OSbKxMffP
cFGiRBGMRmjbqlB6Bhvnstb9CtRHmo/+1j9XWuJzgwAm3odNnbmpKp93hbD1mpoV
leRfCCbU/J51qCcIKFcHnNIElHZldADPXnZJald/YgLXwH5e9KOsdW9ELBA6TehB
qpEtgTaezK5VILuH3GsogMfezo40pub5nKsOAFV6JBGwvwaFAjwhdXd69KnQAJDE
7qW4J5ZWbTkNM6UplYTH2Az6PqrftxoQQsZ2P42ou7/Ux/2mJ8qgcKUn5VMWY/Lm
0k32/nvcc6SwkOnKLJ56
=VpEi
-----END PGP SIGNATURE-----

--ayGXQkOi3xmT3N8q3zog7wBl44S2AHSX1--
