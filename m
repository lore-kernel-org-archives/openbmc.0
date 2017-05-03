Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJ9Hk1PJLzDqBH
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 06:49:06 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v43KhiPP048099
 for <openbmc@lists.ozlabs.org>; Wed, 3 May 2017 16:48:55 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a79vtvh6p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 16:48:54 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 3 May 2017 16:48:53 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 3 May 2017 16:48:51 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v43KmoSq53084180; Wed, 3 May 2017 20:48:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B385AE034;
 Wed,  3 May 2017 16:48:39 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.1.58])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id D3381AE03C;
 Wed,  3 May 2017 16:48:36 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/fsi: Unscan on master unregister
Date: Wed,  3 May 2017 15:48:41 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17050320-2213-0000-0000-000001ABD76C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007018; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00855818; UDB=6.00423595; IPR=6.00634981; 
 BA=6.00005323; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015287; XFM=3.00000014;
 UTC=2017-05-03 20:48:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050320-2214-0000-0000-000055F53952
Message-Id: <20170503204841.89412-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-03_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705030363
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
X-List-Received-Date: Wed, 03 May 2017 20:49:06 -0000

Need to unscan all devices when a master unregisters to ensure
full cleanup.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a6ed34f..3cca35c 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -829,6 +829,7 @@ void fsi_master_unregister(struct fsi_master *master)
 		master->idx = -1;
 	}
 
+	fsi_master_unscan(master);
 	device_unregister(&master->dev);
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
-- 
1.8.2.2
