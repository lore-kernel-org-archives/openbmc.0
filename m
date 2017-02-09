Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vK8X11gyBzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 07:17:52 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v19KDl34096757
 for <openbmc@lists.ozlabs.org>; Thu, 9 Feb 2017 15:17:50 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28gp6fsn46-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 15:17:50 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Feb 2017 15:17:49 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Feb 2017 15:17:47 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 3F1C038C8041;
 Thu,  9 Feb 2017 15:17:48 -0500 (EST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v19KHllX19267912; Thu, 9 Feb 2017 20:17:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CD972803D;
 Thu,  9 Feb 2017 15:17:47 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.200])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 1B18528048;
 Thu,  9 Feb 2017 15:17:44 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Adjust slave ID based on address
Date: Thu,  9 Feb 2017 14:17:37 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020920-0056-0000-0000-000002B89252
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006586; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819569; UDB=6.00400625; IPR=6.00597022; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014238; XFM=3.00000011;
 UTC=2017-02-09 20:17:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020920-0057-0000-0000-000006EDA305
Message-Id: <20170209201737.74109-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-09_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702090181
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
X-List-Received-Date: Thu, 09 Feb 2017 20:17:53 -0000

In order to access slave address ranges > 0x1FFFFF the slave ID
must be adjusted accordingly in the command encoding:

ID 0: 0x00000000 - 0x001FFFFF
ID 1: 0x00200000 - 0x003FFFFF
ID 2: 0x00400000 - 0x005FFFFF
ID 3: 0x00600000 - 0x007FFFFF

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---

Changes in V2
    - Remove alignment masking as per recommendation of Alistair Popple
      <alistair@popple.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 73d9985..91bdbf2 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -40,6 +40,9 @@
 #define	FSI_GPIO_CMD_DFLT_LEN	28
 #define	FSI_GPIO_CMD_CRC_SHIFT	60
 
+#define	FSI_SLAVE_SHIFT		21
+#define	FSI_SLAVE_MASK		0x3
+
 /* Bus errors */
 #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
 #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
@@ -305,7 +308,8 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
 	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
 	cmd->msg = FSI_GPIO_CMD_DEFAULT;
 	cmd->msg |= mode;
-	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
+	if (!slave)
+		slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
 	cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
 	addr &= FSI_GPIO_CMD_ADDR_MASK;
 	cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
-- 
1.8.2.2
