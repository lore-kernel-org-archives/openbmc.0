Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WZjP5drMzF24j
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 08:33:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Apr 2018 15:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,328,1520924400"; d="scan'208";a="34668793"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2018 15:33:25 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.13] clk:aspeed: Fix reset assert logic
Date: Wed, 25 Apr 2018 15:33:21 -0700
Message-Id: <20180425223321.9290-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2018 22:33:30 -0000

This commit fixes a bug in aspeed_reset_assert() which determines
the second reset register using condition.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/clk/clk-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index de8e1dba6eec..c5d2af2ace2e 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -349,7 +349,7 @@ static int aspeed_reset_assert(struct reset_controller_dev *rcdev,
 	u32 reg = ASPEED_RESET_CTRL;
 	u32 bit = aspeed_resets[id];
 
-	if (bit >= ASPEED_RESET_CTRL2) {
+	if (bit >= ASPEED_RESET2_OFFSET) {
 		bit -= ASPEED_RESET2_OFFSET;
 		reg = ASPEED_RESET_CTRL2;
 	}
-- 
2.17.0
