Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp9Kp3LrzzDrVk
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 05:21:16 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v87JJTMq118037
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 15:21:15 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cubnrswh8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 15:21:14 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 7 Sep 2017 13:21:14 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 7 Sep 2017 13:21:11 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v87JLAJK63438980; Thu, 7 Sep 2017 12:21:10 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85E2E136048;
 Thu,  7 Sep 2017 13:21:10 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.167])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 9C2D3136046;
 Thu,  7 Sep 2017 13:21:08 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] fsi: core: Remove more spam FSI prints to
 console
Date: Thu,  7 Sep 2017 14:21:03 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17090719-0004-0000-0000-000012E40F9D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007684; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913684; UDB=6.00458600; IPR=6.00693942; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017055; XFM=3.00000015;
 UTC=2017-09-07 19:21:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090719-0005-0000-0000-000084002687
Message-Id: <20170907192103.36929-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709070287
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
X-List-Received-Date: Thu, 07 Sep 2017 19:21:19 -0000

Move the most noisy fsi prints to dev_dbg() to unclutter the console
output.

Example:
[  484.610000]  slave@00:00: status: 0x84000500, sisc: 0x00040108
[  484.610000]  fsi1: can't read slave 00:00 -5

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 0f19bd3..8a17176 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -214,7 +214,7 @@ int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 	if (rc)
 		return rc;
 
-	dev_info(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
+	dev_dbg(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
 			be32_to_cpu(stat), be32_to_cpu(irq));
 
 	/* clear interrupts */
@@ -677,7 +677,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	rc = fsi_master_read(master, link, id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
-		dev_warn(&master->dev, "can't read slave %02x:%02x %d\n",
+		dev_dbg(&master->dev, "can't read slave %02x:%02x %d\n",
 				link, id, rc);
 		return -ENODEV;
 	}
-- 
1.8.2.2
