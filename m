Return-Path: <openbmc+bounces-2633-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD4C982E6
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 23:36:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpfkZ2GjSz30MZ;
	Tue, 22 Sep 2026 09:36:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789971534;
	cv=pass; b=TWm5jsaAUbMWHG2aUEtPeZRgIzfd+KAKgrnydz7BXKyoHsTYj4nskVVbge6cbdz/gfSX9DBDYGphoG8LDlkFvvH+jgldG++j9ju+KMpheDFkUvV8IVvTpOk1oz7v/XIglt9k7rH19jEi4rIuNmAq8n0X6xIA8s9ZYxRJ9D1c0thGVY9zmuiRhzuWvfbfpM6lI3bgHjG8gqOmQiCXAbUapzrDy0MLym934z7f2YAL6WGUy7vzDY2Is0C8VRlPq2G+LGfL3Ymtaj12HxopfnhCrnK8eS62whq1Ms4j5YU7CyIgoN4f4JrA5PBnjiwurLntZ7K4UySd7DV3v4r5xgMO7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789971534; c=relaxed/relaxed;
	bh=iwpOb9ZBrX4CjBAR0f4yeAUiSej0yAO9h07mN0K4f0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DKP/jGSyfAcd0W9h5ovVv2SGI99zHIWWToMTuiBF75dY4Fc559NhRZqWo0c7QmObxpyrTlDBBQXPb14YfsvsPAUC/kAjgZxDfVP7F/lKxfT7479ykXG12k6mwjM4FCd2zRrQ/3IZ6wR6AcXm/EF1yafr8+9gj28xk7GEGtVTqaeNHIdt5dMxeQjO5op1nmSQFcpiaJYGfy9P7vy8h5ciqF/4iZb9o40+yitHzsusnIKmDt1sDRYqQ7EEzc38QudwA8wuR16M6ywrz0A8rDtX900/uykE1yo+ShXnIFkNZ01CBhwhBt2MhLoHfzRmDAM8M8TT/IwfD5EGzUePxPioyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=BTmSIPvY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=BTmSIPvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpCjT2Ppqz2yPR
	for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 16:18:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxdCSlJAwhtQMiWyAAgfDU1eRHt0UhnPPcfqrqVSSfM4GB0vIJiPAhzhPvfD0IBbPUIJ38pE6xCBoxE27hUWLEfBtYzQC7fOMOOTGyOzjWMn6810e2QiS49lezspvKB61vRtQtnviIMVaHFKypfEJxfSpRNrn9TGLv0sc66KXkueIFKJrDQURx3ytKu9KIwqSxbxm6pk0vnzPfzagGKWn5RPWtQDjOzhOax6VzwebeiALXny7RbFuPFqveUOnGlCVmDWoaEhwh/yN8ZPGXwlMpbDJ5jRbNfCjUD2CqhiZJr4f5WqcWbe7obSWJUAK2GY3JwGyhO9DNBQ/5TMNui5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwpOb9ZBrX4CjBAR0f4yeAUiSej0yAO9h07mN0K4f0o=;
 b=LrT7d78N/4EIBXnyygUYQMffDm/SeT7/6IxnF82jFAwixeEFXGX4eL9bZ705uJ9CPpl0lm5DXbKXWvfrP1Strqzpv2+48j/4QHIG0B4wGRPuoyLJEtVXrdqa58fEBYTwZ7EHlbfNWbzNFzrKtUTNHq2BHbsSqe2SKiw7b59UNW13OVVB+hFKLj43+00kADdP9/2aL7pwHt9h98YM0tdwck2CRNmxEp6rZK6fTKvxeu+aM2pLVdLVfY7PWaghXNbNSTuhTk7FLVn39ZLKzhnNzCL73MfU0U09vjO99ETYV9kTci9usI7bdEZwBPSM89gyPaCzSi/56Y9CGj/iSSiFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwpOb9ZBrX4CjBAR0f4yeAUiSej0yAO9h07mN0K4f0o=;
 b=BTmSIPvY1XLXmjcb7uqXG53rZNjUnRaLN71KJ3Y4BKjubd/qlBEovwj8wLmC1je6rTr1RvrHZaLHQcYX16o18mAk0lF2JHaDrspB1s+5+BtOILKkEe18no+O9bKbxfWZMdA3SxkPqg4B6pafkrszOKQzqFwMiLgQwxtGpHzM816EgXybXIXKCD0iID99wZnoSQ6jxc0ORHLwq7uJrgk03yzvKuHVvTiRLVSmMhH3C5Co3Yl/TyWkJTwIrObGAtOjaXSb5VUuvi+SOxoKZoO/VjMTmlgrDkb0om8IHO8tzf4XpGAndFxU1cIk+JQsFBZi2YwQiqvdv5aP2QBZ8bpBhQ==
Received: from ROAP284CA0308.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f4::13) by
 CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:18:28 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10d6:10:f4:cafe::46) by ROAP284CA0308.outlook.office365.com
 (2603:10d6:10:f4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 06:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 06:18:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:18:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:18:21 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 01:18:20 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 21 Sep 2026 14:18:03 +0800
Subject: [PATCH linux dev-6.18 2/2] hwmon: (pmbus/tda38740) Add driver for
 Infineon TDA38740/TDA38725
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
Message-ID: <20260921-dev-6-18-tda38740-driver-v1-2-f9fd35faf911@gmail.com>
References: <20260921-dev-6-18-tda38740-driver-v1-0-f9fd35faf911@gmail.com>
In-Reply-To: <20260921-dev-6-18-tda38740-driver-v1-0-f9fd35faf911@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789971497; l=6444;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=sWe7QHhgsSazNxCP+3eJlHiIwvwri06zb/uPkWg57nk=;
 b=CdUqE0KTGwFV3HHqsbHpOXJv+PTxdSW4xwecQyk0sW9AcFHPZ9/C9Fezm5c9timZXKFF+0DUV
 9Xe+QUBWGV3BRqMI5V08OX83qXw4HykETkkmG63U+Qps20qgcykO0u9
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe542c8-067a-46d0-54b5-08df17a825ea
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|48200799018|7093399015|35950700016|61400799027|6133799003|13003099007|16102099003|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wxuxX7rwjmd2l0lSp4WS31+bDYHkOARDsTwECAPwapWzuyVilFTm9dj6T2Qp8cUl4YRrBNRipgodjEl1eDs4NlOerHW6uJqHJwv5gacHO1u0MlSwFjtNE87Qd65/Ss+3CFbvpDFdRyAcxlCLGoe5nk3Ut7TVl2QTMSTanhHuLY3UPI9fCfxjreiBLEya0slf70FOMEygnuJoAFS2ZOzOrKnfX/QJvK7gGW+uldCBOpC6Ni5OoeDfJ12OzLX/KyfM4Qhdt0cTQlsc25i7vWRPCkpwVkdghSdbda+V4y6hXLME1+waQBCOAD+nMUS1TMtihyL9nxXsVOPUcxUIMDtiMeSBhEVLtpjuzJgPwQSfbcOzhONaTpZTFIrzmpBKbuLDC4TToXa6nNM17D+1A7Ek9ue+vKDSWFwcr/qkoGKIGtJbLQdgMG+gO9Zq0mj7EyHL6uDgMFAgswefZDNsDENIVtAlT9ncdlOSEQo2WYvxeSDE6eN+gsHidaNtV7OzevqrgC8LEZK9/ta3jqSqFlRf+684Dv540bs62rmgu3YVj1bANxQlEfHcCToBaYiWvO6cxsVFDGXbYMKjV/dNcOxboT7Ycd93MaplP0dzUg0q1NEtSbddU03bKRPp71Esax4KkZTgMWtADCUnd3IQghqR1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(48200799018)(7093399015)(35950700016)(61400799027)(6133799003)(13003099007)(16102099003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oqRkCCJ0FRXSg+hVCbgTCQvOeRJ0wT87Rrynyi4RioVghp9Jnl/Zb95GE4Ip9HWs0om7U4SCkPS5/zAbBFfNoeEFEh8z0s7lNjOKPZ6r+w3LlLv0wHKL5rBWqle69Zk9Q1L0q00UUnF8wRWZalCQjUMTjTzrItf6thSQ57lUKjb8wh8nY/ahFODgXtxueQBfxCWmclaup9Dkd4hPym2I6azlsDB5ezZ4d79Fqap84Bzk1uO8HfW6oaen0+v42qYFQTZKuFOxyk/cYJzT9mi/ZTBwbMAo0wiYZ6aKdoreQqQ3gtb9La/WfHi0+XrewQnM3t9RLLyY/6EPw9OtmyVexKxireWzhHeb458NE2qz4R1T8g99hOBhXWQJqnTy/QL9YH1k5zf5TerWzJzn46QUM1VG3bRB+b8SsBJXV+8pKKgL8QCqG4xrkYfveCHYLWKi
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:18:26.6619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe542c8-067a-46d0-54b5-08df17a825ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://patch.msgid.link/20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit f4c3b88983f342d6614cb11b53a0640ec8bc8fd2)
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/index.rst    |  1 +
 Documentation/hwmon/tda38740.rst | 65 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  9 ++++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/tda38740.c   | 64 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 140 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c5ab1aa5d416..66d7fbbc2462 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -244,6 +244,7 @@ Hardware Monitoring Kernel Drivers
    sy7636a-hwmon
    tc654
    tc74
+   tda38740
    thmc50
    tmp102
    tmp103
diff --git a/Documentation/hwmon/tda38740.rst b/Documentation/hwmon/tda38740.rst
new file mode 100644
index 000000000000..55ce12f14914
--- /dev/null
+++ b/Documentation/hwmon/tda38740.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================================
+Kernel driver tda38740
+====================================
+
+Supported chips:
+  * Infineon TDA38740
+  * Infineon TDA38725
+
+    Prefix: 'tda38740'
+
+    Addresses scanned: -
+
+    Datasheet:
+      https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
+
+Author: Colin Huang <u8813345@gmail.com>
+
+Description
+-----------
+
+The TDA38740 and TDA38725 are single-output synchronous buck regulators with a
+PMBus interface. They expose basic voltage, current, power and temperature
+telemetry through the standard PMBus hwmon interfaces.
+
+Sysfs entries
+-------------
+
+======================= =======================================================
+curr1_alarm		Input current alarm
+curr1_input		Measured input current
+curr1_label		"iin"
+
+curr2_crit		Critical maximum output current
+curr2_crit_alarm	Output current critical high alarm
+curr2_input		Measured output current
+curr2_label		"iout"
+
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+in1_input		Measured input voltage
+in1_label		"vin"
+
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+in2_input		Measured output voltage
+in2_label		"vout"
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+
+power1_alarm		Input power alarm
+power1_input		Measured input power
+power1_label		"pin"
+
+power2_input		Measured output power
+power2_label		"pout"
+
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Chip temperature critical high alarm
+temp1_input		Measured temperature
+temp1_max		Maximum temperature
+temp1_max_alarm		Chip temperature high alarm
+======================= =======================================================
+
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 3043d1899a7e..b78fa2e6ce23 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -610,6 +610,15 @@ config SENSORS_TDA38640_REGULATOR
 	  If you say yes here you get regulator support for Infineon
 	  TDA38640 as regulator.
 
+config SENSORS_TDA38740
+	tristate "Infineon TDA38725/TDA38740"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  TDA38725 and TDA38740.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tda38740.
+
 config SENSORS_TPS25990
 	tristate "TI TPS25990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index bd2dd3bb2e48..f40827c815e2 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
+obj-$(CONFIG_SENSORS_TDA38740)	+= tda38740.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38740.c
new file mode 100644
index 000000000000..067de07ba9fb
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon TDA38725/TDA38740
+ *
+ * Copyright (c) 2023 9elements GmbH
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info tda38740_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_IIN
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+};
+
+static int tda38740_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &tda38740_info);
+}
+
+static const struct i2c_device_id tda38740_id[] = {
+	{ .name = "tda38725"},
+	{ .name = "tda38740"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tda38740_id);
+
+static const struct of_device_id tda38740_of_match[] = {
+	{ .compatible = "infineon,tda38725"},
+	{ .compatible = "infineon,tda38740"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tda38740_of_match);
+
+static struct i2c_driver tda38740_driver = {
+	.driver = {
+		.name = "tda38740",
+		.of_match_table = tda38740_of_match,
+	},
+	.probe = tda38740_probe,
+	.id_table = tda38740_id,
+};
+
+module_i2c_driver(tda38740_driver);
+
+MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.34.1


