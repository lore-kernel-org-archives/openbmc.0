Return-Path: <openbmc+bounces-1923-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2361CD37AC
	for <openbmc@archiver.kernel.org>; Wed, 13 May 2026 23:51:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gG9G81Kvvz2yFP;
	Thu, 14 May 2026 09:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778689910;
	cv=none; b=M6zcVZjXBrLOq3Es+VF+rOSjseKLiYBSm8OYKBjv0FYR820uNoIslzP9JT+vpj9OVDzobyQX+/xuBr1ga3FG+PtV5+5sQcwwKFSuMN1R9jsdGb6X0NtLaoBUmruoeMOpe4LLEcjX9UU48M/fAStMj7LSUy3XPk3H9SrsaX2PX9r+OZexosb5fINTeJh+Mu0p40XqpVPBq2WzbQ1RJQ5Xnaje059zXawRVSKrh67I/CiZ/4SU4cmsF6JqIQN73CtvpE5YhZNFZ9MTaj/ZJzNIccR/b74h9c5wgapj9sj05fZWcizUyjmPOLAFyYbpdYSpCM2NU2Vlnvd/Z5KdtK0Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778689910; c=relaxed/relaxed;
	bh=d8V670zyUyenQNN2cTm8JXB1hkQAPnKlB7fA62ra/R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEOULjUu2F50nyn9v6sDoTaH33KKrSVSfIaKuej33YeCLwtb3Qrl8yRbv6Jexzg6uA1ulGg3Bs6ChfDGrv846oA04jJsqPoj2mvHaqfIM9XcJFIMTFu+iboUitDpVNHtG8SHYhueuFyETWTffIqS/lJvTgitGwnyy+h9f6Z7muLagZv0e56Oz2cKy8dd6tYCHCmqzqCh1wUTxEUKkJg8tvt2r0xVLjlW0mBC/2Mw4Y+vZqy6bwXLOkgC+i5rseRkZPVlXbeObOGxa7WLhxmq2ibOWH3UoUvxJ8li0zVJmMp6GaT9k41MxCuQxsmiPUFb3mm0NujFYXjZo9Z1Xq1esw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PD05U0Ie; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PD05U0Ie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gFzW66fDkz2xSb
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 02:31:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689907; x=1810225907;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yphx0iDw9EXb0beqPbVUPMSKhtSw2f0zmZsyv+mALko=;
  b=PD05U0IeRLmaFAmT8ZkXdxj60bVcgX+scthbml58AuvZ8KqD/0R2lKem
   giYydXx8hJ1ugIw+hAGcnPopZwWSa8OI2aPUyd78dsOjg8F8OeIQ5QQ0U
   INF+NoNwA+4HkTMa+yfm38IpTcX/X3NGSmJ19QFKvwdAqNuw4ZqZ9UzGe
   YHuR9YoLGnuGQaCcdmv9sDlsZBhskBQXlOHd3Gdm7i4aMw8vYHiOuQMsM
   jxLZOLmnDrw8SP/HZYb4RbL77Oz8hFsR2u+sHuSUHp8GYaN0cRD6Vdtun
   m52OwttkZqDXG/4R1zglfdU4f89DhnG7ErZlWVNalvLR/Jowu9Rdr5UlN
   w==;
X-CSE-ConnectionGUID: 10qBxo48Tpaoavbh/3S1Zw==
X-CSE-MsgGUID: iPZV239LR4CDnthEPWApRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79655162"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79655162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:41 -0700
X-CSE-ConnectionGUID: QXa8VlSXTPO0e4eJWObUGQ==
X-CSE-MsgGUID: qlVHSyAPRIGwkjQJ/5tdFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242478488"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:40 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH linux dev-6.18 0/3] ARM: dts: aspeed-g6: I2C/APB cleanup and AST2600 I3C enablement
Date: Wed, 13 May 2026 19:30:03 +0200
Message-ID: <cover.1778692820.git.dawid.glazik@linux.intel.com>
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
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Hi OpenBMC maintainers,

This series enables AST2600 I3C support:
- moving AST2600 I2C controller nodes directly under APB for
  consistent SoC layout
- documenting `aspeed,ast2600-i3c-global` in syscon binding
- adding AST2600 I3C controller nodes in aspeed-g6.dtsi

Upstream status:
- submitted upstream and under review
- no unresolved design concerns known
- review received from Krzysztof Kozlowski (`Reviewed-by`)
- upstream thread:
  https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel.com/#t

Please carry this series in OpenBMC temporarily to unblock
platform bring-up while upstream integration completes.

Thanks,
Dawid Glazik

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
  ARM: dts: aspeed-g6: Add nodes for i3c controllers

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 543 ++++++++++--------
 2 files changed, 318 insertions(+), 227 deletions(-)

-- 
2.43.0


