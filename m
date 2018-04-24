Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Vywq1dfMzF24G;
 Wed, 25 Apr 2018 08:41:13 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Apr 2018 15:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,324,1520924400"; d="scan'208";a="223090587"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2018 15:41:09 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.13] clk:aspeed: Fix reset bits for PCI/VGA and PECI
Date: Tue, 24 Apr 2018 15:40:56 -0700
Message-Id: <20180424224056.23384-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.16.2
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
X-List-Received-Date: Tue, 24 Apr 2018 22:41:16 -0000

This commit fixes incorrect setting of reset bits for PCI/VGA and
PECI modules.

1. Reset bit for PCI/VGA is 8.
2. PECI reset logic is missing so added bit 10 as its reset bit.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/clk/clk-aspeed.c                 | 4 ++--
 include/dt-bindings/clock/aspeed-clock.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index de8e1db..71404a2 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -100,7 +100,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
 	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
 	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
 	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */
-	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	CLK_IS_CRITICAL }, /* PCIe/PCI */
+	[ASPEED_CLK_GATE_BCLK] =	{  4,  8, "bclk-gate",		"bclk",	CLK_IS_CRITICAL }, /* PCIe/PCI */
 	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	CLK_IS_CRITICAL }, /* DAC */
 	[ASPEED_CLK_GATE_REFCLK] =	{  6, -1, "refclk-gate",	"clkin", CLK_IS_CRITICAL },
 	[ASPEED_CLK_GATE_USBPORT2CLK] =	{  7,  3, "usb-port2-gate",	NULL,	0 }, /* USB2.0 Host port 2 */
@@ -315,8 +315,8 @@ static const u8 aspeed_resets[] = {
 	[ASPEED_RESET_ADC]	= 23,
 	[ASPEED_RESET_JTAG_MASTER] = 22,
 	[ASPEED_RESET_MIC]	= 18,
+	[ASPEED_RESET_PECI]	= 10,
 	[ASPEED_RESET_PWM]	=  9,
-	[ASPEED_RESET_PCIVGA]	=  8,
 	[ASPEED_RESET_I2C]	=  2,
 	[ASPEED_RESET_AHB]	=  1,
 
diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index e983d17..379f727 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -43,8 +43,8 @@
 #define ASPEED_RESET_ADC		2
 #define ASPEED_RESET_JTAG_MASTER	3
 #define ASPEED_RESET_MIC		4
-#define ASPEED_RESET_PWM		5
-#define ASPEED_RESET_PCIVGA		6
+#define ASPEED_RESET_PECI		5
+#define ASPEED_RESET_PWM		6
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
-- 
2.7.4
