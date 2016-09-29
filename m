Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzq1g3czDsj1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:31 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bhUF017208
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25rq32f0bv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:28 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:25 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:24 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 79E122BB0054
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cNQQ53018744
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cMT7026762
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cM2J026746; Thu, 29 Sep 2016 11:38:22 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D4C5FA01B7;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id D2055E3C36;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id D301C942E0A; Thu, 29 Sep 2016 11:38:52 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 4/8] net/ncsi: Rework request index allocation
Date: Thu, 29 Sep 2016 11:38:47 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0016-0000-0000-000001D7DF9D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0017-0000-0000-000005887F3C
Message-Id: <1475113131-18048-5-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:31 -0000

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
index 3eeb915..64aab38 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -415,30 +415,31 @@ struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven)
 
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
 
@@ -1122,7 +1123,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
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
