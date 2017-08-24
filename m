Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd6wy3VPjzDqm5
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 12:01:54 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7O1x00Z116348
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 22:01:51 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2chm6s4sjd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 22:01:51 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 23 Aug 2017 22:01:49 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 23 Aug 2017 22:01:48 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7O21l5f30081070; Thu, 24 Aug 2017 02:01:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45270B2054;
 Wed, 23 Aug 2017 21:59:12 -0400 (EDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id EC701B204D;
 Wed, 23 Aug 2017 21:59:11 -0400 (EDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: andrew@aj.id.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add optional MTD and UBI
 support to ast-g4 and ast-g5
Date: Wed, 23 Aug 2017 21:01:45 -0500
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1503538442.4231.1.camel@aj.id.au>
References: <1503538442.4231.1.camel@aj.id.au>
X-TM-AS-GCONF: 00
x-cbid: 17082402-0052-0000-0000-000002548F36
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007600; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000224; SDB=6.00906744; UDB=6.00454500; IPR=6.00686945; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016838; XFM=3.00000015;
 UTC=2017-08-24 02:01:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082402-0053-0000-0000-000051C4FE7A
Message-Id: <1503540105-33337-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-23_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708240029
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
X-List-Received-Date: Thu, 24 Aug 2017 02:01:55 -0000

Add MTD and UBI support conditioned to having MTDPARTS_DEFAULT defined.
This allows platforms to enable this support if desired without
adding it by default since it increases the size of u-boot by about 70kB.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 include/configs/ast-g4-ncsi.h | 10 ++++++++++
 include/configs/ast-g4-phy.h  | 10 ++++++++++
 include/configs/ast-g5-ncsi.h | 10 ++++++++++
 include/configs/ast-g5-phy.h  | 10 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/include/configs/ast-g4-ncsi.h b/include/configs/ast-g4-ncsi.h
index 8191dfc..0ba5a43 100644
--- a/include/configs/ast-g4-ncsi.h
+++ b/include/configs/ast-g4-ncsi.h
@@ -26,4 +26,14 @@
 #define CONFIG_CPU_420			1
 #define CONFIG_DRAM_528			1
 
+/* Optional MTD and UBI */
+#ifdef MTDPARTS_DEFAULT
+#define CONFIG_FLASH_CFI_MTD
+#define CONFIG_CMD_UBI
+#define CONFIG_RBTREE
+#define CONFIG_MTD_DEVICE
+#define CONFIG_MTD_PARTITIONS
+#define CONFIG_CMD_MTDPARTS
+#endif
+
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
index baa522f..8b26fa6 100644
--- a/include/configs/ast-g4-phy.h
+++ b/include/configs/ast-g4-phy.h
@@ -28,4 +28,14 @@
 #define CONFIG_CPU_420			1
 #define CONFIG_DRAM_528			1
 
+/* Optional MTD and UBI */
+#ifdef MTDPARTS_DEFAULT
+#define CONFIG_FLASH_CFI_MTD
+#define CONFIG_CMD_UBI
+#define CONFIG_RBTREE
+#define CONFIG_MTD_DEVICE
+#define CONFIG_MTD_PARTITIONS
+#define CONFIG_CMD_MTDPARTS
+#endif
+
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index 12d6684..167835f 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -28,4 +28,14 @@
 
 #define CONFIG_HW_WATCHDOG
 
+/* Optional MTD and UBI */
+#ifdef MTDPARTS_DEFAULT
+#define CONFIG_FLASH_CFI_MTD
+#define CONFIG_CMD_UBI
+#define CONFIG_RBTREE
+#define CONFIG_MTD_DEVICE
+#define CONFIG_MTD_PARTITIONS
+#define CONFIG_CMD_MTDPARTS
+#endif
+
 #endif	/* __AST_G5_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 62ddb84..c3e2552 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -30,4 +30,14 @@
 /* platform.S */
 #define	CONFIG_DRAM_ECC_SIZE		0x10000000
 
+/* Optional MTD and UBI */
+#ifdef MTDPARTS_DEFAULT
+#define CONFIG_FLASH_CFI_MTD
+#define CONFIG_CMD_UBI
+#define CONFIG_RBTREE
+#define CONFIG_MTD_DEVICE
+#define CONFIG_MTD_PARTITIONS
+#define CONFIG_CMD_MTDPARTS
+#endif
+
 #endif	/* __AST_G5_PHY_CONFIG_H */
-- 
1.8.2.2
