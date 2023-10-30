Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE0C4167D
	for <openbmc@archiver.kernel.org>; Mon, 30 Oct 2023 15:02:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJxMq6j2Tz3cM7
	for <openbmc@archiver.kernel.org>; Tue, 31 Oct 2023 02:02:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJxM04FDWz3cLY
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 02:01:41 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39UF1PXa014853
	for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2023 17:01:25 +0200
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 30 Oct
 2023 17:01:24 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Mon, 30
 Oct 2023 23:01:22 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 30 Oct 2023 23:01:22 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 651D35F48F;
	Mon, 30 Oct 2023 17:01:21 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4070F235CE0F; Mon, 30 Oct 2023 17:01:21 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v3 0/1] hwmon: npcm: add Arbel NPCM8XX support
Date: Mon, 30 Oct 2023 17:01:18 +0200
Message-ID: <20231030150119.342791-1-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX Pulse Width Modulation (PWM) and
Fan tachometer (Fan) support to PWM FAN NPCM driver.

The NPCM8XX supports up to 16 Fan tachometer inputs and
up to 12 PWM outputs.

The NPCM PWM FAN driver was tested on the NPCM845 evaluation board.

Addressed comments from:
 - Guenter Roeck : https://www.spinics.net/lists/linux-hwmon/msg21801.html

Changes since version 2:
 - dt-binding commit applied and remove from the patchset.
 - Using _is_visible() function to support NPCM8XX.

Changes since version 1:
 - Add Rob Ack to the dt-binding commit. 

Tomer Maimon (1):
  hwmon: npcm750-pwm-fan: Add NPCM8xx support

 drivers/hwmon/npcm750-pwm-fan.c | 34 +++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.33.0

