Return-Path: <clg@kaod.org>
X-Greylist: delayed 945 seconds by postgrey-1.35 at bilbo;
 Tue, 14 Jun 2016 03:33:02 AEST
Received: from 9.mo173.mail-out.ovh.net (9.mo173.mail-out.ovh.net
 [46.105.72.44])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT0H21gvVzDqZv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:33:01 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id E6265FF9C04
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:16:51 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id CE11938006E;
 Mon, 13 Jun 2016 19:16:45 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 00/10] ast2400: Add SMC Support
Date: Mon, 13 Jun 2016 19:16:26 +0200
Message-Id: <1465838196-31131-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16898350230834678530
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 17:33:02 -0000

This is a follow up of the initial serie :

     https://lists.ozlabs.org/pipermail/openbmc/2016-May/003316.html

with only the SMC device model. All issues reported by Andrew should
have been addressed :

 - better checks on register usage

 - use of different qemu classes to initialize the controllers

 - use of a rom memory region for the flash device, to be able to boot
   from 0x0. The interesting part is that qemu is now catching the
   relocation of vectors done by u-boot as if they were writes to the
   flash module. To be investigated.

I should be sending this serie on qemu-devel@ soon but there has been
a large rework of the block devices in the current qemu tree which is
breaking the flash devices. This has to be untangled first.

Thanks,

Cédric Le Goater (10):
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slave object
  ast2400: create SPI flash slaves
  m25p80: provide a realize to support late inits.
  m25p80: add a m25p80_create_rom() routine
  ast2400: handle SPI flash Command mode (read only)
  ast2400: use contents of first SPI flash as a rom
  m25p80: add RDCR instruction for Macronix chip
  m25p80: add mx25l25635f chip
  ast2400: use a mx25l25635f chip

 hw/arm/ast2400.c            |  31 +++
 hw/arm/palmetto-bmc.c       |  20 ++
 hw/block/m25p80.c           |  60 +++++-
 hw/ssi/Makefile.objs        |   1 +
 hw/ssi/aspeed_smc.c         | 504 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h    |   3 +
 include/hw/block/flash.h    |   3 +
 include/hw/ssi/aspeed_smc.h | 106 ++++++++++
 8 files changed, 720 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h

-- 
2.1.4
