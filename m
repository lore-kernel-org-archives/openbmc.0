Return-Path: <SRS0=JHGv=NR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8D8C432BE
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 06:17:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11204610A1
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 06:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11204610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwCM45r7Dz2yxL
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 16:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwCL94rHfz2yKS;
 Thu, 26 Aug 2021 16:17:03 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17Q5vjKl058461;
 Thu, 26 Aug 2021 13:57:46 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 26 Aug 2021 14:16:25 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <joel@jms.id.au>, <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] MAINTAINER: Add ASPEED eSPI driver entry
Date: Thu, 26 Aug 2021 14:16:21 +0800
Message-ID: <20210826061623.6352-3-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17Q5vjKl058461
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add Ryan Chen and myself as the maintainer of Aspeed eSPI
driver. Joel Stanley is added as the reviewer.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd25e4ecf0b9..b21bcb46692e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1713,6 +1713,15 @@ F:	drivers/crypto/axis
 F:	drivers/mmc/host/usdhi6rol0.c
 F:	drivers/pinctrl/pinctrl-artpec*
 
+ARM/ASPEED ESPI DRIVER
+M:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/aspeed/espi.yaml
+
 ARM/ASPEED I2C DRIVER
 M:	Brendan Higgins <brendanhiggins@google.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
-- 
2.17.1

