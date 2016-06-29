Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhY6rhhzDqxr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:37 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 68A0BFF9788
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:34 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 4FD7B440097;
 Wed, 29 Jun 2016 18:10:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 3/9] net: aspeednic: Do not fill
 in a random MAC address
Date: Wed, 29 Jun 2016 18:09:45 +0200
Message-Id: <1467216591-8616-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17507462079026924290
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
X-List-Received-Date: Wed, 29 Jun 2016 16:10:38 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Do not check the u-boot environemnt or fill in a random address
in the write_hwaddr hook, instead rely on the framework to do so.

The doc/README.ethaddr specifically states that random addresses
are only to be assigned as part of a emergency such as a netboot
recovery command.

The upstream commit created a config variable to assign a
random mac when none is set leaving it zero and that has now
been backported.

Note: The hardware address is reset to 0 as part of the ethernet
reset performed at boot.  If no valid MAC address is found in
the environment the hardware will contain zeros and the operating
system will assign a valid random MAC address if u-boot is
configured not to.

The net effect is an attempt to use the network will result in
the ethernet address not set warning being printed if the ethaddr
variable is not set, and a warning iwth the random mac address
if the config is set.  If a valid ethernet address is set
in the environment it will be programmed in the hardware and
used by the operating system.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/aspeednic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 71e5548fbc05..3f79b949194a 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1351,10 +1351,6 @@ static void aspeednic_halt(struct eth_device* dev)
 
 static int aspeednic_write_hwaddr(struct eth_device* dev)
 {
-	if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
-		net_random_ethaddr(dev->enetaddr);
-	}
-
 	OUTL(dev, ((dev->enetaddr[2] << 24) | (dev->enetaddr[3] << 16)
 				| (dev->enetaddr[4] << 8) | dev->enetaddr[5]), MAC_LADR_REG);
 	OUTL(dev, ((dev->enetaddr[0] << 8) | dev->enetaddr[1]), MAC_MADR_REG);
-- 
2.1.4
