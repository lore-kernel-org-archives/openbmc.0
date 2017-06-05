Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whPS45FmTzDqGr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 05:06:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v55J3m17004504
 for <openbmc@lists.ozlabs.org>; Mon, 5 Jun 2017 15:06:22 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2awcjx1c84-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 15:06:22 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 5 Jun 2017 13:06:21 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Jun 2017 13:06:19 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v55J6Jai16908776; Mon, 5 Jun 2017 12:06:19 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24BE178051;
 Mon,  5 Jun 2017 13:06:19 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id D710278038;
 Mon,  5 Jun 2017 13:06:18 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers: hwmon: occ: Fix Kconfig
Date: Mon,  5 Jun 2017 14:06:17 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17060519-0028-0000-0000-000007BDF8D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007178; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00870596; UDB=6.00432915; IPR=6.00650577; 
 BA=6.00005398; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015711; XFM=3.00000015;
 UTC=2017-06-05 19:06:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060519-0029-0000-0000-000036146477
Message-Id: <1496689577-18435-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-05_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706050361
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
X-List-Received-Date: Mon, 05 Jun 2017 19:06:29 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The OCC hwmon driver was not buildable in-tree.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index 34488de..d845174 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -2,7 +2,9 @@
 # On-Chip Controller configuration
 #
 
-menuconfig SENSORS_OCC
+menu "OCC"
+
+config SENSORS_OCC
 	tristate "POWER On-Chip Controller"
 	help
 	  If you say yes here you get support for monitoring the IBM POWER
@@ -15,10 +17,12 @@ if SENSORS_OCC
 
 config SENSORS_OCC_P9_SBE
 	bool "POWER9 OCC via SBE"
-	depends on SBEFIFO_OCC
+	depends on OCCFIFO
 	help
 	  If you say yes here you get support for monitoring the POWER9
 	  processor sensors via the OCC, from a service processor, over SBE
 	  engine on FSI bus.
 
 endif
+
+endmenu
-- 
1.8.3.1
