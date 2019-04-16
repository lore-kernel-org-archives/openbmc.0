Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Zgvc4p5n"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2Qp34sgzDqCw
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:58:10 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 87FF64198D;
 Tue, 16 Apr 2019 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412286;
 x=1557226687; bh=WAajfpcFIDJWR3x3FdRkrMTkvC8ZuElgNgACNOHEeP0=; b=
 Zgvc4p5nOzI2mU9JCleuxcKlKzys3t2vMjX7XVkN9n/i+8Ew75e/lhC9xfRMYdaG
 AHfrqmnWR7edQcZwblTcHHvOI4Xi2bMAqUZOVy8l+B7H1RFFPnb8KzNCsdSWz/0K
 jsGn4lbEW44z63UGwIbbZksgjnaatWI+L5FP2XH2bws=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZYgR7MofS14; Tue, 16 Apr 2019 13:58:06 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1FCD741980;
 Tue, 16 Apr 2019 13:58:06 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:58:05 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 5/7] mmc: Aspeed: Add driver for Aspeed
 sdhci
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <db7af000-7302-c8c5-0f24-9af9a2d1209e@yadro.com>
Date: Tue, 16 Apr 2019 13:58:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6IipvASjdGlCxwqnZjF9TbaNfzSmmdBxC"
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
X-List-Received-Date: Tue, 16 Apr 2019 10:58:11 -0000

--6IipvASjdGlCxwqnZjF9TbaNfzSmmdBxC
Content-Type: multipart/mixed; boundary="YFQqyS3v7ueg70GBLECw8p4Y6NWwePiIF";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <db7af000-7302-c8c5-0f24-9af9a2d1209e@yadro.com>
Subject: [PATCHv2-modified dev-4.19 5/7] mmc: Aspeed: Add driver for Aspeed
 sdhci
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--YFQqyS3v7ueg70GBLECw8p4Y6NWwePiIF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

Add a driver for Aspeed's sdhci controller core.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/mmc/host/Kconfig           |  12 +++
 drivers/mmc/host/Makefile          |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c | 178 +++++++++++++++++++++++++++++++=
++++++
 3 files changed, 191 insertions(+)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 694d082..9ca8265 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -142,6 +142,18 @@ config MMC_SDHCI_OF_ARASAN
=20
 	  If unsure, say N.
=20
+config MMC_SDHCI_OF_ASPEED
+	tristate "SDHCI OF support for the ASPEED SDHCI controller"
+	depends on MMC_SDHCI_PLTFM
+	depends on OF
+	help
+	  This selects the ASPEED Secure Digital Host Controller Interface.
+
+	  If you have a controller with this interface, say Y or M here. You
+	  also need to enable an appropriate bus interface.
+
+	  If unsure, say N.
+
 config MMC_SDHCI_OF_AT91
 	tristate "SDHCI OF support for the Atmel SDMMC controller"
 	depends on MMC_SDHCI_PLTFM
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index ce8398e..0b349d4 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+=3D sdhci-esdhc-imx.=
o
 obj-$(CONFIG_MMC_SDHCI_DOVE)		+=3D sdhci-dove.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+=3D sdhci-tegra.o
 obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+=3D sdhci-of-arasan.o
+obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+=3D sdhci-of-aspeed.o
 obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+=3D sdhci-of-at91.o
 obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+=3D sdhci-of-esdhc.o
 obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+=3D sdhci-of-hlwd.o
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
new file mode 100644
index 0000000..8e609e1
--- /dev/null
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ASPEED Secure Digital Host Controller Interface.
+ * Copyright (C) ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at=

+ * your option) any later version.
+ *
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mmc/host.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/mmc/sdhci-aspeed-data.h>
+#include <linux/reset.h>
+#include "sdhci-pltfm.h"
+
+static void sdhci_aspeed_set_clock(struct sdhci_host *host, unsigned int=
 clock)
+{
+	int div;
+	u16 clk;
+	unsigned long timeout;
+
+	if (clock =3D=3D host->clock)
+		return;
+
+	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
+
+	if (clock =3D=3D 0)
+		goto out;
+
+	for (div =3D 1; div < 256; div *=3D 2) {
+		if ((host->max_clk / div) <=3D clock)
+			break;
+	}
+	div >>=3D 1;
+
+	clk =3D div << SDHCI_DIVIDER_SHIFT;
+	clk |=3D SDHCI_CLOCK_INT_EN;
+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
+
+	/* Wait max 20 ms */
+	timeout =3D 20;
+	while (!((clk =3D sdhci_readw(host, SDHCI_CLOCK_CONTROL))
+		 & SDHCI_CLOCK_INT_STABLE)) {
+		if (timeout =3D=3D 0) {
+			pr_err("%s: Internal clock never stabilised.\n",
+			       mmc_hostname(host->mmc));
+			return;
+		}
+		timeout--;
+		mdelay(1);
+	}
+
+	clk |=3D SDHCI_CLOCK_CARD_EN;
+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
+
+out:
+	host->clock =3D clock;
+}
+
+static void sdhci_aspeed_set_bus_width(struct sdhci_host *host, int widt=
h)
+{
+	struct sdhci_pltfm_host *pltfm_priv =3D sdhci_priv(host);
+	struct aspeed_sdhci_irq *sdhci_irq =3D sdhci_pltfm_priv(pltfm_priv);
+
+	u8 ctrl =3D sdhci_readb(host, SDHCI_HOST_CONTROL);
+
+	if (sdhci_irq->regs) {
+		if (width =3D=3D MMC_BUS_WIDTH_8)
+			aspeed_sdhci_set_8bit_mode(sdhci_irq, 1);
+		else
+			aspeed_sdhci_set_8bit_mode(sdhci_irq, 0);
+	}
+	if (width =3D=3D MMC_BUS_WIDTH_4)
+		ctrl |=3D SDHCI_CTRL_4BITBUS;
+	else
+		ctrl &=3D ~SDHCI_CTRL_4BITBUS;
+
+	sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
+
+}
+
+static struct sdhci_ops  sdhci_aspeed_ops =3D {
+	.set_clock =3D sdhci_aspeed_set_clock,
+	.get_max_clock =3D sdhci_pltfm_clk_get_max_clock,
+	.set_bus_width =3D sdhci_aspeed_set_bus_width,
+	.get_timeout_clock =3D sdhci_pltfm_clk_get_max_clock,
+	.reset =3D sdhci_reset,
+	.set_uhs_signaling =3D sdhci_set_uhs_signaling,
+};
+
+static struct sdhci_pltfm_data sdhci_aspeed_pdata =3D {
+	.ops =3D &sdhci_aspeed_ops,
+	.quirks =3D SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+	.quirks2 =3D SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
+};
+
+static int sdhci_aspeed_probe(struct platform_device *pdev)
+{
+	struct sdhci_host *host;
+	struct device_node *pnode;
+	struct device_node *np =3D pdev->dev.of_node;
+	struct sdhci_pltfm_host *pltfm_host;
+	struct aspeed_sdhci_irq *sdhci_irq;
+
+	int ret;
+
+	host =3D sdhci_pltfm_init(pdev, &sdhci_aspeed_pdata, sizeof(struct aspe=
ed_sdhci_irq));
+	if (IS_ERR(host))
+		return PTR_ERR(host);
+
+	pltfm_host =3D sdhci_priv(host);
+	sdhci_irq =3D sdhci_pltfm_priv(pltfm_host);
+
+	sdhci_get_of_property(pdev);
+
+	pltfm_host->clk =3D devm_clk_get(&pdev->dev, NULL);
+
+	pnode =3D of_parse_phandle(np, "interrupt-parent", 0);
+	if (pnode)
+		memcpy(sdhci_irq, pnode->data, sizeof(struct aspeed_sdhci_irq));
+
+	ret =3D mmc_of_parse(host->mmc);
+	if (ret)
+		goto err_sdhci_add;
+
+	ret =3D sdhci_add_host(host);
+	if (ret)
+		goto err_sdhci_add;
+
+	return 0;
+
+err_sdhci_add:
+	sdhci_pltfm_free(pdev);
+	return ret;
+}
+
+static int sdhci_aspeed_remove(struct platform_device *pdev)
+{
+	struct sdhci_host	*host =3D platform_get_drvdata(pdev);
+	int dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff)=
;
+
+	sdhci_remove_host(host, dead);
+	sdhci_pltfm_free(pdev);
+	return 0;
+}
+
+static const struct of_device_id sdhci_aspeed_of_match[] =3D {
+	{ .compatible =3D "aspeed,sdhci-ast2400", .data =3D &sdhci_aspeed_pdata=
 },
+	{ .compatible =3D "aspeed,sdhci-ast2500", .data =3D &sdhci_aspeed_pdata=
 },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sdhci_aspeed_of_match);
+
+static struct platform_driver sdhci_aspeed_driver =3D {
+	.driver		=3D {
+		.name	=3D "sdhci-aspeed",
+		.pm	=3D &sdhci_pltfm_pmops,
+		.of_match_table =3D sdhci_aspeed_of_match,
+	},
+	.probe		=3D sdhci_aspeed_probe,
+	.remove		=3D sdhci_aspeed_remove,
+};
+
+module_platform_driver(sdhci_aspeed_driver);
+
+MODULE_DESCRIPTION("Driver for the ASPEED SDHCI Controller");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_LICENSE("GPL v2");
--=20
2.7.4



--YFQqyS3v7ueg70GBLECw8p4Y6NWwePiIF--

--6IipvASjdGlCxwqnZjF9TbaNfzSmmdBxC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbU9AAoJEOiTWHtbdBeN/8oP/RGWplA+IOGhXYHsrcf/mIJP
bUlWcMoZdqe2WFoJfeY6BBr2HxWIURMHa5f/1cZM0ZUNXc/HFXrfnL062PUahBmI
6N0McMcjdbmIDkNZfnImrNYdGp5q1kEe8cQCLcb5SIAn1h6eR3+8r5QPIfmEyrRj
/wG9h0o2hdYQNIvna8Wu9WNOR0pxTJcIkEMJRQrDG43NVnJTU2hkF/XoOMopgnik
oQgKKDHLxFsSlA/KpClkR5DajzxatfWgzGKeAvacfmKvju0KA8C964RlXt1qH+iR
Hmh8KcOi+Gf/b492b4MKZw4LWkDnchy2QNDUlj9a45tSAIA0grwN8bO0T99FduyJ
JIWVxuBNFPHew5Edlu79icHQVfzur0s1wJ+W0jr1vS5Vk815M7ibl4QRklJfqoxw
neo9imvhRoJjwnPmOmOHGKxqrE8KUVOGA8wSppbZFwgDdBbzKBgIbM6fGIK6DaEH
IZl5jUTIoF/quqWMkNGKhXYJbSeRB+XHxFqSKv0nfQ0kbOKiP9TMAY0g5j7dFu+L
aGAH+ZCYIXlZu13zlOHbarWTnKGAy0fjO2lIrV/t1QQe0RTj3JxiB9IQureCcvcY
BTOeH7RLNC0M+szH6h6h+kXuIUsFCGbjxXl3YwBsLcdcxEKZhdLdwd2Jz+jkz0Vp
oxSHagtFAjKFtQsIT8Gs
=oWhe
-----END PGP SIGNATURE-----

--6IipvASjdGlCxwqnZjF9TbaNfzSmmdBxC--
