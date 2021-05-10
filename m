Return-Path: <SRS0=tH7v=KF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F84AC433B4
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 13:15:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE55611C2
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 13:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE55611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff1kj3Th4z3bwP
	for <openbmc@archiver.kernel.org>; Mon, 10 May 2021 23:15:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff1hn1xP1z308N
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 23:13:45 +1000 (AEST)
IronPort-SDR: QKm0BK+rYS80V5EVbm3hltVPxmKoQ87I8VW7x8u+CagVpphSNC3jaQOwtSyqQLeSDcjv6SviUu
 5o2Ubba0d2kA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199261258"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="199261258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 06:12:11 -0700
IronPort-SDR: cvIFTPk3l/qMviQ4zOXZz5u7wXujsGpD2xZDy2UCJMkhSlGTsvEsp9+QKCPPxNo9eoDxDcd1+a
 1YhLpxzqJB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="461292622"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 10 May 2021 06:12:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E13F7D7; Mon, 10 May 2021 16:12:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/7] spi: Use SPI_MODE_X_MASK
Date: Mon, 10 May 2021 16:12:11 +0300
Message-Id: <20210510131217.49357-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Tali Perry <tali.perry1@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Use SPI_MODE_X_MASK instead of open coded variant.

While at it, fix format specifier and drop explicit casting.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 407420977a73..956dce3aafca 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3441,8 +3441,8 @@ int spi_setup(struct spi_device *spi)
 		spi_set_thread_rt(spi->controller);
 	}
 
-	dev_dbg(&spi->dev, "setup mode %d, %s%s%s%s%u bits/w, %u Hz max --> %d\n",
-			(int) (spi->mode & (SPI_CPOL | SPI_CPHA)),
+	dev_dbg(&spi->dev, "setup mode %lu, %s%s%s%s%u bits/w, %u Hz max --> %d\n",
+			spi->mode & SPI_MODE_X_MASK,
 			(spi->mode & SPI_CS_HIGH) ? "cs_high, " : "",
 			(spi->mode & SPI_LSB_FIRST) ? "lsb, " : "",
 			(spi->mode & SPI_3WIRE) ? "3wire, " : "",
-- 
2.30.2

