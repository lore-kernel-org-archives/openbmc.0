Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w23DT4lZ2zDq5j
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 07:27:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3ALOmhu046418
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:05 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29rac6em3q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:05 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 17:27:04 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 17:27:01 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3ALR4bY43778058; Mon, 10 Apr 2017 21:27:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74D57124049;
 Mon, 10 Apr 2017 17:26:56 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 851E7124035;
 Mon, 10 Apr 2017 17:26:54 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 1/4] drivers/fsi: Change interrupt handler
 device traversal.
Date: Mon, 10 Apr 2017 16:26:48 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
References: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041021-0044-0000-0000-000002FF5F6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006913; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845723; UDB=6.00417077; IPR=6.00624156; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014997; XFM=3.00000013;
 UTC=2017-04-10 21:27:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041021-0045-0000-0000-0000072D615E
Message-Id: <20170410212651.65499-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100170
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
X-List-Received-Date: Mon, 10 Apr 2017 21:27:22 -0000

Traverse the slave device list and master slave list using the
kernel utility device_for_each_child instead of using internally
managed linked lists.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d382e6..36dde94 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -778,22 +778,32 @@ static void fsi_master_unscan(struct fsi_master *master)
 	master->slave_list = false;
 }
 
-static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
+static int __fsi_dev_irq(struct device *dev, void *data)
 {
-	struct fsi_slave *slave;
-	struct fsi_device *fsi_dev;
-
-	if (list_empty(&master->my_slaves))
-		return;
+	uint32_t *si1s = data;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 
-	slave = list_first_entry(&master->my_slaves, struct fsi_slave,
-				list_link);
+	if (!fsi_dev || !si1s) {
+		dev_dbg(dev, "Invalid input: %p %p\n", fsi_dev, si1s);
+		return -EINVAL;
+	}
 
-	list_for_each_entry(fsi_dev, &slave->my_engines, link) {
-		if (si1s & (0x80000000 >> fsi_dev->si1s_bit) &&
-		    fsi_dev->irq_handler)
-			fsi_dev->irq_handler(0, &fsi_dev->dev);
+	if (*si1s & (0x80000000 >> fsi_dev->si1s_bit) && fsi_dev->irq_handler) {
+		fsi_dev->irq_handler(0, &fsi_dev->dev);
+		return 1;
 	}
+
+	return 0;
+}
+
+static int __fsi_slave_irq(struct device *dev, void *data)
+{
+	return device_for_each_child(dev, data, __fsi_dev_irq);
+}
+
+static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
+{
+	device_for_each_child(master->dev, &si1s, __fsi_slave_irq);
 }
 
 static int fsi_master_ipoll(void *data)
-- 
1.8.2.2
