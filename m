Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkqq73qMBzDqLR
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 04:01:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59HxQVq120039
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 14:01:21 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2aywh0g76q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 14:01:20 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Jun 2017 12:01:19 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 12:01:17 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59I1Gmn52756514; Fri, 9 Jun 2017 11:01:17 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D543778056;
 Fri,  9 Jun 2017 12:01:16 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 9D99578041;
 Fri,  9 Jun 2017 12:01:16 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 4/5] drivers: occ: hwmon and fsi probing fix
Date: Fri,  9 Jun 2017 13:01:04 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17060918-0024-0000-0000-0000169CBAC1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007202; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872402; UDB=6.00434054; IPR=6.00652472; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 18:01:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060918-0025-0000-0000-00004B4D58C0
Message-Id: <1497031265-29545-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090312
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
X-List-Received-Date: Fri, 09 Jun 2017 18:01:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Probe the FSI-based OCC hwmon driver immediately instead of delaying.
The probe will fail during FSI scan intentionally, since the OCC is not
active when the system is first powering on. The driver can then be
manually bound when the OCC becomes active.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c  |  4 ++--
 drivers/fsi/occ.c          |  8 +++++++-
 drivers/hwmon/occ/p9_sbe.c | 38 ++++++++++----------------------------
 3 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index fbc8dc5..bcf284c 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -839,8 +839,6 @@ static int sbefifo_probe(struct device *dev)
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
 			(unsigned long)sbefifo);
 
-	list_add(&sbefifo->link, &sbefifo_fifos);
-
 	if (dev->of_node) {
 		/* create platform devs for dts child nodes (occ, etc) */
 		for_each_child_of_node(dev->of_node, np) {
@@ -852,6 +850,8 @@ static int sbefifo_probe(struct device *dev)
 					 "failed to create child node dev\n");
 		}
 	}
+
+	list_add(&sbefifo->link, &sbefifo_fifos);
 	
 	return misc_register(&sbefifo->mdev);
 }
diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index a1508f2..f43ae51 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -635,6 +635,9 @@ struct occ_client *occ_drv_open(struct device *dev, unsigned long flags)
 {
 	struct occ *occ = dev_get_drvdata(dev);
 
+	if (!occ)
+		return NULL;
+
 	return occ_open_common(occ, flags);
 }
 EXPORT_SYMBOL_GPL(occ_drv_open);
@@ -688,7 +691,8 @@ static int occ_probe(struct platform_device *pdev)
 	mutex_init(&occ->occ_lock);
 	INIT_WORK(&occ->work, occ_worker);
 
-	platform_set_drvdata(pdev, occ);
+	/* ensure NULL before we probe children, so they don't hang FSI */
+	platform_set_drvdata(pdev, NULL);
 
 	if (dev->of_node) {
 		rc = of_property_read_u32(dev->of_node, "reg", &reg);
@@ -715,6 +719,8 @@ static int occ_probe(struct platform_device *pdev)
 	} else
 		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
 
+	platform_set_drvdata(pdev, occ);
+
 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
 	occ->mdev.fops = &occ_fops;
 	occ->mdev.minor = MISC_DYNAMIC_MINOR;
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index fe435ef..c70858d 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -16,11 +16,8 @@
 #include <linux/sched.h>
 #include <linux/workqueue.h>
 
-#define P9_SBE_OCC_SETUP_DELAY		5000
-
 struct p9_sbe_occ {
 	struct occ occ;
-	struct delayed_work setup;
 	struct device *sbe;
 };
 
@@ -93,12 +90,9 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	return rc;
 }
 
-static void p9_sbe_occ_setup(struct work_struct *work)
+static int p9_sbe_occ_setup(struct p9_sbe_occ *p9_sbe_occ)
 {
 	int rc;
-	struct delayed_work *dwork = to_delayed_work(work);
-	struct p9_sbe_occ *p9_sbe_occ = container_of(dwork, struct p9_sbe_occ,
-						     setup);
 	struct occ *occ = &p9_sbe_occ->occ;
 
 	/* no need to lock */
@@ -106,7 +100,7 @@ static void p9_sbe_occ_setup(struct work_struct *work)
 	if (rc < 0) {
 		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
 			rc);
-		return;
+		return rc;
 	}
 
 	occ_parse_poll_response(occ);
@@ -114,21 +108,24 @@ static void p9_sbe_occ_setup(struct work_struct *work)
 	rc = occ_setup_sensor_attrs(occ);
 	if (rc) {
 		dev_err(occ->bus_dev, "failed to setup p9 attrs: %d\n", rc);
-		return;
+		return rc;
 	}
 
 	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev,
 							    "p9_occ", occ,
 							    occ->groups);
 	if (IS_ERR(occ->hwmon)) {
-		dev_err(occ->bus_dev, "failed to register hwmon device: %ld\n",
-			PTR_ERR(occ->hwmon));
-		return;
+		rc = PTR_ERR(occ->hwmon);
+		dev_err(occ->bus_dev, "failed to register hwmon device: %d\n",
+			rc);
+		return rc;
 	}
 
 	rc = occ_create_status_attrs(occ);
 	if (rc)
 		dev_err(occ->bus_dev, "failed to setup p9 status attrs: %d\n", rc);
+
+	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
@@ -148,24 +145,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	occ->poll_cmd_data = 0x20;
 	occ->send_cmd = p9_sbe_occ_send_cmd;
 	mutex_init(&occ->lock);
-	INIT_DELAYED_WORK(&p9_sbe_occ->setup, p9_sbe_occ_setup);
 
 	platform_set_drvdata(pdev, occ);
 
-	schedule_delayed_work(&p9_sbe_occ->setup,
-			      msecs_to_jiffies(P9_SBE_OCC_SETUP_DELAY));
-
-	return 0;
-}
-
-static int p9_sbe_occ_remove(struct platform_device *pdev)
-{
-	struct occ *occ = platform_get_drvdata(pdev);
-	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
-
-	cancel_delayed_work_sync(&p9_sbe_occ->setup);
-
-	return 0;
+	return p9_sbe_occ_setup(p9_sbe_occ);
 }
 
 static const struct of_device_id p9_sbe_occ_of_match[] = {
@@ -179,7 +162,6 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
-	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1
