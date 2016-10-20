Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0PgH10XVzDvYG
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:50 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9KN9G6K040559
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:49 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yfjyet-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:49 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 09:10:46 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 09:10:45 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 025482CE805A
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:45 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9KNAiPE19595438
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:44 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9KNAiPV015111
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:44 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9KNAitU015104; Fri, 21 Oct 2016 10:10:44 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 76D40A019B;
 Fri, 21 Oct 2016 10:10:44 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 72937E3C5C;
 Fri, 21 Oct 2016 10:10:44 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 5AFB59417E9; Fri, 21 Oct 2016 10:11:36 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.7 4/4] net/ncsi: Improve HNCDSC AEN handler
Date: Fri, 21 Oct 2016 10:11:32 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102023-0004-0000-0000-000001A95144
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102023-0005-0000-0000-000008EC1FE4
Message-Id: <1477005092-20632-5-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610200409
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
X-List-Received-Date: Thu, 20 Oct 2016 23:10:51 -0000

This improves AEN handler for Host Network Controller Driver Status
Change (HNCDSC):

   * The channel's lock should be hold when accessing its state.
   * Do failover when host driver isn't ready.
   * Configure channel when host driver becomes ready.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-aen.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index b41a661..6898e72 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -141,23 +141,35 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 		return -ENODEV;
 
 	/* If the channel is active one, we need reconfigure it */
+	spin_lock_irqsave(&nc->lock, flags);
 	ncm = &nc->modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] = ntohl(hncdsc->status);
 	if (!list_empty(&nc->link) ||
-	    nc->state != NCSI_CHANNEL_ACTIVE ||
-	    (ncm->data[3] & 0x1))
+	    nc->state != NCSI_CHANNEL_ACTIVE) {
+		spin_unlock_irqrestore(&nc->lock, flags);
 		return 0;
+	}
 
-	if (ndp->flags & NCSI_DEV_HWA)
+	spin_unlock_irqrestore(&nc->lock, flags);
+	if (!(ndp->flags & NCSI_DEV_HWA) && !(ncm->data[3] & 0x1))
 		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
 	/* If this channel is the active one and the link doesn't
 	 * work, we have to choose another channel to be active one.
 	 * The logic here is exactly similar to what we do when link
 	 * is down on the active channel.
+	 *
+	 * On the other hand, we need configure it when host driver
+	 * state on the active channel becomes ready.
 	 */
 	ncsi_stop_channel_monitor(nc);
+
+	spin_lock_irqsave(&nc->lock, flags);
+	nc->state = (ncm->data[3] & 0x1) ? NCSI_CHANNEL_INACTIVE :
+					   NCSI_CHANNEL_ACTIVE;
+	spin_unlock_irqrestore(&nc->lock, flags);
+
 	spin_lock_irqsave(&ndp->lock, flags);
 	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 	spin_unlock_irqrestore(&ndp->lock, flags);
-- 
2.1.0
