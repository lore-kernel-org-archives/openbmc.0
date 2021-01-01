Return-Path: <SRS0=6QMd=GE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB72C433DB
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:43:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB1422202
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB1422202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6l6q4ptKzDqLp
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 23:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kxP1Wh5zDqCb
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:34:48 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNY6F027171;
 Fri, 1 Jan 2021 14:23:34 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 378D663A17; Fri,  1 Jan 2021 14:23:34 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 00/11] Add NPCM7xx patches to dev-5.8
Date: Fri,  1 Jan 2021 14:23:17 +0200
Message-Id: <20210101122328.43510-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello Joel,

How are you in these crazy Covid-19 days?

In this patch set we will like to align with relevant modifications
in Nuvoton OpenBMC Linux kernel 5.4.

Linux upstream current status:
	1. npcm7xx clock driver - adding read only 
		flag to divider clocks, Will be sent to Linux community.
	2. Adding NPCM ADC calibration - Will be sent to Linux vanilla,
		but I am not sure it will be approved.
	3. Add DT restart priority and reset type support - sent to Linux 
		community la but havent approved yet.
	4. persist configuration to the pin control driver - asked by a costumer,
		didnt sent to Linux community.
	5. Add HGPIO pin support to NPCM7xx pinctrl driver - will be sent
		to Linux community
	6. JTAG master driver - will be sent to Linux community once we will 
		have BMC folder.

Thanks a lot and HAPPY NEW YEAR,

Tomer Maimon (11):
  clk: npcm7xx: add read only flag to divider clocks
  iio: adc: add calibration support to npcm ADC
  dts: npcm750: add fuse regmap support node
  watchdog: npcm: Add DT restart priority and reset type support
  dt-binding: watchdog: Add DT restart priority and reset type
  pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
  pinctrl: pinconf: add pin persist configuration
  pinctrl: npcm7xx: Add pin persist configuration support
  spi: npcm-pspi: Add full duplex support
  dt-binding: bmc: add NPCM7XX JTAG master documentation
  misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver

 .../bindings/bmc/npcm7xx-jtag-master.txt      |  38 +
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  32 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   6 +
 drivers/clk/clk-npcm7xx.c                     |  70 +-
 drivers/iio/adc/npcm_adc.c                    | 191 ++++
 drivers/misc/Kconfig                          |   6 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/npcm7xx-jtag-master.c            | 840 ++++++++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 130 ++-
 drivers/pinctrl/pinconf-generic.c             |   3 +
 drivers/spi/spi-npcm-pspi.c                   |  75 +-
 drivers/watchdog/npcm_wdt.c                   | 121 ++-
 12 files changed, 1418 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
 create mode 100644 drivers/misc/npcm7xx-jtag-master.c

-- 
2.22.0

