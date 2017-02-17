Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ5785hrhzDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 08:01:56 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HKx4BI066836
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:01:54 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28p4sm13kb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:01:53 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 16:01:52 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 16:01:50 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 3450638C804F;
 Fri, 17 Feb 2017 16:01:51 -0500 (EST)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HL1ntv61997304; Fri, 17 Feb 2017 21:01:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A37C12403D;
 Fri, 17 Feb 2017 16:01:49 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id E231612404C;
 Fri, 17 Feb 2017 16:01:48 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 v2] drivers: fsi: Use kernel ida to manage
 device indexes
Date: Fri, 17 Feb 2017 15:01:47 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021721-0040-0000-0000-000002A813CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006634; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823409; UDB=6.00402931; IPR=6.00600855; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014329; XFM=3.00000011;
 UTC=2017-02-17 21:01:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021721-0041-0000-0000-0000069B34B1
Message-Id: <1487365307-25662-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170193
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
X-List-Received-Date: Fri, 17 Feb 2017 21:01:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Fixes bad device indexes and duplicates after fsi rescan

since v1:
 * don't use the unsafe atomic counter

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-core.c        | 10 ++++++++--
 drivers/fsi/fsi-master-gpio.c |  1 +
 drivers/fsi/fsi-scom.c        | 10 ++++++++--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e8a3618..d63a892 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -15,6 +15,7 @@
 
 #include <linux/device.h>
 #include <linux/fsi.h>
+#include <linux/idr.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -46,7 +47,7 @@ static const int engine_page_size = 0x400;
 static struct task_struct *master_ipoll;
 static unsigned int fsi_ipoll_period_ms = 100;
 
-static atomic_t master_idx = ATOMIC_INIT(-1);
+static DEFINE_IDA(master_ida);
 
 struct fsi_slave {
 	struct list_head	list_link;	/* Master's list of slaves */
@@ -599,7 +600,7 @@ int fsi_master_register(struct fsi_master *master)
 	if (!master || !master->dev)
 		return -EINVAL;
 
-	master->idx = atomic_inc_return(&master_idx);
+	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
 	master->slave_list = false;
 	get_device(master->dev);
 	fsi_master_scan(master);
@@ -610,6 +611,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
 
 void fsi_master_unregister(struct fsi_master *master)
 {
+	if (master->idx >= 0) {
+		ida_simple_remove(&master_ida, master->idx);
+		master->idx = -1;
+	}
+
 	device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
 	fsi_master_unscan(master);
 	put_device(master->dev);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 91bdbf2..3ed82ea 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -512,6 +512,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	else
 		master->gpio_mux = gpio;
 
+	master->master.idx = -1;
 	master->master.n_links = 1;
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index a439a5e..ff8267b 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/miscdevice.h>
 #include <linux/list.h>
+#include <linux/idr.h>
 
 #define FSI_ENGID_SCOM		0x5
 
@@ -41,12 +42,14 @@ struct scom_device {
 	struct fsi_device *fsi_dev;
 	struct miscdevice mdev;
 	char	name[32];
+	int idx;
 };
 
 #define to_scom_dev(x)		container_of((x), struct scom_device, mdev)
 
 static struct list_head scom_devices;
-static atomic_t scom_idx = ATOMIC_INIT(0);
+
+static DEFINE_IDA(scom_ida);
 
 static int put_scom(struct scom_device *scom_dev, uint64_t value,
 			uint32_t addr)
@@ -187,8 +190,9 @@ static int scom_probe(struct device *dev)
 	if (!scom)
 		return -ENOMEM;
 
+	scom->idx = ida_simple_get(&scom_ida, 1, INT_MAX, GFP_KERNEL);
 	snprintf(scom->name, sizeof(scom->name),
-			"scom%d", atomic_inc_return(&scom_idx));
+			"scom%d", scom->idx);
 	scom->fsi_dev = fsi_dev;
 	scom->mdev.minor = MISC_DYNAMIC_MINOR;
 	scom->mdev.fops = &scom_fops;
@@ -211,6 +215,8 @@ static int scom_remove(struct device *dev)
 		}
 	}
 
+	ida_simple_remove(&scom_ida, scom->idx);
+
 	return 0;
 }
 
-- 
1.8.3.1
