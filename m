Return-Path: <SRS0=zT3Q=KU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E47C2B9F8
	for <openbmc@archiver.kernel.org>; Tue, 25 May 2021 04:29:21 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FB461408
	for <openbmc@archiver.kernel.org>; Tue, 25 May 2021 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91FB461408
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq1Ll2FRCz3bvS
	for <openbmc@archiver.kernel.org>; Tue, 25 May 2021 14:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq1Kd2wVlz2yX3;
 Tue, 25 May 2021 14:28:21 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14P4Eifs020768;
 Tue, 25 May 2021 12:14:44 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 12:27:41 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
Date: Tue, 25 May 2021 12:27:35 +0800
Message-ID: <20210525042736.10379-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525042736.10379-1-steven_lee@aspeedtech.com>
References: <20210525042736.10379-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P4Eifs020768
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
Cc: billy_tsai@aspeedtech.com, ryan_chen@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 7028e21bdd98..7e90d713f5e5 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -862,11 +862,21 @@
 		groups = "SGPM1";
 	};
 
+	pinctrl_sgpm2_default: sgpm2_default {
+		function = "SGPM2";
+		groups = "SGPM2";
+	};
+
 	pinctrl_sgps1_default: sgps1_default {
 		function = "SGPS1";
 		groups = "SGPS1";
 	};
 
+	pinctrl_sgps2_default: sgps2_default {
+		function = "SGPS2";
+		groups = "SGPS2";
+	};
+
 	pinctrl_sioonctrl_default: sioonctrl_default {
 		function = "SIOONCTRL";
 		groups = "SIOONCTRL";
-- 
2.17.1

