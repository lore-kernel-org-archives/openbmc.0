Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w01HQ69DGzDqKL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 23:52:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v37DmlNE105848
 for <openbmc@lists.ozlabs.org>; Fri, 7 Apr 2017 09:52:40 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29p7c3qw57-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2017 09:52:39 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 7 Apr 2017 07:52:39 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Apr 2017 07:52:36 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v37DqZgi10486120; Fri, 7 Apr 2017 06:52:35 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C867F136050;
 Fri,  7 Apr 2017 07:52:35 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 0B36A136046;
 Fri,  7 Apr 2017 07:52:33 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 1/4] drivers/fsi: Change interrupt handler
 device traversal.
Date: Fri,  7 Apr 2017 08:52:22 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170407135225.20387-1-cbostic@linux.vnet.ibm.com>
References: <20170407135225.20387-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17040713-8235-0000-0000-00000B45B64A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006893; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00844289; UDB=6.00416159; IPR=6.00622587; 
 BA=6.00005275; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014950; XFM=3.00000013;
 UTC=2017-04-07 13:52:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17040713-8236-0000-0000-00003AF4FD35
Message-Id: <20170407135225.20387-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704070117
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
X-List-Received-Date: Fri, 07 Apr 2017 13:52:51 -0000

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
