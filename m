Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skMZr31FzzDrWj
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8S2lNj1109684
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:17 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25r2ykdrdv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:17 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 28 Sep 2016 12:48:14 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Sep 2016 12:48:13 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 1A2B72CE8046
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:13 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8S2mD4Q46137512
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:13 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8S2mCHL028375
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:12 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8S2mC2F028364; Wed, 28 Sep 2016 12:48:12 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 8A10CA0195;
 Wed, 28 Sep 2016 12:48:12 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 87BAFE3C36;
 Wed, 28 Sep 2016 12:48:12 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 1A843942BBC; Wed, 28 Sep 2016 12:48:43 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v4.7 4/7] net/ncsi: Rework request index allocation
Date: Wed, 28 Sep 2016 12:48:32 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092802-0004-0000-0000-0000019FC4CD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092802-0005-0000-0000-000008C60D00
Message-Id: <1475030915-9525-4-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
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
X-List-Received-Date: Wed, 28 Sep 2016 02:48:21 -0000

This reworks request index allocation for: (A) @ndp->request_id should
represent last allocated request index instead of accumulated request
indexes; (B) The request index (1) is reserved according to section
6.3.1.1 in v1.1.0 NCSI spec.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 0a5c580..821f1d3 100644
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
index 8011d51..282be06 100644
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
 
@@ -1121,7 +1122,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
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
