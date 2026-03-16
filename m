Return-Path: <openbmc+bounces-1539-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86906FB5E84
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 22:48:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZVcK1jPwz2yhv;
	Tue, 17 Mar 2026 09:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773640479;
	cv=none; b=JbX/smnjCUgEMeM96+En+cGL0cvIfbNxdALDzqAzZVQ2BUnA5+fPMbp3MOP/hy5yvk0VMXIWDLnRHJ0yfGYt1cBXl65OWRZKHb77qsb+FmCvHEozlR7ydkwqWDkqig0xHGvkpAOa6YlIxiuqEgpgLAoIIp0moDngRSuUUscOYzZ3xzmuNJqIFgUJnOg4M+sIuHsmHi3Cd1hEHFw62hTYBNrs0N9hdR5Wa9G8CPbRy5LnKWqE72MT0BwjKs5Ir72Km/o+kgQitU7yAx5JwB6eSz40jY24MKLZVWmL3wxVvuzYV1GboHzv+ONSw7INZpXKvgPn2hKDbBpmRUCBEN8VEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773640479; c=relaxed/relaxed;
	bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ck6zlI9K+5lOdL6TJxCHUdvjAYq/EuCtRK+3xB3tpOIwBMdHVG39r1vCjkKxBycFQYM3Otmweg7KOD5CZKcgIgqL7ikjHSRGN9tIr2m/fX2ReZzFZkt5FBx3I/D3Vqv0AoKuWbDVPzyLavGroZB2uZ5A2CUcQPwXI9z1ReOxYuZ8mAkeSkuK2VKLQGrq3Zsds5T4bWns1/NTi0d4TQXra3gxEW+1ZP6/qn70QNziEQN5bJBjNfKfPziP6nHA6bA8tGwHe/eNFj3fWwLXzuoIyQBitvs+psEB9CvzOT1VnvFwwuw+w3MyRV7IGdv4IWUaKtsEx7Vveme7m5IVZsHkZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XP8dAlN4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XP8dAlN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ46j4PXBz2xlP
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:54:37 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so247577a91.2
        for <openbmc@lists.ozlabs.org>; Sun, 15 Mar 2026 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640475; x=1774245275; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=;
        b=XP8dAlN4Md05vUtL2rkJxF7LPQNdKb3gxfjtQ5SEDcIAXJ5L3t33FADs6ZvyzBdtQr
         YxKGgzDeOcJlHvo65LQo587XDOYmtqpZL828+3RYNopFxgSwY5yICDELbKvpsQJ0ddvb
         MpPNqlIvQ+R1YyMn4roidU/5XU2VF/CFkzP+VitDagth5ZU2F3SBFXfQysRpWP5BNECq
         FP6zEV8tDXts01JdhAPFnd3HVOGBHnpNXP9r1FXK8r9PD5+H59H1MEggOJrCuLjYcxlM
         4wdnom6VkQaWQOFMqCc1XaZMyUFQDW82Ibt4Bp3QKvC+VYQbuJhOuUS/6vYG8m6oK4Lw
         QDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640475; x=1774245275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=;
        b=IyAEJkR0dkCfo1BH+c5XeBHyHK5IAYqCuDvMPTBVTyA7oK6yJaPY8ThVi1y+I4bOps
         RUVtG4305l0/UZw18+/GUapxEjSiNBtB4OHfXG9PzaEsDYvGmr9GA15WAxvjodNnZPnf
         1xr64DnFQSQZaxfZlLdVSkp/sMyuWVLRUhFrLjgE4baiSo0jXD3i0ZRsOhvqRa6mMpA6
         NH0uw9/0T9r1mEFhBspxBf8Uuu1OxiIiuF+w4qfNWqtFGSCOtbrY/xSV3KEVMJas8WkG
         2LQkfa8qwto3/chlUqSIi3SaEE9JdrazhS6StDioMbgEl0hJ8TlsXiNYKeNQKr+u4NHl
         DEnw==
X-Forwarded-Encrypted: i=1; AJvYcCU4T5p+EjhEGu+G2W3KGNDxnqevyadDAipG0h+QemlrrlXBbk2dWu7l5s3SG3aYGMnG4ax1spvM@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy26jTZLUSZ9ufHVJt45gz44qgVZinHLSpYl5UdWmzxO8gssg4o
	2awe/vUS0KyPmhP/PdcEw0ILzkN34HoYm+UZ9HA53mzLzZQJtrLZr/vb
X-Gm-Gg: ATEYQzzNkMSnfViTMMOfI0xCBe2l+D6hFPBgyFHbpy/gl/ju23Qm5yE348chU2EVoOd
	QKs+ZLYJhmGnX7PHvPhvv25wa+CVKF7wPqCkxrZXSksAH/y7nkySvSlev2CABKyS95lfcIaRUZM
	VTpAhBZjhFgcNjk6tUtd0D/B5NdGjJNMzKH1EgfUdKlTGoKPmEct0aJJ1sxhVVSmMWMqdtL8I0p
	/6Nyj4Ocvy/sc0SljJ3QY1UJ3Ac4YoasDfhm1fJYp0TIciQnFSpbsaaipzJNYKi0AhhAB7iR+Bs
	Bq27dFPw47/XKC8mphqDKRKpxb3p9YG/E129hHEjcQi15o+J/VaFk2UP1JBWrheUOLfQP0n9L6O
	03eG9C1a0UoDPkTmhab07u30V348EITGd61vF+Kd9Ll3j1SBsORIJfW4kL30Kfvst5KDImJ8njv
	YXeVl7vKNNjtvXelj/de1/TOtGpqoCX+N9X3qRKfHE8PEez792UwxxuOy4XQs0hdXLQ2eIHUxew
	tw+Zg9WiTJn
X-Received: by 2002:a17:90a:d88b:b0:359:fd9a:c513 with SMTP id 98e67ed59e1d1-35a220a8903mr10935535a91.24.1773640475194;
        Sun, 15 Mar 2026 22:54:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:34 -0700 (PDT)
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
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v14 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 16 Mar 2026 13:54:24 +0800
Message-ID: <20260316055427.1310569-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v14:
  - Fixed dt_binding_check compilation errors in the YAML file.

v13:
  - Fixed YAML with dt_binding_check
  - Added callback for plat_dat->phy_interface
  - Updated PHY-related setting helper function
  - Renamed registers and values to avoid misleading names

v12:
  - Drop private structure nvt_priv_data
  - Fix error propagation to preserve probe deferral
  - Refactor internal delay handling into a dedicated helper
  - Move FIFO and filter configuration from driver to Device Tree
  - Update DT binding to include "snps,dwmac-3.70a" compatible

v11:
  - Propagate syscon lookup errors to allow proper probe deferral.

v10:
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

v9:
  - Fixed file permissions. (YAML, driver, DTS)
  - Moved phy-handle and PHY-related properties from SoC dtsi to board dts.

v8:
  Changes since v7:
  - Rebased onto the latest net-next.
  - Removed unused symbol.
  - stmmac parent driver now reads hardware features directly to support
    Wake-on-LAN via magic packet, so PMT-related overrides in this driver
    have been removed.
  - Update dwmac-nuvoton driver:
      - Update the license to GPL.
      - Improve the description in Kconfig.

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 +++++++++++++++++
 8 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


