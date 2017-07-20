Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCzhZ4LKGzDrFh
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 02:22:54 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6KGMpVq111710
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 12:22:52 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2btwf8qynv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 12:22:52 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Thu, 20 Jul 2017 10:22:51 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 20 Jul 2017 10:22:48 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6KGMm5g48562358; Thu, 20 Jul 2017 09:22:48 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1080C136040;
 Thu, 20 Jul 2017 10:22:48 -0600 (MDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D316D13603A;
 Thu, 20 Jul 2017 10:22:47 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] arm: configs: aspeed_g5_defconfig: Enable Automount
Date: Thu, 20 Jul 2017 11:22:45 -0500
X-Mailer: git-send-email 2.5.0
X-TM-AS-GCONF: 00
x-cbid: 17072016-0016-0000-0000-00000736DDEB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007393; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00890355; UDB=6.00444826; IPR=6.00670522; 
 BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016299; XFM=3.00000015;
 UTC=2017-07-20 16:22:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072016-0017-0000-0000-00003AAC307D
Message-Id: <1500567765-4990-1-git-send-email-anoo@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707200253
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
X-List-Received-Date: Thu, 20 Jul 2017 16:22:55 -0000

Enable CONFIG_AUTOFS4_FS to be able to support systemd
automount units.
This config is already present in the aspeed_g4_defconfig.

Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 1868442..c8bd79e 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -193,6 +193,7 @@ CONFIG_FSI_SBEFIFO=y
 CONFIG_OCCFIFO=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_FANOTIFY=y
+CONFIG_AUTOFS4_FS=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
-- 
1.8.2.2
