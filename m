Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhQ000QzDqv7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:29 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 44526FF974B
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:27 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 057A044006D;
 Wed, 29 Jun 2016 18:10:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 2/9] net: aspeednic: Do not
 start hardware in initialize
Date: Wed, 29 Jun 2016 18:09:44 +0200
Message-Id: <1467216591-8616-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17506336179511528194
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 16:10:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Delete the call to aspeenic_init from the aspeenic_initialize
function.  Instead rely on the framework to call the write_hwaddr
method to set the MAC address for the operating system to use.

The aspeednic driver was calling init before registering the
hardware, causing the dma engine to be left running writing
incoming ethernet packets to memory when handing control to the
operating system.

The initialize function is specifically documented to not touch
the hardware or probe in doc/README.drivers.net.

Also, the init method can take a significant amount of time
especially when NC-SI and retries are involved.  In addition
extra work is being performed to find the MAC address which the
framework will do again later.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/aspeednic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 7ce7056d88a2..71e5548fbc05 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -557,8 +557,6 @@ int aspeednic_initialize(bd_t *bis)
 		udelay(10 * 1000);
 	}
 
-	dev->init(dev, bis);
-
 	eth_register(dev);
 
 #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
-- 
2.1.4
