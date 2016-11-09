Return-Path: <clg@kaod.org>
Received: from 14.mo1.mail-out.ovh.net (14.mo1.mail-out.ovh.net
 [178.32.97.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDJsT5sCQzDvNT
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:15:57 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id CD8DA15B34
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:15:52 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id E13772600A2;
 Wed,  9 Nov 2016 09:15:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 0/7] Aspeed SMC improvements
Date: Wed,  9 Nov 2016 09:15:36 +0100
Message-Id: <1478679343-25354-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15796375693575621378
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 09 Nov 2016 08:15:58 -0000

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

Patch 7 is more important as the IO routines are completely reworked.

I dropped the patch activating command mode for read. It is broken on
the witherspoon because the size of the flash module is larger than
the maximum allowable segment window for a CS. It would nice to
activate it when possible but this requires more checks. 

I gave the patches a good test on a palmetto, an ast2500 evb and a
witherspool and the overall result should be a v2 for upstream.

Cheers,

C.

Cédric Le Goater (7):
  mtd: spi-nor: aspeed: fix setting of the register control value for
    writes
  mtd: spi-nor: aspeed: improve 4 bytes mode
  mtd: spi-nor: aspeed: extend the bits definitions
  mtd: spi-nor: aspeed: add some logging
  mtd: spi-nor: aspeed: use smc_read mode when doing DMAs
  mtd: spi-nor: aspeed: prepare for fast read
  mtd: spi-nor: aspeed: rework io routines

 drivers/mtd/spi-nor/aspeed-smc.c | 265 ++++++++++++++++++++++-----------------
 1 file changed, 151 insertions(+), 114 deletions(-)

-- 
2.7.4
