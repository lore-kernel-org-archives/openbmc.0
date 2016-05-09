Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r350B4LT2zDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:49:14 +1000 (AEST)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:49:14 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:49:12 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id F12B52CE8057
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:49:11 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491n30Y29032586
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:49:11 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491mdS7022343
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:39 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491mdnr021722; Mon, 9 May 2016 11:48:39 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 26964A03B0;
 Mon,  9 May 2016 11:47:22 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 26D6BE3A5A;
 Mon,  9 May 2016 11:47:22 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 1C241942B91; Mon,  9 May 2016 11:47:22 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 8/8] net/ncsi: LSC AEN handler improvement
Date: Mon,  9 May 2016 11:47:19 +1000
Message-Id: <1462758439-27910-9-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0025-0000-0000-000004985A59
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
X-List-Received-Date: Mon, 09 May 2016 01:49:14 -0000

This improves the LSC (Link Status Change) AEN handler:

   * The first channel with up link is choosen as active channel.
   * The first channel is choosen as active channel if none of channels
     is link up.
   * The active channel is always configured when its link becomes up
     or it's just picked as new active channel.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-aen.c    |  6 +++---
 net/ncsi/ncsi-manage.c | 22 ++++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 87caaa8..5bc0873 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -81,14 +81,14 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	ncm->ncm_data[2] = ntohl(lsc->status);
 	ncm->ncm_data[4] = ntohl(lsc->oem_status);
 	if (!ndp->ndp_active_channel ||
-	    ndp->ndp_active_channel != nc ||
-	    ncm->ncm_data[2] & 0x1)
+	    ndp->ndp_active_channel != nc)
 		return 0;
 
 	/* If this channel is the active one and the link is down,
 	 * we have to choose another channel to be active one.
 	 */
-	ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
+	if (!(ncm->ncm_data[2] & 0x1))
+		ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
 	ncsi_suspend_dev(nd);
 
 	return 0;
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 48575d2..5080f72 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -470,8 +470,7 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 		if (nc->nc_modes[NCSI_MODE_LINK].ncm_data[2] & 0x1)
 			nd->nd_link_up = 1;
 
-		if (!(ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE))
-			nd->nd_handler(nd);
+		nd->nd_handler(nd);
 		ndp->ndp_flags &= ~NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
 
 		break;
@@ -500,13 +499,17 @@ static void ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	ndp->ndp_active_channel = NULL;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
-			ncm = &nc->nc_modes[NCSI_MODE_LINK];
-			if (ndp->ndp_active_channel ||
-			    !(ncm->ncm_data[2] & 0x1))
-				continue;
+			if (!ndp->ndp_active_channel) {
+				ndp->ndp_active_package = np;
+				ndp->ndp_active_channel = nc;
+			}
 
-			ndp->ndp_active_package = np;
-			ndp->ndp_active_channel = nc;
+			ncm = &nc->nc_modes[NCSI_MODE_LINK];
+			if (ncm->ncm_data[2] & 0x1) {
+				ndp->ndp_active_package = np;
+				ndp->ndp_active_channel = nc;
+				return;
+			}
 		}
 	}
 }
@@ -743,8 +746,7 @@ done:
 		if (ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE)
 			ncsi_choose_active_channel(ndp);
 
-		if (!(ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE) ||
-		    !ndp->ndp_active_channel) {
+		if (!ndp->ndp_active_channel) {
 			nd->nd_state = ncsi_dev_state_functional;
 			nd->nd_link_up = 0;
 			nd->nd_handler(nd);
-- 
2.1.0
