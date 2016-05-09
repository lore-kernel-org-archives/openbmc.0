Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r34zD1Xv3zDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:24 +1000 (AEST)
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:48:23 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:48:20 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 912F62BB0054
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:19 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491mBdu9568614
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:19 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491llaC020922
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:47:47 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491llE0020257; Mon, 9 May 2016 11:47:47 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id A603AA038E;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id A45C1E3A5A;
 Mon,  9 May 2016 11:47:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 97705942B91; Mon,  9 May 2016 11:47:21 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 5/8] net/ncsi: Enable AEN on active channel
Date: Mon,  9 May 2016 11:47:16 +1000
Message-Id: <1462758439-27910-6-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0033-0000-0000-000005D2550D
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
X-List-Received-Date: Mon, 09 May 2016 01:48:24 -0000

NCSI AEN packets are transmitted by far end to notify the network
status change. We had the wrong assumption that the functionality
is enabled in far end by default.

This transmits a AEN enablement packet when configuring the active
channel.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    | 1 +
 net/ncsi/ncsi-manage.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index cc37d9b..2525229 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -64,6 +64,7 @@ enum {
 	ncsi_dev_state_config_ebf,
 	ncsi_dev_state_config_ecnt,
 	ncsi_dev_state_config_ec,
+	ncsi_dev_state_config_ae,
 	ncsi_dev_state_config_gls,
 	ncsi_dev_state_config_done,
 	ncsi_dev_state_suspend_select	= 0x0401,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 05619f8..9ed51f2 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -421,6 +421,7 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_config_ebf:
 	case ncsi_dev_state_config_ecnt:
 	case ncsi_dev_state_config_ec:
+	case ncsi_dev_state_config_ae:
 	case ncsi_dev_state_config_gls:
 		atomic_set(&ndp->ndp_pending_reqs, 1);
 
@@ -447,6 +448,11 @@ static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
 			nd->nd_state = ncsi_dev_state_config_ec;
 		} else if (nd->nd_state == ncsi_dev_state_config_ec) {
 			nca.nca_type = NCSI_PKT_CMD_EC;
+			nd->nd_state = ncsi_dev_state_config_ae;
+		} else if (nd->nd_state == ncsi_dev_state_config_ae) {
+			nca.nca_type = NCSI_PKT_CMD_AE;
+			nca.nca_bytes[0] = 0;
+			nca.nca_dwords[1] = 0x7;
 			nd->nd_state = ncsi_dev_state_config_gls;
 		} else if (nd->nd_state == ncsi_dev_state_config_gls) {
 			nca.nca_type = NCSI_PKT_CMD_GLS;
-- 
2.1.0
