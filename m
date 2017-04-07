Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w01HN4kByzDqHq
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 23:52:48 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v37Dmo6X011619
 for <openbmc@lists.ozlabs.org>; Fri, 7 Apr 2017 09:52:43 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29p5rqvjtu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2017 09:52:43 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 7 Apr 2017 07:52:42 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Apr 2017 07:52:39 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v37DqdLA12648932; Fri, 7 Apr 2017 06:52:39 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44319136046;
 Fri,  7 Apr 2017 07:52:39 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 854F3136043;
 Fri,  7 Apr 2017 07:52:37 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/4] drivers/fsi: Look for Hub sourced IRQs
Date: Fri,  7 Apr 2017 08:52:23 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170407135225.20387-1-cbostic@linux.vnet.ibm.com>
References: <20170407135225.20387-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17040713-0004-0000-0000-000011ECB70C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006893; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00844289; UDB=6.00416159; IPR=6.00622587; 
 BA=6.00005275; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014951; XFM=3.00000013;
 UTC=2017-04-07 13:52:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17040713-0005-0000-0000-00007E71BC35
Message-Id: <20170407135225.20387-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704070117
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
X-List-Received-Date: Fri, 07 Apr 2017 13:52:49 -0000

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
