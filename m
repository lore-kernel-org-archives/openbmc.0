Return-Path: <openbmc+bounces-1299-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90541D73E87
	for <openbmc@archiver.kernel.org>; Thu, 29 Jan 2026 22:26:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2DJQ5nW1z309N;
	Fri, 30 Jan 2026 09:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769665498;
	cv=none; b=QcZoOKjzTK15/ngFnP+oF/vDMYydwhWzxgVmRfg5PbBU2rxcNyBIPcYcLUR2ISojLRcQVxwWV0dlp5tXH3ISuY32JtX6d97wQ4EhlzOrE1vtbCJQk7cV7Xefs1DGuiTze5hgadPoBZhifI+RZAX8y/zpR1QdpfUE4cezGr6C2U5V0O3wDNc4Xjm8noh77HvhZ74aLTyERCjLKGlr5BDTUYur3umqF65x5Z9SdO2yhsavR3/oJLQXjy/187+WWi5ghesJBGA16ewz1GaK8nNuKB3x3llYI9myzYc4I6WfsCu83fy2027Ba3+uDhR+VmJYsAw6MAcyWqEs4xQTTg6hEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769665498; c=relaxed/relaxed;
	bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4ZIGoRVEHMUHLLv9tWWDgNg7xSwhOdnwB15MmBaCq6eMoD+yw314zk6iZX2PHAVA74KZI3ZK7qPUYwHScQQJMLQl7BRjhEoEKPx0l+YUnbYTngUEmlBDk92szc19bbmTtLu/z4s15QefEUeg1QocEDmlrseWqJJFi7ifv+4bvB2Q41qTKYBAN04/jC2x5t+n3PPf5qgg+eBGndiKbdnTlPstdY/TqUC3OowQVrXZbIIOWR0AcoPPF+NFuZpXDljKKxusi6o42XX+55LX9+YYe0pBZe8oWosLtyL7Dv2ErqwUZTtAzYRExtlb1x2doqE4rG3nMiIQE0FVqhBW41IkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hexEo+q2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hexEo+q2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1p4m5cZXz2xKh
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 16:44:56 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8230c839409so528827b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 Jan 2026 21:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665493; x=1770270293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
        b=hexEo+q2+GAvfvkz4fuA2Kea1dcNFHaYGi7T2IHPvOckMzau3Ky+DhivswkJlWhRas
         69HKOAzNHi04n20iR2q652sMo+EzG+7VzdAipTiotG0gtTLnamJk81+AayBPCpb6Mety
         B6dW340FIAU8o8JwsgxQgc0ecDy7xE+So81lT5EiV0aPdjPAHJC3WsskcSVzX0xyULSe
         N85y8WIQm9TVY1GAFZAzV+p+rC1f0oth6NURa251hNTUAGXFLmot1fpBIkfcI2cvUXOX
         EsL0wZU66gO7wmqhlb3wDCZX0etoLLlmIX2N02V2wy4LW+wES35XwA3IhkFDL4ex+vfm
         JrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665493; x=1770270293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
        b=Gi1W3NfeJRJvX9d09L2gRSq5OTlahsz+HL3m2IryrNbJINS25BmQ8iPFQzP3bpLeud
         dAnJmI362acIELfD8D0Q0rlzEUvody5aKPkBFGTDu2HDiFnnY8c5Je7GMqjOsS6nr5WW
         VRKPAJHxL5T1VH6mPp2gxMBHkJMxum98RNuyfe2OCQc2Bdv2Fz4RPbam6ZyuJhXwk8qC
         xxj1wVePpgFT/zuta7skkuCUmpFWykzQsqbkVVNLbEtEyHaFB/Fx0CTnkGdCjvmZ3JzA
         bNMdLCIYrib3MMqb5bNXg393BC5WoIdp/glYd5MHwouV1HeWfaktofiwByXrdQt7WNdf
         cuEw==
X-Forwarded-Encrypted: i=1; AJvYcCV1BHli/Zy+mYPvXnQJuSeK6vLgqInBaW2XwqQ1yPrcGpFCDrkY2klnaSeClyG/drxL4OCrdOjk@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqprcU5wjbVmMOu6w/mUwCU6/oDN8aQQrsC5kqLxemjxoM031Q
	/hBQauL3ZUdOF2HnXFK+VKq2uW66HoKaXd1BzSJtxyFfpqj6YnQrXSrG
X-Gm-Gg: AZuq6aJsrAgzPENTFzVG1PRevsRfaIDLGH13CGkZzYbhCRx1wDFwOY1Ns1dX9bdJiYm
	X+heHXmxOc2XNU9T1175gEdNr5GxPMy50WI3gjnTTxGO5ktzUmTDrLtA6cAntJd/w1svJrxrBM0
	DXo+WZnLQ40DmWpY87NAp8bRQx+9SUNZ0DHraCavIhr8jCdxE+Pu6a1rKBIiAww4DY4rOJkg7W7
	gvCIsA+ALr9N1tmQdzBKTD+RSwQ7mRdB+hYEJREKSfWLecNdBW/iblg2XbOcL6EjBqKBp4BcJ0o
	6DaxWpPZCZnTstYth/Jr92NgY26eBELAV0DCl1fT5QO5R1caBZnSzp/O4vS/PQcLI7zI+0DO4bs
	RQ7YoS48i5JV3adrMPVxlQsusA++AdKe5YUdNUJDjT+TdH+ia2t/JWKWm3ZeAkB+w30d1YciA6k
	dwCI3GA0SB9ho3+NTkzM7EfGUv9IkOM4xNh2YQyd8cfxPEHuds+vX+sW3RTcCCClg5Nhzx3K7s
X-Received: by 2002:a05:6a00:1ca9:b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-82369173829mr7391460b3a.12.1769665492885;
        Wed, 28 Jan 2026 21:44:52 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:44:52 -0800 (PST)
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
Subject: [PATCH net-next v10 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Thu, 29 Jan 2026 13:44:42 +0800
Message-ID: <20260129054445.416242-1-a0987203069@gmail.com>
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  44 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


