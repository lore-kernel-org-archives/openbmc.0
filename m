Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmDHC6dhfzDq8b
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 08:27:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1KLP4vk064253
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 16:27:49 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g8rjcqa35-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 16:27:49 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 20 Feb 2018 14:27:47 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Feb 2018 14:27:44 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1KLRiCv5505432; Tue, 20 Feb 2018 14:27:44 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F4BF6E035;
 Tue, 20 Feb 2018 14:27:44 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 13EE56E03A;
 Tue, 20 Feb 2018 14:27:44 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 2/2] drivers: occ: Create hwmon platform device
 directly
Date: Tue, 20 Feb 2018 15:27:39 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1519162059-7210-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1519162059-7210-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18022021-0020-0000-0000-00000D7C3BF2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008565; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00992645; UDB=6.00504319; IPR=6.00771992; 
 MB=3.00019660; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-20 21:27:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022021-0021-0000-0000-0000603434E6
Message-Id: <1519162059-7210-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802200256
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 21:27:52 -0000
X-List-Received-Date: Tue, 20 Feb 2018 21:27:52 -0000

Previously, the OCC driver parses the device tree and creates platform
devices for each child node found there. This was used to probe the
OCC hwmon devices. However, this doesn't make sense since hmwon isn't a
device. Therefore, just directly create a platform device for each OCC
for the hwmon driver to probe.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-occ.c      | 29 ++++++++++++-----------------
 drivers/hwmon/occ/p9_sbe.c |  6 ------
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 1713550..8a1d0a1 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -21,7 +21,6 @@
 #include <linux/mutex.h>
 #include <linux/fsi-occ.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -737,24 +736,24 @@ void occ_drv_release(struct occ_client *client)
 
 static int occ_unregister_child(struct device *dev, void *data)
 {
-	struct platform_device *child = to_platform_device(dev);
+	struct platform_device *hwmon_dev = to_platform_device(dev);
 
-	of_device_unregister(child);
-	if (dev->of_node)
-		of_node_clear_flag(dev->of_node, OF_POPULATED);
+	platform_device_unregister(hwmon_dev);
 
 	return 0;
 }
 
 static int occ_probe(struct platform_device *pdev)
 {
-	int rc, child_idx = 0;
+	int rc;
 	u32 reg;
 	struct occ *occ;
-	struct device_node *np;
-	struct platform_device *child;
+	struct platform_device *hwmon_dev;
 	struct device *dev = &pdev->dev;
-	char child_name[32];
+	struct platform_device_info hwmon_dev_info = {
+		.parent = dev,
+		.name = "occ-hwmon",
+	};
 
 	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
 	if (!occ)
@@ -796,14 +795,10 @@ static int occ_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	/* create platform devs for dts child nodes (hwmon, etc) */
-	for_each_available_child_of_node(dev->of_node, np) {
-		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
-			 occ->idx, child_idx++);
-		child = of_platform_device_create(np, child_name, dev);
-		if (!child)
-			dev_warn(dev, "failed to create child node dev\n");
-	}
+	hwmon_dev_info.id = occ->idx;
+	hwmon_dev = platform_device_register_full(&hwmon_dev_info);
+	if (!hwmon_dev)
+		dev_warn(dev, "failed to create hwmon device\n");
 
 	platform_set_drvdata(pdev, occ);
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 7dbe4d5..451a393 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -140,15 +140,9 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id p9_sbe_occ_of_match[] = {
-	{ .compatible = "ibm,p9-occ-hwmon" },
-	{ },
-};
-
 static struct platform_driver p9_sbe_occ_driver = {
 	.driver = {
 		.name = "occ-hwmon",
-		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
 	.remove = p9_sbe_occ_remove,
-- 
1.8.3.1
