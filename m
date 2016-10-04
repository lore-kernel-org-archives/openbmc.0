Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGkJ6cLczDrLM
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BN5o3053492
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:23:18 -0400
Received: from e28smtp09.in.ibm.com (e28smtp09.in.ibm.com [125.16.236.9])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25v8ptat4p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:23:18 -0400
Received: from localhost
 by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 16:53:14 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp09.in.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 16:53:13 +0530
Received: from d28relay09.in.ibm.com (d28relay09.in.ibm.com [9.184.220.160])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 467E11258060
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 16:53:38 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
 by d28relay09.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BNCSO28704798
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:12 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BNBfL019164
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:12 +0530
Received: from gwshan ([9.192.182.193])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BN90d019114; Tue, 4 Oct 2016 16:53:09 +0530
Received: by gwshan (Postfix, from userid 1000)
 id E9B229431D9; Tue,  4 Oct 2016 22:23:29 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v3 4.7 1/8] net/ncsi: Avoid unused-value build warning from
 ia64-linux-gcc
Date: Tue,  4 Oct 2016 22:23:19 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0060-0000-0000-000001536013
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0061-0000-0000-00001005F93C
Message-Id: <1475580206-27370-2-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610040200
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:21 -0000

xchg() is used to set NCSI channel's state in order for consistent
access to the state. xchg()'s return value should be used. Otherwise,
one build warning will be raised (with -Wunused-value) as below message
indicates. It is reported by ia64-linux-gcc (GCC) 4.9.0.

 net/ncsi/ncsi-manage.c: In function 'ncsi_channel_monitor':
 arch/ia64/include/uapi/asm/cmpxchg.h:56:2: warning: value computed is \
 not used [-Wunused-value]
  ((__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr), sizeof(*(ptr))))
   ^
 net/ncsi/ncsi-manage.c:202:3: note: in expansion of macro 'xchg'
  xchg(&nc->state, NCSI_CHANNEL_INACTIVE);

This removes the atomic access to NCSI channel's state avoid the above
build warning. We have to hold the channel's lock when its state is readed
or updated. No functional changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/ncsi-aen.c    | 37 +++++++++++++++++++-------
 net/ncsi/ncsi-manage.c | 71 ++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 81 insertions(+), 27 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index d463468..b41a661 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -53,7 +53,9 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	struct ncsi_aen_lsc_pkt *lsc;
 	struct ncsi_channel *nc;
 	struct ncsi_channel_mode *ncm;
-	unsigned long old_data;
+	bool chained;
+	int state;
+	unsigned long old_data, data;
 	unsigned long flags;
 
 	/* Find the NCSI channel */
@@ -62,20 +64,27 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 		return -ENODEV;
 
 	/* Update the link status */
-	ncm = &nc->modes[NCSI_MODE_LINK];
 	lsc = (struct ncsi_aen_lsc_pkt *)h;
+
+	spin_lock_irqsave(&nc->lock, flags);
+	ncm = &nc->modes[NCSI_MODE_LINK];
 	old_data = ncm->data[2];
-	ncm->data[2] = ntohl(lsc->status);
+	data = ntohl(lsc->status);
+	ncm->data[2] = data;
 	ncm->data[4] = ntohl(lsc->oem_status);
-	if (!((old_data ^ ncm->data[2]) & 0x1) ||
-	    !list_empty(&nc->link))
+
+	chained = !list_empty(&nc->link);
+	state = nc->state;
+	spin_unlock_irqrestore(&nc->lock, flags);
+
+	if (!((old_data ^ data) & 0x1) || chained)
 		return 0;
-	if (!(nc->state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] & 0x1)) &&
-	    !(nc->state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] & 0x1)))
+	if (!(state == NCSI_CHANNEL_INACTIVE && (data & 0x1)) &&
+	    !(state == NCSI_CHANNEL_ACTIVE && !(data & 0x1)))
 		return 0;
 
 	if (!(ndp->flags & NCSI_DEV_HWA) &&
-	    nc->state == NCSI_CHANNEL_ACTIVE)
+	    state == NCSI_CHANNEL_ACTIVE)
 		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
 	ncsi_stop_channel_monitor(nc);
@@ -97,13 +106,21 @@ static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
 	if (!nc)
 		return -ENODEV;
 
+	spin_lock_irqsave(&nc->lock, flags);
 	if (!list_empty(&nc->link) ||
-	    nc->state != NCSI_CHANNEL_ACTIVE)
+	    nc->state != NCSI_CHANNEL_ACTIVE) {
+		spin_unlock_irqrestore(&nc->lock, flags);
 		return 0;
+	}
+	spin_unlock_irqrestore(&nc->lock, flags);
 
 	ncsi_stop_channel_monitor(nc);
+	spin_lock_irqsave(&nc->lock, flags);
+	nc->state = NCSI_CHANNEL_INVISIBLE;
+	spin_unlock_irqrestore(&nc->lock, flags);
+
 	spin_lock_irqsave(&ndp->lock, flags);
-	xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+	nc->state = NCSI_CHANNEL_INACTIVE;
 	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index ef017b8..a26ce51 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -132,6 +132,7 @@ static void ncsi_report_link(struct ncsi_dev_priv *ndp, bool force_down)
 	struct ncsi_dev *nd = &ndp->ndev;
 	struct ncsi_package *np;
 	struct ncsi_channel *nc;
+	unsigned long flags;
 
 	nd->state = ncsi_dev_state_functional;
 	if (force_down) {
@@ -142,14 +143,21 @@ static void ncsi_report_link(struct ncsi_dev_priv *ndp, bool force_down)
 	nd->link_up = 0;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			spin_lock_irqsave(&nc->lock, flags);
+
 			if (!list_empty(&nc->link) ||
-			    nc->state != NCSI_CHANNEL_ACTIVE)
+			    nc->state != NCSI_CHANNEL_ACTIVE) {
+				spin_unlock_irqrestore(&nc->lock, flags);
 				continue;
+			}
 
 			if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
+				spin_unlock_irqrestore(&nc->lock, flags);
 				nd->link_up = 1;
 				goto report;
 			}
+
+			spin_unlock_irqrestore(&nc->lock, flags);
 		}
 	}
 
@@ -163,20 +171,22 @@ static void ncsi_channel_monitor(unsigned long data)
 	struct ncsi_package *np = nc->package;
 	struct ncsi_dev_priv *ndp = np->ndp;
 	struct ncsi_cmd_arg nca;
-	bool enabled;
+	bool enabled, chained;
 	unsigned int timeout;
 	unsigned long flags;
-	int ret;
+	int state, ret;
 
 	spin_lock_irqsave(&nc->lock, flags);
+	state = nc->state;
+	chained = !list_empty(&nc->link);
 	timeout = nc->timeout;
 	enabled = nc->enabled;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	if (!enabled || !list_empty(&nc->link))
+	if (!enabled || chained)
 		return;
-	if (nc->state != NCSI_CHANNEL_INACTIVE &&
-	    nc->state != NCSI_CHANNEL_ACTIVE)
+	if (state != NCSI_CHANNEL_INACTIVE &&
+	    state != NCSI_CHANNEL_ACTIVE)
 		return;
 
 	if (!(timeout % 2)) {
@@ -195,11 +205,15 @@ static void ncsi_channel_monitor(unsigned long data)
 
 	if (timeout + 1 >= 3) {
 		if (!(ndp->flags & NCSI_DEV_HWA) &&
-		    nc->state == NCSI_CHANNEL_ACTIVE)
+		    state == NCSI_CHANNEL_ACTIVE)
 			ncsi_report_link(ndp, true);
 
+		spin_lock_irqsave(&nc->lock, flags);
+		nc->state = NCSI_CHANNEL_INVISIBLE;
+		spin_unlock_irqrestore(&nc->lock, flags);
+
 		spin_lock_irqsave(&ndp->lock, flags);
-		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+		nc->state = NCSI_CHANNEL_INACTIVE;
 		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 		spin_unlock_irqrestore(&ndp->lock, flags);
 		ncsi_process_next_channel(ndp);
@@ -508,6 +522,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 	struct ncsi_package *np = ndp->active_package;
 	struct ncsi_channel *nc = ndp->active_channel;
 	struct ncsi_cmd_arg nca;
+	unsigned long flags;
 	int ret;
 
 	nca.ndp = ndp;
@@ -556,7 +571,9 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 
 		break;
 	case ncsi_dev_state_suspend_done:
-		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+		spin_lock_irqsave(&nc->lock, flags);
+		nc->state = NCSI_CHANNEL_INACTIVE;
+		spin_unlock_irqrestore(&nc->lock, flags);
 		ncsi_process_next_channel(ndp);
 
 		break;
@@ -574,6 +591,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	struct ncsi_channel *nc = ndp->active_channel;
 	struct ncsi_cmd_arg nca;
 	unsigned char index;
+	unsigned long flags;
 	int ret;
 
 	nca.ndp = ndp;
@@ -675,10 +693,12 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		break;
 	case ncsi_dev_state_config_done:
+		spin_lock_irqsave(&nc->lock, flags);
 		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
-			xchg(&nc->state, NCSI_CHANNEL_ACTIVE);
+			nc->state = NCSI_CHANNEL_ACTIVE;
 		else
-			xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+			nc->state = NCSI_CHANNEL_INACTIVE;
+		spin_unlock_irqrestore(&nc->lock, flags);
 
 		ncsi_start_channel_monitor(nc);
 		ncsi_process_next_channel(ndp);
@@ -707,18 +727,25 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	found = NULL;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			spin_lock_irqsave(&nc->lock, flags);
+
 			if (!list_empty(&nc->link) ||
-			    nc->state != NCSI_CHANNEL_INACTIVE)
+			    nc->state != NCSI_CHANNEL_INACTIVE) {
+				spin_unlock_irqrestore(&nc->lock, flags);
 				continue;
+			}
 
 			if (!found)
 				found = nc;
 
 			ncm = &nc->modes[NCSI_MODE_LINK];
 			if (ncm->data[2] & 0x1) {
+				spin_unlock_irqrestore(&nc->lock, flags);
 				found = nc;
 				goto out;
 			}
+
+			spin_unlock_irqrestore(&nc->lock, flags);
 		}
 	}
 
@@ -987,11 +1014,14 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 		goto out;
 	}
 
-	old_state = xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
 	list_del_init(&nc->link);
-
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
+	spin_lock_irqsave(&nc->lock, flags);
+	old_state = nc->state;
+	nc->state = NCSI_CHANNEL_INVISIBLE;
+	spin_unlock_irqrestore(&nc->lock, flags);
+
 	ndp->active_channel = nc;
 	ndp->active_package = nc->package;
 
@@ -1006,7 +1036,7 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 		break;
 	default:
 		netdev_err(ndp->ndev.dev, "Invalid state 0x%x on %d:%d\n",
-			   nc->state, nc->package->id, nc->id);
+			   old_state, nc->package->id, nc->id);
 		ncsi_report_link(ndp, false);
 		return -EINVAL;
 	}
@@ -1151,6 +1181,8 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
 	struct ncsi_package *np;
 	struct ncsi_channel *nc;
+	unsigned long flags;
+	bool chained;
 	int old_state, ret;
 
 	if (nd->state != ncsi_dev_state_registered &&
@@ -1166,8 +1198,13 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 	/* Reset channel's state and start over */
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			old_state = xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
-			WARN_ON_ONCE(!list_empty(&nc->link) ||
+			spin_lock_irqsave(&nc->lock, flags);
+			chained = !list_empty(&nc->link);
+			old_state = nc->state;
+			nc->state = NCSI_CHANNEL_INACTIVE;
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			WARN_ON_ONCE(chained ||
 				     old_state == NCSI_CHANNEL_INVISIBLE);
 		}
 	}
-- 
2.1.0
