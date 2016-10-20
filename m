Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0PgH6GW1zDvY9
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:51 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9KN9HFu050594
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:49 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2675yfu0wq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:10:48 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 09:10:46 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 09:10:44 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id B24382CE805B
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9KNAhIY17629402
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9KNAhPZ020485
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:10:43 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9KNAhRR020482; Fri, 21 Oct 2016 10:10:43 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 29D29A019B;
 Fri, 21 Oct 2016 10:10:43 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 24816E3C5C;
 Fri, 21 Oct 2016 10:10:43 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 0F22E9417E9; Fri, 21 Oct 2016 10:11:35 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.7 2/4] net/ncsi: Fix stale link state of inactive channels
 on failover
Date: Fri, 21 Oct 2016 10:11:30 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102023-1617-0000-0000-0000016D91BE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102023-1618-0000-0000-000046F6A52F
Message-Id: <1477005092-20632-3-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610200409
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
X-List-Received-Date: Thu, 20 Oct 2016 23:10:52 -0000

The issue was found on BCM5718 which has two NCSI channels in one
package: C0 and C1. Both of them are connected to different LANs,
means they are in link-up state and C0 is chosen as the active one
until resetting BCM5718 happens as below.

Resetting BCM5718 results in LSC (Link State Change) AEN packet
received on C0, meaning LSC AEN is missed on C1. When LSC AEN packet
received on C0 to report link-down, it fails over to C1 because C1
is in link-up state as software can see. However, C1 is in link-down
state in hardware. It means the link state is out of synchronization
between hardware and software, resulting in inappropriate channel (C1)
selected as active one.

This resolves the issue by sending separate GLS (Get Link Status)
commands to all channels in the package before trying to do failover.
The last link states of all channels in the package are retrieved.
With it, C0 (not C1) is selected as active one as expected.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 13290a7..eac4858 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -246,6 +246,7 @@ enum {
 	ncsi_dev_state_config_gls,
 	ncsi_dev_state_config_done,
 	ncsi_dev_state_suspend_select	= 0x0401,
+	ncsi_dev_state_suspend_gls,
 	ncsi_dev_state_suspend_dcnt,
 	ncsi_dev_state_suspend_dc,
 	ncsi_dev_state_suspend_deselect,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 655d0d6..4789f86 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -550,12 +550,38 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		else
 			nca.bytes[0] = 1;
 
-		nd->state = ncsi_dev_state_suspend_dcnt;
+		/* To retrieve the last link states of channels in current
+		 * package when current active channel needs fail over to
+		 * another one. It means we will possibly select another
+		 * channel as next active one. The link states of channels
+		 * are most important factor of the selection. So we need
+		 * accurate link states. Unfortunately, the link states on
+		 * inactive channels can't be updated with LSC AEN in time.
+		 */
+		if (ndp->flags & NCSI_DEV_RESHUFFLE)
+			nd->state = ncsi_dev_state_suspend_gls;
+		else
+			nd->state = ncsi_dev_state_suspend_dcnt;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
 
 		break;
+	case ncsi_dev_state_suspend_gls:
+		ndp->pending_req_num = np->channel_num;
+
+		nca.type = NCSI_PKT_CMD_GLS;
+		nca.package = np->id;
+
+		nd->state = ncsi_dev_state_suspend_dcnt;
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			nca.channel = nc->id;
+			ret = ncsi_xmit_cmd(&nca);
+			if (ret)
+				goto error;
+		}
+
+		break;
 	case ncsi_dev_state_suspend_dcnt:
 		ndp->pending_req_num = 1;
 
-- 
2.1.0
