Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT85t5QKdzDqD2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 07:26:26 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MKNwQi068778
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 15:26:24 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28sdfpbtf0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 15:26:24 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 13:26:23 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 13:26:20 -0700
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id C9D8D3E40052;
 Wed, 22 Feb 2017 13:26:19 -0700 (MST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MKQJq322479014; Wed, 22 Feb 2017 20:26:19 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18207B204E;
 Wed, 22 Feb 2017 15:26:18 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id C1A1CB2056;
 Wed, 22 Feb 2017 15:26:17 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v3] drivers/fsi: Initialize slave link field
Date: Wed, 22 Feb 2017 14:26:16 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022220-0012-0000-0000-000013BCFB2B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006664; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825643; UDB=6.00404287; IPR=6.00603098; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014398; XFM=3.00000011;
 UTC=2017-02-22 20:26:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022220-0013-0000-0000-00004BA6F7DB
Message-Id: <20170222202616.28916-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220184
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
X-List-Received-Date: Wed, 22 Feb 2017 20:26:27 -0000

Assign a link number to struct fsi_slave during slave init.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e13774f..bbf5503 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -408,6 +408,7 @@ static int fsi_slave_init(struct fsi_master *master,
 	slave->id = slave_id;
 	slave->dev.parent = master->dev;
 	slave->dev.release = fsi_slave_release;
+	slave->link = link;
 
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
 	rc = device_register(&slave->dev);
-- 
1.8.2.2
