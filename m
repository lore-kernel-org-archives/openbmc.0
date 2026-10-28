Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF964606A320
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 03:37:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDtMg0cl7z2yWy;
	Wed, 28 Oct 2026 14:37:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793158622;
	cv=none; b=IsZWay++qxRVwefzpSIsBZJWArYy2KR9p5DB2wWNeIMNppemW60WU+pCD9TpQP6lFQaPMERWM3kKPdvmSNKop2Trmdza8VEYEZmyWKOsI4FMef1ivR4ItuggBmhf2GRKZYe5bNop4u6yvFo39pUXyWMHFm0+vB5J/6q2rISY8xwAxFOy/hcjBZXrGkZkusDIg4cwrPsVp5sGrK2JvUF13AakJH9f2GDhUz+q7Xy3vtDzZzAILR66naGw3Hoizyzf60++0ICgSyTGpAdq4nV3+tigNas5DOCoLTY6PLDUTj5MeFtFKm7yGM0dBU9xJ6aAUEIr9HmJdcQcP45ed84P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793158622; c=relaxed/relaxed;
	bh=Rw/o1NyO0MsXuJUtADzx1gpfrIaQA1F6uYXYwf2SITg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbcbPk/bcaMaYuxG+hMvo1hW5QmXNURVMElwItG0vOTS9Ycc/wa9AjfV3DumnFX0xJhKtESp5SRMSinKMCaRQo6JuAXNWCdaUiCE/eHebvFSTz+HlKRQYwurr0StGRIJu7YXHOuIBzY7Egnyz1yM9ZsELWwliaD9D+dvw3ulKAVyv+xNfKLkYpFjNl7wYh8Gmf0WXS9GHHLS7F8vvxQRh+E6CwJGA3u61oVyfFloc1heKQjnrKPew7lVkjN7RBoRYFiI8uLp9sh0Pnf9y/LXPXnINlVYQSN94ek0b9hAHi0hGieKpC2+iz+KvUQo221xGRzNcBxxzT3XSiYrThDCnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDtMd73gtz2yDr
	for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 14:37:01 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 28 Oct
 2026 11:36:44 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 28 Oct 2026 11:36:44 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Brian Masney
	<bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH linux dev-6.18 1/3] clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
Date: Wed, 28 Oct 2026 11:36:40 +0800
Message-ID: <20261028033644.355247-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028033644.355247-1-vince_chang@aspeedtech.com>
References: <20261028033644.355247-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ryan Chen <ryan_chen@aspeedtech.com>

Prepare for long-term maintenance and future additions by introducing a
dedicated drivers/clk/aspeed/ subdirectory for ASPEED clock drivers.

Move the existing ASPEED clock drivers into the new
drivers/clk/aspeed/ subdirectory.

No functional change, file move only.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
(cherry picked from commit 03b3faa12c25140d00f9dca4ed44a6184600d9d8)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/clk/Kconfig                    | 13 +------------
 drivers/clk/Makefile                   |  3 +--
 drivers/clk/aspeed/Kconfig             | 13 +++++++++++++
 drivers/clk/aspeed/Makefile            |  3 +++
 drivers/clk/{ => aspeed}/clk-aspeed.c  |  0
 drivers/clk/{ => aspeed}/clk-aspeed.h  |  0
 drivers/clk/{ => aspeed}/clk-ast2600.c |  0
 7 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/aspeed/Kconfig
 create mode 100644 drivers/clk/aspeed/Makefile
 rename drivers/clk/{ => aspeed}/clk-aspeed.c (100%)
 rename drivers/clk/{ => aspeed}/clk-aspeed.h (100%)
 rename drivers/clk/{ => aspeed}/clk-ast2600.c (100%)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..c46920649c97 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -284,18 +284,6 @@ config COMMON_CLK_LAN966X
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
 	  within the SoC.
 
-config COMMON_CLK_ASPEED
-	bool "Clock driver for Aspeed BMC SoCs"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	default ARCH_ASPEED
-	select MFD_SYSCON
-	select RESET_CONTROLLER
-	help
-	  This driver supports the SoC clocks on the Aspeed BMC platforms.
-
-	  The G4 and G5 series, including the ast2400 and ast2500, are supported
-	  by this driver.
-
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
 	depends on MFD_SEC_CORE || COMPILE_TEST
@@ -513,6 +501,7 @@ config COMMON_CLK_RPMI
 
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
+source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..f7bce3951a30 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -62,8 +62,6 @@ obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
-obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
-obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
@@ -114,6 +112,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
 obj-y					+= analogbits/
+obj-y					+= aspeed/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
 obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
diff --git a/drivers/clk/aspeed/Kconfig b/drivers/clk/aspeed/Kconfig
new file mode 100644
index 000000000000..c59b0a1f581c
--- /dev/null
+++ b/drivers/clk/aspeed/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_ASPEED
+        bool "Clock driver for Aspeed BMC SoCs"
+        depends on ARCH_ASPEED || COMPILE_TEST
+        default ARCH_ASPEED
+        select MFD_SYSCON
+        select RESET_CONTROLLER
+        help
+          This driver supports the SoC clocks on the Aspeed BMC platforms.
+
+          The G4 and G5 series, including the ast2400 and ast2500, are supported
+          by this driver.
diff --git a/drivers/clk/aspeed/Makefile b/drivers/clk/aspeed/Makefile
new file mode 100644
index 000000000000..7db136b89b1e
--- /dev/null
+++ b/drivers/clk/aspeed/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
+obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/aspeed/clk-aspeed.c
similarity index 100%
rename from drivers/clk/clk-aspeed.c
rename to drivers/clk/aspeed/clk-aspeed.c
diff --git a/drivers/clk/clk-aspeed.h b/drivers/clk/aspeed/clk-aspeed.h
similarity index 100%
rename from drivers/clk/clk-aspeed.h
rename to drivers/clk/aspeed/clk-aspeed.h
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/aspeed/clk-ast2600.c
similarity index 100%
rename from drivers/clk/clk-ast2600.c
rename to drivers/clk/aspeed/clk-ast2600.c
-- 
2.43.0


