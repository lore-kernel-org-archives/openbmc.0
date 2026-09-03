Return-Path: <openbmc+bounces-2533-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE7FC624D4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 07:10:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb9jD3DZMz2yrS;
	Thu, 03 Sep 2026 17:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788419424;
	cv=pass; b=Rzne6Z91seNPK82FH8BlYG0zoO9m98/e9Q2xcohVRq9VVz30Yatf2DSl26/JFi907lwhnTtW3T7hbOk83Qw32GJoWvNWT7XzhmZugwrt8MGF16ojWb19zrlrgMPhEzJ4o6XH0hdAG+lVGuw4NYVd/XBgvssqqAWN6kVl08709J9JYu6bYw8TxLsEvtmHRUWOkFrWg3DZd4LCiJMc5+YP6nfkztbarmLcIL8EUGQREJHbyr7Wdj3hf7XzLR6xIIBLHcI3mVbpmGPrIQqiAvZp7ct9CAPF1BzEIM5CtKaUOe8pjqbE47YJ/kgwdLuvq9qoUxPAIvwucctAj1I2xHDabg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788419424; c=relaxed/relaxed;
	bh=6ZaPr1CQdtZqyfIIzj+X103gHwF5PUHQYcbTvs6ZTo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtRUPwQOQBflmGlfwhIAQcGfBcpDQOWNJS47OArTrATLzDh5J5jdr6IXwa+PxyHwvcG++f+4miWaEnHrEuNh7CRZst9G+euT64v9IH4Va+3O9LJBMLsuq2dMWMj2GM43cykV2QdRDHGD4+pg3QqkMn8qC+4EBKo1ZLkhYBXm/A8OZblTghlgTrH1jsP/1GM3r6GmB4+fkVcAWCqcEKRDR+rH4x5s5w/tqj0f4Gr6agsj3gPE3WF+668Ao/pXODyntHEn7ovXYEAVJCdNs8A4FDIbhW7PtGteDtYMmN75JSnO4/11fM9Yo/kaKpKs7xFgrpQzudpW9mY8qI3sZa9D7w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Y961wMEF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Y961wMEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hb9j80XKsz2y2X
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 17:10:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9sHdYZBtKku7ApE7yzT1dLlVTFvbsNAxXltU8RtvAUWpRXaGptiIaBhb6+c25zI1KE5+D2c5+CTbNg5Qxk/QuzCQBqErN+q3dTsIqC68lPx7rO96gM53ptIcbkpdWuMlJIZ5LRFyVB3K8dMfZKvr8JWaTuTIRGH4cvmBa773K8zYhFtyLG2wKPdt/CP95ArIM5jsU9D7aquGslVU+nUfp9sIex4yoPULkisWV6AtfVmfirdfqbfauSKVhX6Zqwlc3ihFkR57XqUfJa/PRYc5igyiAdHitGgGGpYPmAcqS8BC8l4xWo798//sAKbpJsSmykUFj+u0OrVrdaRhlvtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZaPr1CQdtZqyfIIzj+X103gHwF5PUHQYcbTvs6ZTo4=;
 b=UyTAa32iDM1ZF19h/LFBiOgoOHlyEW/MQWFvgquuia9ELtt6YLwhgux4FRiN96i9LhsaJgOZ7aLfcMFgtv4ypzdcnN5m5+UkztDIMj1R9nfHm4zNsnh5gtJR2rzzIOD/ZwqIkk/13eIhtllH0T2IfD7wsN6djiXOJJWxvqVtENI6W7Uejl5U3hD2fLrKC2BF2qQB6Zy3AUa4roa/qXD+nnO9bKF7R1AZ33UkuW0lM14zXqsgCuiEW7UIGPo8hIGoqFF8kySPED1GK7waltjXJHRygaT1zJwsmySfxBqAZLajV+iPyu+PRK99Lu7TZdCpSKOWyIx9QHBE6ED+fA/boA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZaPr1CQdtZqyfIIzj+X103gHwF5PUHQYcbTvs6ZTo4=;
 b=Y961wMEF66bnFL0vKE9OWbO19zjqKfmxTnU4d8jKaS39YOA6sFXTHNSwvK6VE7ZvanIPTgEYpDbcH5dtytp0JSdTWAxWx/fIwJccMdpDaTH6CpTIEfJM+QYlU4XR/mavyHotNVCFljHpOuRkV+JJlJtcnrSCR3WV5ikR5RNR8fPnQK828mNyZQLnhr8plHHXrWy+RvpVFfGMwuiFiLYyHIJ3EuAmX1H5A3kn+vky+24Sxw8POXlPgl/rjM1M4pgp8/jSwVTYyf70BOwnAqSWn6Ico6Oz0+c8zxD8GrokZ09t6Z0a59mpnBXvIlp2Hh0Pr5eIpj0sA6lvea0NYtHUgw==
Received: from CY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:930:11::24)
 by EA3PR18MB979725.namprd18.prod.outlook.com (2603:10b6:303:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 07:09:52 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com (2603:10b6:930:11::4)
 by CY5PR13CA0035.outlook.office365.com (2603:10b6:930:11::24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11
 via Frontend Transport; Thu, 3 Sep 2026 07:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:09:51 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 4AA424186B5D;
	Thu,  3 Sep 2026 00:09:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Thu, 03 Sep 2026 00:09:47 -0700
Subject: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419391; l=2816;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=99uPn9bJ8Lu+6YZE0sjsLR+Vh9Smj9T+A1mM+bmXhkk=;
 b=YT0LxeQ/usJXsknPFKvUfO+yFIsfNZOw9m+eT5ky8TOnv+VGnIRMvUPWNifxAoBd7alGsVfV/
 AIye1PNz7MEBu3eiApXzFmo2xc2vFpzI/8iVIRW6BU0L+JQHsrC7F6e
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|EA3PR18MB979725:EE_
X-MS-Office365-Filtering-Correlation-Id: 184d61e0-12cf-4f56-1a24-08df098a594d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|13003099007|921020|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Wta4KKfP3QLBPMnjR05z2TGjfNd4Yhl6BQeNdUQpdBPo8DYAh4W77zXco4SdbX0jXChaOMa9Yloa3NQ16pZzB2eH0GXaCa2F11Ps7xzg6ckhqf60Gbgov/UjQqLgwH9GEaK2lLRnM4ncvyrk5aK0qemnEoRUEbzuxsbMBuTAjFVl1AUdjt7MhfDy2TkffeAP1GP59sKZpp69qo0WQbyBrYxyPVCbTn4WlpbOjCTBrJpO3Ezt4xtnxtnC55M1YoSGyUnayKBiQtgdFUuXKhJ3Bmlhsywop2utcoClJkZ5+C0RN/oQu/vlEcZUsEUQ3grZVzQZkm+zNLjSglCYZZ/VnaTSvFOoqlIugJmRhnpu+MJNxTwqMryGbN7KLna0A69DKE9uUZBOrgYi44SiaX+djfVaixwBY7z6IosNE+9048tOdbt1p8I3R/fJ8eYYwzkkHa0CRCmWLzqANborL9tUCQ2dq+wwlSVzmQpPKjWGrQxme+yBGRaTYJ/nRETbZ0O30D62+yLQSDqMv0TDg4DHYf6ERCPM/dhMd/8BfcAulkDmxplM3uPSWl2oMUCgA/i3OPaSalU0Lhc9fFGYqItr7TURAuLxNbrEV6fWynvA3mltSEQGtdAtv4f2RT2scG1lGdVYrWjcDJtl2QFe76BXNlWYmLBL/Qp3NbJPXgHh/Ey8m+DBGs/w+tb1f93ZHrDD
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(13003099007)(921020)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	afxwGKMIgM14I/SXsYfSY5IukRNgOBk+ljptoa8SluP29T6A22CGUwBQmQqZjC/Yu1kuVguTDLdwkCoIN53FhIrYlSTVR0bUA2slVQeswCQSg9qD37WHZz1/eQaJVgFHotKXjTIyO4zrogufLI+iua9bLo2iBO/PxupdJORSfYcKAHV/Yg+mdV86gHtK/btvo6hwJalBu8s2qZm32gp1cD1ifvbknZAPtXdyUP2Mcml9yTV9iyBxNVUkiKKzRQkv5eJWGf6K3Os5GCOAATc52pj7r2Fov54j8sVc6c04dhp6Y1XyaUKB+xl9v2KBvQO4WLsKga1nd08+6cmBCUHfo1CIwaLRqIgro2pLQUyI/RXVtlkf4IwOgn9hV+FdCht/IWtM0/vCS/LLEGnlo0y4LFfzFCpAtHdxUy7xLjhiTxapcRzGk0rwS/GspTrlQqrj
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:09:51.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d61e0-12cf-4f56-1a24-08df098a594d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR18MB979725

Add a Devicetree binding for the temperature sensor ADC (TSADC)
controller found on the Axiado AX3000 and AX3005 SoCs.

The controller monitors the on-die temperature. An SoC may contain
multiple TSADC controllers at different locations on the die, each
represented by a separate Devicetree node.

AX3005 uses the same programming model as AX3000 and is compatible
with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
used as its fallback compatible.

Also add a MAINTAINERS entry covering the binding and driver.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../bindings/hwmon/axiado,ax3000-tsadc.yaml        | 45 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
new file mode 100644
index 000000000000..4b56e4fd9ef9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/axiado,ax3000-tsadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 and AX3005 TSADC
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description: |
+  The Axiado AX3000 and AX3005 Temperature Sensor ADC (TSADC) controllers
+  monitor the on-die temperature of the SoC.
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-tsadc
+      - items:
+          - const: axiado,ax3005-tsadc
+          - const: axiado,ax3000-tsadc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    temperature-sensor@33021000 {
+        compatible = "axiado,ax3000-tsadc";
+        reg = <0x33021000 0x100>;
+        clocks = <&refclk>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 77159f279621..c6efb04fc376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4467,6 +4467,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
 F:	drivers/spi/spi-axiado.c
 F:	drivers/spi/spi-axiado.h
 
+AXIADO TSADC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


