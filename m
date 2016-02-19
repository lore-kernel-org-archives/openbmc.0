Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5B01A0791
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2016 06:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455909029017453.3152429400204;
 Fri, 19 Feb 2016 11:10:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2] mtd: spi-nor: aspeed-smc: Use io string accessors to
 fifo
Date: Fri, 19 Feb 2016 13:10:27 -0600
Message-Id: <1455909028-21559-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2016 19:10:32 -0000

Here is the patch that allows jffs2 to mount.

Please review.

https://github.com/openbmc/linux/pull/50

Milton D. Miller II (1):
  mtd: spi-nor: aspeed-smc: Use io string accessors to fifo

 drivers/mtd/spi-nor/Kconfig      |   2 +
 drivers/mtd/spi-nor/aspeed-smc.c | 120 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 113 insertions(+), 9 deletions(-)

-- 
2.7.1
