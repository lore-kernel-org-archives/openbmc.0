Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skMZw3V7vzDrX7
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:24 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8S2lQki027839
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:22 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25qv5xpr0u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:21 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 28 Sep 2016 12:48:18 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Sep 2016 12:48:15 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 469733578056
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:15 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8S2mFIS33488898
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:15 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8S2mEc5020534
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:14 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8S2mEeX020525; Wed, 28 Sep 2016 12:48:14 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 7FFC5A0195;
 Wed, 28 Sep 2016 12:48:14 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 7C403E3C36;
 Wed, 28 Sep 2016 12:48:14 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 0B33B942BBC; Wed, 28 Sep 2016 12:48:44 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v4.7 7/7] net/ncsi: Introduce ncsi_stop_dev()
Date: Wed, 28 Sep 2016 12:48:35 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092802-0012-0000-0000-000001CF6F52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092802-0013-0000-0000-000006188A91
Message-Id: <1475030915-9525-7-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609280049
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
X-List-Received-Date: Wed, 28 Sep 2016 02:48:25 -0000

This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
to stop the NCSI device so that it can be enabled in future. This
API should be called when the network device driver is going to
shutdown the device. There are 3 things done in the function: Stop
the channel monitoring; Reset channels to inactive state; Report
NCSI link down.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c |  2 ++
 include/net/ncsi.h                       |  1 +
 net/ncsi/ncsi-manage.c                   | 37 +++++++++++++++++++++-----------
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 134b9c5..f40fa92 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1189,6 +1189,8 @@ static int ftgmac100_stop(struct net_device *netdev)
 	napi_disable(&priv->napi);
 	if (netdev->phydev)
 		phy_stop(netdev->phydev);
+	else if (priv->use_ncsi)
+		ncsi_stop_dev(priv->ndev);
 
 	ftgmac100_stop_hw(priv);
 	free_irq(priv->irq, netdev);
diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index 1dbf42f..3d166f7 100644
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
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 5813ebe..73ab65f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1160,9 +1160,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
 int ncsi_start_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-	struct ncsi_package *np;
-	struct ncsi_channel *nc;
-	int old_state, ret;
+	int ret;
 
 	if (nd->state != ncsi_dev_state_registered &&
 	    nd->state != ncsi_dev_state_functional)
@@ -1174,16 +1172,6 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return 0;
 	}
 
-	/* Reset channel's state and start over */
-	NCSI_FOR_EACH_PACKAGE(ndp, np) {
-		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			old_state = atomic_xchg(&nc->state,
-						NCSI_CHANNEL_INACTIVE);
-			WARN_ON_ONCE(!list_empty(&nc->link) ||
-				     old_state == NCSI_CHANNEL_INVISIBLE);
-		}
-	}
-
 	if (ndp->flags & NCSI_DEV_HWA)
 		ret = ncsi_enable_hwa(ndp);
 	else
@@ -1193,6 +1181,29 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 }
 EXPORT_SYMBOL_GPL(ncsi_start_dev);
 
+void ncsi_stop_dev(struct ncsi_dev *nd)
+{
+	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
+	struct ncsi_package *np;
+	struct ncsi_channel *nc;
+	int old_state;
+
+	/* Stop the channel monitor and reset channel's state */
+	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			ncsi_stop_channel_monitor(nc);
+
+			old_state = atomic_xchg(&nc->state,
+						NCSI_CHANNEL_INACTIVE);
+			WARN_ON_ONCE(!list_empty(&nc->link) ||
+				     old_state == NCSI_CHANNEL_INVISIBLE);
+                }
+        }
+
+	ncsi_report_link(ndp, true);
+}
+EXPORT_SYMBOL_GPL(ncsi_stop_dev);
+
 void ncsi_unregister_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-- 
2.1.0
