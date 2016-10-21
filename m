Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpH4NjkzDvYX
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:03 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i5Ye085171
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:01 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675ygwheb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:01 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:46:58 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:57 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id B23762CE8054
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kuDf19464332
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kurM022339
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0ktZO022334; Fri, 21 Oct 2016 11:46:55 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D3C70A019B;
 Fri, 21 Oct 2016 11:46:55 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id CE616E3C5C;
 Fri, 21 Oct 2016 11:46:55 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id B1E1C94212E; Fri, 21 Oct 2016 11:47:47 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 2/9] net/ncsi: Introduce NCSI_RESERVED_CHANNEL
Date: Fri, 21 Oct 2016 11:47:39 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0044-0000-0000-000001F15AAD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0045-0000-0000-000005C94F44
Message-Id: <1477010866-15126-3-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:04 -0000

This defines NCSI_RESERVED_CHANNEL as the reserved NCSI channel
ID (0x1f). No logical changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index e97906c..339177a 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -5,6 +5,7 @@ struct ncsi_dev_priv;
 struct ncsi_package;
 
 #define NCSI_PACKAGE_INDEX(c)	(((c) >> 5) & 0x7)
+#define NCSI_RESERVED_CHANNEL	0x1f
 #define NCSI_CHANNEL_INDEX(c)	((c) & 0x1ffff)
 #define NCSI_TO_CHANNEL(p, c)	((((p) & 0x7) << 5) | ((c) & 0x1ffff))
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index b32aa39..3d1d775 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -397,7 +397,7 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 		nca.nca_type = NCSI_PKT_CMD_SP;
 		nca.nca_bytes[0] = 1;
 		nca.nca_package = np->np_id;
-		nca.nca_channel = 0x1f;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
@@ -533,7 +533,7 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 
 		/* Deselect all possible packages */
 		nca.nca_type = NCSI_PKT_CMD_DP;
-		nca.nca_channel = 0x1f;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		for (index = 0; index < 8; index++) {
 			nca.nca_package = index;
 			ret = ncsi_xmit_cmd(&nca);
@@ -549,7 +549,7 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 		/* Select all possible packages */
 		nca.nca_type = NCSI_PKT_CMD_SP;
 		nca.nca_bytes[0] = 1;
-		nca.nca_channel = 0x1f;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		for (index = 0; index < 8; index++) {
 			nca.nca_package = index;
 			ret = ncsi_xmit_cmd(&nca);
@@ -608,7 +608,7 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 		nca.nca_type = NCSI_PKT_CMD_SP;
 		nca.nca_bytes[0] = 1;
 		nca.nca_package = ndp->ndp_active_package->np_id;
-		nca.nca_channel = 0x1f;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
@@ -666,7 +666,7 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 		/* Deselect the active package */
 		nca.nca_type = NCSI_PKT_CMD_DP;
 		nca.nca_package = ndp->ndp_active_package->np_id;
-		nca.nca_channel = 0x1f;
+		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
@@ -716,7 +716,7 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 		nca.nca_package = np->np_id;
 		if (nd->nd_state == ncsi_dev_state_suspend_select) {
 			nca.nca_type = NCSI_PKT_CMD_SP;
-			nca.nca_channel = 0x1f;
+			nca.nca_channel = NCSI_RESERVED_CHANNEL;
 			nca.nca_bytes[0] = 1;
 			nd->nd_state = ncsi_dev_state_suspend_dcnt;
 		} else if (nd->nd_state == ncsi_dev_state_suspend_dcnt) {
@@ -730,7 +730,7 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 			nd->nd_state = ncsi_dev_state_suspend_deselect;
 		} else if (nd->nd_state == ncsi_dev_state_suspend_deselect) {
 			nca.nca_type = NCSI_PKT_CMD_DP;
-			nca.nca_channel = 0x1f;
+			nca.nca_channel = NCSI_RESERVED_CHANNEL;
 			nd->nd_state = ncsi_dev_state_suspend_done;
 		}
 
-- 
2.1.0
