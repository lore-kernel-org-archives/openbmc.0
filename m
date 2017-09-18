Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwzH102DPzDq78
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 07:12:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8IL92rL045091
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 17:12:26 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d2m4mpc1k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 17:12:26 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 18 Sep 2017 15:12:25 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 18 Sep 2017 15:12:23 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8ILCN4t4260096; Mon, 18 Sep 2017 14:12:23 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 376696E038;
 Mon, 18 Sep 2017 15:12:23 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id EB1326E035;
 Mon, 18 Sep 2017 15:12:22 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/hwmon/occ: Switch to non-blocking for
 occ reads
Date: Mon, 18 Sep 2017 16:12:21 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17091821-0012-0000-0000-0000150662B7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007758; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000230; SDB=6.00918959; UDB=6.00461666; IPR=6.00699185; 
 BA=6.00005595; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017199; XFM=3.00000015;
 UTC=2017-09-18 21:12:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17091821-0013-0000-0000-00004F8A1748
Message-Id: <1505769141-1288-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709180296
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
X-List-Received-Date: Mon, 18 Sep 2017 21:12:29 -0000

From: Eddie James <eajames@us.ibm.com>

It's possible for the sbefifo ops to hang entirely if the system goes
down (checkstop, etc), meaning that the occ and occ-hwmon drivers may
hang during remove().

Signed-off-by: Eddie James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/p9_sbe.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 2d50a94..a6aa4d2 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -16,7 +16,10 @@
 #include <linux/sched.h>
 #include <linux/workqueue.h>
 
+#define OCC_CMD_INCOMPLETE_MS		10
+
 struct p9_sbe_occ {
+	bool cancel;
 	struct occ occ;
 	struct device *sbe;
 };
@@ -34,7 +37,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	start = jiffies;
 
 retry:
-	client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	client = occ_drv_open(p9_sbe_occ->sbe, O_NONBLOCK);
 	if (!client) {
 		rc = -ENODEV;
 		goto assign;
@@ -44,9 +47,14 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	if (rc < 0)
 		goto err;
 
-	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
-	if (rc < 0)
-		goto err;
+	do {
+		rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+		if (rc != -EAGAIN)
+			break;
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule_timeout(msecs_to_jiffies(OCC_CMD_INCOMPLETE_MS));
+	} while (!p9_sbe_occ->cancel);
 
 	occ_drv_release(client);
 
@@ -164,6 +172,9 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	p9_sbe_occ->cancel = true;
 
 	occ_remove_status_attrs(occ);
 
-- 
1.8.3.1
