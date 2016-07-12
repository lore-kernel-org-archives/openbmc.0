Return-Path: <clg@kaod.org>
Received: from mo179.mail-out.ovh.net (mo179.mail-out.ovh.net [178.32.228.179])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpchq1xL3zDqDT
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 19:52:58 +1000 (AEST)
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 784B8100865C
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 11:52:54 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 2C74752008E;
 Tue, 12 Jul 2016 11:52:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux 4.4] net/ncsi: start the timer before sending the request
Date: Tue, 12 Jul 2016 11:52:36 +0200
Message-Id: <1468317156-31407-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13687846643182570242
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfeejgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 12 Jul 2016 09:52:59 -0000

Currently, the timer is armed after the request is sent. This is racy
with ncsi_rcv_rsp() which discards a response to a NCSI request
received before the timer was enabled.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 The issue is systematic with the fake NCSI backend on qemu

 net/ncsi/ncsi-cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 28f297ac5738..b681220adf09 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -351,12 +351,6 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 		eh->h_source[i] = 0xff;
 	}
 
-	/* Send NCSI packet */
-	skb_get(nr->nr_cmd);
-	ret = dev_queue_xmit(nr->nr_cmd);
-	if (ret)
-		goto out;
-
 	/* Start the timer for the request that might not have
 	 * corresponding response. I'm not sure 1 second delay
 	 * here is enough. Anyway, NCSI is internal network, so
@@ -365,6 +359,12 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	nr->nr_timer_enabled = true;
 	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
 
+	/* Send NCSI packet */
+	skb_get(nr->nr_cmd);
+	ret = dev_queue_xmit(nr->nr_cmd);
+	if (ret)
+		goto out;
+
 	return 0;
 out:
 	ncsi_free_req(nr, false, false);
-- 
2.1.4
