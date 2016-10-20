Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0PgG5l35zDvYB
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9KN9FuZ143537
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:47 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yh311s-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:47 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 09:10:44 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 09:10:43 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 2FA852CE8054
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9KNAhhe12189894
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9KNAgP3024776
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9KNAgNw024769; Fri, 21 Oct 2016 10:10:42 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 9899FA019B;
 Fri, 21 Oct 2016 10:10:42 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 8A0F7E3C5C;
 Fri, 21 Oct 2016 10:10:42 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 7281C9417E9; Fri, 21 Oct 2016 10:11:34 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.7 1/4] net/ncsi: Avoid if statements in
 ncsi_suspend_channel()
Date: Fri, 21 Oct 2016 10:11:29 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102023-0044-0000-0000-000001F152EF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102023-0045-0000-0000-000005C93417
Message-Id: <1477005092-20632-2-git-send-email-gwshan@linux.vnet.ibm.com>
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

There are several if/else statements in the state machine implemented
by switch/case in ncsi_suspend_channel() to avoid duplicated code. It
makes the code a bit hard to be understood.

This drops if/else statements in ncsi_suspend_channel() to improve the
code readability as Joel Stanley suggested. Also, it becomes easy to
add more states in the state machine without affecting current code.
No logical changes introduced by this.

Suggested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-manage.c | 78 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 28 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 5e509e5..655d0d6 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -540,42 +540,60 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		nd->state = ncsi_dev_state_suspend_select;
 		/* Fall through */
 	case ncsi_dev_state_suspend_select:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_SP;
+		nca.package = np->id;
+		nca.channel = NCSI_RESERVED_CHANNEL;
+		if (ndp->flags & NCSI_DEV_HWA)
+			nca.bytes[0] = 0;
+		else
+			nca.bytes[0] = 1;
+
+		nd->state = ncsi_dev_state_suspend_dcnt;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_dcnt:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_DCNT;
+		nca.package = np->id;
+		nca.channel = nc->id;
+
+		nd->state = ncsi_dev_state_suspend_dc;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_dc:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_DC;
+		nca.package = np->id;
+		nca.channel = nc->id;
+		nca.bytes[0] = 1;
+
+		nd->state = ncsi_dev_state_suspend_deselect;
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
+
+		break;
 	case ncsi_dev_state_suspend_deselect:
 		ndp->pending_req_num = 1;
 
-		np = ndp->active_package;
-		nc = ndp->active_channel;
+		nca.type = NCSI_PKT_CMD_DP;
 		nca.package = np->id;
-		if (nd->state == ncsi_dev_state_suspend_select) {
-			nca.type = NCSI_PKT_CMD_SP;
-			nca.channel = NCSI_RESERVED_CHANNEL;
-			if (ndp->flags & NCSI_DEV_HWA)
-				nca.bytes[0] = 0;
-			else
-				nca.bytes[0] = 1;
-			nd->state = ncsi_dev_state_suspend_dcnt;
-		} else if (nd->state == ncsi_dev_state_suspend_dcnt) {
-			nca.type = NCSI_PKT_CMD_DCNT;
-			nca.channel = nc->id;
-			nd->state = ncsi_dev_state_suspend_dc;
-		} else if (nd->state == ncsi_dev_state_suspend_dc) {
-			nca.type = NCSI_PKT_CMD_DC;
-			nca.channel = nc->id;
-			nca.bytes[0] = 1;
-			nd->state = ncsi_dev_state_suspend_deselect;
-		} else if (nd->state == ncsi_dev_state_suspend_deselect) {
-			nca.type = NCSI_PKT_CMD_DP;
-			nca.channel = NCSI_RESERVED_CHANNEL;
-			nd->state = ncsi_dev_state_suspend_done;
-		}
+		nca.channel = NCSI_RESERVED_CHANNEL;
 
+		nd->state = ncsi_dev_state_suspend_done;
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret) {
-			nd->state = ncsi_dev_state_functional;
-			return;
-		}
+		if (ret)
+			goto error;
 
 		break;
 	case ncsi_dev_state_suspend_done:
@@ -589,6 +607,10 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		netdev_warn(nd->dev, "Wrong NCSI state 0x%x in suspend\n",
 			    nd->state);
 	}
+
+	return;
+error:
+	nd->state = ncsi_dev_state_functional;
 }
 
 static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
-- 
2.1.0
