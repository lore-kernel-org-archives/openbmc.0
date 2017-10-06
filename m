Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7sTl4SJ8zDqhg
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 01:29:31 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v96ETRhG130545
 for <openbmc@lists.ozlabs.org>; Fri, 6 Oct 2017 10:29:28 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2deapekk5h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 10:29:27 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 6 Oct 2017 08:29:13 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 6 Oct 2017 08:29:10 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96ETA9X64028806; Fri, 6 Oct 2017 07:29:10 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C4C06A03C;
 Fri,  6 Oct 2017 08:29:10 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 2F3556A042;
 Fri,  6 Oct 2017 08:29:10 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v5 31/31] drivers: hwmon: occ: Cancel occ
 operations in remove()
Date: Fri,  6 Oct 2017 09:29:08 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17100614-8235-0000-0000-00000C5F6727
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007850; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927291; UDB=6.00466584; IPR=6.00707549; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017421; XFM=3.00000015;
 UTC=2017-10-06 14:29:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100614-8236-0000-0000-00003DEE83DC
Message-Id: <1507300148-8208-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060206
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 14:29:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Prevent hanging forever waiting for OCC ops to complete.

Signed-off-by: Edward A. James <eajames@us.ibm.com>

Changes since v4:
 * Add comments for the spinlock
---
 drivers/hwmon/occ/p9_sbe.c | 49 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index c7e0d9c..ac18422 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -14,37 +14,68 @@
 #include <linux/platform_device.h>
 #include <linux/occ.h>
 #include <linux/sched.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
+
+	/*
+	 * Pointer to occ device client. We store this so that we can cancel
+	 * the client operations in remove() if necessary. We only need one
+	 * pointer since we do one OCC operation (open, write, read, close) at
+	 * a time (access to p9_sbe_occ_send_cmd is locked in the common code
+	 * with occ.lock).
+	 */
+	struct occ_client *client;
+
+	/*
+	 * This lock controls access to the client pointer and ensures atomic
+	 * open, close and NULL assignment. This prevents simultaneous opening
+	 * and closing of the client, or closing multiple times.
+	 */
+	spinlock_t lock;
 };
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
+static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
+{
+	struct occ_client *tmp_client;
+
+	spin_lock_irq(&occ->lock);
+	tmp_client = occ->client;
+	occ->client = NULL;
+	occ_drv_release(tmp_client);
+	spin_unlock_irq(&occ->lock);
+}
+
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
 	int rc, error;
-	struct occ_client *client;
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
 
-	client = occ_drv_open(p9_sbe_occ->sbe, 0);
-	if (!client) {
+	spin_lock_irq(&p9_sbe_occ->lock);
+	if (p9_sbe_occ->sbe)
+		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	spin_unlock_irq(&p9_sbe_occ->lock);
+
+	if (!p9_sbe_occ->client) {
 		rc = -ENODEV;
 		goto assign;
 	}
 
-	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
+	rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
 	if (rc < 0)
 		goto err;
 
-	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
 	if (rc < 0)
 		goto err;
 
-	occ_drv_release(client);
+	p9_sbe_occ_close_client(p9_sbe_occ);
 
 	switch (resp->return_status) {
 	case RESP_RETURN_CMD_IN_PRG:
@@ -72,7 +103,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	goto done;
 
 err:
-	occ_drv_release(client);
+	p9_sbe_occ_close_client(p9_sbe_occ);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
 assign:
 	error = rc;
@@ -132,6 +163,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	p9_sbe_occ->sbe = pdev->dev.parent;
 
 	occ = &p9_sbe_occ->occ;
+	spin_lock_init(&p9_sbe_occ->lock);
 	occ->bus_dev = &pdev->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
@@ -152,7 +184,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
 
+	p9_sbe_occ->sbe = NULL;
+	p9_sbe_occ_close_client(p9_sbe_occ);
 	occ_remove_status_attrs(occ);
 
 	atomic_dec(&occ_num_occs);
-- 
1.8.3.1
