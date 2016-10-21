Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RpM3BfgzDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:47:07 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L0i581072792
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:05 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2675yfwvjk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:47:04 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 10:47:01 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 10:46:59 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 4A9972CE8056
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:59 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L0kxwr20578492
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:59 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L0kwOH022389
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:46:59 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L0kwtc022386; Fri, 21 Oct 2016 11:46:58 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id BF8FAA019B;
 Fri, 21 Oct 2016 11:46:58 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id BA2BEE3C5C;
 Fri, 21 Oct 2016 11:46:58 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id A20A094212E; Fri, 21 Oct 2016 11:47:50 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 4.4 9/9] net/ncsi: Improve HNCDSC AEN handler
Date: Fri, 21 Oct 2016 11:47:46 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102100-0004-0000-0000-000001A958C8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102100-0005-0000-0000-000008EC3AE1
Message-Id: <1477010866-15126-10-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 00:47:08 -0000

This improves AEN handler for Host Network Controller Driver Status
Change (HNCDSC):

   * The channel's lock should be hold when accessing its state.
   * Do failover when host driver isn't ready.
   * Configure channel when host driver becomes ready.

NOTE: The first one isn't applied to the code in dev-4.4.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/ncsi-aen.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 5bc0873..26ac93d 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -142,8 +142,7 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	ncm = &nc->nc_modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->ncm_data[3] = ntohl(hncdsc->status);
-	if (ndp->ndp_active_channel != nc ||
-	    ncm->ncm_data[3] & 0x1)
+	if (ndp->ndp_active_channel != nc)
 		return 0;
 
 	/* If this channel is the active one and the link doesn't
@@ -151,7 +150,8 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	 * The logic here is exactly similar to what we do when link
 	 * is down on the active channel.
 	 */
-	ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
+	if (!(ncm->ncm_data[3] & 0x1))
+		ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
 	ncsi_suspend_dev(nd);
 
 	return 0;
-- 
2.1.0
