Return-Path: <openbmc+bounces-1924-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C20CD4F21
	for <openbmc@archiver.kernel.org>; Wed, 13 May 2026 23:51:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gG9G81WThz2yFQ;
	Thu, 14 May 2026 09:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778683758;
	cv=none; b=Kwm1Agrsieq03XNg5aCr5ZnprfuxR4kZbyUMLjoU9v8b5erMmUGSYA4SPy8g84acWflO/D9sRiQzfIP6pteYmPIKqUDtKRwUyd2kVVHVEdn0x06FjpkkBcjW6u+5OaK24ikzfGIyCCjzXDe1eRxWSNZZFT7Yox4UqqEZ+qDue46iACbv6B65L6/KQBRwqQm6pMlBW1kqBUn2LiugeKBy77kQalntLXwyG7691ycIhg80TZhRoztmTI8awZc3r/4SbeiFCUYe2UzxMxZkhZTBmbAdF1SWUtt6xwr/y5ujeR+mdAMhYhbZvYp43vyVx54GRZ9bw+MbEJWAVzY+t8J3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778683758; c=relaxed/relaxed;
	bh=9+w6ApvqM6wtwLGaLuVgxuT4a5jWzCnwU40ZrZeouyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRcovW+C79di8DyrDOv0vgax4kH7gKkdJx1LqBUVXBzV9vQJsoxBb2ujN61iXXU8iAHTeVhzkbLVc79aOtmG7+tJXkNZymjLYsGqALt0hyN4n+JoNmasIg/uK62H0etVxVCrL00m25vjwd92KIP8x3b+uhNBnOY/w/R9el3FeLi1udn14c43XxHOx3kcd1hWl20qky2fVmBPym8kThmR2NCiTBwfcHfE3neLuG31nLaTy+0Lrtyc+xvs4e9RfYGQr5utoOoWb8cmgSWGzlWR5z72EC1SJxxaHBmw5EGJXdyZKhCEfbxxnrPVg/0CkwgyjQXW5a8RpzGwyZFLFbOlBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WbFyHiOI; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WbFyHiOI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gFxDq1rftz2xSb
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 00:49:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778683756; x=1810219756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rFk3Hl1xBRvoDW0OQ79w1Rotc/y6XBfxIjTe0GZoGIc=;
  b=WbFyHiOIRmDYa/JyquqrZHVQQPvJqGdpL3R6EBF8mH1ekL7CcEcgNlK9
   /jfha5XCwBic41oCPPpduLrvs3A0ZgE/U/Ku/IxTilX3+sRk+ITLaolRz
   mg5Z5bFZPruzQ9K+KbgowQABUX2dl7te2fDqZhefUzhU1OvI0iZSSvX9I
   EFHPL/x49yyplr8JK8ZZpaDON0943G0oNfSEP1r9BjGQ+eUSXk7FCQ01h
   Vprb8oxL2gKJ1wVa6e2PQ2dpzjtxWa5MR/+Im0+OKxYZcWYDW72lEEzrR
   oLJGy4MyozSJafaF0LtNTocorIcOVzUv6/yekKvzePqf4pWiQKneoQdlc
   w==;
X-CSE-ConnectionGUID: 4eNS83paR+K+7ZuR0IAP0w==
X-CSE-MsgGUID: ilIbXi6oQbmXf8AXq9XFwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79643400"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79643400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:49:09 -0700
X-CSE-ConnectionGUID: 9oHs9C/PTFKMJIhwIN8FLw==
X-CSE-MsgGUID: s3szzsFsSUWf59/sBw/MBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="261610131"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:49:07 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH linux dev-6.18 0/3] aspeed-g6: I2C/APB cleanup and AST2600 I3C enablement
Date: Wed, 13 May 2026 17:46:22 +0200
Message-ID: <20260513154750.1022783-1-dawid.glazik@linux.intel.com>
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

