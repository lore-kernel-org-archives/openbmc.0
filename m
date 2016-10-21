Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpL5SV1zDvYc
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0kl39142975
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:04 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2675yf5rgn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:04 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:01 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:58 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 6A5113578052
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kwEt15401130
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kvvG020504
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kv8I020499; Fri, 21 Oct 2016 11:46:57 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D2BE0A019B;
 Fri, 21 Oct 2016 11:46:57 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id CD945E3C5C;
 Fri, 21 Oct 2016 11:46:57 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id B360194212E; Fri, 21 Oct 2016 11:47:49 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 7/9] net/ncsi: Fix stale link state of inactive channels
 on failover
Date: Fri, 21 Oct 2016 11:47:44 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0008-0000-0000-000000D35A2D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0009-0000-0000-00000851467F
Message-Id: <1477010866-15126-8-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
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
 net/ncsi/ncsi-manage.c | 29 ++++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 18a477b..1696b1b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -71,6 +71,7 @@ enum {
 	ncsi_dev_state_config_gls,
 	ncsi_dev_state_config_done,
 	ncsi_dev_state_suspend_select	= 0x0401,
+	ncsi_dev_state_suspend_gls,
 	ncsi_dev_state_suspend_dcnt,
 	ncsi_dev_state_suspend_dc,
 	ncsi_dev_state_suspend_deselect,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 99045ed..a3bae7b 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -718,12 +718,39 @@ static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
 		nca.nca_channel = NCSI_RESERVED_CHANNEL;
 		nca.nca_bytes[0] = 1;
 
-		nd->nd_state = ncsi_dev_state_suspend_dcnt;
+		/* To retrieve the last link states of channels in current
+		 * package when current active channel needs fail over to
+		 * another one. It means we will possibly select another
+		 * channel as next active one. The link states of channels
+		 * are most important factor of the selection. So we need
+		 * accurate link states. Unfortunately, the link states on
+		 * inactive channels can't be updated with LSC AEN in time.
+		 */
+		if (ndp->ndp_flags & NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE)
+			nd->nd_state = ncsi_dev_state_suspend_gls;
+		else
+			nd->nd_state = ncsi_dev_state_suspend_dcnt;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
 
 		break;
+	case ncsi_dev_state_suspend_gls:
+		atomic_set(&ndp->ndp_pending_reqs,
+			   atomic_read(&np->np_channel_num));
+
+		nca.nca_type = NCSI_PKT_CMD_GLS;
+		nca.nca_package = np->np_id;
+
+		nd->nd_state = ncsi_dev_state_suspend_dcnt;
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			nca.nca_channel = nc->nc_id;
+			ret = ncsi_xmit_cmd(&nca);
+			if (ret)
+				goto error;
+		}
+
+		break;
 	case ncsi_dev_state_suspend_dcnt:
 		atomic_set(&ndp->ndp_pending_reqs, 1);
 
-- 
2.1.0
