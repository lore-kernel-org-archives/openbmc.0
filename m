Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wj2fY0p5qzDqLD
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 06:02:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v56JwWZY052996
 for <openbmc@lists.ozlabs.org>; Tue, 6 Jun 2017 16:02:39 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ax29fssex-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 16:02:39 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 6 Jun 2017 16:02:38 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 6 Jun 2017 16:02:35 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v56K2WOW53149854; Tue, 6 Jun 2017 20:02:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B0F5AE07E;
 Tue,  6 Jun 2017 16:02:30 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 9B6B0AE075;
 Tue,  6 Jun 2017 16:02:29 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on GPIO
 master remove
Date: Tue,  6 Jun 2017 15:02:30 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17060620-0052-0000-0000-000002193598
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007184; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871084; UDB=6.00433214; IPR=6.00651076; 
 BA=6.00005403; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015723; XFM=3.00000015;
 UTC=2017-06-06 20:02:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060620-0053-0000-0000-000050DC8EDC
Message-Id: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706060344
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
X-List-Received-Date: Tue, 06 Jun 2017 20:02:45 -0000

Update GPIO remove behavior to match dev-4.7.

On gpio remove: Send a break
		clock, translator, mux = 0
		data, enable = 1

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 2a6a812..47eaf61 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -585,17 +585,23 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-
 static int fsi_master_gpio_remove(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master = platform_get_drvdata(pdev);
 
+	fsi_master_gpio_break(&master->master, 0);
+
+	gpiod_set_value(master->gpio_clk, 0);
 	devm_gpiod_put(&pdev->dev, master->gpio_clk);
+	gpiod_set_value(master->gpio_data, 1);
 	devm_gpiod_put(&pdev->dev, master->gpio_data);
+	gpiod_set_value(master->gpio_trans, 0);
 	if (master->gpio_trans)
 		devm_gpiod_put(&pdev->dev, master->gpio_trans);
+	gpiod_set_value(master->gpio_enable, 1);
 	if (master->gpio_enable)
 		devm_gpiod_put(&pdev->dev, master->gpio_enable);
+	gpiod_set_value(master->gpio_mux, 0);
 	if (master->gpio_mux)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	fsi_master_unregister(&master->master);
-- 
1.8.2.2
