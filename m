Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Slv19yKzDvZC
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:14 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id ABABF15C15
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:10 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id CE25B3C007F;
 Fri,  4 Nov 2016 18:01:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 0/8] Aspeed SMC improvements
Date: Fri,  4 Nov 2016 18:00:39 +0100
Message-Id: <1478278847-9164-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13751178515637963522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 17:01:15 -0000

Hello,

Here is short serie improving the Aspeed SMC driver. There are a
couple of fixes and also changes preparing ground for read
optimization.

Patch 1 and 2 are fixes for the current driver. When merging all the
code before sending a v1 to mainline, a few minor errors slipped
through.

Patch 3 and 4 are cleanups.

Patch 5 and 6 should not have any impacts as we are not using DMAs or
fast reads, yet.

Patch 7 and 8 are more important. They change completely the IO
routines and the way the flash is accessed for reads. These are
preliminary work for some possible speed improvements.

The overall result should be a v2 for upstream.

Cheers,

C.


Cédric Le Goater (8):
  mtd: spi-nor: aspeed: fix setting of the register control value for
    writes
  mtd: spi-nor: aspeed: improve 4 bytes mode
  mtd: spi-nor: aspeed: extend the bits definitions
  mtd: spi-nor: aspeed: add some logging
  mtd: spi-nor: aspeed: use smc_read mode when doing DMAs
  mtd: spi-nor: aspeed: prepare for fast read
  mtd: spi-nor: aspeed: rework io routines
  mtd: spi-nor: aspeed: use command mode for reads

 drivers/mtd/spi-nor/aspeed-smc.c | 263 +++++++++++++++++++++------------------
 1 file changed, 143 insertions(+), 120 deletions(-)

-- 
2.7.4
