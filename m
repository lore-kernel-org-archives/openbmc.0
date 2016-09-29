Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzm1nmlzDsWf
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bjZV071905
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:26 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25rrt9jds4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:25 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:22 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 284FD3578058
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:22 +1000 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cMJS6488414
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:22 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cL1W027473
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:21 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cLRU027450; Thu, 29 Sep 2016 11:38:21 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 29A97A01D8;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 24810E3C36;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 25461942E0A; Thu, 29 Sep 2016 11:38:52 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 1/8] net/ncsi: Avoid unused-value build warning from
 ia64-linux-gcc
Date: Thu, 29 Sep 2016 11:38:44 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0048-0000-0000-000001C2E31C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0049-0000-0000-000046A5909F
Message-Id: <1475113131-18048-2-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609290026
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:28 -0000
X-List-Received-Date: Thu, 29 Sep 2016 01:38:28 -0000

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

This replaces the atomic access to NCSI channel's state with READ_ONCE()
and WRITE_ONCE() to avoid the above build warning. We needn't hold the
channel's lock when updating its state as well. No logical changes
introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-aen.c    | 19 +++++++++++++------
 net/ncsi/ncsi-manage.c | 37 +++++++++++++++++++++----------------
 net/ncsi/ncsi-rsp.c    | 13 +++----------
 3 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index d463468..abc5473 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -53,6 +53,7 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	struct ncsi_aen_lsc_pkt *lsc;
 	struct ncsi_channel *nc;
 	struct ncsi_channel_mode *ncm;
+	int old_state;
 	unsigned long old_data;
 	unsigned long flags;
 
@@ -70,12 +71,14 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	if (!((old_data ^ ncm->data[2]) & 0x1) ||
 	    !list_empty(&nc->link))
 		return 0;
-	if (!(nc->state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] & 0x1)) &&
-	    !(nc->state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] & 0x1)))
+
+	old_state = READ_ONCE(nc->state);
+	if (!(old_state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] & 0x1)) &&
+	    !(old_state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] & 0x1)))
 		return 0;
 
 	if (!(ndp->flags & NCSI_DEV_HWA) &&
-	    nc->state == NCSI_CHANNEL_ACTIVE)
+	    old_state == NCSI_CHANNEL_ACTIVE)
 		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
 	ncsi_stop_channel_monitor(nc);
@@ -90,6 +93,7 @@ static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
 			       struct ncsi_aen_pkt_hdr *h)
 {
 	struct ncsi_channel *nc;
+	int old_state;
 	unsigned long flags;
 
 	/* Find the NCSI channel */
@@ -97,13 +101,14 @@ static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
 	if (!nc)
 		return -ENODEV;
 
+	old_state = READ_ONCE(nc->state);
 	if (!list_empty(&nc->link) ||
-	    nc->state != NCSI_CHANNEL_ACTIVE)
+	    old_state != NCSI_CHANNEL_ACTIVE)
 		return 0;
 
 	ncsi_stop_channel_monitor(nc);
+	WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 	spin_lock_irqsave(&ndp->lock, flags);
-	xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
 	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
@@ -116,6 +121,7 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	struct ncsi_channel *nc;
 	struct ncsi_channel_mode *ncm;
 	struct ncsi_aen_hncdsc_pkt *hncdsc;
+	int old_state;
 	unsigned long flags;
 
 	/* Find the NCSI channel */
@@ -127,8 +133,9 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	ncm = &nc->modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] = ntohl(hncdsc->status);
+	old_state = READ_ONCE(nc->state);
 	if (!list_empty(&nc->link) ||
-	    nc->state != NCSI_CHANNEL_ACTIVE ||
+	    old_state != NCSI_CHANNEL_ACTIVE ||
 	    (ncm->data[3] & 0x1))
 		return 0;
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index ef017b8..fc0ae54 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -143,7 +143,7 @@ static void ncsi_report_link(struct ncsi_dev_priv *ndp, bool force_down)
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			if (!list_empty(&nc->link) ||
-			    nc->state != NCSI_CHANNEL_ACTIVE)
+			    READ_ONCE(nc->state) != NCSI_CHANNEL_ACTIVE)
 				continue;
 
 			if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
@@ -166,7 +166,7 @@ static void ncsi_channel_monitor(unsigned long data)
 	bool enabled;
 	unsigned int timeout;
 	unsigned long flags;
-	int ret;
+	int old_state, ret;
 
 	spin_lock_irqsave(&nc->lock, flags);
 	timeout = nc->timeout;
@@ -175,8 +175,10 @@ static void ncsi_channel_monitor(unsigned long data)
 
 	if (!enabled || !list_empty(&nc->link))
 		return;
-	if (nc->state != NCSI_CHANNEL_INACTIVE &&
-	    nc->state != NCSI_CHANNEL_ACTIVE)
+
+	old_state = READ_ONCE(nc->state);
+	if (old_state != NCSI_CHANNEL_INACTIVE &&
+	    old_state != NCSI_CHANNEL_ACTIVE)
 		return;
 
 	if (!(timeout % 2)) {
@@ -195,11 +197,11 @@ static void ncsi_channel_monitor(unsigned long data)
 
 	if (timeout + 1 >= 3) {
 		if (!(ndp->flags & NCSI_DEV_HWA) &&
-		    nc->state == NCSI_CHANNEL_ACTIVE)
+		    old_state == NCSI_CHANNEL_ACTIVE)
 			ncsi_report_link(ndp, true);
 
+		WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 		spin_lock_irqsave(&ndp->lock, flags);
-		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
 		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 		spin_unlock_irqrestore(&ndp->lock, flags);
 		ncsi_process_next_channel(ndp);
@@ -266,7 +268,7 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
 
 	nc->id = id;
 	nc->package = np;
-	nc->state = NCSI_CHANNEL_INACTIVE;
+	WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 	nc->enabled = false;
 	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned long)nc);
 	spin_lock_init(&nc->lock);
@@ -309,7 +311,7 @@ static void ncsi_remove_channel(struct ncsi_channel *nc)
 		kfree(ncf);
 	}
 
-	nc->state = NCSI_CHANNEL_INACTIVE;
+	WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 	spin_unlock_irqrestore(&nc->lock, flags);
 	ncsi_stop_channel_monitor(nc);
 
@@ -556,7 +558,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 
 		break;
 	case ncsi_dev_state_suspend_done:
-		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+		WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 		ncsi_process_next_channel(ndp);
 
 		break;
@@ -676,9 +678,9 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		break;
 	case ncsi_dev_state_config_done:
 		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
-			xchg(&nc->state, NCSI_CHANNEL_ACTIVE);
+			WRITE_ONCE(nc->state, NCSI_CHANNEL_ACTIVE);
 		else
-			xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+			WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 
 		ncsi_start_channel_monitor(nc);
 		ncsi_process_next_channel(ndp);
@@ -708,7 +710,7 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			if (!list_empty(&nc->link) ||
-			    nc->state != NCSI_CHANNEL_INACTIVE)
+			    READ_ONCE(nc->state) != NCSI_CHANNEL_INACTIVE)
 				continue;
 
 			if (!found)
@@ -770,7 +772,8 @@ static int ncsi_enable_hwa(struct ncsi_dev_priv *ndp)
 	spin_lock_irqsave(&ndp->lock, flags);
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			WARN_ON_ONCE(nc->state != NCSI_CHANNEL_INACTIVE ||
+			WARN_ON_ONCE(READ_ONCE(nc->state) !=
+				     NCSI_CHANNEL_INACTIVE ||
 				     !list_empty(&nc->link));
 			ncsi_stop_channel_monitor(nc);
 			list_add_tail_rcu(&nc->link, &ndp->channel_queue);
@@ -987,7 +990,8 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 		goto out;
 	}
 
-	old_state = xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
+	old_state = READ_ONCE(nc->state);
+	WRITE_ONCE(nc->state, NCSI_CHANNEL_INVISIBLE);
 	list_del_init(&nc->link);
 
 	spin_unlock_irqrestore(&ndp->lock, flags);
@@ -1006,7 +1010,7 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 		break;
 	default:
 		netdev_err(ndp->ndev.dev, "Invalid state 0x%x on %d:%d\n",
-			   nc->state, nc->package->id, nc->id);
+			   READ_ONCE(nc->state), nc->package->id, nc->id);
 		ncsi_report_link(ndp, false);
 		return -EINVAL;
 	}
@@ -1166,7 +1170,8 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 	/* Reset channel's state and start over */
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			old_state = xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
+			old_state = READ_ONCE(nc->state);
+			WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 			WARN_ON_ONCE(!list_empty(&nc->link) ||
 				     old_state == NCSI_CHANNEL_INVISIBLE);
 		}
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index af84389..9ee25ab 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -111,7 +111,6 @@ static int ncsi_rsp_handler_dp(struct ncsi_request *nr)
 	struct ncsi_dev_priv *ndp = nr->ndp;
 	struct ncsi_package *np;
 	struct ncsi_channel *nc;
-	unsigned long flags;
 
 	/* Find the package */
 	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
@@ -121,11 +120,8 @@ static int ncsi_rsp_handler_dp(struct ncsi_request *nr)
 		return -ENODEV;
 
 	/* Change state of all channels attached to the package */
-	NCSI_FOR_EACH_CHANNEL(np, nc) {
-		spin_lock_irqsave(&nc->lock, flags);
-		nc->state = NCSI_CHANNEL_INACTIVE;
-		spin_unlock_irqrestore(&nc->lock, flags);
-	}
+	NCSI_FOR_EACH_CHANNEL(np, nc)
+		WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 
 	return 0;
 }
@@ -184,7 +180,6 @@ static int ncsi_rsp_handler_rc(struct ncsi_request *nr)
 	struct ncsi_rsp_pkt *rsp;
 	struct ncsi_dev_priv *ndp = nr->ndp;
 	struct ncsi_channel *nc;
-	unsigned long flags;
 
 	/* Find the package and channel */
 	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
@@ -194,9 +189,7 @@ static int ncsi_rsp_handler_rc(struct ncsi_request *nr)
 		return -ENODEV;
 
 	/* Update state for the specified channel */
-	spin_lock_irqsave(&nc->lock, flags);
-	nc->state = NCSI_CHANNEL_INACTIVE;
-	spin_unlock_irqrestore(&nc->lock, flags);
+	WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 
 	return 0;
 }
-- 
2.1.0
