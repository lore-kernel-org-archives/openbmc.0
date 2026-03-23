Return-Path: <openbmc+bounces-1709-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462FAE9A77E
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 22:52:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgQJT3WsRz2yr6;
	Wed, 25 Mar 2026 09:51:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774261099;
	cv=none; b=ECPgEPROn0OlB+xZSmEKczrECFH5YzyK0egp2OwoXe8j7oLLXl5zBMUbVQDZL67VM66DbtzBQAheb7ycZSxnYjPvGd7j+eaEcCPrrjXS5XtTGUQHFn9cSPJnlFreyhQy4AMYz4eAFd/fgbwFLFCHKUlo1IhtZF8fKi2qOXQGn/sh/d20VKPkFF8s2SUSwMQ4bQr09Cd3H1WtGcCvweeocqCUPc/t/ObgYL/7FwWUOPvgLg2nqoFTJwPuP+JXx1QyCeEAaXC9OC+gayeH/BvDL1qjj4t9IEwtf5iQihwN/q+aOFIsDqYHVTbH81Rsi3fXSaaKp0ksQBY32uYLyI+5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774261099; c=relaxed/relaxed;
	bh=EPbwlhrnVmSnNsmoWdfq7/dDDDS8CnPiI8sSHsNGG9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJ3+Se7yXfe2LlPoNPjO133LyDJTflIHayZ39U3fiYvhx9XJXUtQUUzjxVx03QIN3udIexVoC0EHqPyIRY897PATLvc0sHGCBL7IIyVRCDiUenAtq83wBKjg2t9ntXTr34eNWCAml2XSITBl/5/d1bP/N5pVva4CtxrSrk4bziqVtIJ4VVYazw6fW5nqDyrHStpQhwPZZNui3+jxxO9RQBbOuZKHAGyL13VSTJSYiMCdhp71oOzLt4/mnE5FTCetuy7+LHTyBFFQbQZovSgFICyFeZVAtgci0bVwoJgSMZLR18N1jnkM63Go3QVcWqnX++Q9xGJyVng9mhgoZzAZnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+4OdmBa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+4OdmBa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffTdk5RkJz2xBV
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 21:18:18 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-829afe24fb5so2007586b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261096; x=1774865896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPbwlhrnVmSnNsmoWdfq7/dDDDS8CnPiI8sSHsNGG9s=;
        b=m+4OdmBa28gg1Wn5O2GMQKbB2DoUr5BGBtxHlsa5FSA/KcQGlV/d3gQN+Zsz0J0PQ7
         /cP94EahegD2iSilh1/hFemJzCuslnYafntj/gVbTxQYmBExjbZgLvKn9vbcdsr3Ksjg
         6mVtCM5UtTnt3colU2KYykaIvtP85mjHzif+2ce1mUrAvxQSLuGABd5zUFkg4sdTeOcD
         gC1S0Opk2yWay/o0CxsmSgjp8vp27MdXPAJhj/njSx1GHLDKr5jKN0Y0ODgiSghuyRZJ
         Rbd+qYyet3PZ+85gwdMhD/sqKZDKIgmIUYrjMxZAjosNGpVC88LQIZc0nMdFCAltAscy
         /qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261096; x=1774865896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPbwlhrnVmSnNsmoWdfq7/dDDDS8CnPiI8sSHsNGG9s=;
        b=NbBZ9u8WZ2TyXg8SEgVFPcCQiLz+liG3WvL8O5CbIdXrBfhUD8LI8cyXSdQVH2DfF6
         5oefe9pMqo/gC57yUBFvhyXj9XDO0R6mFIyPxw+84dOxBf7EQZeEdnrMUSCxp3IY1V4Q
         d0GpTjcx5T1VOtxyg521tK9s1RSU8kqyw2djO5yE26Y1gO+PGlTc1llzpLZ+tGdGwLVe
         HtNR2uSllNMMTh4HkS06wW0vnil23bbNcCtsGRanPLbTcCp6v96Cdn71FbRgTuaJq0/D
         x/tsE8vTcmiepqqL3VIyS7HqXlmTU+5Hm+gq2M+nbCWFDJq0ueCMTNR2rpzJebmadjVH
         u36w==
X-Forwarded-Encrypted: i=1; AJvYcCXMyKwfqSKnoJOEqRNRCjt4DdJN3H/nwNAFkpfSg2rtUlyhhWgmaMczNT/vD85mIAKmzNbfthwO@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy++50DnPeWia11M7WiHgxO0I0mYIlUMMbmzxjhc20HO1tH1ULv
	Zv8c7DeASXaJzMRdL7gacPCyNtM8MuVP02RYZKrzLB2Q8qKSA4fTqYS4
X-Gm-Gg: ATEYQzyEF7x0K6q92KZopnp/Il5vkarc8ttiDYrf3ZrJeXDa21OrqSl+Mw3RkfjC+RT
	nChKizKGGxhrEBvdzxJOH+eq7VsqXuG8n2I4WFSD381e3f7cxVeFgfBA/Q1fnuLwK64rrZgqFuD
	zb67qxaq8W/TODghQjqzXitfPiFfCgnl4ns0drn2rts0fxnrwFG2XXD0WW83MnDgQ2PPov3TgR2
	bXVWw77Pr4t9/fX378v2DrwIpgMCHH7X/OMRoXpyWcBIpCw8wYMNlMMgcU+p5KJFs1S7iF/kcaE
	ck7Pw+bFJFYlqK3NhanGpxZbQFclAFTbsZlcxGsgizR5KeQB7a7D213HuE6SskQI2ok1VvoJpZF
	7LSGXm6XzrNaE9S+o4Powq+oDRbUPAY5HVXu/DEW/r2yrlGTvjL7rkKj8tgzkHCaUB+C3jNtsra
	JI4/g5+jvZfGoD8HKoNp6HAm1+hIf37I4eeaR7uO5/rNBLabOdIOz8wbzrqKUid8NbTxkRyR8mi
	ifduM6MP3+P
X-Received: by 2002:a05:6a00:21d3:b0:81a:857b:f944 with SMTP id d2e1a72fcca58-82a8c2a0946mr9629170b3a.26.1774261096384;
        Mon, 23 Mar 2026 03:18:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:16 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v15 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon, 23 Mar 2026 18:17:56 +0800
Message-ID: <20260323101756.81849-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 ++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index d3a6ab7383fc..c2cb530fd0a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -132,6 +132,18 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NUVOTON
+	tristate "Nuvoton MA35 dwmac support"
+	default ARCH_MA35
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for Ethernet controller on Nuvoton MA35 series SoC.
+
+	  This selects the Nuvoton MA35 series SoC glue layer support
+	  for the stmmac device driver. The nuvoton-dwmac driver is
+	  used for MA35 series SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 945c5354eced..a1cea2f57252 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..e2240b68ad98
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* Two thousand picoseconds are evenly mapped to a 4-bit field,
+ * resulting in each step being 2000/15 picoseconds.
+ */
+#define NVT_PATH_DELAY_STEP     134
+#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
+#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 macid;
+};
+
+static int nvt_gmac_get_delay(struct device *dev, const char *property)
+{
+	u32 arg;
+
+	if (of_property_read_u32(dev->of_node, property, &arg))
+		return 0;
+
+	if (arg > 2000)
+		return -EINVAL;
+
+	if (arg == 2000)
+		return 15;
+
+	return arg / NVT_PATH_DELAY_STEP;
+}
+
+static int nvt_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	struct nvt_priv_data *priv = bsp_priv;
+	u32 reg, val;
+	int ret;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
+		ret = nvt_gmac_get_delay(priv->dev, "rx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(priv->dev, "tx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+	} else if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		val = NVT_MISCR_RMII;
+	} else {
+		return -EINVAL;
+	}
+
+	reg = (priv->macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_update_bits(priv->regmap, reg,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, val);
+
+	return 0;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *priv;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
+
+	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
+							    1, &priv->macid);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
+
+	if (priv->macid > 1)
+		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	plat_dat->bsp_priv = priv;
+	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
+
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id nvt_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
+
+static struct platform_driver nvt_dwmac_driver = {
+	.probe  = nvt_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nvt_dwmac_match,
+	},
+};
+module_platform_driver(nvt_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.43.0


