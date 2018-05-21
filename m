Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qJKj1r9pzF0mF
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 22:40:51 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4LCeIFt014631;
 Mon, 21 May 2018 15:40:18 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 8441)
 id CB8105AB1A; Mon, 21 May 2018 15:40:17 +0300 (IDT)
From: avifishman70@gmail.com
To: minyard@acm.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Cc: haiyue.wang@linux.intel.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 avifishman70@gmail.com, Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v2 0/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
Date: Mon, 21 May 2018 15:39:58 +0300
Message-Id: <1526906399-30140-1-git-send-email-avifishman70@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Mon, 21 May 2018 12:40:58 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Changes since version 1:
Apply code style comments from "Wang, Haiyue" <haiyue.wang@linux.intel.com>


Original kcs_bmc_npcm7xx.c was missing enabling to send interrupt to the
host on writes to output buffer.
This patch fixes it by setting the bits that enables the generation of
IRQn events by hardware control based on the status of the OBF flag.


Avi Fishman (1):
  ipmi: NPCM7xx KCS BMC: enable interrupt to the host

 drivers/char/ipmi/kcs_bmc_npcm7xx.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.14.1
