Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpL3tbNzDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i4KR142914
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:04 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yx5kbm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:01 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:58 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 05E503578057
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kvXR15401128
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kv6j020488
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kvIc020485; Fri, 21 Oct 2016 11:46:57 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 64A9FA019B;
 Fri, 21 Oct 2016 11:46:57 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 5F6C0E3C5C;
 Fri, 21 Oct 2016 11:46:57 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 493DF94212E; Fri, 21 Oct 2016 11:47:49 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 6/9] net/ncsi: Avoid if statements in ncsi_suspend_dev()
Date: Fri, 21 Oct 2016 11:47:43 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0004-0000-0000-000001A958C6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0005-0000-0000-000008EC3ADC
Message-Id: <1477010866-15126-7-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:07 -0000

There are several if/else statements in the state machine implemented
by switch/case in ncsi_suspend_dev() to avoid duplicated code. It
makes the code a bit hard to be understood.

This drops if/else statements in ncsi_suspend_dev() to improve the
code readability as Joel Stanley suggested. Also, it becomes easy to
add more states in the state machine without affecting current code.
No logical changes introduced by this.

Comparing to the original patch, this also drops the tag "done" in
ncsi_suspend_dev(). The code path covered by the tag is replaced
by newly introduced tag "error".

Suggested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-manage.c | 83 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index e3fe191..99045ed 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -695,8 +695,8 @@ error:
 static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndp_ndev;
-	struct ncsi_package *np;
-	struct ncsi_channel *nc;
+	struct ncsi_package *np = ndp->ndp_active_package;
+	struct ncsi_channel *nc = ndp->ndp_active_channel;
 	struct ncsi_cmd_arg nca;
 	int ret;
 
@@ -705,51 +705,66 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 	switch (nd->nd_state) {
 	case ncsi_dev_state_suspend:
 		/* If there're no active channel, we're done */
-		if (!ndp->ndp_active_channel) {
-			nd->nd_state = ncsi_dev_state_suspend_done;
-			goto done;
-		}
+		if (!ndp->ndp_active_channel)
+			goto error;
 
 		nd->nd_state = ncsi_dev_state_suspend_select;
 		/* Fall through */
 	case ncsi_dev_state_suspend_select:
+		atomic_set(&ndp->ndp_pending_reqs, 1);
+
+		nca.nca_type = NCSI_PKT_CMD_SP;
+		nca.nca_package = np->np_id;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
+		nca.nca_bytes[0] = 1;
+
+		nd->nd_state = ncsi_dev_state_suspend_dcnt;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_dcnt:
+		atomic_set(&ndp->ndp_pending_reqs, 1);
+
+		nca.nca_type = NCSI_PKT_CMD_DCNT;
+		nca.nca_package = np->np_id;
+		nca.nca_channel = nc->nc_id;
+
+		nd->nd_state = ncsi_dev_state_suspend_dc;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_dc:
+		atomic_set(&ndp->ndp_pending_reqs, 1);
+
+		nca.nca_type = NCSI_PKT_CMD_DC;
+		nca.nca_package = np->np_id;
+		nca.nca_channel = nc->nc_id;
+		nca.nca_bytes[0] = 1;
+
+		nd->nd_state = ncsi_dev_state_suspend_deselect;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_deselect:
 		atomic_set(&ndp->ndp_pending_reqs, 1);
 
-		np = ndp->ndp_active_package;
-		nc = ndp->ndp_active_channel;
+		nca.nca_type = NCSI_PKT_CMD_DP;
 		nca.nca_package = np->np_id;
-		if (nd->nd_state == ncsi_dev_state_suspend_select) {
-			nca.nca_type = NCSI_PKT_CMD_SP;
-			nca.nca_channel = NCSI_RESERVED_CHANNEL;
-			nca.nca_bytes[0] = 1;
-			nd->nd_state = ncsi_dev_state_suspend_dcnt;
-		} else if (nd->nd_state == ncsi_dev_state_suspend_dcnt) {
-			nca.nca_type = NCSI_PKT_CMD_DCNT;
-			nca.nca_channel = nc->nc_id;
-			nd->nd_state = ncsi_dev_state_suspend_dc;
-		} else if (nd->nd_state == ncsi_dev_state_suspend_dc) {
-			nca.nca_type = NCSI_PKT_CMD_DC;
-			nca.nca_channel = nc->nc_id;
-			nca.nca_bytes[0] = 1;
-			nd->nd_state = ncsi_dev_state_suspend_deselect;
-		} else if (nd->nd_state == ncsi_dev_state_suspend_deselect) {
-			nca.nca_type = NCSI_PKT_CMD_DP;
-			nca.nca_channel = NCSI_RESERVED_CHANNEL;
-			nd->nd_state = ncsi_dev_state_suspend_done;
-		}
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 
+		nd->nd_state = ncsi_dev_state_suspend_done;
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret) {
-			nd->nd_state = ncsi_dev_state_suspend_done;
-			goto done;
-		}
+		if (ret)
+			goto error;
 
 		break;
 	case ncsi_dev_state_suspend_done:
-done:
 		if (ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE)
 			ncsi_choose_active_channel(ndp);
 
@@ -767,6 +782,10 @@ done:
 		pr_warn("%s: Unsupported NCSI dev state 0x%x\n",
 			__func__, nd->nd_state);
 	}
+
+	return;
+error:
+	nd->nd_state = ncsi_dev_state_functional;
 }
 
 static void ncsi_dev_work(struct work_struct *work)
-- 
2.1.0
