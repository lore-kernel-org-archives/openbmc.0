Return-Path: <openbmc+bounces-1277-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0BDD19520
	for <openbmc@archiver.kernel.org>; Mon, 26 Jan 2026 22:56:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0P6J5fvZz309N;
	Tue, 27 Jan 2026 09:56:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769422991;
	cv=none; b=R+/SqNPQfP5ccoldhngAfxupkUS7oCv+My1ayMOKi+A2npYbHHhli0gaiiHmDYOksPKAKWkXl1WlI6Br8p8MpFJ9p0tZflg98EpEKm9M4Rqy0xbRr+6NC8rcELZpUk5SPpvEm90sDOVhgO2++r3Bw90lqTYDR5e3f61Hs5mBJnnR6PNqJ0hoh4eYA5WzGyiPRsPkyF65PSZS5BfeY9uJw0FuFXJA9iQvf3TR9iOCLaOCrSInoOzdsEB9Ime0Ymn1MLSRToOt1lOotm/Y3y9BpxTiLUK2BqHlsgPur4hFhdJCsLhPZTAJU7R7/K9ScpIFEIea2ZehyBH2vTa+tZJLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769422991; c=relaxed/relaxed;
	bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHQRRll8lj8NV5aW7ELYo4bsUEk2NjmS6BK0a4MGnoFsSMz9X0T+Md7A++N+H/bCY7bM+okqNc8QapcSVgermaCzVMkUe9IPdU+JU9R7khI4YfFDSNKj/e7+uJIvvipTgcKHCoYV9UgLaerFuOM+N7Ne3IIVgrCUgwpmFZoaAS6DnpCBHS6aPzMKlWItZmlmR78HbJQ1oAqP8/o5Y37JSNbLaSrxaLJdMpbxDCXYPFto8k0ZrgsnQUtBeKkJSbi4Dl1RQ44ydu0nsSXlZfLNinl36TahvnXIfQlCO9pRGDV3gpf6xnZdq3XrTE8K67rSYZRJeLM7hAKcxQtFrZTbDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UeNv1xu/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UeNv1xu/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f04P94QTMz2xpk
	for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 21:23:08 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8230c839409so3332978b3a.3
        for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 02:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422985; x=1770027785; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=;
        b=UeNv1xu/wwl+XWqGbD+/hFhNCVZ9lfj1AXGfBUqYLEH09KjzkA4vMPSTvJSzq5lyz/
         /mHE+xSevapUSA8ViqYHqSEw4iNVdBxjZCwAs9tQJ/3Nn/Ps3kcEYooa95upKHVTU8B/
         VWbxhOvLpvBSRWdaJqA4xW7vKhp/tfTYSRC4n0L6d/J0fxHulWXUuBmoCXCOMRrbXRud
         PKa1bqHGsFMFC/4MNjq/DF4eBsjyTHHEjPcdmxj7mA16vmvFlj5pIBFpmU4cnpmio+Qy
         44xHpS/HuKqQoQ8uiZPS4ukyQRa6WGbWfFYGjl0MZFidPfhSU2/5jrlktFksyVCgt01l
         6kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422985; x=1770027785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=;
        b=m8ByGUKcyFq2EXVMIqUT5zzTXaeoGhH3xRYLF2mBlojLYAdANynlLz/+P243RwOo9y
         MyeQ1aEkr3g8ls+Rc4aAIPqfm0cBuc1Me8NG4HUS3vLTj4qfG8Ybd0TN3uXwzMRubNO6
         S8MuV40HWjMNno9JYvnMrMO4p16G0gD2VgDLRd1flsqtdUM2cR1Kyz9XnwhYpwQaQLFU
         +QYjlmEuRFgo6frTwAYvHa/cKdkGpkfOaFBQUD4OS5AObRfVIAxc9F0WTnc7dw+TUEaO
         8f601I2hjJheh45lu9EWwLVM10/9RmBr+P9O/YegmRWxgTA+T6/kEiJXrgECfeNtsutP
         wDtw==
X-Forwarded-Encrypted: i=1; AJvYcCW/+GzxeotrprYB+WPo7+SEPdwLCqNHVR9Wc2FQabxMXpgrQz5lxWsVXgmVHwwTzPXcfqt8m20T@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwwwfON3aBw2MpBXlGer4ygKnV1dPZQMY569OlhHatG2gP7jnl
	DZjnbM3PvSd1t6fwAnIk2PN2c56jYF3Uzsy7B1/rgB96IozaFaAdBGg3
X-Gm-Gg: AZuq6aJE+zVWt87yNGgkpMR2Ju3Y/+n9WIOubADidis/usgEPpb/MbXOlEawPxuIubx
	F/PspFmjehf0mhkUWX9Q2ZWEGw+hSKN1PZcpBKQspNVSeGOU58Y5dAjQH+LNDNm6xOLRCPGlKuI
	XMn6jr6Aq0T7EZDE3sdLWLCeylDKgcUKjKhmwIAChN90cYMAs5LjlMFBDWAO6UdtdfAlAZjrkHG
	8kFpQA2zF3zexjmrgALm0wlJY9fUJi5aNmgneNsj6tHGzyqmfUakkwJWWgGNTxFWG0DSvc97te4
	F0yD8ZESo1crKI1P4fLKw3DtVoSBg2F2ZDYew1+mSn+cys7WXWdhHw8XoFu+k+pTEDN5wj2rzkN
	dXgPvhMN7XAA3GyWXMDg8aOvxTwNUXoBImHJRu5oC43jT00S/TFcSuQsLFHuF9rLTLRh1dZvUww
	hv5b29ounnfgX8fGkM7IbVfDjk21TCTkp5fe45rBMtKxh8TjByq4rjyA8mekMb0SSKZyOJrCxK
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3644339637.13.1769422984868;
        Mon, 26 Jan 2026 02:23:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:04 -0800 (PST)
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
Subject: [PATCH net-next v9 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 26 Jan 2026 18:22:54 +0800
Message-ID: <20260126102257.2619862-1-a0987203069@gmail.com>
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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  33 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  32 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  32 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


