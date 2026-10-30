Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04999606A31D
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2026 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=whl3VIpa
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jGDLS35q0z30VM;
	Fri, 30 Oct 2026 19:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793347839;
	cv=pass; b=OmfQ0ZPh6FuuNXmueFjum4dN0fMoPVdhOyVo7QIS2qsVuA3Ma2sMHipXg+NMEU1x0P1v/6IMyyvsQ7miDK/rD2czgSH3iC3wx1jM0UCvD0HGAIRcAwT0VRDPfb0oRAbPyRHZfXpFf3lzl35EOi5HK+zMYmbi4GvM48gpm84INMGFHhiOSqGL+MOg5aWvMQY2hw/9/bQo+HWmCUn21+gE3z9ITnja/LpQ1HnyWw07dMK0pnKpKESiHaKrTl9wFtVg9d6njeekiut+FuiNv7CEgk89LOWJj3D4zxr6w9RoJpntDtX4Bhj75LgHFR5fJaxiHwEYwZEOcCs5ZO5snpDL8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793347839; c=relaxed/relaxed;
	bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3vlhKCg1s57ey8cf4MLqnld5RSiQyp/MF3tSgIBP4bL8+ztdbQntOLUWBkssRrngZgdAiWtWZc90eIx/rgUHbDH9BY1vj2zY/H8Mtwnfkm0jHyR60ENF42gLIBmvqZuWOQaSyyxRxDRr8+KKQTDycrXDg+eFPGy7OAoN5etPKcmep6kbaa3Wf/v3UM36tM8IhDOlvAKyYZyY8TPx8D0nhqptgtpIzq5VdBsESTEUjQYtYfIxTgR4TlfNZWDwqjnALnjqYTjQXLkmbURqpU29gQCvo+LUrJ6K1syzb3ncF1ETGS1c/PPyEKF7NCzY4NivMYHi1kCY34IAhEVqMp/EQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=whl3VIpa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=whl3VIpa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jGDLN4txHz2xln
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 19:10:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMnMF5exeyp50PD+V6kBgvOT64v7+xHtGHGE2REPasqHkTAmdPUnI55mu8M+z8UAdPkAtKnYom6UBABfd5iTqB1g4HqB5d77SlbnDmw+7H8o1zMyhc5VmLGfxE9Di6LdmI9QSUP8o8pe+PfnwqX+yQ9qwH0c+OzIrQEBtubMr4tn9w2m5Tewv+uvt+ceopwn36bDveSFn4zqHJLkNO6GNGk+DXQ7Sodfxu1EgpFQVYhkelVoi+PMZQS62+EHkKpynzE8PUqx9ITMhYypPhQiurYmHwM7mDH/IfvMRtYtkeqpAUgnLBatyoFgvMahvpU6/P/3ILhhifG76XGwTJjxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=;
 b=ZtTEUiSKrF309iS8QXEVD2JMfE5A/cRuznO7mzLVnZIScojog64A++g/Dl3dO4IpLVGkx8LOZf8nLRddLVDJWVLi+zql3ft9VdEuebo38EDJOu9kH2FWHRNgUtT6cJw1LMZagyQqMVv6zMqttGrpfyZyPAl+s+fX3JhpAFzhdYDs+nQNdgCD99JUoHIeUtjkFBNsdBjbWmatvtlRDxBH2yMUhY2rkzbg6EZbrp4pGEUXdaQiIjPjP3feg15H9l65IwdId2J92UHTkh53oyOto7ZwabJK8kBmVkCB1SKwJbAVi6Q5Lu2WI7zVV8ApMIpXkUhBS1B5eqrFaLbReG3nAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=;
 b=whl3VIpaa/8T1EiAgrtjIIyDQa3STrfEvrsnJFCpz/jt0WcoMlVTZ/rpyTxC51pFqvt4Q/ibaoCmC9y4L9gDKKeLBEO/pAsmI8iEeiASI7DywcPLjDibsKp40uDXPuiObcdtoI2qWXtfJztHiRaqKZICMw8RVNUbGlQjR5ilTj9XMTrNvcLDkLrrqhhzXO6JCLwi3U8ee4IZ42LIFFBVaWWNqgPuBNyJ9DXJwYDDfWHYgLISFFrGv4LEPkWkRqQefkphMfFcuidmhpoq7fRLAHzppu3Mehf/D+ZULaYn1sBid9bJf+EKoOC+LzgHyjYqzRLA48niMz9Ccw8FLE65Tg==
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by BL1PR18MB4213.namprd18.prod.outlook.com (2603:10b6:208:309::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 08:10:16 +0000
Received: from CH01EPF000BE943.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::30) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 08:10:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH01EPF000BE943.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 08:10:15 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 18B234186B58;
	Fri, 30 Oct 2026 01:10:14 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Fri, 30 Oct 2026 01:10:09 -0700
Subject: [PATCH v4 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793347814; l=3567;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=bEliB/uHqZMvmN73vNuz0Gy/A4MeC70lyvrvuvaleto=;
 b=tC1nNSb+c+8CgAWnE1VSC255NWYiKP1cdBe9qejIDwBTSvabh2jWh/+FtZyyq2nawtUqf6eTZ
 dfiGD+BfuOEBxcspccvCRBxmMyn8QJf8QfI5Y3DjFK9aoRC3Nz5HvDP
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE943:EE_|BL1PR18MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb78cb0-b5ca-4b8b-eb80-08df365d3b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|34020700016|376014|7416014|23010399003|10067099003|5023799004|3023799007|6133799003|261028144727099003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|56012099006|261026140227099003|261026121527099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HGzsKL2EAo5oEl2/3b8AD+zlyvsw9/1aCitW8TfcDrnKm3MYkG9rfnoT1h8ArSTTJhXAexoMwimuqahdieoSKx5UU2F3S+vJD78MwRP2LnESoWq8ECuWkSP3t9lgdOO0MnUw5NUr+IZSFNxWzdFMQS55XtO3K+LWCtoz5GaJjiohw/4uQE9+L5a3nZZ0WxXuauNJmBfBukQ85sN2qpfa+NuFgDKVlRoXxZJNa7qKlEK0CMy14uBDb0aA/MAMV2S/ywubFq9hxlR1tLgbZlKPuXNAk5RAM4ydbGnh2zvBAQQ7XCr0/s+nn+zonpIrmjxxU9CrZwJOnDj41i4f0KVx9ImSqX0MKi89JH0aljtwjHebi0pH0DqdSRzuWBvl5XDp1eRlWq15ck0O76NegIMX/kTaaisG84qy02LeEQpD1g+xKt+XosKBxOgODbrgdXaBXGAQsy6KP4zSvXB01kyYNJ3+25dqLFDAqhERDZHYlx7Sl8FVUA1IdQHzdOWVv6THJsYtVtGbF2AIeQgEaST42At3vBupNNysQ/eH4889fBNEetrhcHjQsTEToVuS1o8sDaQAeKJqNFXyFLDvcRHXnM2/guIuFL5LZ20TmdSOjGLIJ04VaMHX8mfPY8P7jhZVoT8AcIHUo9sEn0vQOkSw9Q==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(34020700016)(376014)(7416014)(23010399003)(10067099003)(5023799004)(3023799007)(6133799003)(261028144727099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(56012099006)(261026140227099003)(261026121527099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lKYYWR2zriBMxMPXsK/ldfkplLbk/yKzlQUSZDDSryxaAl3fNuvJt2fdh8emQUvFrTeuTkCK2MhX2Ua1o54/1p80FBo1XlFkFHu6AhvScRpLe1/2krgoloR/Ab9f0KxKos/pTWglZVVUiCLcK6zJImTXkHKHaoee+rUJwDdVcd0rLBJ3DxpTryAxnxyBvBMTy0chKInIsKHAHPN/Iv+qHavRbAxT5hKyIZGSUz4P5jwgmFn79roKPTQFkFtbVAvk+IPnw7uhP2EYpZAuj7Qlh/A9HLs4C0CUrYDO+jh3m4gHUhRWNKn6pQOdMxTXV3h1wloEJeq4NeS533LgDK96vjFJYVbIsnrQth7Cqi4cNFHLfJtf1DUiqe9bdcbfKdvtko8HRLLfK4vpPfHRTy6L/x3VEmfO3cXPhGK588N/NijjBedeeKRlbvfGi8/gx0qK
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:10:15.8998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb78cb0-b5ca-4b8b-eb80-08df365d3b2e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR18MB4213
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Devicetree binding for the USB device controller integrated into
the Axiado AX3000 and AX3005 SoCs.

The controller is based on a Corigine USB 3.1 IP core that is
dual-role capable (device and host), used here in device role. It
provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
supports control, bulk, interrupt, and isochronous transfer types
across multiple configurable endpoints.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..b9f7f4879ee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 USB Device Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado USB dual-role controller based on the Corigine USB 3.1 IP core.
+  Supports USB 3.1 SuperSpeed and USB 2.0 High-Speed device operation
+  with control, bulk, interrupt, and isochronous transfers.
+
+allOf:
+  - $ref: usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-udc
+      - items:
+          - const: axiado,ax3005-udc
+          - const: axiado,ax3000-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&reset 0>;
+            phys = <&usb_phy>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..58c5c8e00870 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4508,6 +4508,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
 F:	drivers/spi/spi-axiado.c
 F:	drivers/spi/spi-axiado.h
 
+AXIADO USB UDC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


