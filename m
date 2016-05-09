Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r350C0R8czDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:49:15 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:49:14 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:49:12 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 01A602CE8059
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:49:12 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491n3u7000268
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:49:11 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491mdDU022331
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:39 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491mdtx021719; Mon, 9 May 2016 11:48:39 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 01D87A039F;
 Mon,  9 May 2016 11:47:22 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 0209AE3A5A;
 Mon,  9 May 2016 11:47:22 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id E95BC942B91; Mon,  9 May 2016 11:47:21 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 7/8] net/farady: Keep MAC always active for NCSI packets
Date: Mon,  9 May 2016 11:47:18 +1000
Message-Id: <1462758439-27910-8-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0021-0000-0000-000009865717
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Mon, 09 May 2016 01:49:15 -0000

The status of MAC and NCSI interface are sychronized. When NCSI
interface is down, the MAC is brought down. It means the NCSI
packets (especially AEN packets) cannot be received by the MAC's
driver even they're transmitted by far end. It causes one issue:
the ethernet cable is unplugged initially and system boots up
with down NCSI interface. The MAC stops receiving any ingress
traffic including NCSI packets. At later point, one NCSI (AEN)
packet is sent from far end when the ethernet cable is plugged.
We're going to miss the AEN on local end and the interface has
to be down for ever.

This keeps the receive/transmit buffer, IRQ and NAPI are always
enabled so that we won't miss any NCSI packets even the interrupt
is currently in link down state.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 87ddc97..7eae197 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1320,18 +1320,9 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
 
 static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
 {
-	struct net_device *netdev = nd->nd_dev;
-
-	if (nd->nd_state != ncsi_dev_state_functional)
-		return;
-
-	if (nd->nd_link_up) {
-		pr_info("NCSI dev is up\n");
-		netif_start_queue(netdev);
-	} else {
-		pr_info("NCSI dev is down\n");
-		ftgmac100_stop_dev(netdev);
-	}
+	if (nd->nd_state == ncsi_dev_state_functional)
+		pr_info("NCSI interface %s\n",
+			nd->nd_link_up ? "up" : "down");
 }
 /******************************************************************************
  * struct platform_driver functions
-- 
2.1.0
