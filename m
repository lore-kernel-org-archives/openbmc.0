Return-Path: <openbmc+bounces-1894-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B6ECD3427
	for <openbmc@archiver.kernel.org>; Wed,  6 May 2026 00:11:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9G4y1JVQz2xmV;
	Wed, 06 May 2026 10:11:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777963004;
	cv=pass; b=Am9JJnSO/4wmV7EaGMqrQ3uBT2ua3jem2OFQJxBDk6tcliXPtFPIkRcaC4SzhaNwXwWTu+znZNxpxG4cRzjw+Yg+x86HYckHT/bXnVzdXvTj9qd54BIwjcZLZBgdhUoAzNGarfUuVncsfGmq2A55szobO4oeBTQHQFbEYf+DWWpVDo19FwA06B2QXQnxSmmi75B2/Nqy1DdZSrUoW5W697kW8WlSJ1ppqgYwiIRIFNhmF65j+nCBiBigv1sw2TG+bkUHqicVWl0HVtZTYe9o1jwGUXrtBZ1pWPcN5Y2WGVWwMGCFQCHZMyS7aqZNC1fATPefXOBIMP11oqxq9YlkzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777963004; c=relaxed/relaxed;
	bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lNleeF8KGznxgtp2HtnVJt5QH7Q6zXZAMDFYUQhY38M2ZGxpbGSZ3zow1v6TiRNiQTJl8L+eMKkN9ShfMNQJopNTXM9Dw5jQ/UZg4xnDsz7WfxRRxh+9ibLNSi570ZuI3WdsKZzs2KRMxE+fyKkeQI8sqJ5QTio3v5F4mwfDM+3eTUc5UzQnyeRf7mMy/dRvBfwx3dvopoGBDnKL1RBlOahCfffvYN+XyNjeMlO8XrVtoJmMMRs7awsL05wbfteHAbzeuer+e7LP/0pOKBDwQxUHtk8b3hc6o03tVqJzml2pdnXKAR/Dae2OSSMeNi0IEPhCI1l3LHaKv2nLeTUKNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=if9Mz3LR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=if9Mz3LR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g8phB3Qp2z2xSF
	for <openbmc@lists.ozlabs.org>; Tue, 05 May 2026 16:36:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL9Q70JkoxYXAE0IRJhyX2ezOEy2nB8wLpgzgQJb4dYshXAbRfBwd1sOeLLWzJV9TEQbTlLFfKPkTotwDJYUh4et6sKUJgWgzPGqkZoHaZ4vFlBdhmKHIWEm/Z+20F3IxWXrUKx6eDtdgQ05l67A1i8CJdK+4P9Wkw8kv+IzQbsJfFEA14vym+F9462bKcC8xI2rJRYlx/JQ1y/AyAcquYQZIVy43Q+yFRPzA4KV59AH2sdvGWprZGMt6VIQ669ylWMTKQgWumjng1eOsj56TrqPDCOKzKwhYApAo3SAFnSBvxQR8MCmO1k4+S0cXIKCAH4itjXSoUY1QuRW0H6zHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=;
 b=o3qPmTMCGBAU6eHs4/1ojpWZyp8CJwCvo9Kds9B9hcIYBd49Z3PIb23Vw8cD89m9gQ5EEdum8qXEvKox+KA0tAmrmOybVDItglNQ0XrofGB/yg2EqXgpdFe25mSFcSqwNzEo1L5rTGl9wgfn+RjeM/s5twt/gOLqtVscLiwFbZUCEjKI6fhcvLuiZDafNgShupj0PNkuQ9cFO8hY+dKw2Vssgl9b943dAGkycgYTaGYR3wzr9FFoWC/eDBBv9Xv9jQ23BWAEvoD/kB3KIfjgmLRtvBJzQiwByQbKE88AW3hpL6ua0QHYUsbZXRjBtV8fsE7cUdCVvWRl8ahtYEyYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=;
 b=if9Mz3LRqDrafUR3EJ5E9WemsHShe7WMXCxsHYNC04qTr+V4tG/6cHm+Wsu+V6uEQp8dJtvsk1sTUYWLy9JpYhWzS5tQCjuszng04jX6b540Jt09ccQnRyeRckdD2fzYsJqwKutMadPKhIcLBZOPBvDY2ZmY5d8GhMSfN/859OlKdIrcuP7+/n45Zo/kSpbR8JvTMbHbxquqTtXvJ/fnoKnQdsZx2uysmrsQOTGxgZ9yamI4+Vx/ntutjSEPNpTv+6QS+PGFQcXVYfXBbd1P37R4qk3Nh8ScO7X6Ugi1/34au4Q7OCcjBoq/uvsPUzIAE/JMhYkq8fOXF5RpHMQoHg==
Received: from SJ0PR03CA0279.namprd03.prod.outlook.com (2603:10b6:a03:39e::14)
 by CH3PR18MB5572.namprd18.prod.outlook.com (2603:10b6:610:1a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:36:15 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::6) by SJ0PR03CA0279.outlook.office365.com
 (2603:10b6:a03:39e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 06:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 06:36:14 +0000
Received: from [127.0.0.1] (vm-swbuild01.axiadoRD [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id BD7214186B51;
	Mon,  4 May 2026 23:34:17 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] i2c: cadence: Add support for Axiado AX3000
Date: Mon, 04 May 2026 23:26:42 -0700
Message-Id: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIAKKN+WkC/x2NQQrDMAwEvxJ0rkBy0gb6ldKDIyutLrax2xAI+
 XtFT8PAsHtA12ba4T4c0HSzbiW78GUAecf8UrTkDoHCjZgZ424xFcdIRCgxaRaPgmD/1lraB6+
 jCvO8LDRP4Du16Wr7/+PxPM8fxiO0lnMAAAA=
X-Change-ID: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=syang@axiado.com;
 h=from:subject:message-id; bh=w4ac4Qg1lZhwimGfZE2ipoFsuKvVXSLnNmXVnH7NO7k=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyf/TceGzzyPtESnPztglzG05nz9DXer/A448RdsfIX/
 wGODTN2d5SyMIhxMMiKKbJ81fmWfzJX+17n3pWlMHNYmUCGMHBxCsBEVscx/JXrTjsSKH6pf9VF
 3umnIozW3LrQqntsSUPoCmOp9YXPc+cz/NONUdxyT0PpT1hHTmLsyji2ielBt/7ZRtrs3tWhav6
 3lwEA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR18MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d2896b-53c0-4489-83c7-08deaa709b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|34020700016|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3jmOZ+M/QBRgBVBOQ0qGyT3lzcKlkSHqpG+X8rYq1ye5L6WlECudC/qTK0JW2oQ02PwMpKxv48BkRuUJ5psNhMuW3Iz561BzZWxyL++1X9JkrePdYjAN/2kyPgDM4IGkXiYwetV8zjLBC6diXv6cnIhsSwiXvA2OB2W39fH5jXkaDoCoRqZj8nsfgrAkRrOkkkQkE6ZBXYwSptumTPJxA8cE9q9JOhM2KDVg7Kec54qYonHMYeg14AzMFJqJ+ZevVzGFDegpI5CVwe86U3S2jgFA01TjLRCUIkAQOxNKnbHAB31Z19Ya65HbwjgXTcAeawdVazZyY/fGliu9zCSo4zJyQztbqZREASsrheUneS4yvawWiDggfmU/T8/ihVcMlYcsOKpYRs5FunEQudqCuSNgVfI7Xnsq2e+0MvPQl7LFzwllZWfMO+QcuCxyLpwrCkqX1YOqhHkD4/E/LqHXFXJXlwb/1tpASDviE0WyzSHmOR3MStxnUefo3ibsvZzNcvJBtAFz+mKUi/W+eMEJ7B6vg1jciK3dhPD/aJTJXhfAD7GW/pHe04aG4IL09sqQeu6zcibzEIbbCmk+gTaamj5pTz3TRClbj3YMxtD594as8gwX75Qaq3aBWW146rzFUg4bDR5F/stnNMZVUe3Mbheeo3czdR1uNnfXc5352Yt2ayhzFWlc9yFh1Rj1eNVL0CPOou4uUNYInKaFw9/1HQKzS9XaTtterHTT4P7FlJg=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(34020700016)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pZ7nuFoPbVrk6Pl1CPync5muh/mLYFX2fMvDdk8SN+okguA1BwDvYK+wJgxxHhCx3rX6Gm+Cv8s/++YVJm1nPkI6nseP9wz9wfmnWvLRlnhc12P8SwycD5x5ixWV194TBoYb6Q8YfeSJPYGoTDxSmVq3tkp4Qm7/Ipk/OEKOFxp2157hsPd/HdMtjPXThxLBkvDhiv4jDvBGkSKFLI9K2pW8CHj8t6eiTQyc6T2WGkiK2O66FDJzRzQfGhlJDnTd6Vc8xMDJq2EEtX+ABzH/DcbZiTSWR4OFjL6RpN6OzB0XVr3kBZX0lpdNFkPkEXn4KaOREfGfL48XwNY35VXDM59A5E9F1TxQVZe+ISebGskM5L8A3OL5fOV6ZinXyeES58G5QmyhArC8VSAcNQxSCAmCBkcXhtq4HsJPjEuXZ9ptpXCr/iRnTWuTqkLDvgyk
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:36:14.8835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d2896b-53c0-4489-83c7-08deaa709b28
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5572

This patch series adds support for the Cadence I2C controller
integrated into the Axiado AX3000 SoC and enables SMBus Quick
command functionality.

The Axiado AX3000 utilizes the Cadence I2C IP core (version r1p14).
While it is largely compatible with the existing i2c-cadence
driver logic, the AX3000 hardware specifically supports SMBus Quick
commands. This feature is currently disabled by default in the
i2c-cadence driver (masked out from I2C_FUNC_SMBUS_EMUL).

To enable this functionality, this series introduces a new
platform-specific quirk (CDNS_I2C_QUIRK_SMBUS_QUICK) and uses driver
match data for the "axiado,ax3000-i2c" compatible string. This allows
tools like 'i2cdetect' to properly scan the bus using quick write
commands.

The DT binding update follows the recommended fallback structure,
referencing the 'cdns,i2c-r1p14' fallback to ensure compatibility with
older kernels while allowing the new quirk to be enabled on AX3000.

Patch breakdown:

Patch 1: dt-bindings: i2c: cadence: Add Axiado AX3000
Patch 2: i2c: cadence: Add support for Axiado AX3000

These patches are expected to go via the I2C subsystem tree.

Feedback is welcome.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Swark Yang (2):
      dt-bindings: i2c: cadence: Add Axiado AX3000
      i2c: cadence: Add support for Axiado AX3000

 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 10 +++++++---
 drivers/i2c/busses/i2c-cadence.c                          | 10 ++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074

Best regards,
-- 
Swark Yang <syang@axiado.com>


