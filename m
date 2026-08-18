Return-Path: <openbmc+bounces-2411-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA8C5DF81
	for <openbmc@archiver.kernel.org>; Wed, 19 Aug 2026 00:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hPmvJ53ZFz2yT0;
	Wed, 19 Aug 2026 10:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787024086;
	cv=pass; b=B9Jo4uyZf1cyHSnC7f2L3oGe1tLy173QjA65LLekusdOaRBYfR1gc8qs4z1q7/KLypxRo8jx48e1cEcI6ZnJtpBz7PGC18jdUvYn+DFH+dvmkVCfCRgAs0Pd+xIqE/QIWb4pNpcvIfpYUrpfdxDxceDGsrVVFE4HW//6taBm6EEYmD59qJoKom2Zi0Hmg7q/tJd6x1btal6cJWcvoYI0Qjv2QShCwVKNS6jV4O1g8+plxorPQYWFJkedh2U8P+0cKlldsr9mINeSRjTbUnX2ybbKnlGKtghtGuCsGLszQ5/Ho/CSGZeII4ItSn4ttJc62dDsp7oJ/FelAUB693r59g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787024086; c=relaxed/relaxed;
	bh=Dze1ngDGVreinW3wGpSZQaO+R56ZxjpGd0XL8vasJNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjpmm97bMIC5QLtIJg/jNJ/l6lGlfX0FZz6mDjzwcCCVPSk0SnZ1iKbUApu2PWnjFAXfsVujThr/CPAETyZb+BP5Khrx+vwFkA8SUs7S2EA2kzhX+jM4MD48kigfjB9uVidRFUrk/ENxyEMo9QyIRpEDZdwETBl40Hr8WFLy22lct+2Op0BeexC56/bIBlB2YUQSDk3BDBp4LgY/+AslqqZh3hCBGP5A2SH5PTm+FZbm+IVUeETBrUtM5AJeTDlaer81dEwLuXTJo+HuzReHAUv/QMilH+cR91DNcth0CxLjl98kY72jX2HFilzsZX0knjxD2mKhFrlH7WW87ggn+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QXj9YC5C; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QXj9YC5C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hPFgl6SDnz2xrL
	for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2026 13:34:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYi+t7De5GSxsI78rTdeJI9sHY2uCyHXZMa0WPeT+EKnzwnuPfr5XSW26qa7haywSO5i8n7rp9Bsg6DnmCmSK/f1aXvUhko94YjJbKjrzKU0ukC7y77z3OZdfEYr99k3hBzCBUogRgkWcsYQoyYUsgv/h16Iz3KDIZpOCVhmodcqixi6uegXn4w+VrHTjMscGsEAUcf0m1Keh5fdNLSssgMH1hTjYW8SBkIR5eMc8M3GHgrt1wHOgyHEflKrGEE/2FGMrur8co3OGbWEci3gkAhzywPYlE8dsnHZkis/13EsXkbe6XBKK0VAKmAzAFgObOB78wK4LRmx7KjxLPnX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dze1ngDGVreinW3wGpSZQaO+R56ZxjpGd0XL8vasJNs=;
 b=YwQ1IxNCxh4IxuDPcmDFvwrppDwgQ1efqwml/xIUmu3oFAKXipQIHlQuB4bk1xswA+4CVCeNTcOB3OstLDzpvJnGu6lcj0BGYNB2PmKTu3BxdES3SQq3cdR1KxFLbRCAmGIVjTjPl8vrQ+7ato9J7NVyKsbCzHPhVpFj1sUeMoJC0HW56jxUm9xu7eiGL24D2YqB0aqBKjmK9EWZ1NsCLGqms5cGMLu302blleYSt55Twsji0BxESpy9g7qn/qHS5h3DAjEdVnUHwfPAvN8eciGPrem2Hw6lxGkMZkJM9dYTIufiNOiRrNo5drXnqyqc4CfkyI+rBvdSui7T6dEPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dze1ngDGVreinW3wGpSZQaO+R56ZxjpGd0XL8vasJNs=;
 b=QXj9YC5CqaNzVOpcR5kjhCgLXUikr7H+nMe8yGvmjRL+XeU4fkUxlsWdidDk8lkGv10FFEPbdMpc5xABbe8v3EQGe8aMyIUqHdHyfJdfGUOm2MqNHE0wio0kfWGe8abi90AcD23MFJnq3uuseo8gNu+VSJEh4D0bZQCX5SBBGIImpiDw506Yenj05UdsVD35G0DsFSgxIH6MhERLRQiu658vMfX3s7/awiqo8Eaaql4GaS4fK61QnRuoxDIAgPv5XhRpi7B+fBzGW8I6skPbQR+jxHAHa1Vsik3H7ooCCra/0+J2J3kkpEUBPBmxSRgLle6SZYecM/rUdXjYDtlTfg==
Received: from MN0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:52c::22)
 by DS4PR18MB988372.namprd18.prod.outlook.com (2603:10b6:8:34a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:34:14 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::7a) by MN0PR05CA0022.outlook.office365.com
 (2603:10b6:208:52c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 03:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 03:34:14 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 47C5B4186B5D;
	Mon, 17 Aug 2026 20:34:13 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Mon, 17 Aug 2026 20:34:07 -0700
Subject: [PATCH v2 1/2] dt-bindings: mailbox: add Axiado AX3005 mailbox
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
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431; i=syang@axiado.com;
 h=from:subject:message-id; bh=o9Gjyy0quPrEm6diMfo36DhltfBfMh0cJKJcjazo7T8=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqzmS1vU5RofJmdcS34/L3z+2+iU+DKWxa9UlU4eWxCsN
 Ukr+b1ZRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEwkcxLDP9ul3hofNP7Pzyy5
 zbz9VeGD4xLy3LY2/Mma9f0eibetHRj+6WwIDZXeU1xXx251Najju9Tlm75Nhhy1AfcX1s1I3/W
 KBwA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS4PR18MB988372:EE_
X-MS-Office365-Filtering-Correlation-Id: 137143ca-7619-489c-a0d3-08defcd9935d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|13003099007|6133799003|3023799007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E4HSysl3H+U7AzEXeWNE5YHAGskklthl/uCQ6Qztpwyy4RlHm/ekvoBuw+ZwkmNe5C6kjMKbZ+iW1sTpjWCeK7AFCn9JMM6EBNys8yXm24EYjyAP1GKTQ6bXH3e2B3h1vrD2EOSbU1aGPYrtupYFnzTkSqOK0Qfi/XkkDa6SjZC4ytRsLfkoTIbl4aCOrjOlwCQp+ABT7lSVp9Aec65At2Mwaifx1Vhxa3ci6IWmbQme1awbpJD6xrxfKOIcJ+BfgMmakGNxLKd19m2CICIl7Ntu14Bs8FcXoRSizuZjt1X2RNEvMvNEavxUo/+BWoeBH20YDTqEvRsL8hdhPaOhh5u8whnkNfRjzEmy3ANnm0A1lEK4IU94wiSICmOrw8uz4RlY3cgX1GvwHhUeh6DhM9iU4viF1ofnAym/SDb0W060GF2Cq8bRE8N06oH8OPQiVUPfPGCQged8WQSo3HJlaRIlunU0bbPWG/zNOCYpcP6Tv14ClT2iF/8H2cClxYdevvdhHqcaBjnBBBBjeAyX0VXy1DCOgUlr10oFm0eqVmaP44gfLOujBpXEnViR5LAmkWZa/gBAwDoEqxinb25rKQREKh9dW14ina2XlGb3dI7RAREI3VDPJjHCBsmZcxDl62ZZU7dJuHSnF+sFSlbozg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ATjHgeU3d0UH9TjFx/MyqT2NU4myNVA72zgeJ23Q9KB9vQrka1a0l3GSXLsrWmGQY/xEyvZGavmEAvKUjbU6L/rG2okLhV6PNbF9mAIQ9+694tf/jnsvR5B072PMBcfDDHxynl3BgSYHWVG9h+W2eXAK9CCefSTAzFHxcm/F2QkkN3NEyRAvcVztJnULDqefiYssgEGHM0Y6HqHZFek2QxQII02U5nAXQtH/TZ7MZt+nechmpqdP5o+/dw70sUB/MJuzfkXK2SfQuEoLw90WCMIUB7XW7HlrUD5d11lAt4oMcYi6ARtmmKzC+enDZ8lzTlpI0T9TEdVNhIiUr2+vncRAJc7D/inl9kcVhMZVRQSr0u0gzzyU//5NoZG01qqCHSQ/sjq5QjXBo1z4xExdOblm5CxJ0ooaDUP+d0U8JVW0WSdQtKm4YCoPS7X1zOHV
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:34:14.1908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137143ca-7619-489c-a0d3-08defcd9935d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR18MB988372

Add a devicetree binding for the Axiado AX3005 mailbox controller.
The controller provides inter-processor communication channels
between the host CPU and the coprocessor, with separate TX and RX
register regions.

Add the corresponding MAINTAINERS entry covering the binding.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 .../bindings/mailbox/axiado,ax3005-mailbox.yaml    | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
new file mode 100644
index 000000000000..82bf7d1848c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/axiado,ax3005-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3005 Mailbox Controller
+
+maintainers:
+  - Krishnakumar Kesavan <kkesavan@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+  - Swark Yang <syang@axiado.com>
+
+description:
+  The Axiado mailbox controller provides inter-processor communication
+  channels between subsystems within the Axiado SoC. The hardware has
+  separate TX and RX register regions. Only the RX channels (channels 8-15)
+  generate interrupts; TX channels are purely poll/write-based.
+
+properties:
+  compatible:
+    const: axiado,ax3005-mailbox
+
+  reg:
+    items:
+      - description: TX mailbox register region
+      - description: RX mailbox register region
+
+  reg-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    description:
+      One interrupt per RX channel. The hardware exposes eight RX interrupt
+      lines corresponding to channels 8 through 15.
+    maxItems: 8
+
+  interrupt-names:
+    description:
+      Named interrupt lines for each RX channel, from ch8 to ch15.
+    items:
+      - const: ch8
+      - const: ch9
+      - const: ch10
+      - const: ch11
+      - const: ch12
+      - const: ch13
+      - const: ch14
+      - const: ch15
+
+  "#mbox-cells":
+    description:
+      Number of cells in a mailbox specifier. A single cell encodes the
+      channel index as seen by the client.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mailbox@330f2000 {
+            compatible = "axiado,ax3005-mailbox";
+            reg = <0x0 0x330f2000 0x0 0x2000>,
+                  <0x0 0x331b0000 0x0 0x1000>;
+            reg-names = "tx", "rx";
+            /* Only RX channels (8-15) have IRQs */
+            interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ch8", "ch9", "ch10", "ch11",
+                              "ch12", "ch13", "ch14", "ch15";
+            interrupt-parent = <&gic500>;
+            #mbox-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..af6c3571c9f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4437,6 +4437,13 @@ F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
 F:	drivers/phy/axiado/Kconfig
 F:	drivers/phy/axiado/phy-axiado-emmc.c
 
+AXIADO MAILBOX DRIVER
+M:	Krishnakumar Kesavan <kkesavan@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Swark Yang <syang@axiado.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1


