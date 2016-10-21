Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpL4SJJzDvYX
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:06 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0iBMj061610
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:04 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yfnqbf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:00 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:58 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8EDB53578053
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kvwQ4981174
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kvFW028587
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kvPY028576; Fri, 21 Oct 2016 11:46:57 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 03396A019B;
 Fri, 21 Oct 2016 11:46:57 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id F193FE3C5C;
 Fri, 21 Oct 2016 11:46:56 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id D76D094212E; Fri, 21 Oct 2016 11:47:48 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 5/9] net/ncsi: Allow to extend NCSI request properties
Date: Fri, 21 Oct 2016 11:47:42 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0012-0000-0000-000001D95A05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0013-0000-0000-0000064048C5
Message-Id: <1477010866-15126-6-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:07 -0000

There is only one NCSI request property for now: the response for
the sent command need drive the workqueue or not. So we had one
field (@driven) for the purpose. We lost the flexibility to extend
NCSI request properties.

This replaces @driven with @nr_flags and @nca_req_flags in NCSI
request and NCSI command argument struct. Each bit of the newly
introduced field can be used for one property. No functional
changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/internal.h    |  6 +++++-
 net/ncsi/ncsi-cmd.c    |  2 +-
 net/ncsi/ncsi-manage.c | 12 ++++++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 212d77b..18a477b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -41,6 +41,8 @@ struct ncsi_package {
 struct ncsi_req {
 	unsigned char		nr_id;
 	bool			nr_used;
+	unsigned int		nr_flags;
+#define NCSI_REQ_FLAG_EVENT_DRIVEN	1
 	struct ncsi_dev_priv	*nr_ndp;
 	struct sk_buff		*nr_cmd;
 	struct sk_buff		*nr_rsp;
@@ -103,6 +105,7 @@ struct ncsi_cmd_arg {
 	unsigned char		nca_channel;
 	unsigned short		nca_payload;
 	unsigned int		nca_portid;
+	unsigned int		nca_req_flags;
 	union {
 		unsigned char	nca_bytes[16];
 		unsigned short	nca_words[8];
@@ -140,7 +143,8 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
 				   unsigned char id,
 				   struct ncsi_package **np,
 				   struct ncsi_channel **nc);
-struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp);
+struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp,
+				unsigned int req_flags);
 void ncsi_free_req(struct ncsi_req *nr);
 struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
 int ncsi_config_dev(struct ncsi_dev *nd);
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index feedb66..9b0ddb7 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -279,7 +279,7 @@ static struct ncsi_req *ncsi_alloc_cmd_req(struct ncsi_cmd_arg *nca)
 	struct sk_buff *skb;
 	struct ncsi_req *nr;
 
-	nr = ncsi_alloc_req(ndp);
+	nr = ncsi_alloc_req(ndp, nca->nca_req_flags);
 	if (!nr)
 		return NULL;
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 44a740f..e3fe191 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -297,7 +297,8 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
  * same. Otherwise, the bogus response might be replied. So the
  * available IDs are allocated in round-robin fasion.
  */
-struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
+struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp,
+				unsigned int req_flags)
 {
 	struct ncsi_req *nr = NULL;
 	int idx, limit = 256;
@@ -312,6 +313,7 @@ struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
 
 		nr = &ndp->ndp_reqs[idx];
 		nr->nr_used = true;
+		nr->nr_flags = req_flags;
 		atomic_set(&ndp->ndp_last_req_idx, idx + 1);
 		goto found;
 	}
@@ -324,6 +326,7 @@ struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
 
 		nr = &ndp->ndp_reqs[idx];
 		nr->nr_used = true;
+		nr->nr_flags = req_flags;
 		atomic_set(&ndp->ndp_last_req_idx, idx + 1);
 		goto found;
 	}
@@ -338,6 +341,7 @@ void ncsi_free_req(struct ncsi_req *nr)
 	struct ncsi_dev_priv *ndp = nr->nr_ndp;
 	struct sk_buff *cmd, *rsp;
 	unsigned long flags;
+	bool driven;
 
 	if (nr->nr_timer_enabled) {
 		nr->nr_timer_enabled = false;
@@ -350,9 +354,10 @@ void ncsi_free_req(struct ncsi_req *nr)
 	nr->nr_cmd = NULL;
 	nr->nr_rsp = NULL;
 	nr->nr_used = false;
+	driven = !!(nr->nr_flags & NCSI_REQ_FLAG_EVENT_DRIVEN);
 	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
 
-	if (cmd && atomic_dec_return(&ndp->ndp_pending_reqs) == 0)
+	if (driven && cmd && atomic_dec_return(&ndp->ndp_pending_reqs) == 0)
 		schedule_work(&ndp->ndp_work);
 	/* Release command and response */
 	consume_skb(cmd);
@@ -382,6 +387,7 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.nca_ndp = ndp;
+	nca.nca_req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 
 	/* When we're reconfiguring the active channel, the active package
 	 * should be selected and the old setting on the active channel
@@ -523,6 +529,7 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.nca_ndp = ndp;
+	nca.nca_req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->nd_state) {
 	case ncsi_dev_state_probe:
 		nd->nd_state = ncsi_dev_state_probe_deselect;
@@ -694,6 +701,7 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.nca_ndp = ndp;
+	nca.nca_req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->nd_state) {
 	case ncsi_dev_state_suspend:
 		/* If there're no active channel, we're done */
-- 
2.1.0
