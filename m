Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGk72214zDrFn
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BN6Hq053583
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:23:08 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25v8ptasm2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:23:08 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 21:23:03 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 21:23:02 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 6552E3578058
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:02 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BN22M62849190
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:23:02 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BN1Bb010360
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:23:02 +1100
Received: from gwshan ([9.192.182.193])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BN0Yb010340; Tue, 4 Oct 2016 22:23:01 +1100
Received: by gwshan (Postfix, from userid 1000)
 id D3446943214; Tue,  4 Oct 2016 22:23:31 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v3 4.7 7/8] net/ncsi: Introduce ncsi_stop_dev()
Date: Tue,  4 Oct 2016 22:23:25 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0012-0000-0000-000001D1D1C6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0013-0000-0000-000006232F6F
Message-Id: <1475580206-27370-8-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:12 -0000

This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
to stop the NCSI device so that it can be reenabled in future. This
API should be called when the network device driver is going to
shutdown the device. There are 3 things done in the function: Stop
the channel monitoring; Reset channels to inactive state; Report
NCSI link down.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/net/ncsi.h     |  5 +++++
 net/ncsi/ncsi-manage.c | 37 ++++++++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index 1dbf42f..68680ba 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -31,6 +31,7 @@ struct ncsi_dev {
 struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 				   void (*notifier)(struct ncsi_dev *nd));
 int ncsi_start_dev(struct ncsi_dev *nd);
+void ncsi_stop_dev(struct ncsi_dev *nd);
 void ncsi_unregister_dev(struct ncsi_dev *nd);
 #else /* !CONFIG_NET_NCSI */
 static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
@@ -44,6 +45,10 @@ static inline int ncsi_start_dev(struct ncsi_dev *nd)
 	return -ENOTTY;
 }
 
+static void ncsi_stop_dev(struct ncsi_dev *nd)
+{
+}
+
 static inline void ncsi_unregister_dev(struct ncsi_dev *nd)
 {
 }
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 4742c7c..5e509e5 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1187,11 +1187,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
 int ncsi_start_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-	struct ncsi_package *np;
-	struct ncsi_channel *nc;
-	unsigned long flags;
-	bool chained;
-	int old_state, ret;
+	int ret;
 
 	if (nd->state != ncsi_dev_state_registered &&
 	    nd->state != ncsi_dev_state_functional)
@@ -1203,9 +1199,29 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return 0;
 	}
 
-	/* Reset channel's state and start over */
+	if (ndp->flags & NCSI_DEV_HWA)
+		ret = ncsi_enable_hwa(ndp);
+	else
+		ret = ncsi_choose_active_channel(ndp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ncsi_start_dev);
+
+void ncsi_stop_dev(struct ncsi_dev *nd)
+{
+	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
+	struct ncsi_package *np;
+	struct ncsi_channel *nc;
+	bool chained;
+	int old_state;
+	unsigned long flags;
+
+	/* Stop the channel monitor and reset channel's state */
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			ncsi_stop_channel_monitor(nc);
+
 			spin_lock_irqsave(&nc->lock, flags);
 			chained = !list_empty(&nc->link);
 			old_state = nc->state;
@@ -1217,14 +1233,9 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		}
 	}
 
-	if (ndp->flags & NCSI_DEV_HWA)
-		ret = ncsi_enable_hwa(ndp);
-	else
-		ret = ncsi_choose_active_channel(ndp);
-
-	return ret;
+	ncsi_report_link(ndp, true);
 }
-EXPORT_SYMBOL_GPL(ncsi_start_dev);
+EXPORT_SYMBOL_GPL(ncsi_stop_dev);
 
 void ncsi_unregister_dev(struct ncsi_dev *nd)
 {
-- 
2.1.0
