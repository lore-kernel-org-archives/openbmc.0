Return-Path: <openbmc+bounces-2307-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FAFC4452B
	for <openbmc@archiver.kernel.org>; Tue, 21 Jul 2026 06:12:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h46VD6jNyz2xqJ;
	Tue, 21 Jul 2026 16:12:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784614324;
	cv=pass; b=aEwj58B5sda0SohlDoz4Wtv4XKO9k4EITAJ61hboMjM68HmuGTRQaQRQVlnlLsSqWLj+yyem+7llKKJb0RjwwUrR7GAJcvdLYwt269T7m1dLA4K/hrxB73qzCt58DdjA04hyaVTWZXZxOTvmPmez9C2/rY7TEpHOdNXEFytHKD5GsFL5p1ZOMxcIVosYQekYKL+JwfNXwuRSPUYKkt5/KYfevyoyfHauWecte0BJT+r8tkLRr6CBhcSQICibTijbvnNn7nQ7hMmazbV6ObImL1Pr5ayZDmEITO9fGLfIFDU9dthG9ITm7yKNhhoeF8qrFRZo4l3t4A0Qao9PgYSYmw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784614324; c=relaxed/relaxed;
	bh=YWbVT4HaF5hzg8ny6nHskhZq7uqhQWrO5ukFHmc9paw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=APVobmbGdh9A9S9cOaVH8X85f8Dm4EWER3ix452S10apESgdIXIxK17l/Og4AlUH5yP8qcbgw6qfkYRbtWCSvEd+EBoi06LpJHZyPrPpul9sxt7cm8SnuF9hM3NOMOQvGLAOkVx7xC5tl8uN1zhONsyaIFHZ4HCTAG5+/51VFJh8fFccrSNWO786XNl870NkkCvCJtzdDYhyYLkli1GDAJlz0W14FL4FKYqiq4UEQ7ZqmaJXSP6bsZveDNOnslJcM8szpHtm0og8sWwYt+es6EbfxIrKo6G6nNoELzM0ecQVxi3YxzlyEcavJhzoFhwhC6n1BP2ecT4pq2nmqoSJWw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HhO1dU4T; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HhO1dU4T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h46VB3tPZz2xjd
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2026 16:12:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQIxsG5YkDv5eVRUWPfX4ogKZtMMIg7am7xuvz6iTHefUw4EbPPr8pmMlRb9+9Ft4YTLYDW+yd2A5r1Cuctyd/zqUpg56rhCwahZtIzs1iutWlGj4REyso96s4+2Z2UbBkHi1ngjTjVrRw+HwkY+SgTwhRKDh7eQohp/UmZkbfrq3lKTuZKFrDd0PXRs2jIvN9JNYPiA4TdT14sipu3YZmrGElt+FKsSCsYU7I3whICq/kMMy9uoWOc5iDLPQl5Uk/I56flKPRQ0quG4r5f0Ib0rjbEpQ0J49E9apEyiCW/LzLrYp8PeDOs1Nh7FQAWm5F3QSKuwxLyY27VntE7LfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWbVT4HaF5hzg8ny6nHskhZq7uqhQWrO5ukFHmc9paw=;
 b=PNj5TPJVpfMAH9lSPp5I7qWA2kfpeyL92W1Oqp/GzwabXefFc9gHgppO6VJoldV1HAVXuxyOnbVzuIb9l4avMGFaKb7bn2+F/AfLRVeEvN7haylKmLy0BEPkOQ57pto8Aqh6elee8p2HAh926aZxmJgzTFB+1J+uH1Br0FAzGVyI2lvDDk9ReIXPJBSlY31WQn6xB+9SX9Om+coSYSbLAmPaOa1M4DAoEIKF8/PoL/Iavk3URy/hXvWZLgvsVGBLzT4LoY1lj9D+EVlJuuRySAV1f0ntnbX+iHAhCH4632uXVIII/OYPVqLQrOJs8YsvAUfZ919cGOOxauMNEZCH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWbVT4HaF5hzg8ny6nHskhZq7uqhQWrO5ukFHmc9paw=;
 b=HhO1dU4TmnR6DJ5tChgIOrOuIpc26+hb2j8Io7247bNIaoI9IkjX6ZqUWJ5Nln8hmIA9uMi3mVPYxr3Dh8W/0NZ+wq29uKutUaEsaLT3hsO6NMvJERR5KcO8v2yRqwblcuH+AevCxet3eMCDD2goyTtphMQ9vuOAcTMTI4yNpQVgIaVCLEkqmXjT64x00Yuu0Cr1M9UgSfacmfdpc0sglytynV/MHXLd1do6Kj0D3+txEHzQfz7eiJtshdF4PRrqXn/RINLbcJKN1g9fznEzhDwLyGan4kFnkPHG1Hq5AToZ0zqS3PIiNbsRzvG9s6H4/1e3dTVQ2LB+A9d/ufhscw==
Received: from SJ0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:33a::18)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 06:11:30 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::77) by SJ0PR03CA0013.outlook.office365.com
 (2603:10b6:a03:33a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Tue,
 21 Jul 2026 06:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 06:11:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 23:11:15 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 23:11:13 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.18] HID: cp2112: Add fwnode support
Date: Tue, 21 Jul 2026 15:10:50 +0900
Message-ID: <20260721061050.1407186-1-jackyhuang@nvidia.com>
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
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b896f1-c653-4042-75d5-08dee6eee7a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qN72FIhZeaiGCtohzdsjyMWTkXOAjHG279gwyT7MoEz4c0aw/kZhiv/38UHLbPh2AB0E/ZNIE/PdKPkS0nzmPJ39kYUadO4+avCl7hAymmsLfX7+4KIqo8G1nSAwLwX/k2ajNECYhhASiEZv01V+ai9UpQ4UmWLQJgvDtbIGN9igjjWujK/AJa5hARut08LHNshCLuElkut1up8fufx8LeS4TO3nZpDP0a6Uhd7fro8iwm1b4n3tMW5B9YMH9zVB7keTGzDESCMYzS903KuNCIyTo/ZpiMDdOR/atn/MG6FqzZH/53lx5HoYpDAfMSRrhAoRReKKn4Hg8Lf7VnPO270onlUrS6TP6N8S/HYXOvLWdcG1c10m45rd9RmR85z4pcM1B/X3BVk0DR3dLrJrECQrVmcMqryowo5lLL3tc01tG6b2f3yYK4YMhiJQWtgZRNIfhm1WCy0Ps3Nb4dcwu3JO/bdtvmDwAi/EkwMnYaby1SarFTs4UcYza4ebeuf8oNfaFAWXOrvT6OKDSwI4ql4ZEihOrpF+nQEYnEfHWrpWD8Zlr8+zIrwE0vXRFUHqQ+RmRPkI0pdwmvOW5IjivkdDRebIqf2ip/kZ/jeZ6I9zcMLThSuwvTiXwZsRfuRiu356w/9x0XjhxYGiTdjeX42rqMNwK/oMyCGCeZoeztd8bR65r8SpBCGtwzhHLOfh
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QFkEwx46I/OTUmg/XJIpazER4X/EsHNV5/O80jjK14/sYQtYZCh/OQGbwn8zCr6Kb7UA0P/SU1cTKwTRMBdWdUgYJlO9YyJ636fdZv4lwEfXz8Qj+xZWjL1fBJageNCtuxU/t1rYSpyfz5GrJbupbOt8PF2sOL3/fkEhyoNmXzI/dXN/CXMov1gAuu7Hhz+8UJL0TAv4ziMd4HveiBmny++EViteop/rKfpfPpRgKbC+/0as9bF0Cb/e1zZNm0oQ0yhiQfc566WoMkZWx+My/g85FrL1l197Y2W0ADQhmVytuWNq0ilugg1lUgApXgz7KkgxiyvIIdgaFcKI1y8rxfQgu+yvmHAc4BL3RSDusJbHz8ETTA5XljkJuIEeZfTGh4fkPRHm92LfoV0SN6lTlt906lJFmCwzXRKR8+nf8LATHrm/n0DWVWRAsGwKR7eJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:11:29.5486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b896f1-c653-4042-75d5-08dee6eee7a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

From: Danny Kaehn <danny.kaehn@plexus.com>

Support describing the CP2112's I2C and GPIO interfaces in firmware.

Bindings between the firmware nodes and the functions of the device
are distinct between ACPI and DeviceTree.

For ACPI, the i2c_adapter will use the child with _ADR equal to Zero
and the gpio_chip will use the child with _ADR equal to One.

For DeviceTree, the i2c_adapter will use the child with name "i2c",
but the gpio_chip will share a firmware node with the CP2112.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Jacky Huang <jackyhuang@nvidia.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
(cherry picked from commit c0be05f68a2145d566a44805f22896f141316cf1)
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 drivers/hid/hid-cp2112.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 803b883ae875..e960fc988058 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -29,6 +29,18 @@
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
 
+/**
+ * enum cp2112_child_acpi_cell_addrs - Child ACPI addresses for CP2112 sub-functions
+ * Note that the enum values are explicitly defined, as this defines the interface
+ * between ACPI and Linux
+ * @CP2112_I2C_ADR: Address for I2C node
+ * @CP2112_GPIO_ADR: Address for GPIO node
+ */
+enum cp2112_child_acpi_cell_addrs {
+	CP2112_I2C_ADR = 0,
+	CP2112_GPIO_ADR = 1,
+};
+
 #define CP2112_REPORT_MAX_LENGTH		64
 #define CP2112_GPIO_CONFIG_LENGTH		5
 #define CP2112_GPIO_GET_LENGTH			2
@@ -1208,7 +1220,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_device *dev;
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
+	struct fwnode_handle *cp2112_fwnode;
+	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	u32 addr;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1226,6 +1241,28 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	cp2112_fwnode = dev_fwnode(&hdev->dev);
+	if (is_acpi_device_node(cp2112_fwnode)) {
+		fwnode_for_each_child_node(cp2112_fwnode, child) {
+			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
+			if (ret)
+				continue;
+
+			switch (addr) {
+			case CP2112_I2C_ADR:
+				device_set_node(&dev->adap.dev, child);
+				break;
+			case CP2112_GPIO_ADR:
+				dev->gc.fwnode = child;
+				break;
+			}
+		}
+	} else if (is_of_node(cp2112_fwnode)) {
+		child = fwnode_get_named_child_node(cp2112_fwnode, "i2c");
+		device_set_node(&dev->adap.dev, child);
+		fwnode_handle_put(child);
+	}
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-- 
2.43.0


