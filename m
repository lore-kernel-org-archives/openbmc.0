Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzp0JRzzDsfg
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bihR096810
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25rnqksguy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:25 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:24 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 97EEF3578058
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cNYs60162094
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cMAq026765
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cMMm026759; Thu, 29 Sep 2016 11:38:22 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 677F1A0248;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 65661E3C36;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 65EA8942E0A; Thu, 29 Sep 2016 11:38:53 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 7/8] net/ncsi: Introduce ncsi_stop_dev()
Date: Thu, 29 Sep 2016 11:38:50 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0004-0000-0000-000001A034F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0005-0000-0000-000008C7F360
Message-Id: <1475113131-18048-8-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:30 -0000

This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
to stop the NCSI device so that it can be reenabled in future. This
API should be called when the network device driver is going to
shutdown the device. There are 3 things done in the function: Stop
the channel monitoring; Reset channels to inactive state; Report
NCSI link down.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 include/net/ncsi.h     |  5 +++++
 net/ncsi/ncsi-manage.c | 33 ++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 11 deletions(-)

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
index 1b797c9..6a96873 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1161,9 +1161,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
 int ncsi_start_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-	struct ncsi_package *np;
-	struct ncsi_channel *nc;
-	int old_state, ret;
+	int ret;
 
 	if (nd->state != ncsi_dev_state_registered &&
 	    nd->state != ncsi_dev_state_functional)
@@ -1175,9 +1173,27 @@ int ncsi_start_dev(struct ncsi_dev *nd)
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
+	int old_state;
+
+	/* Stop the channel monitor and reset channel's state */
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			ncsi_stop_channel_monitor(nc);
+
 			old_state = READ_ONCE(nc->state);
 			WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
 			WARN_ON_ONCE(!list_empty(&nc->link) ||
@@ -1185,14 +1201,9 @@ int ncsi_start_dev(struct ncsi_dev *nd)
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
