Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1h35fYzDqGl
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnpO1094403
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:46 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ruxymn2w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:46 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:45 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:42 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 584953E40041;
 Tue, 21 Feb 2017 14:50:42 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLogkk10682768; Tue, 21 Feb 2017 14:50:42 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 343776A03D;
 Tue, 21 Feb 2017 14:50:42 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 06C126A042;
 Tue, 21 Feb 2017 14:50:41 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 6/7] drivers/fsi: Cleanup bus errors
Date: Tue, 21 Feb 2017 15:50:31 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0012-0000-0000-000013B9873C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0013-0000-0000-00004B9E634C
Message-Id: <20170221215032.79282-7-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210201
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
X-List-Received-Date: Tue, 21 Feb 2017 21:50:48 -0000

Define the bus error cleanup method for primary and hub links.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---

v2: Change to atomic operation when checking for nested error
    handling.

    Move slave access details out of gpio master and into the
    core.

    Only allow hub link 1 scans to cut down on scan bus errors.
---
 drivers/fsi/fsi-core.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 428675f..b660d33 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/delay.h>
+#include <linux/bitops.h>
 
 #include "fsi-master.h"
 
@@ -42,6 +43,9 @@
 
 #define FSI_PEEK_BASE			0x410
 #define	FSI_SLAVE_BASE			0x800
+#define	FSI_HUB_CONTROL			0x3400
+
+#define	FSI_SLAVE_SMODE_DFLT		0xa0ff0100
 
 #define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
 
@@ -54,6 +58,10 @@
 static const int engine_page_size = 0x400;
 static struct task_struct *master_ipoll;
 static unsigned int fsi_ipoll_period_ms = 100;
+static unsigned long fsi_state;
+
+/* state flags */
+#define	FSI_IN_ERR_CLEANUP		0
 
 static DEFINE_IDA(master_ida);
 
@@ -255,6 +263,10 @@ int hub_master_break(struct fsi_master *master, int linkno)
 	uint32_t break_offset = 0x4; /* hw workaround */
 	uint32_t addr;
 
+	/* config table lists 2 entries per hub link */
+	if (linkno >= (master->n_links / 2))
+		return -ENODEV;
+
 	command = FSI_BREAK;
 	addr = (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
 	return fsi_slave_write(hub->slave, addr + break_offset, &command,
@@ -641,6 +653,28 @@ static int fsi_master_break(struct fsi_master *master, int link)
 
 void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
 {
+	uint32_t smode = FSI_SLAVE_SMODE_DFLT;
+
+	/* Avoid nested error handling */
+	if (test_and_set_bit(FSI_IN_ERR_CLEANUP, &fsi_state))
+		return;
+
+	fsi_master_break(master, 0);
+	udelay(200);
+	master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SMODE, &smode,
+			sizeof(smode));
+	smode = FSI_MRESB_RST_GEN | FSI_MRESB_RST_ERR;
+	master->write(master, 0, 0, FSI_HUB_CONTROL + FSI_MRESB0, &smode,
+			sizeof(smode));
+
+	if (addr > FSI_HUB_LINK_OFFSET) {
+		smode = FSI_BREAK;
+		master->write(master, 0, 0, 0x100004, &smode, sizeof(smode));
+		smode = FSI_SLAVE_SMODE_DFLT;
+		master->write(master, 0, 0, 0x100800, &smode, sizeof(smode));
+	}
+
+	clear_bit(FSI_IN_ERR_CLEANUP, &fsi_state);
 }
 
 static int fsi_master_scan(struct fsi_master *master)
-- 
1.8.2.2
