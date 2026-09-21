Return-Path: <openbmc+bounces-2637-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D60C982ED
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 23:37:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpfkd4T4Hz30TP;
	Tue, 22 Sep 2026 09:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789971534;
	cv=pass; b=VEXss4s/HRxKlHsGfkIZwDTzVe6V3+5XwVnkdPlRbkfmTgIp/aKuOKMrCVFVNS0+QPCbTbrbY5jX6Qm8e0nvFdeUdqry9bBodSl/tgEHurvc+JB7tu3lmbUJwU05XpUEXF4X3Dt+hOMp1GGVyzdXMiAa6xE8nAoKM9g0qsJGccLCR0X3NmpSgsajR0z2ofYMtr9dF1QGrpx4tqojYxDTQtg3fqnZ2oTTLMW0E8KrpYM8KfDb3l/HmSA2dkdL4v9YNvJ3acDGHh0qGLfnI+wyrp6vCS4qzI5LMEeUl98u/PGii7aAKFxWQNpnk7e+ARP7Z/AtOZ7A47Ea2/NcwmJp8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789971534; c=relaxed/relaxed;
	bh=cIWZpluEmx0gZ1RSn6U6nXKhNZ9fDLb1fkmuJWupARU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VH5A6DjODGifcjNg1G+j73BHf/Oqw5CV78bKWcWQQKb32ZZDBjPFjqYYV5fbQfBwsuDr4ZpQevJ4Otn4rR+J2bPSvyZki1F3iI3DflQsD5ubwyJiqkBGOBXa+2Yw6SgBTmNuUJn4plWifNYFY9PRPHXDnU9npTTXQZhA1EhyUzKHuSxX695u4nEi9AcRnlCCqQ8VjW9pWbVE/nYroYcBadlHXakkHX2pRroQyGI03PKcFGHZke1IbFw1YqnzD6PW4NTwMF91jYyuZKus4Pg6aR3mftoPlTI9uy39Ic7sh/ZYdCGAMuwkB76p8/GpH+ZPGvWAngt9RAE9BdvEYaISEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=rPD5pc3j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=rPD5pc3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170100009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpCjT1ZVHz2xM9
	for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 16:18:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is51hKnLKFW7y38ESlmprhdvoetRiv/e5vptY5y53yeGf1K7Fc2y0cJpogxyNv1ZBjVi/giQV4CFAYySjB71egCi6nLd0/GhtwoLESe85wQ3AG5o/fD6sH7SmD8OjoxDc6XGoLzKHbgic/H/aYjSXQ2cP0k2JvQC3k2mp2EZwFCOljB+eaqUCbD7hDSY/WDrzMz+OfUbzLltBRGxfK80g743f66OrP/cVcD3LB0kL43TzxeUWPNpZ6b3BJUo+YpssgOKIMknIFuuUC7BM3Fq4TZCFOgt2yXWH899F2bM8l9nJOeFiMEwCbqaltbeljoh7D6ENAJJ/BIoKUNsAOJGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIWZpluEmx0gZ1RSn6U6nXKhNZ9fDLb1fkmuJWupARU=;
 b=mseei4sPGFo8t10gwJZPQLGqywMz0W6jIqEbqOQBbEimMGeTsFsljAqw0WPZPmwEUi4diQSg0jkaAg/GGk1MWh9WTvO8PwByk2JlZ4+4b8Sq+dbl/8dNJdS+i63qlK+LehQVkzM5cOUIlFR7PyZEJJ+DhtFmkueKUpTlwpQt2Pc/S4kQx2eDIqJQJS9dT2q+Gk9lwp+r8GPmN474EgiZDcOyEQSoZR/jQl3CiuMDAN/bAloZGFbOSzJWddgKlt6vnvAhJJwHISCA4Wbt9HRl0DImV3hxI+PH3dJ1i5vAbSBJAMQVT8/AAi/35FMX18n1pHTt/FqXClfs5f7SGqqSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIWZpluEmx0gZ1RSn6U6nXKhNZ9fDLb1fkmuJWupARU=;
 b=rPD5pc3jJ95M5Ob8ZoFymrJHmJhtsqfTVeO3bPMMsx6OirRu32mhxbvh/7JERrTmOQhH/ZgVdyUsmN9kTu9uoOoC02BKuRiPmL/55xyooFbhDhwNyd7avHd4SNQCKMeQyshsQjm3hLxhtfcb9+1AJzNlwiaHhADUzgwEYAghnvCBpgtHAp2KygRPc6r3X9KxX+CaMYffUVszavUMCf1zi37wYZnkl9yxaGikvtu7xzcytTIZos8G0eZsz3OXeC8RIPAbOXg+fTVzhht28dDhP90hilhPOtF/McnDkdtBLnqCgU4Jh52RF1vtdvZUCL8PjbOEQl/CyMFcuZD/XQuuSg==
Received: from ROAP284CA0311.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f4::8) by
 MW4PR12MB7382.namprd12.prod.outlook.com (2603:10b6:303:222::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Mon, 21 Sep 2026 06:18:25 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10d6:10:f4:cafe::72) by ROAP284CA0311.outlook.office365.com
 (2603:10d6:10:f4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 06:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 06:18:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:18:20 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 01:18:18 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 21 Sep 2026 14:18:02 +0800
Subject: [PATCH linux dev-6.18 1/2] dt-bindings: hwmon: pmbus: Add Infineon
 tda38740 and tda38725
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
Message-ID: <20260921-dev-6-18-tda38740-driver-v1-1-f9fd35faf911@gmail.com>
References: <20260921-dev-6-18-tda38740-driver-v1-0-f9fd35faf911@gmail.com>
In-Reply-To: <20260921-dev-6-18-tda38740-driver-v1-0-f9fd35faf911@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789971497; l=2294;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=UvSKXdL0HCKSPTvii2O2DVOv0m6TQGgdPxKvjRtcy8s=;
 b=5XlwXms707SNII3+1lsxsWdapq0SMYOIBjBqLMAC58V1219M2CNQsX3BUYGKcaJ0eLd4TYL/E
 cw5g/x0+fLbAoM5qnPkNB/wgV1aMGDPa12a8AIKP7sbfde3ckNX9lJE
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MW4PR12MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: e2db9b52-2403-468f-6a56-08df17a823d6
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|376014|82310400026|7093399015|61400799027|48200799018|13003099007|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	7tNLkihTWkGRK31Cetxjbsxw5qMCR8jdx0yR3jKWHFRd8eqgx9dY6LfZh1pkrrk5TuujEmbPnLmRxW5Hk/0qVXRIk1ZgwQf1pONpCRSOx7RXJr7p+6EdiG2VI7nB+9pMgFcOu5904HZVMqlpOFiWkLw1OhY0EkfIAkYhgGmwWLkWMMiir/MMvv/044qvNVvci4IlscxUq19HFtP/8SEaQbNIlvuGxs7emIfryujtuEWHuiq0ZRrsXth0i09+qyEz5Z3uaW8F4YJeXRI5KXvMXS/tDezxtG7PgrpI+fcin5k+DvbacDHLgu4Y+aG1o9bZTBLEqiZxMBNrDfwzMej9/Ye3ScEBTdMgMdn6kdHYe59oSaco3aCnrvNQhhv9boCmXExOVWeGFqKfgCeZXctIIFR872XlPdMTDe8NWS4KgheA47YmHA4zGVASSwpL0loADgRhaQGiGCdCDeUHggc/aqkgcUTUpC4n26tzB0gHcuCTlN0qPHtSA2CmKBDrOnw/rMEv8sNx2xCz5pBXFMEIr1wVfoF4KQo/jZ3RzVEVi8BWGsRA92jbHgADrrvocPLae1kT3psmw6HmBJxIgo7GFykEOKufmpUlXIqbjOjS0bt72/LjOkeNnIBrMvqWHpam4gq6IWoYBHSyvcEmPMgm+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(376014)(82310400026)(7093399015)(61400799027)(48200799018)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PzRNpgazbG9W1CefAiBWGC+gx5Pq3e7Fi9fEefUb/FiiMuxqiWMSFAy5oC2+yB/O2PKMog7UUcK51DCwqT30RCUlD0bdxuID2C4E8BjDczaBM8qk0sCs7yy4BOYgnAvDRvWPOzqBB5pIoQye7QgOj/34BLNT+Z+2z7ZP0PgFoonHYKiY6ThcuXLGZ3NLVDtxhpvb2hVyqYpsDI0FfGp/uT31JHSObnbQE0Fe5sK6BfrTi2RK9ipJXxSM0IlV3Cely87jRMtbLUsxZFyCCatnftFvvJSIbQZoVoDxaBeYsKX20J9NwGK4qS51M6RZ+pEmnLECChq4kc+8nAdBG1v07HHpQ6dAYKW9QPts4Qs4jIH8DuH9GI7NA58rtEwwythFYtpXsqQR6ri1fx+os9FEDYS/K3qCvHQmVG92zMDKciijI6zhnC4VqYazj8PjEfvL
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:18:23.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2db9b52-2403-468f-6a56-08df17a823d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7382

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit a7c6a906b7530b8bdec2134c9cd1eaa0269969be)
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..6733e44c37f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
+
+maintainers:
+  - Colin Huang <u8813345@gmail.com>
+
+description: |
+  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchronous
+  buck regulator with a PMBus interface designed for industrial use.
+
+  Datasheet:
+  https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
+
+properties:
+  compatible:
+    oneOf:
+      - const: infineon,tda38740
+      - items:
+          - const: infineon,tda38725
+          - const: infineon,tda38740
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@40 {
+            compatible = "infineon,tda38725",
+                         "infineon,tda38740";
+            reg = <0x40>;
+
+            interrupt-parent = <&sgpiom0>;
+            interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+

-- 
2.34.1


