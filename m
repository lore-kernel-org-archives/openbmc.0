Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd8gS1vvnzDrJr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 13:20:20 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7O3JWo5075642
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 23:20:17 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2chh2yhwev-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 23:20:17 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 23 Aug 2017 21:20:16 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 23 Aug 2017 21:20:13 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7O3KD0p64290876; Wed, 23 Aug 2017 20:20:13 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6C578037;
 Wed, 23 Aug 2017 21:20:13 -0600 (MDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id E266978043;
 Wed, 23 Aug 2017 21:20:12 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: andrew@aj.id.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add optional MTD and UBI
 support to ast-common
Date: Wed, 23 Aug 2017 22:20:08 -0500
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1503541899.4231.3.camel@aj.id.au>
References: <1503541899.4231.3.camel@aj.id.au>
X-TM-AS-GCONF: 00
x-cbid: 17082403-0016-0000-0000-0000076939D6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007600; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000224; SDB=6.00906770; UDB=6.00454516; IPR=6.00686970; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016839; XFM=3.00000015;
 UTC=2017-08-24 03:20:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082403-0017-0000-0000-00003B2F2A72
Message-Id: <1503544808-35223-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-24_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708240053
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
X-List-Received-Date: Thu, 24 Aug 2017 03:20:20 -0000

Add MTD and UBI support conditioned to having MTDPARTS_DEFAULT defined.
This allows platforms to enable this support if desired without
adding it by default since it increases the size of u-boot by about 70kB.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 include/configs/ast-common.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 110c780..29551ef 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -84,6 +84,18 @@
 #define CONFIG_SYS_MAXARGS		16
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
 
+/*
+ * Optional MTD and UBI support
+ */
+#ifdef MTDPARTS_DEFAULT
+#define CONFIG_FLASH_CFI_MTD
+#define CONFIG_CMD_UBI
+#define CONFIG_RBTREE
+#define CONFIG_MTD_DEVICE
+#define CONFIG_MTD_PARTITIONS
+#define CONFIG_CMD_MTDPARTS
+#endif
+
 #define CONFIG_BOOTARGS			"console=ttyS4,115200n8 root=/dev/ram rw"
 
 #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
-- 
1.8.2.2
