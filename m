Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMt7807FLzDqKs
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 07:39:31 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v49LYOZv005890
 for <openbmc@lists.ozlabs.org>; Tue, 9 May 2017 17:39:17 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2aba6pfr4m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 17:39:17 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 9 May 2017 17:39:16 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 May 2017 17:39:14 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v49LdF0P43909358; Tue, 9 May 2017 21:39:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 146E1124037;
 Tue,  9 May 2017 17:39:09 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id AEA96124044;
 Tue,  9 May 2017 17:39:08 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Eddie James <eajames@us.ibm.com>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 7/7] drivers/fsi: Fix one and two byte bus
 reads/writes
Date: Tue,  9 May 2017 16:39:02 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050921-0024-0000-0000-00000268D056
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00858366; UDB=6.00425300; IPR=6.00637831; 
 BA=6.00005339; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015382; XFM=3.00000015;
 UTC=2017-05-09 21:39:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050921-0025-0000-0000-000043EF64E9
Message-Id: <20170509213902.37939-8-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-09_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705090123
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
X-List-Received-Date: Tue, 09 May 2017 21:39:32 -0000

From: Eddie James <eajames@us.ibm.com>

Address checker fixed to allow one and two byte reads/writes.
Address alignments for each size verified.

Signed-off-by: Edward James <eajames@us.ibm.com>
Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 809a3c4..2a65aa6 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -699,10 +699,13 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 /* FSI master support */
 static int fsi_check_access(uint32_t addr, size_t size)
 {
-	if (size != 1 && size != 2 && size != 4)
-		return -EINVAL;
-
-	if ((addr & 0x3) != (size & 0x3))
+	if (size == 4) {
+		if (addr & 0x3)
+			return -EINVAL;
+	} else if (size == 2) {
+		if (addr & 0x1)
+			return -EINVAL;
+	} else if (size != 1)
 		return -EINVAL;
 
 	return 0;
-- 
1.8.2.2
