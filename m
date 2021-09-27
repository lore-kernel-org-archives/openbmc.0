Return-Path: <SRS0=7PyP=OR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267ADC433EF
	for <openbmc@archiver.kernel.org>; Mon, 27 Sep 2021 02:32:53 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E612610A2
	for <openbmc@archiver.kernel.org>; Mon, 27 Sep 2021 02:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E612610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHmrg2J0dz3015
	for <openbmc@archiver.kernel.org>; Mon, 27 Sep 2021 12:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHmq76H64z2yHM;
 Mon, 27 Sep 2021 12:31:30 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18R2AIXn038748;
 Mon, 27 Sep 2021 10:10:18 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 27 Sep 2021 10:30:55 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 0/5] arm: aspeed: Add UART routing support
Date: Mon, 27 Sep 2021 10:30:48 +0800
Message-ID: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18R2AIXn038748
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
Cc: osk@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add UART routing driver and the device tree nodes.

v7:
 - Drop unused 'reg-io-width' properties from LPC nodes
 - Revise LPC bindgins as suggested by Rob

v6:
 - Fix another typo in YAML file
 - Move sysfs description from bindings to ABI document

v5:
 - Fix typo in YAML file to solve the compatible string not found error

v4:
 - Convert aspeed-lpc bindings to YAML schema to resolve dependecy issues

v3:
 - Add individual bindings in YAML
 - Add support for AST24xx (AST25xx shares the same design)
 - Add more explanation for the sysfs ABI

v2:
 - Add dt-bindings
 - Add ABI documents for the exported sysfs interface
 - Revise driver implementation suggested by Joel

Chia-Wei Wang (5):
  ARM: dts: aspeed: Drop reg-io-width from LPC nodes
  dt-bindings: mfd: aspeed-lpc: Convert to YAML schema
  dt-bindings: aspeed: Add UART routing controller
  soc: aspeed: Add UART routing support
  ARM: dts: aspeed: Add uart routing to device tree

 .../testing/sysfs-driver-aspeed-uart-routing  |  27 +
 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 -----
 .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 192 ++++++
 .../bindings/soc/aspeed/uart-routing.yaml     |  56 ++
 arch/arm/boot/dts/aspeed-g4.dtsi              |   7 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |   7 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |   7 +-
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c      | 603 ++++++++++++++++++
 10 files changed, 911 insertions(+), 164 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c

-- 
2.17.1

