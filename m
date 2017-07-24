Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGZCs2BH7zDqxD
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 07:25:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6OLOdbT082330
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 17:25:26 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bwpfwdy7d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 17:25:26 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 24 Jul 2017 17:25:25 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 24 Jul 2017 17:25:23 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6OLPMA823527480; Mon, 24 Jul 2017 21:25:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34CEB2803E;
 Mon, 24 Jul 2017 17:25:16 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.3.94])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 299482803F;
 Mon, 24 Jul 2017 17:25:13 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/2] drivers/iio: dps310 Use previous value if
 new reading not available yet
Date: Mon, 24 Jul 2017 16:25:09 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17072421-0052-0000-0000-000002450179
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007419; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00892366; UDB=6.00446018; IPR=6.00672530; 
 BA=6.00005489; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016356; XFM=3.00000015;
 UTC=2017-07-24 21:25:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072421-0053-0000-0000-0000517048DB
Message-Id: <20170724212509.85197-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707240327
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
X-List-Received-Date: Mon, 24 Jul 2017 21:25:29 -0000

In cases where temperature is queried before the latest value is finished
reading then use the previously measured value instead of returning error.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/iio/pressure/dps310.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index f351c26..c7ee99e 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -202,8 +202,8 @@ static int dps310_read_temp(struct dps310_data *data)
 	if (r < 0)
 		return r;
 	if (!(ready & DPS310_TMP_RDY)) {
-		dev_dbg(dev, "temperature not ready\n");
-		return -EAGAIN;
+		dev_dbg(dev, "temperature not ready, use last temp value\n");
+		return 0;
 	}
 
 	r = regmap_bulk_read(regmap, DPS310_TMP_BASE, val, 3);
-- 
1.8.2.2
