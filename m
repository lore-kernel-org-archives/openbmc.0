Return-Path: <clg@kaod.org>
Received: from mo3.mail-out.ovh.net (mo3.mail-out.ovh.net [178.32.228.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfZf26GWWzDqtW
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 17:52:42 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 506F3FF9337
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 09:37:30 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 102C4440097;
 Wed, 29 Jun 2016 09:37:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot/v2016.05-aspeed-openbmc 0/3] aspeed/ast-g4: misc fixes
Date: Wed, 29 Jun 2016 09:37:15 +0200
Message-Id: <1467185838-28342-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8843099346489608962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudeggdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 29 Jun 2016 07:52:43 -0000

Here are couple of fixes for the AST2400 (G4) on the new uboot branch.

Cédric Le Goater (3):
  aspeed/ast-g4: select the correct cpu
  aspeed/ast-g4: use literal defines in misc_init_r()
  net/aspeednic: start mac after ring buffers are initialized

 arch/arm/Kconfig             |  1 +
 board/aspeed/ast-g4/ast-g4.c | 15 +++++++++------
 drivers/net/aspeednic.c      |  2 +-
 include/configs/ast-g4.h     |  1 +
 4 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.1.4
