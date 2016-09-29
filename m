Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzq1HqVzDshy
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:30 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bidJ080184
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25rrpujk4a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:25 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:24 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 8E1862CE8059
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cNTU52035774
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cNOQ032396
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cMm2032386; Thu, 29 Sep 2016 11:38:22 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 3F1EBA0236;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 3C093E3C36;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 3CFB1942E0A; Thu, 29 Sep 2016 11:38:53 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 6/8] net/ncsi: Rework the channel monitoring
Date: Thu, 29 Sep 2016 11:38:49 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0048-0000-0000-000001C2E320
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0049-0000-0000-000046A590A2
Message-Id: <1475113131-18048-7-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:31 -0000

The original NCSI channel monitoring was implemented based on a
backoff algorithm: the GLS response should be received in the
specified interval. Otherwise, the channel is regarded as dead
and failover should be taken if current channel is an active one.
There are several problems in the implementation: (A) On BCM5718,
we found when the IID (Instance ID) in the GLS command packet
changes from 255 to 1, the response corresponding to IID#1 never
comes in. It means we cannot make the unfair judgement that the
channel is dead when one response is missed. (B) The code's
readability should be improved. (C) We should do failover when
current channel is active one and the channel monitoring should
be marked as disabled before doing failover.

This reworks the channel monitoring to address all above issues.
The fields for channel monitoring is put into separate struct
and the state of channel monitoring is predefined. The channel
is regarded alive if the network controller responses to one of
two GLS commands or both of them in 5 seconds.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    | 12 +++++++++---
 net/ncsi/ncsi-manage.c | 46 ++++++++++++++++++++++++++--------------------
 net/ncsi/ncsi-rsp.c    |  2 +-
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 26e9295..13290a7 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -187,9 +187,15 @@ struct ncsi_channel {
 	struct ncsi_channel_mode    modes[NCSI_MODE_MAX];
 	struct ncsi_channel_filter  *filters[NCSI_FILTER_MAX];
 	struct ncsi_channel_stats   stats;
-	struct timer_list           timer;	/* Link monitor timer  */
-	bool                        enabled;	/* Timer is enabled    */
-	unsigned int                timeout;	/* Times of timeout    */
+	struct {
+		struct timer_list   timer;
+		bool                enabled;
+		unsigned int        state;
+#define NCSI_CHANNEL_MONITOR_START	0
+#define NCSI_CHANNEL_MONITOR_RETRY	1
+#define NCSI_CHANNEL_MONITOR_WAIT	2
+#define NCSI_CHANNEL_MONITOR_WAIT_MAX	5
+	} monitor;
 	struct list_head            node;
 	struct list_head            link;
 };
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 41d6af9..1b797c9 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -164,13 +164,13 @@ static void ncsi_channel_monitor(unsigned long data)
 	struct ncsi_dev_priv *ndp = np->ndp;
 	struct ncsi_cmd_arg nca;
 	bool enabled;
-	unsigned int timeout;
+	unsigned int monitor_state;
 	unsigned long flags;
 	int old_state, ret;
 
 	spin_lock_irqsave(&nc->lock, flags);
-	timeout = nc->timeout;
-	enabled = nc->enabled;
+	enabled = nc->monitor.enabled;
+	monitor_state = nc->monitor.state;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
 	if (!enabled || !list_empty(&nc->link))
@@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long data)
 	    old_state != NCSI_CHANNEL_ACTIVE)
 		return;
 
-	if (!(timeout % 2)) {
+	switch (monitor_state) {
+	case NCSI_CHANNEL_MONITOR_START:
+	case NCSI_CHANNEL_MONITOR_RETRY:
 		nca.ndp = ndp;
 		nca.package = np->id;
 		nca.channel = nc->id;
@@ -193,14 +195,18 @@ static void ncsi_channel_monitor(unsigned long data)
 				   ret);
 			return;
 		}
-	}
 
-	if (timeout + 1 >= 3) {
+		break;
+	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
+		break;
+	default:
 		if (!(ndp->flags & NCSI_DEV_HWA) &&
-		    old_state == NCSI_CHANNEL_ACTIVE)
+		    old_state == NCSI_CHANNEL_ACTIVE) {
 			ncsi_report_link(ndp, true);
+			ndp->flags |= NCSI_DEV_RESHUFFLE;
+		}
 
-		WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
+		WRITE_ONCE(nc->state, NCSI_CHANNEL_ACTIVE);
 		spin_lock_irqsave(&ndp->lock, flags);
 		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
 		spin_unlock_irqrestore(&ndp->lock, flags);
@@ -209,10 +215,9 @@ static void ncsi_channel_monitor(unsigned long data)
 	}
 
 	spin_lock_irqsave(&nc->lock, flags);
-	nc->timeout = timeout + 1;
-	nc->enabled = true;
+	nc->monitor.state++;
 	spin_unlock_irqrestore(&nc->lock, flags);
-	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout / 2)));
+	mod_timer(&nc->monitor.timer, jiffies + HZ);
 }
 
 void ncsi_start_channel_monitor(struct ncsi_channel *nc)
@@ -220,12 +225,12 @@ void ncsi_start_channel_monitor(struct ncsi_channel *nc)
 	unsigned long flags;
 
 	spin_lock_irqsave(&nc->lock, flags);
-	WARN_ON_ONCE(nc->enabled);
-	nc->timeout = 0;
-	nc->enabled = true;
+	WARN_ON_ONCE(nc->monitor.enabled);
+	nc->monitor.enabled = true;
+	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout / 2)));
+	mod_timer(&nc->monitor.timer, jiffies + HZ);
 }
 
 void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
@@ -233,14 +238,14 @@ void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
 	unsigned long flags;
 
 	spin_lock_irqsave(&nc->lock, flags);
-	if (!nc->enabled) {
+	if (!nc->monitor.enabled) {
 		spin_unlock_irqrestore(&nc->lock, flags);
 		return;
 	}
-	nc->enabled = false;
+	nc->monitor.enabled = false;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	del_timer_sync(&nc->timer);
+	del_timer_sync(&nc->monitor.timer);
 }
 
 struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
@@ -269,8 +274,9 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
 	nc->id = id;
 	nc->package = np;
 	WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
-	nc->enabled = false;
-	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned long)nc);
+	nc->monitor.enabled = false;
+	setup_timer(&nc->monitor.timer,
+		    ncsi_channel_monitor, (unsigned long)nc);
 	spin_lock_init(&nc->lock);
 	INIT_LIST_HEAD(&nc->link);
 	for (index = 0; index < NCSI_CAP_MAX; index++)
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 5143490..1618eda 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -315,7 +315,7 @@ static int ncsi_rsp_handler_gls(struct ncsi_request *nr)
 
 	/* Reset the channel monitor if it has been enabled */
 	spin_lock_irqsave(&nc->lock, flags);
-	nc->timeout = 0;
+	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
 	return 0;
-- 
2.1.0
