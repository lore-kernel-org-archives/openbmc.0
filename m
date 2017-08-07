Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xR9Rx6877zDqp7
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 07:20:45 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77LIg7M009004
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 17:20:43 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c6wedy1wj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 17:20:43 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 15:20:42 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 15:20:40 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77LKeHd29425664; Mon, 7 Aug 2017 14:20:40 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A59B6E035;
 Mon,  7 Aug 2017 15:20:40 -0600 (MDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id CAC7C6E03A;
 Mon,  7 Aug 2017 15:20:39 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: joel@jms.id.au, raltherr@google.com, maxims@google.com, miltonm@us.ibm.com
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD support to Aspeed
 Flash driver
Date: Mon,  7 Aug 2017 16:20:37 -0500
X-Mailer: git-send-email 2.5.0
X-TM-AS-GCONF: 00
x-cbid: 17080721-0028-0000-0000-000008269ED1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899020; UDB=6.00449948; IPR=6.00679225; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016579; XFM=3.00000015;
 UTC=2017-08-07 21:20:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080721-0029-0000-0000-00003706EE1A
Message-Id: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070352
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
X-List-Received-Date: Mon, 07 Aug 2017 21:20:46 -0000

Add support to the aspeed flash driver to enable the common mtd layer
through CONFIG_FLASH_CFI_MTD.

This enables the flash to be used by u-boot mtd drivers including
the mtdparts and ubi commands.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Acked-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/mach-aspeed/flash.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 9c5ead6..e1e3cf8 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -124,6 +124,22 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
 /* specificspi */
 #define SpecificSPI_N25Q512	0x00000001
 
+#ifdef CONFIG_FLASH_CFI_MTD
+static uint flash_verbose=1;
+void flash_set_verbose(uint v)
+{
+	flash_verbose = v;
+}
+
+unsigned long flash_sector_size(flash_info_t *info, flash_sect_t sect)
+{
+	if (sect != (info->sector_count - 1))
+		return info->start[sect + 1] - info->start[sect];
+	else
+		return info->start[0] + info->size - info->start[sect];
+}
+#endif
+
 /*-----------------------------------------------------------------------*/
 static u32 ast_spi_calculate_divisor(u32 max_speed_hz)
 {
@@ -1372,6 +1388,10 @@ unsigned long flash_init (void)
 		       flash_get_info(CONFIG_ENV_ADDR_REDUND));
 #endif
 
+#ifdef CONFIG_FLASH_CFI_MTD
+	cfi_mtd_init();
+#endif
+
 	return (size);
 }
 
-- 
1.8.2.2
