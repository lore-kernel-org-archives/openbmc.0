Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHxY90S4DzDqBN
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 07:59:40 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v17KrqVn121863
 for <openbmc@lists.ozlabs.org>; Tue, 7 Feb 2017 15:59:38 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28fkc35pft-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 15:59:38 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 7 Feb 2017 15:59:37 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 7 Feb 2017 15:59:36 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id EE3F138C8039
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 15:59:36 -0500 (EST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v17KxZkc16646552; Tue, 7 Feb 2017 20:59:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E56DD28067;
 Tue,  7 Feb 2017 15:59:35 -0500 (EST)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id A804628060;
 Tue,  7 Feb 2017 15:59:35 -0500 (EST)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] arm: configs: aspeed_g5_defconfig: Add UBI
 support
Date: Tue,  7 Feb 2017 14:59:33 -0600
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020720-0044-0000-0000-0000027F22CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006575; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000202; SDB=6.00818623; UDB=6.00400058; IPR=6.00596083; 
 BA=6.00005123; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014214; XFM=3.00000011;
 UTC=2017-02-07 20:59:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020720-0045-0000-0000-000006AC27FD
Message-Id: <1486501173-46100-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702070199
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
X-List-Received-Date: Tue, 07 Feb 2017 20:59:41 -0000

Add UBI support to aspeed_g5_defocnfig.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index a5c6ddb..19c37ea 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -10,6 +10,7 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+CONFIG_LZO=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_BPF_SYSCALL=y
 # CONFIG_AIO is not set
@@ -59,7 +60,9 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
+CONFIG_MTD_DEVICE=y
 CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_PARTITIONS=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_RAM=y
@@ -167,3 +170,7 @@ CONFIG_DEBUG_SET_MODULE_RONX=y
 # CONFIG_XZ_DEC_POWERPC is not set
 # CONFIG_XZ_DEC_IA64 is not set
 # CONFIG_XZ_DEC_SPARC is not set
+CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_UBI=y
+CONFIG_CMD_UBIFS=y
+CONFIG_RBTREE=y
-- 
1.8.2.2
