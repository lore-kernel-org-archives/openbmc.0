Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPTtZ5blpzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 08:33:58 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GLXf0w005866
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:33:55 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28ndpj9802-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:33:55 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 14:33:54 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 14:33:53 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 042B31FF0021
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:33:30 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GLXqw211207166; Thu, 16 Feb 2017 14:33:52 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52FD578038;
 Thu, 16 Feb 2017 14:33:52 -0700 (MST)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 27DB57804D;
 Thu, 16 Feb 2017 14:33:52 -0700 (MST)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] arm: configs: aspeed: Add UBI support
Date: Thu, 16 Feb 2017 15:33:49 -0600
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4B1B4C78-9D2F-4631-BBF1-526BC6F47E6C@fuzziesquirrel.com>
References: <4B1B4C78-9D2F-4631-BBF1-526BC6F47E6C@fuzziesquirrel.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021621-0020-0000-0000-00000B660EE4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822939; UDB=6.00402650; IPR=6.00600385; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014312; XFM=3.00000011;
 UTC=2017-02-16 21:33:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021621-0021-0000-0000-00005A2E48F0
Message-Id: <1487280829-23509-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160201
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
X-List-Received-Date: Thu, 16 Feb 2017 21:33:59 -0000

Add UBI support to aspeed_g4_defconfig and aspeed_g5_defconfig

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 arch/arm/configs/aspeed_g4_defconfig | 7 +++++++
 arch/arm/configs/aspeed_g5_defconfig | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 2edad5c..fdc331a 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -10,6 +10,7 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+CONFIG_LZO=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_BPF_SYSCALL=y
 # CONFIG_AIO is not set
@@ -57,7 +58,9 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
+CONFIG_MTD_DEVICE=y
 CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_PARTITIONS=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_RAM=y
@@ -163,3 +166,7 @@ CONFIG_DEBUG_SET_MODULE_RONX=y
 # CONFIG_XZ_DEC_POWERPC is not set
 # CONFIG_XZ_DEC_IA64 is not set
 # CONFIG_XZ_DEC_SPARC is not set
+CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_UBI=y
+CONFIG_CMD_UBIFS=y
+CONFIG_RBTREE=y
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
