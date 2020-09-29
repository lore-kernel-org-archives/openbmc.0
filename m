Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381C1C4727C
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 13:25:55 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5723D208FE
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 13:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5723D208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C10Wg2RHFzDqM5
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 23:25:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C10MQ5N4TzDqRy
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 23:18:39 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08TDIAKZ026515;
 Tue, 29 Sep 2020 16:18:10 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 4CB63639D6; Tue, 29 Sep 2020 16:18:10 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v8 0/5] arm: dts: add and modify device node in NPCM7xx device
 tree
Date: Tue, 29 Sep 2020 16:18:02 +0300
Message-Id: <20200929131807.15378-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch set adds and modify device tree nodes in the NPCM7xx
Baseboard Management Controller (BMC) device tree.

The following device node add:
        - NPCM7xx Pin controller and GPIO
        - NPCM7xx PWM and FAN.
        - NPCM7xx EHCI USB.
        - NPCM7xx KCS.
        - NPCM Reset.
        - NPCM Peripheral SPI.
        - NPCM FIU SPI.
        - NPCM HWRNG.
        - NPCM I2C.
        - STMicro STMMAC.

The following device node modified:
        - NPCM7xx timer.
        - NPCM7xx clock constants parameters.

NPCM7xx device tree tested on NPCM750 evaluation board.

Changes since version 7:
Address comments from Joel Stanely: https://www.spinics.net/lists/devicetree/msg380191.html

Changes since version 6:
Split commits.
 
Changes since version 5:
Address comments from Joel Stanely: https://lkml.org/lkml/2020/9/16/994
 
Changes since version 4:
 - Tested patches in Linux kernel 5.9.

Changes since version 3:
 - Tested patches in Linux kernel 5.6.

Changes since version 2:
 - Remove unnecessary output-enable flags.

Changes since version 1:
 - Add NPCM reset device node.
 - Add reset parameters to NPCM driver device nodes.


Tomer Maimon (5):
  arm: dts: modify NPCM7xx device tree clock parameter
  arm: dts: modify NPCM7xx device tree timer register size
  arm: dts: add pinctrl and GPIO node to NPCM7XX device tree
  arm: dts: add new device nodes to NPCM7XX device tree
  arm: dts: add new device nodes to NPCM750 device tree EVB

 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 967 +++++++++++++++++-
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 367 ++++++-
 .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  24 +-
 4 files changed, 1495 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi

-- 
2.22.0

