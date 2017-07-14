Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x8Kcc19b2zDqg2
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2017 03:36:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6EHYJDn073770
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 13:36:45 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bpmfwr68p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 13:36:45 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 14 Jul 2017 11:36:44 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 14 Jul 2017 11:36:42 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6EHagO762455964; Fri, 14 Jul 2017 10:36:42 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09B2378047;
 Fri, 14 Jul 2017 11:36:42 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id BF81F78051;
 Fri, 14 Jul 2017 11:36:41 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH u-boot] configs/ast: Add redundnant env
Date: Fri, 14 Jul 2017 12:36:40 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17071417-0016-0000-0000-0000072D4611
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007365; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00887529; UDB=6.00443143; IPR=6.00667679; 
 BA=6.00005471; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016226; XFM=3.00000015;
 UTC=2017-07-14 17:36:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071417-0017-0000-0000-00003A95308A
Message-Id: <1500053800-3923-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-14_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707140283
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
X-List-Received-Date: Fri, 14 Jul 2017 17:36:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Configure ast chips to run redundant u-boot environments.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 include/configs/ast-common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 110c780..15e1db4 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -92,9 +92,12 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
 #define CONFIG_ENV_IS_IN_FLASH		1
 #define CONFIG_ENV_ADDR			(AST_FMC_CS0_BASE + 0x60000)
+#define CONFIG_ENV_ADDR_REDUND		(AST_FMC_CS0_BASE + 0x70000)
 
 #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
-#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
+#define CONFIG_ENV_OFFSET_REDUND	0x70000
+#define CONFIG_ENV_SIZE			0x10000	/* Total Size of Environment Sector */
+#define CONFIG_ENV_SIZE_REDUND		0x10000
 
 #define CONFIG_BOOTCOMMAND	\
 	"fdt addr 20080000; " \
-- 
1.8.3.1
