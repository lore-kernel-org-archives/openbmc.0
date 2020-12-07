Return-Path: <SRS0=hJce=FL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20BC4361B
	for <openbmc@archiver.kernel.org>; Mon,  7 Dec 2020 16:39:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515C2206C1
	for <openbmc@archiver.kernel.org>; Mon,  7 Dec 2020 16:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515C2206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqTYV4BgLzDqWn
	for <openbmc@archiver.kernel.org>; Tue,  8 Dec 2020 03:39:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqTPr4231zDqNS;
 Tue,  8 Dec 2020 03:33:01 +1100 (AEDT)
IronPort-SDR: Zo0wMPGZrcclKjnwYtj0XOzJ+s/s/mkIgoX4WWgXZ44Z+niurBSATsLI6Ap+mh7FlPxaqEgw2F
 yWaqsYU85wEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="161495844"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="161495844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 08:32:58 -0800
IronPort-SDR: Wd59LJBOxhnFNEMnSB4YiYGljaOcvTaL6kMR1eLzOYIANqgyRTptzL6swotMqeIoPVIKTtLtPq
 aBj1cmiJ0cFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="317246226"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 08:32:58 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] clk: ast2600: fix reset settings for eclk and vclk
Date: Mon,  7 Dec 2020 08:42:39 -0800
Message-Id: <20201207164240.15436-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Video engine reset setting should be coupled with eclk to match it
with the setting for previous Aspeed SoCs which is defined in
clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
driver. Also, reset bit 6 is defined as 'Video Engine' reset in
datasheet so it should be de-asserted when eclk is enabled. This
commit fixes the setting.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/clk/clk-ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 177368cac6dd..882da16575d4 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -60,10 +60,10 @@ static void __iomem *scu_g6_base;
 static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	/*				    clk rst  name		parent	 flags */
 	[ASPEED_CLK_GATE_MCLK]		= {  0, -1, "mclk-gate",	"mpll",	 CLK_IS_CRITICAL }, /* SDRAM */
-	[ASPEED_CLK_GATE_ECLK]		= {  1, -1, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
+	[ASPEED_CLK_GATE_ECLK]		= {  1,  6, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
 	[ASPEED_CLK_GATE_GCLK]		= {  2,  7, "gclk-gate",	NULL,	 0 },	/* 2D engine */
 	/* vclk parent - dclk/d1clk/hclk/mclk */
-	[ASPEED_CLK_GATE_VCLK]		= {  3,  6, "vclk-gate",	NULL,	 0 },	/* Video Capture */
+	[ASPEED_CLK_GATE_VCLK]		= {  3, -1, "vclk-gate",	NULL,	 0 },	/* Video Capture */
 	[ASPEED_CLK_GATE_BCLK]		= {  4,  8, "bclk-gate",	"bclk",	 0 }, /* PCIe/PCI */
 	/* From dpll */
 	[ASPEED_CLK_GATE_DCLK]		= {  5, -1, "dclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* DAC */
-- 
2.17.1

