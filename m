Return-Path: <openbmc+bounces-2410-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15739C5DF87
	for <openbmc@archiver.kernel.org>; Wed, 19 Aug 2026 00:01:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hPmvJ4PCgz2ySm;
	Wed, 19 Aug 2026 10:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787024087;
	cv=pass; b=MkHA6L1Ps+/pG4L+joCqHfBgludX7DCUpvkoujPmxlKg06BPB2dq4Dvjm9oUn3IFZY/XKjD2Br1+P3JmRF9cuqZKXCOle2nDwaErcir3MWPJnLtFWe1uY/PVpZRKDM8VEYBAxX0WkCVAoZ3MyiaGDBZVUDSTAV+5XIfoK5gARkYeestDZhlzEaJixn/Lkv4gAJzZUGINFmT5uIBF9GLNM4PM8qz9etEKkLZ1iookhOYoGLw8d5tIKOz1c6cEJtsTkimW0ig+lmLDDPQxWmroEm3II50Jmqgoke7T0pExIBaF+aI8snWiXg6gwI4MAr/omO5xF6Rn9iRvCI7lpgSggQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787024087; c=relaxed/relaxed;
	bh=nwUN1KbEJJECXMvk6i28ZC3dyp1hGWh2cIoCP1Yh4tI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T/Yl9/+/Hj7q1LUQ6WC+Apyqs6vMQwW5CTJ4H9jdIi5IZFg97/S8EpNPZuGXJPd7JxjAy/Sj4uctq1Gu+PXIgFGfjI7w8FuYbSRUK1h3XU+nyFuxf4JlReTrUjG597+gs/VHcofFr6JYqj5wvCoaBuMzfDa/Du3oqOiTaa9SRqTgXWFXULdOynsEryuQSGYDY4MB5CbpPDrJSj3XEIDAxnSR16B5xZRqcfGPghbxlJYPjBTtOj7kZtu80gHluyiMROmRbtSEk3SyipzrsvAX1ACgCDdF5gI58HYX7juzaafkthSg5mT0oV33zsc+NSq5pOHv5taN/gQSAjT7caY5JQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=BvwcclrT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=BvwcclrT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hPFgm0vK2z2xxr
	for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2026 13:34:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukJcqsSz6vewoPgHJnuCZ5Rdc4p7yJya4tPUr07EB0GXKhIdwXUkD2QdnJ3PMhRqDrn7gDU1gEwGtz1yaDHQ0HYz1PyPatHDjXzCROpsM2y0/Lko44BX7XXOo2lvQ6U417TArRaAtBzPl6zK0mrCscsxZQPL6ByG0cArPoJT31czwzYsmYfGk1Ky2u64TJkcf8JFLH3nK38oYTGjFmCtw7mATIYVCmYADiTLXx6aFItOeaIeHcdYdhdgXeNouQqBgZP9eUVUgobc+XMWhhh1sCui+GJ5/a8LyPiWuE0lLxn3YYKu1dG91Cb/PqcBKgDOSwB9ug6j9RJoe4Q4oFbYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwUN1KbEJJECXMvk6i28ZC3dyp1hGWh2cIoCP1Yh4tI=;
 b=kWETSs7q1Pr8adiumqCj3L1wQMyBm/Vfa/83T1uHhZ2uOc5GrtvSF0DPmdaLBExIJOZIIGs7Uqbvk4+kiQKFD8SReouMyNXUrfcTtWEjPaci9WkRxlbYonFGNJZLLYpVnO0WXQRopSIY8KXxluP9T8kVEiW19JO2CSXyCcO7/poOWso2zb4Fxox9YJS0AxXjTq2ot3YB0SUp9ntREbFDeaOE6QWyuRZoYV0ECie+AWyBfIYQXnfrvbuFI2/d425CFn1G/rzGjyAXBx/O2BD3CK1pYRtMb7tJCnyNCNDqpCQf56Qp9a0dBEhzyshZoyM3fRmXjUBlf6QkLI881QBz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwUN1KbEJJECXMvk6i28ZC3dyp1hGWh2cIoCP1Yh4tI=;
 b=BvwcclrTqjVXV4i+uEgowA2Opvq4PJjfV6RdRgnhjLUqNHmu3R2BRiuzZqSbi856hLyVm3VjDCP9woOvcLNFqRxPUBG4iZPcv+odtxn8o22AvK4096pku7F1UEixsUcQ5mpKTLPdNqAsafH6mYJ3VYtKSDkq/OjyofGvThPDikcD+zhEN4Dnlvp+/ajUvWQAvcL3TkwO0yvUy1vqzw7OVxyRyiBFZl93s8mU0tLWPULPtj/kFsudk3a5q7dj5KeyE+OcvYrgjWeBmEpfVybzXUa9cAXP8crNxY7ya4jHJN9jpCNISVRj/wYeWmxlr5lAnkkLrBI9k32fYScRVF+/QA==
Received: from BL1P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::15)
 by LV0PR18MB927482.namprd18.prod.outlook.com (2603:10b6:408:344::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:34:14 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::91) by BL1P221CA0004.outlook.office365.com
 (2603:10b6:208:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 03:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 03:34:13 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 090E34186B53;
	Mon, 17 Aug 2026 20:34:13 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v2 0/2] mailbox: add Axiado AX3005 mailbox driver
Date: Mon, 17 Aug 2026 20:34:06 -0700
Message-Id: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIAK7Sg2oC/42NQQ6CMBBFr0JmbU1pBYor72FYDDDIJEJJi6SGc
 Hcrxrh1NXnz8/9bwZNj8nBOVnC0sGc7RlCHBJoexxsJbiODkiqXhTLiMfnZEQ4CA2Nr49FSZmJ
 Avtc2/GKTd4RYUNudSohrk6OOw266VpF79rN1z128pO/v11H+7VhSIYUp87QudCa1NpdP4djYA
 apt214IUwSr3wAAAA==
X-Change-ID: 20260728-upstream-axiado-ax3005-mailbox-upstream-86feaa7edf49
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4189; i=syang@axiado.com;
 h=from:subject:message-id; bh=iKQc17Jp3iv4U4HmRzk4Xaqf5tZZiBnQ0bjtgB3B5ro=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqzmS1tqhA7KKO+/c6y+4vi+PEfTbar/zphl6VjtUfD+c
 UouKLeso5SFQYyDQVZMkeWrzrf8k7na9zr3riyFmcPKBDKEgYtTACZy4TLDP31JRlnlhV/+h3rn
 VkhcPCLMlb9gsebkC5PvaJoXLv++yJaR4Zh/jLjBfMml/+L29M3b7KGtIJynEndSrdR/8tS3Z5P
 f8AAA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|LV0PR18MB927482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3433afd5-10a6-46fa-7a5f-08defcd9933d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|13003099007|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FUIQLgUnNos7NVR3R2z+K3il0Tby2dKyFqmFJqLTAmX1/YONFFgYcLaRsauy8ELeHymORle0V8gV+sawJ8MFhRhRHuVfVagzFt8s72X8ZwKHQyFsg5x1RfyyIk1ove3/8IO0FqtUtmVcCSL1uyLyQqCUapoStCU+3eEVG2hmLLnTOsMfA+qFDBJdEOz8j5n/3E+vjIf1Lwk9lHP4GXQfWZ44aiWE8jZCelDpnzC8TVs6hXMz426J93AqK+Pud75YD3w+pjCokIVQFVFRgUdhEtW8MnhZjxg+cnLlbZIFc3AqQotY7iL5aOLRPWgMRHiKzuVJA5CWf/5KDeQRs75JIDXwySCZrfO8lLi68k4SY5uKGMxl+lwsv5BBKfrnWnByCKqJ6Yy+PYGoKx8AsOZwT8HHyByAG8oiqjrlK9kZOSOCoVmb40eOKdARsXdrK1UXGB4YTZVvp/Q56Ij2NHWWp+flmPrM5uf9Jv1nhqBHx1xHj6Ntby1LrlYlB2jOJhq6gbhNhuv3cVXbZLyaRl7wzhrT7lcFmXeqYHW8txTbErEmhLmag/ZQUsxf76CFkGDZ/WW54rN9cTGoc/Mv/mrB41rXjT9BTFzYRXcteAEnj0kia3yF3v2sdB/vMno3dwLozR/m8jz3YMP9QmtVmqLtGfuW49WCFXaR1BbcGGlR++Ly8/rb7Pc9ZyCBXpckxVPXVoQXBtaPbihcAZ1PkPhDdw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V8xuQ7JZGndnHYzz1nhY4FIx98UQJjiGYWUjQBNUplVseEjKnyL5mJXEKXFoHpac0yWTtYOA779CXYHVwMJWjor90oRiC/PZGUs3f6Jj6Rq+3MZpaGSAF00XlLcMN7pu4f+89mFXxQuxFc0t5HR/vwZVrIfFDlN/nfChexjLf7/sHKfCPgUnxl5KjGYI2WfWNAHMWOgI3nFVpDQQo+ZPuTSxO6mDjQBGpd102nqmu8v/i8g/ChUf9aZN645Y9bA0BV5f96tYFAHHKKd/vS5yqFRHPd0Z8oPjVO9chomIIYRG/tT0GAg/baOcvJuZ6HtLVhxKeiLFFZhxBx9oeOPTffzeb52hS75i2e2aEFGHlcQ5WKcqaqkGjZWiILaIAvLV5ic0bkwvaus0eMyGr8O7HxHlsoDHLnIXu0x6cZzCLxTA7vLE9Ub72YlgCq121iae
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:34:13.9889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3433afd5-10a6-46fa-7a5f-08defcd9933d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR18MB927482

The Axiado AX3005 SoC integrates a mailbox controller that provides
inter-processor communication channels between the host CPU and the
on-chip co-processor.

The controller exposes 16 fixed-function channels split into two
groups: 8 TX channels and 8 RX channels. Each channel has a
hardware FIFO and a control/status register, while TX and RX
channels reside in separate MMIO register regions.

Only the RX channels expose interrupts to the host CPU.
TX completion is detected by polling the FIFO empty status, so
txdone_poll is used instead of txdone_irq. RX delivery uses a
threaded IRQ per channel because draining a mailbox message word by
word is not appropriate in hard IRQ context.

The ax3005.dtsi mailbox node will follow in a separate patch once
the AX3005 devicetree series currently under review has been merged.

This series consists of:
1. dt-bindings: mailbox: add Axiado AX3005 mailbox
2. mailbox: add Axiado AX3005 mailbox driver

The corresponding MAINTAINERS entry is added incrementally by the
two patches: the binding path in patch 1 and the driver path in
patch 2.

Testing:
Tested on AX3005 using an out-of-tree MCTP-over-mailbox transport
driver, not yet submitted upstream, as the mailbox client. The test
exercised channel 0 for TX and channel 8 for RX.

Verified end to end by issuing a PLDM Firmware Update command from
OpenBMC over MCTP and routing it through this mailbox driver to the
on-chip coprocessor. The firmware update completed successfully,
and the resulting image passed verification.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Changes in v2:
    - dt-bindings: addressed review from Krzysztof Kozlowski
	- dropped the unneeded '|' block-scalar indicator from
	  description fields, dropped the redundant minItems on
	  interrupts, and dropped the default-valued
	  status = "okay" from the example.
    - driver: a further round of internal review turned up a few
      more issues worth folding into this v2 rather than leaving
      them for a v3:
	- Widened the RX wait timeout margin (500us -> 1000us);
	  the previous value had no measured basis for the largest
	  (256-byte) messages.
	- Unified TX/RX message-length validation against a single
	  field (mb->drv_data->msg_size) instead of two fields
	  (chan_msg_size) that always happened to agree.
	- Added a per-channel FIFO error counter exposed via
	  debugfs, alongside the existing rate-limited dev_warn();
	  a ratelimited log alone can silently suppress lines under
	  a burst, losing the true count.
	- Stopped discarding already-queued good data on an
	  overflow/underflow flag alone: clear, log, and count the
	  error, then let the existing length-validated read decide
	  if what's queued is usable. Only an invalid message length
	  or a read timeout now triggers a flush.
	- Only flush the FIFO in startup()/shutdown() when an error
	  is actually detected, not unconditionally -- a blind flush
	  was discarding messages the peer legitimately sent before
	  this side started up.
	- Used devm_kzalloc() instead of devm_kmalloc() for
	  rx_buffer.
	- Fixed a checkpatch --strict alignment warning in the RX
	  wait poll.
	- Dropped the TX/RX channel-type guard added in the previous
	  round, as it prevented standalone loopback testing of the
	  mailbox controller without a coprocessor.
- Link to v1: https://lore.kernel.org/r/20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com

---
Swark Yang (2):
      dt-bindings: mailbox: add Axiado AX3005 mailbox
      mailbox: add Axiado AX3005 mailbox driver

 .../bindings/mailbox/axiado,ax3005-mailbox.yaml    |  96 +++++
 MAINTAINERS                                        |   8 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/axiado-mailbox.c                   | 395 +++++++++++++++++++++
 5 files changed, 511 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260728-upstream-axiado-ax3005-mailbox-upstream-86feaa7edf49

Best regards,
-- 
Swark Yang <syang@axiado.com>


