Return-Path: <clg@kaod.org>
Received: from 18.mo3.mail-out.ovh.net (18.mo3.mail-out.ovh.net
 [87.98.172.162])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfZXD4nb0zDqtd
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 17:47:40 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A52F1FF828A
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 09:37:39 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 711FB4400B5;
 Wed, 29 Jun 2016 09:37:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] net/aspeednic: start mac after ring buffers are
 initialized
Date: Wed, 29 Jun 2016 09:37:18 +0200
Message-Id: <1467185838-28342-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467185838-28342-1-git-send-email-clg@kaod.org>
References: <1467185838-28342-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8845914094288538370
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
X-List-Received-Date: Wed, 29 Jun 2016 07:47:41 -0000

The set_mac_control_register() routine enables MAC reception and DMAs
before the initialization of the ring buffers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/aspeednic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index cea3394728cc..d0b786ba9f39 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1141,7 +1141,6 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 	aspeednic_probe_phy(dev);
 
 	set_mac_address(dev, bis);
-	set_mac_control_register(dev);
 
 	for (i = 0; i < NUM_RX_DESC; i++) {
 		rx_ring[i].status = cpu_to_le32(RXPKT_RDY);
@@ -1166,6 +1165,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
 	OUTL(dev, ((u32) &rx_ring), RXR_BADR_REG);
 	OUTL(dev, RX_BUFF_SZ, RBSR_REG);
 
+	set_mac_control_register(dev);
 	START_MAC(dev);
 
 	tx_new = 0;
-- 
2.1.4
