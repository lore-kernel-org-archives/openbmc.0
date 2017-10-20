Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJXtt6BsWzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 04:32:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9KHU8Vv008860
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 13:32:51 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dqn70131n-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 13:32:51 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 20 Oct 2017 13:32:50 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 20 Oct 2017 13:32:47 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9KHWlMZ38207630; Fri, 20 Oct 2017 17:32:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 432B8B2054;
 Fri, 20 Oct 2017 13:30:02 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.85.90.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 6A55DB204E;
 Fri, 20 Oct 2017 13:29:58 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jk@ozlabs.org, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] fsi: core: Allow more BREAKs to recover a
 failing link
Date: Fri, 20 Oct 2017 12:32:37 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17102017-0008-0000-0000-00000293A5B3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007925; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00933950; UDB=6.00470464; IPR=6.00714238; 
 BA=6.00005651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017629; XFM=3.00000015;
 UTC=2017-10-20 17:32:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102017-0009-0000-0000-000037117CD7
Message-Id: <20171020173237.76535-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710200244
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
X-List-Received-Date: Fri, 20 Oct 2017 17:32:56 -0000

Recovering a failing FSI link can require more than a single
BREAK command to reset the FSI slave. Test results indicate
that communications can be restored when a second or third
BREAK is sent when the previous attempts fail. Additionally,
even if a BREAK succeeds during error recovery process the FSI
slave may flag following access errors to SMODE, SISC, or SSTAT.
Repeated BREAKs will get the slave out of this fail mode.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8a17176..f3dd7f6 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -85,6 +85,7 @@ struct fsi_slave {
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 static const int slave_retries = 2;
+static const int break_retries = 5;
 static int discard_errors;
 
 static int fsi_master_read(struct fsi_master *master, int link,
@@ -228,7 +229,7 @@ int fsi_slave_handle_error(struct fsi_slave *slave, bool write, uint32_t addr,
 		size_t size)
 {
 	struct fsi_master *master = slave->master;
-	int rc, link;
+	int rc, link, i;
 	uint32_t reg;
 	uint8_t id;
 
@@ -262,15 +263,25 @@ int fsi_slave_handle_error(struct fsi_slave *slave, bool write, uint32_t addr,
 	}
 
 	/* getting serious, reset the slave via BREAK */
-	rc = fsi_master_break(master, link);
-	if (rc)
-		return rc;
+	for (i = 0; i < break_retries; i++) {
 
-	rc = fsi_slave_set_smode(master, link, id);
-	if (rc)
-		return rc;
+		dev_dbg(&slave->dev, "recovery break attempt %d of %d max", i+1,
+			break_retries);
+
+		rc = fsi_master_break(master, link);
+		if (rc)
+			continue;
 
-	return fsi_slave_report_and_clear_errors(slave);
+		rc = fsi_slave_set_smode(master, link, id);
+		if (rc)
+			continue;
+
+		rc = fsi_slave_report_and_clear_errors(slave);
+		if (!rc)
+			break;
+	}
+
+	return rc;
 }
 
 int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
-- 
1.8.2.2
