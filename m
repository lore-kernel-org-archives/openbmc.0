Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y5Vt36KFbzDqhf
 for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2017 05:23:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v92IMXeh091217
 for <openbmc@lists.ozlabs.org>; Mon, 2 Oct 2017 14:23:52 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dbtbq0y42-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2017 14:23:52 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 2 Oct 2017 14:23:50 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 2 Oct 2017 14:23:48 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v92INmOs41681136; Mon, 2 Oct 2017 18:23:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86D3228046;
 Mon,  2 Oct 2017 14:23:41 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.7.106])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 2088F2803E;
 Mon,  2 Oct 2017 14:23:38 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@us.ibm.com>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10] fsi: core: Hold hub master reference until
 unregistration complete
Date: Mon,  2 Oct 2017 13:23:40 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17100218-0040-0000-0000-000003ABBAF7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007829; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00925525; UDB=6.00465487; IPR=6.00705724; 
 BA=6.00005616; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017366; XFM=3.00000015;
 UTC=2017-10-02 18:23:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100218-0041-0000-0000-000007A0C910
Message-Id: <20171002182340.75268-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-02_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710020264
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
X-List-Received-Date: Mon, 02 Oct 2017 18:23:56 -0000

From: Christopher Bostic <cbostic@us.ibm.com>

During the hub master unregister process there is a race condition
where its memory can be freed before the entire unregister is
complete.  To prevent this hold a reference until complete.

Code provided by Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 5e4cd31..7faf7d8 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -288,10 +288,20 @@ static int hub_master_probe(struct device *dev)
 	hub_master_init(hub);
 
 	rc = fsi_master_register(&hub->master);
-	if (!rc)
-		return 0;
+	if (rc)
+		goto err_release;
+
+	/*
+	 * At this point, fsi_master_register performs the device_initialize(),
+	 * and holds the sole reference to master.dev. This means the device
+	 * will be freed during any subsequent call to fsi_master_unregister.
+	 * We add our own reference to it here, so we can perform cleanup (in
+	 * _remove()) without it being freed before we're ready.
+	 */
+	get_device(&hub->master.dev);
+
+	return 0;
 
-	kfree(hub);
 err_release:
 	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
@@ -306,6 +316,12 @@ static int hub_master_remove(struct device *dev)
 	fsi_slave_release_range(hub->upstream->slave, hub->addr, hub->size);
 	of_node_put(hub->master.dev.of_node);
 
+	/*
+	 * master.dev will likely be ->release()ed after this, which free()s
+	 * the hub
+	 */
+	put_device(&hub->master.dev);
+
 	return 0;
 }
 
-- 
1.8.2.2
