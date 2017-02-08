Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJcws5bRmzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 10:34:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v18NXgSo017059
 for <openbmc@lists.ozlabs.org>; Wed, 8 Feb 2017 18:34:03 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28g0fk0hy3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 18:34:03 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 8 Feb 2017 16:34:02 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Feb 2017 16:33:59 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 2896F19D803F;
 Wed,  8 Feb 2017 16:33:12 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v18NXwpL10617298; Wed, 8 Feb 2017 16:33:58 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6740CC6043;
 Wed,  8 Feb 2017 16:33:58 -0700 (MST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.203.157])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id A01A7C603E;
 Wed,  8 Feb 2017 16:33:56 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Adjust slave ID based on address
 in command send
Date: Wed,  8 Feb 2017 17:33:50 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020823-0004-0000-0000-0000118593AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006581; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819154; UDB=6.00400376; IPR=6.00596613; 
 BA=6.00005127; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014226; XFM=3.00000011;
 UTC=2017-02-08 23:34:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020823-0005-0000-0000-00007CE59CBF
Message-Id: <20170208233350.56069-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-08_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702080224
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:06 -0000

In order to access slave address ranges > 0x1FFFFF the slave ID
must be adjusted accordingly in the command encoding:

ID 0: 0x00000000 - 0x001FFFFF
ID 1: 0x00200000 - 0x003FFFFF
ID 2: 0x00400000 - 0x005FFFFF
ID 3: 0x00600000 - 0x007FFFFF

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 73d9985..428f3db 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -30,7 +30,9 @@
 #define	FSI_GPIO_CMD_READ	0x0400000000000000ULL
 #define	FSI_GPIO_CMD_SLAVE_MASK	0xC000000000000000ULL
 #define	FSI_GPIO_CMD_ADDR_SHIFT	37
-#define	FSI_GPIO_CMD_ADDR_MASK	0x001FFFFF
+#define	FSI_GPIO_CMD_ADR8_MASK	0x001FFFFF
+#define	FSI_GPIO_CMD_ADR16_MASK	0x001FFFFE
+#define	FSI_GPIO_CMD_ADR32_MASK	0x001FFFFC
 #define	FSI_GPIO_CMD_SLV_SHIFT	62
 #define	FSI_GPIO_CMD_SIZE_16	0x0000001000000000ULL
 #define	FSI_GPIO_CMD_SIZE_32	0x0000003000000000ULL
@@ -40,6 +42,9 @@
 #define	FSI_GPIO_CMD_DFLT_LEN	28
 #define	FSI_GPIO_CMD_CRC_SHIFT	60
 
+#define	FSI_SLAVE_SHIFT		21
+#define	FSI_SLAVE_MASK		0x3
+
 /* Bus errors */
 #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
 #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
@@ -301,15 +306,17 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
 		const void *data)
 {
 	uint8_t crc;
+	uint32_t addr_mask;
 
 	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
 	cmd->msg = FSI_GPIO_CMD_DEFAULT;
 	cmd->msg |= mode;
-	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
+	if (!slave)
+		slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
 	cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
-	addr &= FSI_GPIO_CMD_ADDR_MASK;
-	cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
+
 	if (size == sizeof(uint8_t)) {
+		addr_mask = FSI_GPIO_CMD_ADR8_MASK;
 		if (data) {
 			uint8_t cmd_data = *((uint8_t *)data);
 
@@ -317,6 +324,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
 				((uint64_t)cmd_data) << FSI_GPIO_CMD_DT8_SHIFT;
 		}
 	} else if (size == sizeof(uint16_t)) {
+		addr_mask = FSI_GPIO_CMD_ADR16_MASK;
 		cmd->msg |= FSI_GPIO_CMD_SIZE_16;
 		if (data) {
 			uint16_t cmd_data;
@@ -326,6 +334,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
 				((uint64_t)cmd_data) << FSI_GPIO_CMD_DT16_SHIFT;
 		}
 	} else {
+		addr_mask = FSI_GPIO_CMD_ADR32_MASK;
 		cmd->msg |= FSI_GPIO_CMD_SIZE_32;
 		if (data) {
 			uint32_t cmd_data;
@@ -336,6 +345,9 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
 		}
 	}
 
+	addr &= addr_mask;
+	cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
+
 	if (mode == FSI_GPIO_CMD_WRITE)
 		cmd->bits += (8 * size);
 
-- 
1.8.2.2
