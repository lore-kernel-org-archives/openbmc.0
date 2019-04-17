Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.43.205; helo=6.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kjz75PThzDqHV
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 23:39:59 +1000 (AEST)
Received: from player795.ha.ovh.net (unknown [10.108.57.139])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BDBF316AF17
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:39:54 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id BFB214CFDE47;
 Wed, 17 Apr 2019 13:39:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH dev-5.0 0/4] spi-nor: aspeed: add support for the 4B opcodes
Date: Wed, 17 Apr 2019 15:39:37 +0200
Message-Id: <20190417133941.22962-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3218384884640025346
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeefgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 17 Apr 2019 13:40:04 -0000

Here is a little series providing cleanups on the Aspeed SMC Controller
driver and adding support for the 4B opcodes which were recently added
to the Linux kernels 5.0.x.

The use of the 4B opcodes was breaking the read of the golden buffer
done at slow speed in the optimization read sequence. The code assumed
that the chip was in 4B address mode, as if a EN4B opcode had been
sent, but this is not the case anymore with 4B opcodes. The golden
buffer is now read with a SPINOR_OP_READ_4B (0x13) when the chip
supports 4B opcodes.

It should fix accesses to the palmetto PNOR and the Witherspoon BMC
flash modules.


*Please test !*

Thanks,

C.


Cédric Le Goater (4):
  mtd: spi-nor: aspeed: introduce a aspeed_smc_default_read() helper
  mtd: spi-nor: aspeed: clarify 4BYTE address mode mask
  mtd: spi-nor: aspeed: use memcpy_fromio() to capture the optimization
    buffer
  mtd: spi-nor: aspeed: add support for the 4B opcodes

 drivers/mtd/spi-nor/aspeed-smc.c | 40 +++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 11 deletions(-)

-- 
2.20.1
