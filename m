Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSj6k2cc1zDq60
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 14:10:38 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1M39BJS118936
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 22:10:35 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28rsq9bvg5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 22:10:35 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 20:10:34 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 20:10:32 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 9E5603E40044
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 20:10:31 -0700 (MST)
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1M3AVEs11338046; Tue, 21 Feb 2017 20:10:31 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2566E038;
 Tue, 21 Feb 2017 20:10:31 -0700 (MST)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 4815F6E03A;
 Tue, 21 Feb 2017 20:10:31 -0700 (MST)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3] arm: configs: aspeed: Add UBI support
Date: Tue, 21 Feb 2017 21:10:28 -0600
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CACPK8XdKabfxbMt2NZFZ8ShuKzynDqoyke2QEGTnADGqaw8+Jg@mail.gmail.com>
References: <CACPK8XdKabfxbMt2NZFZ8ShuKzynDqoyke2QEGTnADGqaw8+Jg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022203-0004-0000-0000-000011A74212
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006660; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825297; UDB=6.00404080; IPR=6.00602753; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014383; XFM=3.00000011;
 UTC=2017-02-22 03:10:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022203-0005-0000-0000-00007D45069E
Message-Id: <1487733028-77391-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220032
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
X-List-Received-Date: Wed, 22 Feb 2017 03:10:39 -0000

Add UBI support to aspeed_g4_defconfig and aspeed_g5_defconfig

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 arch/arm/configs/aspeed_g4_defconfig | 3 +++
 arch/arm/configs/aspeed_g5_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 2edad5c..4ba778d 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -60,6 +60,8 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_ASPEED_LPC_CTRL=y
 CONFIG_EEPROM_AT24=y
@@ -133,6 +135,7 @@ CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_UBIFS_FS=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_XZ=y
 CONFIG_PRINTK_TIME=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index a5c6ddb..d02139d 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -62,6 +62,8 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_ASPEED_LPC_CTRL=y
 CONFIG_EEPROM_AT24=y
@@ -136,6 +138,7 @@ CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_UBIFS_FS=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_XZ=y
 CONFIG_PRINTK_TIME=y
-- 
1.8.2.2
