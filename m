Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxzn18CBzDsWf
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T1bhGO099893
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25rknx6fa7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:38:27 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 11:38:24 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:38:22 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 100B42BB005A
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:22 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T1cMMi2228604
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:22 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T1cL40020645
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:38:21 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T1cLkL020638; Thu, 29 Sep 2016 11:38:21 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 6B7C7A01B7;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 67DB2E3C36;
 Thu, 29 Sep 2016 11:38:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 689C9942E0A; Thu, 29 Sep 2016 11:38:52 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v2 4.7 2/8] net/ncsi: Introduce NCSI_RESERVED_CHANNEL
Date: Thu, 29 Sep 2016 11:38:45 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092901-0048-0000-0000-000001C2E31D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092901-0049-0000-0000-000046A5909E
Message-Id: <1475113131-18048-3-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 01:38:29 -0000

This defines NCSI_RESERVED_CHANNEL as the reserved NCSI channel
ID (0x1f). No logical changes introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 33738c0..66dc851 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -170,6 +170,7 @@ struct ncsi_package;
 
 #define NCSI_PACKAGE_SHIFT	5
 #define NCSI_PACKAGE_INDEX(c)	(((c) >> NCSI_PACKAGE_SHIFT) & 0x7)
+#define NCSI_RESERVED_CHANNEL	0x1f
 #define NCSI_CHANNEL_INDEX(c)	((c) & ((1 << NCSI_PACKAGE_SHIFT) - 1))
 #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index fc0ae54..73883ed 100644
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
