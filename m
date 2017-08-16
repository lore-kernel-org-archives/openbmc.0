Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXCTD26hGzDqgD
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 12:09:20 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7G28k6j102773
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 22:09:17 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cc6f8q7qj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 22:09:17 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 15 Aug 2017 20:09:16 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Aug 2017 20:09:13 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7G29Du365732622; Tue, 15 Aug 2017 19:09:13 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07B0CC603E;
 Tue, 15 Aug 2017 20:09:13 -0600 (MDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id AAEAEC6037;
 Tue, 15 Aug 2017 20:09:12 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: joel@jms.id.au, raltherr@google.com, maxims@google.com, miltonm@us.ibm.com
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD and UBI support to
 ast-g5
Date: Tue, 15 Aug 2017 21:09:10 -0500
X-Mailer: git-send-email 2.5.0
X-TM-AS-GCONF: 00
x-cbid: 17081602-0020-0000-0000-00000C8B5841
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007552; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000221; SDB=6.00902927; UDB=6.00452269; IPR=6.00683143; 
 BA=6.00005534; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016713; XFM=3.00000015;
 UTC=2017-08-16 02:09:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081602-0021-0000-0000-00005DB77D4B
Message-Id: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-15_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708160034
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
X-List-Received-Date: Wed, 16 Aug 2017 02:09:20 -0000

Add MTD and UBI support to the default g5 include, conditioned to
having MTDPARTS_DEFAULT defined.

This allows platforms to enable this support if desired without
adding it by default since it increases the size of u-boot.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 include/configs/ast-g5-ncsi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index 12d6684..b126e6e 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -28,4 +28,14 @@
 
 #define CONFIG_HW_WATCHDOG
 
+/* MTD and UBI */
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
-- 
1.8.2.2
