Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGkF41hpzDrLV
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:17 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BN9EX146020
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:23:13 -0400
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25v8gtbfuu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:23:13 -0400
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 16:53:09 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 16:53:08 +0530
Received: from d28relay09.in.ibm.com (d28relay09.in.ibm.com [9.184.220.160])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 7D8EE394005C
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 16:53:07 +0530 (IST)
Received: from d28av08.in.ibm.com (d28av08.in.ibm.com [9.184.220.148])
 by d28relay09.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BN71U31326252
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:07 +0530
Received: from d28av08.in.ibm.com (localhost [127.0.0.1])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BN5gD005322
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 16:53:06 +0530
Received: from gwshan ([9.192.182.193])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BN0Wj005027; Tue, 4 Oct 2016 16:53:01 +0530
Received: by gwshan (Postfix, from userid 1000)
 id 16DA9943209; Tue,  4 Oct 2016 22:23:31 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v3 4.7 4/8] net/ncsi: Rework request index allocation
Date: Tue,  4 Oct 2016 22:23:22 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0004-0000-0000-0000033EB480
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0005-0000-0000-00000FBBA2AE
Message-Id: <1475580206-27370-5-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:18 -0000

The NCSI request index (struct ncsi_request::id) is put into instance
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
 net/ncsi/ncsi-manage.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 66dc851..c956fe8 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -259,6 +259,7 @@ struct ncsi_dev_priv {
 	struct list_head    packages;        /* List of packages           */
 	struct ncsi_request requests[256];   /* Request table              */
 	unsigned int        request_id;      /* Last used request ID       */
+#define NCSI_REQ_START_IDX	1
 	unsigned int        pending_req_num; /* Number of pending requests */
 	struct ncsi_package *active_package; /* Currently handled package  */
 	struct ncsi_channel *active_channel; /* Currently handled channel  */
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 8c5e016..00ce2c7 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -427,30 +427,31 @@ struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven)
 
 	/* Check if there is one available request until the ceiling */
 	spin_lock_irqsave(&ndp->lock, flags);
-	for (i = ndp->request_id; !nr && i < limit; i++) {
+	for (i = ndp->request_id; i < limit; i++) {
 		if (ndp->requests[i].used)
 			continue;
 
 		nr = &ndp->requests[i];
 		nr->used = true;
 		nr->driven = driven;
-		if (++ndp->request_id >= limit)
-			ndp->request_id = 0;
+		ndp->request_id = i + 1;
+		goto found;
 	}
 
 	/* Fail back to check from the starting cursor */
-	for (i = 0; !nr && i < ndp->request_id; i++) {
+	for (i = NCSI_REQ_START_IDX; i < ndp->request_id; i++) {
 		if (ndp->requests[i].used)
 			continue;
 
 		nr = &ndp->requests[i];
 		nr->used = true;
 		nr->driven = driven;
-		if (++ndp->request_id >= limit)
-			ndp->request_id = 0;
+		ndp->request_id = i + 1;
+		goto found;
 	}
-	spin_unlock_irqrestore(&ndp->lock, flags);
 
+found:
+	spin_unlock_irqrestore(&ndp->lock, flags);
 	return nr;
 }
 
@@ -1148,7 +1149,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	/* Initialize private NCSI device */
 	spin_lock_init(&ndp->lock);
 	INIT_LIST_HEAD(&ndp->packages);
-	ndp->request_id = 0;
+	ndp->request_id = NCSI_REQ_START_IDX;
 	for (i = 0; i < ARRAY_SIZE(ndp->requests); i++) {
 		ndp->requests[i].id = i;
 		ndp->requests[i].ndp = ndp;
-- 
2.1.0
