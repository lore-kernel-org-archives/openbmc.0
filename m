Return-Path: <clg@kaod.org>
Received: from 3.mo3.mail-out.ovh.net (3.mo3.mail-out.ovh.net [46.105.44.175])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhZ3BN2zDqxr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:38 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id CA3C8FF9847
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:34 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 9AD054400D2;
 Wed, 29 Jun 2016 18:10:31 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 4/9] net/aspeednic: start mac
 after ring buffers are initialized
Date: Wed, 29 Jun 2016 18:09:46 +0200
Message-Id: <1467216591-8616-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17508306502191909634
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

The set_mac_control_register() routine enables MAC reception and DMAs
before the initialization of the ring buffers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/aspeednic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 3f79b949194a..8b85893a4f74 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1140,7 +1140,6 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 	aspeednic_probe_phy(dev);
 
 	aspeednic_write_hwaddr(dev);
-	set_mac_control_register(dev);
 
 	for (i = 0; i < NUM_RX_DESC; i++) {
 		rx_ring[i].status = cpu_to_le32(RXPKT_RDY);
@@ -1165,6 +1164,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 	OUTL(dev, ((u32) &rx_ring), RXR_BADR_REG);
 	OUTL(dev, RX_BUFF_SZ, RBSR_REG);
 
+	set_mac_control_register(dev);
 	START_MAC(dev);
 
 	tx_new = 0;
-- 
2.1.4
