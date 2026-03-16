Return-Path: <openbmc+bounces-1540-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A60FB5E85
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 22:56:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZVnb4FcYz2yhG;
	Tue, 17 Mar 2026 09:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773640489;
	cv=none; b=DsRSbkTPJk/TTU6YUMm5WVPA0VsUhOq0bP9cd38RCz6LYgEuq/PLkzWPdWfPtggEGjiOAsXrHhF9Hf0pr3idl/UeVWtUgZDtiGyP4NstO2/L3b2WUGYlSJaKe/nqbkEGXMrpWvwWJE0pOxahjLVesxhQtmItWVqxTKOjb6xgZkFcKBG3tHF7VUvDpeXruXwfxF08MrjuPZYsGlK8tXT8PC+feQK/kaIHDHOCgdnNDM1q4yF3CWeGLawZ8bv09CfHVreXktz45Ryk+EKsCZHLkRV8v6GrTGUBvW7gKMw3BUOmZrggschYCD6Wr2z9s/XO7cNAlxwdn4MxXpGMcK4gew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773640489; c=relaxed/relaxed;
	bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n84ibyD0ni/4rMO63wdFS3+u/3ZlaE8lwTGV64iy8M5UNRxIG9l4mPmdmRIQXB3q7yA1sN/PkRI4Lna5HCtsjjKT3ekL1gY57cBZSDj924D5FBkz6E3Y2gQcAvwgOD+si8F+qvqel/J9OLi7ZnUdVBnmsKJx7heYYgCm/E0lg5xaCbsqjD7eltIANiM13C249UqvZKvlpnuvpsQonP5Ux/uQWeBYbNPZ7ZV6omgs5KWUl/GRTwv5ID0xknSo3vAJSWRFNu7oTC6Rpz8ESQAFqPUTC/DqMEkU3+afVPOznFtM2z5/l8RSJSBfes4UwZHY+6ZIPwjHgyrcuRxr8RD/mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNa9gqBG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNa9gqBG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ46w57cSz2xlP
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:54:48 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35b9ed7a329so314236a91.2
        for <openbmc@lists.ozlabs.org>; Sun, 15 Mar 2026 22:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640487; x=1774245287; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
        b=TNa9gqBGnFp0wHRAXFBef1AAmFJs/G8rnDoZRZGUEPVAqUJFUpnRB5j/PzXE0V/H7p
         yRXuVbjWNGoGdnTuoD3I+Ezkf48bF2KdPpPS4TkBA/io5HnbP1bb9dOW6IKYQN8eJLe3
         jArd801AcdFCXH+iFGRNKaORzbYrBbA48LNSdu1qeEoyC5ekT6tgSRTQgYIISP9UUVcb
         aoH1H6MFLLJFxSSnvW69kgs52fUuiMfhlKyUC3/Z+UUGGwZG1Az4YIjXhwl0xeAaPCs1
         wOX3EXIWvZNY+yuyrpazWx/BJH11GZnl7sTg23HxlV1CgCbVi5f9qhvuth9Xvy6q4PTg
         tIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640487; x=1774245287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSV+AC8eWTk36V/fHXUoLjLGPO33bJQuNND71Ov3wWs=;
        b=mrj3u4Dv4RZfIdY+uf7v9iMFXO5DF85NOL37/AUqcsEh3tc0x69OviwqGIfXXObNZG
         KyTGbvHEEoJzm9LclVFt/xh/ui7g5ZJnSkOl1E3UlCC/FKO/3EmBQuyM2Kwe93j/ujkG
         pjJQkhI1uF6kSWtGLNPubwCysD49WpfbucSJtK30koO1YrI1VcBSoFpqjTG0Gan+BRl+
         2HVJP2njYruiTYFO/hFVLuSm9yBPDAC9oORgxgjhh8tu5kTOoXe7g8rmPbzPM3iY06Qx
         Ak/pQ0Skg+YRyNbDEg3BLLkR5E/Vv6+AmPA8Nh4ScLNdeZgDSo/Z1nTw9F/WctcPjT8o
         /xFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX14+Bjqgz1zP30pkEAyYYjaYkCuXfDdKkFtSWAbn7ATvzp9To4xMwA9+N7I4lR/KrLr7SbPm8t@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJ/ptkrkviSHIRKrucb66KNQRJrnez4mo7SZk1BVhEXLNdC7OO
	sM9P8ZK5ta1kVX6Wc3iJsMo8fjrEiYlLGWLhaO/VsoXhp4F198TxqDZE
X-Gm-Gg: ATEYQzw+9hyOTITnw8KmfcGFF9Km0c998eValpO1nIjL64K1Fe+NuHjxM4HQ/KJ1sXh
	l64lPXzkgJUrTzXO/pdnt3+ZekGIfI1p+RetrzQFz46lGJmtU0M5dQ8hZi0UZC7xVyfTTRHzFfy
	vpmbRPzK7D32eMwOZt9VWpZfSmorHB+RvU7crjKPJOeuBE/sYqSbJQqCGJa5k8PZfjrRnTly7zL
	3cBnLuhJdxbyBTVntmBPz3h52yV5/Pm6Aak//52kJqzE8KhvX6F/n8zE4hn4ErBZyB6oPxP/cCm
	5JiA3ki5QS/8ZGNPynh8Ol11sFurpvl8UrIKEHGfqIUks7xRAJSG5VyJH4/bMT+ofs/v47rdG57
	KVp7WoWL4SiKi1tejirZjU2k2yP279JT2vBw2EJB74mdBniClNcnNajaGERtDRdDCVvNjOzfU9X
	S7YCWd58vvteGbDL4h7PRd+L6g+k9OYw19Z3HK+8jSaXShExBgvSgxroKlxQfEZZ0aRuKwYCFRj
	6zQStsF02H/
X-Received: by 2002:a17:90b:3dcd:b0:35b:9e73:7067 with SMTP id 98e67ed59e1d1-35b9e73720dmr1953920a91.0.1773640486786;
        Sun, 15 Mar 2026 22:54:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:46 -0700 (PDT)
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
Subject: [PATCH net-next v14 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon, 16 Mar 2026 13:54:27 +0800
Message-ID: <20260316055427.1310569-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316055427.1310569-1-a0987203069@gmail.com>
References: <20260316055427.1310569-1-a0987203069@gmail.com>
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
index 07088d03dbab..861f1c6c14f1 100644
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
index c9263987ef8d..4ade030b634f 100644
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
index 000000000000..80f1d7419d46
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
+		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
+
+	if (priv->macid > 1)
+		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
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


