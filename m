Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfKm31wY9zDqXh
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 06:12:50 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v29J3kN2086872
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 14:12:46 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2937t40mhj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 14:12:46 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Mar 2017 14:12:45 -0500
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Mar 2017 14:12:42 -0500
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v29JCerW65274060; Thu, 9 Mar 2017 12:12:41 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BADD78041;
 Thu,  9 Mar 2017 12:12:41 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 406B67804D;
 Thu,  9 Mar 2017 12:12:41 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Free up allocated resources on
 fsi-master unbind
Date: Thu,  9 Mar 2017 13:12:39 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17030919-0048-0000-0000-00000118DF69
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006752; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832297; UDB=6.00408439; IPR=6.00609885; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014580; XFM=3.00000013;
 UTC=2017-03-09 19:12:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030919-0049-0000-0000-00003F8617AA
Message-Id: <20170309191239.77302-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-09_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703090139
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
X-List-Received-Date: Thu, 09 Mar 2017 19:12:51 -0000

In order to allow repeated bind/unbind operations on fsi-master
the scan file created on bind must be removed.  Also check for
valid pointers during unregister which is the path taken during
unbind.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2 - Remove devm_kfree in gpio remove
   - Rebase on e97a91f178e55719b08d48af7f592b18cfd4da91
---
 drivers/fsi/fsi-core.c        | 8 ++++----
 drivers/fsi/fsi-master-gpio.c | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index b3b245a..3d382e6 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -868,11 +868,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
 
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
index c923846..e3431c4 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -576,6 +576,7 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	}
 	fsi_master_unregister(&master->master);
+	device_remove_file(&pdev->dev, &dev_attr_scan);
 
 	return 0;
 }
-- 
1.8.2.2
