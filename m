Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 2052 seconds by postgrey-1.36 at bilbo;
 Wed, 16 May 2018 00:14:23 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lfhH1x68zF2RZ
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 00:14:22 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4FDdWlM018925;
 Tue, 15 May 2018 16:39:32 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 8441)
 id 626245AA62; Tue, 15 May 2018 16:39:32 +0300 (IDT)
From: avifishman70@gmail.com
To: minyard@acm.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Cc: haiyue.wang@linux.intel.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v1 0/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
Date: Tue, 15 May 2018 16:38:33 +0300
Message-Id: <1526391514-17746-1-git-send-email-avifishman70@gmail.com>
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
X-List-Received-Date: Tue, 15 May 2018 14:14:24 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Original drivers/char/ipmi/kcs_bmc_npcm7xx.c was missing enabling to send 
interrupt to the host on writes to output buffer.
This patch fixes it

Avi Fishman (1):
  ipmi: NPCM7xx KCS BMC: enable interrupt to the host

 drivers/char/ipmi/kcs_bmc_npcm7xx.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.14.1
