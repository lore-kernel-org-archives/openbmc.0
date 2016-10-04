Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGk56TyczDrKY
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:09 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BN48a128130
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:23:08 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25v8js3bgq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:23:08 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 21:23:05 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 21:23:03 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id E7C643578053
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:23:02 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BN2tO48824386
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:23:02 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BN2PE027675
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:23:02 +1100
Received: from gwshan ([9.192.182.193])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BN0Vv027634; Tue, 4 Oct 2016 22:23:01 +1100
Received: by gwshan (Postfix, from userid 1000)
 id 1E69D9431E9; Tue,  4 Oct 2016 22:23:32 +1100 (AEDT)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v3 4.7 8/8] net/faraday: Stop NCSI device on shutdown
Date: Tue,  4 Oct 2016 22:23:26 +1100
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475580206-27370-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0040-0000-0000-000001E7D321
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0041-0000-0000-00000A9D3B48
Message-Id: <1475580206-27370-9-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610040200
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:10 -0000
X-List-Received-Date: Tue, 04 Oct 2016 11:23:10 -0000

This stops NCSI device when closing the network device so that the
NCSI device can be reenabled later.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 134b9c5..f40fa92 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1189,6 +1189,8 @@ static int ftgmac100_stop(struct net_device *netdev)
 	napi_disable(&priv->napi);
 	if (netdev->phydev)
 		phy_stop(netdev->phydev);
+	else if (priv->use_ncsi)
+		ncsi_stop_dev(priv->ndev);
 
 	ftgmac100_stop_hw(priv);
 	free_irq(priv->irq, netdev);
-- 
2.1.0
