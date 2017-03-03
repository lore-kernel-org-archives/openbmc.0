Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZjGK3My6zDq5x
 for <openbmc@lists.ozlabs.org>; Sat,  4 Mar 2017 08:38:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v23LXicO016721
 for <openbmc@lists.ozlabs.org>; Fri, 3 Mar 2017 16:37:58 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28xs8euh5g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Mar 2017 16:37:58 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 3 Mar 2017 14:37:57 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 3 Mar 2017 14:37:55 -0700
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 4F0C61FF001E;
 Fri,  3 Mar 2017 14:37:32 -0700 (MST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v23Lbquw31785172; Fri, 3 Mar 2017 21:37:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A74BAE056;
 Fri,  3 Mar 2017 16:37:50 -0500 (EST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.210.11])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id D607CAE043;
 Fri,  3 Mar 2017 16:37:47 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Set I/O to standby values on unbind
Date: Fri,  3 Mar 2017 15:37:47 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030321-0020-0000-0000-00000B8C5D93
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006717; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00829691; UDB=6.00406787; IPR=6.00607188; 
 BA=6.00005186; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014514; XFM=3.00000012;
 UTC=2017-03-03 21:37:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030321-0021-0000-0000-00005A9F4758
Message-Id: <20170303213747.97313-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-03_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703030190
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
X-List-Received-Date: Fri, 03 Mar 2017 21:38:01 -0000

On unbind send a break command to reset any connected slave
and put bus in a good state. Next set each FSI pin to standby
state, '0' except for SDA (data) which is negative active so set
it to a '1'.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 49f3399..c923846 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -557,14 +557,24 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master = platform_get_drvdata(pdev);
 
+	fsi_master_gpio_break(&master->master, 0);
+
+	gpiod_set_value(master->gpio_clk, 0);
 	devm_gpiod_put(&pdev->dev, master->gpio_clk);
+	gpiod_set_value(master->gpio_data, 1);
 	devm_gpiod_put(&pdev->dev, master->gpio_data);
-	if (master->gpio_trans)
+	if (master->gpio_trans) {
+		gpiod_set_value(master->gpio_trans, 0);
 		devm_gpiod_put(&pdev->dev, master->gpio_trans);
-	if (master->gpio_enable)
+	}
+	if (master->gpio_enable) {
+		gpiod_set_value(master->gpio_enable, 0);
 		devm_gpiod_put(&pdev->dev, master->gpio_enable);
-	if (master->gpio_mux)
+	}
+	if (master->gpio_mux) {
+		gpiod_set_value(master->gpio_mux, 0);
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
+	}
 	fsi_master_unregister(&master->master);
 
 	return 0;
-- 
1.8.2.2
