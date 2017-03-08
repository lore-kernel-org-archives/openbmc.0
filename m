Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vdkmd4zLmzDqC0
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 06:56:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v28Js0sq013104
 for <openbmc@lists.ozlabs.org>; Wed, 8 Mar 2017 14:56:12 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 292h0kfww2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Mar 2017 14:56:12 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 8 Mar 2017 14:56:11 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Mar 2017 14:56:09 -0500
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v28Ju8Y445744202; Wed, 8 Mar 2017 19:56:08 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05A9B2058;
 Wed,  8 Mar 2017 14:56:05 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 95C5CB2046;
 Wed,  8 Mar 2017 14:56:05 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Free up allocated resources on
 fsi-master unbind
Date: Wed,  8 Mar 2017 13:56:06 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17030819-0024-0000-0000-000002008DA0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006746; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00831833; UDB=6.00408160; IPR=6.00609425; 
 BA=6.00005201; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014564; XFM=3.00000013;
 UTC=2017-03-08 19:56:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030819-0025-0000-0000-0000425BDB2D
Message-Id: <20170308195606.11618-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-08_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703080155
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
X-List-Received-Date: Wed, 08 Mar 2017 19:56:18 -0000

In order to allow repeated bind/unbind operations on fsi-master
the resources allocated during bind must be freed. Specifically
the scan file and dynamic memory.  Also check for valid pointers
during unregister which is the path taken during unbind.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c        | 8 ++++----
 drivers/fsi/fsi-master-gpio.c | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index bbdf6b8..751c767 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -869,11 +869,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
 
 void fsi_master_unregister(struct fsi_master *master)
 {
-	if (master->idx >= 0) {
-		ida_simple_remove(&master_ida, master->idx);
-		master->idx = -1;
-	}
+	if (!master || !master->dev || master->idx < 0)
+		return;
 
+	ida_simple_remove(&master_ida, master->idx);
+	master->idx = -1;
 	device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
 	fsi_master_unscan(master);
 	put_device(master->dev);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 49f3399..3693b3d 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -566,6 +566,8 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 	if (master->gpio_mux)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	fsi_master_unregister(&master->master);
+	device_remove_file(&pdev->dev, &dev_attr_scan);
+	devm_kfree(&pdev->dev, master);
 
 	return 0;
 }
-- 
1.8.2.2
