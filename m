Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpH2nlNzDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:02 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i4e6041700
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:01 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yf5uuv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:00 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:46:58 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:56 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 14ADD2BB0059
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kuWl19333350
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0ktu3029466
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:55 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0ktRf029460; Fri, 21 Oct 2016 11:46:55 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 7237DA019B;
 Fri, 21 Oct 2016 11:46:55 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 6C44AE3C5C;
 Fri, 21 Oct 2016 11:46:55 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 5195894212E; Fri, 21 Oct 2016 11:47:47 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 1/9] net/ncsi: Remove unused parameters for ncsi_free_req()
Date: Fri, 21 Oct 2016 11:47:38 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0044-0000-0000-000001F15AAC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0045-0000-0000-000005C94F41
Message-Id: <1477010866-15126-2-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:03 -0000
X-List-Received-Date: Fri, 21 Oct 2016 00:47:03 -0000

There are two parameters (@check and @timeout) in ncsi_free_req()
except @nr. @timeout isn't used inside the function. @check should
have been always set to true though it's not case, meaning we
needn't @check.

This removes the unused parameters (@check and @timeout). Eventually,
we have same parameters for this function among 4.4, 4.7 and upstream
code.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    | 2 +-
 net/ncsi/ncsi-cmd.c    | 4 ++--
 net/ncsi/ncsi-manage.c | 6 +++---
 net/ncsi/ncsi-rsp.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 2525229..e97906c 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -139,7 +139,7 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
 				   struct ncsi_package **np,
 				   struct ncsi_channel **nc);
 struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp);
-void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout);
+void ncsi_free_req(struct ncsi_req *nr);
 struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
 int ncsi_config_dev(struct ncsi_dev *nd);
 
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 9dbdcff..feedb66 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -296,7 +296,7 @@ static struct ncsi_req *ncsi_alloc_cmd_req(struct ncsi_cmd_arg *nca)
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
 	if (!skb) {
-		ncsi_free_req(nr, false, false);
+		ncsi_free_req(nr);
 		return NULL;
 	}
 
@@ -366,6 +366,6 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 
 	return 0;
 out:
-	ncsi_free_req(nr, false, false);
+	ncsi_free_req(nr);
 	return ret;
 }
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 5080f72..b32aa39 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -334,7 +334,7 @@ struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
 	return nr;
 }
 
-void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout)
+void ncsi_free_req(struct ncsi_req *nr)
 {
 	struct ncsi_dev_priv *ndp = nr->nr_ndp;
 	struct sk_buff *cmd, *rsp;
@@ -353,7 +353,7 @@ void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout)
 	nr->nr_used = false;
 	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 
-	if (check && cmd && atomic_dec_return(&ndp->ndp_pending_reqs) == 0)
+	if (cmd && atomic_dec_return(&ndp->ndp_pending_reqs) == 0)
 		schedule_work(&ndp->ndp_work);
 	/* Release command and response */
 	consume_skb(cmd);
@@ -802,7 +802,7 @@ static void ncsi_req_timeout(unsigned long data)
 	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 
 	/* Release the request */
-	ncsi_free_req(nr, true, true);
+	ncsi_free_req(nr);
 }
 
 struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index c34998d..c24a1e1 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1166,6 +1166,6 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 
 out:
 	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
-	ncsi_free_req(nr, true, false);
+	ncsi_free_req(nr);
 	return ret;
 }
-- 
2.1.0
