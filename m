Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpJ1qRszDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:04 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i5st052746
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:02 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675ygntwx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:02 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:46:59 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:57 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 4DA402CE8059
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kvDu17629368
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kunN028566
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kuDJ028561; Fri, 21 Oct 2016 11:46:56 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 9C0F4A019B;
 Fri, 21 Oct 2016 11:46:56 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 95BB5E3C5C;
 Fri, 21 Oct 2016 11:46:56 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 7B8A194212E; Fri, 21 Oct 2016 11:47:48 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 4/9] net/ncsi: Rework request index allocation
Date: Fri, 21 Oct 2016 11:47:41 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0012-0000-0000-000001D95A04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0013-0000-0000-0000064048C4
Message-Id: <1477010866-15126-5-git-send-email-gwshan@linux.vnet.ibm.com>
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

The NCSI request index (struct ncsi_req::nr_id) is put into instance
ID (IID) field while sending NCSI command packet. It was designed the
available IDs are given in round-robin fashion. @ndp->request_id was
introduced to represent the next available ID, but it has been used
as number of successively allocated IDs. It breaks the round-robin
design. Besides, we shouldn't put 0 to NCSI command packet's IID
field, meaning ID#0 should be reserved according section 6.3.1.1
in NCSI spec (v1.1.0).

This fixes above two issues. With it applied, the available IDs will
be assigned in round-robin fashion and ID#0 won't be assigned.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 23 +++++++++++------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 339177a..212d77b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -87,6 +87,7 @@ struct ncsi_dev_priv {
 	struct list_head	ndp_packages;
 	atomic_t		ndp_pending_reqs;
 	atomic_t		ndp_last_req_idx;
+#define NCSI_REQ_START_IDX	1
 	spinlock_t		ndp_req_lock;
 	struct ncsi_req		ndp_reqs[256];
 	struct work_struct	ndp_work;
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index b728614..44a740f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -306,30 +306,29 @@ struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
 	spin_lock_irqsave(&ndp->ndp_req_lock, flags);
 
 	/* Check if there is one available request until the ceiling */
-	for (idx = atomic_read(&ndp->ndp_last_req_idx);
-	     !nr && idx < limit; idx++) {
+	for (idx = atomic_read(&ndp->ndp_last_req_idx); idx < limit; idx++) {
 		if (ndp->ndp_reqs[idx].nr_used)
 			continue;
 
-		ndp->ndp_reqs[idx].nr_used = true;
 		nr = &ndp->ndp_reqs[idx];
-		atomic_inc(&ndp->ndp_last_req_idx);
-		if (atomic_read(&ndp->ndp_last_req_idx) >= limit)
-			atomic_set(&ndp->ndp_last_req_idx, 0);
+		nr->nr_used = true;
+		atomic_set(&ndp->ndp_last_req_idx, idx + 1);
+		goto found;
 	}
 
 	/* Fail back to check from the starting cursor */
-	for (idx = 0; !nr && idx < atomic_read(&ndp->ndp_last_req_idx); idx++) {
+	for (idx = NCSI_REQ_START_IDX;
+	     idx < atomic_read(&ndp->ndp_last_req_idx); idx++) {
 		if (ndp->ndp_reqs[idx].nr_used)
 			continue;
 
-		ndp->ndp_reqs[idx].nr_used = true;
 		nr = &ndp->ndp_reqs[idx];
-		atomic_inc(&ndp->ndp_last_req_idx);
-		if (atomic_read(&ndp->ndp_last_req_idx) >= limit)
-			atomic_set(&ndp->ndp_last_req_idx, 0);
+		nr->nr_used = true;
+		atomic_set(&ndp->ndp_last_req_idx, idx + 1);
+		goto found;
 	}
 
+found:
 	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 	return nr;
 }
@@ -834,7 +833,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	INIT_LIST_HEAD(&ndp->ndp_packages);
 	INIT_WORK(&ndp->ndp_work, ncsi_dev_work);
 	spin_lock_init(&ndp->ndp_req_lock);
-	atomic_set(&ndp->ndp_last_req_idx, 0);
+	atomic_set(&ndp->ndp_last_req_idx, NCSI_REQ_START_IDX);
 	for (idx = 0; idx < 256; idx++) {
 		ndp->ndp_reqs[idx].nr_id = idx;
 		ndp->ndp_reqs[idx].nr_ndp = ndp;
-- 
2.1.0
