Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skMZs3ChhzDrWh
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:21 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8S2lTJG111197
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:19 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25r3ag4ypg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:48:18 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 28 Sep 2016 12:48:15 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Sep 2016 12:48:13 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id C87292BB0045
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:12 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8S2mCdv54591496
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:12 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8S2mCoh028351
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 12:48:12 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8S2mClY028343; Wed, 28 Sep 2016 12:48:12 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 975B6A0195;
 Wed, 28 Sep 2016 12:48:11 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 84942E3C37;
 Wed, 28 Sep 2016 12:48:11 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 157B6942BBC; Wed, 28 Sep 2016 12:48:42 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v4.7 2/7] net/ncsi: Introduce NCSI_RESERVED_CHANNEL
Date: Wed, 28 Sep 2016 12:48:30 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092802-0040-0000-0000-000001E573D2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092802-0041-0000-0000-00000A92930A
Message-Id: <1475030915-9525-2-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Sep 2016 02:48:22 -0000

This defines NCSI_RESERVED_CHANNEL as the reserved NCSI channel
ID (0x1f). No logical changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 549846b..0a5c580 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -170,6 +170,7 @@ struct ncsi_package;
 
 #define NCSI_PACKAGE_SHIFT	5
 #define NCSI_PACKAGE_INDEX(c)	(((c) >> NCSI_PACKAGE_SHIFT) & 0x7)
+#define NCSI_RESERVED_CHANNEL	0x1f
 #define NCSI_CHANNEL_INDEX(c)	((c) & ((1 << NCSI_PACKAGE_SHIFT) - 1))
 #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index b325c1d..b03d1df 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -529,7 +529,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		nca.package = np->id;
 		if (nd->state == ncsi_dev_state_suspend_select) {
 			nca.type = NCSI_PKT_CMD_SP;
-			nca.channel = 0x1f;
+			nca.channel = NCSI_RESERVED_CHANNEL;
 			if (ndp->flags & NCSI_DEV_HWA)
 				nca.bytes[0] = 0;
 			else
@@ -546,7 +546,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 			nd->state = ncsi_dev_state_suspend_deselect;
 		} else if (nd->state == ncsi_dev_state_suspend_deselect) {
 			nca.type = NCSI_PKT_CMD_DP;
-			nca.channel = 0x1f;
+			nca.channel = NCSI_RESERVED_CHANNEL;
 			nd->state = ncsi_dev_state_suspend_done;
 		}
 
@@ -592,7 +592,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		else
 			nca.bytes[0] = 1;
 		nca.package = np->id;
-		nca.channel = 0x1f;
+		nca.channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
@@ -810,7 +810,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 		/* Deselect all possible packages */
 		nca.type = NCSI_PKT_CMD_DP;
-		nca.channel = 0x1f;
+		nca.channel = NCSI_RESERVED_CHANNEL;
 		for (index = 0; index < 8; index++) {
 			nca.package = index;
 			ret = ncsi_xmit_cmd(&nca);
@@ -826,7 +826,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		/* Select all possible packages */
 		nca.type = NCSI_PKT_CMD_SP;
 		nca.bytes[0] = 1;
-		nca.channel = 0x1f;
+		nca.channel = NCSI_RESERVED_CHANNEL;
 		for (index = 0; index < 8; index++) {
 			nca.package = index;
 			ret = ncsi_xmit_cmd(&nca);
@@ -879,7 +879,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		nca.type = NCSI_PKT_CMD_SP;
 		nca.bytes[0] = 1;
 		nca.package = ndp->active_package->id;
-		nca.channel = 0x1f;
+		nca.channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
@@ -936,7 +936,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		/* Deselect the active package */
 		nca.type = NCSI_PKT_CMD_DP;
 		nca.package = ndp->active_package->id;
-		nca.channel = 0x1f;
+		nca.channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
-- 
2.1.0
