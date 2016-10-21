Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpK26k6zDvYX
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:05 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i5tV052688
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675ygntxt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:00 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:59 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 04B862CE8054
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:59 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kwTR15401132
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kw3m017890
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kwH3017885; Fri, 21 Oct 2016 11:46:58 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 52726A019B;
 Fri, 21 Oct 2016 11:46:58 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 4D981E3C5C;
 Fri, 21 Oct 2016 11:46:58 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 3360394212E; Fri, 21 Oct 2016 11:47:50 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 8/9] net/ncsi: Choose hot channel as active one if
 necessary
Date: Fri, 21 Oct 2016 11:47:45 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0044-0000-0000-000001F15AB1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0045-0000-0000-000005C94F46
Message-Id: <1477010866-15126-9-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610210011
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:05 -0000

The issue was found on BCM5718 which has two NCSI channels in one
package: C0 and C1. C0 is in link-up state while C1 is in link-down
state. C0 is chosen as active channel until unplugging and plugging
C0's cable:  On unplugging C0's cable, LSC (Link State Change) AEN
packet received on C0 to report link-down event. After that, C1 is
chosen as active channel. LSC AEN for link-up event is lost on C0
when plugging C0's cable back. We lose the network even C0 is usable.

This resolves the issue by recording the (hot) channel that was ever
chosen as active one. The hot channel is chosen to be active one
if none of available channels in link-up state. With this, C0 is still
the active one after unplugging C0's cable. LSC AEN packet received
on C0 when plugging its cable back.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 1696b1b..9476652 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -88,6 +88,7 @@ struct ncsi_dev_priv {
 	atomic_t		ndp_package_num;
 	spinlock_t		ndp_package_lock;
 	struct list_head	ndp_packages;
+	struct ncsi_channel	*ndp_hot_channel;
 	atomic_t		ndp_pending_reqs;
 	atomic_t		ndp_last_req_idx;
 #define NCSI_REQ_START_IDX	1
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index a3bae7b..be767a8 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -382,6 +382,7 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 	struct net_device *dev = nd->nd_dev;
 	struct ncsi_package *np = ndp->ndp_active_package;
 	struct ncsi_channel *nc = ndp->ndp_active_channel;
+	struct ncsi_channel *hot_nc = NULL;
 	struct ncsi_cmd_arg nca;
 	unsigned char index;
 	int ret;
@@ -472,8 +473,15 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_config_done:
 		nd->nd_state = ncsi_dev_state_functional;
 		nd->nd_link_up = 0;
-		if (nc->nc_modes[NCSI_MODE_LINK].ncm_data[2] & 0x1)
+		if (nc->nc_modes[NCSI_MODE_LINK].ncm_data[2] & 0x1) {
 			nd->nd_link_up = 1;
+			hot_nc = nc;
+		} else {
+			hot_nc = NULL;
+		}
+
+		/* Update the hot channel */
+		ndp->ndp_hot_channel = hot_nc;
 
 		nd->nd_handler(nd);
 		ndp->ndp_flags &= ~NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
@@ -497,11 +505,13 @@ error:
 static void ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_package *np;
-	struct ncsi_channel *nc;
+	struct ncsi_channel *nc, *hot_nc;
 	struct ncsi_channel_mode *ncm;
 
 	ndp->ndp_active_package = NULL;
 	ndp->ndp_active_channel = NULL;
+
+	hot_nc = ndp->ndp_hot_channel;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			if (!ndp->ndp_active_channel) {
@@ -509,6 +519,11 @@ static void ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 				ndp->ndp_active_channel = nc;
 			}
 
+			if (nc == hot_nc) {
+				ndp->ndp_active_package = np;
+				ndp->ndp_active_channel = nc;
+			}
+
 			ncm = &nc->nc_modes[NCSI_MODE_LINK];
 			if (ncm->ncm_data[2] & 0x1) {
 				ndp->ndp_active_package = np;
-- 
2.1.0
