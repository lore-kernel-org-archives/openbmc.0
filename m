Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB196E748E9
	for <openbmc@archiver.kernel.org>; Sun,  1 Oct 2023 11:58:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rz2fC0yTyz3vbp
	for <openbmc@archiver.kernel.org>; Sun,  1 Oct 2023 22:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rz2cL1V89z3bWQ
	for <openbmc@lists.ozlabs.org>; Sun,  1 Oct 2023 22:56:32 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 391BuOpG016038
	for <openbmc@lists.ozlabs.org>; Sun, 1 Oct 2023 14:56:24 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 14:56:23 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 19:56:21 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 1 Oct 2023 19:56:21 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 095AC64740; Sun,  1 Oct 2023 14:56:21 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.5 v1 0/2] hwmon: npcm: add Arbel NPCM8XX support
Date: Sun, 1 Oct 2023 14:56:17 +0300
Message-ID: <20231001115619.94491-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX Pulse Width Modulation (PWM) and
Fan tachometer (Fan) support to PWM FAN NPCM driver.

The NPCM8XX supports up to 16 Fan tachometer inputs and
up to 12 PWM outputs.

This patch set is on upstream process.

The NPCM PWM FAN driver was tested on the NPCM845 evaluation board.

Tomer Maimon (2):
  dt-bindings: hwmon: npcm: Add npcm845 compatible string
  hwmon: npcm750-pwm-fan: Add NPCM8xx support

 .../bindings/hwmon/npcm750-pwm-fan.txt        |   6 +-
 drivers/hwmon/npcm750-pwm-fan.c               | 161 +++++++++++++++---
 2 files changed, 141 insertions(+), 26 deletions(-)

-- 
2.33.0

