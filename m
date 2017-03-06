Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcbgC55gdzDq9T
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 10:32:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v26NSlhV131736
 for <openbmc@lists.ozlabs.org>; Mon, 6 Mar 2017 18:32:32 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 291cqw4515-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 18:32:31 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 6 Mar 2017 18:32:31 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 6 Mar 2017 18:32:29 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 1FC1FC90041;
 Mon,  6 Mar 2017 18:32:09 -0500 (EST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v26NWQvT41156622; Mon, 6 Mar 2017 23:32:28 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54E34B2058;
 Mon,  6 Mar 2017 18:32:26 -0500 (EST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.5.17])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 17CD7B204D;
 Mon,  6 Mar 2017 18:32:23 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Reorder hub devices so that parent
 is set before add
Date: Mon,  6 Mar 2017 17:32:19 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030623-0044-0000-0000-000002BB9BED
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006735; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00830946; UDB=6.00407627; IPR=6.00608537; 
 BA=6.00005190; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014533; XFM=3.00000012;
 UTC=2017-03-06 23:32:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030623-0045-0000-0000-000006E9A401
Message-Id: <20170306233219.29789-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-06_23:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703060187
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
X-List-Received-Date: Mon, 06 Mar 2017 23:32:40 -0000

Hub device parent needs to be set before device_add otherwise it
isn't saved.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index b9573c5..bd57b41 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -439,12 +439,12 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			device_initialize(&hub->dev);
 			dev_set_name(&hub->dev, "hub@%02x", slave->master->idx);
 			hub->dev.release = hub_master_release;
+			hub->master.dev = &hub->dev;
+			hub->master.dev->parent = &slave->dev;
 			rc = device_add(&hub->dev);
 			if (rc)
 				return rc;
 
-			hub->master.dev = &hub->dev;
-			hub->master.dev->parent = &slave->dev;
 			hub->base = FSI_HUB_LINK_OFFSET;
 			hub->control_regs = engine_addr;
 			hub->slave = slave;
-- 
1.8.2.2
