Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzn20YPzDsff
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bj1X100004
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25rknx6fan-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:25 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 6C16B2CE8057
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cNAI52035770
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cM7Q026007
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:23 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cMfh025985; Thu, 29 Sep 2016 11:38:22 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 11B72A01D8;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 0F001E3C36;
 Thu, 29 Sep 2016 11:38:22 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 0FF19942E0A; Thu, 29 Sep 2016 11:38:53 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 5/8] net/ncsi: Allow to extend NCSI request properties
Date: Thu, 29 Sep 2016 11:38:48 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0048-0000-0000-000001C2E31F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0049-0000-0000-000046A590A1
Message-Id: <1475113131-18048-6-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=4
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:29 -0000

There is only one NCSI request property for now: the response for
the sent command need drive the workqueue or not. So we had one
field (@driven) for the purpose. We lost the flexibility to extend
NCSI request properties.

This replaces @driven with @flags and @req_flags in NCSI request
and NCSI command argument struct. Each bit of the newly introduced
field can be used for one property. No functional changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/internal.h    |  8 +++++---
 net/ncsi/ncsi-cmd.c    |  2 +-
 net/ncsi/ncsi-manage.c | 19 ++++++++++---------
 net/ncsi/ncsi-rsp.c    |  2 +-
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index c956fe8..26e9295 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -207,7 +207,8 @@ struct ncsi_package {
 struct ncsi_request {
 	unsigned char        id;      /* Request ID - 0 to 255           */
 	bool                 used;    /* Request that has been assigned  */
-	bool                 driven;  /* Drive state machine             */
+	unsigned int         flags;   /* NCSI request property           */
+#define NCSI_REQ_FLAG_EVENT_DRIVEN	1
 	struct ncsi_dev_priv *ndp;    /* Associated NCSI device          */
 	struct sk_buff       *cmd;    /* Associated NCSI command packet  */
 	struct sk_buff       *rsp;    /* Associated NCSI response packet */
@@ -276,7 +277,7 @@ struct ncsi_cmd_arg {
 	unsigned char        package;     /* Destination package ID        */
 	unsigned char        channel;     /* Detination channel ID or 0x1f */
 	unsigned short       payload;     /* Command packet payload length */
-	bool                 driven;      /* Drive the state machine?      */
+	unsigned int         req_flags;   /* NCSI request properties       */
 	union {
 		unsigned char  bytes[16]; /* Command packet specific data  */
 		unsigned short words[8];
@@ -315,7 +316,8 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
 				   unsigned char id,
 				   struct ncsi_package **np,
 				   struct ncsi_channel **nc);
-struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven);
+struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
+					unsigned int req_flags);
 void ncsi_free_request(struct ncsi_request *nr);
 struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
 int ncsi_process_next_channel(struct ncsi_dev_priv *ndp);
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 21057a8..db7083b 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -272,7 +272,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 	struct sk_buff *skb;
 	struct ncsi_request *nr;
 
-	nr = ncsi_alloc_request(ndp, nca->driven);
+	nr = ncsi_alloc_request(ndp, nca->req_flags);
 	if (!nr)
 		return NULL;
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 64aab38..41d6af9 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -186,7 +186,7 @@ static void ncsi_channel_monitor(unsigned long data)
 		nca.package = np->id;
 		nca.channel = nc->id;
 		nca.type = NCSI_PKT_CMD_GLS;
-		nca.driven = false;
+		nca.req_flags = 0;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret) {
 			netdev_err(ndp->ndev.dev, "Error %d sending GLS\n",
@@ -407,7 +407,8 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
  * be same. Otherwise, the bogus response might be replied. So
  * the available IDs are allocated in round-robin fashion.
  */
-struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven)
+struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
+					unsigned int req_flags)
 {
 	struct ncsi_request *nr = NULL;
 	int i, limit = ARRAY_SIZE(ndp->requests);
@@ -421,7 +422,7 @@ struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven)
 
 		nr = &ndp->requests[i];
 		nr->used = true;
-		nr->driven = driven;
+		nr->flags = req_flags;
 		ndp->request_id = i + 1;
 		goto found;
 	}
@@ -433,7 +434,7 @@ struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp, bool driven)
 
 		nr = &ndp->requests[i];
 		nr->used = true;
-		nr->driven = driven;
+		nr->flags = req_flags;
 		ndp->request_id = i + 1;
 		goto found;
 	}
@@ -461,7 +462,7 @@ void ncsi_free_request(struct ncsi_request *nr)
 	nr->cmd = NULL;
 	nr->rsp = NULL;
 	nr->used = false;
-	driven = nr->driven;
+	driven = !!(nr->flags & NCSI_REQ_FLAG_EVENT_DRIVEN);
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
 	if (driven && cmd && --ndp->pending_req_num == 0)
@@ -514,7 +515,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.ndp = ndp;
-	nca.driven = true;
+	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
 	case ncsi_dev_state_suspend:
 		nd->state = ncsi_dev_state_suspend_select;
@@ -580,7 +581,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.ndp = ndp;
-	nca.driven = true;
+	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
 	case ncsi_dev_state_config:
 	case ncsi_dev_state_config_sp:
@@ -801,7 +802,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 	int ret;
 
 	nca.ndp = ndp;
-	nca.driven = true;
+	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
 	case ncsi_dev_state_probe:
 		nd->state = ncsi_dev_state_probe_deselect;
@@ -1075,7 +1076,7 @@ static int ncsi_inet6addr_event(struct notifier_block *this,
 		return NOTIFY_OK;
 
 	nca.ndp = ndp;
-	nca.driven = false;
+	nca.req_flags = 0;
 	nca.package = np->id;
 	nca.channel = nc->id;
 	nca.dwords[0] = nc->caps[NCSI_CAP_MC].cap;
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 9ee25ab..5143490 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -310,7 +310,7 @@ static int ncsi_rsp_handler_gls(struct ncsi_request *nr)
 	ncm->data[3] = ntohl(rsp->other);
 	ncm->data[4] = ntohl(rsp->oem_status);
 
-	if (nr->driven)
+	if (nr->flags & NCSI_REQ_FLAG_EVENT_DRIVEN)
 		return 0;
 
 	/* Reset the channel monitor if it has been enabled */
-- 
2.1.0
