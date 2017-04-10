Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w23DQ5h0xzDq5j
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 07:27:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3ALNSDX035446
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:09 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29rh459te2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:09 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 17:27:08 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 17:27:06 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3ALR5vI46071862; Mon, 10 Apr 2017 21:27:05 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B565512403D;
 Mon, 10 Apr 2017 17:27:00 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 69FC6124044;
 Mon, 10 Apr 2017 17:26:57 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 2/4] drivers/fsi: Look for Hub sourced IRQs
Date: Mon, 10 Apr 2017 16:26:49 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
References: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041021-0056-0000-0000-0000033674AC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006913; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845723; UDB=6.00417077; IPR=6.00624157; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014997; XFM=3.00000013;
 UTC=2017-04-10 21:27:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041021-0057-0000-0000-0000076C7BED
Message-Id: <20170410212651.65499-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100170
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
X-List-Received-Date: Mon, 10 Apr 2017 21:27:19 -0000

In addition to looking for local device IRQs on the slave also
check if the IRQ came from a hub source in the interrupt handler.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 36dde94..45e1171 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -98,6 +98,11 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 #define FSI_SI1S		0x1C	/* R: IRQ status */
 
 /*
+ * SI1S, SI1M fields
+ */
+#define FSI_SI1_HUB_SRC		0x00100000	/* hub IRQ source */
+
+/*
  * SMODE fields
  */
 #define	FSI_SMODE_WSC		0x80000000	/* Warm start done */
@@ -793,6 +798,13 @@ static int __fsi_dev_irq(struct device *dev, void *data)
 		return 1;
 	}
 
+	if (!(*si1s & FSI_SI1_HUB_SRC)) {
+		dev_dbg(dev, "IRQ not from a hub source\n");
+		return 0;
+	}
+
+	/* TODO: handle hub sourced IRQ */
+
 	return 0;
 }
 
-- 
1.8.2.2
