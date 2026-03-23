Return-Path: <openbmc+bounces-1705-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F01D58CC9
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 22:44:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgQ7b5sRCz2ynH;
	Wed, 25 Mar 2026 09:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774261089;
	cv=none; b=jK1RtzNIu8tZ+U2hs/Xl9AljVp0T9cmOCG5v0dZ4pRK+2SE+ejjmV0WLzt51nrDgTn+Dvx9AzNu72e3VXS/YwFwcMpK3Vz1zDZdO6nhsrX8dXEqQyh8g9C2ldzZko35aKaIDZB8+vomDbQOb+KF3FjN4eYbP5yKii7BAM8H00tvdJiJFAxe/Kcsky5rMqR/1oVAQN465/3IXVmWJkHNXuGupS2A/sKh5Es8FMCFsgXGGzD5d1Q4VnLgsDM9yoChye+IScMFpfTXPCiHXyHQs/Ir6KnvHpcrzlDGJKkTv7d3ARZvsVDIs7F9K+QUxHi7L8hOkSvahG4DIDH2vE3S9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774261089; c=relaxed/relaxed;
	bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpZQ0WWNIWo4P/OpYukx6CerzJcW0dVgoAM8E9Whi4o1lk7DndXkf8qyCLtLuwKk4ImQNsx0/ePUtuGN2tt+QgI40a3CDB5UC3aGD7Jhg/33cFmfPAdpXFv15hTpElQRrlLxZe9Q9t8gN+ERWh/bVpjrOB0cOEfx1oO2lH7d87blf6ribjzWUBF9ckpsUX3B6uWHW2knuUtxVzcfXMcfxg6E8DoSPbJqZWuvd+lRBZsatwJQnlZQRNw5uOndloyJzSehrjHzhL08YP2KL1Xv1+mxcg6M27Q6IVYadKrVXSMmDnIGaJvurtVE+xudkR8O0qORD34h8y6n/zoccioatQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2l/O1wE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2l/O1wE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffTdX28s4z2xly
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 21:18:07 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so9548b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261084; x=1774865884; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
        b=J2l/O1wEpMRi3KDpOd5j3F5vRHtQwaBYZLDJ8dUAgW33rj3Sy9nJsaATAY2Gd1olK9
         ioI40kUrbv7m/dMPAqlliE+rBax8qz/aG4PMAzTL1ayjbN0241nNogYx4+8X2RF7iQ2M
         qQR4iIGHGj14+WGV6BXZG++VGHKJ4lzGDlkokw0O2tM7Kgy+PxD3XlC/hZO4LThVpB0I
         gluPPd07msKU3/C4HET+SUOYlegylCUJkbYgJpgpSfNOHlq8VHUDSEsZeo2eBOe6wITk
         Q5oSFBq0EbPoea+By8eyCVCr7NWyIRVd2D7P6JjoCgrYLDW8hw5uQTY80SSuPWdIXJmC
         lmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261084; x=1774865884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
        b=HpaYimp2/+tEd0bk94XHc/p3S8nu2cLcL4FJswRwbW5Z9rKOlkoKoG0xw2pAt6M+qS
         TenhE/Y39cIn108vJTpM0JC0UQnDW2o7ilO3ppyCSbqvR2KPetJIfew/nFD8VqX3iL0j
         C62KC32d9N1rR/fIpNKwNv35l7AvJyvKHTkhRtRinKLbs+nq2g23DUX//Cre0Vqc3ptH
         1A0NaW2pq7bHkdSRDuiUMYd0SvHcO8LzssEyBYNUdS3qnS7QbEFfr1DSpc07EGHfNXzy
         PXk76zGwFx4RTp/Wgs9vWRMohAeSxKnqT4UUhdnjKLz3s90g8xBJ2ajrSKrIuNAb9tmF
         pwGw==
X-Forwarded-Encrypted: i=1; AJvYcCViC6VaVMRe/e5AApvGFaguFzx7k+3ZPAn5KggnAX84bGF8+ElXcG/kkcZ4MmH1WL/SdwqKcnWA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbbkqFJ+0TWMMD5YoZpm5t+3hVtclFOtITy+n/U6cSXJcRHeYX
	3b5sI5OtFaol/GCKn+AMGFBQQlGAibRYcsTpkeGEOn6g65GY0n5cDa9V
X-Gm-Gg: ATEYQzzb6Jz8zKCRtjUKC4hzIMrNZ1WrgIS4FtlJn2MBmw/L7dnAhOlkzkdEfvbofeA
	Y2k6hrtZGzOFcPvlbJ7dea2y4JaS2n25mEj3UoNbv9afS1LJ1Bybf4WHJzzOxdF3rLakt1BRIXL
	y+wyDC46o36S9bX9hneHghrC6my/Q8dR+8zTKr9jVHg6hRWlZrqzZigBW1ZaaCdGX0mPa6uX7Mk
	Ad2fXf2wrxfI9KpvfgrbAAJbvQbrK6GP05MrBpW+40W1vyl+IDHGCTEgARcogDh9flyvj0jcV3/
	gksAzMpi+bU1sHA4krsNEj7FdGUSqaGsRsAZypwJLXNRihcHrEVK4D+kvDZM/0enwDyTkPdlVOB
	yiDINndrgT362rpCk0St4T9l/BOJccCUiY8+UvpXWNxU4GyaOAV5RuYtNEinfHNIboOif4yfa00
	11FRJUmCIbhnXZaUtEEi0QAhPJEiqiCQMIlHL3BMtzgU607m5h5z8YRNY4Zq7gY2ObZ16DEvkKx
	MIEVhePAaXg
X-Received: by 2002:a05:6a00:2195:b0:823:3078:f684 with SMTP id d2e1a72fcca58-82a8c35d2bfmr9312586b3a.32.1774261084178;
        Mon, 23 Mar 2026 03:18:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:03 -0700 (PDT)
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
Subject: [PATCH net-next v15 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 23 Mar 2026 18:17:53 +0800
Message-ID: <20260323101756.81849-1-a0987203069@gmail.com>
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

v15:
  - Return error correctly in probe function.

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


