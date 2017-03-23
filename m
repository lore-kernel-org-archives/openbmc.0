Return-Path: <clg@kaod.org>
X-Greylist: delayed 901 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Mar 2017 20:07:42 AEDT
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpggL1dmszDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 20:07:41 +1100 (AEDT)
Received: from player688.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 26E9D40C4C
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 09:42:50 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id C8D87200AF;
 Thu, 23 Mar 2017 09:42:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 0/3] Aspeed SMC segment register configuration
Date: Thu, 23 Mar 2017 09:42:34 +0100
Message-Id: <1490258557-16803-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9982510049155386114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjedvgddugedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 23 Mar 2017 09:07:42 -0000

Hi,

Here is a short series providing a couple of fixes on the SMC driver
and adding configuration of the segment registers. These registers set
the mapping windows of the chips on the AHB bus. It is required to be
correct when the controller operates in Command mode, which is the
case for DMAs and the LPC mapping.

The openbmc-4.10 branch is not out yet but we can start reviewing. The
full tree with read optimization cane be found here:

     https://github.com/legoater/linux/commits/openbmc-4.10

Thanks,

C. 

Cédric Le Goater (3):
  mtd: spi-nor: aspeed: fix the AST2400 SMC window size
  mtd: spi-nor: aspeed: fix physical base address of chip
  mtd: spi-nor: aspeed: configure chip window on AHB bus

 drivers/mtd/spi-nor/aspeed-smc.c | 125 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 5 deletions(-)

-- 
2.7.4
