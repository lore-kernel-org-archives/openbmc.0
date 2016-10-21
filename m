Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpK2RJHzDvYc
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:05 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i5C9057692
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yfnqax-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:03 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:00 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:57 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 16FCA3578056
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:57 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kuLD56688756
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kuwS029492
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:56 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0ku6p029485; Fri, 21 Oct 2016 11:46:56 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 3D208A01A8;
 Fri, 21 Oct 2016 11:46:56 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 37E3DE3C5C;
 Fri, 21 Oct 2016 11:46:56 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 1BB3094212E; Fri, 21 Oct 2016 11:47:48 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 3/9] net/ncsi: Don't probe on the reserved channel ID
 (0x1f)
Date: Fri, 21 Oct 2016 11:47:40 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0008-0000-0000-000000D35A2A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0009-0000-0000-00000851467C
Message-Id: <1477010866-15126-4-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:05 -0000

We needn't send CIS (Clear Initial State) command to the NCSI
reserved channel (0x1f) in the enumeration. We shouldn't receive
a valid response from CIS on NCSI channel 0x1f.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 net/ncsi/ncsi-manage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 3d1d775..b728614 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -616,12 +616,12 @@ static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
 		nd->nd_state = ncsi_dev_state_probe_cis;
 		break;
 	case ncsi_dev_state_probe_cis:
-		atomic_set(&ndp->ndp_pending_reqs, 0x20);
+		atomic_set(&ndp->ndp_pending_reqs, NCSI_RESERVED_CHANNEL);
 
 		/* Clear initial state */
 		nca.nca_type = NCSI_PKT_CMD_CIS;
 		nca.nca_package = ndp->ndp_active_package->np_id;
-		for (index = 0; index < 0x20; index++) {
+		for (index = 0; index < NCSI_RESERVED_CHANNEL; index++) {
 			nca.nca_channel = index;
 			ret = ncsi_xmit_cmd(&nca);
 			if (ret)
-- 
2.1.0
