Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0DCh4vY5zDqYR
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:32 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6S0sEVd099406
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 21:04:30 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24dsrrabt5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 21:04:30 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 28 Jul 2016 11:04:27 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 28 Jul 2016 11:04:25 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 426252CE802D
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:25 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6S14PBR29753384
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:25 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6S14OSV023192
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:04:25 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u6S14ORQ023189; Thu, 28 Jul 2016 11:04:24 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 3A81DA0227;
 Thu, 28 Jul 2016 11:04:24 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 2B653E3BAA;
 Thu, 28 Jul 2016 11:04:24 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 1FFDF942C8C; Thu, 28 Jul 2016 11:04:24 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH dev-4.7 2/2] net/faraday: Clear stale interrupts
Date: Thu, 28 Jul 2016 11:04:22 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16072801-1617-0000-0000-0000013FC8CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16072801-1618-0000-0000-0000465D06AF
Message-Id: <1469667862-12601-2-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-27_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607280009
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
X-List-Received-Date: Thu, 28 Jul 2016 01:04:33 -0000

There is stale interrupt (PHYSTS_CHG in ISR, bit#6 in 0x0) from
the bootloader (uboot) when enabling the MAC. The stale interrupts
aren't part of kernel and should be cleared.

This clears the stale interrupts in ISR (0x0) when enabling the MAC.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index f00911a..fc2852f 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1119,6 +1119,7 @@ static int ftgmac100_open(struct net_device *netdev)
 {
 	struct ftgmac100 *priv = netdev_priv(netdev);
 	struct phy_device *phydev = netdev->phydev;
+	unsigned int status;
 	int err;
 
 	err = ftgmac100_alloc_buffers(priv);
@@ -1145,6 +1146,10 @@ static int ftgmac100_open(struct net_device *netdev)
 	ftgmac100_init_hw(priv);
 	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
 
+	/* Clear stale interrupts */
+	status = ioread32(priv->base + FTGMAC100_OFFSET_ISR);
+	iowrite32(status, priv->base + FTGMAC100_OFFSET_ISR);
+
 	if (phydev)
 		phy_start(phydev);
 	else if (priv->use_ncsi)
-- 
2.1.0
