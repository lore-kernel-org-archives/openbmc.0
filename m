Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3mkr4yH0zDqYf
 for <openbmc@lists.ozlabs.org>; Sat, 30 Sep 2017 08:41:40 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8TMdUom034591
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:38 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d9tj8bvj2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:38 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 29 Sep 2017 16:41:37 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Sep 2017 16:41:36 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8TMfZGU5308698; Fri, 29 Sep 2017 15:41:35 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9127A6A03C;
 Fri, 29 Sep 2017 16:41:35 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.183.77])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id C21616A03B;
 Fri, 29 Sep 2017 16:41:34 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 9/9] drivers: hwmon: occ: Cancel occ
 operations in remove()
Date: Fri, 29 Sep 2017 17:41:08 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092922-0016-0000-0000-00000796D393
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007813; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00924260; UDB=6.00464728; IPR=6.00704398; 
 BA=6.00005613; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017330; XFM=3.00000015;
 UTC=2017-09-29 22:41:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092922-0017-0000-0000-00003BAB191C
Message-Id: <1506724868-13010-10-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709290322
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
X-List-Received-Date: Fri, 29 Sep 2017 22:41:41 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Prevent hanging forever waiting for OCC ops to complete.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/p9_sbe.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index c7e0d9c..ffd6829 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -14,37 +14,53 @@
 #include <linux/platform_device.h>
 #include <linux/occ.h>
 #include <linux/sched.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
+	struct occ_client *client;
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
+	p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	if (!p9_sbe_occ->client) {
 		rc = -ENODEV;
+		spin_unlock_irq(&p9_sbe_occ->lock);
 		goto assign;
 	}
+	spin_unlock_irq(&p9_sbe_occ->lock);
 
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
@@ -72,7 +88,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	goto done;
 
 err:
-	occ_drv_release(client);
+	p9_sbe_occ_close_client(p9_sbe_occ);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
 assign:
 	error = rc;
@@ -132,6 +148,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	p9_sbe_occ->sbe = pdev->dev.parent;
 
 	occ = &p9_sbe_occ->occ;
+	spin_lock_init(&p9_sbe_occ->lock);
 	occ->bus_dev = &pdev->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
@@ -152,7 +169,9 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
 
+	p9_sbe_occ_close_client(p9_sbe_occ);
 	occ_remove_status_attrs(occ);
 
 	atomic_dec(&occ_num_occs);
-- 
1.8.3.1
