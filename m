Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5P3CW7zDrJw
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JOf1v087304
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:11 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddtt788vf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:25:08 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:25:05 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:25:03 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JP22X2490722; Thu, 5 Oct 2017 12:25:02 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1ADD13603C;
 Thu,  5 Oct 2017 13:25:02 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 634CD136043;
 Thu,  5 Oct 2017 13:25:02 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 27/31] drivers: fsi: occ: Poll while
 receiving "command in progress"
Date: Thu,  5 Oct 2017 14:24:20 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0012-0000-0000-0000151ACF35
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:25:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0013-0000-0000-00004FC22A79
Message-Id: <1507231464-13635-28-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050269
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:14 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Waiting for OCC to return something other than "command in progress"
should only be done in the worker function, instead of clients repeating
the entire transfer when they receive "command in progress." In this way
clients don't have to check for that return status.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 29a17ed..8555e99 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -23,6 +23,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
@@ -33,6 +34,9 @@
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
 
+#define OCC_TIMEOUT_MS		1000
+#define OCC_CMD_IN_PRG_WAIT_MS	50
+
 struct occ {
 	struct device *sbefifo;
 	char name[32];
@@ -569,6 +573,9 @@ static void occ_worker(struct work_struct *work)
 {
 	int rc = 0, empty, waiting, canceled;
 	u16 resp_data_length;
+	unsigned long start;
+	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
+	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
 	struct occ_xfr *xfr;
 	struct occ_response *resp;
 	struct occ_client *client;
@@ -590,6 +597,8 @@ static void occ_worker(struct work_struct *work)
 	spin_unlock_irq(&occ->list_lock);
 	mutex_lock(&occ->occ_lock);
 
+	start = jiffies;
+
 	/* write occ command */
 	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
 			 xfr->cmd_data_length);
@@ -601,9 +610,21 @@ static void occ_worker(struct work_struct *work)
 		goto done;
 
 	/* read occ response */
-	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
-	if (rc)
-		goto done;
+	do {
+		rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
+		if (rc)
+			goto done;
+
+		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
+			rc = -EALREADY;
+
+			if (time_after(jiffies, start + timeout))
+				break;
+
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(wait_time);
+		}
+	} while (rc);
 
 	resp_data_length = get_unaligned_be16(&resp->data_length);
 	if (resp_data_length > OCC_RESP_DATA_BYTES) {
-- 
1.8.3.1
