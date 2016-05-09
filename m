Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r34zB19r7zDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:22 +1000 (AEST)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:48:21 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:48:18 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id F12032CE8046
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:17 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491m9Qg36634752
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:17 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491ljPd005804
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:47:45 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491ljF3005124; Mon, 9 May 2016 11:47:45 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 24E8BA0330;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 22CF2E3A5A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 1819D942B91; Mon,  9 May 2016 11:47:21 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 2/8] net/ncsi: Add NCSI_DEV_PRIV_FLAG_POPULATED
Date: Mon,  9 May 2016 11:47:13 +1000
Message-Id: <1462758439-27910-3-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0025-0000-0000-000004985A0E
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
X-List-Received-Date: Mon, 09 May 2016 01:48:22 -0000

This adds another flag (NCSI_DEV_PRIV_FLAG_POPULATED) to ncsi priv
struct. When it's set, the all available packages and channels
associated with the interface have been enumerated. The flag is
going to be used by next patch. No functional changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h | 3 ++-
 net/ncsi/ncsi-rsp.c | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index ac5f129..51b43f5 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -77,7 +77,8 @@ enum {
 struct ncsi_dev_priv {
 	struct ncsi_dev		ndp_ndev;
 	int			ndp_flags;
-#define NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE	0x1
+#define NCSI_DEV_PRIV_FLAG_POPULATED		0x1
+#define NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE	0x2
 	struct ncsi_package	*ndp_active_package;
 	struct ncsi_channel	*ndp_active_channel;
 	atomic_t		ndp_package_num;
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 295f0f8..c34998d 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -88,8 +88,8 @@ static int ncsi_rsp_handler_cis(struct ncsi_req *nr)
 
 	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
 	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel, &np, &nc);
-	if (!np)
-		return -ENODEV;
+	if ((ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_POPULATED) && !nc)
+		return -ENXIO;
 
 	/* Add the channel if necessary */
 	if (!nc)
@@ -122,6 +122,9 @@ static int ncsi_rsp_handler_sp(struct ncsi_req *nr)
 	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
 	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
 				      &np, NULL);
+	if ((ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_POPULATED) && !np)
+		return -ENXIO;
+
 	if (!np) {
 		np = ncsi_add_package(ndp,
 			NCSI_PACKAGE_INDEX(rsp->rsp.common.channel));
-- 
2.1.0
