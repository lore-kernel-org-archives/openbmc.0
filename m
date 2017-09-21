Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xys9g4lbvzDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 08:44:23 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8LMiI7D138946
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:21 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d4m70xh32-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 18:44:19 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 21 Sep 2017 18:44:08 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Sep 2017 18:44:05 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8LMi5tg29229186; Thu, 21 Sep 2017 22:44:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8DDF2803A;
 Thu, 21 Sep 2017 18:43:58 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 17ABE2803E;
 Thu, 21 Sep 2017 18:43:58 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] drivers/hwmon/occ: Remove repeated ops for
 OCC command in progress
Date: Thu, 21 Sep 2017 17:43:58 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092122-0052-0000-0000-0000026561FB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007775; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920429; UDB=6.00462502; IPR=6.00700651; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017240; XFM=3.00000015;
 UTC=2017-09-21 22:44:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092122-0053-0000-0000-000052158F6E
Message-Id: <1506033838-2078-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210305
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
X-List-Received-Date: Thu, 21 Sep 2017 22:44:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This is now handled in the occ driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/p9_sbe.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 2d50a94..c7e0d9c 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -26,14 +26,10 @@ struct p9_sbe_occ {
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
 	int rc, error;
-	unsigned long start;
 	struct occ_client *client;
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
 
-	start = jiffies;
-
-retry:
 	client = occ_drv_open(p9_sbe_occ->sbe, 0);
 	if (!client) {
 		rc = -ENODEV;
@@ -52,15 +48,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 	switch (resp->return_status) {
 	case RESP_RETURN_CMD_IN_PRG:
-		if (time_after(jiffies,
-			       start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
-			rc = -EALREADY;
-		else {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
-
-			goto retry;
-		}
+		rc = -ETIMEDOUT;
 		break;
 	case RESP_RETURN_SUCCESS:
 		occ_reset_error(occ);
-- 
1.8.3.1
