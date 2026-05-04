Return-Path: <openbmc+bounces-1887-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D124BCD3427
	for <openbmc@archiver.kernel.org>; Mon,  4 May 2026 23:43:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g8dWG15P0z309S;
	Tue, 05 May 2026 09:43:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777858756;
	cv=pass; b=SJEaUI6s/lmpdc23DzoOHMylx07kSne5f27lexhFnJHzNxZ8QGlCx43TyEpdQ9AJRE477nAk4PK4rbghEhZjJLGHVoBSSDYicUUxUM20rJUXRr/ZkvU71CsV9YSCUl0Q5gFgjzIfDexVF8B1FpXFYnQ0tpDWdhjU3COyNpvDhhg4lB8QyTCHsEFB7S0yXGuYgtEoyGoYoWjoGEzfFQabiceYuo4OElgGOILP1d2p4I84tQ/MBJEuG1crVh0mxYFXTKniLM+c9rZUfBKRkZa2sZpY+C0k/YNljY9qw+8ZQQRbxS/0ZTGEIiyiIY3y+JfjpZRlo60ZA691LK3eaNdraQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777858756; c=relaxed/relaxed;
	bh=aesD0p/lA1kZ9s0tzGCGlDJghkQwnpRiDW4yP3Kux6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XTXFMUNWOQs6KZHhbsvynhADjy8eYqqNwWuBq5tuKWxzEGd2SkB5ohzuRmhWz1YwPHkEPEyRwzoEU6RUYjwe6FUoM3+JtSR8wCdG9U5ttYWX/0fNT9RjKoZHNBRcI3eAH+K6sdJAVUdGgMNIbdEuVtBcPXRPJFOMv3nrB+hF4kxvHVdOjfxEsRzfHctwcD/xJvaQJBaPLr/mkW88dtNClhpLWvxS/ttkJGmxvWSiBR8UdWpkkxVEVgTkWLOPl5kMoDelklWXEMVoHD6Wjpe+KHR43tqD2DXkEx1ht/pbtfOSDq6qeCF48KYGLiNduVSsA95UWEoA8izywvyecGo7kQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=GwtaTBdj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=GwtaTBdj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g847Q1RsZz2xpt
	for <openbmc@lists.ozlabs.org>; Mon, 04 May 2026 11:39:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfOmTIVJO2TTfEvm+iqAJokaISerUCZESDTOQTeDPmoNHXI1l/8Qod001f0ibaZbr3Q8K/82w99H1BCDX7hR4WXumOYb8wY5+MbYaq7PMBQ1vuw40wkbukC/5Ma+arzbObKiMiiw4jSqrf/II05+G608DA0J/JJ4BG5u8hL8oYzSUD+H2OVgEMgPraIS849mE93OQ6r4V3ijVDrLaVOh9vnjf/YUR5GJKd9VzaifJ+jDbOySVYtoZ4Tia6oozgP6d7av/jhIWXAxdi7QiPSH/OWazqYyScVfId8FPx9MBbr6SwXSwafzguKfqQVm3SgcPWwgpZ3hBP+mVGf3pDiXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aesD0p/lA1kZ9s0tzGCGlDJghkQwnpRiDW4yP3Kux6U=;
 b=o7V6Yg/e9HcgzX/dOPcHye8GGXHGUPlZ6HudlYM+bIA8ZcwX0APuajMcS3u3BgeTsqOMpNByDPE69PLcW/FRN7FIe7JALcL64nv33OPivXrO86RQSHsLYgSz7aQosR+zh0kjhQ1bRcYk+OMouaFMbjLNoYq8RD60ACAJD930MjgRAePnD2sUPJcwWifiT83rNsMKtt/vgV1nJdiEHRwhfgWg6sh4K3KBmrIhj9AnyhMEwfVYlMFZCZQQgKxD0f41nAKUjFDI+KSn4U19/eH5GjYCHNl4VpKFY+sE2vlrP7lqGfLGobhTbcr1+moRigkgER6vOBdxV64REg+HopgVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aesD0p/lA1kZ9s0tzGCGlDJghkQwnpRiDW4yP3Kux6U=;
 b=GwtaTBdjfYyXMPG2sM/22qRPboSbC4J3STSM3Rirp+9SM/SdQoaHjTyja1SO88yjE1Pur8LwYLnVzqXET3GOb+HotYoOwUq6rLtkUE/b+5y48g1X3QxWNXfBPMTfaRVmGOS2LoO/fe6bi+NzqMBOFg22tU5bs/UqeCcPkbAop84bBP7AdYF2FVQlWOs698CY0GXmu76Hj3nY8xc9zGkxYnvWpnjmu9mOwFbkB4dcxXmJ2GmyAdz3ZvGPODw74ZnGKpAV9PtHU0/lU3zY9IeuEqPPst4GmDAgP+j9kwYJXuFhr20ZwWgZ8ZY7lIWQM7JCto74j4v+GxUoyQiPCHI2+Q==
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by DM8PR18MB4456.namprd18.prod.outlook.com (2603:10b6:8:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 01:38:47 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::c0) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 01:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 01:38:47 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id BCDBF4186B58;
	Sun,  3 May 2026 18:36:50 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH RESEND v3 0/4] Add eMMC PHY support for Axiado AX3000 SoC
Date: Mon, 04 May 2026 09:38:31 +0800
Message-Id: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
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
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2603; i=twei@axiado.com;
 h=from:subject:message-id; bh=P+30FVp4nPeC6kaOvtSRDFhDx5m76GXTDCI+dK1IC2w=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBp9/il1jXCLElEpZf+Gb6uKGTbSachG0aP4g+Mj
 gt6XHKnGUuJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaff4pQAKCRB4EDBdxFrx
 17icC/9MBLIkI0uD6jbgpuLEBTwPLemhARK9hJPkV2x6kdPYYN+UdYVe8ZAZ0JaNJDJijf02ED6
 5edEovxceL017dzQHjshSScH4lRD5zGlZa7gG79+nvzSfersq5UeVzqvMSRZ5xZtVZddOTvPjx+
 zwVAPgp8Ra/9Kc8jyve0Rpi+FhAR7m8cZ+MvSjggP9XC+HsO9nu2GskxRSgOxaUJIaeF6c3Hg7n
 CRiYUBltZ1fS7+GoJSOApD7Jot96MU6olchVHQFMTTbo+KWsmkd3ev7GGBD8VSHmwrnG/H59wFr
 Z8gEpjHd7g6EtsGRugf4nKrUtJ8mqOiKLrXji/Py8Q+xcaHx+ULE00HBB7YCH3lzDPk3ydoMS4d
 35INyrMA2jh7nyi5dr4Pv8/PLoJg7G3eeiimg0/tcMlBqiG5BG5E/2lYOBq1HEuc0J0U5nixLsD
 Da+E5jH+/G5bvKJgYR8ZxEA5ICeEXXD9wOmi1u+kfYtSrwuLTdKvMux6lbNsJGt/KrZns=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DM8PR18MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4ad101-6b1f-4249-1d23-08dea97de2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700016|82310400026|376014|7416014|42112799006|1800799024|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+BnIcZs8RM/GY2/xv30vcY+g8wFGtJrnBpdtwTsG6lnCgr7OWnBrBghDbQkIaWTqlgUhEvCQzgMuDx+z6U4hiHps1xVmpx3lEdsP0g19oMdHCfk9ipACgl9cUAdEgJtOb3xyeQ05X//jkTnW18uNQJDsnGEhRV+ehzgDcqHYbSiCwV/ie9oiu9eapLVlv6WFLIYT4bL1oUyg4hVrgxGabNiT/jSJno6s7/JGHF7YCP4G6k2CGbZvk+QR6z/+FFYNmmDjIyDJsX67HBqjNeaL4kwbJGe0TzEdmFU5WQvIyQipeXXNwO37NxQ2SkhoKlRS+Nc6S+kGAHozVbTfIiA4ZoKGEQ6+8LyA8LQph0zxKKiYXTWo5aNfL8WQsqDzAYBJuqA0gekxCRss3WcKRsyaKyHokukQe0f98R6FzbD2tQTUxygDl1R+pKczHVouMvzrIlVghTvxCJMrC4N6KFYHY3aDUpO2/ohS0+5v+Vttbf0/sk87fMnT7tKEuK/bkOpFlyQ+kDu/Uctwpis8YiTuVYmv2am0Kgm7dsstMKB3R7h/Qy5NitKP+eS2esQl5adSA0BAv7KrGtDLjEfcPZ8e4tk28dJIeFGYk2IxFdFrtAOKBlZT+t/Y7uGsdaF9uSnVEeme0Fd/U2mvYU/1Fyg/AgdNMsM0gB8cXbm6imfN5HM2ZsELSiA4DUjVd/2UlYp36BaPlHwSRnJd7KbiUBK3RhsADX4zdWMpBFx4b5LNd+k=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(82310400026)(376014)(7416014)(42112799006)(1800799024)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A6McEbMudY7Jx7vn3x3dkwD++NaA8BNqpGMAPga1ATRagtLbG4MjwIoBz98UYnOIzcBGzyflCEJRh7pt6iLsEK2Advj4JF6specFz/ESskaQeNFt0k0K6PyMs6xGkdw0956Kk19PbIzAAvwnm813PexNjvCJRg+7PMyWW+5Za3Jvx6Ne83k2TGv9orIwg2g6gMEd1Gna4y+rhDyusCFW3kqojA3gnhgDipgMl7QoKmt0HdHl5Xh+61mesPwIfbeHRfCc5ep4hPnouPMyPIVJOrKsMDatKQOiTTR5j73zTijJkP2gHTUIFEWdM6E/gzEnGNMVqbrq60qaa6GRroygtFHpSR0QbmK4Uz2nurBpE1M6Opt5xXxgsXCk7U/TOp85zFZxHkvy65L4kc/6dAvIPeDeqHH47BDvlY2cj9DTV2MrN4+e0os9Dnjru+qm5uNw
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 01:38:47.1573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4ad101-6b1f-4249-1d23-08dea97de2b8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR18MB4456

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC controller.

This series includes:
1. Add bindings for Axiado AX3000 eMMC PHY
2. Add Axiado AX3000 eMMC phy driver
3. Update MAINTAINERS for the new driver
4. Update Axiado AX3000 device tree

Changes in v3:
- Update year to 2026
- Use lowercase for addresses
- Remove redundant macros and use GENMASK
- Implement power_off function
- Link to v2: https://lore.kernel.org/r/20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com

Changes in v2:
- Fix dt-binding format
- Fix compilation error in m68k
- Use readl_poll_timeout instead of read_poll_timeout
- Link to v1: https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com

Changes: (The previous version was mixed with Host driver, so I separate
the PHY driver as a new thread)
- Fix property order in required section to match properties section
- Fixed example to use lowercase hex and proper node naming
- Removed wrapper functions, use readl/writel directly
- Replaced manual polling loops with read_poll_timeout macro
- Used devm_platform_ioremap_resource instead of separate calls
- Removed unnecessary of_match_node check
- Used dev_err_probe for error reporting
- Added proper Kconfig dependencies (ARCH_AXIADO || COMPILE_TEST)
- Fixed various coding style issues
- Link to previous patches: https://lore.kernel.org/all/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com/

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
SriNavmani A (3):
      dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      phy: axiado: add Axiado eMMC PHY driver
      arm64: dts: axiado: Add eMMC PHY node

Tzu-Hao Wei (1):
      MAINTAINERS: Add Axiado AX3000 eMMC PHY driver

 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       |  37 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi             |   7 +
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/axiado/Kconfig                         |  11 ++
 drivers/phy/axiado/Makefile                        |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c               | 217 +++++++++++++++++++++
 8 files changed, 285 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


