Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r34zf3VNTzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:46 +1000 (AEST)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:48:44 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:48:42 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 993272CE8054
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:41 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491mX8Q48431236
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:41 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491m9vW015678
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:09 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491m9wW015056; Mon, 9 May 2016 11:48:09 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id CFF1BA039A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id CF468E3A5A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id C2733942B91; Mon,  9 May 2016 11:47:21 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 6/8] net/ncsi: Improvement for ncsi_dev_suspend()
Date: Mon,  9 May 2016 11:47:17 +1000
Message-Id: <1462758439-27910-7-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0013-0000-0000-000005175C78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2016 01:48:46 -0000

The function is used to deconfigure current active channel so that
we can pick another available channel as active. At end of it, the
all available packages and channels are purged. It's not correct.
Also, the new active channel should be finalized before configuring
it using ncsi_dev_config().

This improves the function from above two aspects.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-manage.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 9ed51f2..48575d2 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -686,7 +686,7 @@ error:
 static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndp_ndev;
-	struct ncsi_package *np, *tmp;
+	struct ncsi_package *np;
 	struct ncsi_channel *nc;
 	struct ncsi_cmd_arg nca;
 	int ret;
@@ -740,12 +740,11 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 		break;
 	case ncsi_dev_state_suspend_done:
 done:
-		spin_lock(&ndp->ndp_package_lock);
-		list_for_each_entry_safe(np, tmp, &ndp->ndp_packages, np_node)
-			ncsi_release_package(np);
-		spin_unlock(&ndp->ndp_package_lock);
+		if (ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE)
+			ncsi_choose_active_channel(ndp);
 
-		if (!(ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE)) {
+		if (!(ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE) ||
+		    !ndp->ndp_active_channel) {
 			nd->nd_state = ncsi_dev_state_functional;
 			nd->nd_link_up = 0;
 			nd->nd_handler(nd);
-- 
2.1.0
