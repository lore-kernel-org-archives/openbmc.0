Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wnZp6kGJzF3fS
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 03:56:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAFGrxqd078036
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 11:56:47 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2nsbbuvpbc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 11:56:47 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 15 Nov 2018 16:56:46 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 15 Nov 2018 16:56:43 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAFGugkm36044938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Nov 2018 16:56:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14585AE064;
 Thu, 15 Nov 2018 16:56:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABAFBAE05F;
 Thu, 15 Nov 2018 16:56:41 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 15 Nov 2018 16:56:41 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, jk@ozlabs.org
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.ibm.com>
Subject: [PATCH] arm: configs: aspeed: Add USB Mass Storage
Date: Thu, 15 Nov 2018 10:56:36 -0600
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18111516-0068-0000-0000-00000360DD06
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010055; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01117874; UDB=6.00579851; IPR=6.00897981; 
 MB=3.00024180; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-15 16:56:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111516-0069-0000-0000-0000466F6F91
Message-Id: <1542300996-58087-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-15_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=839 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811150148
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 16:56:51 -0000

Add the USB Mass Storage config to aspeed_g5_defconfig.
This will be used to implement Virtual Media on the BMC.

Signed-off-by: Adriana Kobylak <anoo@linux.ibm.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 8c7ea03..3e67b68 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -9,14 +9,13 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+# CONFIG_AIO is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_BPF_SYSCALL=y
-# CONFIG_AIO is not set
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_JUMP_LABEL=y
-CONFIG_GCC_PLUGINS=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_LBDAF is not set
@@ -26,7 +25,6 @@ CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
 # CONFIG_CACHE_L2X0 is not set
 CONFIG_VMSPLIT_2G=y
-CONFIG_AEABI=y
 # CONFIG_CPU_SW_DOMAIN_PAN is not set
 # CONFIG_COMPACTION is not set
 CONFIG_SECCOMP=y
@@ -73,8 +71,8 @@ CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_EZCHIP is not set
 CONFIG_FTGMAC100=y
@@ -140,6 +138,10 @@ CONFIG_USB_DYNAMIC_MINORS=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_MASS_STORAGE=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
-- 
1.8.3.1
