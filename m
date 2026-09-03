Return-Path: <openbmc+bounces-2539-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C1C624A4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 08:39:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbCgt4yw1z2yrw;
	Thu, 03 Sep 2026 18:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788424762;
	cv=pass; b=iZ1eHteefUxHzT969Y/rpN/JKcxJ/hhe4e0/3TCWqnQYK5NlTeHb/KrhvJGGdj0BU+mbxhP+JTqUW5o99C6w7fRbXvjMckAx8dgM4GpYnxKtIKrxRhHW/7p40EojB5iyx/hqco4bK1LNzzXKWuflCl+nEXeKXwk9R/SAnMYVq5vUyCsCt+iO6ZqAycMnUnV2faicPbWreZWgAVsO/EtMwVFbBd1nD+ulv/N/oPpcBSsdXGTyzVSsECI+kKCe7kQNJA2sCJ8gpbOh8PlzweP/apP3sE8Wwdq+a2LfdIMqUcXUFh0Iwi7kLPtuA2H0jrjfPHxXjMaV0HwPDEt54OivHA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788424762; c=relaxed/relaxed;
	bh=u9TIVJt9XaPRxgZpZvcOGFCKfso0OD5+aohza1Pg3s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZuiEY5OucByB6Rg+7xMG3bXdH57O6pHq1XIn7BtQJlP2d8Op1XHRNL5A7F8jtrclK1CfknLAxThmoQZpZ5Sh/g2zaTRNSYo29uDzYWjx43OPmiBjpqS6dYSIyX9wbZS6L3XWXNFUKQcW3reOoOsjB3C0Yty3jnF3ciFgFqmE1HXN32pg+gH8fnDSBeQnCkqbeCb0gpvldDe6+J/jNYDC3rp5cb4o7FbTtO1gehzcYNHCHx94hxifW9Y6sJauEXPeaFEMWg/IjrLB2W+hFqCuhZ7lQCIzoZCKiIY8r5Nm5XU2YZtWGWGEt6yteZPOTgxsGFhVNoKFpDNsSrw8T2ylA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=FlUMb3+v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=FlUMb3+v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=pstepanovic@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbCgn3GvJz2ygW
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 18:39:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdYKWW3xUIJvLKksBicSBjE5HvhabHt1m86DayZaHZIle/W5ZpYx9DnAlVIfdDRSX52tIfxrCInKAgEm60CkyliPOkEhuGYOKRDkV83KRAd12ZO2V5KOx42tXpq1LlpjLQL7GEYprgHtBYJNnu2NLo3zrYZBzkmlud8c5BngPQaOclsLx3hLDltzWjnjFjfkY27+RrL+8tJeoDnmd58JDO+TMPTXGDE0DXmy7fC9J7oL3Osd/VaOswZDi2ejbPMSTkXw2mN0g6kGvwD3pN8PNvTp41SNqEuJUQKgSUO7oRdqbsMprSMrkTLTvsAXUgDxULFyh3U7rQXKiR1mhnkmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9TIVJt9XaPRxgZpZvcOGFCKfso0OD5+aohza1Pg3s4=;
 b=M5ZUlGFoqiPqSExX5fwyl1Skz+5GXTV0eZHZlijlXeagyyaKXglpFs46B0V4nluQk/TdeV4wM3noFFOdA8/+3ukk7KcYe5HLxOra7e5D19A8l/2wfZ0On+cuU5DPs4JxF9WGDwtVrbnYs6LwWVv92E2DyoRIP3dwtqaIxN5Gl3eyVuPuISzBFADSpnTzTIeF/C+4jEdoreXBZrwjSIZcZeeIeyzKcWxRXJlunc4NjE+DgRgpFauc31ZRbsNbiTHRsKON82a47R1sWksIqcuVH9NaE+Qknc0cb2qW6VgZIMtJPFaQpweXxKEZIy+V176+y3ZXiWoj2Y0E3wGabh7Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9TIVJt9XaPRxgZpZvcOGFCKfso0OD5+aohza1Pg3s4=;
 b=FlUMb3+v9O9O7MsHMxEwlrvaKmEFr6yppEEmbOG8UJt0VmwOVEMc/o1OqkWhdjN+uXn0xKylkMK5CPKcY8oyweqzcCB22rU5KOxfkszDYWmBakvtWfU0JBXRSOliC8gvUkbWcs8jCJFy96mi2K+/Hn5wwVze0SUvRq2/4YLA154bVAlHmaiZg1uEl+MooVp6PyS1gYWb9XW8l3S+RjoKYw+lTyCFBgnHCqrj6ozh95VYYiu0F/F5nUXlosizG1bdGNzME2rFScLexfY/giNX+g36JZ/LNdtlWiB8GG6SypdyB6K5LrF+qdleqCKI2oK/tZQwztJ2ZVLFo0Bez4b5gw==
Received: from BN0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:408:141::15)
 by SJ0PR18MB4393.namprd18.prod.outlook.com (2603:10b6:a03:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 08:38:51 +0000
Received: from LV8PEPF00000060.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::6b) by BN0PR07CA0003.outlook.office365.com
 (2603:10b6:408:141::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 08:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 LV8PEPF00000060.mail.protection.outlook.com (10.167.245.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 08:38:49 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 949174186B5D;
	Thu,  3 Sep 2026 01:38:48 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Thu, 03 Sep 2026 01:38:39 -0700
Subject: [PATCH v2 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
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
Message-Id: <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
In-Reply-To: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, 
 openbmc@lists.ozlabs.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788424727; l=3223;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=1wsiHjFzaw2UFt0Og2ZlWvpyEzP94+01p2oPEMdSZU4=;
 b=ryYo31Q4IyZ9OyGJMlNFU7jCrvOn4s/DWWG0Dxif1G9x7GoSjFRqU4oWJDLE+uvTyFi4B57bm
 LNdEerdU9aZDotcA2VSnEMzTvWvaljI4WwN7CidbTI/42IEo5k0Sabm
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000060:EE_|SJ0PR18MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9576ad04-43bd-4369-691b-08df0996c6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|10067099003|3023799007|22082099003|56012099006|18002099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	Z+BULH++wRDbd7efjIoAt27CEjvnVWCeGhTo/3jvE2WWByGDcsb620Em5E+JIlPU8vkdhxcNlT/v63VFx1OhC6w9eofyj0paXhll0CqFeWToFKz2GyopzYknvK996AbCbP8YdRO7ThFjYqCvoJx4A421JAFRRj1Yt3nUjbJW+IIo9wD9Eo6BsZVZ+J8RzL9vXj8pubzYRTXe/N+0i4puOnfpTpwbywMpudM44+9yI+oXSM2antqKms9eOhKhucy5M6+ftc/F5Krqssr4LgYYMUt4mlO4JOfSZArkOxq6NXFlVGV5Qm916dAyjTsqIxAPZAuJ9KhCWuAAryjld51CzW9TmuNimO6Yf44NjEwLaRYOS4XZ/pIG6A+taEhKTbOZVtUAIoaXU8hyqbUMsJqxPVRpK0762tY8l8Qx+QoSdY2JmJbwTh7QRorALc57lndG8k/YITGkfyMp/KizvRjGitMzQEVH5KZYYPDJOfc/F5+G4yfxQq2QM53ax6TLkeJgdkxvx9f8CmZgU1isRDyPUwOnHcoZJRUVnPkbAtb3wfkVuwr03VFLK3SF++ZCtGb1wKyaBDKDpuMhEtLayLFFKOWwPFFHcsgUmXn71IUGQkNVu/7I5LdGWg8XK5x6YGDFn+33I2FoY8SrDHSke9zapSNVwVlQdes1XJFwrIrHsM/lGmcLVKdZkNP8To+g6HjF
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(10067099003)(3023799007)(22082099003)(56012099006)(18002099003)(13003099007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cYWlNRX7ciHUXemJSkh4Yl6PaCPZi3DeAeS4SNZfnd9DhCABoEUDPuwNG7jnQ+Ut8f2iMgF7556ThpSRZrBttlrtwXwGZfdsyPes3qTJGRdQo/DrG+OflDiqXP3ZtkfIsrAjlgMNVbXZ2mIx3bcLD0DfRGn95UJ9Yr6jym4wjHSH4c7D4948nUUEbAjccbyed/1xssA5NYxXnnmA/1CfhsGN+CNhMJmrLrJNKGncyEm/wK4nv+mPaUwi6nVxEyhqtfMDhfkH46OVJ/f7HaJ82JCRGFfkb0EtvcQA+0VdRVfKeLdYqrbKGjU6Gq1zOCb5aqPsY388qGWrGo1qg6lIIrW5iJmVeZ4SllJs3g1ax0Y0cuov4TM7QlQPOZNvg1BDcpXfWsMe69zPZoxmNkdp88es70vOY5Se4D0ygHR222u5+0eZV04S6CHFKQT/tuYy
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 08:38:49.4960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9576ad04-43bd-4369-691b-08df0996c6e6
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000060.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4393

Add a Devicetree binding for the PWM fan controller found on the
Axiado AX3000 and AX3005 SoCs.

The controller measures fan speed using a hardware tachometer block.
Fan speed is controlled through a PWM signal supplied by an external
PWM controller.

Add a MAINTAINERS entry for the binding.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      | 72 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
new file mode 100644
index 000000000000..76a3e12fc656
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/axiado,ax3000-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 and AX3005 PWM Fan Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  The Axiado AX3000 and AX3005 fan controllers use a hardware tachometer
+  block to measure fan speed. Fan speed is controlled through a PWM signal
+  supplied by an external PWM controller.
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-pwm-fan
+      - items:
+          - const: axiado,ax3005-pwm-fan
+          - const: axiado,ax3000-pwm-fan
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
+  fan:
+    type: object
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    properties:
+      pulses-per-revolution:
+        minimum: 1
+        default: 2
+
+    required:
+      - pwms
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - fan
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    fan-controller@33001400 {
+        compatible = "axiado,ax3000-pwm-fan";
+        reg = <0x33001400 0x400>;
+        interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk>;
+
+        fan {
+            pwms = <&pwm0 0 400>;
+            pulses-per-revolution = <2>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..f528b1a42e0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4457,6 +4457,14 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
 F:	drivers/pwm/pwm-axi-pwmgen.c
 
+AXIADO PWM FAN CONTROLLER DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
+
 AXIADO SPI DB DRIVER
 M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
 M:	Tzu-Hao Wei <twei@axiado.com>

-- 
2.34.1


