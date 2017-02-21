Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1g0JzczDqGV
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:46 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnFR4119331
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:45 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28rshfu9p8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:44 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:43 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:41 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 050273E40041;
 Tue, 21 Feb 2017 14:50:41 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLoepS11469238; Tue, 21 Feb 2017 14:50:40 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D56E16A043;
 Tue, 21 Feb 2017 14:50:40 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id A39A46A03B;
 Tue, 21 Feb 2017 14:50:40 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 5/7] drivers/fsi: Add retry on bus error
 detect
Date: Tue, 21 Feb 2017 15:50:30 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0012-0000-0000-000013B98733
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0013-0000-0000-00004B9E6344
Message-Id: <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 21:50:47 -0000

After each gpio master read/write check for bus errors.  If
errors detected then clean it up and retry the original operation
again.  If second attempt succeeds then don't report original
error to caller.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c        |  4 ++++
 drivers/fsi/fsi-master-gpio.c | 24 ++++++++++++++++++++++--
 drivers/fsi/fsi-master.h      |  3 +++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 360c02a..428675f 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -639,6 +639,10 @@ static int fsi_master_break(struct fsi_master *master, int link)
 	return 0;
 }
 
+void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
+{
+}
+
 static int fsi_master_scan(struct fsi_master *master)
 {
 	int link, slave_id, rc;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 8aec538..5b502eb 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -381,7 +381,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
-	return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
+	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
+	if (rc) {
+		fsi_master_handle_error(&master->master, addr);
+
+		/* Try again */
+		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
+		if (rc)
+			fsi_master_handle_error(&master->master, addr);
+	}
+
+	return rc;
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
@@ -395,7 +405,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
-	return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
+	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
+	if (rc) {
+		fsi_master_handle_error(&master->master, addr);
+
+		/* Try again */
+		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
+		if (rc)
+			fsi_master_handle_error(&master->master, addr);
+	}
+
+	return rc;
 }
 
 /*
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 4a3176b..4ed416c 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -19,6 +19,8 @@
 
 #include <linux/device.h>
 
+#include "fsi-master.h"
+
 /* Control Registers */
 #define FSI_MMODE		0x0		/* R/W: mode */
 #define FSI_MDLYR		0x4		/* R/W: delay */
@@ -85,6 +87,7 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 extern int fsi_master_start_ipoll(struct fsi_master *master);
+extern void fsi_master_handle_error(struct fsi_master *master, uint32_t addr);
 
 /**
  * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
-- 
1.8.2.2
