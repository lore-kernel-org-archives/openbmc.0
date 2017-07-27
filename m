Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJLJ55Z4rzDrLL
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 04:35:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6RIY8Kv108120
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 14:35:14 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2byjfugs0c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 14:35:14 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 27 Jul 2017 14:35:13 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 27 Jul 2017 14:35:11 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6RIZA5f26542092; Thu, 27 Jul 2017 18:35:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F931B204D;
 Thu, 27 Jul 2017 14:32:39 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id AFF5EB2052;
 Thu, 27 Jul 2017 14:32:38 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
Date: Thu, 27 Jul 2017 13:35:08 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17072718-0008-0000-0000-0000026599FC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007436; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893749; UDB=6.00446848; IPR=6.00673909; 
 BA=6.00005495; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016411; XFM=3.00000015;
 UTC=2017-07-27 18:35:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072718-0009-0000-0000-0000362CFA50
Message-Id: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707270289
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
X-List-Received-Date: Thu, 27 Jul 2017 18:35:19 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Scanning during master registration is problematic because the gpio fsi
master will be registered during boot if it is present in device-tree
(it's a platform device). That means that the whole fsi scan occurs
during boot, which can cause problems.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-core.c       | 2 --
 drivers/fsi/fsi-master-hub.c | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9b83f1a..348ed45 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -927,8 +927,6 @@ int fsi_master_register(struct fsi_master *master)
 		return rc;
 	}
 
-	fsi_master_scan(master);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 3223a67..b5bb064 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -288,8 +288,10 @@ static int hub_master_probe(struct device *dev)
 	hub_master_init(hub);
 
 	rc = fsi_master_register(&hub->master);
-	if (!rc)
+	if (!rc) {
+		fsi_master_rescan(&hub->master);
 		return 0;
+	}
 
 	kfree(hub);
 err_release:
-- 
1.8.3.1
